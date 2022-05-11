Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D902683E1D;
	Wed, 11 May 2022 12:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQr9IAt3krrA; Wed, 11 May 2022 12:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B3983E29;
	Wed, 11 May 2022 12:35:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58FF11BF2C5
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 12:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 475B540B66
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 12:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ao3hRQx7Ecmx for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 12:35:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04FE040150
 for <buildroot@buildroot.org>; Wed, 11 May 2022 12:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dsq7S2RVb6f1DhT+jZD6SyYMkX/wmshqYkw4/GjiJaU7ly8B+T/pciZtFmJ4ilqdMa8T1w1r1Cp4dAUofIcRT6tzPRh2jz2cga40K5+TaXoxLS/t0P2CTtFEfOmU5c0bxKx5h1aB9Ts+1O2fjuDPD2BtaxmL+N1+ObNmAiaEC6rF3cQw/L8dYRjxQphO4R50RWy/umjuRNtUUauZ+OWkYcsDQocVoOFV6bAciUhGUlPho90qMm/m26p4iSnc9XCZU1tn9MUFR9FI2AqUfRwO9Z4IGBXorUGwBOMp9RHsKUqh+UNZ1lcOPGig0cm01X3qHc0Xhqup/NCpqoKElOlOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy4s+Lmxt2YtWfG5gkH5QH4HCzfrQn3fqf3Degb+178=;
 b=gO2+5O0P/UzNf2fzY1nUENISPursZchmgUUUnOVaflNgQZw9fI6nx/A/KM6nrJqg1qbfpcwnilxS0iB7uosIT/DNbB73w23zeHpn7ffgwTlYbH4B3kI+OPctVXlMSjAAbzM/MN+JwTHRWhx7HVHknU+ha1oel+SfZjKDU8iM9ejCnDC9nxEdNe6ihjaepnrPDgJ28gAll7uv5nKMVtMMKjPGNhv989j3r0TfROKqaJlb0GpTvZHfEMKf7Pd6S9kUZRsZfAiwGWLRKDkQbgbGXBJo0YiJrc61EGS0kzBf2JElK8PcXqtRXaYlDvsq3vtwDhehNNxgGS8BykBL7DjfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy4s+Lmxt2YtWfG5gkH5QH4HCzfrQn3fqf3Degb+178=;
 b=j2NgJPAU43LZZL+LXoEf0NLdW0Gz6XYbdiW5ABZP9RFMFavubzGSislt+be2DO7UF63JFp3w4+xdVbDXxPvOkPl/K8N1TlFkyblgZ71TDdf1Cy+89TAKkNHfmaLmwMftU9i93cQ6Q8ogKyKzqS8pmINa+dYE2HVGOTxofGlFffM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VI1PR04MB4798.eurprd04.prod.outlook.com (2603:10a6:803:53::27)
 by HE1PR04MB3257.eurprd04.prod.outlook.com (2603:10a6:7:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 12:34:58 +0000
Received: from VI1PR04MB4798.eurprd04.prod.outlook.com
 ([fe80::98b5:bd1b:d1d2:808c]) by VI1PR04MB4798.eurprd04.prod.outlook.com
 ([fe80::98b5:bd1b:d1d2:808c%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 12:34:58 +0000
From: Bert Schueszler <bert.schueszler@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 14:34:23 +0200
Message-Id: <20220511123423.1600023-1-bert.schueszler@theobroma-systems.com>
X-Mailer: git-send-email 2.30.2
X-ClientProxiedBy: AS9PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::24) To VI1PR04MB4798.eurprd04.prod.outlook.com
 (2603:10a6:803:53::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f506ae5f-9e81-47d4-896a-08da334aa8f8
X-MS-TrafficTypeDiagnostic: HE1PR04MB3257:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB325790B9D76AA041C47EABA4BEC89@HE1PR04MB3257.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtqPyyvwizwMv/xvy70g3DvdgFqOP+GFcjzfXDLkdtMtjTAAsMVd5z9b7dUMcGYieLfxfLcukpCpPGao4QBaTDh2ATg3PIW1qbq5OIL110qZPmEkDcCr+DQ8mhVeRydJzYmPqv5cnHYXhZ7fyW4kkmNxlR10FJpiHi1OAZb2W+tHB/xlr92BdAEWEvUatpi02rXu6m5gZb8ahsQkhWKklrTDclYDXQOTwmRz01P3Y3cEMFYDPOMe0+g00QJOORDEbvUwK+OH5c5bJb8h4ZcDDKkU98W/Q13TjWE3rM4jcqf2w91vTRyr3sQwBsqPKqn16BH9kNy50J35fojFRjAmE1CXuRo+Ze1TgreQzR7i3FpTCqEqQIET8/nDwpygfmrHUlJSXFjB0GrCTutLnwmSbJrtD5PnbCVD/Z6x9xH8s6N5zNOMsuBuPhBUhn6I5vtIQX2qlKxXrL+2gocDn2gjh6s/OvNx8JOtmL1bh5AYPe4mxc/9s57G2ikXstFzCEvWhipSf5cZPb4lKxQUjU5LhhYXvI8KeTghf59dMBKGGIfgjlvSeBWgiiilYvdoFGwVzm7+Uf9a5eQKMFaLpn50N+78QDfy9pYXYRtML/rOJrhB8zT/FO2JLKY0NLhoclThNi0HvHbGxwrzXSoS6T0VcIyqtRqKabiyIBwTgMrbKmdQgETTI4VTQ2caOZoLjzWiLfOQtyNqpJvVoFKnrLdsBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4798.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(54906003)(107886003)(36756003)(2616005)(6916009)(1076003)(26005)(86362001)(186003)(6512007)(6506007)(66476007)(8936002)(2906002)(52116002)(66946007)(8676002)(6666004)(4326008)(508600001)(6486002)(66556008)(38350700002)(38100700002)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gphe9cAphFtAnZLv3Qk4aFS2iz0kDNY7WCQUCU0wZvFJxWbXfqnhNBCvR232?=
 =?us-ascii?Q?XQXEQ8xzQG1IUf0hVwaY/mpk8aj3Nq1CcIr3pd8q4EXhYZfxBzIDYolvb921?=
 =?us-ascii?Q?z6KCk/rAi9FD83TL60BoQPkvstUDnkWRXn160bSfTxRvgkPyaOqrLpiNl5oB?=
 =?us-ascii?Q?QU8qHtumO3AQHauxXpbJsuzKDXGQ1Ic3xJJe3u0ggY/P5Jwg9NlNFXb3usbr?=
 =?us-ascii?Q?78Awl/jMwztG7PQy48AdpmPAS7dkGgn1rdtXxlIa2wxXrk0CGvQh5NdaZ+Xp?=
 =?us-ascii?Q?oyubKwwUTbFon97OalnBReyfyXCLM3dTf1g8jw3wFhl8Bsq+hZIJgUOFd5Mt?=
 =?us-ascii?Q?eq1o1Xgx15TCwS3cYpuLv49wNlA2Q9UrCYWkbCGBIK+A+pDD7FJ9enK6mChg?=
 =?us-ascii?Q?RKFh8PYePT2W4L6IirDCL/wsoJBhnuKBfr0I9QeoJ2nDUEGxz0ohCIpZivXU?=
 =?us-ascii?Q?5OV/s876pG8e+wNP+qPDG7brfeenCUWNV24tRENVAspThGNYVR1RcRmQMyl7?=
 =?us-ascii?Q?Yd2x8qiO5/YSRjJBV0x1Bf0bG6/TNMWnzjShbyJmeQg1M7u+klGnOVAf3oCs?=
 =?us-ascii?Q?GpREzyx3XTaOMGi9llmz4o+tWf3XDafj6bKCF1+27hJT4r9ASJSpoTvN5wHH?=
 =?us-ascii?Q?ueHtsQxTMVBoJYAyd/7zidGvGJ9N5RmMPbJPCuqrYoLqMwBE8gZ/Voipa1VE?=
 =?us-ascii?Q?JyA1TSva2CuDPOQT7RuOu7ymHxH8vW2GvSgZ42PqTwY334XM0Yp/qj06SlTn?=
 =?us-ascii?Q?TaWDHrIKfj55jp2RAFg5Ls64HMcUuRFAemI824DdbZrNkd/s3U4fXry7gF0P?=
 =?us-ascii?Q?Bir/GD3iaQgDiZ4nEDJtfMmXjuZwMmn5sZmCJUpkjhY44rxDi2UENxWu7Ev3?=
 =?us-ascii?Q?JBq5Tx5BEJmMkXqA7Jf9niT/yDEADS9crDZbfj5rpIIbznyx58o9Kw4eONvm?=
 =?us-ascii?Q?M1nRs/W5eBDtHDg2aDmBFqzVLNoHm3I4GISdo2uyJpuQmfeLgZbXR9LBlbUJ?=
 =?us-ascii?Q?Jkzp3XCR44Xv9qBcKC4wu6OX2191Jy1dWG7VhPXHZMaYaDM0euFiApC5OU+M?=
 =?us-ascii?Q?KQFqMkeVPXrlnbBpbTNoAyjEKAC5K79Xe0SW95RD+w5CRZQ8nJCIWSoQirUc?=
 =?us-ascii?Q?XAwVsCUs/Q/EhkT1BvhaiovKw1nIqhapgXA8iPF97CBFC7tXeotoo3z1liBa?=
 =?us-ascii?Q?QGyR1mt4QY05U0YNMacaB1pO5Z7Isc5pnf1a6B91y8D3gAJn6ny7uAYsKItP?=
 =?us-ascii?Q?LOcs5cyCyB6/igTor6hUb1dD/1rbgieMZm+X8iMMv/6qo6+XZTGaBcKK93zX?=
 =?us-ascii?Q?ZD/mqLLs3nFNyhBaUYOhFrL/ZBoSQ5ibsGQSrY14ZxxZ+nhWUnV59FUVaAOf?=
 =?us-ascii?Q?BvaLgz9ZEcz1vHc7g7PAXPdMin4YVlCksLyo7ifNCNn/IkTr0MN7BgWzvGia?=
 =?us-ascii?Q?OT4HwMQiqHRS/GOuEdfmCbOt8SOPlfXu6LYCnftwK5XLfkCTmVJ+367waSd3?=
 =?us-ascii?Q?6G7hoGtLejAedtc4JtC2sS+EOuXE9jc0pPdBG+AFIiMGTuamirBHFTlpjrs6?=
 =?us-ascii?Q?IiCHz+jR9E5FnCwi/P5CvRNZS4c3Du/W20sSfFFt+g0v5I5vd51aBLVcyH41?=
 =?us-ascii?Q?i4MA6smgF+q9zO9x5YJjdQlC1Ye7mjqZ/JzN/RPAQ8c+eth5uwLpYJx23/G4?=
 =?us-ascii?Q?AU8vSHsnSqCxG+SHZ++JtjuvuS00cyZAYpyJayPYMuiaiYWIiIgLuit/y1BE?=
 =?us-ascii?Q?SYtwOp0PrOhar7fD5KQSHA47lAbGazWwS6P7a5G/Bjh2VWJ30bE7?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f506ae5f-9e81-47d4-896a-08da334aa8f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 12:34:58.3678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqNZKmQKQEMFDAkW9pW85D8xLSIyZXtcnr80icZe4yql6f8rlrfDpoZRXKcUq7SpZnmOf6azkKNOrbE0fgvEoH4qfvz1oijJ3jT+Eqzu+zLHkpsic470qQ4qMxa+ZFbW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3257
Subject: [Buildroot] [PATCH 1/1] package/strongswan: add config option to
 enable bypass-lan plugin
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
Cc: Bert Schueszler <bert.schueszler@theobroma-systems.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In case the user wants to use the bypass-lan plugin for libcharon, add
a configuration option.

Signed-off-by: Bert Schueszler <bert.schueszler@theobroma-systems.com>
---
 package/strongswan/Config.in     | 3 +++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 430625a102..c611175f47 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -191,6 +191,9 @@ config BR2_PACKAGE_STRONGSWAN_SQL
 	bool "Enable SQL database configuration backend"
 	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL
 
+config BR2_PACKAGE_STRONGSWAN_BYPASS_LAN
+	bool "Enable BYPASS-LAN plugin"
+
 endif
 
 config BR2_PACKAGE_STRONGSWAN_PKI
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 95079aceb3..44c20f8414 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -57,6 +57,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
 	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
 	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no) \
+	--enable-bypass-lan=$(if $(BR2_PACKAGE_STRONGSWAN_BYPASS_LAN),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
