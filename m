Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411F4C636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB566817B5;
	Mon, 13 Feb 2023 12:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB566817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjcW7HGqFL57; Mon, 13 Feb 2023 12:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A48817A4;
	Mon, 13 Feb 2023 12:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A48817A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2E741BF387
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8990B816F5
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 12:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8990B816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtjBmIgGUXqu for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 12:40:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F25F8139C
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F25F8139C
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 12:40:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id sa10so31443850ejc.9
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 04:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RaIMZIjL8ARIoWEeIEpguvDIgSTottzaFFhGVPLG7LQ=;
 b=BFCwHIYANQRAhzaZZw1Uxwrah55Kb3wIv7ypDPjaBUBwqVGcmTEW/d6j1TjshmDAYj
 cgUTCjHGt7Iq2ur3Kusx+riqC/o10ZquqxAg+8iZxVVRg/P7uWAL38GbplmsMcO4Zi0X
 NXVlXMqL8NtZCnSAR2IQ5myhLpJOVBSiwKzMpVKeWsNLlFndAsw7hR3KDWNzlxM8paAJ
 qBYCKurtdLRi3nCVbjS9HShPdIHt8jBkhX/EHSsLcpuZm/iNPNOOGwh1ybN+QLxjrTNs
 cymwJv69uGiOeYYn+Aiu3auYkuT10oKzVjrGFtVCXk4XQUe83Rw5nxJhNd9ALgusJEkV
 EI7A==
X-Gm-Message-State: AO0yUKX4FzZl5QWKaL0Pv6UuiPk9mLeqbB+Njy3Fuitw+I+oELct6gPH
 0V9O4XuTkTdIMlv0z1NFo8eeV19/Miejkw==
X-Google-Smtp-Source: AK7set9c3SG4MYIrXfkZZUk5Kw3mY04b0AeMMgPcoMXCWbMawRwrgGs2nytbq0AUffuGzJHPDxQVAQ==
X-Received: by 2002:a17:907:1c18:b0:887:dea8:b029 with SMTP id
 nc24-20020a1709071c1800b00887dea8b029mr28685883ejc.1.1676292026825; 
 Mon, 13 Feb 2023 04:40:26 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 c15-20020a17090603cf00b0088bd62b1cbbsm6716791eja.192.2023.02.13.04.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:40:25 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 13:40:21 +0100
Message-Id: <20230213124021.12522-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RaIMZIjL8ARIoWEeIEpguvDIgSTottzaFFhGVPLG7LQ=;
 b=b8PjRW+TBigKMrfmWXTmVDxUuQg33thUUi+QwKQm7uDVpLFxroHBx0LhU5PWfnZFLt
 +aLwE6vL9s9bbvl2XsML14IF0/UC2bo4070L6+iw2utF3TLtUn+J8MGJpPITStiyC3JV
 cRZDCnhF57KutjbZTi/KUiVRYpfjc9BY3HSbKYkpaarrfyx7cdlrdc1ug4bO++SNG/8B
 mzpro7XvhhaQD4GelbsqCgWiQXNLI2O5jEG7EXNJnkpvT6QUkb02Lza4bJ8aSVVTGKbv
 7SGfcIjyJREA/g7b12w/xzxDjIcmzT/dD16y6IyOCfKC8I9MCpX1i9uL48NbqadpUE+G
 rtCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b8PjRW+T
Subject: [Buildroot] [PATCH 1/2] package/network-manager: add patch to set
 mobile-broadband-provider-info-database location
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building network-manager in cross-compile environment pkg-config returns
the wrong path to the mobile-broadband-provider-info database.

By adding the option 'mobile_broadband_provider_info_database' to set the
correct path to the datafile this can be solved.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...option-to-set-the-mobile-broadband-p.patch | 60 +++++++++++++++++++
 package/network-manager/network-manager.mk    |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch

diff --git a/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch b/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
new file mode 100644
index 0000000000..4336472e45
--- /dev/null
+++ b/package/network-manager/0001-build-meson-add-option-to-set-the-mobile-broadband-p.patch
@@ -0,0 +1,60 @@
+From 03ba04d4784fa4fc7ec31455070fb5ecf25ade23 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Fri, 27 Jan 2023 22:38:42 +0100
+Subject: [PATCH] build: meson: add option to set the
+ mobile-broadband-provider-info database
+
+When building network-manager in cross-compile environment meson is not able
+to detect the right location of the mobile-broadband-provider-info
+database by using the pkg-config module.
+
+By adding the option 'mobile_broadband_provider_info_database' to set the
+correct path to the datafile this can be solved.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+
+https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1519
+---
+ meson.build       | 6 +++++-
+ meson_options.txt | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 0adc42f738..84ce52c736 100644
+--- a/meson.build
++++ b/meson.build
+@@ -584,7 +584,10 @@ enable_modem_manager = get_option('modem_manager')
+ if enable_modem_manager
+   mm_glib_dep = dependency('mm-glib', version: '>= 0.7.991')
+ 
+-  mobile_broadband_provider_info_database = dependency('mobile-broadband-provider-info').get_pkgconfig_variable('database')
++  mobile_broadband_provider_info_database = get_option('mobile_broadband_provider_info_database')
++  if mobile_broadband_provider_info_database == ''
++    mobile_broadband_provider_info_database = dependency('mobile-broadband-provider-info').get_pkgconfig_variable('database')
++  endif
+   config_h.set_quoted('MOBILE_BROADBAND_PROVIDER_INFO_DATABASE', mobile_broadband_provider_info_database)
+ endif
+ 
+@@ -1054,6 +1057,7 @@ output += '  jansson: ' + jansson_msg + '\n'
+ output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
+ output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
+ output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
++output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
+ output += '  ofono: ' + enable_ofono.to_string() + '\n'
+ output += '  concheck: ' + enable_concheck.to_string() + '\n'
+ output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
+diff --git a/meson_options.txt b/meson_options.txt
+index 8b1d32e645..4e359f9e92 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -32,6 +32,7 @@ option('ppp', type: 'boolean', value: true, description: 'enable PPP/PPPoE suppo
+ option('pppd', type: 'string', value: '', description: 'path to pppd binary')
+ option('pppd_plugin_dir', type: 'string', value: '', description: 'path to the pppd plugins directory')
+ option('modem_manager', type: 'boolean', value: true, description: 'Enable new ModemManager1 interface support')
++option('mobile_broadband_provider_info_database', type: 'string', value: '', description: 'path to the mobile-broadband-provider-info database')
+ option('ofono', type: 'boolean', value: false, description: 'Enable oFono support (experimental)')
+ option('concheck', type: 'boolean', value: true, description: 'enable connectivity checking support')
+ option('teamdctl', type: 'boolean', value: false, description: 'enable Teamd control support')
+-- 
+2.20.1
+
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 138ff46e4a..87932c75e4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -96,6 +96,7 @@ endif
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
 NETWORK_MANAGER_DEPENDENCIES += modem-manager mobile-broadband-provider-info
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=true
+NETWORK_MANAGER_CONF_OPTS += -Dmobile_broadband_provider_info_database=/usr/share/mobile-broadband-provider-info/serviceproviders.xml
 else
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
