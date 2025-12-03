Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7297D1BDD4
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CABE405FF;
	Wed,  3 Dec 2025 19:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRnaXcxc0TBe; Wed,  3 Dec 2025 19:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B099B40600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764791796;
	bh=vhvHafEae4/zAfUcoaj4ok5PNREru/p4bm0cVuY1sus=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XddqjC9u6kcHEQ26pCQA4i/AE89TexxbRqB3PAc5jJ5SyNwrmHWn6zXtf6Xjp3FrW
	 YnhG4rxM8wEyvqybo/+MuAACto8W7cQ4rqQtetf0e808Kc4HIWobqvsI0hdUyfD+6O
	 MUPcblAx8ozrbOH66+nDfKw0S06QeGhXO6JPEvrD4AeHg7mM3bhSLRD/ofRhkZtbof
	 E1euvR4arT4orc4LHtrYJzaTJKAdJHZBK4b457synxdljOtjDSRopbWaoxCwEXnbub
	 2VdPydpDpyRFNAFYyeSYlAT95uKyVFXKllro7HqcWhJTrxmnpaJUmuZ+P2K6/jVriz
	 9g9KdOgldd1SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B099B40600;
	Wed,  3 Dec 2025 19:56:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D112D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F06681EFD
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORFw_GZhuCVV for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 19:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562DC81EB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 562DC81EB8
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 452EC81525; Wed,  3 Dec 2025 19:56:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 20:55:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b41c6b21d53218e09321e6fe137d5439e90aeb85
X-Git-Newrev: 6e88765aa1eb36035a88f67c7de88e0ec8ececcc
X-Patchwork-Hint: ignore
Message-Id: <20251203195634.452EC81525@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: fix static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e88765aa1eb36035a88f67c7de88e0ec8ececcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since libcap has been updated to version 2.77 in Buildroot commit
42f2b480a5a81c7443f177bf541632b0fe501720, the build fails for
statically-linked configurations when the host system doesn't have a
static version of libc installed:

/usr/bin/ld: cannot find -lc: No such file or directory
/usr/bin/ld: have you installed the static version of the c library ?

This is because the -static flag that is supposed to be used when
building target code also gets passed to the host compiler... which is
obviously incorrect and leads to the build failure.

This issue was introduced by upstream commit
c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50, which was reverted right
after the 2.77 release in commit
542d7d86ecd2129dd5fe7e5b31ba307304f5b319, which we are simply
backporting here.

Fixes:

  https://autobuild.buildroot.net/results/f6d/f6dc61a9d57e282691b87a3a8fadcb5d5ea8fd8b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bcap-Add-build-ldflags-to-_makenames-rule.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
new file mode 100644
index 0000000000..ae9655fd57
--- /dev/null
+++ b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
@@ -0,0 +1,34 @@
+From 542d7d86ecd2129dd5fe7e5b31ba307304f5b319 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Mon, 10 Nov 2025 18:26:34 -0800
+Subject: [PATCH] Revert "libcap: Add build ldflags to _makenames rule"
+
+This reverts commit c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50.
+
+The details of what this broke are here:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=220691#c2
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Upstream: 542d7d86ecd2129dd5fe7e5b31ba307304f5b319
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libcap/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index f0eb87e..e90a950 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
+ 		$< >$@
+ 
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
++	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
+-- 
+2.51.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
