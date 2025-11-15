Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C40CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B767041548;
	Mon, 17 Nov 2025 20:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIWolJMd-sXj; Mon, 17 Nov 2025 20:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBDFE41530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBDFE41530;
	Mon, 17 Nov 2025 20:08:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1654158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D6D783D7C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QaHJKxxvq3P for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8B883DC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8B883DC6
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78C7681E98; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 17:37:56 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 03b99918de35d3e1644cf4e41e3331991c988c0a
X-Git-Newrev: 33c6d0ff40e39c5b0b41e17fa685c6e26b0a1e71
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.78C7681E98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] support/scripts/cve.py:
 remove print from cve.py library
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33c6d0ff40e39c5b0b41e17fa685c6e26b0a1e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The `support/script/cve.py` file is used as a library. Depending on how
you use this library you might not want to write content to stdout when
calling its function.

This patch move the 'updating' log to the 'pkg-stats' script and write
the alert when LooseVersion doesn't have a version to stderr.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b318dea1712d212270d0a19f206a50d37852130)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve.py    | 3 +--
 support/scripts/pkg-stats | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index ba41762fa0..5ff67585e2 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -69,7 +69,6 @@ class CVE:
 
     @staticmethod
     def download_nvd(nvd_git_dir):
-        print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
                 ["git", "pull"],
@@ -192,7 +191,7 @@ class CVE:
 
         pkg_version = distutils.version.LooseVersion(version)
         if not hasattr(pkg_version, "version"):
-            print("Cannot parse package '%s' version '%s'" % (name, version))
+            print("Cannot parse package '%s' version '%s'" % (name, version), file=sys.stderr)
             pkg_version = None
 
         # if we don't have a cpeid, build one based on name and version
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a0a46aa8cb..8710dda795 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -675,6 +675,7 @@ def check_package_cves(nvd_path, packages):
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
 
+    print(f"Updating NVD database in '{nvd_path}'")
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         check_package_cve_affects(cve, cpe_product_pkgs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
