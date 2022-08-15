Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6EC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03EDE8246F;
	Mon, 15 Aug 2022 09:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03EDE8246F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pk_ibDwnZpDg; Mon, 15 Aug 2022 09:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EDC817B5;
	Mon, 15 Aug 2022 09:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50EDC817B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2BE61BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E1A340146
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E1A340146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgE5rCXGpgK5 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:41:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49BAF40120
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49BAF40120
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:41:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v3so8473740wrp.0
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=qXTpVnixm9BHUA9rtV0VdWUxcuV4bhIdc7lCUGbmf34=;
 b=71YbMlSQSKqNGGmhaZa3bryn7yOv4Cf09hIf9fsNft04A70nbOKQ7pi7/TbwRExJ2K
 tufpINNFD21QZoTtAFvi1e4ZO2SP2DE89QcsJDCK/I6OrU+8o+FvhMG3+4rKhEMzCLO5
 VvEGOv91w8qgJaFRyiFFp+pyF7RljNkwMK/RQRM2575R1aqbxPwGTWig8PXMWB9N6yzw
 14RX1zwEpYv1t2l5bnecCEpfftiiDQ/a1AotO7iImb/MMqSgPx/YIK9fzHAXniXc+irM
 g6jcgT3ohFA5ab0ncwFkYsOKV0PlVqEi4Y3TU1J1fQ7cTR2WpFsUQdqKXfyJU5aMug/s
 oDYA==
X-Gm-Message-State: ACgBeo1AQlEHDp+wV9qzk0f85FQjxMcm6PgTaM3CeGJNSQcqdghHdX9Q
 ZOzNptqhQfoUdM2VS1wWFq3qCR2FHbI=
X-Google-Smtp-Source: AA6agR4zGH2YITMhtBxqBQOVsYdf8tjyMFAQytT/NpSkafQAPlfKBIHabi+8Xb/Wv4QupFTnDEJf3w==
X-Received: by 2002:a05:6000:10d1:b0:220:5c89:50e5 with SMTP id
 b17-20020a05600010d100b002205c8950e5mr8482529wrx.335.1660556458221; 
 Mon, 15 Aug 2022 02:40:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a02a978cbcfe81d2.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a02a:978c:bcfe:81d2])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c478600b003a30fbde91dsm8601512wmo.20.2022.08.15.02.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:40:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:40:54 +0200
Message-Id: <20220815094054.291874-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=qXTpVnixm9BHUA9rtV0VdWUxcuV4bhIdc7lCUGbmf34=;
 b=l40t4LCUioIcCEDCatFCyLIuRc53GlikoVcmVFEpnAfC0WEVhjQY9jrEZJXhKKc3nB
 qxDbS5/WSw3DynK2aZtsys3TYK51Vw2ctDsXggYDC3w8hybiZLQAbLJ92EJsKGvu3+gP
 sdoivuoi/g1iw5NnN26gKbSocRK0mBKs6qMZQ3jLEreypFgsv8PmUo9F0Jew2UWY23wy
 75c1GGYToEE8l/ZA6wUcPjJbDt8aciIpRxg4EFyN50CfEkio8IjoJgzSwxTVDFu3a2BV
 ACxrauBW2cgao35WBMNkf7NFViqR/SaVcaVNfAknSLGy0glBgewrLL8rGxMUz/4MI4bZ
 hatg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l40t4LCU
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: set CROSS
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set CROSS variable otherwise makedumpfile will use it to undefine the
host architecture through -U__$(HOST_ARCH)__ if $(TARGET) is not equal
to $(HOST_ARCH). This will result in the following build failure since
the addition of the package in commit
adb64a97e79bcb4e28450dd858654003ec8706c3 if aarch64_be is cross-compiled
on a aarch64 host for example:

/home/autobuild/autobuild/instance-5/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -g -O2 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DVERSION='"1.7.0"' -DRELEASE_DATE='"8 Nov 2021"' -D__aarch64_be__ -U__aarch64__ -DUSELZO -c -o ./print_info.o print_info.c

[...]

makedumpfile.c: In function 'is_kvaddr':
makedumpfile.c:1547:46: error: 'KVBASE' undeclared (first use in this function)
 1547 |         return (addr >= (unsigned long long)(KVBASE));
      |                                              ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e4e10364e1a24099ce31bf20eacf5adedf93e5a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/makedumpfile/makedumpfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 8399e4d063..815a159b00 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -17,6 +17,7 @@ MAKEDUMPFILE_TARGET = $(BR2_ARCH)
 endif
 
 MAKEDUMPFILE_MAKE_OPTS = \
+	CROSS= \
 	TARGET=$(MAKEDUMPFILE_TARGET) \
 	LINKTYPE=dynamic
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
