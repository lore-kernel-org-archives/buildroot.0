Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9C6CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA86608DC;
	Sat, 10 Oct 2026 09:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNJsNg7nDdaE; Sat, 10 Oct 2026 09:21:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18EEF608E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624095;
	b=S0siKBXETIBqxceBVGQ9TtnpouSiy45CCJrKY+equ1LnoF25dMgd5LYX8hDVSN7x8NLr
	 zrhfyZ1BInGrqFuS2Oe/w8hqmbUEWxScSUHyaq1N6wfQPNTOPgOR4YHvCCjdH685nYbKB
	 MGmrbB38XKqtLoCHBb6HonM55ZmsmaaZCCrQEbo10q15GYiuUB6LEpodzAMHWe+jyzGNu
	 X8osywagFSrwLV7VZRf5KH3IrnbTCq7gPJQhoHzbrW1i0woj6s4KKeUcCQzH6hhnkUjKc
	 yl4C2V3X1hiMsbt2oUlgaZgMg0XfpKaiwho+U21GvZO+MP/Io8kWwxdHv9kzMV2Mt9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hKehP9G544SRIwgQFry0ran3cTwg1Anj0Hom8/j6Q/4=;
	b=tRZaJPsWsIL7Q9zEaiEVDuTDZTQ6shXw/D2FYquqVI9NX+LhvAkGkoijROF/d5tvKZJ8
	 py9QpG0kbM3NoS95IfJZ/2yYTYgyAG1tyIQSG/mzH7BlKALv2O5bPfyM+XFo5q55MlJwQ
	 troktUJvAxrtFgD7agYHnOdhW8CGhzvAQJoWuiaqnr7CM+xlviH6QlG9RG7fHgS3kNGG6
	 7+gKJse2VGJfIKrned/DLBr7F4we9pHjWQPk9uux9UewAQNIxtYtC5kLZRa1/I98FF0vY
	 slaU+uJe+AYxIGGrpeyhwm+biGbaqBXiOXo7DUboyEOpwxLs5i1JBddXt+ydIvGtYIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624095;
	bh=hKehP9G544SRIwgQFry0ran3cTwg1Anj0Hom8/j6Q/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iohA47T4raYkDEnXwqqFh1cGf8gq3P3TwVLXYN/U0Nk4Ms2BsmZUiVpUeBvedaDTs
	 bWq+fvPx7nFg7dN+rTCzTLSxCDxu/57iMKanrcJvlRFiFoVp5KvvEGh6Y031EmWzrV
	 XPEDEE2tZAXLU9zq/Ti//YBG7hPfL0fw0vazEbmelLK3g0QALm+LldkrUzQVnAl6/9
	 hVX/GF7GvrfyTF2wykyVNhCpPSR6rD+TSeCFhSTBH+y+Af991NydXHliivNSOB5G+Z
	 TO8410a7H4sv0uDV+Gi668Usb6lqNRNzdmh2tXafWHFuqvFM8XW2YapvtebLxZ1hAa
	 dTcS9YDO0X+Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EEF608E6;
	Sat, 10 Oct 2026 09:21:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73DAE356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63CEF40935
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vo33TCJAfYc5 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D8004093F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=mqUqj9TG1twhGLJsEyBKM+Yx+HiObKQ/DzoFQmvoiyUR6Lre4O3o25kG6bVJgxSzJF8R
 5KkZHli2dB7aTqNIOnXmt5kcAdcY2Ew4allU6OwjGtyajACUCNKFdu9b5luKcCdFZIrUz
 ADQDqaRY7SSducRZdDUlj7LtfNt1ztD+O5CKcpb+fzdD+89RQBBXIKht4yNU5593XgUwA
 7cztcUhi26aHTVUAhZiDJ9QLQtYPoGFGA6XZbBJcy3fuGSPTgnCXFRSbUJrZh8RRSEyBs
 P2iBISifUybaR5Bhvs8Z2Eq0H63m6Ejb22reQP6Szw0Jg0nghbqJhUG2QrvcNPQ4TVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1gxWDY22YWJz7xisXyFYrkPQsQHy/vCShLsboqUfW60=;
 b=V8b/Aq9ynDgRAHL4v9i21XUY8CnMhYchN7m7jCl3/MyfEcYni/aEVk/G3hwxpeA9bn7w
 v/5QpoI2e4ftE7XRZghB0dc4fMoFDOFVBoUjfejXu9cNte5qhxIkvact2iFXCRj/nTzhj
 Pp45plWEu2Gu2U1Hw5MA6QCmb7fDc/jcCpWnP9pDnZt2VABwqNwVFh5DRS4rfSzloV23h
 C8/BKo4fHimYK4sqkygfHAJvALJYlq4dfMoJlt4Atil1Fa7EYDT6zDvu6/iW2qH6R1nQZ
 AaGUFbxbNKxU2FJu+LsflMIgWYg8ps7w5sP28Tzzns72jYckzRa57cZPDuv4MKEAl8g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D8004093F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A5158F0B8; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:50:14 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c16ecc649448bbb273cc48f415d44b167ef3b199
X-Git-Newrev: 319bbad24c5c369dc85bccc24330536befb9eb93
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.5A5158F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pcre2: security
 bump to version 10.49
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
Content-Type: multipart/mixed; boundary="===============0466534061606778153=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0466534061606778153==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/319bbad24c5c369dc85bccc24330536befb9eb93
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m:
https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 99ea0fbb3db76057a77bbd618cfbd188c69a6f86)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pcre2/pcre2.hash | 5 ++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 90991322a2..3d75858727 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking pgp signature:
-# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
-sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
+# From https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
+sha256  53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384  pcre2-10.49.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ea841f482e..a3e74e32b1 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.48
+PCRE2_VERSION = 10.49
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause

--===============0466534061606778153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0466534061606778153==--
