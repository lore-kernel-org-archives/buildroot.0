Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A53C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C04781220;
	Thu, 24 Sep 2026 18:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgoX8mJO-Orr; Thu, 24 Sep 2026 18:57:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 88A9581226
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276222;
	b=Bc8WrjGN1C7yXyqh4ZFtUQGbKru4V3dWVWMd+Y3vDsaEvWluMbOZkOV/kYMvoHrlKgeG
	 cVqzH7JzVEXHbA/zz4GD16LF6wP3t2J6pSTNp8S4CzN+RXbt1+U02JHUW5CocBMCnMuI+
	 2oYiWatV01rozc26UJ7exp22/GFTgSqXroOKRwIggzoa4p5NzHwWLvQv+2ZImx9DOkYof
	 c1RyKCRa/XZ5dEnzXy7BZ4xBUkhuDw7sT8G/cCcFWGJ/G3l9oyu/iDk/xMjDRSiuUpoYB
	 +ItZfJixTmHVOAOTxuGbnNmLpvBzd0NGe9NbVjtFfyc4/rrtLHrfpmNBFHxOGIrvCAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lmQqDLHCncuSu0ZiJ2yuKP80WL1TPeH1wEd8LjYn3Aw=;
	b=SV1I9BQqrrZjlesc2xr/Y1W7JlImBUE7GhQZa3h81blDtV2SGgkQ87ET8jDnTQBJ/5Y7
	 Ih51yH2DJZiHfTXvHKXHTBcyTCoSBmpLexbXueGBH7oeAmZNozEzw/cgZuE/VKYRGE2LG
	 XFoAbUZP5pG3XLcLrOrYOB0PrxjQAh/6DK+OZSQJvGBmbyIpOUrgtYh0MO+IZD40JmuDB
	 0YV1In/CAwJwZCSeasQT87iJVMA1+cx9pZapQ7o5r7LqlFgsTlrJQQvK+2MROO7MmIi+o
	 nDRdvWa1YNG8hUs+C9N6fCio/pacmkLEeMmUOiatuDDOyctNH+z8uwW9PsgWGe51XEA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276222;
	bh=lmQqDLHCncuSu0ZiJ2yuKP80WL1TPeH1wEd8LjYn3Aw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ccd+lTygMt98gCpAjpphIzPhJQReVV7XYv9LSs4+ZI5wgvA6RZVeAGiAu+JF2gOG5
	 FaZ2tt5rzlzEt+TPosDkBFVAkDCzPpvmDjHzkmIDocPL7MUJ7PTt5O6XopGF94j4oE
	 3D6hMoBX6H0mOJxCrMXoVeGlnW5iy1PzL0e2O2XOpYNLN5rZ9V0cIVxIUyN8yXR/4m
	 06DV9I8rY2CRKuPcfJFcU4+72BkM9wson5EPI46KpCfURHBUK/aChTRQzuY0wWJLqD
	 2UW863mRQwveiqnt8gqBNIZPISZwWv6KNnC/DZg28Q1iZ9bAeDxZRjZkTuo7EDlPb2
	 IuoMWJ0qctm1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A9581226;
	Thu, 24 Sep 2026 18:57:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2211C3B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FB7E40AD6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgxxuHYG5jUi for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D5D6940AC3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=CFxWedLPkxDDDFdT5l+WzweMtVPfIbYyMWON87bGLEcycOvup8UNS6ubtECtYQ6ncvNx
 28LRNdf7U1cpYwUu+E1aRp4oz97l9ewoZcOIoIDMWbFbQBLhRgz+fH4mDen78cQZYyNIQ
 qQ8N9PNTCfoPT14UjY+teO9uirVf24pW10nJJLd5Y5KaYMM4pL6SPAY6ynnHEvQUeR6Wd
 EvUYAxZltNMI6/WWhNShTzUo5VMjZzlY4ic/koj2Y7tLnRB6GFbJmAfUY1LuAdQ71a7XZ
 8XnkHI9Rz2F4mBJay+LJ7M37yGUvmg47yLSjNMva6X7EvQERp9494DT84S2OTTSdU6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/SMzHlJHuxCRDIL/og7dMLgxQMmQd/qqYNT7BAihPXI=;
 b=V9j4eWu6tQUGCg7Pdn4nxvWLm4IcuBfxdeIub0i+InOU0krYR617nkvgEsb+bLDF71co
 dAwQo2M7X9QShbprtlY6miMi3EDvN8KJ92nkGWyBn8t5g06UY2ecB4ZvkUAlCx5w/ePCJ
 1ORrGBNpnSe8wSpNjrGktI1tJWuIesoh8QMf1MNG0yE7uVQh1hqtgXnoXVcDfoSxryeMt
 bQSsns1b0CAbgoT5sG2bEq1MkvKNwGK+WY3yLqoxbOC4muA8LblaLUfKK/jGigGbB6JhA
 otGvkbMVrQxX5m+hUO+wBhByL3WO/pMoQSkru5nuhmArEj/SUsetUKIYeoJxc542hBw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5D6940AC3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7983A98385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:55:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8ef0ee30da574187ce9749ac75983e84cd22f6ad
X-Git-Newrev: f275b8b2c1f22888eadf5f80cbca0786e94d1dbf
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.7983A98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit: fix
 kernel headers dependency due to seccomp select
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357053120497028683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0357053120497028683==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f275b8b2c1f22888eadf5f80cbca0786e94d1dbf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5279b2303c53f61d21bd3c682d008df5875906a0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 300c95c970..f9c0f7cf42 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -73,7 +73,7 @@ if BR2_PACKAGE_WPEWEBKIT
 config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -81,9 +81,9 @@ config BR2_PACKAGE_WPEWEBKIT_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk asccess, and Web content rendering.
 
-comment "sandboxing supports needs a toolchain w/ headers >= 3.12"
+comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"

--===============0357053120497028683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0357053120497028683==--
