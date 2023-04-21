Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41123C77B73
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 01:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A0461382;
	Fri, 21 Apr 2023 01:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A0461382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEU8LrxePwTY; Fri, 21 Apr 2023 01:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A686135E;
	Fri, 21 Apr 2023 01:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A686135E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA0BC1BF2B8
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 01:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB8B841A9
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 01:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB8B841A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIo_UTJOcfDs for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 01:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8148C841A8
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10acsn20804.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::804])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8148C841A8
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 01:42:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2Kba1Uf14Z3WeOkrmWcmRS9/JXnOqHm5DnG2kZ2LA6A/LyF09G+XR5g5Hl2GPCq/AyWcVpaXOnT/EbF0Xz+BbmnMUXHhpXUC7+8qlNb1ybC1njsA/xXe599T1IT+jsTFxI2aUD2DEu2Q/xZypZcchyQaW6mvGVeD8uX0dPlfJ4C5hoFoBOy3dT30DtPnofaOwI7yhHjSmFPEixVGHDqKQCmUPg6WYDZ3nEQibhW45FgZKAImvhLyncvJnaRAMtNZmRlt86w21DXtdn0buKM6OMeH4CTwfuai58fWQUgX+MjPYIcElcfhZvyKRgn/xpNmo5z/SADDDpKbo/cBvEHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGYxQxyVfa11+0zd3dWDjwwhUtnai/NivJcrgtYmYm0=;
 b=gCdJt8yKv2GU5fp9EmCxHaRCc3BPID1Y+nzDkEnMWWE50sLogYUklBsbhbf0c00GRM9Nq19nqLdVnVyLv+DP8NIkZEBzvA9nklU127ch3g+QQZ65tY/eU27+/0Tv95/4dhdpCnFgdlUMTqT8IAMoHbfBzUdRc3/A2EhKJzDiNGrvNwOixP35os+5yyqqI/0v3tQAh5gRoLnaAYo2laYekHB8hJupIzIX7/32zEoYi0dt99VVDzXX1Xw1Vk9BLjjhLQbFuacfPr6UJHN+KR3I+Ih4XwPp4UQT00coSN+PmAuvt1pTvt9F6dNx6fWDlgc3QrwnTpcBeqAxOM/iKIbaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by DM4P221MB0907.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:aa::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 01:42:54 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 01:42:54 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Thu, 20 Apr 2023 21:42:34 -0400
Message-ID: <SN4P221MB06821CB27E755AE089BB76D9A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [Y4LkqjWPOBdbs36zD+GqIRf7yqAawhw1]
X-ClientProxiedBy: YQBPR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::36) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230421014234.2237-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|DM4P221MB0907:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fc1cc3-a404-435c-e510-08db4209b9af
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mut0ZTEc/+RhwzsFjQD3otIQqmYIdLhEpvisFLW3bqsaOBtsjJZWxEbbA1+s8fXooPFXZRlaLMB33IaeUDoQ2wo4wCZam8SlzIYvO3VPhcTsgqkZR+x6qZ4NWcq5vHN15flIX11qBCsds8YS/NvIecC2HlrEL//UmyCLgaJQJZSRoAQTdUHUITxnJ/m5XwWfcTi4He5ePyz943MC3c55FDCfv2/ECYFpvesuOsc3XHB7ocS60ZF4w5KNE6CbOxEzFtXh+KiH2yAi+9rx7K1hKmujU354nhBfNhHjqNBoo4FTutU+sKNQ33N3PHukJclHO1g5x/pZesTsHLFZEvirjQFB3cevljE131MJJOBNchzuz1KkUtFvpQ9ycj3ENUsJspadOzO5+fncfbtlsq1e5eRa/l8ctYRAAsp2rFThxefSTam8h3jYcvFwQ8RKH8Zj/XZprxjDYKu9EzKBnK5F6iSp1F88siF11LLFZIicUW9rY5PLP63i8T8rJHmZnn6jPpVJe5yR4MfM+SeDSOi+Tl8qV9BVK53OrpIVktRCSwOuAS8Jg506p8oPpwEc3P/TNkeKrNK2qUcqU6ONY02YqCvbBn7nJq3bYSyNyFI8Lk+T9BteP4BSBnXiGFybdwEdNqYwj0vUBgDdfTxTXlcaMcpaFAXBMhpCuzcyVD1eN6AsTscZzPxcrq8iq/FaI5SVIaKL6laPZGtzav77DrKvPVlkJYmO63/KdpmJlpi7lkOLw==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qCkaYq7tYOpjSeZ+D8nfx6TzPIQn1Xtk+JqDfROsAqFg1skjR2S8w8+/6t/TcAdApuaEA5m/J0vhz2jgVFugyd30yP7VjXpzJxngp5RtcSH7GO0ueSlP+zSlvEvSQBY1oKN+o3VGPSy72VYkEulS42cc83giGFtVFbyzQdG9SM653av2K9vi0h+a4nyN6S8/lWGPHCv4UnPb20W4qGKYanFo+2SFiOGnzMMLkoRAGqY65uupPyE6gGzkmyDM86SAbEKxrghhEA3oiCUUytdG6sy+gl4FjbYKFj6UTfrMICHerguEZhppomDDCD+2Wh7jVqMY/Q0BkjNBTngk6n5NPdDhFbxLIOU2VeBJHu/0PH0+hNoiQLDy02CQouv902QZO/SiZu8DL+suQy+XWpoYMfQzKn+6zhSca3VeHsbQeLUaDlQYmYzSvBU6wWL481TjGuc3VpPeoCycvwmzSSkG5SU9zGDF4N/wYOUBQcGRgdRHIssD78rv1ScxhnAdGDu3o01VjQASVC+s3LANTsnRttHUlUFep6WQ/7cmqIno4mE1G3CoxrWtr8ZY6SZrFwgqIYaGvMYqgVJbxo8nMzjpaQ6Js3ajV6Ov7yT0fOaseao2FhTdo8AOOalxTQDHJWk3lox9NNJYPQ92LrRxtVUEg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HK96V8HqWgaxxJM8u8LvLvfXxvNTWWI8Yg02yjBybEFtXWbG5WgmdckpfFI0?=
 =?us-ascii?Q?GWF3E4NBc9XAKuj47WB/ML/kTYHymkvMHKPBOu+sTjwaPCG3O4wcaVU0DFf3?=
 =?us-ascii?Q?GO7QYhpYf/ywp6F6jRVtlRZO8ozgf4H5rohqGbIiuJJReKBWVS9SGH6IAZ5m?=
 =?us-ascii?Q?6SWOGSxQoH6+ECfT77WKj5uNu3EMO4SnOUAEwFSqXd71/M23PW1dRmoaTmV5?=
 =?us-ascii?Q?Kl42uAUeuhf6kmufMmB2QyHO2naU40jRB3MeKEsS7ocD239rGyZGEt7f9ebD?=
 =?us-ascii?Q?KQJ0pF0NDMM7xKyP3QeWCtNzQHGbjMc8D99mZMEGMq11hEca6l7fLeSd77wv?=
 =?us-ascii?Q?SzTCwwfNOqFv8ecWf3HLcudgaiq+JayWP++GntYSK4vcYu+jpX6HITUUDlKf?=
 =?us-ascii?Q?/cdJnlBj85CgByqphkFoLcAIhbCW19p6O/y61PYSIprJG4sQJDC0FqDJfMyB?=
 =?us-ascii?Q?u71rctCBIwWtKUhn57JsfgQu65KW4XBi4esZqegn+On2ad9IdWS8FRpXBcrt?=
 =?us-ascii?Q?MVuq6MG4rbWsJ1aQWITZR2eeLk23ZQazKpdoWVh+q1hPlB8PnW5Y0S60sba+?=
 =?us-ascii?Q?yt7lV5Po2ihXNq/lE79UIXzrzxuHVg8gCvyfAZ1E4NtXf5daJkkcvE8R2VUm?=
 =?us-ascii?Q?flQpB+0ydeehLTQ6sqY5OcEeI1U+rP4gzotZModkis6JEunj4yuU/sKktv15?=
 =?us-ascii?Q?wbRZbxZlFvCeeHHGJifaOVllpN5RM4LvSDe7hQbS+2+M2vpNSiy0w7tsfNoz?=
 =?us-ascii?Q?2m1kc41HYDaRC+tyVjqETq1PT0n6+xJ9H7NjEqx3KPLWlO8LbqucsddMaYIb?=
 =?us-ascii?Q?SLLzVd/suL7WAmzLGrmstEWXvRhp6+ETpt+D1GiHIq95ABerPzbgO1boOP8x?=
 =?us-ascii?Q?I+ks4HCp9ZMjMcWearh8+MlEQ5Ln5BqsUJkmxFWDHTzGNZJabY1+2iA6Zbi2?=
 =?us-ascii?Q?4UO/uTbEIeGMHawMKsTiM6jVnjCJv80dgolXZTP6E5sTrKF6VAWjWBHxB9Xl?=
 =?us-ascii?Q?YYS6TWRJHKQn0llaYjdMysP82cEf5w3aumKGrm5DzHmqWRWsyeLKJQ5wDOGY?=
 =?us-ascii?Q?HhNimXBpUKPIkEiyOwTXOqeswxjPcAFbDFMj7AidISXA9P7UyUQq4q0DH/A4?=
 =?us-ascii?Q?RxYt/uXDb+fJzUyhIlLDbns3u0dcFoo8/vmFk5UMHuF0aGX1tw+fKa0LKTBw?=
 =?us-ascii?Q?X//Jopcx7Gv4CN/bg5ar5k6dGDUoVvLDAVnrAzcJEQHVce+k5EDpDPgoUbI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fc1cc3-a404-435c-e510-08db4209b9af
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 01:42:54.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4P221MB0907
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYxQxyVfa11+0zd3dWDjwwhUtnai/NivJcrgtYmYm0=;
 b=tOa/VmhBEn0Gc9fB+j5zi8wxLInhMWUKS1rEbBgOSOGboL+LcbKav4GV29342eDvREyYi/rIhfs7TkkZLtpQYjxl0jSbicYKYIPxnI+noDrA11U2bIzh+hJQLS4KcsESb6Cu2AEOHGAr5xeC+nxG6HCZAh4GDVxl9k71Le0xCMMucfDnP3F+NfAvYedS44vQV87Jxa9Myor4fi0ny+S1ZKMbxLXavZqHC5/YMtX8P0+GVfUPOFzkPmI5YJ4vXwQPAsRwEuwRw+ItfYRaGQA3cN9gf8F1AexTWiSkMNzX0X5s+oP9YtMJNGrcCccaO3DmzxHGE5ue6T04rJCxDuMhrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=tOa/VmhB
Subject: [Buildroot] [PATCH v2] package/swaybg: new package
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides the `swaybg` utility, which is commonly used with `sway` to
manage background images/color configuration for the compositor.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/Config.in          |  1 +
 package/swaybg/Config.in   | 13 +++++++++++++
 package/swaybg/swaybg.hash |  3 +++
 package/swaybg/swaybg.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/swaybg/Config.in
 create mode 100644 package/swaybg/swaybg.hash
 create mode 100644 package/swaybg/swaybg.mk

diff --git a/package/Config.in b/package/Config.in
index eaac32a01af363936edc8a0a8dd2450c458a38ae..d2b6422860a4da5a1d810aad26d2e10a10270275 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -329,6 +329,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
+	source "package/swaybg/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
 
diff --git a/package/swaybg/Config.in b/package/swaybg/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..63aa8cdb6a7f72c09644d47238d8705da19329d1
--- /dev/null
+++ b/package/swaybg/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SWAYBG
+	bool "swaybg"
+	default y if BR2_PACKAGE_SWAY
+	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  Wallpaper tool for Wayland compositors.
+
+	  https://github.com/swaywm/swaybg
diff --git a/package/swaybg/swaybg.hash b/package/swaybg/swaybg.hash
new file mode 100644
index 0000000000000000000000000000000000000000..62bf048d6125ebe7d6d936875bdd0083a105d60c
--- /dev/null
+++ b/package/swaybg/swaybg.hash
@@ -0,0 +1,3 @@
+# Locally computed, tarball verified with GPG signature
+sha256  c0205b34f1fad94553b6cb2c2b983cc33186018026058cad0b841a00bc3087e3  swaybg-1.2.0.tar.gz
+sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/swaybg/swaybg.mk b/package/swaybg/swaybg.mk
new file mode 100644
index 0000000000000000000000000000000000000000..4cb738286fb9ec6651754c0a591f5c1cc60b705d
--- /dev/null
+++ b/package/swaybg/swaybg.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# swaybg
+#
+################################################################################
+
+SWAYBG_VERSION = 1.2.0
+SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
+SWAYBG_LICENSE = MIT
+SWAYBG_LICENSE_FILES = LICENSE
+
+SWAYBG_DEPENDENCIES = \
+	cairo \
+	wayland \
+	wayland-protocols
+
+SWAYBG_CONF_OPTS = \
+	-Dman-pages=disabled
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# swaybg does not build against uClibc, swaybg uses POSIX defines to indicate
+# support for `strdup`, which is not enough for uClibc to provide a declaration
+# of `strdup`. The implicit use of the function causes a build failure. To
+# avoid this, turn off the "warnings are errors" flag.
+SWAYBG_CONF_OPTS += -Dwerror=false
+endif
+
+ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+SWAYBG_CONF_OPTS += -Dgdk-pixbuf=enabled
+SWAYBG_DEPENDENCIES += gdk-pixbuf
+else
+SWAYBG_CONF_OPTS += -Dgdk-pixbuf=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
