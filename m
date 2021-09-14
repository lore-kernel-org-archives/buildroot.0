Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E250C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB26960F25
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB26960F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64DD940144;
	Tue, 14 Sep 2021 16:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywG-08v1RLV7; Tue, 14 Sep 2021 16:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F98C4017E;
	Tue, 14 Sep 2021 16:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45CE31BF42E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AE5402C8
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mayshV7EU-8d for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 16:22:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32071402C2
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 16:22:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b10so23508973ejg.11
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=VVlrrP6L5rm1tEgnWSDmbPtwqk5lwm7m4b9jjIkT2wo=;
 b=TVKZ8IYYcWHdgEVa27GxZ5urQSvgwxbE17w2FCj+JVgr89ymZJI3seQtQyRnESxOjF
 V2BqZFSI9SEHqp/VDLH9mVRCgJoQ2gyAQhhEZ3OSqxCdpM+vufIdUETv6o+i9nPEVyP8
 PFXXl/lNi2oT/FQIt1E5wpezE+6a++96UpceKJYrexusWqdd81iqbF6V0KRqwbHbegEu
 qz2UppCTVb2MahwM6qKsCgBEIpY8Wttqm+0I/RoXAsh+syLR2FadDqqUdLMu5kJ2YomE
 o35U+f6fgLtTWZgnOZOo1KYr8Ckrov0h4h3RIVHyRqNvKlWNwTG4rub/0CK9UIiGGuNH
 X9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VVlrrP6L5rm1tEgnWSDmbPtwqk5lwm7m4b9jjIkT2wo=;
 b=WIUf8mnoTyXUDA1fwlgeyNxE6OCZEph/2yjSgl1Kpb8GqRkXvfBQuTnTed4JNU9Uju
 rA+OOCu3nuvN8hUOY3Be6F6o4YzwVcc6R6SBGDnWDk3kzI/Gc3jx2tH8yD88TPQL6rLn
 h2pjuYOGQORd+BWoIgComA27aCJSdMjMmbqAHr1ktF+y7Mw93wl1sLlqFm2EgcHKcISO
 HmMnQ/koUeuce0W1JN1lmDtdKXHROAjpUDlRpjlqo9nDFYL9AHvjl0oxnoAeahpkkJhY
 uwJHcmXwjvTMTDMlrLmDmS6g0+6oQV4UUlSHK8ci+Wm0F/UguPc1OBPiz9ptxSvfn2xT
 kzmg==
X-Gm-Message-State: AOAM531blwKY2Iu7XqUMBSrxHL1XFbAafZfvEGnDHReYt5ryr0MdoLdh
 FoPQr7gYui4/qi6dI7YpNymyEg8XmdY=
X-Google-Smtp-Source: ABdhPJyzuB2rpyHIv2mU1okx/iauwWy14uJEHmoR4tPZJQUZUAjqaqlC9KIlg3mHxGIgl9x5VphdcQ==
X-Received: by 2002:a17:906:1454:: with SMTP id
 q20mr20362599ejc.446.1631636530212; 
 Tue, 14 Sep 2021 09:22:10 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id i6sm5095424ejr.68.2021.09.14.09.22.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:22:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 18:21:58 +0200
Message-Id: <20210914162158.15045-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/libqmi: bump to version 1.30.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: yegorslists--- via buildroot <buildroot@lists.buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove the upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...build-meson-fix-introspection-option.patch | 33 -------------------
 package/libqmi/libqmi.hash                    |  2 +-
 package/libqmi/libqmi.mk                      |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/libqmi/0001-build-meson-fix-introspection-option.patch

diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
deleted file mode 100644
index 0528868025..0000000000
--- a/package/libqmi/0001-build-meson-fix-introspection-option.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Fri, 6 Aug 2021 10:32:22 +0200
-Subject: [PATCH] build,meson: fix introspection option
-
-Using -Dintrospection=false would actually not disable it. There is no
-longer an "auto" option for the introspection support, it will be
-either enabled or disabled depending on what the user asks
-for (default enabled).
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- meson.build | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b25bca57..d28e5601 100644
---- a/meson.build
-+++ b/meson.build
-@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
- version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
-
- # introspection support
--enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
-+enable_gir = get_option('introspection')
-+if enable_gir
-+  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
-+endif
-
- random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
-
---
-2.17.0
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 0373bb4e75..1f2da45ac0 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
+sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 05fd3ae9af..cd2c2719f9 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.0
+LIBQMI_VERSION = 1.30.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
