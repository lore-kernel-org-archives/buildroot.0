Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C719CCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A7180E1C;
	Mon, 19 Oct 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWRVSduN5xUV; Mon, 19 Oct 2026 13:42:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4996280E08
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792417370;
	b=O9dBNrnvgiK3Zpws4YZ58fKFu8xwJ40BJWPR8ucdutyzUsXksopyI+EUHxeiOwGutuzm
	 jJOZrs/ajp+/cm2/uTHVlN0vcFS5OVLVFjPG+OysweqZGaE5WpXTa5tKnhfenzPVH/5gz
	 wW/yCtNcmqE/h8U9eqKICHiPhvUqlQ3C7R8qjFzOuATgvNT6laxij1HG+V2K/yAXl3IFV
	 meVNeJnY7dInY67OwdHad3VNm8U32L2hzBOVi2yB4a4wZWBfUn0UavjajrBR2emtpQ0gs
	 FxiyVIOU8mFc2idJpGuisVSM1UOXErnQVxYqvgDBq+bCxhaymoQvE33WpsXSbOT6BlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792417370;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1yOlvyckSenDcHZA4k6IkQqhdo5PUn9CfbDI6u+l99k=;
	b=ZzB9jjmsQK/fB6YkQHlJQ3dUOwsjFqUkfJp59nCUuCzoaw8TtxpuihaILj5P7CApslas
	 SWR4m04cHEk7dTDNN3Cr2orUOBuA0Ab7mQnCk1tN9p1qyrgqKSL8Ps4zWHDQ9Xc3OH+QL
	 ZPrG0zY5Yl1m9OA5eNILHr+Xx4hWZGa1JdXiSX4qAnuTKfAIVlSgLA3+S7MJ8V4rjNtwS
	 qDUdyHJAaMmWlfyQkM5Q4GZmlyhKPfwp+e3kiJYPvNKP1h3aDoFlcZqYAeqPVbAH8Ss4y
	 1nwTv8w5QnGz75SPUAHx8pQayHJYWdAneo4xeywtgdkGG+HH1S3mR96pr0RyRkfaC+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792417370;
	bh=1yOlvyckSenDcHZA4k6IkQqhdo5PUn9CfbDI6u+l99k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WKli041TprDn7jD8Ge9q/+SygwJLoFmnfL5hrFSumutFxAi5pUeE3Mwp5vHXE2cQW
	 msJqO+tVQVu+Gvyv+IT0Dy3Yz0A2NjTlpn7Ll8NjBuRKeR2G7rdXNCVqA1VAcOCxZ8
	 8Vw4o2ZVm9cR5oCbmY/SBmN05Qv9FWSzC2vW0zinDc/c7eJyvFy53sruJ0ZBJVT/Ov
	 jZGS/w1S78iATJifMAge1q1YssJcSNwU+J9J0LBPxXT9JygRTpXDdNI8mpqp60tXcP
	 5346jXpu/bWnoq59vR/+QRCsbEY+zrDOym+fxymvy1PY+v6pfVVmA4oW8hSW+Yd9IU
	 nlZHLizjMSXoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4996280E08;
	Mon, 19 Oct 2026 13:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40DB51E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E7CC80E08
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dL-TBtA6DH2 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9173E80DFC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792417367;
 b=Vl9VfOxHmYBMGjjb8VniFIwbzJI7lBGUbAOqUciegLNBn6/HcQqUqovSDzFWqFGa+eCO
 YoxZhq1EAS4oHowYJuUY+atSJk6PSZ/5zqCK/K3+G1yYqDTAOmJD+jqM1/kN7d5tkRI3T
 AKpAvMFa/1Ys+t2/iOEK0kGLg68lTRRu2pELeCjeHqidC33J21J4o48WiBE7gg6HXTOml
 eFxmS4LoPs4FsWl4yFtQ0LLQ7iLlnvkwT7f2dWCUA9mg/jIGMdHMYoVvWdBJ37PCSwVK9
 ++9j5Ot2NyUKd6iKLBhjpmJlWQLQJIdLf9Q9ed8yTBAGGAhZlQbzwAKTudZC1PxmCTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792417367;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=N4ASXSGkr/bCSpd+B0ZqI8Hdc2ROLNdYlIT5jZ6P/PQ=;
 b=k8mvMytPbS5cSYrVrZXxYW5l1LbpIi9ptCvO5coy0BSEBHnKh3kPKJXPKLR0CVCPy82K
 lSMyP0b7uMSNEPpYKv6E2C2ocGKk2qCSG/hpZL+iK32+xQVUytimR8ku62ngQGS2A+jp9
 c1keGqa9lM9PhWgReKxkiOHEPRw7UcnWJFPLQfhhDcRuEP+1o+9u/sE86mEunKk1ZKc2p
 TwiUQ22xVAVrTfPat0UKt21q0YTW21ZUWottQ2/McHXYBbQxcl1vY1E5nDtwDyVHzk1WP
 5ymjLxpNOWDtfQ1aPPcGiL6T3rFaQ5B+7KZh4u1IYskXnq0zfEoAiwfGviJjPeeMkpA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9173E80DFC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:42:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE45E984B2; Mon, 19 Oct 2026 13:41:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 15:37:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3415e639a89b33e9a6603694e0d58b72aa63c79
X-Git-Newrev: e5bc4741589b86c0acace607982fb6c82b52c32f
X-Patchwork-Hint: ignore
Message-Id: <20261019134124.EE45E984B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xterm: bump to version 412
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e5bc4741589b86c0acace607982fb6c82b52c32f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the download site URL from http:// to https://.

For detailed changes, see the upstream changelog:
https://invisible-island.net/xterm/xterm.log.html#xterm_412

Tested using:
 utils/test-pkg -c /tmp/xterm.config -p xterm
 (Result: 6 builds, 2 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 3438e7999a..93328ffede 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f  xterm-410.tgz
+sha256  b48bc780c1cbc14f6d89269f7e593712af6095876960d650be28b55e5dad65a6  xterm-412.tgz
 # Locally calculated
 sha256  f272fa007de2cffdb22b4df09e9a3aaec3555d5a6913229b70006ee137ab22b5  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index dc2f3c0e60..ee82551b4b 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTERM_VERSION = 410
+XTERM_VERSION = 412
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
-XTERM_SITE = http://invisible-mirror.net/archives/xterm
+XTERM_SITE = https://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
