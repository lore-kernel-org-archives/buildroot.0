Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16B4C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7FF540317;
	Sat, 19 Apr 2025 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dj1lC1U6VKAb; Sat, 19 Apr 2025 21:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF2A7404BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF2A7404BD;
	Sat, 19 Apr 2025 21:45:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F43230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D1CF403FE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5TYTVLFsD2K for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46124400CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46124400CE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39E1985D62; Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:42:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19c43de34f86565678206f49796c8500ab187602
X-Git-Newrev: bedc44c073972a70274c103704c58044365ecf96
X-Patchwork-Hint: ignore
Message-Id: <20250419214550.39E1985D62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: weston: fix the weston
 shutdown test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bedc44c073972a70274c103704c58044365ecf96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] "support/testing: improve weston test reliability" moved
out the wait time from the emulator (to run on the test controller).

While doing so, the sleep time which was initially _after_ the
"killall weston" invocation to in stop_weston() was incorrectly
moved before the command invocation. In this state, the test can
succeed on fast host computer running the test. But it will most
likely fail on an average computer.

This commit fixes this issue by moving the sleep time after
the command invocation.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6561a5d773d8e159556e2b911b315e3b5a0b89b1

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_weston.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 2ed59a7f15..43b5240b2d 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -58,8 +58,8 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
 
     def stop_weston(self):
         cmd = "killall weston"
-        time.sleep(3)
         self.assertRunOk(cmd)
+        time.sleep(3)
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
