Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE56C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD3D60EFD
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AD3D60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5CC80E56;
	Sat,  4 Sep 2021 20:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFeth58SojUB; Sat,  4 Sep 2021 20:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F26E80E4D;
	Sat,  4 Sep 2021 20:40:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF831BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D22540167
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIaxoCcL31se for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20805.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::805])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5116E4014E
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxAWFnOLSrswljubfGaQjvD8/HBL9e/DCLjxXfDFMR/Fnn1ViHGBIHrkdGcZ97iYZ6eY7Dy7Sn0K+KP08BVPj6krG077zEZAqR+GWE+3bSsezJR09T+oU24ANyCF1G7UjoNypuHhpXXoOGNNpUsyh+t8sale+VBgtoCqJInd9p3ZaWPz5fLq1jlsHVkYsMELyg5bg1VXZjvi8LIcFeKNV/w31q9ElZUpGOu5tLS85fwXfN1EQCahIbRb53MrDqcEWN8UxwDTLYix2yGcuVAxIrPRCUTVQki0x8unXoD10+Ikdov7sqRLdvLEGyQ7iENxQq6Vgy0F+thuGoFitlyyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tWSvuQMty8PA2RT96agQsKv1GGhx4ClNSYz7L90qG6E=;
 b=Aed+2ADRQXHSDWASKr9ZUrO3GUvgypZXgAoh8JsavqkyXrXHFIFvWWkKdEm6TjV6cmzzkNZ6gDHiyheCPlEGTTrWDnxd+zOpUoUTymm27PUGCG31Vz7s9Nzkc5cR1Af+SR7mMfcbWw9X9M1UVPVI83igyu+9N2xUKY2lxyCLgFq9+AW48kkLMi1bqdKU5OVvNbs9NqRjcayMh44eEN362UoCjoxd2xRdmYEOHhVdhVVrsLie3mqebLsQ964RnUAHvg1wFwWRyIDZhuk12UIqQx7GCwAZMVyrjWnkedGAus8Ds6lHXWfRIEipOnwldG5Mw6h/qAzWLw/q9O+cr1ywBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWSvuQMty8PA2RT96agQsKv1GGhx4ClNSYz7L90qG6E=;
 b=XmtC7k29ihjAasoVV0Ltk/Agx8lpOCcNkEx74t6D6dFbRrpuRT5OGogs2NxFRmZ2IsNPmE91SewB9hsIpJmAUtfLHYCtzHWmSFPTWCDzWyq50NEBUxRDIpO9HfNx/DpKSq1B+vpWi/a3UiNaBnowOw0iZO1Myn2HTi5pUl423A2qKxLenm0Ffk5gwnOtDdW9iVxv29SUsVc24oXTxk7oMVtnxQtVnq6WXnTf+ZHUSjfdp6Wm8eCJ4tXtT+DhNmFE3+hMmAHbmQsD6W6toLTN+6MXhkTTJrAwL6m7vLXux1euEfWQXQXw8ECBwkd2Y0fzBlLnNbeXyc21HGH5CVif0A==
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
Date: Sat,  4 Sep 2021 16:40:24 -0400
Message-ID: <DM6PR08MB3993D7A0D181CE64EFFF613BA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210904204025.15457-1-james.d.knight@live.com>
References: <20210904204025.15457-1-james.d.knight@live.com>
X-TMN: [DjWK3ZRqR+Rli0KtggHf7eh7VwugH+y2ZSkGwf5NWlWqG9q7MD9cx/OsmgRqHO4BMgWL/qpt6R8=]
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To DM6PR08MB3993.namprd08.prod.outlook.com
 (2603:10b6:5:85::28)
X-Microsoft-Original-Message-ID: <20210904204025.15457-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2607:fea8:e341:f0f0:5cf8:7779:fa4b:9c0d)
 by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Sat, 4 Sep 2021 20:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c6d0df5-38c3-4f24-44a1-08d96fe443ae
X-MS-Exchange-SLBlob-MailProps: QMhK0M23Qm4jHG7rGiS7YM8yxnJCbv7GOHgAETVhr+AQdfvQvplQdajJVDuIsfo2DIB5WkSBP+oodIQRlpb325yoYgh8UNjzgTfn6IAmhBkq3cGmc3eaY83pVhO3M+KY0m8qrq3P59ONIxSrnPKVSdOV+DV04UldSADn4H7eyrcLRA32zeG6fOkhf2N1IrlHW7iW160EHpF/8Y6K/yqyPwX1mBgHj1sg4s0tRtTVsmry77Af91aCnbApUbjhGJiUIsyGbwFQQst1YXDGXtB+WkK1CrUjM/ZIKxyVSx9SM1OurFbuG+8rHPtEdgx7qsuEiqct83ER0ITE31WFVAYGK5ls/1hyrDqGEIU8hG6a3Y8s/xWqInjpb76D+V6Hg5+2LB18IKTTsvpG+D1oSQqIXq0ZenGLGelkmC/KtotYfi+zK5OSzsktfIFCFQiv+xkKRCho4Ck7Pw/gmCqQ3Fun+CTgEoRsrEwMnoDmYIcTZxsEd8vOKtHZSArldRW8GHTrDbLOmkCQ7Hw60HGTWk44hy+cXV0daZMD8Emuu7+nzLJ2qiSTNn2nasvLdR1e6dovWPMNFqiUPjUcwTSpAF/qYLib78cj7ZlsYGS8BMF6sZCqoom4AYfi4DxvPQu3uhHa5x2TL1oz+QAH5gL1itPSPGSR6/VnsiKlWm/qSAz/oF+0Nc9edCdcLvtTrpq8nA/vbfLT8JvIzHU2t8OspVKU3j4SlSCp0Zq7Yhd3YJ1GoB/IXh3R4smKMTflF3989czLvuGSNBUiQ2FZw9hZVB3uERDxMlG2lCPa
X-MS-TrafficTypeDiagnostic: DM5PR08MB2714:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hb/WOKT8N6R92YakXytAnjlQt5481NDF4tyDwavJxP45OxNx+WfZnok50nDPP09CxZHi0kkxGJskg3CBEB+5WHfEUwQrpZwYLB4wiGaeZCkRhQERZScLCHnvU1FtwRQrVFoHmW98Ibfhm+PUdbEr7+jsMr49/WiWCxyFDktocmcB8i1zQCrwygwtQ2Vc7HpaxsP6vqYOX9w9/35zKddCybXKmVJYU75AsvHcJ24NRQNoHax2u0G3Yv7+Os1FbZSlSiul8E+LLpr4KpmRCd/EVFufzR1WANA44C1LC+MEvTL8ubmFj3eY0zG2vEIwDuL9qXzd2kiLG4IrCie3Xi1l1kdDft+Bxmr3cKACWt3FMrVIYYQojfgbLStAZ75MqebAk/feWlFzjsYhHpB7O5L+emFCfEJn1IgVbD4gGlimIsHzCUeUI3rb3VOr5X+f5hX9amYgIex5fBjSR+J09GkXrqNzi0PXgYm/1phuv0O4keU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JF3CmrTdU8NkvXHJ2l/9vxXO0pohJ/z22tsj8FtMpsT6j1j8HfUbJ4oebkub5hzbJrY6gySvF2Esyzomv2klUU+dV5SJDcX23NRl51iN/5Bww8poVmNueIE2lEDS9ttrS5Pn29ULDe1bXNnKJwOqUDNqIIJ3wNf8ObUtdU82P3/1jjj1UP39nJqjdDlMYl+tDCKh95v78CWSV96Gb3R19w==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-124b4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6d0df5-38c3-4f24-44a1-08d96fe443ae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB3993.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 20:40:43.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2714
Subject: [Buildroot] [PATCH 2/3] package/rpm: explicit audit option
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

Support for Linux audit has existed [1] since a v4.15 release; manage
the configuration option explicitly.

[1]: https://github.com/rpm-software-management/rpm/commit/ad16a04b6e41612cdef6ab8755ad31c8b880a9fd

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 816deceff7..e9d2adf690 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -38,6 +38,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+RPM_DEPENDENCIES += audit
+RPM_CONF_OPTS += --with-audit
+else
+RPM_CONF_OPTS += --without-audit
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
 RPM_CONF_OPTS += --enable-plugins
-- 
2.28.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
