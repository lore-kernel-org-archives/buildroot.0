Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00370C6379F
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 10:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69FCC418EB;
	Wed, 22 Feb 2023 10:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FCC418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHaBw7IVx54I; Wed, 22 Feb 2023 10:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1F0418D6;
	Wed, 22 Feb 2023 10:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C1F0418D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC6541BF392
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 10:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4D7240FE2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 10:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D7240FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUfcPFkV8lBc for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 10:40:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB7044100E
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB7044100E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 10:40:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n2so6152582lfb.12
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 02:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Alh7Ju+kcrLzGwUaoizdXV4AstnH2Va7T7juEqmN18M=;
 b=z92Jv53S5WWTwpX76AfQoPsShvYT80VvyzvFG0M8gtQYs2slnWxZ/MzQAAz7Cp1w3K
 RBpQz9mYw++xdOBvIg1mpE3YENTslbo+g5QPC8fLBKc8o1BQnJX9ran9OVmlDonOHdhl
 BwCpWNpZcxqCfwQJq91wOBlCmQJfGVWgQ5l/xbyadYxjailKc46IfPlMqSysTaCT+W8v
 JRy648q47yZf9AnfElWkXeSEsE1YW/wXTVKMhRVv2E9KJt/1Yo+J4G0kPjiOC8Rvyg6l
 J7GfOykfK6f5q20JROv0+kHHb2tP+o/eaT9mK+SFJuObwlF42vwhyDf7DkomqdR9qCny
 SHTw==
X-Gm-Message-State: AO0yUKWNC7AMC4orLzT1UzPfa2+aB3DIL53VMgvQZZ62da54dJ6SQ9VE
 shxHQMBOMHD+nsvTzAsdWBpUaacujHM=
X-Google-Smtp-Source: AK7set9kG04MxptNt8OsL14V1L3w6fU3dtxZwSDvagDOr2ms1HNZq0oEfE7nuCKCFnxasSbkT2FIKQ==
X-Received: by 2002:ac2:55b2:0:b0:4cb:4571:9efe with SMTP id
 y18-20020ac255b2000000b004cb45719efemr2845816lfg.35.1677062409851; 
 Wed, 22 Feb 2023 02:40:09 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 r11-20020ac25a4b000000b004d53e991be0sm2151251lfn.146.2023.02.22.02.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 02:40:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Feb 2023 11:39:17 +0100
Message-Id: <20230222103917.2709112-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Alh7Ju+kcrLzGwUaoizdXV4AstnH2Va7T7juEqmN18M=;
 b=ZbQkFrtf+69wUMKAmExuGFxhdNaWeK0Z86ZsG01Uu2VnCR3zQNe2lCgT5/ezHsAxmd
 Ke3Sm+cZ9BIZHW4wzmfCNIV0CA27qMvHBV0+7eYI5/S2jcF244FcERUlwEKNGKjqLXvJ
 oQV6ymhRuSb0JH15eEKiUdgUksAr+NF1n1z09In2Sq9YClpfIZQ7thAE/eEk45YHeIYp
 8X7yumHB6ErD4ZF3ouArhesBCKLQYd3AndocYgkgZPClD8AyDYR5/szIDq/Tpcqb/SjW
 E/G53Xr2GzrvYrk4+tTnvT/TbrS1ZB/XntK+Ghc1D+NRMuwad1YiEh5W8fgjPTyROET9
 s48A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZbQkFrtf
Subject: [Buildroot] [PATCH v3] package/libcamera-apps: enable LIBAV only if
 libdrm and ffmpeg is present
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
does enable LIBAV by default which depends on libdrm and ffpmeg.

Fixes:
- http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/

/home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
   13 | #include <libdrm/drm_fourcc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v3:
        - Only enable libav if both libdrm and ffmpeg is selected
        - Tested with these four combinations:
            - libcamera-apps enabled, ffmpeg disabled, libdrm disabled
            - libcamera-apps enabled, ffmpeg enabled, libdrm disabled
            - libcamera-apps enabled, ffmpeg disabled, libdrm enabled
            - libcamera-apps enabled, ffmpeg enabled, libdrm enabled
    
    v2:
        -Add dependency to ffmpeg

 package/libcamera-apps/libcamera-apps.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 290ee9a026..fe402ec3f4 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -29,6 +29,13 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBDRM),yy)
+LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
+else
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
