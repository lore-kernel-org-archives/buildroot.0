Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E672E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7AB68486B;
	Fri,  6 Sep 2024 20:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26XmoJ0gHPyy; Fri,  6 Sep 2024 20:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31EA78485D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31EA78485D;
	Fri,  6 Sep 2024 20:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2771BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E34F7408C1
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBe4o0C2HsBF for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17923407AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17923407AA
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1027C86587; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:44:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37801767f68c05500f1d4495b5baac0e7340f7a9
X-Git-Newrev: e0ed05cc007eed630dd44b7f129903a76fab6981
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.1027C86587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] scripts/support/cve.py: avoid a complete
 clone of the CVE git repository
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0ed05cc007eed630dd44b7f129903a76fab6981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just a simple clone and pull with --depth 1 should be enough to parse
the CVE data and generate the pkg-stats report.

From a full clone and a depth-1 clone, and the size delta is 2.9GiB
vs. 2.2GiB.

The download size does change: from 983.55MiB down to 270.78MiB.

It's a net time win too: 2m17s vs 1min7s (on a 100Mbps link).

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e25825581e..dcb3a63925 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -72,7 +72,7 @@ class CVE:
         print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
-                ["git", "pull"],
+                ["git", "pull", "--depth", "1"],
                 cwd=nvd_git_dir,
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
@@ -82,7 +82,7 @@ class CVE:
             # happily clones into an empty directory.
             os.makedirs(nvd_git_dir)
             subprocess.check_call(
-                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
+                ["git", "clone", "--depth", "1", NVD_BASE_URL, nvd_git_dir],
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
             )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
