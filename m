Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198D6C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 22:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89DB441879;
	Wed, 16 Nov 2022 22:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DB441879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAwYh6SKNZbb; Wed, 16 Nov 2022 22:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7167F4184D;
	Wed, 16 Nov 2022 22:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7167F4184D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5AE61BF473
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 22:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0DB04011A
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 22:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0DB04011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlPtoeq7FAe9 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 22:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66201400B8
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66201400B8
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 22:29:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d9so27660229wrm.13
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 14:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uayWjq0JeX9BO7uIEUwkFypZ4WzC0O7IhD9KU3L8HXI=;
 b=gkNsCyefUTHjSNlE8Sq2QDPtIrL1DREXC1dgu2QLUTcyFonZtkkomVU0M6vHSQPEEO
 lY0IyL8dHC87TJiUziteaUmnTYOMvf7Vxgvc/gf3yqQBi3007tzk6YV/Rp9X0U4bQiQU
 pqdafFEyz0/Y/0OtJR5gKizOxFlWFTB4pnpOnaSl2uusqdMLGm250w9h5ri278D841fi
 rPki/tKnErL+2VgtYwZoO0f8/J7DdTYzd7xDXs+2Z+WFiqOBwNIQhfa40oLZo8p4986a
 Hs0E6FUvEW3MnB4ZI/cIxI2UiZpeTOzv0YK83vWtmwXt/d8fY3TmI6PySpnCdKw615ZA
 N+aQ==
X-Gm-Message-State: ANoB5pkCkMf8PajDlkrvQ2U6TvXIwtzzs69FoRPEoZA04aKhtsiifj83
 55QRQqxq2OtFCYDDVnSoPS8Ootdpa7Q=
X-Google-Smtp-Source: AA0mqf7YCd2IfG5w7F2lzUbdLHttYy6RFCVcP4hPPGpgTawoMizUX1ffiR246c5FdLTw9u8/IjUoGQ==
X-Received: by 2002:a5d:58c3:0:b0:238:8896:7876 with SMTP id
 o3-20020a5d58c3000000b0023888967876mr15076280wrf.645.1668637751387; 
 Wed, 16 Nov 2022 14:29:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003cfd4a50d5asm3730272wmq.34.2022.11.16.14.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 14:29:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 23:29:08 +0100
Message-Id: <20221116222908.26711-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uayWjq0JeX9BO7uIEUwkFypZ4WzC0O7IhD9KU3L8HXI=;
 b=cozG/SuE0ybosro9OUgJHC67yk3Eyd/ZJOOgDRsbwYeIvbNbEszoNRtZtg+hKmwQDY
 4YET0GVh6d9peMtr4ANXIXPMXUX7BDj6cbqYZP+ChULTHhYS8eVFI2aOEl376JAxNYCD
 orJNk0bZhkBLBru9sEklm4WuUOc7yNKLiCFF+VTqkQ5dKLByCNNKzZo/M+GXX7o8i+Sr
 LVU+yYJRN+B8cEebaYB7sfvKxJsezzt1hNVEu1V3LbZe0WteeD38PVwcX7MFYR0csUz8
 d2gSlAsnD7E9a1ZWah6YWpfQvpusPKEDiTbsJNJxdffsm+mGHjpDwZXkxgZLQRVFYZaa
 fOpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cozG/SuE
Subject: [Buildroot] [PATCH 1/1] package/rsync: fix configure options
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rename configure options to avoid the following build failure raised
since bump to version 3.2.5 in commit
ae2807821d897c16141d003f646475fee9e77cba:

./simd-checksum-x86_64.cpp: In function 'uint32_t get_checksum1_cpp(char*, int32_t)':
./simd-checksum-x86_64.cpp:89:52: error: multiversioning needs 'ifunc' which is not supported on this target
   89 | __attribute__ ((target("default"))) MVSTATIC int32 get_checksum1_avx2_64(schar* buf, int32 len, int32 i, uint32* ps1, uint32* ps2) { return i; }
      |                                                    ^~~~~~~~~~~~~~~~~~~~~
./simd-checksum-x86_64.cpp:480:1: error: use of multiversioned function without a default
  480 | }
      | ^
If you can't fix the issue, re-run ./configure with --disable-roll-simd.

Fixes:
 - http://autobuild.buildroot.org/results/069da8e585da2e51bfd4f475cc12b9a134954b08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsync/rsync.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 7ff7ca6eef..8c7ad462ac 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -17,12 +17,12 @@ RSYNC_CONF_ENV = rsync_cv_HAVE_C99_VSNPRINTF=yes
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no \
-	--disable-simd \
+	--disable-roll-simd \
 	--disable-openssl \
 	--disable-xxhash \
 	--disable-zstd \
 	--disable-lz4 \
-	--disable-asm
+	--disable-md5-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
