Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB76C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1AD83EE5;
	Thu, 18 Aug 2022 06:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1AD83EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnTaBROMBHWw; Thu, 18 Aug 2022 06:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F79B832EB;
	Thu, 18 Aug 2022 06:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F79B832EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B63F31C11A0
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C916113B
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C916113B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zp3Eq2mdi1vz for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C152F60808
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C152F60808
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 41C7A87708; Thu, 18 Aug 2022 06:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 07:52:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: cd3e9622a291ccd81c8777aeb311b46582b9e5c0
X-Git-Newrev: cb69436ef6219657cc0271a75a6e16ccb714a84c
X-Patchwork-Hint: ignore
Message-Id: <20220818060241.41C7A87708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 support/scripts/pkg-stats: tweak infras field when running with -c
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cb69436ef6219657cc0271a75a6e16ccb714a84c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

When we use the statistics output to generate a CVE/CPE customer
report showing whether a product is affected by CVEs, we are primarily
interested in whether they are relevant to the target
system. Currently we cannot see if the package is configured for the
build (infra==host) and/or the target system (infra==target).

Therefore this commit extends the pkg-stats script to leverage the
information available in "make show-info" output to tweak the list of
package infrastructures for each package. Thanks to this commit, the
script now has a more consistent behavior:

 * When pkg-stats is run without -c, i.e without a defined Buildroot
   configuration, it continues to operate as it did, i.e it lists all
   package infrastructures supported by the package (such as autotools
   host+target, or kconfig target, etc.)

 * When pkg-stats is run with -c, i.e with a defined Buildroot
   configuration which defines the list of packages that should be
   considered, then for each package it now lists only the package
   infrastructures used by the package in that current
   configuration. For example if you have a package with a host and
   target variant, but only the host variant is used in your
   configuration, now the pkg-stats output will only say that the host
   variant of this package is used;

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Thomas: pretty much rework the entire implementation and how the
result is presented.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 28973f28acfcee81f2912e7a65dd3704b1d68f6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f67be0063f..7da06096ef 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -92,6 +92,11 @@ class Package:
         self.name = name
         self.path = path
         self.pkg_path = os.path.dirname(path)
+        # Contains a list of tuple (type, infra), such as ("target",
+        # "autotools"). When pkg-stats is run without -c, it contains
+        # the list of all infra/type supported by the package. When
+        # pkg-stats is run with -c, it contains the list of infra/type
+        # used by the current configuration.
         self.infras = None
         self.license = None
         self.has_license = False
@@ -151,10 +156,20 @@ class Package:
             return False
         return True
 
-    def set_infra(self):
+    def set_infra(self, show_info_js):
         """
         Fills in the .infras field
         """
+        # If we're running pkg-stats for a given Buildroot
+        # configuration, keep only the type/infra that applies
+        if show_info_js:
+            keep_host = "host-%s" % self.name in show_info_js
+            keep_target = self.name in show_info_js
+        # Otherwise, keep all
+        else:
+            keep_host = True
+            keep_target = True
+
         self.infras = list()
         with open(os.path.join(brpath, self.path), 'r') as f:
             lines = f.readlines()
@@ -163,9 +178,9 @@ class Package:
                 if not match:
                     continue
                 infra = match.group(1)
-                if infra.startswith("host-"):
+                if infra.startswith("host-") and keep_host:
                     self.infras.append(("host", infra[5:]))
-                else:
+                elif keep_target:
                     self.infras.append(("target", infra))
 
     def set_license(self):
@@ -372,10 +387,9 @@ def get_pkglist(npackages, package_list):
     return packages
 
 
-def get_config_packages():
+def get_show_info_js():
     cmd = ["make", "--no-print-directory", "show-info"]
-    js = json.loads(subprocess.check_output(cmd))
-    return set([v["name"] for v in js.values() if 'name' in v])
+    return json.loads(subprocess.check_output(cmd))
 
 
 def package_init_make_info():
@@ -1175,10 +1189,12 @@ def __main__():
     if args.nvd_path:
         import cve as cvecheck
 
+    show_info_js = None
     if args.packages:
         package_list = args.packages.split(",")
     elif args.configpackages:
-        package_list = get_config_packages()
+        show_info_js = get_show_info_js()
+        package_list = set([v["name"] for v in show_info_js.values() if 'name' in v])
     else:
         package_list = None
     date = datetime.datetime.utcnow()
@@ -1197,7 +1213,7 @@ def __main__():
     package_init_make_info()
     print("Getting package details ...")
     for pkg in packages:
-        pkg.set_infra()
+        pkg.set_infra(show_info_js)
         pkg.set_license()
         pkg.set_hash_info()
         pkg.set_patch_count()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
