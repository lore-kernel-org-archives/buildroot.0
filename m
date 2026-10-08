Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AF3CA6016
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 22:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C910381407;
	Thu,  8 Oct 2026 22:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_CR6QU4KXTF; Thu,  8 Oct 2026 22:11:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 11D1C813FC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791497470;
	b=JN9BKR5oNQJ7Cb59Ok8PVkA+Qm9XdSvoPrcqg5H7s6eZDJpJ9ZG1PywxF55cE3z/9upQ
	 +dLdqDQb0mX6BuQAhCJZm0bOxOwH3KpzMVdkisdSewan9T/AX3scSUm+3CrFPDTf/WIya
	 /zyJaEIWuaWCcraJlCLKl1NaQRPbJh0HM6ea0ut6Z3Uvz/LZ6QvLEhMduu2C/j2mUVbqI
	 /FXfjNUJAfG6sFv+Dp89tGzRX+Yx7VWvD8+u6rBeIC0mcz6y8eOLRiejA/VJ2otQ0NRSt
	 XjGZGgrITrAq4yAn6brJXShJdFZ5J+YhNzOjfQmHgviu3i52VFukrZh23iFZtPpjR/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791497470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=u1nOYTKRFDXA8jtwb60w090mQuhkRE/ShQAFD2KsHO0=;
	b=kz//9CXJFE7R+HUj3W3nKR5I6Rp9n8Ae1PvZ/djZlS+famr1gTADAWByxT4wGlv3B4G5
	 CzpSF2bQCkxeamWOuEMJd4c5d5IatyaPBVTwiT5+j3Ws3RY+2QmHxKfQw+xNHWERXenLX
	 lU5U6m3bm+WPlfc/O8AyLJTli0Sl5eeIExFL2sCxYkMprgW4199h7OTLyA/+fKQDo70Rl
	 7nZyyxN2exni727HRoatPTWWx08NblgwC2Gmbhvqw+nhzOBaX63xQTX0LcwrvPz5l8HSd
	 hlIVZxENZnbmCoVP9h6MfDHeoRECLjuoW0iqtbjFWpC9B+6s1uvO9cTBO53ANGLDeow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791497470;
	bh=u1nOYTKRFDXA8jtwb60w090mQuhkRE/ShQAFD2KsHO0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mq4ge0XfmejZMk3NaWc3m0hj/6+WZKqOje3svRRFnJQpT08u16CyWFn1X6+mnv9lA
	 jEC3QxBkif0bemU4Cy1sOJPam30Kjm1PaKoMdvGOvn1EIMptV41F89n7p1hwiiTjKz
	 4kNdDB1ykpcw0L0pEyZfHVOKxFaA/0hi6tNYmKakbaYxx3UR6B3OlxyrC9s6sztcIj
	 s+qQ9mgPMEMDrxdvjnJMdxvW0nwR5QFpYqRN07w/VFtpL1z+qWWd+jA6pSa26Vmb2e
	 wLfHMilecJ2tKiBxrWzQsWSPU9nbilYGVwWmDRR6uoG9M8An5cYF2cqW+UnCpGCmZB
	 xVyfUoup2fPpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D1C813FC;
	Thu,  8 Oct 2026 22:11:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7154724
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD8154090A
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la0XTwigrU65 for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A38B40925
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791497465;
 b=VY55eAyQlVqYah17/cnEIhBuMnLjBq6O1RoF6hLv1C3eY+/UqQKZK8ltJCVc/sAYdAo1
 H2NO5DQch6N0aHPvR0bijsGyA9Q3K+GJe3hdFfxRErMtu1lQemRkk/1nRgoF2IR+yWB7X
 nJCLEdDjToXFg0YVstwEli7DrxvjjmqV/HSvfN/ow91u+1wT8kczZl97yi9pqaDJR+RQc
 kiS/Pt7j0aTJvV7LUYyXm9rrNBct6ap63ns5OYZukqPA/RvaF+XwM9IabsCDPGqetrn4c
 KbzSHl70PhHvi5TNX3ZOJjfjXesDPGpF6XSSkn+LSCFvFSsrl1icP+BSj8EqNVkF7yQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791497465;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iFbawwdAkPsfPfoxMTJepOn69OAWQmsJl2Ha490hbOU=;
 b=XNfcqgDD5XDMeXN7YAFTdrlBzDPMRol/9uggo3XdvBa3nsFyJ+SvVScGtbXLKu92cJV3
 L90rT9O5LSOwzSloluu7XALf2Z9fM0cjTeAjvwhWxK/8OwXRkIydBd3FtcBgBazk2J9B4
 k16yjSKXaSU8tJ3J1wXSDUO+Ijsn46O+IKGWqC7mgOhesgsQuAvsNzPnqmAwF37R3ftc5
 ZQQDJohcCA2TN9IrojE/X7BZ2Rxuu+6v+sqeThUCXIG5IxN/a1sb8DBbuQWuKaDZHsFoq
 cH10PXiLol9R7I/lACpoBBeTpy1nwgSLhvNNSxx03H1jST8ar2u9NK4Y335TMO6rU4g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A38B40925
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5C128DBE4; Thu,  8 Oct 2026 22:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 00:10:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a9ea2a8bfecf9fc1bb4c8e14106ca11410af72e
X-Git-Newrev: 1869ded4bbf1cb9cfd9b26e6717978cda7d4f977
X-Patchwork-Hint: ignore
Message-Id: <20261008220947.A5C128DBE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 23.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1869ded4bbf1cb9cfd9b26e6717978cda7d4f977
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-23-1-3-released/92432

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index d092a2cf94..7df2f28873 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.2
-sha256  c98bbef08a2b4c2613cd50e9aa9ae7b69b1fe6c16b2c40373bc0ab6116fdf78a  llvm-project-23.1.2.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.3
+sha256  c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34  llvm-project-23.1.3.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index e3eb03468b..fa141fe8ff 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
