Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0348AC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BDF81209;
	Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJwNxmsfIugr; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B2D9681215
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276206;
	b=kIEmTGCYEone4Z7BQeRKbM+5hCaoUNxrDa8vzp/nZ9AnV4e8ir4qiEITYrKIUp2G/F/r
	 SOc1pczQ4J6EZCMVckqmTo0+yfuD1nzDZ6R9xeGiXm7ShpMeou//6xznrzbo5OM9/wTBL
	 u/BsFt/Vl0Dd59+zj2t0Lx94fDJatmK3ubBx5eYu7EVmCnVJBOyrOqPe7Q862I2RO6dvy
	 zmWw91LH45gqSFaxjPR2FxueLqeWs1bhs9LT1h7aAoSGLWIZPCNY5h/0m2q1zr/GEe7kN
	 eGqX67uDb4PpQvjocjSrgR5yLxgIPaYzJ9IB761k521GdkSnnf9pLxiPd/XV90PWs5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276206;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ylPiUX1RovBzGFIsznyihPc/UTS/6QCbiZAIf2vO/Ag=;
	b=Cv9KbctOq9eAPJXWBm1EY6770lRmQxR40eohY4UheygQQ1Suj5PAtKG3fkwfbRD4JfDA
	 wnts2/a9q8ngYunD27UPQw1GpLGju7g1UYn40Mbo4hTH2RTBs9m4sqc3JWC5NKFaulu4X
	 4QFv9ZeyrwH0fTyNJg24bEjb8FXn9HtWmxJDoHh4fi3kURaV1EgsZ9jDMbpwYdR4xYkcu
	 iRv54Ercq+CrMe9AlgZJjFhr1bhKPf3O2h3wFDS2eVjSPN3fpoEgYLam3uIiQLNVmVk+6
	 PPUq6Ev2CQnkzX4msjLtDE+NWlGPK5A3q030eSsxbta+uuWzQD952XWk17A2m20bxOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276206;
	bh=ylPiUX1RovBzGFIsznyihPc/UTS/6QCbiZAIf2vO/Ag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VLZsrmS1VkVPZ0Vc//lFLtTU+5RmXwmYBLVZwlZHGsEAxXuNW26DCq0d+t+/51l3/
	 wV/deh0lB9QCsLFkHCzNcpya4RB5DnKfF7nLCsPYoiIPzrnYaXbZUOvyArQr+8lsZi
	 kKP4cxb9NpHTm3zQmw338JohclP4LJABavsqs/YkKSCtTT72CpOcZmnAu4C6+X01jE
	 NOb9jkPb1xO2F1n05h+1p3YL2A8xs033DBPZtOZLap0d6tvM5Wd6QOMKjiOgbzMXwu
	 MYCWH/ob8VnZC4xqAG0/UdbNhhCJ5Rrxp96VmZo3nrdrAaLTp+9IeGZpq2bzB5n+LG
	 uObNgZPDaLmeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D9681215;
	Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07469328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC89B60BBC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itcA2RcOziLp for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B8F0560BBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276201;
 b=n1vEKjfq2j/boETZq1wQauflMNy6xpuHrxpuHsFdlIGbYC0EWDKPLYXMgOLl8nuiXBki
 vrX/duD5yyyzmdFJ/kAMSM+xJNH9us0iMAr+vXw+e/eSWxQLInRDvrk3ZBl+idofVn17/
 1+J84dSFqdy8vLD0P9nvTcvirOss3iK0dxIB/M5C5wVszjr8l5iK6goJX/ZxeO0/s7jta
 NYXVuoXEYGjaEOcA7xN0ANBk6/wZi+1pKMsWgs4rsTFCb+M6+hYAQMqAAfdiZFYR/X2x+
 BpyoIqINoEKT2o6uBd7bJ5qXgmd2x19hxBUzjiRlezM1G4QR6sQwIonn1nJaOwofj2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276201;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xoVy8bayr5PuTCDeIGRG1YscM1G4RBY5ZF3cpkCWRYc=;
 b=j0GgBIPNsn4QAgzyHgxAhdjmu9bISfazLTagCRU+GscncBrroMizLoHwB+j+THP2+3+Q
 8UvpP2OH0mD55T9lX/0wRmhSPZ1knIHtopvmEVQvui52zFXRct5RWFK9yhdmGb/z73QSG
 Rt5+7GqTTitkrG/0g9xEdBVo4f7nbE4TBQZOjNakEfZQR2XeRHNahJ/QgS5lhsRejyIhk
 rA/irX36wSv86DKwOH2crzVazBEyeE7g9bZWF3lfTKi3WmpU0hWDoWrwRwcJZjPqYqAa8
 KRUgcA2nAsO50hIrTsR+ZMEbEwvBQ6HxFTCxIGH/9bSt8TrZ6mdhq3phGsaJ6/htzHQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8F0560BBA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D64A98385; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 16:45:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7c51110fc2b2156c6bf167d32a1f916e4693e3f4
X-Git-Newrev: 0374d408e609df8c88e2b804c2cc548d8a385c31
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.4D64A98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/x11r7/xlib_libXfont2: security bump to version 2.0.9
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
Content-Type: multipart/mixed; boundary="===============8504837128965808702=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8504837128965808702==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0374d408e609df8c88e2b804c2cc548d8a385c31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2026-59679: Font Server Client encoding Out-Of-Bounds Read/Write
- CVE-2026-44950: Font Server Client Cumulative Glyph Data Heap Buffer
  Overflow

For more details, see the advisory:
https://lists.x.org/archives/xorg-announce/2026-August/003734.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 21f18cd0124f994c736c034d79218a2c77735b31)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 86e972a0e8..d5813b3e24 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
-sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
-sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-August/003735.html
+sha256  f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2  libXfont2-2.0.9.tar.xz
+sha512  ccd6d6abf6aa814a940d137813dba638f8259c3672abf00808d82df033c1026ae29d40c9068da4f112637338ad0d0fc15818a4afa9369a626c8f17e466b4fa72  libXfont2-2.0.9.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index a881a4c55b..e8db0004f8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.8
+XLIB_LIBXFONT2_VERSION = 2.0.9
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT

--===============8504837128965808702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8504837128965808702==--
