Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CC4EEB587
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 10:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6E841806;
	Thu, 12 Sep 2024 10:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs0OUyMo0eKg; Thu, 12 Sep 2024 10:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2737B41815
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2737B41815;
	Thu, 12 Sep 2024 10:40:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319151BF2A1
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 10:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CFB2409F0
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 10:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5F_rDQC2WIG for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 10:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D47F40A63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D47F40A63
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 10:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14F2686FD6; Thu, 12 Sep 2024 10:40:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Sep 2024 12:39:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93b72692c36f8357e867650f4b8fac91dff375f5
X-Git-Newrev: 2cb286c8a22980656673f0f3fa566fbaa57efd64
X-Patchwork-Hint: ignore
Message-Id: <20240912104020.14F2686FD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "scripts/support/cve.py: avoid a
 complete clone of the CVE git repository"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2cb286c8a22980656673f0f3fa566fbaa57efd64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e0ed05cc007eed630dd44b7f129903a76fab6981.

Since this commit has been applied, the update of the NVD data fails:

Checking packages CVEs
Updating from https://github.com/fkie-cad/nvd-json-data-feeds/
Traceback (most recent call last):
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1346, in <module>
    __main__()
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1335, in __main__
    check_package_cves(args.nvd_path, packages)
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 660, in check_package_cves
    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 105, in read_nvd_dir
    CVE.download_nvd(nvd_git_dir)
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 74, in download_nvd
    subprocess.check_call(
  File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['git', 'pull', '--depth', '1']' returned non-zero exit status 128.

Since we couldn't immediately figure out what's going on, let's revert
for now until this get investigated and fixed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index dcb3a63925..e25825581e 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -72,7 +72,7 @@ class CVE:
         print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
-                ["git", "pull", "--depth", "1"],
+                ["git", "pull"],
                 cwd=nvd_git_dir,
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
@@ -82,7 +82,7 @@ class CVE:
             # happily clones into an empty directory.
             os.makedirs(nvd_git_dir)
             subprocess.check_call(
-                ["git", "clone", "--depth", "1", NVD_BASE_URL, nvd_git_dir],
+                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
             )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
