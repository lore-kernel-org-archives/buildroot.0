Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C73DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5ED160ADD;
	Sun, 18 May 2025 08:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYq6kQVpefdm; Sun, 18 May 2025 08:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A1460A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A1460A9E;
	Sun, 18 May 2025 08:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EA82E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4431660ADD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaY_Nqwjxhfi for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A3660775
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28A3660775
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:53:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17A6586C9A; Sun, 18 May 2025 08:53:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 10:53:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b0662f02a0e779f72a6f3ed5f024c6c065d9aa7
X-Git-Newrev: 56ea5a02268631f2ea679c067e9b0ec94e0e512e
X-Patchwork-Hint: ignore
Message-Id: <20250518085328.17A6586C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add support for
 reporting stale CVE entries
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3602010437067170189=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3602010437067170189==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=56ea5a02268631f2ea679c067e9b0ec94e0e512e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NVD database contains some CPEs that are wrongly not associated
with any version number. They are for example sometimes associated
with very old CVEs.
Those CPEs are annoying, because they pollute our pkg-stat CVE results
with CVE entries which actually don't affect us.

The proper way to solve it is, and should remain, to fix the NVD
database by reporting these issues. Having to deal with a lot of
CVEs/CPEs, the NVD database is however slow to be updated.

To reduce the noise in our pkg-stats results in the meantime, one
possibility is to add <PKG_IGNORE_CVES> entries for those CVEs.  This
however comes with the downside that even once the NVD database gets
fixed, those ignored entries risk remaining in Buildroot forever
because they are undetected.

This commit tries to address this downside by checking for and
reporting CVEs that are ignored in Buildroot, but where the
NVD reports our package version as unaffected. Those CVEs will appear
in the 'CVEs Ignored' column as '(stale)', and the cell will be
colored the same way warnings are. This should allow us to detect and
remove those entries.

It can be tested for example by adding the following variable to the
apache package (for a CVE that was recently fixed in the NVD database):
APACHE_IGNORE_CVES = CVE-1999-0236

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py    |  4 +---
 support/scripts/pkg-stats | 36 ++++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 18fda8e1a1..1cbe24c02d 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -184,13 +184,11 @@ class CVE:
         """The set of CPE products referred by this CVE definition"""
         return set(cpe_product(p['id']) for p in self.each_cpe())
 
-    def affects(self, name, version, cve_ignore_list, cpeid=None):
+    def affects(self, name, version, cpeid=None):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
-        if self.identifier in cve_ignore_list:
-            return self.CVE_DOESNT_AFFECT
 
         pkg_version = distutils.version.LooseVersion(version)
         if not hasattr(pkg_version, "version"):
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 46b12cd992..a0a46aa8cb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -122,6 +122,7 @@ class Package:
         self.cves = list()
         self.ignored_cves = list()
         self.unsure_cves = list()
+        self.stale_cve_ignores = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
         self.status = {}
 
@@ -638,7 +639,18 @@ def check_package_cve_affects(cve, cpe_product_pkgs):
         if product not in cpe_product_pkgs:
             continue
         for pkg in cpe_product_pkgs[product]:
-            cve_status = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid)
+            cve_status = cve.affects(pkg.name, pkg.current_version, pkg.cpeid)
+
+            if cve.identifier in pkg.ignored_cves:
+                if cve_status == cve.CVE_DOESNT_AFFECT:
+                    # We have an ignore entry for a CVE which is
+                    # already reported as 'not affected'. This might
+                    # happen for example when the NVD database doesn't
+                    # initially include version numbers for a CPE, and
+                    # later fixes it. Store it so that we can report
+                    # it.
+                    pkg.stale_cve_ignores.append(cve.identifier)
+                cve_status = cve.CVE_DOESNT_AFFECT
             if cve_status == cve.CVE_AFFECTS:
                 pkg.cves.append(cve.identifier)
             elif cve_status == cve.CVE_UNKNOWN:
@@ -670,6 +682,8 @@ def check_package_cves(nvd_path, packages):
         if 'cve' not in pkg.status:
             if pkg.cves or pkg.unsure_cves:
                 pkg.status['cve'] = ("error", "affected by CVEs")
+            elif pkg.stale_cve_ignores:
+                pkg.status['cve'] = ("warning", "has stale CVE ignores")
             else:
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
 
@@ -712,10 +726,13 @@ def calculate_stats(packages):
         stats["patches"] += pkg.patch_count
         stats["total-cves"] += len(pkg.cves)
         stats["total-unsure-cves"] += len(pkg.unsure_cves)
+        stats["total-stale-cve-ignores"] += len(pkg.stale_cve_ignores)
         if len(pkg.cves) != 0:
             stats["pkg-cves"] += 1
         if len(pkg.unsure_cves) != 0:
             stats["pkg-unsure-cves"] += 1
+        if len(pkg.stale_cve_ignores) != 0:
+            stats["pkg-stale-cve-ignores"] += 1
         if pkg.cpeid:
             stats["cpe-id"] += 1
         else:
@@ -867,7 +884,7 @@ function expandField(fieldId){
  .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
    background: #ff9a69;
  }
- .somepatches, .somewarnings, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
+ .somepatches, .somewarnings, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown, .cve-stale {
    background: #ffd870;
  }
  .cve_ignored, .version-error {
@@ -1080,10 +1097,17 @@ def dump_html_pkg(f, pkg):
     div_class = ["centered data ignored_cves"]
     div_class.append(f'_{pkg_css_class}')
     if pkg.ignored_cves:
-        div_class.append("cve_ignored")
+        if pkg.stale_cve_ignores:
+            div_class.append("cve-stale")
+        else:
+            div_class.append("cve_ignored")
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
     for ignored_cve in pkg.ignored_cves:
-        f.write(f'    <a href="https://security-tracker.debian.org/tracker/{ignored_cve}">{ignored_cve}</a><br/>\n')
+        if ignored_cve in pkg.stale_cve_ignores:
+            f.write(f"""    <a href="https://security-tracker.debian.org/tracker/{ignored_cve}">{ignored_cve}"""
+                    """ <i>(stale)</i></a><br/>\n""")
+        else:
+            f.write(f'    <a href="https://security-tracker.debian.org/tracker/{ignored_cve}">{ignored_cve}</a><br/>\n')
     f.write("  </div>\n")
 
     # CPE ID
@@ -1193,6 +1217,10 @@ def dump_html_stats(f, stats):
             stats["pkg-unsure-cves"])
     f.write('<div class="data">Total number of unsure CVEs affecting all packages</div><div class="data">%s</div>\n' %
             stats["total-unsure-cves"])
+    f.write('<div class="data">Packages with stale CVE ignores</div><div class="data">%s</div>\n' %
+            stats["pkg-stale-cve-ignores"])
+    f.write('<div class="data">Total number of stale CVE ignores affecting all packages</div><div class="data">%s</div>\n' %
+            stats["total-stale-cve-ignores"])
     f.write('<div class="data">Packages with CPE ID</div><div class="data">%s</div>\n' %
             stats["cpe-id"])
     f.write('<div class="data">Packages without CPE ID</div><div class="data">%s</div>\n' %

--===============3602010437067170189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3602010437067170189==--
