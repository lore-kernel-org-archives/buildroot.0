Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9926ACF8549
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 17:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BFF56F4C6;
	Thu, 20 Nov 2025 17:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMZHgH0l-3IJ; Thu, 20 Nov 2025 17:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868326F4D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868326F4D2;
	Thu, 20 Nov 2025 17:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4212637F
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 17:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D42584659
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 17:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuKRu_Nh-dHf for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 17:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447218464A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 447218464A
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 17:05:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 256C4856EE; Thu, 20 Nov 2025 17:05:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 17:03:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 903c0db86e17fc49d5980425fcefd72bcd9ada6b
X-Git-Newrev: 867017e736ac53857685d424f043d16c97ffebfe
X-Patchwork-Hint: ignore
Message-Id: <20251120170540.256C4856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve.py: don't call
 download_nvd
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=867017e736ac53857685d424f043d16c97ffebfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch move the 'download_nvd' call to the 'pkg-stats' script
instead of automatically calling 'read_nvd_dir'.

Since the cve.py file can be used as a library it's up to the caller to
decide whether or not to update the NVD database.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/cve.py    | 6 ++++--
 support/scripts/pkg-stats | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 25481a6367..27a5f2f362 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -144,7 +144,9 @@ class CVE:
         self.nvd_cve = nvd_cve
 
     @staticmethod
-    def download_nvd(nvd_git_dir):
+    def download_nvd(nvd_dir):
+        nvd_git_dir = os.path.join(nvd_dir, "git")
+
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
                 ["git", "pull"],
@@ -177,7 +179,7 @@ class CVE:
         nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
         """
         nvd_git_dir = os.path.join(nvd_dir, "git")
-        CVE.download_nvd(nvd_git_dir)
+
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
             for dirpath, _, filenames in os.walk(os.path.join(nvd_git_dir, f"CVE-{year}")):
                 for filename in filenames:
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ec46d373d5..cfea179458 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -676,6 +676,8 @@ def check_package_cves(nvd_path, packages):
             cpe_product_pkgs[pkg.name].append(pkg)
 
     print(f"Updating NVD database in '{nvd_path}'")
+    cvecheck.CVE.download_nvd(nvd_path)
+
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         check_package_cve_affects(cve, cpe_product_pkgs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
