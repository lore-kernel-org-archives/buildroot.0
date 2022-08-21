Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4271EC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E353409DE;
	Sun, 21 Aug 2022 15:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E353409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GW9LvD2p2Bq3; Sun, 21 Aug 2022 15:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B48140994;
	Sun, 21 Aug 2022 15:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B48140994
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10F571BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E007260BA8
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E007260BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xu1BAcRvjoIL for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:27:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB3560B97
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDB3560B97
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:27:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k9so10470638wri.0
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=YPXHg0kZwhuIHo2a3HCNReWxXMxM5RMWiYCAAGUn+OQ=;
 b=nuTxg1xoZiZvDBwtACziWKXxnp756QewY3AOefiOhLQb6B0eAdbM+nfKZQQgduQK1c
 5aaBMdSAwNK9Frhea/XvHkmwYQEhxXNnyO2EVq5MQkRGB/YAucEuwlQSntgzH0vCPwsj
 qUTXSwHZv0keEoXBlLSlNVC37J/+SP9QjOpzhpqbioDMBxGfxt01Wuu5vi5aJfkLSgl7
 76pum7/hjX1jlxp5Sankvjs71EQbMhnBsiakshGCh60OfMUDAU2SE4VjSD6n/wpx8UOU
 Udwg9S2OmF1AaHMTk29VJwioS4pDtRNIMdbPnNvbpeCtkIYjv/ALe33Fw/2p91fQjBiR
 FOGg==
X-Gm-Message-State: ACgBeo17Uq6HQVxyIR/ViNqESWCjrWc3HgB989vrQHueZ864qx4i2mvb
 jAkaC7EDDwHtW1TvjLOTwz9NAugJzSI=
X-Google-Smtp-Source: AA6agR4tiK3szW9UcG4sYyc1H2uf/9nHPLyMTHFnubwb2bnJjszNyOD55SVNmTKIcxqY8lNGmvYfdA==
X-Received: by 2002:adf:db85:0:b0:225:2d24:9455 with SMTP id
 u5-20020adfdb85000000b002252d249455mr9071224wri.711.1661095673900; 
 Sun, 21 Aug 2022 08:27:53 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b003a31ca9dfb6sm16449694wmq.32.2022.08.21.08.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 08:27:53 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 17:27:49 +0200
Message-Id: <20220821152749.239482-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=YPXHg0kZwhuIHo2a3HCNReWxXMxM5RMWiYCAAGUn+OQ=;
 b=P+ZFa/rYogBtRRYKS4FjDf0lFh8BxWu7GV3pBKm+94MQsvMzfYMaNKZUB7AvwddqiK
 dt4xQsVU/AQdbtlSU+C6xxuVAFwGD38D39K1ec+2jvUtWD8KMZkT+cbQl1ajPgM9m+x9
 688lJXGWDEjQ/eDm6sVhv09OnQrQAZyaWW8ZWZ06z1AyY0HuPJTOcToTjT1oKdkwiIwy
 4IoVPl7SpQXVsGwNEcVg5pSqLrdQrM3eTn/G3w5NVLT1XRzAMU4q010GIjawjaauxI7Q
 8iosyJphmzGycQsYsaedrnsIVXRMZtiUSXw8VtChlxeLLdxlZeID8X07HQUm2UFtdlfN
 n8gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P+ZFa/rY
Subject: [Buildroot] [PATCH] package/gcc: disable gcc D front-end with gcc 12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"The D front-end is now itself written in D, in order to build GDC, you
will need a working GDC compiler (GCC version 9.1 or later)." [1]

So we have to check if a D compiler is available on the host.

Fixes:
http://autobuild.buildroot.org/results/36a/36aa22e458d53ab8687b3a79ffeb65b18e8ac6e7/host-gcc-final-12.1.0/build

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5fee5ec362f7a243f459e6378fd49dfc89dc9fb5

http://lists.busybox.net/pipermail/buildroot/2022-August/648841.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/gcc/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 746f4df434..147f0766fb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -77,6 +77,10 @@ config BR2_GCC_SUPPORTS_DLANG
 	default y if BR2_riscv && !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# "The D front-end is now itself written in D, in order to build GDC, you
+	# will need a working GDC compiler (GCC version 9.1 or later)."
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5fee5ec362f7a243f459e6378fd49dfc89dc9fb5
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 config BR2_GCC_VERSION
 	string
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
