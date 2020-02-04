From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 23:56:51 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: add support
 for CVE reporting
In-Reply-To: <20200204215232.666841-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 4 Feb 2020 22:52:30 +0100")
References: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
 <20200204215232.666841-2-thomas.petazzoni@bootlin.com>
Message-ID: <87mu9yvu4s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

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

 > From an implementation point of view:

 >  - The download_nvd() and download_nvd_year() function implement the
 >    NVD database downloading.

 >  - The check_package_cves() function will go through all the CVE
 >    reports of the NVD database, which has one JSON file per year. For
 >    each CVE report it will check if we have a package with the same
 >    name in Buildroot. If we do, then
 >    check_package_cve_version_affected() verifies if the version in
 >    Buildroot is affected by the CVE.

 >  - The statistics are extended with the total number of CVEs, and the
 >    total number of packages that have at least one CVE pending.

 >  - The HTML output is extended with these new details. There are no
 >    changes to the code generating the JSON output because the existing
 >    code is smart enough to automatically expose the new information.

 > This development is a collective effort with Titouan Christophe
 > <titouan.christophe@railnova.eu> and Thomas De Schampheleire
 > <thomas.de_schampheleire@nokia.com>.

Neat!


 > +NVD_START_YEAR = 2002
 > +NVD_JSON_VERSION = "1.0"

Looking at https://nvd.nist.gov/vuln/data-feeds#JSON_FEED I see a 1.1
version instead of 1.0?


 > +def check_package_cves_year(packages, nvd_file):
 > +    cves = json.load(open(nvd_file))
 > +    for cve in cves["CVE_Items"]:
 > +        check_package_cve_filter(packages, cve)
 > +
 > +
 > +def check_package_cves(nvd_path, packages):
 > +    nvd_files = sorted(glob.glob(os.path.join(nvd_path, "nvdcve-%s-*.json" %
 > +                                              NVD_JSON_VERSION)))
 > +    for nvd_file in nvd_files:
 > +        check_package_cves_year(packages, nvd_file)

NIT: It is a bit confusing to swap the argument order between
check_package_cves() and check_packages_cves_year().


 > +def download_nvd_year(nvd_path, year):
 > +    metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
 > +    path_metaf = os.path.join(nvd_path, metaf)
 > +
 > +    # If the meta file is less than a day old, we assume the NVD data
 > +    # locally available is recent enough.
 > +    if os.path.exists(path_metaf) and os.stat(path_metaf).st_mtime >= time.time() - 86400:
 > +        return

This could be swapped around to check for the json file so it doesn't
break if this is stopped between downloading the meta and json file.


 > +    # If not, we download the meta file
 > +    url = "%s/%s" % (NVD_BASE_URL, metaf)
 > +    print("Getting %s" % url)
 > +    r = requests.get(url)
 > +    meta_new = dict(x.strip().split(':', 1) for x in r.text.splitlines())
 > +    if os.path.exists(path_metaf):
 > +        # If the meta file already existed, we compare the existing
 > +        # one with the data newly downloaded. If they are different,
 > +        # we need to re-download the database.
 > +        with open(path_metaf, "r") as f:
 > +            meta_old = dict(x.strip().split(':', 1) for x in f)
 > +        needs_download = meta_new != meta_old

Is there any reason for doing the dict stuff instead of just comparing
the old file with the new one directly? We don't seem to really use the
content of the meta file for anything, right?


 > +    else:
 > +        # If the meta file does not exist locally, of course we need
 > +        # to download the database
 > +        needs_download = True
 > +
 > +    # If we don't need to download the database, bail out
 > +    if not needs_download:
 > +        return
 > +
 > +    # Write the meta file, possibly overwriting the existing one
 > +    with open(path_metaf, "w") as f:
 > +        f.write(r.text)
 > +
 > +    # Grab the compressed JSON NVD database
 > +    jsonf = "nvdcve-%s-%s.json" % (NVD_JSON_VERSION, year)
 > +    jsonf_gz = jsonf + ".gz"
 > +    path_jsonf = os.path.join(nvd_path, jsonf)
 > +    path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
 > +    url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
 > +    print("Getting %s" % url)
 > +    r = requests.get(url)
 > +    with open(path_jsonf_gz, "wb") as f:
 > +        f.write(r.content)
 > +
 > +    # Uncompress and write it
 > +    gz = gzip.GzipFile(path_jsonf_gz)
 > +    with open(path_jsonf, "w") as f:
 > +        f.write(gz.read())

We could also just use gzip.open() to read the .json.gz files later on
and save some disk space by never expanding the files on disk.

If we want to completely get rid of race conditions, we probably need to
write to a temporary file / sync / rename.

-- 
Bye, Peter Korsgaard
