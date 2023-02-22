Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73EAC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 866AC416B0;
	Wed, 22 Feb 2023 16:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 866AC416B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jURklVXtqZxj; Wed, 22 Feb 2023 16:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E3740108;
	Wed, 22 Feb 2023 16:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E3740108
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBCFF1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B448C61179
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B448C61179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0QaX0UyCGLY for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A96E06116E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A96E06116E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:05:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso6838687wmq.4
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 08:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iAFssU4DrciiJDpgmIflUB46Ci9r4TS792NgHeVgt6U=;
 b=Jy5t4JJERN+0WZjtdGM8184lLTebppAKDLmBeHeeraWLom/1cze5enbwhVtiEyMuTu
 7aTki4ryXWvK7iLoJIsBT9pNofG2w/4swNmGMvdXPuWQhkfXCMvTmDnCpowCyt5dRpnT
 gn9dS0jztIP43OkHsX+NbNaytPQDuSD3++BwzDLuB34uFscEybHEJr0AwoNxnSQu33Ip
 R1aV2CRO6t5xCBUhVTXvHjQk+eXuoo/cBzNTASpeI0N6Z6TveO4hrpP2xcErQtP378Yn
 XBPTU+Z6cB+B4bO63jMPXSPYU7xmI71UH/9jRz/l2dFnTekzsr1mP7XPmi25kp5eR0+M
 IvLg==
X-Gm-Message-State: AO0yUKWv36gwAq1B4FpWinU2W09ghU5b/Nq+oolOL6lgxQ8os8EkN3Pt
 f0lGI5aKgx5ll9lvhH9SVu/QG2j4N/w=
X-Google-Smtp-Source: AK7set+p5hv1t7L21aPj1jvgYPhSAuiwvI9Y3HXPV6NMQtbLBl6hXdXDBKASY0TQLlD8USdrZRl3vw==
X-Received: by 2002:a05:600c:2ad6:b0:3df:f2a5:49e0 with SMTP id
 t22-20020a05600c2ad600b003dff2a549e0mr7747341wme.40.1677081920303; 
 Wed, 22 Feb 2023 08:05:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003e209b45f6bsm6490531wmc.29.2023.02.22.08.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:05:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:05:10 +0100
Message-Id: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iAFssU4DrciiJDpgmIflUB46Ci9r4TS792NgHeVgt6U=;
 b=ZjyU2mxTQd0U4sMSJKXBRnYlQEm8Wm9sF7SCZrP3oXLXr5mxvhPz3ujWV7iRfBNny1
 7ou7GSAdq8xN9bj9RDNz4EyuAZ6eeIH44V3UHrcKjrNyCw8aI7OI0Hyil14PuAJNODL/
 XjLa4JmhtneAVPq3pbYKZ7sthJf/TecDs3Xt9PKmzxGhrz9ltbF3LU5rO3FRdvbrymtx
 e/NOuGC0RTMW2ZAbFbe7XH1FLnUI/2gIu4ef47xgfyK00dBs2CVZyRcjiVel6DG8XRvm
 5/7cN3gO3r7uFyK2m27biNZ7SSRGkqLkEiXvJglWt29080xyUfEts6fUIs9/Rn5yXg8Y
 dRwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZjyU2mxT
Subject: [Buildroot] [PATCH 1/5] package/gnuradio: drop unrecognized volk
 variables
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Volk submodule has been removed since version 3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/80c04479da962d048d41165081b026aafdaa0316

orc dependency can also be dropped as it was only used by volk submodule

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/gnuradio.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index cc41f1e12b..c2fcba9586 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -22,9 +22,7 @@ GNURADIO_DEPENDENCIES = \
 GNURADIO_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DENABLE_DEFAULT=OFF \
-	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
-	-DENABLE_INTERNAL_VOLK=OFF \
 	-DENABLE_TESTING=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
 
@@ -36,13 +34,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-ifeq ($(BR2_PACKAGE_ORC),y)
-GNURADIO_DEPENDENCIES += orc
-GNURADIO_CONF_OPTS += -DENABLE_ORC=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_ORC=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_ANALOG),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=ON
 else
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
