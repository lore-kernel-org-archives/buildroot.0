From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 03:50:02 +0100
Subject: [Buildroot] [PATCH buildroot-test] utils/daily-mail: implement CVE
 notification
Message-ID: <20200218025002.111059-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit improves the daily-mail script so that it uses the
recently added CVE information in the JSON output of pkg-stats to send
CVE-related notifications to the Buildroot mailing list and to
individual maintainers of Buildroot packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/daily-mail | 65 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 014d034..b03de03 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -80,6 +80,7 @@ class Notification:
         self.defconfig_notifications = defaultdict(list)
         self.runtime_test_notifications = defaultdict(list)
         self.package_version_notification = []
+        self.package_cve_notification = []
 
 
 def get_mklist(basepath):
@@ -219,6 +220,17 @@ def add_outdated_pkg_notification(notifications, package):
         notif.package_version_notification.append(package)
 
 
+def add_cve_pkg_notification(notifications, package):
+    '''
+    Add to the notifications{} dict notifications that are related to
+    package "maintainers".
+    '''
+    for dev in developers:
+        if package['name'] in dev.packages:
+            notif = notifications.setdefault(dev, Notification())
+            notif.package_cve_notification.append(package)
+
+
 def shrink_str(string, length, align='right', fill='...'):
     '''
     Returns the `string` shrinked to fit `length` characters and with `fill`
@@ -339,6 +351,18 @@ def show_outdated(packages, show_orphan=False):
     return contents
 
 
+def show_cves(packages):
+    contents = ''
+    # Header
+    contents += '{:^30} | {:^16} | {:^60}\n'.format('name', 'CVE', 'link')
+    contents += '{0:-^30}-+-{0:-^16}-+-{0:-^60}-\n'.format('')
+    # Actual data
+    for pkg in packages:
+        name = shrink_str(pkg['name'], 30)
+        for cve in pkg['cves']:
+            contents += '{:>30} | {:<16} | {:<60}\n'.format(name, cve, "https://security-tracker.debian.org/tracker/" + cve)
+    return contents
+
 def developers_email(smtp, branches, notifications, datestr, dry_run):
     '''
     Send the e-mails to the individual developers
@@ -409,6 +433,16 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             contents += show_outdated(outdated, show_orphan=show_orphan)
             contents += '\n'
 
+        cves = notif.package_cve_notification
+        if len(cves) != 0:
+            contents += "Packages with CVEs\n"
+            contents += "==================\n\n"
+            contents += textwrap.fill("This is the list of packages for which a known CVE is affecting them, "
+                                      "which means a security vulnerability exists for those packages.")
+            contents += "\n\n"
+            contents += show_cves(cves)
+            contents += "\n"
+
         contents += "-- \n"
         contents += http_baseurl
         if dry_run:
@@ -463,7 +497,7 @@ def global_email_branch_gitlab_result(gitlab_results):
     return contents
 
 
-def global_email(smtp, branches, results, results_by_reason, datestr, overall, outdated_pkgs, gitlab_results, dry_run):
+def global_email(smtp, branches, results, results_by_reason, datestr, overall, outdated_pkgs, cve_pkgs, gitlab_results, dry_run):
     '''
     Send the global e-mail to the mailing list
     '''
@@ -499,6 +533,10 @@ def global_email(smtp, branches, results, results_by_reason, datestr, overall, o
         contents += "Packages having a newer version\n"
         contents += "===============================\n\n"
         contents += show_outdated(outdated_pkgs, show_orphan=True)
+    if cve_pkgs:
+        contents += "Packages having CVEs\n"
+        contents += "====================\n\n"
+        contents += show_cves(cve_pkgs)
     contents += "\n"
     contents += "-- \n"
     contents += http_baseurl
@@ -576,6 +614,17 @@ def get_outdated_pkgs(path):
     return sorted(s, key=lambda pkg: pkg['name'])
 
 
+def get_cve_pkgs(path):
+    with open(path, 'r') as f:
+        stats = json.load(f)
+    s = []
+    for name, pkg in stats['packages'].items():
+        if len(pkg['cves']) == 0:
+            continue
+        s.append({'name': str(name),
+                  'cves': pkg['cves']})
+    return sorted(s, key=lambda pkg: pkg['name'])
+
 def request_paginated_url(pool, url, page_size=100, page_name='page', **request_kwargs):
     '''
     Simple helper to retrieve data from call paginated url.
@@ -735,7 +784,7 @@ def get_gitlab_ci(branches, date, ndays=None, kinds=None):
     return pipelines
 
 
-def calculate_notifications(results, outdated_pkgs, gitlab_results):
+def calculate_notifications(results, outdated_pkgs, cve_pkgs, gitlab_results):
     '''
     Prepare the notifications{} dict for the notifications to individual
     developers, based on architecture developers, package developers,
@@ -753,6 +802,9 @@ def calculate_notifications(results, outdated_pkgs, gitlab_results):
     for pkg in outdated_pkgs:
         add_outdated_pkg_notification(notifications, pkg)
 
+    for pkg in cve_pkgs:
+        add_cve_pkg_notification(notifications, pkg)
+
     for branch, pipelines in gitlab_results.iteritems():
         for pipeline in pipelines:
             for job in pipeline['jobs']:
@@ -772,7 +824,7 @@ def parse_args():
     parser.add_argument('--dest', action='store', nargs='+', choices=['dev', 'global'],
                         help='List of emails type to send (ie. global, dev)')
     parser.add_argument('--data', action='store', nargs='+',
-                        choices=['autobuild', 'outdated', 'defconfig', 'runtime-test'],
+                        choices=['autobuild', 'outdated', 'cve', 'defconfig', 'runtime-test'],
                         help='List of information to add in emails (blank separated)')
     args = parser.parse_args()
     if args.date and not RE_DATE.match(args.date):
@@ -789,7 +841,7 @@ def __main__():
     date_str = date_struct.isoformat()
     branches = args.branches or get_branches()
     email_dest = set(args.dest) if args.dest else {'dev', 'global'}
-    email_data = set(args.data) if args.data else {'autobuild', 'outdated', 'defconfig', 'runtime-test'}
+    email_data = set(args.data) if args.data else {'autobuild', 'outdated', 'cve', 'defconfig', 'runtime-test'}
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
@@ -804,11 +856,12 @@ def __main__():
         results = {}
         results_by_reason = {}
     outdated_pkgs = get_outdated_pkgs(localconfig.pkg_stats) if 'outdated' in email_data else []
+    cve_pkgs = get_cve_pkgs(localconfig.pkg_stats) if 'cve' in email_data else []
     if email_data & {'defconfig', 'runtime-test'}:
         gitlab_ci = get_gitlab_ci(branches, date_struct, kinds=email_data)
     else:
         gitlab_ci = {}
-    notifications = calculate_notifications(results, outdated_pkgs, gitlab_ci)
+    notifications = calculate_notifications(results, outdated_pkgs, cve_pkgs, gitlab_ci)
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
@@ -816,7 +869,7 @@ def __main__():
         developers_email(smtp, branches, notifications, date_str, args.dry_run)
     if 'global' in email_dest:
         global_email(smtp, branches, results, results_by_reason, date_str,
-                     overall_stats, outdated_pkgs, gitlab_ci, args.dry_run)
+                     overall_stats, outdated_pkgs, cve_pkgs, gitlab_ci, args.dry_run)
     smtp.quit()
 
 
-- 
2.24.1
