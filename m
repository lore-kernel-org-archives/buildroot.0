Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79FCC677F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691F441821;
	Fri, 24 Feb 2023 08:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691F441821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnGFy_GAtncG; Fri, 24 Feb 2023 08:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACFDA4188B;
	Fri, 24 Feb 2023 08:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACFDA4188B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A41F1BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4921D402A3
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4921D402A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlEtrvxNlrbr for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:43:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B087B402A7
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B087B402A7
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVrEUI/veQpsOtjQjV49sm5JlcOnX1d2oT6vs724LucdlzwR98AuYwad3u19Jla21xbClv3NpE1CthPqsAiwP/sPWY0/hLFY6XTitUmo5IIrLDF86xDyJwAPKkvfDFE1g/bMp5Rkg6rSHr7VlNrzf96Vf2YYC1Adp33VEEYUxJ3T/x0s3XPbaMSIfp3EpKJ8odBUxZZjasPe8OyisEv8Gn1lwXhnJZ7qicdWsi/xkqMZvNfF2KXxv7MeJWkX0ARfwMFAYEbzf7m05wvQqIzL6XJh/uC+xcHhs0y3qs64Vd7Gzc25ruS22bJ0QnHtZf6DoWOT/0x6al+MOBKvHBhYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euXP6kfFPPGiSjgMkQDeOoysXIreGysRVDRAG332QZU=;
 b=XJvM7yux8XXpqv2Z1JnlO5/ZF7ERJ5WBRKMS/uxHw7fdUaB7J9z2L/+4nI9a4CP1wsdzh18BFiZqMWO6GKjgHkkwQNVYsNFUccNw25Gf8QN9UQCAOqKCl0fp3lzFJd0oNdw8cpVWQB7tHFJ5VVhsPHYtyPsAkKGjpHDYuNPxM/P/yOsYuq3rZGDHWtuzw9d2Ls9IfHGH1S9/SV4R8TRnAo4AqmZMQEWAa/Nev5dbF9F1qgEB07PAEXCZ50C63HppxjABQSQAYDFd14bqiSP0JWEf9Lvdl9mTw5bX253UAsbOUCPl/adQRNBzEgNOP6xF1ilWO0/MEKOkuoZHALnoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0942.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:43:02 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:43:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 5/6] package/pangomm2_46: new package
Thread-Index: AQHZSCtUN3qW4BloJk2EAaDtGvuxOg==
Date: Fri, 24 Feb 2023 08:43:02 +0000
Message-ID: <VI1P190MB0493EDF8494A15F38CA08D249FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0942:EE_
x-ms-office365-filtering-correlation-id: 17386d4e-c1f0-4fc6-9354-08db164323d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4RtCBtl4wvqaEsVGb4nG8SNQPJep/RXkbb9v3hm7tsMCgAPxcXGlM4lcnW/NOZOKB1/oeWabicIcOKsSvY7N1qCIOlbXt8M5iCAF2c9aySBMeIYQmNJnM7ea8JR5zWW5O20Bou8nua2Q/WcC0Qp10GsLmfzTwxBDDkl7M/dzfjl+EHij5Kk6/+u/9+hGS0Z/JtoaSfcEZRmhDgBq2BmDaaNtKFJGX54ZrL37aZjx+tg3dStkOccvoXfYDZbR2+AgBKiY5FkwjafdI4VzAp4rbAJR3iE4OiAsdlpXq15OZVsO0/VO+q14ZkHU5tHX7QDS7EA9/lO2KY6mQhnKfNttvDdblqo4s9sb3ac8995JRdYLAxgJEtWSJZ+otVd63/xo5KDNYNrmRMKTelY1W2DzbG+myIFunnXoyql7jnuVxl/N7y0vX+6dD8yBBiz0o2T/2HxWRMhFo90CH82hApI6pET5nk7NBgWsYL9Sxd3UR4SnPFK8og39/4Fle9G5lOnm+IGD5H1dKPBIVyJR4mq2/EtajxH45UyNAGqg8jlxgDbZkkIpEg+WyelfH4jJommAoxifV2RFyafkonDVANfAjrN/HwY022MJFAfETNcehBg4TrNTFuutfmXnA+f9rGjiXvaHrQwms53yKfmJRDd4tc4f7jz+om0tjIgUU6dYg5WgcZF9RwXYsYWR1tHocQK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(366004)(39840400004)(451199018)(33656002)(71200400001)(7696005)(966005)(8936002)(316002)(52536014)(83380400001)(5660300002)(66476007)(64756008)(76116006)(38100700002)(66556008)(66946007)(8676002)(6916009)(4326008)(9686003)(41300700001)(478600001)(186003)(6506007)(66446008)(86362001)(2906002)(38070700005)(122000001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WJJf3nlFosNi4FfvDpOk4X8Ya25/r3Pas86L1CGxC7EsuDOxXdm8n6NfPl?=
 =?iso-8859-1?Q?PGrQADvJJeIbYmtN6ajm1Riz8fPWBKE/RIsbOqj3teMNhg98MrhtBtytsr?=
 =?iso-8859-1?Q?7NeXX0VnK5S8OCoM2Oz0e2KpDn2qx5jY4SJsyKJvCm2xLpxOr160jO/nWW?=
 =?iso-8859-1?Q?vAQ0a2YGP1lBNggf0k1MX37fHGR2e3FUyIXvBVgddaQtepQ7RPt4oTcd5d?=
 =?iso-8859-1?Q?nfpfUiGGQ8I7867v/m/BFYc1Kl/INxrczf55vu6efOtL/febrHS53Q8GFv?=
 =?iso-8859-1?Q?VkofMcvK85TxSlUTuZbAMCJ5d0funPyy8BWVm6FqbltzRCwLQuY3uqOE80?=
 =?iso-8859-1?Q?96evmIOmO9GhpZAyjeroOnIb55nVp2rhZUIJ0GczFVYewjsEpHxp4nvNXL?=
 =?iso-8859-1?Q?i4MS2sTxu99iQXfpBgXnNXIujpRMBx7tFUr2A1MH7KGxxOhwEGK46bSeyU?=
 =?iso-8859-1?Q?jG6rMAYtLNyI5CKOZDabHEHc5f+Hp11a8d12fGu2T+O3kB1YAjm9gArt6G?=
 =?iso-8859-1?Q?coSzEfJu/UJUkW5MuKtodw8cDvI7dkOjEcwGCLP4xaFJWtFbpqvJgPaO7H?=
 =?iso-8859-1?Q?54RtJrjhR7SBsvp9MITJX6/M8Os57r6TmfD/aC8BRrdKoh/MWMfTZEz3nw?=
 =?iso-8859-1?Q?eRBQrBPGV+KdkWM0sB+ErBl3ac2OGzrvTHxdJCCF83VZRlWJj+yad7l1e6?=
 =?iso-8859-1?Q?xCRSpfVZF8FzE8+vrXXmlOGfVeiX2tQaTZmj+e96RFdKdUSwDEKI7pDqfH?=
 =?iso-8859-1?Q?lgckQY66jBi7a03EamnYqiIKP+tzjsjRCNdqAD8b/vq1tAfUqXUtaT+mg2?=
 =?iso-8859-1?Q?6aXU3DUEdTtq1vaFQV6/lJ4ROCoD760LK4aGq/TMeBVlqKx+LQP3sFOHBo?=
 =?iso-8859-1?Q?LZL0IYvzFnozafzerIHypZgoxHMpE0WVyum2AMXwY8LKI1tsSYTOo+A3Dl?=
 =?iso-8859-1?Q?fI+1Scz3oDyoiwMGSMJXkRZrmlM8XdRvCDN8jIwF9NTB7UFzja+li1JCZC?=
 =?iso-8859-1?Q?/APUkUF+jrYfrlpyKReVpbx0CIoqR/hC9SzEdE0OrzBJ57dj9iwRPJ86ip?=
 =?iso-8859-1?Q?FrZURylPkoTdSGkWAsODiqAfhw27QSrtH7G/JCDdSkxwY1d4Kbqr/sSByD?=
 =?iso-8859-1?Q?IRdpuUv3WGSidA2zGX/tjAJjUirCreaa78T6KkTMB0J+RpgIE4sGIOEbAA?=
 =?iso-8859-1?Q?AjVjVmDJ233VJFk/4yDZAE/apGMFqvZBOusNN98IcUjWvHDsf2itajw2Cq?=
 =?iso-8859-1?Q?Pheu+4fWdvb+hzN0cZ67ZlnnVHin2/GSrZbSU98BwR/DXw5+9o5Ptlsnqx?=
 =?iso-8859-1?Q?0jRSjwLVnqLYmtYxvfgq9soGh+tIg/PuAYLEPt2l21EKa2TQZTFcD+PDct?=
 =?iso-8859-1?Q?qhQxtX0k0FUINugwRKWcjs55LnYdVg2t3BjWOo68XnGpXilJ6vmZVJwPhb?=
 =?iso-8859-1?Q?cKMZu4FOIuzH2Neiy1Zlmvcu63L4coG6y4uCKJVieD4qFQVOTBFa8oImL9?=
 =?iso-8859-1?Q?UwNKk7jrtVhhyFltgI0ZmrGSi6h1tPJmiHXmPbq6Aw/nGza6H/nTtPjT4s?=
 =?iso-8859-1?Q?NVQE2HVYZl9vaJbdWXIsxBaB5yd2YZD4cL1qKi5iwndLOMIwb5ayvRmVN5?=
 =?iso-8859-1?Q?+4SJPYJ9ndFx3KcQ1FBhiHGmflZAerMc5W88Jv+Owsm2hf3USOToEn4Hwd?=
 =?iso-8859-1?Q?NRMk30eWng5hNOrN0QU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17386d4e-c1f0-4fc6-9354-08db164323d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:43:02.2054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLyWesJ3dn2WBicgtSx4OWOOrcU9PKn7gR+ldWGv5lIKv+ZumBIdbgYIcKG17jupvw5rBJsCHQdkgXWVZ7l6Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euXP6kfFPPGiSjgMkQDeOoysXIreGysRVDRAG332QZU=;
 b=n1/sNTIx/IPdG3T68dm5/gKqdHuDk1SucCAoWsbpxwjNi+m3Us5OaJYF3by6aVU2lv4ZkemWaKPhrZ/CcUxo1MGHkwni6MRfqpZAGryKKLI8v9nqiFDgCb6h7WBoI6g3jnLku0vZTv2m9qIBTCMLXHPuyftFYIU7+iRNLb2u5q0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=n1/sNTIx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 5/6] package/pangomm2_46: new package
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the version needed by gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                           |  2 ++
 package/Config.in                    |  1 +
 package/pangomm/Config.in            |  2 +-
 package/pangomm2_46/Config.in        | 25 +++++++++++++++++++++++++
 package/pangomm2_46/pangomm2_46.hash |  5 +++++
 package/pangomm2_46/pangomm2_46.mk   | 16 ++++++++++++++++
 6 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 package/pangomm2_46/Config.in
 create mode 100644 package/pangomm2_46/pangomm2_46.hash
 create mode 100644 package/pangomm2_46/pangomm2_46.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index de36a0cdcb..c183c9a2df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -650,6 +650,8 @@ F:	package/glibmm2_66/
 F:	package/libsigc/
 F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
+F:	package/pangomm/
+F:	package/pangomm2_46/
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
diff --git a/package/Config.in b/package/Config.in
index e5e9d7f875..b940eea2af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1636,6 +1636,7 @@ menu "Graphics"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
+	source "package/pangomm2_46/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index c23ac4aaa8..6ddad9e6ef 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PANGOMM
-	bool "pangomm"
+	bool "pangomm (latest)"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
diff --git a/package/pangomm2_46/Config.in b/package/pangomm2_46/Config.in
new file mode 100644
index 0000000000..772b523c83
--- /dev/null
+++ b/package/pangomm2_46/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_PANGOMM2_46
+	bool "pangomm (2.46.x)"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
+	depends on BR2_USE_MMU # *mm/pango -> libglib2
+	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	select BR2_PACKAGE_CAIROMM1_14
+	select BR2_PACKAGE_GLIBMM2_66
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_LIBSIGC2
+	help
+	  The pangomm package is a set of C++ bindings for Pango.
+
+	  This is the last version before the API and ABI change
+	  introduced in 2.48.0 which requires C++17.
+
+	  http://www.gtkmm.org/
+
+comment "pangomm (2.46.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pangomm2_46/pangomm2_46.hash b/package/pangomm2_46/pangomm2_46.hash
new file mode 100644
index 0000000000..8d05dbc2ff
--- /dev/null
+++ b/package/pangomm2_46/pangomm2_46.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.3.sha256sum
+sha256  410fe04d471a608f3f0273d3a17d840241d911ed0ff2c758a9859c66c6f24379  pangomm-2.46.3.tar.xz
+# Locally computed
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm2_46/pangomm2_46.mk b/package/pangomm2_46/pangomm2_46.mk
new file mode 100644
index 0000000000..1725158491
--- /dev/null
+++ b/package/pangomm2_46/pangomm2_46.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# pangomm2_46
+#
+################################################################################
+
+PANGOMM2_46_VERSION_MAJOR = 2.46
+PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).3
+PANGOMM2_46_SOURCE = pangomm-$(PANGOMM2_46_VERSION).tar.xz
+PANGOMM2_46_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM2_46_VERSION_MAJOR)
+PANGOMM2_46_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
+PANGOMM2_46_LICENSE_FILES = COPYING COPYING.tools
+PANGOMM2_46_INSTALL_STAGING = YES
+PANGOMM2_46_DEPENDENCIES = glibmm2_66 cairomm1_14 libsigc2 pango host-pkgconf
+
+$(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
