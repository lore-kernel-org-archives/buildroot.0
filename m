Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44208C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84B670103;
	Tue, 21 Feb 2023 02:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84B670103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vndgi76LEg1c; Tue, 21 Feb 2023 02:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7433702B9;
	Tue, 21 Feb 2023 02:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7433702B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8331A1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 682976080A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 682976080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n38Q3zyytQ3o for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:39:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FA8B60A94
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA8B60A94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D2FE864B6; Mon, 20 Feb 2023 21:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 22:39:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81de6207f1237f17ec3e17e3afaae25474c7aca5
X-Git-Newrev: c36f6938858d3246ca493dacc925717586e2ea0f
X-Patchwork-Hint: ignore
Message-Id: <20230220213917.5D2FE864B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: add patch to set
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c36f6938858d3246ca493dacc925717586e2ea0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building network-manager in cross-compile environment pkg-config returns
the wrong path to the mobile-broadband-provider-info database.

By adding the option 'mobile_broadband_provider_info_database' to set the
correct path to the datafile this can be solved.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-add-option-to-set-the-mobile-broadband-p.patch | 60 ++++++++++++++++++++++
 package/network-manager/network-manager.mk         |  1 +
 2 files changed, 61 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
