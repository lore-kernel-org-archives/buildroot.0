Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3303C677F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66852402BA;
	Fri, 24 Feb 2023 08:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66852402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dB74vnxhR59; Fri, 24 Feb 2023 08:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED0D402B3;
	Fri, 24 Feb 2023 08:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED0D402B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBCB91BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18F9404D1
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18F9404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTirrP-vZ-U4 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A64AE400C4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A64AE400C4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl0AkbNvBabl/vZnosCC3mG7CkqJCK+ErOi2OphY9rQYRAOfr31ZYieE7MWbi7cBqHbTSYjLe8/29joT75gU7znzOXryUQTNV+sIgtQaTCKK2ZR3BQjQReSi799Ur/5Pov0qaaxGsE9fmPqTt309I7f90a3Os0sJTP8fJ/MHLLMz0siQHJwm88xglUdlEghKS00FbUHOBBxkhFvfUA01I8XVDW66YTdNr7c6MEXeIXxhjBU9LIAP0V4C5lFf/FErs2tUbDDOIbiivrrWu4vtKCYqNGn5uN2bQ/wajDME3bdiqYayvC3MVRlF6k/bNqyNdTGYHj9qewoMNk4spzT9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHiba5/kX03NlXZZeYDkOIhbLj0hai2ULnKa+17q7Ys=;
 b=OCAhG54/e9b+EaC2DGhULhoEnjnSsXuGXn2S7NnU73mpCBgED+GMi1FpGWEfCb6+WHuX/4Yjcis6DN4F9UnkUPGREgGiOCYy95KuMmQ59JyjF8G7EOJ4CAG74Jq+lVSBLMyVFN4FA6GfmHaPENcyD2nBK+N2aF4VWXBwlTyVuMdr72w1cpDHfoOhrPJ1xiJvl7sfoCSMjH0o/8GtXKW3gzfli3b7G7isql728iTsEsrBQvlEYEuBSoZ0HDoNgTL3Qrf2X9+GJscU7no5BsKLVgrNsKnNOlzYcIfcrlLjjINiluT+sVwug3h2As1bGXiSXJOmkFJ22zfa6srK4WxmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0690.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:42:52 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:42:52 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/6] package/atkmm2_28: new package
Thread-Index: AQHZSCsHf7uqclzlV02Gsc3AhT2BJA==
Date: Fri, 24 Feb 2023 08:42:52 +0000
Message-ID: <VI1P190MB04934E635705A3395768AC0A9FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0690:EE_
x-ms-office365-filtering-correlation-id: 7f372c50-a490-42dc-6cd4-08db16431dda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PrjmcET0VDq86LzwJErGTT6nvP+VaDoEr7MSVSbMVxkPcTn/PLcF0ZnbUuq10FLscRqGacnuJa4AKdfEy2hwKpRF1AZ1jXTGBwmASLJTXoAiHER4YOcps+DofhdLcqWx/PxJItsbVHdMbS5t6B++eQuK/wpctMAo01+m58siPPWe+Z9oVussx7pBiIoEfPst1FygBQPSxOGCLP6bCsPbk7OazCm4f7qzdiQkD5B6jJIZjqpFG8ckYJMof2oJJq/iuzAZ4sT32o9xWbpIqKFVx4RvrnSu8dCe0/A0WymFTxnwmCH2dDkG3ABFcLRlMtB3bjAaVgIsebIou/F+OTzZ7T4S3MHB0B3A4V9D2t/AwDm8Mu6dLO9j/DNDUwNmtM9Pc6t4rysimg4KI3Dk3iqANqVPbDNXMhu5fMIhnjw2AwpDMQWgsonZkdtqvm64tBE3uQdSqjocFvBx8R/pcruQQ1ztmCMZUHCCNkg/prAKJULchegC5mTBrSqyeG4rFsUzpW+G35RRuywtx4y3OIlsesEka4gis4e6KxEHNHmwqkJjMhTGsbKUOPWSLKFk77yt8KQT/Ph3wpAbGTHv0DsbQgq+6Q1CVZ8KqJenTbQxmDfRle0/bsm8xi7qBWtYvL9O3G/wZ0PrDtBSOHB6yzrRizCp0snvQXheKTGfJKNadDcBcBtb+b50dh4x7SHTAkZP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(451199018)(9686003)(6506007)(186003)(66446008)(38070700005)(2906002)(55016003)(66476007)(8676002)(66556008)(64756008)(6916009)(38100700002)(4326008)(5660300002)(122000001)(52536014)(8936002)(478600001)(33656002)(76116006)(86362001)(66946007)(83380400001)(316002)(41300700001)(71200400001)(966005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ufcjah6q1M7z/uhqbeMV6v2pXSdsffk4dyoAMMMRwbZfbzwgSvOdNy0dig?=
 =?iso-8859-1?Q?sMAZtWZUmXYW66M7IOhs2P5Ow8fTspgmGB45HJTCenVtFtcx/n2/luXTuU?=
 =?iso-8859-1?Q?ZpjXnubdKHjskoViuDY2iisYrjLe7iqIOvxz19LsNq4kodedcvVhDpg7Vc?=
 =?iso-8859-1?Q?1OzeMji5ILPIyZD6zjkN1yRNAg8ByQroN/qXORrXwSoJm/HtWdVM52XEFq?=
 =?iso-8859-1?Q?h0EvvMV3wZbNpZDT0kXSOHb4XpgSAKdyxWcl7NwKTyfr3+Czm8qr+8DOzG?=
 =?iso-8859-1?Q?5XrYkdruaC7Vj2HLub3ceUYygJ1qptx0pORUUm2UNui+t1Uf4voRGLxSXJ?=
 =?iso-8859-1?Q?Sse05X7VVR3DnUSagbq7isLcZx+ZWC+sA0VhVBYbagZOEUU8/cnNclXQ+s?=
 =?iso-8859-1?Q?XLfIQDDbxfnvaVKSKV/hRLRulJVrw4Uhoe0ArNPyZCIkKqAhRZjgH02F2g?=
 =?iso-8859-1?Q?NQpjdpG0xXzwIMILcQnBX1FnJ0dkVWAceyzkMjvjX8LWjNfy1D3Nek5PbQ?=
 =?iso-8859-1?Q?uxVK2aRMGz9vAUFFclS9C8naQvr+bmkmrjFT5bRpw8T3le8S6OPkTNurXg?=
 =?iso-8859-1?Q?6PX2rGCwt3lIkxsW2kUMITMCyNmpZ6lWF6rYLG36tHczB9onUnbOU5Ec2r?=
 =?iso-8859-1?Q?2d9qixcM+xEbbGQAAsvKXoVsEspojkhuHkbCdsgTQcEBCSjy4j/TjNHQfQ?=
 =?iso-8859-1?Q?V+XX7i2EC9BRT5qtFuvrDzj5valjihgR/kcbYB/uLlALr5+CuXB80R0lOv?=
 =?iso-8859-1?Q?xj0Z2k6Q5PZKhnU1CgSyWzaWOCwSWHOeubuf2LQ7sSKpwD0H5ay3812loc?=
 =?iso-8859-1?Q?19G/SboAplPB9dPF1umzLVwfjT/1Da72dtzww3/d4l1zY+OLzzGyeWkAPg?=
 =?iso-8859-1?Q?eDel9Z9afzYQNrSysbRbNrOURTGb3HX6Ocvor2bxr3KYVZvcPsF8ali8Oi?=
 =?iso-8859-1?Q?tc7AtGI30xGz3303xMrNtXabWAYfNVIG7yUKofF295+fmF+OBiJX3nRuvl?=
 =?iso-8859-1?Q?AZj2RvJQP06EP6lMJ6qc046XuIWGykkmZalTlLddiPSmaJMhtY6WVwgZMy?=
 =?iso-8859-1?Q?VYIdCkdFNDxt6C2hcoEz6Qo5hk7GactO0JKkJserpC1FPKymQxJ8GP5VHn?=
 =?iso-8859-1?Q?i6UL755HVaOkdPApZQ4P69FnBihxu3VUWre+Zkgo27BclIOB8rFcLYPP+b?=
 =?iso-8859-1?Q?767aUeubEunb/eADbuMNKC6KZ+rYLUE6bTEy9bbfVSf4X3knCKNf6t3t+f?=
 =?iso-8859-1?Q?lcV7zpkb+Ny3aLsKiEwGuPZTpcc1/0vQhKInk/gpDvjArIPMUDTOuNpXnO?=
 =?iso-8859-1?Q?heR7bjfwKsT2muopb/uf8Vd1O4k1cKaabB9/gKIXpGZdJTkJoOP1FbcDkT?=
 =?iso-8859-1?Q?Fcn05ERg4X3XuU1PANduWHWoUEjhsp6rWdrtWuk5F5EWU3AHyw31ITp9Ta?=
 =?iso-8859-1?Q?qvysxqgY/WMPWoZij/PWjrxMdEaPR0G8+DXP6G6CuwsjsGt2DcI/nXfoV4?=
 =?iso-8859-1?Q?1N4ckIA9i9PM0O7oDO4iTQ81bdaYLtDvj79CuAxpCjtAL+wFSAYvdn85vd?=
 =?iso-8859-1?Q?c/hRMBnFpjYp3qS5Jk2QqFPASiVX22AWyeCvUW9b8n2zSBmLclOwMFmilg?=
 =?iso-8859-1?Q?O75tzG/xTJlDPJzgP2W/GNyEakae/k7mw1hVYgayBeW3RkgTU4wfM6DUse?=
 =?iso-8859-1?Q?zSOW10+yBCsmXZ25mac=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f372c50-a490-42dc-6cd4-08db16431dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:42:52.2374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVil/NR5IzD7lG6Rsa+Oc/b2uaLUdT23l0+dzYBkGEZuh7p8953laedA5iPjz8McSD1ZlSGWrhYFzFool/S3cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHiba5/kX03NlXZZeYDkOIhbLj0hai2ULnKa+17q7Ys=;
 b=1p4q70z+1Ht3OtT53BevcMcstV84s1HJhzt6iDqV0KVSU2kTljlC72Zl3lYdpK1u9ueaNwo05l4kqCzcJNhSfoUc1ok3w+cS369FO0VBcxboe6ukR3+QaHv+rjGx4327yjtd8ao9L/5yB22tKgKpHuGY5xwl4OzOeuvjbSujiuw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=1p4q70z+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 3/6] package/atkmm2_28: new package
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

This is the version needed for gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                       |  2 ++
 package/Config.in                |  1 +
 package/atkmm/Config.in          |  2 +-
 package/atkmm2_28/Config.in      | 23 +++++++++++++++++++++++
 package/atkmm2_28/atkmm2_28.hash |  5 +++++
 package/atkmm2_28/atkmm2_28.mk   | 16 ++++++++++++++++
 6 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 package/atkmm2_28/Config.in
 create mode 100644 package/atkmm2_28/atkmm2_28.hash
 create mode 100644 package/atkmm2_28/atkmm2_28.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 20ad528243..a1294addea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -640,6 +640,8 @@ N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
 N:	Daniel Lang <d.lang@abatec.at>
+F:	package/atkmm/
+F:	package/atkmm2_28/
 F:	package/dbus-cxx/
 F:	package/glibmm/
 F:	package/glibmm2_66/
diff --git a/package/Config.in b/package/Config.in
index f62b1f8b0b..03fcd9096c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1557,6 +1557,7 @@ menu "Graphics"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
+	source "package/atkmm2_28/Config.in"
 	source "package/bayer2rgb-neon/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index aa58f8d593..1f370356ea 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_ATKMM
-	bool "atkmm"
+	bool "atkmm (latest)"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
new file mode 100644
index 0000000000..2340465b20
--- /dev/null
+++ b/package/atkmm2_28/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_ATKMM2_28
+	bool "atkmm (2.28.x)"
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
+	depends on BR2_USE_MMU # atk/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_GLIBMM2_66
+	select BR2_PACKAGE_LIBSIGC2
+
+	help
+	  The atkmm package is a set of C++ bindings for Atk.
+
+	  This is the last version before the API and ABI change
+	  introduced in 2.36.0 which requires C++17.
+
+	  http://www.gtkmm.org/
+
+comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atkmm2_28/atkmm2_28.hash b/package/atkmm2_28/atkmm2_28.hash
new file mode 100644
index 0000000000..776c9851b8
--- /dev/null
+++ b/package/atkmm2_28/atkmm2_28.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.3.sha256sum
+sha256  7c2088b486a909be8da2b18304e56c5f90884d1343c8da7367ea5cd3258b9969  atkmm-2.28.3.tar.xz
+# locally computed
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
new file mode 100644
index 0000000000..dc57363cf5
--- /dev/null
+++ b/package/atkmm2_28/atkmm2_28.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# atkmm2_28
+#
+################################################################################
+
+ATKMM2_28_VERSION_MAJOR = 2.28
+ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).3
+ATKMM2_28_SOURCE = atkmm-$(ATKMM2_28_VERSION).tar.xz
+ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MAJOR)
+ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
+ATKMM2_28_LICENSE_FILES = COPYING COPYING.tools
+ATKMM2_28_INSTALL_STAGING = YES
+ATKMM2_28_DEPENDENCIES = atk glibmm2_66 libsigc2 host-pkgconf
+
+$(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
