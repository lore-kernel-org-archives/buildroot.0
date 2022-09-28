Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAD0C04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31DB382F84;
	Wed, 28 Sep 2022 14:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31DB382F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLEVc4jMqcjl; Wed, 28 Sep 2022 14:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2DD82F49;
	Wed, 28 Sep 2022 14:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D2DD82F49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6B41BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0199E60F53
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0199E60F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LM5LJWWNTjdw for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:33:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F74A60E15
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F74A60E15
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No5XNnDTToK8UBIgbfYP8y95reJQsEhOHkj1NY1dEUTRWj+ygUI9NP64/acwnVXNHaGwvy+wkSdygGEYFrSmsYpLx6K+NTrXk+GD69uxCevfQzlFiGPykEz93hkpK57PstTNJgSNKav2wVGH82qnH+9tCLSepXymMmvyRPN3XeEnY3iJ46Si6KMAWsp91mvuPt2MDRmUolGHGTwumBvyfTjch5VEUYz4Ov6ciM/a7Kh7c1NTZRjfblutSzKDQMdMpty9BzPxG/UAXRQ3ScDAatFF2wxBJD1VfYfWZTP6bvYRPnHnJ0P4zCxumvljAXzKGgxN0nfhaZcqardyItFhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdjB1iOw+Tns8tlc4N1+idJKkpVCVqC4z/+6iEgj+HU=;
 b=VTJ0Rkn2m8jv/EyxBpLLjqdKQbnfAGBFOd19yb44T6Heh2muxI0j9RbBvV/+HvbFDIiOFEjQyUVB7IFOVYUcXtmqw7uXycefNKcGkryLdB7NxE73bT+eLQioiQwWFEgnEUrN6qQVyii11nbfY1+7j89ebhZ+q5ANjq+jIgPGLKGp0Eq2znFnY9vVHR/JnkuBm1xcGvvau2FG7v1DJjG5Lf8q9djXUzk7X1QuBL8sp7ceeRsmQCgy4rMTHYSe4rKbgWRs6x7FAq39M/U3X1EuIK0Q4CiuVfZVwkOXsssVt3VaIRClJl3aA3eECIuNRlj0GEPpKcK7SdwfaLR+XaVkGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 PA4P190MB1101.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:102::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:33:07 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:33:07 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 09/11] package/spirv-llvm-translator: bump to version
 15.0.0
Thread-Index: AQHY00ZBcVSIkHWhlkOkYdjYfBlTIQ==
Date: Wed, 28 Sep 2022 14:33:07 +0000
Message-ID: <DB6P190MB04880427B1DE37B89A02A4229F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|PA4P190MB1101:EE_
x-ms-office365-filtering-correlation-id: 93afced4-1981-4f65-3260-08daa15e5c81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uFSQ6/O3eFPaco6vw1FiuZ0p4yyLSykou4N1NwPP3HNoM2z8XAKOu5nfdAR8WztWU1OQIc3eZNeLa1LscLkmzQi33Mwdet5LAPmGM27JUABko/+xhRNKdUsoFwg2m4KPQ2fUiASvVptBEXCXnkGpiHttVkjmlJAvDe+2E7Hmo5q3ZfRbeV8rBtBPgwF+SpNr4TEWPAm4X6t5DzzoJdFnSeLFu4kYyQxYDNTY99vTIaE1rI/NpIaTnxyim7q2beD9FI7V+j/iNEfIA9x0u+wHGtbxp1AMoWZx8PPFCuK2g4EyltuQbztH3k+d09lF3NKT9PSRZs6y0YXfaruIabXA1/OVT4tCKzNDDe44Oo7j/lbOf/O08T0L+//0BGK4KiYgu0NmBwi3Zf7/RHEsYFebwWkgQE4iMDy0/sjuzRI3uG6Qd8amfWDRxFaF67Vu5dykCwM8pVEE49M4sSODIB+uGvAev+N8zJiJD8w2/4KPZ4euCyvO4iCzffDqVlgIpCf0gbNeMSvzrXx15HtY5t0cgAcqPntEsCHx6KdTXS7wPIUYPEhePWMN5f2jhagbJ404CR0+x8dLY0A9iMwfVo45jX+VSHi5B1b7f9lVuTsqwOCyhUGW41OMMVYNS51SN9qwJq3eOJeI9rUSMpfusUffIOfsTCxZ+OA22SWn6HxMVthb2kZtsKn3A20HD8YeIDV4AYb6V2QMdxNFq10t29QcfkAOYeqQNlIDQ//dZ/QZcuR4ZVtMaFW+6K+Hth8iUGj5ypdheNpZF6LPGPhPhRuitQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(376002)(346002)(136003)(451199015)(66476007)(26005)(9686003)(186003)(478600001)(6506007)(7696005)(38100700002)(38070700005)(316002)(2906002)(83380400001)(71200400001)(66446008)(33656002)(54906003)(6916009)(8936002)(52536014)(122000001)(5660300002)(41300700001)(91956017)(76116006)(66946007)(4326008)(8676002)(66556008)(64756008)(55016003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P+TmBTfdas+DVUu2X0+fqo+gNlROEy3lo1HPfUnhXZ36MJlrJvotWnDL0N?=
 =?iso-8859-1?Q?+40OT7wlHb9CvMXmJtj9XEauZ9o9SU8ynOsJHU6Y+zLwk3gUC2q5VOrcpL?=
 =?iso-8859-1?Q?TebJnrLXC8W5DGfHLHbfs2ijGsdlo2B1PitRKZj21crume3iswqQ4xi/fH?=
 =?iso-8859-1?Q?dBR0XjMrJPo4WYFAJbjPV38iZPyjFPK3gAFwCyRxccoUXptXompiwWONdB?=
 =?iso-8859-1?Q?ilJjBuINkqqWSXdwI3Qc9dwt5NqLi6K5961OS5+3WvIycfGN6KhKOp4rqG?=
 =?iso-8859-1?Q?m2pyqoX2Tyi5vsllg33MUrpcBxAcXXqKhonGTG7fI6TTKt9NGucGRVlz1F?=
 =?iso-8859-1?Q?d9GN7p7uyEyZ40XhKqEHV1mtMj5Kl7SXJbdzfFD3qnTbEExx2Y0KuTK5B3?=
 =?iso-8859-1?Q?2BTT57/Hw7nSqyM8/DuOQt3dyEjfTxaJC7HN3gB5qEue7muRI8IRUyFWfa?=
 =?iso-8859-1?Q?BKF8zQplpJYcAS6G96SqhXm9BKwL+hwKvSX/ZZxPn1MU8pb6RHDo6uDG/H?=
 =?iso-8859-1?Q?LZBitwgH6rWsn5lmdyy6zQ51czbVPoKsWUGBPziioT33pB3yPzyy35kHUz?=
 =?iso-8859-1?Q?bc01y9795ClUp1Vjt2mQA1tgWXAHdlo1HYEeiD9cEbS7N+igYBgzqY8Ucf?=
 =?iso-8859-1?Q?4zB6Cpoc+xFz4S+tDsunpx9cgy671E9SVV9MOlYcIc090uMQGH5lBnMHhS?=
 =?iso-8859-1?Q?VerlmvyzcHhhSA6fuML29hFfz6ViA5wSp3cik45JGsaEPsq6U0+NhZr9DT?=
 =?iso-8859-1?Q?0yp3JVbi4mFzH5U7Y4htUgj709/XrEr1ZdMEHV3ePes4609drq46iS3kQj?=
 =?iso-8859-1?Q?IW35p+nSytUyl+VjXapYNTcjHWU5JbIb56NcKAm0EFF7C9emivNXZB9b5v?=
 =?iso-8859-1?Q?GMse041y4sNzWdJkcTDqqXL7V/xBTHZ+dD/zaug4tYum9W36kd0Msqbecf?=
 =?iso-8859-1?Q?wUh7u729ckXz9L6nA5z/Kc0YO4hwZSnr3kvU3D+gSFQPtyeQupMrituk90?=
 =?iso-8859-1?Q?bAHnkLg29aJPuqt6IiAdVovNurqu8p6gLB1pMFI7w3mdeBwnZoU0WZxz1b?=
 =?iso-8859-1?Q?t4B+nuFVtnPhgke9osevmExSN+hKEvO6LtimJSSYvqRNnNfmdHsZlP+dY4?=
 =?iso-8859-1?Q?q/878/zJ841NeQQIQ6Nieij23BcNv7c7pOYcjBe8PBP8rfTqp2Vqm7l36R?=
 =?iso-8859-1?Q?tKbftOo4IczIy+iGpg+qOS5I3Uwt0e48Bj0URQCOkMqTsgI/eKn8uLGQOh?=
 =?iso-8859-1?Q?NyfSTZamx0ATlnSSOGHZ+DkFfLHpsqIhNMHo3S1HGcrp+jqMIZk7gYpwSZ?=
 =?iso-8859-1?Q?TXdBCtFIhYRdoqQ8DrBkfFzmI/iz+xGg61DG1/LMKuKKp+POAb+J50c8b0?=
 =?iso-8859-1?Q?5RqEoo+IbHJuc6wXmvrRz8lxKKK7DQ1kChbBDCjye0+ybwBxaxZqi6WHnb?=
 =?iso-8859-1?Q?CxR2G03rTFGOZqqkKx6EL/Ivuo2NXvUJ5xuR8a1Xhq5BtStWFvkLYS1MMB?=
 =?iso-8859-1?Q?AOAG2ZIYaw5CYFfS4FlGGI9JjtQiTZZiTgtdI6UoAaDqdGrky6Sn72XpJL?=
 =?iso-8859-1?Q?cAAZJygOMnRC/osjN5yIykIt3sA+0paaxHl+6dR4E4twGxKP9yxIJwZY2l?=
 =?iso-8859-1?Q?yJYFGIdSl2zOA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93afced4-1981-4f65-3260-08daa15e5c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:33:07.6846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/a0zY4DMfzAAj1cI9GvQJvNwqtfL+W41d0UJiYgjO/X0nAKYvWOGZcCQJOVZidj6fOUiyW8FcRXleOHU5t30g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdjB1iOw+Tns8tlc4N1+idJKkpVCVqC4z/+6iEgj+HU=;
 b=tONI+DH+c9leRPKuPdGh8MVFbpc+W8DB5VU+sY+7K6lsOcREwh5dVbijdINhSoAISMRs+Nj6lkJzMqcKgxtAe+04TnEwrahAsoWD5WLF9W3UvFnpI05cj6nOyRop7uLntokefwvJ63lRAeUS98KqZjXLggZZcg2VeFNdfNGNJSc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=tONI+DH+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 09/11] package/spirv-llvm-translator: bump to
 version 15.0.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 6133b1326a..ba0abd07ad 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  bcb0e5ae2d15f9876551fda46b222f911ed5afd626dfbcc66ddea9d36563ac9c  spirv-llvm-translator-v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18.tar.gz
+sha256  b1bebd77f72988758c00852e78c2ddc545815a612169a0cb377d021e2f846d88  spirv-llvm-translator-15.0.0.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 73f7fe02de..23bb7fc66d 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-# Generate version string using:
-#   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
-SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18
-SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_VERSION = 15.0.0
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
 HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
