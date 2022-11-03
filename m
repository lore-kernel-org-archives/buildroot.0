Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D076C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 351A941813;
	Thu,  3 Nov 2022 13:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 351A941813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8HFs2Ur28j6; Thu,  3 Nov 2022 13:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C073741802;
	Thu,  3 Nov 2022 13:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C073741802
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31C121BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A1A9404A1
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1A9404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xg7uwx0paFOV for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:52:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D8940297
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2D8940297
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:52:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z14so2864976wrn.7
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fryaRC4dmogSW5QOFD30GF1YGkkCQ6yjRWekxGf9ezo=;
 b=LxsJ7zcCy/TSYKLE4QoleHskMRmOtiYpqKQ2icLthEoePzBxUx9SMnZn50+ALQCDTl
 U8HDAqhIcNweN+NqXWIL3leT/RA67Cx6N2H1Q2ekvdEE89t4/Xk0/XlD5IsJkUkPGKyb
 GRwgPyCiX3nG5vUi6tula3ilidVaU3DMkBU+93dXdSGt6bkq0UCG38kmF030vjtApowq
 1xVL0dN5aX3iDO3Pbe/tzGfqDUlb4ZFHDDHMwUHII3pw4zfqZUlN2iN5ZwYAj/Gwz93z
 iVQjHXIk8UogySWx/qLH+mDZA1c8ZF1D1JzcZWYSHe1+7/5o6NIfL0FrlUT/ioyg42mb
 1lDQ==
X-Gm-Message-State: ACrzQf1pTxc8hRxQbrBx4OzOkym3uz1yxHvhjTmFi4DNk76pKESvGQNJ
 UmUPtbzdxhUSvjO/JDenEwtT9D629xU=
X-Google-Smtp-Source: AMsMyM4MSOwWds5BEhZG80VnbSv+Ks3P+3PBqDLTYwiNPzHtd4nii2nQY9uXlj+i78/fn0CiytDOJA==
X-Received: by 2002:adf:dbc5:0:b0:22c:c605:3b81 with SMTP id
 e5-20020adfdbc5000000b0022cc6053b81mr18843759wrj.218.1667483522539; 
 Thu, 03 Nov 2022 06:52:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r8-20020adfa148000000b00236722ebe66sm897981wrr.75.2022.11.03.06.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:52:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:51:59 +0100
Message-Id: <20221103135159.825586-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fryaRC4dmogSW5QOFD30GF1YGkkCQ6yjRWekxGf9ezo=;
 b=TH90RtTTYd4+A2id6s69la1KlZNet3l0sDy6hbLg6PECI3L7whni0pAV3bUBFiVtnR
 MMINwZXVO/H26in7ZlMvHJQI51vC8wObBt8ycXzyVIH9kSokPZqdeHm29DyxMjF/hwVg
 GVYMMJ6uATIkl3bHTFAsl4W4q+PlItQn83izKjHn4zy07ukbtZv9sXposS78OkCOfiKU
 gpPM8L5g4Hi2LK4QoTMnbv0JKwqd9tnCwNr+Eh98k5gtm8EKbBXpW8VSKLJpfr9pkkFT
 svpiS0W7siJmIXp10VgGN+iQy3+wXTMA8njMTdc9VsL61sJoKJeEjqWf9C0mFIuE+s5a
 2tWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TH90RtTT
Subject: [Buildroot] [PATCH 1/1] package/libidn2: fix build with libunistring
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libunistring raised since the
addition of the package in commit
ffb85a4a16df94e4980057a194e5fdc3c8332e32:

/home/autobuild/autobuild/instance-2/output-1/per-package/libidn2/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: warning: libunistring.so.2, needed by ../lib/.libs/libidn2.so, not found (try using -rpath or -rpath-link)
/home/autobuild/autobuild/instance-2/output-1/per-package/libidn2/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../lib/.libs/libidn2.so: undefined reference to `u8_strconv_to_encoding'

[...]

aarch64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

Fixes:
 - http://autobuild.buildroot.org/results/30ac50512cd4b4cb3ecc97514a72d1f316a1b33a
 - http://autobuild.buildroot.org/results/c225ff4ef007b9a3ca56e6b601687aaa33699675

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 9d72998149..9d24e93d27 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -13,10 +13,12 @@ LIBIDN2_DEPENDENCIES = \
 	host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN2_CONF_OPTS = --without-included-libunistring
 LIBIDN2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
 LIBIDN2_DEPENDENCIES += libunistring
+LIBIDN2_CONF_OPTS += --with-libunistring-prefix=$(STAGING_DIR)/usr/lib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN2_BINARY),)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
