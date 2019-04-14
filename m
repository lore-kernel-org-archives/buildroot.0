From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 20:05:34 +0200
Subject: [Buildroot] [PATCH v8 7/9] support/scripts/cpedb.py: new CPE
 XML helper
In-Reply-To: <1552082667-46877-8-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1552082667-46877-8-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <c76da478-276a-55f0-eea9-da4c70b65e99@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/03/2019 23:04, Matt Weber wrote:
> Python class which consumes a NIST CPE XML and provides helper
> functions to access and search the db's data.
> 
>  - Defines the CPE as a object with operations / formats
>  - Processing of CPE dictionary
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> 
> v8
>  - Added support for generation of update xml to maintain the
>    NIST dictionary for any Buildroot package version bumps
>  - Dropped searching of the Config.in files for URLs, instead
>    assuming the first time a package is added to NIST, the xml is
>    manually filled out with reference urls.  Any updates to versions
>    after that will use the proposed autogen xml that mines the URLS
>    from the NIST dict file.
>  - Caching support for a processed dictionary to speed up subsequent
>    runs when testing, as a db doesn't update more then once a day

 Can we split this into three patches:

1. basic CPEDB and cpe-report.
2. Add caching
3. Add XML generation.

 For the cache, it's worth mentioning how much you save be storing the pickled
object rather than the XML.

> 
> v5 -> v7
>  - No change
> 
> v5
> [Ricardo
>  - Fixed typo in join/split of cpe str without version
>  - Removed extra prints as they aren't needed when we have the
>    output reports/stdout
>  - Updated v4 comments about general flake formatting cleanup
>  - Incorporated parts of patch 1/2 suggestions for optimizations
> 
> [Arnout
>  - added pre-processing of cpe values into two sets, one with
>    and one without version
>  - Collectly with Ricardo, decided to move cpe class to this
>    seperate script
> 
> v1 -> v4
>  - No version
> ---
>  support/scripts/cpedb.py | 185 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 support/scripts/cpedb.py
> 
> diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
> new file mode 100644
> index 0000000..0369536
> --- /dev/null
> +++ b/support/scripts/cpedb.py
> @@ -0,0 +1,185 @@
> +import sys
> +import urllib2

 For python3, this should be urllib.request. So:

try:
	import urllib.request as urllib
except ImportError:
	import urllib2 as urllib


> +from collections import OrderedDict
> +import xmltodict

 This is not a standard module, so maybe we should add an exception handler (in
cpe-report) that says which non-standard packages must be installed.

> +import gzip
> +from StringIO import StringIO
> +import os
> +import pickle
> +
> +VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
> +
> +
> +class CPE:

 CPE is a bit too generic. CPEEntry would be better.

> +    cpe_str = None
> +    cpe_str_short = None
> +    cpe_desc = None
> +    cpe_cur_ver = None
> +    titles = {}
> +    references = {}
> +
> +    def __init__(self, cpe_str, titles=None, refs=None):
> +        self.cpe_str = cpe_str
> +        self.cpe_str_short = ":".join(self.cpe_str.split(":")[:6])

 Generating the cpe-2.2 name is actually a little bit more complicated than
that, so I would pass it explicitly in the constructor as cpe_2_2_str (instead
of str_short). Or, to keep it consistent with the database, cpe_name for the 2.2
string, and cpe_23_name for the 2.3 string.

> +        self.titles = titles
> +        self.references = refs
> +        self.cpe_cur_ver = "".join(self.cpe_str.split(":")[5:6])

 This is just

        self.cpe_cur_ver = self.cpe_str.split(":")[5]

> +
> +    def to_dict(self, cpe_str):

 Why pass a cpe_str here? I would expect to convert self to a dict. That way,
most of the below can be removed (after setting cpe_cur_ver to a new version in
the object, of course).

> +        cpe_short_name = ":".join(cpe_str.split(":")[2:6])
> +        cpe_new_ver = "".join(cpe_str.split(":")[5:6])
> +        self.titles[0]['#text'] = self.titles[0]['#text'].replace(self.cpe_cur_ver, cpe_new_ver)
> +        cpe_dict = OrderedDict([
> +            ('cpe-item', OrderedDict([
> +                ('@name', 'cpe:/' + cpe_short_name),
> +                ('title', self.titles),
> +                ('references', OrderedDict([('reference', self.references)])),
> +                ('cpe-23:cpe23-item', OrderedDict([
> +                        ('@name', cpe_str)
> +                ]))
> +            ]))
> +        ])
> +        return cpe_dict
> +
> +
> +class CPEDB:

 They call it the dictionary, so maybe CPEDictionary is better.

> +    all_cpes = dict()
> +    all_cpes_no_version = dict()
> +
> +    def get_xml_dict(self, url):
> +        print("CPE: Setting up NIST dictionary")
> +        # Setup location to save dict and xmls, if it exists, assume we're
> +        # reusing the previous dict
> +        if not os.path.exists("cpe"):

 The cache path should be settable with a command line option. You'll probably
want to share the cache between different buildroot trees.

> +            os.makedirs("cpe")
> +            self.get_new_xml_dict(url)
> +        else:
> +            print("CPE: Loading CACHED dictionary")
> +            cpe_file = open('cpe/.all_cpes.pkl', 'rb')
> +            self.all_cpes = pickle.load(cpe_file)
> +            cpe_file.close()
> +            cpe_file = open('cpe/.all_cpes_no_version.pkl', 'rb')
> +            self.all_cpes_no_version = pickle.load(cpe_file)
> +            cpe_file.close()
> +
> +    def get_new_xml_dict(self, url):
> +        print("CPE: Fetching xml manifest from [" + url + "]")
> +        try:
> +            compressed_cpe_file = urllib2.urlopen(url)
> +            print("CPE: Unzipping xml manifest...")

 I believe this is not correct, the unzipping will only start when you read from
it in the xmltodict.parse() call.

> +            nist_cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()

 Is all this StringIO stuff needed? Why not just

            nist_cpe_file = gzip.GzipFile(fileobj=compressed_cpe_file)

?

> +            print("CPE: Converting xml manifest to dict...")
> +            all_cpedb = xmltodict.parse(nist_cpe_file)

 FYI, this bit takes about 7 seconds on my laptop.

> +
> +            # Cycle through the dict and build two dict to be used for custom
> +            # lookups of partial and complete CPE objects
> +            # The objects are then used to create new proposed XML updates if
> +            # if is determined one is required
> +            for cpe in all_cpedb['cpe-list']['cpe-item']:
> +                cpe_titles = cpe['title']
> +                # There maybe multiple titles or one.  Make sure this is
> +                # always a list
> +                if not isinstance(cpe_titles, (list,)):
> +                    cpe_titles = [cpe_titles]
> +                # Out of the different language titles, select English
> +                for title in cpe_titles:
> +                    if title['@xml:lang'] is 'en-US':
> +                        cpe_titles = [title]

 You'll probably want to break here.

> +                # Some older CPE don't include references, if they do, make
> +                # sure we handle the case of one ref needing to be packed
> +                # in a list
> +                if 'references' in cpe:
> +                    cpe_ref = cpe['references']['reference']
> +                    if not isinstance(cpe_ref, (list,)):
> +                        cpe_ref = [cpe_ref]
> +                    # The reference text has not been consistantly upper case

 To be completely exact: it is NEVER uppercase. A lot of the existing references
are some free text. And AFAICS, the official labels are all title-cased
(Advisory, Version, ...). Where do you get this information that it should be
uppercase?

> +                    # in the NIST dict but they now require it.  So force upper
> +                    # and then check for compliance to a specific tagging
> +                    for ref_href in cpe_ref:
> +                        ref_href['#text'] = ref_href['#text'].upper()
> +                        if ref_href['#text'] not in VALID_REFS:
> +                            ref_href['#text'] = ref_href['#text'] + "-- UPDATE this entry, here are some exmaples and just one word should be used -- " + ' '.join(VALID_REFS)

 I think if a current entry contains some invalid ref, we should just drop it.

 However, IMO any updates like this (dropping invalid refs, uppercasing them,
...) should be done only when the version is updated, not when the CPEDB is created.

 In other words, I think the CPEEntry should get a method create_new_version
that creates a new CPEEntry (or maybe a duck-typed similar class) with the new
version.

> +                cpe_str = cpe['cpe-23:cpe23-item']['@name']
> +                item = CPE(cpe_str, cpe_titles, cpe_ref)
> +                cpe_str_no_version = self.get_cpe_no_version(cpe_str)
> +                # This dict must have a unique key for every CPE version
> +                # which allows matching to the specific obj data of that
> +                # NIST dict entry
> +                self.all_cpes.update({cpe_str: item})
> +                # This dict has one entry for every CPE (w/o version) to allow
> +                # partial match (no valid version) check (the obj is saved and
> +                # used as seed for suggested xml updates. By updating the same
> +                # non-version'd entry, it assumes the last update here is the
> +                # latest version in the NIST dict)
> +                self.all_cpes_no_version.update({cpe_str_no_version: item})
> +
> +        except urllib2.HTTPError:
> +            print("CPE: HTTP Error: %s" % url)
> +            sys.exit(1)
> +        except urllib2.URLError:
> +            print("CPE: URL Error: %s" % url)
> +            sys.exit(1)
> +
> +        print("CPE: Caching dictionary")
> +        cpes_file = open('cpe/.all_cpes.pkl', 'wb')

 I'm a bit afraid of this pickling, because it risks getting inconsistent if you
update this file. Could we put some versioning mechanism in it? Maybe just in
the file name?

> +        pickle.dump(self.all_cpes, cpes_file)
> +        cpes_file.close()
> +        cpes_file = open('cpe/.all_cpes_no_version.pkl', 'wb')
> +        pickle.dump(self.all_cpes_no_version, cpes_file)
> +        cpes_file.close()
> +
> +    def find_partial(self, cpe_str):
> +        cpe_str_no_version = self.get_cpe_no_version(cpe_str)
> +        if cpe_str_no_version in self.all_cpes_no_version:
> +            return cpe_str_no_version

 This will not fly with my idea of defaulting vendor to *...

 Actually, I realize now: if we require setting a full CPE_ID rather than the
vendor, product, version fields, and if it would be part of show-info rather
than cpe-info, then it may be better to leave the CPE_ID empty by default, and
let cpe-report do the lookup. The cpe-report script would then be responsible
for constructing a guessed CPE_ID, and it has more flexibility to do that based
on package name and version. For example, it can try with the package name and
it can try to strip the perl-/python-/... prefix.

 To make that easy, it would be better to make the all_cpes_no_version keyed on
product only instead of keyed on generated CPE string.

> +
> +    def find_partial_obj(self, cpe_str):
> +        cpe_str_no_version = self.get_cpe_no_version(cpe_str)
> +        if cpe_str_no_version in self.all_cpes_no_version:
> +            return self.all_cpes_no_version[cpe_str_no_version]
> +
> +    def find_partial_latest_version(self, cpe_str_partial):
> +        cpe_obj = self.find_partial_obj(cpe_str_partial)
> +        return cpe_obj.cpe_cur_ver
> +
> +    def find(self, cpe_str):
> +        if self.find_partial(cpe_str):
> +            if cpe_str in self.all_cpes:
> +                return cpe_str
> +
> +    def update(self, cpe_str):
> +        to_update = self.find_partial_obj(cpe_str)
> +        xml = self.__gen_xml__(to_update.to_dict(cpe_str))
> +        fp = open(os.path.join('cpe', self.get_cpe_name(cpe_str) + '-' + self.get_cpe_version(cpe_str) + '.xml'), 'w+')
> +        fp.write(xmltodict.unparse(xml, pretty=True))
> +        fp.close()
> +
> +    def get_nvd_url(self, cpe_str):

 This function is not used AFAICS, and probably a few others as well. Please
remove them.

> +        return "https://nvd.nist.gov/products/cpe/search/results?keyword=" + \
> +                urllib2.quote(cpe_str) + \
> +                "&status=FINAL&orderBy=CPEURI&namingFormat=2.3"
> +
> +    def get_cpe_no_version(self, cpe):
> +        return ":".join(cpe.split(":")[:5])
> +
> +    def get_cpe_name(self, cpe_str):
> +        return "".join(cpe_str.split(":")[4])
> +
> +    def get_cpe_version(self, cpe_str):
> +        return "".join(cpe_str.split(":")[5])
> +
> +    def __gen_xml__(self, cpe_list):

 This function is only used internally, right? Then don't give it a dunder name.
dunder names should be reserved for official Python semantics. You can indicate
that it is private by starting it with underscore, so _gen_xml().


 Regards,
 Arnout

> +        list_header = {
> +            "cpe-list": {
> +                "@xmlns:config": "http://scap.nist.gov/schema/configuration/0.1",
> +                "@xmlns": "http://cpe.mitre.org/dictionary/2.0",
> +                "@xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
> +                "@xmlnsscap-core": "http://scap.nist.gov/schema/scap-core/0.3",
> +                "@xmlns:cpe-23": "http://scap.nist.gov/schema/cpe-extension/2.3",
> +                "@xmlns:ns6": "http://scap.nist.gov/schema/scap-core/0.1",
> +                "@xmlns:meta": "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2",
> +                "@xsi:schemaLocation": "http://scap.nist.gov/schema/cpe-extension/2.3 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd http://cpe.mitre.org/dictionary/2.0 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2 https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd http://scap.nist.gov/schema/scap-core/0.3 https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd http://scap.nist.gov/schema/configuration/0.1 https://scap.nist.gov/schema/nvd/configuration_0.1.xsd http://scap.nist.gov/schema/scap-core/0.1 https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"
> +             }
> +        }
> +        list_header['cpe-list'].update(cpe_list)
> +        return list_header
> 
