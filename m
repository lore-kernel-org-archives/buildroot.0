Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D474C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566BD80DD3;
	Wed, 16 Sep 2026 18:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iL4hOR2hX57Y; Wed, 16 Sep 2026 18:44:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B6CC80C13
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584259;
	b=kPd6yKlzzTMfIipciYuVFXNpeUF3nHmbt4c2vC6jI6+E2DWO3cyIxX0l9pC0X41TznTZ
	 s3qMuGTxOasXG9QoKPlfZcE9JiJr6W7L5mpy73rXrxR0kHvX5jObEXUKS4QRJqfyqU0E8
	 SIp1j/gk4QKv2lkvt7WT2PTl5+a/pkLVHF/5b5Lw9FrrCGe/DLbfbrOxtVmqp7efOY/mY
	 muMNKDnghYWTVY/2pAWIJ6fZUHkteLUJisJ26vq37trozq86pGeq63HzqLKhx8uKUlzkc
	 gw7KQaOqGqxcfXeMRmDuxgBHEerj683IObtM8tNTrLAhnDn2E1sJ5iBplCvJME709eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UVJntmTR5DEbj3Ip3nC3hg3pJO0+QyBLbUFDsfJj600=;
	b=YI59Hzoj5P4fM1Tl4u9xc6Uodo6uvCIxfB2abo9fBy1zzeS/6Bo/k6DjoQUioOixxasQ
	 DDR53HZm8jUs1WdMn5pYoZIoFoKhEGTuD5lPgFXajbx9UDE7GJJFiWtPgztgYZi/zzi5T
	 tCilLHbQaPKUvv+8KRYIbWZ+fmm+5ftHdnYYlVptOLmDTuVcSQX3gnHufj8vrehtIkJNV
	 6RZCc4Ho3k4oknULDB6RY50PcJEImPDEqyNThWt9N8YZRYKs9PBaQZMaJRotQfINf731W
	 o5YZ1Y9+mAqILMs29CBWMsfgxlLxtSYNvW4MOit9YkbpuLNSV9OTQwq3EoLj5tLfScQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584259;
	bh=UVJntmTR5DEbj3Ip3nC3hg3pJO0+QyBLbUFDsfJj600=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bIaO3pk6UCl4Co+gdOdpDrC17TKgIJHcqZC7r1vjVWUZNRlp29cN0NNDr+cLH+8nE
	 UnMWXTA6rlYCtND+m2hwwFoRv+k82qxVDJH1jL0E1kQCZgIqi1Lhf5k+yZ6tYaJ+As
	 bOWpnWHc1IFDZtMD1sdVFzsARsmUptNHNk7vDYenpyHwAw/ETH3FbgkpomeEVKrJ+s
	 gjDDoT4kxeIsYSKrYljr2QHI/b0LhKXJs+ghPYD4f5qUX9oEqkwvmne3hcPTLN3jbN
	 F9KCerK8vEyYngV5HDn5pDiJeJ3QSYamjm3y1oF6BYmbeWz6iPZCEbMELqf5d/QSM8
	 T7e2RKaClF/tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6CC80C13;
	Wed, 16 Sep 2026 18:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA3124D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA284051D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsHIIw3vZbRZ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:44:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B48140367
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584257;
 b=TrZVoW13S/htgGFHb1R6BCE/PGa1xTVANFOt7bY0P+jhtJtEMkW43x2gxGTCMSJokQIM
 ra3s5DyPCV361XTKLzjgcI3BDd9rJwmk5EENwa2/Mc+xAvJ3/8sFNGJYzpzod5SyUil6M
 A0+EaowD8SRrOjwyFEGH7qUSfwvVqkZZJPW6+b2zyX4gun4RMMvxbUFLmpMrflicJEUkv
 wurhhUSLCVIJ21Mr5c6aLEDFdSQrLVyJeAdEVkpHjpnKEI3ViZBHuvOFzEh7+ZwHl3cgF
 WbRlB5WE5kRYvK7k5ha6Wwx9zqUvvAUjWCFvx4Y+NYXvl4yHo0LE4svg0p2DgHLOl2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584257;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=R9LH9pUA6ksON3T5IKDxaDSLG7zt8CCWyu5J/FS/Mz8=;
 b=rTwQGG0Kp5vJgM43YQkN5IlqY33fwJJDTH95BmUcZjU3nRA8wHJwnyNXHcXSV77BQxA1
 lw2ECo+ALtB+nAhtQb5mxR/5n4/L8hucsVOhgnDQRl7rY+P9+GnZYx0wnA1eNdd7cCtXE
 DpCbbuoNKWEjtI1EAa7IPoU8UDvnUN2gMX1T0u2rY0CFbwiAsb/H4Me45rYh9w1nhJRff
 l6XRPcVuoPe2unUrTIkeYbKK6TC4wRswfYDkX/ZcGXQptN5jtUxc1O0BRtYQZIEU50we8
 zXB6sMqvIai+saTmm/2dPsXekTW5uYfMo8l1ENvFwcU1+dYAtiGsqUuoB4ECuzE0sgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B48140367
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:44:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A58B9960BB; Wed, 16 Sep 2026 18:43:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:43:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5279b2303c53f61d21bd3c682d008df5875906a0
X-Git-Newrev: 251a80dd9d5322d15afb8ffd5766ce879c478331
X-Patchwork-Hint: ignore
Message-Id: <20260916184310.A58B9960BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: propagate gst1-libav
 architecture dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/251a80dd9d5322d15afb8ffd5766ce879c478331
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
this dependency. In practice, there is no issue, as webkitgtk is only
available on a subset of CPU architectures, while
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
all CPU architectures, except Cortex-M, m68k coldfire, and some
specific cases of OpenRISC, which are not supported by webkitgtk.

But for the sake of having correct dependency propagation, let's fix
this.

The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
dependencies that are already handled at the top-level
BR2_PACKAGE_WPEWEBKIT option.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 03e9eaf59e..4a747a22c9 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -87,6 +87,7 @@ comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
