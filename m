Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BEFC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7157841862;
	Thu, 19 Jan 2023 10:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7157841862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbIaiS9vlBQP; Thu, 19 Jan 2023 10:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD7041829;
	Thu, 19 Jan 2023 10:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD7041829
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E565C1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B381F60F3C
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B381F60F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMEBO1OH-jmr for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1EB960087
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2074.outbound.protection.outlook.com [40.107.15.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1EB960087
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVcz6zGj2D9SKMeHl47EgPJuMh3D9eHdVpYAE74i+aMaL9af01+KSTG14Z/hdHR5Pxbzou3GuGsociTqFvt5GhoWFeEhAvV4LRexpOJ7ln3YUjm9lE8LdRcJ8BBRQvwQNsdE9T0E6PZknMkfd15j5F6kspUGCgvB9XOsRCY0G+i+ZCNGa6n5xb0bF+otC7HpQToSdcM9PyQIb+gYF+rn9cC2xhPwDx1CNu0xJcmZ8SfWjUBFdsV3MftaRG0NXkEVZmzxaPJOSAlwG4ZNwMXYBUb21WMUMxrWEbypkQ0WQsJYvPGKG160Mapw25bGcJXAP41BaouNFzh7iSG7nzU8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFCEJnUqz3wvu64yhNvTD2VOPeHRhuNFAiZBr04v8aA=;
 b=BZMFoet1w7Tf351lWN84zXcDzhe0IRe1d9dk4JU7SYeLV5bJO8CDGn7VxJApl00VCXPuQOdXkmazTLcMRTPs+M3JnuZeWdphezFEm0/b2bCQX/bkx1idG6CD2zBjhJ19mmdcSFzIyX5F7gNi7htJLRFR6BDdcT9TOCRS/GBQ7IhlnRZU+vB2M5IA8E4VIdb8l41ZD3er8R5DOpc0XNBvWBPiu1isoK1uBM4KD724eSfWsUVj10HB5C+odXMwR13+ssfPp35OxHIJyRSiVriNk2i0VGgMUEAr3akM7sTtyY66lRpWU4d4Tq5+Nut36fuwUcoCjTDRV2Isbvcf8NCzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS4P190MB1806.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:15:30 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:15:30 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 38/45] package/metacity: switch to https download
Thread-Index: AQHZK+3HbyEZVMR460yn5PBI1zM59g==
Date: Thu, 19 Jan 2023 10:15:30 +0000
Message-ID: <VI1P190MB0493C739DDDAFFC35E34FD019FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS4P190MB1806:EE_
x-ms-office365-filtering-correlation-id: e5f93b7b-6359-4da2-e943-08dafa061814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8RJEytCesK0FzdpWSm/lwyOpKVzYdLXsCEVzd+gD01xD8BBZyuIekMMc6AuxGObLHECt6KSnoqAIqRC7N66P3GxQwNIFKTSstdFNy0Q5FqCl3krT3ZXbMAu/XImThBkPUaDWLDw6bH1PY5wv8IgXnwMVUFJRRzyMh0adeB4vDm+MIZvCFMzqq2mPRAaO5J6VYaRiiz5oUv7V7gJnEO/51g3fjJUE18+ux7iaKiCUCNniPhMmPd1QFCbxzZUazjej74bwMhv5lFkHE+laBN6rVJtaC4M+ZVgvegAZkjdO2fTzVTwPy4YTzUj6sV1cghIN7+AQBbTFrr9mZzft6aKt1ZLzCONxwBgfvA3Gr8iMsS20Jp3Q2MngmBWlMecg23MI1crMFWQhAdmXS+/tA08F21pTD2KYL7xXv5NA7YUYm0Y3pRmvp46aZ3tmN3yEFjj1euuRV7991+l/ocDH6uOysM5E5fseWe30qu2Z0UWTZUjQJoS8NvKhwlrYVucz0zI5vLQsIpi/F41jTsYM1JPSvVOaz9KljhrxXynKmayZR0GL+PwbKa0m2TDjFBR5juiQ49YseX8wOh/t3Mwa54inYdQbUNs5QhFDik7hyEupUKLp/wMNilsf3OWOHSEb/njDdcc1qqI2XmFX371M2MpX8Z11UzsSzRLv4MATtFUkuzJw2A2Ex5YgKQWruL6XXRcjU/DTiEMg2JX/AQ6AmLaL4jRfY+B2UlERcwTV+cTAxOM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(451199015)(86362001)(38070700005)(5660300002)(41300700001)(8936002)(52536014)(38100700002)(122000001)(33656002)(966005)(478600001)(7696005)(71200400001)(83380400001)(6506007)(9686003)(186003)(26005)(8676002)(6916009)(316002)(64756008)(66556008)(66476007)(76116006)(66946007)(66446008)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cJhg1lHSmxlCDGzKghKYsvUWd70o5ZC9jrvW6Bvx0Z+L9RD1uAFC+kRSzk?=
 =?iso-8859-1?Q?Z2FFY2aVXRHFwYxm4P63XvWCF7hXMTxNdJR69AeswqLY0P1YQI/g6u+8wC?=
 =?iso-8859-1?Q?GQ/yq4rUlFVu9ryp9ZKExiuFrP9Q4PNlpNGlaansk+V85FzEFgVo+BV/le?=
 =?iso-8859-1?Q?5Sep7GjnqhvQ2CZMLmpxXWk4M1S2FiTknAfpMbwN4zusPPQai4Iy286CpF?=
 =?iso-8859-1?Q?XpVoxEhgA4SKHbBJi7U1/Xz/8TVO4ABopWajdkNeKsQ0VJ7uwgOnqLOap+?=
 =?iso-8859-1?Q?0a6Nehd6zWCnsBklJSjDKRE4znke3gcfvbd+n7VLNCZXByApYosYcilIrx?=
 =?iso-8859-1?Q?hKGI3DMl11GiG3z2GpvD01GlzSzxlC1BhqtkB5ABsAQoCF9aS9pFjShjm9?=
 =?iso-8859-1?Q?c8hA79btY28dyBC4i0MEfgba6xyE1tqqcmk4VaDOT3e5NmoSZrzxeOzdn3?=
 =?iso-8859-1?Q?t0BaPxINxuN2kuM94jpoRJMuSpbosxQq1dEceQPePdasWt6QDioETNuvha?=
 =?iso-8859-1?Q?LNPFjuMhoJxPgF5wxRbMLZT5nDPUU2uGq0D2UD9fZAhKOLFbnXxnBEWkRf?=
 =?iso-8859-1?Q?6NZU73fzsUj8Y6dOFT9ZUWfbAfdaepNb6vJbmaxHe87E7Q8CkKwVl6MS0T?=
 =?iso-8859-1?Q?7/H+rR1t3BgKgMx7nXWZIPLywyB6fMCzBi8O5ZkIQ9rof6ZLxPsWiYTU5E?=
 =?iso-8859-1?Q?QnINWoaPDqbBFJ0BpN/yD4K9X1An+42QyhxKOx9j6tSiRWNMeQ3jqKAVKz?=
 =?iso-8859-1?Q?9dTwIUJKA7Uq4vaYj5POHavrFkZNxDOsZGFM0N5igTv7G35O0ZU/VmH/dy?=
 =?iso-8859-1?Q?eYwjMFhyvu2hGJOXWs9mGD982xJKKebCj+T1h03FyentV3VhLoYTL1d3z0?=
 =?iso-8859-1?Q?iKY6JCML6p3lui6PAK1Q+bHq3rj/GysGoBvfQqqfgbNBrrHUMCIrdgr/jo?=
 =?iso-8859-1?Q?GBWbJefgIMryrhhHuaQ1QgtRn4L9MfSB8jxqNWwV4bbIaDCKJLT4drnFQP?=
 =?iso-8859-1?Q?LSoFQ3kSOpvIxRjHSP05XHE1KETU+2D9ksJ5rFQH9lRtm4uZeRy70IaIzK?=
 =?iso-8859-1?Q?tAu9zu+Ra08tv4Ar0BCuBiLjudZd720uuGlPsLXrPg8TzMd0rysyct6p/N?=
 =?iso-8859-1?Q?FzdfAOXVCSr0aiXX748jWlx6Mi9eDwJhjcLDgDxbPk9wbtLYxOqI78Nvpm?=
 =?iso-8859-1?Q?KhAUR4peiBW5A225IoSlV1xErjLyeL3fQFr5b/V2ntY2OPlv6XqL04Eh0e?=
 =?iso-8859-1?Q?MDp/I7CBkGsEATYDdOTIyVh6Uitf/xwCpV3mLNVwXc3blm/yVXBRYewewF?=
 =?iso-8859-1?Q?Zv8blB2ewARVhFZtZB7Zi9mfbaANEM5MRiCPNRDm4TyDhY5g4avsusa0ho?=
 =?iso-8859-1?Q?q1HW3Hpun1W8SgrjSoOK/9OkIF1yHDdvzaFUQhMQ7PfADDcSOnu2kKmcwc?=
 =?iso-8859-1?Q?g1YPNVDwWAuYaH53iH1c4Uvw44YbGw41MRG6NnVIlERCiH8f/nCiliPOrg?=
 =?iso-8859-1?Q?muE5cyYyIT2HKHPjp/p8BGiH7Z9elxmuDqkxYvSetB6SB3btEXKK0/TKWq?=
 =?iso-8859-1?Q?xh6xwFZ0ESKFAz5WsjkPO4l2P28UesViKg44vBdKtj/OYXYKJIHgsBlupK?=
 =?iso-8859-1?Q?gB7BeM6VU0ZKI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f93b7b-6359-4da2-e943-08dafa061814
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:15:30.6805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UU7wLmNfj9K7LsjDukQPeOxe6gnd9UU3s98cfbDaUyV2DeW+G+xcEp1bBB+qzoTNBTJJTvYAIgLAi7DJIL1oaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P190MB1806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFCEJnUqz3wvu64yhNvTD2VOPeHRhuNFAiZBr04v8aA=;
 b=v63Pyw3FtcmuQlCvOr7qNTUIN/pzFcNXIxfQkpMynELbOp23QysLT4q+hufepzvwHxE5COHKACD6zW38fa6piSRds76VsPRi866+j933ne38ZDcaS9C6w3E068r3jnUoKAddMlLwQZo8DtTbadQBSGk6zLAHMuIgwapWn5e1u7Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=v63Pyw3F
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 38/45] package/metacity: switch to https download
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

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/metacity/metacity.hash | 2 +-
 package/metacity/metacity.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/metacity/metacity.hash b/package/metacity/metacity.hash
index 583db0f204..2aca099038 100644
--- a/package/metacity/metacity.hash
+++ b/package/metacity/metacity.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/metacity/2.25/metacity-2.25.1.sha256sum
+# From https://download.gnome.org/sources/metacity/2.25/metacity-2.25.1.sha256sum
 sha256  fb2ede4ac02d7da08d3c3323fb76afaf945c8cccc07cb2d3a4b7f44fb49f1c47  metacity-2.25.1.tar.bz2
 
 # Locally computed
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index f5a6d4afd9..5756658300 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -8,7 +8,7 @@
 METACITY_VERSION_MAJOR = 2.25
 METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
-METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
+METACITY_SITE = https://download.gnome.org/sources/metacity/$(METACITY_VERSION_MAJOR)
 METACITY_LICENSE = GPL-2.0+
 METACITY_LICENSE_FILES = COPYING
 
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
