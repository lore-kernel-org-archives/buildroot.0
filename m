Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DEAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 12:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A407081D4D;
	Mon, 28 Mar 2022 12:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hcq-3QxnO2KP; Mon, 28 Mar 2022 12:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2806981D5C;
	Mon, 28 Mar 2022 12:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 853F71BF397
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 12:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 815B960AE6
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 12:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatec.at
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxZ_nqmSmtUB for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 12:29:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::618])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7603860ACE
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CobC/pCqTxOnAr3+kVHME73d/I7RgaMtifwIzUfJFuE9AVmmjLn0AOlAmnOix7Ns8xV7wZaPri5rkAhCqnDohk8bDgm1Ng1eFkMGzMnxWDH8Jg+DNSSYc7VpcIQlG1+uKYGxzbN/nOKIrsGorUboBuWYFz0Od6O2rt4TBYQb1dIHOHr/KKsVFDTN2fTcH7vbpBiLSC6xOxh8glpjyK9V2TO0m/8lcPTNGIpa5fnKsDCP/AiTG/24BpBspZUdS+iVA9ioJ5mtpGo8BItxdvrwO8pYbsdkybWOMn0Ify8UUmfT7UU+GJ6/Hv1dUXedDoz4xxFP4y8eJnw7B8JtNCKE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8hupYS/JCEfHpGIXF6C5dGCBDrDKgPsvH3zGQW90Eo=;
 b=eHErd4ci1N+yQx/IbpB62J+4HCLjrRsP0LEvCyNZitts6TE8+5TbOyivTxu05531DugCC2GRSQJ/LYf5d8XMdUsGp5Tr08W27VRjmtzIAivnRgVqCSahtXxdvWaEQui285W1Wf8A2kKWjd2EHoN4FM4pcTX6rrU0Nehboth8BAiSmQfmSUruno7gW+IF3JJ2StDx4Tw39uKgVAQcm/jVSdTGCJ1RJUeQnVA8DyhdjQmYk5E5xEleeMnvEePUh/T+HpY/LxZxi2PWrNxU4F/kB58eTtUVz9bA7z5haCgAt0OolTkliZRI5omVfLbkQnOzMFkaAxfigpabjV0srqY1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8hupYS/JCEfHpGIXF6C5dGCBDrDKgPsvH3zGQW90Eo=;
 b=j7dmI/PnNwHA5ctZy5swfowzPpTtgOrC9AHrYIgSICMsb4lUS8f9y6e89T7sRX4mUkdqZWrh1i0EKaPsBYAn4Q6tgdHTUHWmOMJpPbk8jxEU4F5NW7drRUaoHSsk6OKzyZQV7p4tGVmWMmQGtVcutJdiGAq2gTvxfYGwdK7rs3I=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by HE1P190MB0395.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:55::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Mon, 28 Mar 2022 12:29:22 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::5db:c985:a09a:729]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::5db:c985:a09a:729%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 12:29:22 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/dbus-cxx: bump to version 2.2.0
Thread-Index: AQHYQp7OndCOGbfh8UiDASqabw6YvQ==
Date: Mon, 28 Mar 2022 12:29:22 +0000
Message-ID: <VI1P190MB0493DD283963AD9660AF6CCE9F1D9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 17d7155d-fbe5-1ae0-75a2-c3e135a6d42d
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c9c232d-79d2-4df7-d205-08da10b6968e
x-ms-traffictypediagnostic: HE1P190MB0395:EE_
x-microsoft-antispam-prvs: <HE1P190MB039531C5857BB1D4C26D14B39F1D9@HE1P190MB0395.EURP190.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u2x3rQ2R+ZDE4GxEw1JUf6srfjxCE9GNtpOcYeuygmshRPXZCr1fk6Pwu1ZCw4Rownrm2S4+wihtoau18DQ/5W3vN5hI1ijVJQI0p3x1s5Lun0fi1qLXtip8wshtpti6sxOxWL7z61LQAWAaQWsrVNgvKCT8HN9TK+YaUkUqBJTjJ68ivAcbHTg/IIg1jyRUOrjUZZT/ymYVIHtainRzw+AG/YDNYAGz18Hn3tfg85Ik4dPk7Yc9m70opVgt4KyHheVmgxVo458zaW+/SvhV68zE7n6Ia30/BTqoN+dKiE30FdtLmMmdZmGjoLypaH51yWO/4dqF6a1sBdsZMJl7yb8tslb8TI4TvHIXLeX2o5HVu2sgbiMsrk/+ijCM3cGVOWMwzBHIEx7ZQb/+7jd3DtXZThGVDSb3dGr7CWnxO1G7P3adKv/wx6Azzw/Bauscsf8bpJSiWkxbcEP9QjgENbhjMI+Gja2FBE4+JHeJcScNn3b6Oq0jWYbl5war1hJf4ZbJErMx83W9EVhE7kWN/es84tcLe4+Tbo4gLUgLp6UT6cL6CGF2CmLgfBEhsooJYPP6CLP6t7kKZ35K23PxDjzXM0zjG5BwAzwpQVX2hRRbgjJ0x6nKMU9H5TBGf7ziLhwOJWyU2bvBC3TOtbPjyxLC1DLfN0Akvg4i2kB61Z/v2KqQXGygQnMS/uG6tXW/RuyeLR2CFDKDyM/Y3hkUbn+tNjx1QRh5JXnecqY02oLqltq3WQ7w4NSYvi6k+0laRGYZIztHkWmQ1H94QucTznFzt21uUcaD3AZ4ILdIwbE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(396003)(39840400004)(366004)(376002)(346002)(136003)(6506007)(7696005)(86362001)(83380400001)(186003)(26005)(5660300002)(9686003)(8936002)(52536014)(38100700002)(55016003)(2906002)(316002)(66556008)(66476007)(8676002)(38070700005)(71200400001)(966005)(122000001)(508600001)(64756008)(6916009)(66446008)(33656002)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MVzXkDLcxEY4OajnTX06NRjZCisc+JYryb4TTTmOjAGu7HS/8GBt0c1Leb?=
 =?iso-8859-1?Q?ep7W88ec06rF48CDmTrRW9iTjckHMhSvu4v4QMczwO3029qBfT41Y7w2pZ?=
 =?iso-8859-1?Q?QV3PmBd+6vYUL8dsw2i4H7yt3JWHDVdwj3G+zox5QHxCifVAxRRNGxoSQp?=
 =?iso-8859-1?Q?barY49pBsqa5yym7Xmhi5RRWl4Hl+WRbXEy4CNc0WzjF748IbyXMuqDs7H?=
 =?iso-8859-1?Q?KJojAv4PNQzURMxE2gg258z1kjZUAePYwrmUq6M6HvgzgyoH1y3BSQDgdH?=
 =?iso-8859-1?Q?qurMHWcj+Deg7iPCcooq8y//JvE8fSnP3e4bPhXO3/SUdWbQK8mNhUMsb4?=
 =?iso-8859-1?Q?h34daQjuVIkXMzZoycDIlQ97RU/n258Vw+g9fIujem3V5LWFDb9J/BwTJR?=
 =?iso-8859-1?Q?QF5rsoR8CkYXzpYIuA8qeA8htBcdvjh2Preqz7A0vJHqJPiYvBYdDSYd4N?=
 =?iso-8859-1?Q?wfzTMU7WWCWKwMhgtyMUIdsKzv5hs946hH0YmHT+Dhpcy1rqgE9L3bItUO?=
 =?iso-8859-1?Q?W0nAz0CLMD0iaTvAwSosH6cSoTUABK7n4gM6/lE1NeQ0cVJqZeVb4tK6YS?=
 =?iso-8859-1?Q?Gp75tKkJGMxeuRq2zp/lxz8mpf5cI32TaEHZg4J6EHwnS3LpuBC++JdUMv?=
 =?iso-8859-1?Q?FjZ3dIuG/Nqe28JT2ttg1hI5tF5kNBRF2nJhWvb//u4X2IaUqvEoXhkPGs?=
 =?iso-8859-1?Q?N4RGCPSLFZNsRunZbNKRzIPOiieWJOM4t0Me8iGBPsoDGTLyt1YHVUi14m?=
 =?iso-8859-1?Q?mfNGfc51NRl3MjJlS9toIEy6dN9sz5OtjrGVyDiPZyYSUd3YhwrSzBWPQj?=
 =?iso-8859-1?Q?kFxN8pxqXqzI22lukP1WEKEZ7Y79lHpL0qt/7CrBkHauAmm5cu5hjODnQY?=
 =?iso-8859-1?Q?19B4GC/v0zbcAIXc0+pzpJE07x17DmlT6l+l9DhU1ulzojDPVkSGhx/DXP?=
 =?iso-8859-1?Q?H1Gsu771FR4MwnfSWryklA8wjB7ZhTDj631q38LCwsUqdnFHElcZvaoBF+?=
 =?iso-8859-1?Q?Chw3OJg6LTOWj/xUKtkCTJOeLesQ2qaDD63d1LmLFCCbDlcqds9hn3r2S2?=
 =?iso-8859-1?Q?OpE6GlwJksC5FGyNH8B20ogZMrznpUynt9CWOC5yOvw85+X3l2huFtnXFT?=
 =?iso-8859-1?Q?IRULx/0O3kce8jgxeC6A6DhFEVbybOyQsZ82ncr5lyR9PME0O4wBvOqxjh?=
 =?iso-8859-1?Q?gqB1e90G3Huvm895kQM/8XfLAoD0tvFH3yBtse8fUVNB8wln/1QoVW2Chp?=
 =?iso-8859-1?Q?5Uh8LKiAg/RbkaqwmCchmeWgBMCLW/5iVuPX08L+/rVGtiitmbyd/q4iiW?=
 =?iso-8859-1?Q?J60CtJVqfh1qNlPH2wPhTLccVaP7YOIH+hWDyPGDq3Le4y05qY74A88Hlo?=
 =?iso-8859-1?Q?m2r7bdbtZ5u3NoUtgHzoS5tIIRNFguXAytyOe1dAspHRavjOBci17mznnn?=
 =?iso-8859-1?Q?Exlu4UL84cGd3/1e9zcqm+RTLaHfh32qHYu/kSTAqBPAR6bSOyxXqvtpk4?=
 =?iso-8859-1?Q?VqXBg5NRWV1rW9eJXTrJR9MTztvT1hwlxsJ7oYobUOTgZLFvVjeHuR2hCS?=
 =?iso-8859-1?Q?DG+2u3vUIO4vsLffTm29cjKzRD4fau+WtnsH3f/wjTdCDKgNMTWiBYsDl6?=
 =?iso-8859-1?Q?hPYNhrZ0N6spt2Lzv5bhirUyAaJrTIbXk6VnYB8RMIz94QOvt0wun3LT0q?=
 =?iso-8859-1?Q?/9x5PnWwq6IZ6hPm9lCEQHWN1QUvTOxTZNUBh+H018dtSHqLh4e3doqCEu?=
 =?iso-8859-1?Q?tj+A/yUElrdY0JDIAu2Sda+lRNf5icjrRPgMws9vyOVcLN?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c232d-79d2-4df7-d205-08da10b6968e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 12:29:22.0974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IrKb4od3N16PNE1e4dXhtIfhrg0AbJIyJWiVEf15miiDviva5kZvawVr4NqZFtHX1u8MpHTWxlG3Sq7apRJwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0395
Subject: [Buildroot] [PATCH 1/1] package/dbus-cxx: bump to version 2.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- License has been changed from GPL to LGPL or BSD-3-Clause
- Drop upstream patches

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 .../0001-gcc11-include-typeinfo.patch         | 29 ------
 .../0002-cmake-improve-include-paths.patch    | 91 -------------------
 package/dbus-cxx/0003-sasl-use-uid_t.patch    | 41 ---------
 package/dbus-cxx/dbus-cxx.hash                |  4 +-
 package/dbus-cxx/dbus-cxx.mk                  |  4 +-
 5 files changed, 4 insertions(+), 165 deletions(-)
 delete mode 100644 package/dbus-cxx/0001-gcc11-include-typeinfo.patch
 delete mode 100644 package/dbus-cxx/0002-cmake-improve-include-paths.patch
 delete mode 100644 package/dbus-cxx/0003-sasl-use-uid_t.patch

diff --git a/package/dbus-cxx/0001-gcc11-include-typeinfo.patch b/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
deleted file mode 100644
index b4b7d83de2..0000000000
--- a/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0a4c5db225d8d213916655593471e303ba71e0ea Mon Sep 17 00:00:00 2001
-From: Oleksandr Kravchuk <sashko@users.noreply.github.com>
-Date: Mon, 13 Dec 2021 03:42:44 +0100
-Subject: [PATCH] Include typeinfo for typeid() (#83)
-
-Otherwise fails with:
-    error: must '#include <typeinfo>' before using 'typeid'
-
-Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/83
-Upstream-Status: Accepted
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- dbus-cxx/demangle.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dbus-cxx/demangle.h b/dbus-cxx/demangle.h
-index b71bcb9..9a4e99b 100644
---- a/dbus-cxx/demangle.h
-+++ b/dbus-cxx/demangle.h
-@@ -21,6 +21,7 @@
- #define DBUSCXX_DEMANGLE_H
- 
- #include <string>
-+#include <typeinfo>
- #include <dbus-cxx/dbus-cxx-config.h>
- 
- #if DBUS_CXX_HAS_CXXABI_H
-
diff --git a/package/dbus-cxx/0002-cmake-improve-include-paths.patch b/package/dbus-cxx/0002-cmake-improve-include-paths.patch
deleted file mode 100644
index 1f6a36a2c0..0000000000
--- a/package/dbus-cxx/0002-cmake-improve-include-paths.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 5a0ebbf55515a928acf9926d3fcd789115e347d3 Mon Sep 17 00:00:00 2001
-From: Lang Daniel <d.lang@abatec.at>
-Date: Mon, 17 Jan 2022 13:57:55 +0100
-Subject: [PATCH] cmake: improve include paths
-
-Adding the dbus-cxx subfolders as an include path might override system
-headers (signal.h for gcc 10).
-By removing the subfolders, includes can happen via #include "..." or
-via #include <dbus-cxx/...>.
-
-Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/86
-Upstream-Status: Accepted
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- CMakeLists.txt                | 4 +---
- dbus-cxx/matchrule.h          | 2 +-
- dbus-cxx/sasl.h               | 2 +-
- dbus-cxx/sendmsgtransport.cpp | 2 +-
- dbus-cxx/simpletransport.cpp  | 2 +-
- 5 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5b6d28c..e76cd61 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -207,9 +207,7 @@ set( DBUS_CXX_HEADERS
- 
- set( DBUS_CXX_INCLUDE_DIRECTORIES 
-     ${PROJECT_SOURCE_DIR} 
--    ${PROJECT_SOURCE_DIR}/dbus-cxx
--    ${PROJECT_BINARY_DIR}
--    ${PROJECT_BINARY_DIR}/dbus-cxx )
-+    ${PROJECT_BINARY_DIR} )
- include_directories( ${DBUS_CXX_INCLUDE_DIRECTORIES} 
-     ${dbus_INCLUDE_DIRS} 
-     ${sigc_INCLUDE_DIRS} )
-diff --git a/dbus-cxx/matchrule.h b/dbus-cxx/matchrule.h
-index 69fdab7..18c9e81 100644
---- a/dbus-cxx/matchrule.h
-+++ b/dbus-cxx/matchrule.h
-@@ -20,7 +20,7 @@
- #define DBUSCXX_MATCH_RULE_H
- 
- #include <memory>
--#include "dbus-cxx-config.h"
-+#include <dbus-cxx/dbus-cxx-config.h>
- 
- namespace DBus {
- 
-diff --git a/dbus-cxx/sasl.h b/dbus-cxx/sasl.h
-index d7429a3..44edd6e 100644
---- a/dbus-cxx/sasl.h
-+++ b/dbus-cxx/sasl.h
-@@ -19,7 +19,7 @@
- #ifndef DBUSCXX_SASL_H
- #define DBUSCXX_SASL_H
- 
--#include <dbus-cxx-config.h>
-+#include <dbus-cxx/dbus-cxx-config.h>
- 
- #include <memory>
- #include <stdint.h>
-diff --git a/dbus-cxx/sendmsgtransport.cpp b/dbus-cxx/sendmsgtransport.cpp
-index ae053ff..a10ae66 100644
---- a/dbus-cxx/sendmsgtransport.cpp
-+++ b/dbus-cxx/sendmsgtransport.cpp
-@@ -21,8 +21,8 @@
- #include "dbus-cxx-private.h"
- #include "utility.h"
- #include "validator.h"
-+#include "message.h"
- 
--#include <message.h>
- #include <string.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/dbus-cxx/simpletransport.cpp b/dbus-cxx/simpletransport.cpp
-index f291d9f..fed4364 100644
---- a/dbus-cxx/simpletransport.cpp
-+++ b/dbus-cxx/simpletransport.cpp
-@@ -18,7 +18,7 @@
-  ***************************************************************************/
- #include "simpletransport.h"
- 
--#include <dbus-cxx-private.h>
-+#include "dbus-cxx-private.h"
- #include "demarshaling.h"
- #include "message.h"
- #include "utility.h"
-
diff --git a/package/dbus-cxx/0003-sasl-use-uid_t.patch b/package/dbus-cxx/0003-sasl-use-uid_t.patch
deleted file mode 100644
index f08769b6c5..0000000000
--- a/package/dbus-cxx/0003-sasl-use-uid_t.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9db9673c0c2407e18e215844adadbd4a397e6f78 Mon Sep 17 00:00:00 2001
-From: Lang Daniel <d.lang@abatec.at>
-Date: Fri, 28 Jan 2022 07:53:13 +0100
-Subject: [PATCH] use uid_t instead of __uid_t
-
-uclibc and glibc define getuid() as
-extern __uid_t getuid (void) __THROW;
-https://elixir.bootlin.com/glibc/glibc-2.34/source/posix/unistd.h#L698
-which is a typedef for unsigned int.
-
-musl uses uid_t as return type
-uid_t getuid(void);
-https://elixir.bootlin.com/musl/v1.2.2/source/include/unistd.h#L108
-which is a typedef to unsigned.
-
-glibc and uclibc include typedefs from __uid_t to uid_t,
-which means one should be able to use uid_t as a replacement
-for __uid_t and make compiling with all three c standard libraries
-possible.
-
-Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/87
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- dbus-cxx/sasl.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbus-cxx/sasl.cpp b/dbus-cxx/sasl.cpp
-index e8a6060..7a76af6 100644
---- a/dbus-cxx/sasl.cpp
-+++ b/dbus-cxx/sasl.cpp
-@@ -70,7 +70,7 @@ std::tuple<bool, bool, std::vector<uint8_t>> SASL::authenticate() {
-     bool success = false;
-     bool negotiatedFD = false;
-     std::vector<uint8_t> serverGUID;
--    __uid_t uid = getuid();
-+    uid_t uid = getuid();
-     std::string line;
-     std::smatch regex_match;
- 
-
diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index 907de1866f..5b3a6188fc 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  05c4f4750261f09819564bb8ee93b5d7f56fd05bbcd755858860fa6697d09c2a  dbus-cxx-2.1.0.tar.gz
-sha256  e85e018c8ee7d4f439b097289bf4371f6fcfec24e89f3e77c422944501bc383d  COPYING
+sha256  55b2541b9c3f3fa705e51e12e6971f66826ebc7185071e0cd1bb6ec9e5adf47f  dbus-cxx-2.2.0.tar.gz
+sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 3e89fc9db7..b850d45003 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.1.0
+DBUS_CXX_VERSION = 2.2.0
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
-DBUS_CXX_LICENSE = GPL-3.0, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
+DBUS_CXX_LICENSE = LGPL-3.0 or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
 DBUS_CXX_INSTALL_STAGING = YES
 DBUS_CXX_DEPENDENCIES = libsigc
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
