Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CE6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9995C60234
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9995C60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66B0640169;
	Sat,  4 Sep 2021 20:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBTJr-EFcYmi; Sat,  4 Sep 2021 20:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEFE4014E;
	Sat,  4 Sep 2021 20:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3FDA1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A03BC40105
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsmY22J1AaBw for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20805.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::805])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AA894015B
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBppT5N+2jGg6fRlVRz3F6t34AzyQuwKQGiSTZ288eClz8o0VOasq/04VuAvdDPEBPL9N/4C8f6RXAjfkKAFJ2zcte8GRt7ab9UkcXW+Y2r0xgMIj9DR7xAtSWVpgSP7h44WEDwRAq3iIyUpAMuAmwi18OMC+lR6cstyc8bHSV0tF/HhlhNQ0dYNsWgMylSwW5LkSBVb2Yp3YWn1SHz7ktYXiVgN7of1e3HUEGRqHm2rRkIurSzB2J/aUyRU7S7E5sGs41A+BkwpnQCb75sQ7isyMsOoJPG3s2fJJadUImTb2iyGwmiF7DA5iXpv+JPT5Kh7TYgLsxMclayvkWElyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WwWcgTJfrjRXzDdaiZh2QWDYxEXTIxwMzqWkG0QQjiQ=;
 b=Y5Ory2mBPT7DyAlKv9NBg3tET+hcliQW8x50tqv8i64koDr6SRzmn7w310kHVnQQ/d/KJT9bsDheg76tStWaV2hp9eeyI40vqk6OSPCPfIgOycydeRyIWBkOGgdidktoE0u1lgagYqAWlD5BRJ/a/aZpTZWOnSCJoWLMU2APgK2GVaSe9l6Li9ZfMk6RxVpcW/XeqMcABr4Xb5zRYyJ8wZeQdNRxInmW6uPg2JEfOY1zlVbpFVTuRpJF0TLUQYWVDsMY2eHMnL1qN/LFk54u+JtMPguaU4DW8Kn8FCrfrpwrElCnGDL4bQ+7fUVRkY+uL/VM4Rbv3hP1VMo4M9sf+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWcgTJfrjRXzDdaiZh2QWDYxEXTIxwMzqWkG0QQjiQ=;
 b=jXEToJg9HAgM0inYIEwFiSnWubgDWlbgszyXnMiBwK7E1+KvQgE3R8aZZ/jM8xJjqcVNNq9SBwP+r5ngnbDFPx9vW3GHfWvqi6oEHePurrW/llcojzn4CNQcDEEaE4lf2Zjr2YxHQr1dJMpLkKgE4SRycU0KhKIUsryBG9URO4YcNz0AlzPjumdm7pd2gq9oz9z1Ru5iPNkQX0bHPfNTF29bGmkse8cqPvBg3Jog8qW6jMdYuNUHA79lolaS8m112xIFzwiv7Yny/0mS8n8Jk7a1fMZ52Fm4DSlUQUH/qxtliRhfbqdiaIO/+JZvGICJj4bgA9cggIFrmBNs9lo4MA==
Received: from DM6PR08MB3993.namprd08.prod.outlook.com (20.176.66.156) by
 DM5PR08MB2714.namprd08.prod.outlook.com (10.173.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Sat, 4 Sep 2021 20:40:43 +0000
Received: from DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013]) by DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013%5]) with mapi id 15.20.4478.019; Sat, 4 Sep 2021
 20:40:43 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 16:40:25 -0400
Message-ID: <DM6PR08MB3993E4A5806B31ECEAEA154AA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210904204025.15457-1-james.d.knight@live.com>
References: <20210904204025.15457-1-james.d.knight@live.com>
X-TMN: [I94Xlv8BVRvNuJuDs4zFhUcVlt4NyjL6AUz4/6wR1N3f3P1kpI+7ul92MmZ4ArigSTjf782QGs8=]
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To DM6PR08MB3993.namprd08.prod.outlook.com
 (2603:10b6:5:85::28)
X-Microsoft-Original-Message-ID: <20210904204025.15457-3-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2607:fea8:e341:f0f0:5cf8:7779:fa4b:9c0d)
 by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Sat, 4 Sep 2021 20:40:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2bf075-2cce-4141-2bbd-08d96fe44419
X-MS-Exchange-SLBlob-MailProps: tKrkWYENIpK8Z3jmSnMsmE88HJW/x9royWckiTgOJ1mbAq/nEZTLVHBbaw6bzgcIp7Qh9yJCunMxnrUTCDhr4T52phiyQVsPc4J5g08GAVs8ck2kSgu2CUatFnuZN7dLl2+JGjLYyeo91s0TY3gMWEtgQSUib43wd8jpF7jucd9JUmjGWIyEsqQGjf1xHqnUGk0RMqzhCgnqyzAMScIWYl/wrOJhJgOCd23fuW+h3rY8mERsMqOmbd1IiWQyqMxYQM207uRQ3xGTlOcPqBFQU1nnmUPm1RFeWlcAYP0N+e87Fg47yzAi6VsJe9674WTq09y6A+fizJTIMzadTMY3MqPNups7/7bHRSvs+cInCLmZ57uC5KyM4J3NVhZSpbPb/8FAVqr/r8xM+iLsIV+gwzMh1UkxYGw/8vZGg1d8Lk/Rb7Kr3MAHdUw1lu0fynaUtZUbxBHMeLD+l7GABbpLnoALAeKxyUcmXUP/7DOs885aULaEBbOTgsIJJG1x/5dh+SmClSHLtnECIXLtnSOv5XzBQl0e9L1H7arG2lVnKU/UEI0ud0pw7mDt+FwCxPXnKJ1XyFk3f9tNyGvBX+2emMbKpSqxMy5sqDK8F8HJrx1X+sIyh7E9oNqXQ4xekYVtLv453MprquT+KGWP/Blol+WnqTkaTXD+/07Qx5qzyMRzV4TR5FwYn42lgng+uNLelqiIhDr2f7i+h6S5AADj1/neJEeRi8H0U3v0ihsR0plO2a/JNv6Tprvu0cE6NbX7AMAvKI20oCKxnnROxPvRP+ENwIpNu/NkLdWAm/bvsFDE05OpfpSV9Q==
X-MS-TrafficTypeDiagnostic: DM5PR08MB2714:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lt8fwUp4l03PIIvv34dBfTXcLBUTHgiWBrqr3RksXP7KnnZwmqQAdgyCrblo/U//1sgfakC4pf+KD0TS0k1J4cXPRDGdFvNKzE+PeygErmgML+PmzX4U75VHQ2eRWi3hHXDGIRHvHDYQuQbcsmGXRuGfAqU6BP7miCerFA4Dzo5/7Y+5CGqs7UXMr380SYKrxW8npWLyPU31PQI4tnM1RgGMYqOi7Bf7ufKk3bJNFfOdxBB2d2SLHRLnNv1Z5m3hUsQlUQw77/xTjYm1rr0vIeWK5UHJg6bRuVYkCKpj6xNOf26GxDTsd3uVHpBweE+PjtlCs1F61/wecf+UHg+jxq0/p49WD+Bpvo0TcmgCvoK2J2jKKE9kYrE2GYtCXV8DrJYGd2R1fqhE7HkaH99B10Z+GEonugNNJS+Oj0F4IO20wtUAo8DZyoffuTDhMZqHx2dwOrrbKQ0Q0z4EOuWWEXuLjbihcDL5E+mMkz0pP9U=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Df+d810AXxuZ1hrepnFI00SJLeNRdYSLCByNOahTjJDn3JtzJXNphJuog79OhucwOdtHdnDpO7CM5bpeIBhsKl0kU0VXSqTEq7/m70j6NRt+v20rcAb6p4VmzjVNgxhn8mo/+fGYPY65VzlFJfUTtZi8hRdDtYY96qdQzEt80vht98hXNwIeAXaV0bG1Cxkx6T8MovjW521odHtfmVTznw==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-124b4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2bf075-2cce-4141-2bbd-08d96fe44419
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB3993.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 20:40:43.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2714
Subject: [Buildroot] [PATCH 3/3] package/rpm: introduce rpm2archive option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Adjust the inclusion of the rpm2archive command as an option, to allow a
developer to opt-out of building/including the command if it is not
desired/needed for the target.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/rpm/Config.in | 15 +++++++++++++++
 package/rpm/rpm.mk    | 14 +++++++-------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 9da8d51df0..2af04b41b4 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -19,3 +19,18 @@ config BR2_PACKAGE_RPM
 	  The RPM Package Manager (RPM).
 
 	  http://www.rpm.org/
+
+if BR2_PACKAGE_RPM
+
+comment "rpm2archive support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_RPM_RPM2ARCHIVE
+	bool "rpm2archive command"
+	default y
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBARCHIVE
+	help
+	  Enable rpm2archive
+
+endif
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index e9d2adf690..5c04d47f10 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -73,13 +73,6 @@ else
 RPM_CONF_OPTS += --without-libintl-prefix
 endif
 
-ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
-RPM_DEPENDENCIES += libarchive
-RPM_CONF_OPTS += --with-archive
-else
-RPM_CONF_OPTS += --without-archive
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 RPM_DEPENDENCIES += libselinux
 RPM_CONF_OPTS += --with-selinux
@@ -101,6 +94,13 @@ else
 RPM_CONF_OPTS += --disable-zstd
 endif
 
+ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
+RPM_DEPENDENCIES += libarchive
+RPM_CONF_OPTS += --with-archive
+else
+RPM_CONF_OPTS += --without-archive
+endif
+
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-- 
2.28.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
