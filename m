Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CFFECAAA2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE248415F0;
	Sun, 28 Aug 2022 22:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE248415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJb74EIxorqV; Sun, 28 Aug 2022 22:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19BD415EB;
	Sun, 28 Aug 2022 22:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19BD415EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 350FD1BF35F
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E1B4415EB
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 22:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E1B4415EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkY3UJs9KbEd for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 22:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD629415EA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD629415EA
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 22:17:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so5271439wmk.1
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 15:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8IIYyK8IVwAMeoztakc6ElW1C/0KrLsmRT05/LfvVCw=;
 b=jKSwRvhcXET+rF9j4H0qRlGaOJxv2kXZiHDu0Nrq0SvspkJChHCiFtjP5vFH8x0vbM
 yloDFF1mSB9tUC1bjboUMISt9kFitxLLTKvcko0N/1GbkiEDiNztbXWL13v7/jxW4BfR
 1Nu4X8pmFkqiwwAlWN5QGPheAhU2YjUc5ih6cE2t1lmsiUli1JCm++RYKwZ1Cmhhqtj3
 E4Kg7DIG23s2OqgqC2PYVlkupjc62m1KKKtkj5rGnD2ckm2iA2cwYhDrQ5TZSVmon3KS
 nvrDkDFL+0+6/cIA/HmLSOHawCVRGQdp0csldSdT6UutMYRF1upfGhFwlCZwQAGMSJqN
 AebA==
X-Gm-Message-State: ACgBeo28m9ou9L/UZaeL0jShGZR2lU4/nLPNDztgZ48XPEJChtKMNvcl
 8CAb7e7iWeZtNGfG7Uuhqp8SJ33G9oY=
X-Google-Smtp-Source: AA6agR44WqzLLcwJ9DBqmIUE3f1NLZQbj9GVjnz4V4HtXfwCFXNoZiiPYU7b4PiN1NSWhcJl41puUw==
X-Received: by 2002:a05:600c:3c9b:b0:3a6:58b2:b80 with SMTP id
 bg27-20020a05600c3c9b00b003a658b20b80mr5288863wmb.132.1661725032764; 
 Sun, 28 Aug 2022 15:17:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0a4a00b003a845621c5bsm2144497wmq.34.2022.08.28.15.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 15:17:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 00:17:05 +0200
Message-Id: <20220828221705.58756-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8IIYyK8IVwAMeoztakc6ElW1C/0KrLsmRT05/LfvVCw=;
 b=XFaZAX90JLlcElT18dyPR9NXB8zOI2usXArzj6JgXOMYjpphlhN6ICPDIrhOeFYZO8
 B6naArMd3DElfCNnN8Qx+UNFtXWyfAccbsUTppR0glfNJmHtSDKFr4Qt0JKXrv1N1W3n
 yznDgG4c1T0PPDPW3Oeqzysr2o19DyZ9Z9F25fRmcMXnU4jWDCX7JWLOE7FoTwSSl7pJ
 PN408gWPbb2Tm3mm4oo+VEahxUD53zIk0nsoIYwDr6o3Hxet3BKCXcsVCd26YhCw9KoJ
 Rhw+tI2MYZ/nIKCzxXr51SGS26KJTbIxsp0uTkEyBo4vW/XvFQU7UwZpQu4XZQ7bxCZK
 nzBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XFaZAX90
Subject: [Buildroot] [PATCH 1/1] package/collectd: disable libupsclient
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable libupsclient to avoid the following build failure if
libupsclient is installed on host:

src/nut.c:40:2: error: #error "Unable to determine the UPS connection type."
   40 | #error "Unable to determine the UPS connection type."
      |  ^~~~~
src/nut.c:46:3: error: unknown type name 'collectd_upsconn_t'
   46 |   collectd_upsconn_t *conn;
      |   ^~~~~~~~~~~~~~~~~~

libupsclient is an optional dependency of nut plugin since version
5.10.0 and
https://github.com/collectd/collectd/commit/bc2d94024d0250211c1e498db1b43bb4525324da

Fixes:
 - http://autobuild.buildroot.org/results/22b758097e8fb72c68e41329cbc7abc748d81ca6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5751757040..e0f40095aa 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -45,6 +45,7 @@ COLLECTD_CONF_OPTS += \
 	--with-nan-emulation \
 	--with-fp-layout=$(COLLECTD_FP_LAYOUT) \
 	--with-perl-bindings=no \
+	--without-libupsclient \
 	--disable-werror \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
