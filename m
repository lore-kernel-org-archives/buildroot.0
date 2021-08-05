Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737FCC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:54:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382C36105A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 382C36105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unilogic.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CA48831A5;
	Thu,  5 Aug 2021 08:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7gyJZ3polYH; Thu,  5 Aug 2021 08:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FDCA83145;
	Thu,  5 Aug 2021 08:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 515281BF9CB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65AE2605C8
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=unilogic.nl
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuEXZJ8FpjUH for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A16EA605DB
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iostALtrdFBnHCen0Q9V8VpjxCF0zRVIPfQ1vLL+HlNfIfLWRUUJanXdiX48GgMXq4yu0oXw5Z+8YBzLijI+aqMWxZQwxqJ/YYgg7zn0kNVm5s3ZtpWM0aNBCOA9XeswkPSuw1SNBxKve6wTQdzMfNMEIJAB1dPhMtDvRi92bV3vdywiTpAmqxMZMMEnA2k+GMXDpXg3hnejl2zJZxhpRcTTPhLc/odqfOy8F7iyMO/26LJ2BOXVCPuBbQxDAy5BlC6mq11yhdayv26uer8Ddnlol4nfs+BwAdDlaxWK6iMPy1M9y1CrygPAYZOSO40kfTXyrI7JqWkvX7o1k0SE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXRWDACRAVSQ6FJzAWB+TuxGq6ZCbRFcSL1s0NARwuw=;
 b=dYCaimscOS4BrZFngrxlEAnPpfC6ZAs+7tPhXoPVQjZ4TTjQQZXaapKFdGw+0Jb2HsW1lv6V++eJfgYIHDcpsQWBPmn7aHelLR+ZB1Vv+GwG8BHjQSTdmjSogzMixCAXYBwj3VFNh9/cKNoNZKHSOhyNOddJwOUzuBNz6t397D+H9CF3AbH1pmEKThQev0s4ZZDQqhzKCQQBl6bZzd91g1d319hD7tLnRrq/k21XH1jGgIIi4cTkYEEhcKK7fEjpkQuOqATJMbQLMUi0nAvyOpJik19npZAJrphW+TdkmfgJd73gUhunO8Nio43zNPiPAf6NsKDWpCOgqZg9tipe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unilogic.nl; dmarc=pass action=none header.from=unilogic.nl;
 dkim=pass header.d=unilogic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilogic.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXRWDACRAVSQ6FJzAWB+TuxGq6ZCbRFcSL1s0NARwuw=;
 b=clgYaPCcH3WnxEcigCJH4s62EzX7sGntPe692esPdGWgjCZ9EHitpjWFWYm5x67/gcxQZqbUgsJJY655ZtubZmRCllUuxLREO/JYDCDZRt+Asula83nsKueyiceASlCC2GDdO/4z9JtDDcqvnbp+2pez+lO1SaTKtVrOicoxc3E=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=unilogic.nl;
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com (2603:10a6:208:46::31)
 by AM0PR07MB6339.eurprd07.prod.outlook.com (2603:10a6:20b:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5; Thu, 5 Aug
 2021 08:54:11 +0000
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6]) by AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 08:54:11 +0000
From: Pascal de Bruijn <p.debruijn@unilogic.nl>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:53:53 +0200
Message-Id: <20210805085353.3457-3-p.debruijn@unilogic.nl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805085353.3457-1-p.debruijn@unilogic.nl>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
X-ClientProxiedBy: AM3PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:207:8::28) To AM0PR07MB3987.eurprd07.prod.outlook.com
 (2603:10a6:208:46::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from optiplex-pbrui.unilogic.local (62.133.193.10) by
 AM3PR07CA0142.eurprd07.prod.outlook.com (2603:10a6:207:8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 08:54:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32f5e456-9047-431e-5e16-08d957ee97cd
X-MS-TrafficTypeDiagnostic: AM0PR07MB6339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR07MB6339C2023609C8820E5A8DA59DF29@AM0PR07MB6339.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BUoS2u6ZveHv1wMJOOkjS25X+AP75kyLC6EoYQQhH58uVIam4T300E0RLW6LxBOVKlZ14RHefPNGDbCvj0lQREnyA6eIYayntM+62uKnIp4URt0WDr9FeVBKqNRW8p3A9JvOdHuapp6Ou33hu3blGvXZI4iUkfQF69DLHBAzcAYZuDo10zyezZEsWDwd+ymMizDs4KpWwN2mSRnBw2OiMyV6ZwSEvK/SXo7jSYtzlS4JSGqtdOvln8JHXSedKvQuiX8d51Xw2Hvb1+ia660z4Hqr6ZHAlRWph7N3TBXS8axdILOCAKB9kHFtCAPFIb95leqdXcdSAafpkXP3K5Mr+EcMerYXop62HmzFeeteVWYavI4Uce9cZYZSUOECkTNj3YlTf3Qm4cCXOJSGxNLKtBx4yvvMO3wNC7f0eyOaLZkWsFpo4SyGNtShA/96WIMpRh6kCoS9DK7/dnK5/0VkNwEHuAxngS5FjPmuNSHkb+/O2woOp5XhYDlC9dmmVC0z84PHRKanc6DM9y75tv33uLB5i7XZUJ5wKfKc3nijVeBPP7ZZsiFKZhVwPavCQEkk1/PQUGR+Y2vjtUP/UOuLHgIuEqTComDQ8mFiQHSroY8rfIVLSJjxotpQvI9IIS9dpdzU372ToWv4lkgDYUMYi14dtG6y0ZlFBF2EJdPFxtpcnSK12wETJwBlghHOq7xVccE0hTnyrHUlfE8D+wSVHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3987.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(136003)(39830400003)(346002)(6486002)(6512007)(83380400001)(8936002)(6666004)(8676002)(6916009)(38350700002)(38100700002)(5660300002)(478600001)(86362001)(1076003)(26005)(2906002)(4744005)(66476007)(956004)(2616005)(52116002)(66946007)(6506007)(186003)(66556008)(36756003)(316002)(107886003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k09hNcz8JNHchhW/bs0i9k12QwT9GyPZ6BhqG5wObC+vRU/lOQvogqnfxoE/?=
 =?us-ascii?Q?sweiUqmRW81OBKsYJykYRuSUNDC+7XcDu6/PLtyIYQZDXqfvWpstbN9qJYE7?=
 =?us-ascii?Q?8B6Ng0RcZ9hrwvU0t/EAkiX24T/fGNKOD824TzhadtQ4nMYgA9nGej/mh00d?=
 =?us-ascii?Q?8hw5jxgCpYSu8laEKHLooICuBgb4C/dL92s+bxCSZ/naQZ96z073Kp5Bd4cr?=
 =?us-ascii?Q?i4fqiW7uLTSM2ZUrSpNhHj/sXlAZUR6dPk2Et3hypY8rutwTaDejMePaCNDH?=
 =?us-ascii?Q?YrWA/Z7YUu1B0SpRKVkLusj67r0YvY2Utstbpf8+wZmNPDcqmQS7OaEDe/4r?=
 =?us-ascii?Q?wIAMB2FDat4PYtYT0yFhDE2C0IE2oBSwbkzX4/ar+/BVFdQNfFIom+8wYUKy?=
 =?us-ascii?Q?fsbdOEhe8i3w4uoxEUhBOlwJHdkNey++eUA7zUvg6Y4Da2zSHBk1xf55WA1K?=
 =?us-ascii?Q?sTtR9CAXtDlMK5ePDhYJMznxPEx1uKN3hhp02PgFEWMYRujAWHwlnZn0b/iH?=
 =?us-ascii?Q?R8HrAaDaoh9MbFRyesw2fk5/+3ONwYwpr1RkO2zxTbc1d7H3YLMW1hloMa69?=
 =?us-ascii?Q?0eldp2+QmpMHsIefpxbMlKspFL43OlYvP0qPH9kBnSgt+8hts2BHpHv5fZZS?=
 =?us-ascii?Q?yIcy+RW+I/fKVJJr3Am4f9cSLexO2rHvECGw5TB7xB12sLNcAcQlwxK7Ze6S?=
 =?us-ascii?Q?q08tmyM5IiV2dIMsdkUV1GrASNa8EJa6LbYGvCmcD9rcwUynoUcMHMPCSmZI?=
 =?us-ascii?Q?4/o6WFeo3r8fm2K8vibV6FBvUITYEp3LXvurX7jMNID8+/nuFO4V5QW+Nu9T?=
 =?us-ascii?Q?icLoeNOCMwpZf+5KilI8aAMk6p1N3B2wGSgTSTV6xbEFt8YH9YOUi0GM9IoK?=
 =?us-ascii?Q?KMuRU2rnJlGNYw26ZjDZYMIT4mWaZdc/ThaNHph13PLeXo1+0eUy1ktPem+3?=
 =?us-ascii?Q?jBBUBbqc6M0QV5lgKbiOcIOjVZSVr26kXVjcWJNqpTwiE2u2QRfj2sJvOo1M?=
 =?us-ascii?Q?kunR2Tv25VKvMecuP4m67l26OKM5Cgj28yvFK9Pz1/WK8EKyOJqbx5mIFhl+?=
 =?us-ascii?Q?UfXvlbwm/wl/xewC4+BV0Lq1Ka+u4NeGeg7EzX+LlKC4dblMha+XZZGZvwhC?=
 =?us-ascii?Q?oqRNE0w+Fc1uafsi647DFezS60UhfY7pHU4QjmTo2lC2H1jxBodWPK9caH/3?=
 =?us-ascii?Q?5rPfgpJT7j5lHBmzUkMWb6LCLYsgSbMrr+YHZG+uhuRVEicg3Fo0bQZZH3iK?=
 =?us-ascii?Q?unFgwGVpKgQ6BXFgB3lrU2Qhy90nlMF2mVqMR6vrt++tD+o3vlqv1aAtKtho?=
 =?us-ascii?Q?Z7x+tK0Z4wULyhIRQvwfEgdE?=
X-OriginatorOrg: unilogic.nl
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f5e456-9047-431e-5e16-08d957ee97cd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB3987.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 08:54:11.1616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 80e1d02e-cf3d-42a6-8024-091a212ef6af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwly7UI+HyWHphXpQ5lx77y2dRdE0gfy8/h9rIo/F0Tx7k6lIgX+FviC6eJN86YM5Mh/aXGpkPozTK7CCK2YKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6339
Subject: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: aduskett@gmail.com, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6780b6a962..3cb7090502 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -62,7 +62,7 @@ PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
 # The OPcache extension isn't cross-compile friendly
 # Throw some defines here to avoid patching heavily
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPCACHE),y)
-PHP_CONF_OPTS += --enable-opcache --disable-opcache-jit
+PHP_CONF_OPTS += --enable-opcache --enable-opcache-jit
 PHP_CONF_ENV += ac_cv_func_mprotect=yes
 PHP_CFLAGS += \
 	-DHAVE_SHM_IPC \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
