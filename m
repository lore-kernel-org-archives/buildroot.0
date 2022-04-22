Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C563EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 07:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF7560F08;
	Fri, 22 Apr 2022 07:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w96JO83arpyx; Fri, 22 Apr 2022 07:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 976B960EF5;
	Fri, 22 Apr 2022 07:06:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1C71BF2C6
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 07:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 390E64196D
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 07:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatec.at
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TA_s3LZ_N5_S for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 07:06:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::60e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07DD5418FC
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 07:06:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5uy6VkqrfNNVoltsbyeobnY4h2M/cXIpMAbzRUIUaHKaztBYavNjSRTLuoDVwoZ+b9CxjVbavez0NgQrUIoOzrpUpKELBUuDLE4iI+5kAOMAuZxuQkrOBVCo7JF8X/wUmHnFirnrzJS4BPI87Ia2SqnhYtjAH5XNChYNWXgQgddKSA2IzYegdhC3GWu+5J6Qbr8OOUZJpPz1y40QQunuErJCKJR7/Uij5QTtvxv2OS71YsmX+ZFfZRqXXyf0AdF67IGPTwon6AJuBN5c9aTMthUtKkCf2/kwKyAKYbawU5xCl+gh5Kbg/kezcC6PLvivX3bmN5RwGLKzA34VdRcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GfknOS+rKHu+22cPmySx41XE8OkO3Kf/+TW1TTejp0=;
 b=LJ7aPOTCXFWNZF/uS1FJp0GLBm9HYTXeEOnN4+f06r89quP2crQNWruQ7ZVUe6QE5snEUAB0mcSZmivVP+s5j2j1jC4OPMnGEUKlENqG54LOPczYWlkU1bn1Zzb1QNG6nHkOpJvg+Q9t7ZsoPWKhdPdLH5gq4glhercuIrra5zvtXYwud+XhtH/K//bMdNaWv7dUpaOTJ18C12xpZVcFgi/vP5Yg7W+mr1TdQT9tFnTFgITSlIb0lKgU6f7h/zpSJlmTq5xazUurDx0FGuYhjP6PA+3Tib2DXo64Er1QtJZxEML6o8uTSMzfXU4P7O9lk5K9dBlhG7kmpWXwIp5DTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GfknOS+rKHu+22cPmySx41XE8OkO3Kf/+TW1TTejp0=;
 b=Ei9X7q/TN48rrwBOxEOWFBc1m1h469QezEothiUg/mLI/eE1B2Jj2KN70m8tFV06g9YXMvUaN1UlUmZAJuDTOpFBVoN5G8WMjhf2BQEm65Phzv0I+mkPXtA0FfiQYhqSi2JCD1bGZCsTWTdmj42DnEnyA7DeX1P8NV1SodUnhqM=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0979.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 07:06:49 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9da2:efa4:47aa:e92c]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9da2:efa4:47aa:e92c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:06:49 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/sam-ba: update link
Thread-Index: AQHYVhc2a2qxHLiAQECiDect//nrXg==
Date: Fri, 22 Apr 2022 07:06:48 +0000
Message-ID: <VI1P190MB049366A16260EA4FCC31A8859FF79@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 117373c5-3fe5-472f-d3f0-08da242eab61
x-ms-traffictypediagnostic: AM8P190MB0979:EE_
x-microsoft-antispam-prvs: <AM8P190MB097981E9077AA28D6157803D9FF79@AM8P190MB0979.EURP190.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dBRmTFnNUS3Ku+H9NI7p3AcCenncxhZfGof1RuczIAVj500z6d6yIpI2PdKlPxpJ0Fv+QjIl6zuiUG5GE9Prz1y4dKUY5nPT7/rXnmgnpsUNUchW3139/IaU6No06WllBGMJLpJ6mFbb3il4Xdxna1eDQu1DdqsRKJfKu+Ja9bNXqS+BM/H1J5Ssmu+g/g2YsF62XLKfygxOG/TFnSaOzVJ/wcAtEBy5V+YFJDXEVJfW/kYnkBb2EZTZgBdo6tOXuHKL511bT+EHDS/VDdDYfoOFkB2Hpbcex1avefI+N0UY2MXUYEkPwYZH+qJ2iIc6ev6ORdFpEBDtr8DOYMe2/nTZ3xzcbd13a89Mr6D9KX8h+VPMuZ/IAE4/ap9k1Yni3LYuZgLPVGE78gRhhENPAhJEthgMbl7niUPjzUzXzCs5QN246rwgKPvDTplG8vOD+AH8vvRGxqw+5OZqpAcigBKpLD9p8jXZiakose/GRGkE+BYEzsR/BSFfXmftTA3KqwCzp1itPJRgWUzA/PPHX8RR/FM7SqrT7U/ZF4P6xXs3TSKSi8+qwfHJjVqnniTmp1JO6r/xdZm1LwcEMFaJSO/3+mWp05bLTTotv2Z1NDyAhgL4cYGIBUoMIBOo3VgXtmzf2LBNWOfCCVLtHsjJ0AsqS34EfNij/fvIeBSpUh0PNFt3MfyOQOwhhC3ATCP+AEZVuoYTlbSfOXuqVhaJGosYmdiDYGHYA5TKYbRpJH2rdPu2kzRJt3iNZo0tMfi8EE9xG6/ZQ2MHbaHWBYQXmlMQYL9KUOQTq330Kyn1As=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(39840400004)(346002)(136003)(396003)(376002)(366004)(966005)(64756008)(7696005)(9686003)(66446008)(66946007)(66556008)(33656002)(66476007)(8676002)(5660300002)(4326008)(38070700005)(38100700002)(76116006)(86362001)(508600001)(186003)(6506007)(52536014)(2906002)(8936002)(4744005)(316002)(55016003)(6916009)(122000001)(83380400001)(71200400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v4E37KDerxa2TsqFxvg4FdnDDy/xGLDjnDY9b1QFpLY5zmJUl1Wiunrgev?=
 =?iso-8859-1?Q?ZHDTtn6TGqFEPA7uSpu6Cy8oUZQOIV0bvmJYXyyqeUrLsyNrLjCKISiw2C?=
 =?iso-8859-1?Q?6h8vl5v0miBTJT27kzcDKm3ltIVRRNM0ZhaEPuBGf1LXL1uPFARDx30H4k?=
 =?iso-8859-1?Q?Ozq40vAEOaKhJlpiCSc9YF4jGIatz4AUZgHbYg79f7Vr2SFiPlCtWqt8mJ?=
 =?iso-8859-1?Q?fZ7k2kWY49+yq1GCQhI4/epbQGhZMtqz0n6Rb3q6PnxHYUTzBx6ueCuXBP?=
 =?iso-8859-1?Q?CxeG2LQiRCIJ7ds/MtSR5WxmKTC+AFYhX1LWMCMU/nfaRt6EUmVmGGVH93?=
 =?iso-8859-1?Q?6zG/4zgDSuCs2mzWzmGjPkn/xikdP9Fa+qFiboV2xmEgWOXW84N0nXqarl?=
 =?iso-8859-1?Q?m4h16dd2lcvHToG/nkfFucca8Os3qay4rL41tYWDbqqgRuaicS0w/AC3dp?=
 =?iso-8859-1?Q?Gz/3d2giod+1GnARqg2nfOSFmpocUhktjVQK6kclbtRFeonz1fbpF/GgWC?=
 =?iso-8859-1?Q?S3ZF20wuYGxXaCotKgwg99M0IKEpbnW8fJGyBFLJNbSYV4mTjq9hnWE+j1?=
 =?iso-8859-1?Q?nD02YG5lztRMHb2b39UGiRLB+Nz2lMZQYLkcpb/ocYCh4yq05eP7p4RMgK?=
 =?iso-8859-1?Q?SLYHAr7rkM3wUdEBE4ZQTt9Y+oN+oIx9PObHeKNQU8wok4So08v0oanb9X?=
 =?iso-8859-1?Q?c4MdaRxH7DH/Z3OH3S8SLcVplYat8hlzLejz0IxqDDqxMUCldArwhvxnT+?=
 =?iso-8859-1?Q?QktLy1UQuUa8uPWlGHQ0m0GsOQg8DlcU7n1AUg7X+g7aAVfyN6J2lby/Lp?=
 =?iso-8859-1?Q?pC9da95mloPNubyDofcNtSYfvu/iIgIqg5zBfeSX3dLbZnNpcVL4w6zEvp?=
 =?iso-8859-1?Q?7ZurngzOlsxlbDJMZYhQCnF/gmHbiOuFizUJn0aMqtW3ge2d3iZSwYvnjr?=
 =?iso-8859-1?Q?qzpbdLpA7GeBOA4qbvO44XHVv6SwTDIZHVRnWuF5xNMTeONKk+uDyYbqb+?=
 =?iso-8859-1?Q?MoNdK0T3SsvayVclQjHSLMtTLt0Eg8J1r22/0yftd0d/DsvIdAekNyVSID?=
 =?iso-8859-1?Q?V/8hUfPgFFt40CT4Un6XlE2kf5IoFvLgtKDYjXZFbBV9VWDIJC5YcpYQ3m?=
 =?iso-8859-1?Q?wURLEP/dIOA++a3FJrVe3B23uCsX+fdkoN+nsSipOTsGwrZuKZfSzZNPp3?=
 =?iso-8859-1?Q?MO/my2NYVdfJEJAkmJkV0AnfDzR7E1CDEqLUbig141Xtdh4D8bDm3r9pJR?=
 =?iso-8859-1?Q?Oc5sxs+7PcgE/C2yiS7xu/6wN04ZGjHLFXM2qCETnJvmb5ZwUFRX8PbvTy?=
 =?iso-8859-1?Q?tOlYdSHi2tzBVkMn3gfeo1Evz3+uituCPhNVEzBt495e9nGefviXPFTRc1?=
 =?iso-8859-1?Q?E6x20yu17XIN/dP/Q/rmoV5MbL3ZiHLHdhJIQN+4nR6aXs/3Rpq2V/FbCQ?=
 =?iso-8859-1?Q?NGJcWeeD2hz5DFL5Leazmzm6A5Qz/DNNOqAUkTb1ridFkqLxp5/hTDx//E?=
 =?iso-8859-1?Q?5EzssIfIPa/mHbqj1u469qMqG6HMV+iV9TGuUriAZbMowTR4cMEQgISXmm?=
 =?iso-8859-1?Q?eW2kinfVFQu7raOqijkDW+pk6h/uz5zMIGRiWcZqvfRARW4xJXDY1wy2mS?=
 =?iso-8859-1?Q?fY8u2OYh6KVnsdE+QVNmP1tq+baVHx7rhS5nKdNCeDNud5BK6ZgDMkQbv4?=
 =?iso-8859-1?Q?BMMHV/D6mLOHF4aE3IvpinKFGzTOVBZtNE3Wgaznufd0/goR06xutDl1kd?=
 =?iso-8859-1?Q?eTvDTjMiYABIXFBJjk/4U4flsIVYfel1rn4CPQwgfQP0LALV9bWr93x9rO?=
 =?iso-8859-1?Q?9lJpVwBDa91FERW4dAiapPyVuyYINBtQqch/Q+Ec7HBoNxXhs6+O?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 117373c5-3fe5-472f-d3f0-08da242eab61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 07:06:48.8600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZamVnn1JexO8KDhbwSqrHXnbOKfC9hs6qa9jA0RfcPFRQVsJ9yEktM9gI+5ANKSKo4LgufuZZbapUuejR8O5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0979
Subject: [Buildroot] [PATCH 1/1] package/sam-ba: update link
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The link to at91.com is outdated and redirects to linux4sam.org

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/sam-ba/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index b96e377e79..1967f33ab3 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -7,5 +7,5 @@ config BR2_PACKAGE_HOST_SAM_BA
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
 	  microcontrollers.
 
-	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
+	  https://www.linux4sam.org/bin/view/Linux4SAM/SoftwareTools
 	  https://www.microchip.com/en-us/development-tool/SAM-BA-IN-SYSTEM-PROGRAMMER
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
