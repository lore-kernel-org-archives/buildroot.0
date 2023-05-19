Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870D7C77B75
	for <buildroot@archiver.kernel.org>; Fri, 19 May 2023 14:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2BF44255E;
	Fri, 19 May 2023 14:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2BF44255E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtRSttxwpHUY; Fri, 19 May 2023 14:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 694F54255A;
	Fri, 19 May 2023 14:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 694F54255A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36EC71BF3A1
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 14:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 277D383C24
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 14:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 277D383C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTKPO1gNRjIX for <buildroot@lists.busybox.net>;
 Fri, 19 May 2023 14:46:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A2283C22
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::61b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38A2283C22
 for <buildroot@buildroot.org>; Fri, 19 May 2023 14:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYznNx08+WoDZNa/y8wvWwwHRQc0I8Uwwfs090ofdQqHBPHzohlCqfPMFarJPzhcx5h5R4wVNO9Nqe31/In8/I+QIwHWE6evqZuDK0E6iO3xfvMWX5NkJvPQQKqtH18IQjCk44sOv1AzxXUwjrqvu+pGUPLf8ZDPpjhHoBkoIg4WbR22gRCwO7KCicCccvSHB84V8FgomkDfzM3W4tJj/Au6DmTUi3Q4obORZj1xjEdTiwWSuZ6QXWxXDU3phjf2JflivsVMc0DXhBFTkt6Yp+987RuXVi36R8AZFnNIZX5NAS050gmmifkJv5CVPupEqM6DRwOUwqd+FYysFvm5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0Tt416QzfiCXZBIcichl1ljoNaCCHPZm0Fxkckj3eg=;
 b=LzcM7xSR4kyMRY8Twmroz+O0AgGNEpUnGT1rtJCrZfkUNg8/oKPym7bmhcahyQskTqYFMd9gB4b4bNrcKE//k8h3upPdMkAP9ZeNhAZTSreyaAEutBV42WdIqOaCMfJRAMPl43ptNy8oEHdvcgSR7Ql6tkuK96a1i8f43C8beQSkemcMAhFiYNzWhw4BMLQfdmSMj3yhobImMD8MRz0KJbRRAQgxshUrqLC+74UICt6DEQ32Z4qKi4eT9QCwK/lfB0YXwEZPBcBqf3/oZV6cVLkHHsYBHdhIatec7gKLcovNYTFLNiZfZYXtk+Q44oCbAYHqu+3cF2AbA2V70gwgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 14:46:02 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::cf18:8d3e:30bc:6178%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 14:46:01 +0000
To: buildroot@buildroot.org
Date: Fri, 19 May 2023 16:45:57 +0200
Message-Id: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: MR1P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::15) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|AM0PR08MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd26fae-77c9-4ec6-d700-08db5877c40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38tAUXsnEPEJfdb52sOseL0SyMN+2msbIn9p8PzTWF/t9I6Ngot3fsyReOQlBv2qHhw/rBHh0pPKXer5kdh0QgFKOcSNosRNUvV+Ph00+UGQFxzELAdBqlKWeCUZVfAjkpIy7Q3d+QDPWgR1Eou+dmlPp6Q2zDwM6RyIBSfQarNVLn65VYNwC5mEKFwH+99twxMXucaArPk+5nFVBrdpTU1t7FdBREu4mGuZSR9XopQ2qYQGyV7+uTuu3BC3Ivx6/AUvQc4NyYKIHwlm2RqTs93yj3pJ+hvv2Jc83R4StK5B3yb+yn1Ot+qGW8PnpqGA66q0gpd7zGswSMr45Pm1nW46HjyBkqSbW6Blyz7iV/t6EVWKh8ZruXt3ZgYjmQYlxxga4htYywdAv0jti4VqqPbfGuU0FRHUo+AV3Vbv/Q8tEkFWBiW3AObj4INbSzadSj1XrhTLNnoB2ACv7nKq98eLXq2WXJ+UOJux7jxgiMoPJB16kzexVF2kchGarBzdsKXOI23v4pmxZxlgEg/sGIIW3zrguO7udl+oh4tD9vIbtgztQM2sA3seujkWRqqwhdAcr7N4slRo5Z7bKyWXSVyyEWrgR3w7IcNXwd7HUdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(39850400004)(136003)(366004)(451199021)(86362001)(2906002)(6506007)(6512007)(66946007)(6916009)(186003)(26005)(66476007)(66556008)(54906003)(478600001)(36756003)(52116002)(6486002)(6666004)(966005)(38350700002)(38100700002)(2616005)(41300700001)(44832011)(83380400001)(8676002)(5660300002)(8936002)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eQVJ4Rn/W57+5jDTPWBOjwY1AFOd5oitPnuKCTKpTX+Z+7ppQGfpIWt8w4Da?=
 =?us-ascii?Q?SaqlduBjd2F0lTOvqOGASSPlFv/A+b1blnSVYRYF2rvXrGgu0N10DTgh3aZw?=
 =?us-ascii?Q?q0AeZmP/GU2FAnuA/ebnL6LDx3OArLX7oN2s+hdpor1sM/ia0QVpz9Rv9u1O?=
 =?us-ascii?Q?St4bSZ5db43+2Xnc+p1YpGTgafkrwvA12+hUNunAMclM2/4sfl1/j6b1kcSL?=
 =?us-ascii?Q?pUrWWG/HlrE7Rm4noKpujL7Xx4lJTCcVWEZBC4y1h45irHB1W942LgmIGlD9?=
 =?us-ascii?Q?wO+OW3jBRAoMvKWQR23VUQ/0M7gsuxCSrXBvOy7sy8bSBbIxNMs9+Vyjowfj?=
 =?us-ascii?Q?TLNZUyyq3cccTUbiEOjEmB3p9Ul8eNUjkpDwJcfGwH/IJXaPze5A33QHYICk?=
 =?us-ascii?Q?Gxb6wh0m8536red7p3LGh0aD8AWK7JXcDVzIWR1q98Fkt/nlWkBzVvszDIlT?=
 =?us-ascii?Q?ebHG8jJqo3DwufBPVnJ5Ec3J08FBL+evWWHHgROMXV1RHbYMR1aiC6M/xzrE?=
 =?us-ascii?Q?0MxbMK//lkyh9ow5nk+jCreVd+IR4SI0pXmECdyq0oik8e07P6iuFoQneMT0?=
 =?us-ascii?Q?Ep5dedREvc9ixQ7I4EI1M0Q035ULwy164Zh0G42hJCkS7W1gK78Vcoe5wl2u?=
 =?us-ascii?Q?jw3OxQJ95zf/aAXM7XqNhMvgmDuJiqdKAMBwydkGUF3JgmkmqJwZRxHGeaF7?=
 =?us-ascii?Q?12bUQsMr1cTSAzC/rd4iEOKtptYvD//G57qAIPw2Ui0BkBiRsborq8E8GlG6?=
 =?us-ascii?Q?CkoyL9ljCIU9P0dCYcJfh69xRWxQngsatYJ/PgwHztwFl3GVVrPJaZsBdQuE?=
 =?us-ascii?Q?0wcb2YB8A7tYbFk3wdhJ971Bmy+3M2bn6vxBTALa4KZYzS7DTDMEYfohk9KB?=
 =?us-ascii?Q?l7gAYSmr247VDaAbvro8NyuA34uQDOlUxP2RVmmKyn5H6tX8Gderl6lT4FQs?=
 =?us-ascii?Q?y2REpHO4MW+TnTp4IcP+UBj3ecsivBx0s+hMBNNBCjS7nUkGosr08NBrWSw5?=
 =?us-ascii?Q?GuFsNAkQX3hUp9RMpG4mXMCIDFGhdkZ/PMWYF7bRdbs0zMyNHvewSEvc1H1z?=
 =?us-ascii?Q?WhZJzlkTbTHkfEj1KxAzda9Anxv+NbCexNbwJ8EYKwXu792KOj4ow0//izXN?=
 =?us-ascii?Q?XhvsYVFQ6OiMJCM1AehGya63CJZ4trx8TiXlQ9UbsIMg762MsXKNaGUY7w4Z?=
 =?us-ascii?Q?RlGXvrJES+cgre2WQK9BbkuA35UuowHK8aS+Vmwkc/HbHDxVlgO/2/Vdn0YL?=
 =?us-ascii?Q?kUn4MeK4C69TZFD0mXVGmxc09C92VUJQ1pmtjNZnrx8jHx5Ldc7GK+HbFMZ6?=
 =?us-ascii?Q?9upCmJlcWpdlOAy8exZXggFBjZzcTrB5+uwt0AZoztfyP8TqBqilqAnVZSaF?=
 =?us-ascii?Q?C6HxCFwHqGnydtwzAyciZxcUFdkfeOG4v6nqDwux13j0DDcmR07U/GRHJwdW?=
 =?us-ascii?Q?cnRrbZCu/om7Pqf04eVt4MfZ2h6UlS10vbVyy94UjnrG9PfFDbeOhpGs6P47?=
 =?us-ascii?Q?tQQbQLlG4ELZ1GxlNlZ4DDSVzjmjJOwgayfW0GuwqbWVzQAr4tb3qDe8xq+5?=
 =?us-ascii?Q?+qUKgJ4AaeEKwWxdJclyeTNNQkCpIjN7OlY9JExK?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd26fae-77c9-4ec6-d700-08db5877c40b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 14:46:01.8409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25BY9iQoX0yLE0IIbtLD/Exq3V8SdpIHPpVeYXyqgw9XiWhbjOcEZtLb/BIYG3PpP6mzqDBxCjTFB91O9AgoPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0Tt416QzfiCXZBIcichl1ljoNaCCHPZm0Fxkckj3eg=;
 b=fpcUjYuSe+/FqdoI3CzF+inlR74MkXPg3zj0gv1mukA7qE+D0+r8GVFZhCYlZ3FYEFTpEFFlLD6GhfVMd8QspINb+Z23BtYN8K2/dJHB2tYgJVN0uwGApijfOr6+ig3BqY9TyBXhbXcrf3WzgznFryZAVscOhz03PB7GMvmtONk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=fpcUjYuS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: added option to
 (re-)enable external poll loop support
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
From: Luca Pesce via buildroot <buildroot@buildroot.org>
Reply-To: Luca Pesce <luca.pesce@vimar.com>
Cc: Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 3.2.0, libwebsockets does not compile its external loop support
code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile option,
which defaults to OFF.
Applications relying on that support need to turn that option on, so let's
add it to the package.

For example, when libwebsockets in enabled, mosquitto broker is built with
websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be on -
otherwise, it gives compile-time warning hinting to unusable websocket support:
https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 package/libwebsockets/Config.in        | 10 ++++++++++
 package/libwebsockets/libwebsockets.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index d7b529c..1371717 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -9,5 +9,15 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 
 	  https://libwebsockets.org/
 
+if BR2_PACKAGE_LIBWEBSOCKETS
+
+config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
+	bool "enable external poll loop support"
+	default n
+	help
+	  Enable external poll loop support code.
+
+endif
+
 comment "libwebsockets needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index fb0ee66..86756ca 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -94,4 +94,8 @@ ifeq ($(BR2_SHARED_LIBS),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_EXTERNAL_POLL=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
