Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA5BCD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF91E60DD9;
	Tue, 12 May 2026 16:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_nYve9Bgh0t; Tue, 12 May 2026 16:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF9E160C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778603754;
	bh=43FJtKNNX+p7c4n7fn8sLWjq4gHYG025peg4ndOgXAM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P46uaqGSZJtrVBXjpeKQyOZfMNEIwhfh/nDYhg0lZUhw5qiFzrwHFSntJJwnQ+ubD
	 KqaNv24buT0Cs2yM9F+LC32LDGkVOYc/SfYnbnZnAA09XI75Thpd7PhrMoe7BsGuMs
	 JHhv1MHWmeMwHGWCAuIpSBiUZUEp6MpdEICyqneMyjbxndXZz+n1A+9uw4aFRrxTqY
	 X653qPrPNg5KjuJp7k9095HyFR2g4D3KGvO1vpzTr36c0iRfn7JaT3363tQ+OfzbEA
	 Sle/shR7vpfe+EGAM6YzVKKlozsRgJreWZ/83h5N+xrjgySnVzNpv8GCs9bo/Pz/gU
	 CUB8kgmexqo+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9E160C18;
	Tue, 12 May 2026 16:35:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A52B9223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB6940670
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43yOexat_D6d for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81A224065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A224065A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A224065A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:35:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0C84A4C054B;
 Tue, 12 May 2026 18:35:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMq5G-000000005fn-1Mrb;
 Tue, 12 May 2026 16:35:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 May 2026 18:35:50 +0200
Message-ID: <20260512163550.3645280-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778603750;
 bh=9b3RL/U3aC9ImFjFoV0xpLaguvtBnMJpxDfWMJ2EiIg=;
 h=From:To:Cc:Subject:Date:From;
 b=dpFXFa03DXKrJ2GNGvAL42BTAoNljPDbeeGSVSKXw0rJ1WmeX0N4+YkX+H7PFkxkN
 VK3CkuLAxPA/ALzdPtdysWwBESm3lxAwI/uvARxgDFuEw4mHKhZbcKg+jMt73oiw33
 2/FO6SKQmix2c5acXD4CZbQLhavNZyQdtkh6zMTvxmS+dZWpZeJW7+a69vOgdJjvVG
 kCSwM0Li8QqDI1h3rA6NbPAhvvK/BxHHgllZw+GoEoA+wAWjkn8ksBIXcb4vCg/JuQ
 ckCqNL642+Clc0Q1e42iWL1v51KW2bQ65+FG8p8OLvihs8/Eaw6NNElOYirMkRHasU
 z7Yt8zxUU6uOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dpFXFa03
Subject: [Buildroot] [PATCH/next 1/1] package/libmediaart: bump version to
 1.9.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.7.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmediaart/libmediaart.hash | 4 ++--
 package/libmediaart/libmediaart.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index 34094744a9..f5d052a61a 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
-sha256  c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17  libmediaart-1.9.6.tar.xz
+# From https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.7.sha256sum
+sha256  2b43dd9f54f0d8d0b89e2addb83341ab06d7b98cb1b2e704383584af9c560f6b  libmediaart-1.9.7.tar.xz
 
 # Locally computed:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index d4480dbe5d..3d454023f3 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).6
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).7
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	https://download.gnome.org/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
