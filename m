Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DE9C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB93409E9;
	Mon, 13 Feb 2023 18:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB93409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmaAd116SsQE; Mon, 13 Feb 2023 18:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCA53409D5;
	Mon, 13 Feb 2023 18:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCA53409D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5A651BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F39C6103D
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F39C6103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2UKYZ-XqqHI for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:11:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C4B160FAA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C4B160FAA
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:11:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so8681176wmp.1
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=irnr6uIrmoTzgq1waasXSTArsgDtg721LvTz3b+koh8=;
 b=5CDvZJuNl2dM3QbEh4tCHmKmCsRGGOWOElFiZP+3Yo175qJxachDSsl5c9oIUnYWFI
 WDSuvmx1soYgYvAiagGNY/mSXCBVL/wiIlkQiyIiC1z0+gQjKytGcEHJeoFhtYHfYgao
 7xvWCDli6GU5Oaj8a9Cl6/UdljQS1bs53Z3QubGkjdenga3Dx7hJY+o2IEuD8AlIRz8A
 NCJaowJox69YwNdsLA/Lur3X+dpIUy42MyEi3kT8tCkJuTMXzbP33J5pgxkZYfMdwlOx
 2/7FdWXDPSoXM67s+5o1e0X43uxXFxs2HliEGWPEV5+FgC9ByyCvdA05t1cvhDb5/jk4
 7WLg==
X-Gm-Message-State: AO0yUKUZ4sZG3uUH/BMuhsLoH5MeZmRs9gott2slPl7Q7KhVZ1KRP18g
 0hrtbO3/I0tuxSPYX/DYGa5HwXoMhCQ=
X-Google-Smtp-Source: AK7set8xEGAUesMKQdHnFjO399s1Y9wr86JlmZ3Nqgv0EG6MaQv1CA7lsgIL2jYMh5YgCdguYk71yQ==
X-Received: by 2002:a05:600c:3085:b0:3e0:99:b59d with SMTP id
 g5-20020a05600c308500b003e00099b59dmr19551325wmn.21.1676311885223; 
 Mon, 13 Feb 2023 10:11:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w19-20020a05600c475300b003dc433355aasm16044460wmo.18.2023.02.13.10.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:11:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:11:20 +0100
Message-Id: <20230213181120.907459-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=irnr6uIrmoTzgq1waasXSTArsgDtg721LvTz3b+koh8=;
 b=JMk8MLKZ+nAqESJYXgjiuLWf9KK/912ewZCxPlpVAX6BoziX32L9KClaQTDYJ8pnvb
 Tuwv9TZe565dyxQBgQoj2JDHFovvU/PRuxGQlnIxVwiZJprS4Lnq+zXOtDar2uY5L1D1
 a7O5YovRut02p3KcP8cDVsJDhA0DxlJ7SiFsqht/u1tw6+oceFFiMfGQCeE6G+xvHnai
 A5dauY+jcGKOY8VLrfbjui1DvcxvZJflXwP7umpxWzfxgH+c67TPNBqlIe0c3T/+t8Ze
 2LqpjPGQkzpzABaHaisBucElcJiV1JJ5wu+bU1CXR0aRu1JsaoEayHVI6dvz1urfBmtb
 Qi6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JMk8MLKZ
Subject: [Buildroot] [PATCH 1/1] package/pipewire: compress-offload needs
 kernel >= 5.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SND_AUDIOCODEC_A{LAC,PE} are only available since kernel 5.7 and
https://github.com/torvalds/linux/commit/0f546d6f0292fb624b4cf0cc70096ddb9ea070e6
resulting in the following build failure since bump to version 0.3.65
in commit 247e2d0eb1e60f483044d58bed58c5ed321528f7 and
https://git.buildroot.net/buildroot/commit/?id=247e2d0eb1e60f483044d58bed58c5ed321528f7:

../spa/plugins/alsa/alsa-compress-offload-sink.c:183:11: error: 'SND_AUDIOCODEC_ALAC' undeclared here (not in a function); did you mean 'SND_AUDIOCODEC_AAC'?
  183 |         { SND_AUDIOCODEC_ALAC, },
      |           ^~~~~~~~~~~~~~~~~~~
      |           SND_AUDIOCODEC_AAC

Moreover, flac_d is also only available since kernel 5.5 and
https://github.com/torvalds/linux/commit/d2522335c92c090bf58531a2b696d7fe80ab2a7a

Fixes:
 - http://autobuild.buildroot.org/results/9ecd9aca5edc3756154da59573157954f06e6537

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/Config.in   | 12 ++++++++++++
 package/pipewire/pipewire.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index f038291e87..4929e5d3d1 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_PIPEWIRE
 
 if BR2_PACKAGE_PIPEWIRE
 
+config BR2_PACKAGE_PIPEWIRE_COMPRESS_OFFLOAD
+	bool "pipewire Compress-Offload"
+	depends on !BR2_STATIC_LIBS # tinycompress
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+	select BR2_PACKAGE_TINYCOMPRESS
+	help
+	  Enable ALSA Compress-Offload support
+
+comment "pipewire Compress-Offload needs a toolchain w/ dynamic library, headers >= 5.7"
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+
 config BR2_PACKAGE_PIPEWIRE_EXAMPLES
 	bool "pipewire examples"
 	help
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 976d7783b9..ecf4a035ec 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -215,7 +215,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_TINYCOMPRESS),y)
+ifeq ($(BR2_PACKAGE_PIPEWIRE_COMPRESS_OFFLOAD),y)
 PIPEWIRE_CONF_OPTS += -Dcompress-offload=enabled
 PIPEWIRE_DEPENDENCIES += tinycompress
 else
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
