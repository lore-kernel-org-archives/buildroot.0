Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31634CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351B96075D;
	Tue, 13 Oct 2026 07:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDgskadayNHj; Tue, 13 Oct 2026 07:58:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 526A46073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878282;
	b=C2NoKfi8UBMB4TZL5RMkbLFL5+fDb9MsWri1cJleO2g01kZH+gIsqqrwmgg0QinnZMtw
	 u6oTR6i3qsgYi+2CZ3gcfAQhSnazL+UEsqGz6WXT2qktaI6vk/2GSoatKmsnVO63tmygH
	 wDDzHRs6oCVHkBCnavL22T8HF+wDvFb1padCngeYXWgVxswzkrbo1WF97Cxf1otgavRaa
	 vA7+e3+Pg6XNepFWyRBSoyQA2vDvOEyJxj+0G05IUqVcUTz+f0aEuXINBOJyeHA4B06B/
	 glbk+Bc7aYkK5gX2Eb0MiryEXe/7Mjb+yiCeVR0AtyxYB7bFeKDtApvDAok9Is5byiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qkP6Xy0pV1Mp+IY6Ik9q+M86ciWDkmu7vyLyP1fIM6Y=;
	b=cxIdFB2lDCQ8GIAjnFUCUA2bCrj93RVWqS0QF6CakTUWlaPlLxXsHv08n0lW2A/nL3sZ
	 lZ0XNUi2ixnm5yygS7jdx41yfLFNt5qlg7u/6NKYIR9WA4+wYwx8GZuuocNCmdjoPaQPj
	 jCHAag5RMLHrH0DZqLTOXkneHv2zJUc1+d1ckGsoFmScM88h/SGzmCZfguL6cHHTSx5ny
	 0jQ7GrGXd32FlNVGPuJQE9EqOn7JvQJwZkVyOMBh7TZE1k2lwGDBaZl3abNzfP2wRWomf
	 YkOYiooqEGGKlyHEnEd1cFdiM8zDqfhWKCglrLClK1PudH28bITjtBqpKG7LFrU/F+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878282;
	bh=qkP6Xy0pV1Mp+IY6Ik9q+M86ciWDkmu7vyLyP1fIM6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XjBjy+Km0xhbEpjfVsxi+btpo+ZoUSBeNj7Z0N4V8UVzGz3pmlY/TES3cY296uaSY
	 L+SiXBury7meG7BK2OgcjYqdA1QUROH34RwzoyenRdihAMq2Bvlto1QcawbygNfznc
	 icRVsBikc4Wi9+50OVrcYwRkVmm00e5axzjsmqdS6lqLKgLIf+OrSqfyVucZd+3dSG
	 FUdN6ryD3aD91NoIINpBT7a1g7mJf+m3/6CxwD6zheqX8tUc6826hNSpvSbhunZK2E
	 QLl/pML5gaCE8NZQBrxC8VT+f4Y915Tc5YbSDQAMMCmL1QcGLeqy/x05imyTJCo71X
	 ncPgmlkQoRi6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 526A46073B;
	Tue, 13 Oct 2026 07:58:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B09D5DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE83F80A87
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVWqMdEpRPh7 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F081580A96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878277;
 b=eXE7RVXeFmdq06CXe4ph1l13SFl32nVRFL4xgECASUMDvYk7Gi/XF2UNnjDmWgN0LiTh
 sb2zAjFqLotzeUh2Y5+1RO1xDyaQZIcnI5F7U6/AdqRlbsG7OwM8wJ6PpOQ/poWfWGATJ
 jta6r0SPRd/Ev2Bbihh/BNm0fvgx8i9KG7iPJb/wtLtD0g/Dg9MBp5Pg35ptcdg877uho
 DZD2Bz7TUVuNmwfg885FEzosQ1MEHVfZvpJFB2T7B0Nj9+jMJLLGQZEMQ1bfj5jboC/1F
 ZVZ1zr4xWiVdOFl7aS42cvfygKyO4Fa7gaMCNF97q9DP9yl+YixEmSZQYqt6hAGrOSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878277;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KCY3isAZul3yzec5bNSOChq7ndTWFT07FcSmdobHPFU=;
 b=ce1CLZXnDwDUjHU5USEEGFiHGGBEUeKoHJ7yShwbWAQh2TUycU53Yvd8tl7s48+kAc5V
 DMusfktJtq3sK5cgF4Wl+YgPAMdWCRXv2hdM8oGW+wKdw1p6ud58scDZX3sRhDaeYS0fh
 0Y/yDUDnsxJ21FYADYGepdAolzGzeLRHpaTnqAXiqXNPmIpv2VzRd4p5dGvLFLjFbPvmU
 f/pwv2jqZYbZRjocrWfms63VW95JJM7RQ6RBN+1oMT9qeNqB4aKAup6j3qTKJHR1sZjix
 YKpghKjhToB2MTUfwx1NQyTxu9TqbyCvYd1rFKB+B/yQlv4jsfKpyplp/XTOtCCsbiA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F081580A96
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52EBE95457; Tue, 13 Oct 2026 07:56:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 09:46:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1037e4462fddc2a5b6f077d9511026da0c1817ed
X-Git-Newrev: 98a10a7f174d530326f78ac3f8713e1a0d0454bd
X-Patchwork-Hint: ignore
Message-Id: <20261013075637.52EBE95457@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaposix: bump to version 37.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98a10a7f174d530326f78ac3f8713e1a0d0454bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

see https://github.com/luaposix/luaposix/blob/release-v37.0/NEWS.md

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaposix/Config.in     | 2 +-
 package/luaposix/luaposix.hash | 2 +-
 package/luaposix/luaposix.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index bd2105743d..6f146afd5b 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LUAPOSIX
 	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
-	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.4;
+	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.5;
 	  like most libraries it simply binds to C APIs on the
 	  underlying system, so it won't work on non-POSIX systems.
 	  However, it does try to detect the level of POSIX conformance
diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index fbcc0dd6fa..ec2afefe33 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  82cd9a96c41a4a3205c050206f0564ff4456f773a8f9ffc9235ff8f1907ca5e6  luaposix-36.3.tar.gz
+sha256  3a0cf9fc9459ae0975afd1e24ea552decfcda2231651a0d3bd6e1f075e089e01  luaposix-37.0.tar.gz
 sha256  0aaf3d6797693f3ea0ef4df2cb4d43627b00eb08213ead4fb037a8c4a04f8631  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 46be3b42a5..385b0ab419 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 36.3
+LUAPOSIX_VERSION = 37.0
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
