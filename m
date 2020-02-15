From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 16:49:10 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <20200215124417.236492-2-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 15 Feb 2020 13:44:16 +0100")
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
Message-ID: <87sgjbj1ft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > This commit extends the pkg-stats script to grab information about the
 > CVEs affecting the Buildroot packages.

 > To do so, it downloads the NVD database from
 > https://nvd.nist.gov/vuln/data-feeds in JSON format, and processes the
 > JSON file to determine which of our packages is affected by which
 > CVE. The information is then displayed in both the HTML output and the
 > JSON output of pkg-stats.

 > To use this feature, you have to pass the new --nvd-path option,
 > pointing to a writable directory where pkg-stats will store the NVD
 > database. If the local database is less than 24 hours old, it will not
 > re-download it. If it is more than 24 hours old, it will re-download
 > only the files that have really been updated by upstream NVD.

 > Packages can use the newly introduced <pkg>_IGNORE_CVES variable to
 > tell pkg-stats that some CVEs should be ignored: it can be because a
 > patch we have is fixing the CVE, or because the CVE doesn't apply in
 > our case.

 >> From an implementation point of view:

 >  - A new class CVE implement most of the required functionalities:
 >    - Downloading the yearly NVD files
 >    - Reading and extracting relevant data from these files
 >    - Matching Packages against a CVE

 >  - The statistics are extended with the total number of CVEs, and the
 >    total number of packages that have at least one CVE pending.

 >  - The HTML output is extended with these new details. There are no
 >    changes to the code generating the JSON output because the existing
 >    code is smart enough to automatically expose the new information.

 > This development is a collective effort with Titouan Christophe
 > <titouan.christophe@railnova.eu> and Thomas De Schampheleire
 > <thomas.de_schampheleire@nokia.com>.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 > Changes v1 -> v2 (Titouan):
 >  * Don't extract database files from gzip to json in downloader
 >  * Refactor CVEs traversal and matching in the CVE class
 >  * Simplify the NVD files downloader
 >  * Index the packages by name in a dict for faster CVE matching
 >  * Fix small typos and python idioms

 > Changes v2 -> v3 (Titouan & Thomas DS):
 >  * Force downloading of the nvd file if it doesn't exist locally
 >  * Catch nvd reading errors, and display a message to the user
 >  * Create the directory for nvd files if needed
 > ---
 >  support/scripts/pkg-stats | 159 +++++++++++++++++++++++++++++++++++++-
 >  1 file changed, 158 insertions(+), 1 deletion(-)

 > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
 > index e477828f7b..46c8a66155 100755
 > --- a/support/scripts/pkg-stats
 > +++ b/support/scripts/pkg-stats
 > @@ -26,10 +26,17 @@ import subprocess
 >  import requests  # URL checking
 >  import json
 >  import certifi
 > +import distutils.version
 > +import time
 > +import gzip
 >  from urllib3 import HTTPSConnectionPool
 >  from urllib3.exceptions import HTTPError
 >  from multiprocessing import Pool
 
 > +NVD_START_YEAR = 2002
 > +NVD_JSON_VERSION = "1.0"
 > +NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
 > +
 >  INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 >  URL_RE = re.compile(r"\s*https?://\S*\s*$")
 
 > @@ -47,6 +54,7 @@ class Package:
 >      all_licenses = list()
 >      all_license_files = list()
 >      all_versions = dict()
 > +    all_ignored_cves = dict()
 
 >      def __init__(self, name, path):
 >          self.name = name
 > @@ -61,6 +69,7 @@ class Package:
 >          self.url = None
 >          self.url_status = None
 >          self.url_worker = None
 > +        self.cves = list()
 >          self.latest_version = (RM_API_STATUS_ERROR, None, None)
 
 >      def pkgvar(self):
 > @@ -152,6 +161,12 @@ class Package:
 >                  self.warnings = int(m.group(1))
 >                  return
 
 > +    def is_cve_ignored(self, cve):
 > +        """
 > +        Tells if the CVE is ignored by the package
 > +        """
 > +        return cve in self.all_ignored_cves.get(self.pkgvar(), [])
 > +
 >      def __eq__(self, other):
 >          return self.path == other.path
 
 > @@ -163,6 +178,110 @@ class Package:
 >              (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
 
 
 > +class CVE:
 > +    """An accessor class for CVE Items in NVD files"""
 > +    def __init__(self, nvd_cve):
 > +        """Initialize a CVE from its NVD JSON representation"""
 > +        self.nvd_cve = nvd_cve
 > +
 > +    @staticmethod
 > +    def download_nvd_year(nvd_path, year):
 > +        metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
 > +        path_metaf = os.path.join(nvd_path, metaf)
 > +        jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
 > +        path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
 > +
 > +        # If the database file is less than a day old, we assume the NVD data
 > +        # locally available is recent enough.
 > +        if os.path.exists(path_jsonf_gz) and os.stat(path_jsonf_gz).st_mtime >= time.time() - 86400:
 > +            return path_jsonf_gz
 > +
 > +        # If not, we download the meta file
 > +        url = "%s/%s" % (NVD_BASE_URL, metaf)
 > +        print("Getting %s" % url)
 > +        page_meta = requests.get(url)
 > +        page_meta.raise_for_status()
 > +
 > +        # If the meta file already existed, we compare the existing
 > +        # one with the data newly downloaded. If they are different,
 > +        # we need to re-download the database.
 > +        # If the database does not exist locally, we need to redownload it in
 > +        # any case.
 > +        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_gz):
 > +            meta_known = open(path_metaf, "r").read()
 > +            if page_meta.text == meta_known:
 > +                return path_jsonf_gz
 > +
 > +        # Grab the compressed JSON NVD, and write files to disk
 > +        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
 > +        print("Getting %s" % url)
 > +        page_data = requests.get(url)
 > +        page_data.raise_for_status()

NIT: you called the meta file URL download page_meta, so I changed this
to page_json for consistency.


 > @@ -261,6 +380,10 @@ def package_init_make_info():
 >              pkgvar = pkgvar[:-8]
 >              Package.all_versions[pkgvar] = value
 
 > +        elif pkgvar.endswith("_IGNORE_CVES"):
 > +            pkgvar = pkgvar[:-12]
 > +            Package.all_ignored_cves[pkgvar] = value.split(" ")

Only splitting on space may not work in case we end up with something
like:

# only affects Windows
FOO_IGNORE_CVES += \
    CVE_2020_1234 \
    CVE_2020_1235

So I changed it to value.split().


 > @@ -601,6 +737,17 @@ def dump_html_pkg(f, pkg):
 >      f.write("  <td class=\"%s\">%s</td>\n" %
 >              (" ".join(td_class), url_str))
 
 > +    # CVEs
 > +    td_class = ["centered"]

Maybe we shouldn't add this row when CVE scanning isn't available? I
left it in as it would require passing that info around.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
