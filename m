Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7759C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 22:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD1B414CD;
	Sat, 15 Oct 2022 22:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD1B414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YktJHJ0TfUTl; Sat, 15 Oct 2022 22:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA6A4089B;
	Sat, 15 Oct 2022 22:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA6A4089B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0341BF35C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66173408BB
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66173408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILGgmHe-Xr6D for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 22:34:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D272400D9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D272400D9
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 22:34:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a3so12975110wrt.0
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6iF26gngb1N/fowKf+roxa9LE5IWvtAwVb2FFTiIZI=;
 b=5Ra1rTEw5kI4kxVrzv++GjKnA+1EmJU+mGgT8XT7j91Btxkdon6om3uZpj5d96lahG
 mbnfnV3R1U9HQ0vpY/B1ysiMaD4TcwL4WIchYEpNSCfGCZan0OzAFq5iCwprnNl5ey0/
 fmJVI9z4gR+mQltXnAuG/QU2d6xHrmvIoc/9094/m5qVdk2fhMjYzMkiNLgtBWHHbHTI
 SRFx17adt2+c0GiRDrgj9Qi3u7zGXSB82t/tqlatz9MmEqnUbMRueOKZO8e+HPXqP5P3
 cjk55muqFmkFMyRiCmzaLca7nr+Z/iJMHjilbSdeb8ciY0Lr3PpQC5V4XYvjaOU52Wvl
 Rjaw==
X-Gm-Message-State: ACrzQf1s22w52KIyYN58ZsoxOR5Xvb4K3oOfrmLSYJ/zjaokFjQb6ejr
 5AVnyTxb9+Gjqxkw+u5dCdMIy0cytGM=
X-Google-Smtp-Source: AMsMyM5bSTQ4BTryCLRNWpqPi0CFsQDjQ/V3wcZvYxBj9xkAnyk+RbzMZpyyo1sSPBuC1bS2VB0xeQ==
X-Received: by 2002:adf:ea0f:0:b0:22e:6ef7:aaa8 with SMTP id
 q15-20020adfea0f000000b0022e6ef7aaa8mr2486211wrm.670.1665873281874; 
 Sat, 15 Oct 2022 15:34:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c3b8a00b003c6b7f55673sm11593803wms.2.2022.10.15.15.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 15:34:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 00:34:39 +0200
Message-Id: <20221015223439.202348-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6iF26gngb1N/fowKf+roxa9LE5IWvtAwVb2FFTiIZI=;
 b=ARsueXn6bofA4H1KnI+4Y8DHOPz7uPGeM0zfcUehyDrJP7DaETh3jCbhzC3HTYu8/2
 LSwvtBRRoPOHW6TyPzH5YxTFk4zfoZHcsjheTXeK9AmOuxX322TiHvri56R5fh7wvKrS
 6GWcaOqO6YXpdMMwhpC26uF2w/LWg79vgJsctiIAId+Frkbd/BXTJpmYNQilYzTX/1kK
 7jdc41502pqALUI3EZzQ2+1ArouagyUMysT98s6d7hSbRU7hCVJr5WRJAeqptKNhovxq
 LM2aw5w5yJtMdkigX++SQIr4ppr5KJav9AlY0d5PMbDIZTEKosPbrvKQD0vgFZIUhkLR
 a+SQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ARsueXn6
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump to version
 2.10.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- [CVE-2022-40304] Fix dict corruption caused by entity reference cycles
- [CVE-2022-40303] Fix integer overflows with XML_PARSE_HUGE
- Fix overflow check in SAX2.c

https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.10.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 4d24c60132..00daa21a83 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.10/libxml2-2.10.2.sha256sum
-sha256  d240abe6da9c65cb1900dd9bf3a3501ccf88b3c2a1cb98317d03f272dda5b265  libxml2-2.10.2.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.10/libxml2-2.10.3.sha256sum
+sha256  5d2cc3d78bec3dbe212a9d7fa629ada25a7da928af432c93060ff5c17ee28a9c  libxml2-2.10.3.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 37a4396cbe..321e8b756b 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.10
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
