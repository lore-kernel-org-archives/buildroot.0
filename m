From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed, 9 May 2018 23:00:54 +0200
Subject: [Buildroot] [PATCH v3 5/6] support/scripts/pkgstat: add target
 CPE reporting
In-Reply-To: <1525725005-41435-6-git-send-email-matthew.weber@rockwellcollins.com>
References: <1525725005-41435-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1525725005-41435-6-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CAPP7BN2tKJ8c8DhyxzUOP3qj2Md7SqPuy_480R+wH+KMSqnhRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

2018-05-07 22:30 GMT+02:00 Matt Weber <matthew.weber@rockwellcollins.com>:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/scripts/pkg-stats | 103 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 86 insertions(+), 17 deletions(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 43f7e8d..144c00c 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -24,9 +24,15 @@ from collections import defaultdict
>  import re
>  import subprocess
>  import sys
> +import urllib2
> +import xmltodict
> +import gzip
> +from StringIO import StringIO
> +import csv
>
>  INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
>
> +CPE_XML_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
>
>  class Package:
>      all_licenses = list()
> @@ -484,6 +490,62 @@ def dump_html(packages, stats, output):
>          dump_gen_info(f)
>          f.write(html_footer)
>
> +class CPE:
> +    all_cpes = dict()
> +
> +    def get_xml_dict(self):
> +        print "CPE: Fetching xml manifest..."
> +        try:
> +            compressed_cpe_file = urllib2.urlopen(CPE_XML_URL)
> +            print "CPE: Unzipping xml manifest..."
> +            cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
> +            print "CPE: Converting xml manifest to dict..."
> +            self.all_cpes = xmltodict.parse(cpe_file)
> +        except urllib2.HTTPError, e:
> +            print "HTTP Error:", e.code, url
> +        except urllib2.URLError, e:
> +            print "URL Error:", e.reason, url
> +
> +    def find_partial(self,cpe_str):
> +        print "CPE: Searching for partial [%s]" % cpe_str
> +        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> +            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
> +                return cpe['cpe-23:cpe23-item']['@name']
> +
> +    def find(self,cpe_str):
> +        print "CPE: Searching for [%s]" % cpe_str
> +        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> +            if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
> +                return cpe['cpe-23:cpe23-item']['@name']
> +
> +def get_target_cpe_report(cpe_report_file, cpe_dict):
> +    report_cpe_exact_match = ""
> +    report_cpe_needing_update = ""
> +    report_cpe_missing = ""
> +
> +    print "CPE: Checking for matches..."
> +    with open(cpe_report_file) as cpe_file:

"with open" will cause an exception if the file does not exist and
Python will print an ugly Traceback before stopping.
Maybe you can add a simple test if the file exists. The reason I found
it was because I made a simple typo when testing it :)

> +        cpe_list = csv.reader(cpe_file)
> +        for cpe in cpe_list:
> +            if "CPE ID" not in cpe[0]:
> +                result = cpe_dict.find(cpe[0])
> +                if not result:
> +                    cpe_no_version = cpe[0].split(":")[0]+":"+cpe[0].split(":")[1]+":"+cpe[0].split(":")[2]+":"+cpe[0].split(":")[3]+":"+cpe[0].split(":")[4]
> +                    result = cpe_dict.find_partial(cpe_no_version)
> +                    if not result:
> +                        report_cpe_missing += cpe[0] + "\n"
> +                    else:
> +                        report_cpe_needing_update += cpe[0] + "\n"
> +                else:
> +                    report_cpe_exact_match += cpe[0] + "\n"
> +    print "CPE: Found EXACT match:"
> +    print report_cpe_exact_match
> +    print "CPE: Found but REQUIRES UPDATE:"
> +    print report_cpe_needing_update
> +    print "CPE: Not found (proposing the following to be added):"
> +    print report_cpe_missing
> +
> +
>
>  def parse_args():
>      parser = argparse.ArgumentParser()
> @@ -493,6 +555,8 @@ def parse_args():
>                          help='Number of packages')
>      parser.add_argument('-p', dest='packages', action='store',
>                          help='List of packages (comma separated)')
> +    parser.add_argument('-c', dest='cpe_report', action='store',
> +                        help='Buildroot CPE Report (csv format)')
>      return parser.parse_args()
>
>
> @@ -505,22 +569,27 @@ def __main__():
>          package_list = args.packages.split(",")
>      else:
>          package_list = None
> -    print "Build package list ..."
> -    packages = get_pkglist(args.npackages, package_list)
> -    print "Getting package make info ..."
> -    package_init_make_info()
> -    print "Getting package details ..."
> -    for pkg in packages:
> -        pkg.set_infra()
> -        pkg.set_license()
> -        pkg.set_hash_info()
> -        pkg.set_patch_count()
> -        pkg.set_check_package_warnings()
> -        pkg.set_current_version()
> -    print "Calculate stats"
> -    stats = calculate_stats(packages)
> -    print "Write HTML"
> -    dump_html(packages, stats, args.output)
> -
> +    if args.cpe_report:
> +        print "Performing Target CPE Report Analysis..."
> +        cpe_dict = CPE()
> +        cpe_dict.get_xml_dict()
> +        get_target_cpe_report(args.cpe_report,cpe_dict)
> +    else:
> +       print "Build package list ..."
> +       packages = get_pkglist(args.npackages, package_list)
> +       print "Getting package make info ..."
> +       package_init_make_info()
> +       print "Getting package details ..."
> +       for pkg in packages:
> +          pkg.set_infra()
> +          pkg.set_license()
> +          pkg.set_hash_info()
> +          pkg.set_patch_count()
> +          pkg.set_check_package_warnings()
> +          pkg.set_current_version()
> +       print "Calculate stats"
> +       stats = calculate_stats(packages)
> +       print "Write HTML"
> +       dump_html(packages, stats, args.output)
>
>  __main__()
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards,
Erik
