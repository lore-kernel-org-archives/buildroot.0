Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5564CC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B0D5416BC;
	Wed, 22 Feb 2023 16:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B0D5416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlJxaMBdDy8t; Wed, 22 Feb 2023 16:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E2E0416E7;
	Wed, 22 Feb 2023 16:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E2E0416E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75B4A1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D31E61179
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D31E61179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JJDJz_FWARD for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:05:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362066116E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 362066116E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:05:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3922661wmi.3
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 08:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFv/l/uLloZTA0q2HaP1zNkP2LXzLWX3p/oERUftiXA=;
 b=CY8gWL73r9x+SGE23ypSvDI91m6TbRNz4GWWi8QlE9Nij6ZPRRcXMTsL9ltTtxEUy5
 kWsrV8AanQoq6u1QUpJ1MZZrs4CCUMj3C2floKegJGYl5TB+yqs1UkHVvh+QfK6dPKv7
 3e3P3la0tRweUbfbyPwpNV4Kc0A2x4Afty2NeQVo3xO5wM6P7VWTCi70RkiY1JFP7wJN
 i7DhhDL1yNhTdyHOd4piP463nVOBhPjUgrW/pJc5gwXTC+Knw3Uw8aMTjdBxzVPX2kaw
 MPdEBnROqGGiTSx392b7tUJbIDmV4tVzHciFCX/2HTzD8ouPNLQdezhWqegqQZvR+2yi
 An2w==
X-Gm-Message-State: AO0yUKVFWDj2N99lUpymGMeJvGkxGprfN4G34PqtJrynHPoGSqvYhs/r
 ZrG0WJK9OzQB3OwqOc71zy9ZXZN4ylc=
X-Google-Smtp-Source: AK7set84C1K4t/Lri6R9e7Y5TbqjkWhYOhp3+J/fuQ4featZHPpWo2dVOHZqNOEuug0WhDqX/x0iJw==
X-Received: by 2002:a05:600c:2ad6:b0:3df:f7f3:d007 with SMTP id
 t22-20020a05600c2ad600b003dff7f3d007mr6226738wme.17.1677081928980; 
 Wed, 22 Feb 2023 08:05:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003e209b45f6bsm6490531wmc.29.2023.02.22.08.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:05:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:05:14 +0100
Message-Id: <20230222160514.2069544-5-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFv/l/uLloZTA0q2HaP1zNkP2LXzLWX3p/oERUftiXA=;
 b=I+Bx4FBjRfk4aZlTJAHm2qW4QJOjK3cqNg5fULlTBGIi8egMIowK/8mdOAEzfpLONL
 I70h0sjDXo6oRnYLGEKdnK/4dpluFw08O6PlNhIFLDLEGjRftBGSKn2iztDRy4uR/dOo
 vNpPJGxmepDlyOVvMFW5WybTMKnMsCOj3Y1L3BJjbUomCpeUdJ38CxOsLoQHWddcJTFf
 LUZs04w2LPB/mODfiQdpDOIaSd3TwI1G4cSCjiEZmAqLm45N87WD1E0zudXv+RAMjunG
 aHk6cnPnIp15GISoZXu3bcNtmWaw8+zPzyPI+87pHdWhG7Bt+zC6rNrVNRRSPHQ4aiSy
 mVNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I+Bx4FBj
Subject: [Buildroot] [PATCH 5/5] package/gqrx: bump to version 2.15.9
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

This bump will fix the following build failure raised since bump pf
gnuradio to version 3.10.4.0 in commit
e37c110bead8b7b35cd97915673fa785ccb39f2d:

In file included from /home/buildroot/autobuild/instance-2/output-1/build/gqrx-2.14.4/src/applications/gqrx/receiver.cpp:32:
/home/buildroot/autobuild/instance-2/output-1/build/gqrx-2.14.4/src/applications/gqrx/receiver.h:34:10: fatal error: gnuradio/blocks/wavfile_sink.h: No such file or directory
   34 | #include <gnuradio/blocks/wavfile_sink.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/gqrx-sdr/gqrx/blob/v2.15.9/resources/news.txt

Fixes:
 - http://autobuild.buildroot.org/results/42b5ab2e555063273ea55fd1c09a9be6d8b620e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gqrx/Config.in | 2 ++
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 442b28e546..97f0b7de07 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -34,7 +34,9 @@ config BR2_PACKAGE_GQRX
 	select BR2_PACKAGE_GNURADIO_DIGITAL
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
+	select BR2_PACKAGE_GNURADIO_NETWORK
 	select BR2_PACKAGE_GR_OSMOSDR
+	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 1991dfea82..567ff947f9 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  aec35c77ebde9c71a5f973c509eec3d6aa2f18a6e052b180fcd9029d88273e5b  gqrx-2.14.4.tar.gz
+sha256  4a826b468b2fb38a59cbe1f1b566e62c3114509186a7a25ba27dc92833f3eb44  gqrx-2.15.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index 4d464298ca..d2518213b8 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.14.4
+GQRX_VERSION = 2.15.9
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
+GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr libsndfile qt5base qt5svg
 
 GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
