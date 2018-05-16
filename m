From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 16 May 2018 00:43:28 -0300
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
References: <1525978734-35706-6-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5afba8e06c27d_55f23fde3a09addc27f9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

See below:
 - an important typo to fix;
 - some considerations about verbosity;
 - a possible trivial patch to split from this one;
 - some considerations about performance (to possibly run 2x or 4x faster, iff
   we can make some assumptions about the XML).

I hope other people can give more input about the last three items above.

On Thu, May 10, 2018 at 03:58 PM, Matt Weber wrote:

> support/scripts/pkgstats: add CPE reporting

nit: support/scripts/pkg-stats: add CPE reporting

[snip]
> +    def find_partial(self, cpe_str):
> +        print("CPE: Searching for partial [%s]" % cpe_str)

This ...

> +        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> +            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
> +                return cpe['cpe-23:cpe23-item']['@name']
> +
> +    def find(self, cpe_str):
> +        print("CPE: Searching for [%s]" % cpe_str)

... and this make the script very verbose.

It generates 4000+ lines to stdout when generating the html.
Should we remove it from the final version?
Should we add a -v option for debug?

It seems to me it can be removed.

> +        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> +            if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
> +                return cpe['cpe-23:cpe23-item']['@name']
> +
> +    def get_cpe_no_version(self, cpe):
> +        return "".join(cpe.split(":")[:5])

typo: it should be ":".join...
otherwise no partial is found for any package.

[snip]
>  def __main__():
>      args = parse_args()
>      if args.npackages and args.packages:
> -        print "ERROR: -n and -p are mutually exclusive"
> +        print("ERROR: -n and -p are mutually exclusive")

Ideally this (and similar changes below) should be a separate patch, early in
the series. Since the new patch would be trivial it would potentially be
reviewed/applied quickly. Also it would be less changes to carry/rework if new
iterations (due to other patches) are needed.

But well... this is the only line that would not be touched by this patch, so I
am OK with this.
Maybe others disagree.
Mentioning in the commit would be good, something like "Take the opportunity to
..."

>          sys.exit(1)
>      if args.packages:
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
> +    cpe_dict = CPE()
> +    cpe_dict.get_xml_dict()
> +    if args.cpe_report:
> +        print("Performing Target CPE Report Analysis...")
> +        get_target_cpe_report(args.cpe_report, cpe_dict)
> +    elif args.output:

This is not common in other scripts in the tree. All checks between options are
done at the start of __main__.
But having two different code paths is not common either (in the scripts in the
tree), so it seems to me it makes sense here.
Maybe others disagree.

> +        print("Build package list ...")
> +        packages = get_pkglist(args.npackages, package_list)
> +        print("Getting package make info ...")
> +        package_init_make_info()
> +        print("Getting package details ...")
> +        for pkg in packages:
> +            pkg.set_infra()
> +            pkg.set_license()
> +            pkg.set_hash_info()
> +            pkg.set_patch_count()
> +            pkg.set_check_package_warnings()
> +            pkg.set_current_version()
> +            pkg.set_cpe_info(cpe_dict)
> +        print("Calculate stats")
> +        stats = calculate_stats(packages)
> +        print("Write HTML")
> +        dump_html(packages, stats, args.output)
> +    else:
> +        print("Please provide the -o HTML output file arg")
>  
>  
>  __main__()

About the performance:
17 minutes is not incredibly good but it is not terrible for 2000+ packages.

I created 2 *poorly-tested* patches for comparison purposes only. They seem
(again *poorly-tested*) to produce the same html output as v4 when called
without -c.

series v4 + typo fixed:
17 minutes
series v4 + typo fixed + comparison patch 1:
 8 minutes
series v4 + typo fixed + comparison patch 2:
 4 minutes

I am OK with first having the script functional and later, in another patch,
improving its performance while keeping the same functionality.
Maybe others disagree.
Maybe you like any patch below and find the time to fully test that it really
covers all cases and decide to merge to this one.
Maybe you foresee any use for other fields from the XML. In that case, both
comparison patches would not fit, as they assume we will always only need to
know cpe-23:cpe23-item/@name and that there will be always one, and only one,
cpe-23:cpe23-item/@name per cpe-item. Notice: I did not read the specs for the
CPE dictionary, I looked only to this script.


comparison patch 1:
Can we assume we will only need cpe-23:cpe23-item/@name and pre-process?
----->8-----
+++ b/support/scripts/pkg-stats
@@ -561,3 +561,3 @@ def dump_html(packages, stats, output):
 class CPE:
-    all_cpes = dict()
+    all_cpes = list()
 
@@ -569,4 +569,6 @@ class CPE:
             cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
-            print("CPE: Converting xml manifest to dict...")
-            self.all_cpes = xmltodict.parse(cpe_file)
+            print("CPE: Converting xml manifest to list...")
+            raw_dict = xmltodict.parse(cpe_file)
+            for cpe in raw_dict['cpe-list']['cpe-item']:
+                self.all_cpes.append(cpe['cpe-23:cpe23-item']['@name'])
         except urllib2.HTTPError:
@@ -580,5 +582,5 @@ class CPE:
         print("CPE: Searching for partial [%s]" % cpe_str)
-        for cpe in self.all_cpes['cpe-list']['cpe-item']:
-            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
-                return cpe['cpe-23:cpe23-item']['@name']
+        for cpe in self.all_cpes:
+            if cpe_str in cpe:
+                return cpe
 
@@ -586,5 +588,4 @@ class CPE:
         print("CPE: Searching for [%s]" % cpe_str)
-        for cpe in self.all_cpes['cpe-list']['cpe-item']:
-            if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
-                return cpe['cpe-23:cpe23-item']['@name']
+        if cpe_str in self.all_cpes:
+            return cpe_str
----->8-----


comparison patch 2:
Note: I usually don't parse XML using Python, so I am not sure how future-proof
is the string that includes the namespace. It seems (from google search results)
people invented few hacks to disable namespaces in ElementTree. xmltodict has
process_namespaces disabled by default.
----->8-----
+++ b/support/scripts/pkg-stats
@@ -27,3 +27,3 @@ import sys
 import urllib2
-import xmltodict
+import xml.etree.ElementTree as ET
 import gzip
@@ -561,3 +561,3 @@ def dump_html(packages, stats, output):
 class CPE:
-    all_cpes = dict()
+    all_cpes = None
 
@@ -569,4 +569,5 @@ class CPE:
             cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
-            print("CPE: Converting xml manifest to dict...")
-            self.all_cpes = xmltodict.parse(cpe_file)
+            print("CPE: Converting xml manifest to list...")
+            tree = ET.fromstring(cpe_file)
+            self.all_cpes = [i.get('name') for i in tree.iter('{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item')]
         except urllib2.HTTPError:
@@ -580,5 +581,5 @@ class CPE:
         print("CPE: Searching for partial [%s]" % cpe_str)
-        for cpe in self.all_cpes['cpe-list']['cpe-item']:
-            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
-                return cpe['cpe-23:cpe23-item']['@name']
+        for cpe in self.all_cpes:
+            if cpe.startswith(cpe_str):
+                return cpe
 
@@ -586,5 +587,5 @@ class CPE:
         print("CPE: Searching for [%s]" % cpe_str)
-        for cpe in self.all_cpes['cpe-list']['cpe-item']:
-            if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
-                return cpe['cpe-23:cpe23-item']['@name']
+        for cpe in self.all_cpes:
+            if cpe == cpe_str:
+                return cpe
----->8-----

Regards,
Ricardo
