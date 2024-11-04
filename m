Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31231D132B5
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 12:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7288403CC;
	Mon,  4 Nov 2024 12:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYm34AZs9R00; Mon,  4 Nov 2024 12:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786A0404F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786A0404F9;
	Mon,  4 Nov 2024 12:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EABC4723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 12:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C1EE40291
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 12:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQz5nhhVGaSv for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 12:42:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 362E740179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 362E740179
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 362E740179
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 12:42:01 +0000 (UTC)
X-CSE-ConnectionGUID: KvotgVt1RYGbBZlCpLRNrw==
X-CSE-MsgGUID: jOfLLq2kS5iUaWFvHcCuKA==
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 04 Nov 2024 13:41:52 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 29CB9B5A89
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:41:52 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 5AF29B5A87
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:41:50 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 13:41:50 +0100
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (104.47.30.112)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Mon, 4 Nov 2024 13:41:50 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pis0IWbO0dGQrVkHVUlfEZuw4yvC0r+JaH+DaJpdsOsJIbf1DNzFKoP9ocmPFqqGAPKgkkSBs+43cSYpsL724t3IDWf0AgXJ4s/Y47xmNacuPo6+SiAxsLZ+MBcAi7miUPCg9E6qd9XCY+rcmV0VSa7dAj7osV0XQGy1ZapJc16yGQ/cinqsmcyWn2uFKTMIO0MGMSFLBVWorP42veRhrQJ5z88azvVnZD5jRadQbb/t0/9jQD+UyaQjoOrSv1P+0+AlCXWI0SEwuqsai+uxXsEowGQX6+zYuC1LqNmKHD8zAeZLeSIfXeTp4eTStJR5UW/1vs+3pkJ5g2/1uzcRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXNklddFD0X0veihPor5eR4g7dqcL61QG2p8g9AdflI=;
 b=C8Me+calMwPnPvakIsP25bHLWvg5/lnIFlyKOm5TcY6M/R7OC6aDmreEN2hvq2UlkKFji7lFFbrFHOr1WbjuKM9q+GJbK9TLoPUQ1PzR/95fYbGkhnEDZo7opy9GSLyzP3bM4sQHiZco8vO2eOuWTJv/ci1SfCRZnbM/ypfHWLf7lZ7q4kiHR6bCgLj7rn4wwgRCBreuuP2w2a0SfmLS4srDQF/RJDEOQDGQsLzbQNfRsna7IKpjUHCmwcZO3QMKXvPk6aItc1ph7c1DeCkWwdLNbaFGj8KICbb+YmRx52WD3L3rfvJsgB0QQExSgj3VAHot0lwqo0MsGoc3a2XDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0274.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:41:48 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%4]) with mapi id 15.20.8093.027; Mon, 4 Nov 2024
 12:41:48 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Michel Alex <Alex.Michel@wiedemann-group.com>
Thread-Topic: [PATCH 2/2] package/libzenoh-pico: bump to version 1.0.1
Thread-Index: AdsutrakZdcurzWOQs+PjjxwGKcZjw==
Date: Mon, 4 Nov 2024 12:41:48 +0000
Message-ID: <AS1P250MB060853D74B61711941030E9AA9512@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0274:EE_
x-ms-office365-filtering-correlation-id: a5e49801-dad5-4a01-6857-08dcfcce0cd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?msWMVzLtzBicM2j9T5Hg/rFoilQ/NsGf2YISoeQR6SIHKNfVArccprUx3ieU?=
 =?us-ascii?Q?S48O07Wc2veXpfWISUohv7J3dkrYYWLaxlx55P5KLCtojMgKpj0fbBoTLDYK?=
 =?us-ascii?Q?27zOLQVfChWo8ybVdAQUlyDpD7VHKgGblUxtK+xo0lB5zzzFnUj2TX2k/g3Q?=
 =?us-ascii?Q?uEFI9cMBA/9iCT5J1oNwGw6DFRvxh0FRe0FzPf8kY5ZexTuqLXlcwI0Qwq/B?=
 =?us-ascii?Q?It8K/CoNR9EiX0lT7wpRjqi7qrm5lWt88EEck7vwuV2O+pY1GbRoDLbjobzv?=
 =?us-ascii?Q?wodHBIN5rhsiGHX3/0xD0Hus6Dt2zehLCO7NWhn8q5UeLeBaYzhpgx58nj8v?=
 =?us-ascii?Q?Kr/nxL0LHOSvoSONCR/dFaXuS/KR0HYoeNcnSpr4O9ee8PDs1OXVOceXhwCM?=
 =?us-ascii?Q?CIrb4EY6Mck01mXVirIzZww1ewxU5arvxp6UM054LqtjBnA6yUccMlDI8mdC?=
 =?us-ascii?Q?G63XD5x1HFGtNq5eWXk3C9NkMM/6KWPa9wcSIAXbJbfLA0gdCGVX/fIN9uXa?=
 =?us-ascii?Q?3UG4ktQt3SVya/XLjI3V2BGi6DT+9qJJIbeyrC0Etcz/qWENzDLp0draJm8w?=
 =?us-ascii?Q?jrYNJpzSEZjMHZwLOeIZbLVx7gCfhD9wZ3wYyBbc4J9ZcoeWtY4EQvIC6PXj?=
 =?us-ascii?Q?3mTIBK9cJO2PDRFqwmZ4z37rwvmyWEcRABDN3KBi3lQ0N/oL6YHFROK9vreF?=
 =?us-ascii?Q?zwCvE+OYPKNeozT1Z50UkMD+FgsXWrfdC1G5kVjoXqjRc9OPj3PCy6eORilM?=
 =?us-ascii?Q?s6aTex6hHQlViWWjq4ehpkKpYcO6zSZSRcIP+olzZaMhGsAVpmskv2grmrNt?=
 =?us-ascii?Q?Mx6Ia1hQglIUQy5mQVgSuGnE5h16cjZd4pmSsVMn5O9zaf8XkG0/sxTY8aZ9?=
 =?us-ascii?Q?4SyExxt0QCL2mtMuRcrHCtkkj+ygVp4dQp3NOa2eNQrNttB+NdeenRITY7qn?=
 =?us-ascii?Q?23rokowDRZmWxEbB69ggSSojQ/WGd33pHmZTDA7tZl4S887ZXcfLYQB3oKg+?=
 =?us-ascii?Q?2K1HosC0ie3ZOBD5jEMUMhTJp/ahznWF0FQjdAJTswBtEbrQp/cfutXHYBRl?=
 =?us-ascii?Q?DSuBL0KSZUpRoLl5eK2Ey25NXC9cuSFxVJqt6jBGb3JHr+P32pNExQ1lmnX/?=
 =?us-ascii?Q?m3q0p8jTFCgB5FxCdbCq1LHfBuRRfiInVx1uE7F0J0DS+UYk1GAYSU2BJGz5?=
 =?us-ascii?Q?jTqSgsiXUHVmIv4B+QathVskt1q3/D1b02KI39KoP1xz5pnBgwpe8BS/Joer?=
 =?us-ascii?Q?FEAMDWNweKjPubZMffcHeCBUmPKOrbN2zAcLs+3ezp+WrO+QH50BrVbrM4hB?=
 =?us-ascii?Q?z9gRBKhXymGFp/Qk9dRjKI4nXyE1cT5Sj3kf7oLnpAhNGke5Kki+lVKZJuX4?=
 =?us-ascii?Q?r/yJWLbSaxaRRTMfT51VbQh0ur7e?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h1yXgEA5QBkFpxhNuFfXwtVF8qT8Fdl+jn8K36wylPp8kUbF/7WVHpnS9TU9?=
 =?us-ascii?Q?bUALIrmNFbuwrYJWlNQrsARDq579w+9IMpwlx/jOM3MooP2rLG35RmgRIKsw?=
 =?us-ascii?Q?Y+LYd2flEAsAD1QHHQYGiMWBU7lxQm9QgkeMuAyieK3Imka4sKGkJwU3Z4al?=
 =?us-ascii?Q?DL4qg03GC7vYteBd5UZLCvONe/Ck1btwPI2QiMX2fi0ljWPlF9cf1tVXCIMC?=
 =?us-ascii?Q?GnHdSpEA/K1Np/R36wT6x9UsCPCtd/2xrDNoMMwf1PSL5D4Bo5LhSudfde3a?=
 =?us-ascii?Q?08NYZewolZiNcUgD0tytN6Q4KSN5RdUXeJSAmC3RmFmSB3C0BcZQxf++DrHH?=
 =?us-ascii?Q?ECFkIm1ID0acvywtpr0Lm94gUz8RJaY11oMBCsuMUJJdmWuTC75kLWIkqofp?=
 =?us-ascii?Q?whN0SG6C5s1BjAtA9QTXRbCrKlQYV35KGByI4jUVCnpKoA+UmhcsDwO8KR63?=
 =?us-ascii?Q?xqIqsm1tk9jFIBCBPRYTNSbMv1S9x7kFehfuGzgzqdi/ua6T1FLbEqdawlbd?=
 =?us-ascii?Q?C8aRWN7TIiEA6x92hdpuLocUGxSkRJVTc8/zWCOKm3bm1F+SQQW0lI29eGYE?=
 =?us-ascii?Q?IKKPDYG2x4PCQOhkwPOcSGjCddjPnqUJGkP1N7RFCu+HW/UZoTHAtWzzxfxj?=
 =?us-ascii?Q?CSzCzM/7fwyGzfGR5ga3/pnzQ+uzDryGzRo8l8E8j7vMjPEg8dGpHcMMto4Z?=
 =?us-ascii?Q?J7BQ3yzZqXQOpvddve0DmwYgDlGzjGyJdSUiqXjDGRwdRFS62T9wFJ6M1nrf?=
 =?us-ascii?Q?xj7Ss2TJ0Casxu2Wx3pILlG23HmJmRZsGWSON+4qP8huutkOJkkhgNlfnzGO?=
 =?us-ascii?Q?83Ig4WhM7deumSCMRBtb20IG0IJSyrOBqzIfhkS6tsnImmXfWH+h9GvIXdzr?=
 =?us-ascii?Q?Makv+9MnflbBFvTEwlG3o6la23f27MYOhftZeHRLWEF8zX9Gh7+v+U2XigY4?=
 =?us-ascii?Q?brE+J3QN3mRgXTZlcxrMfnkQqwsnWhMd1KqTqfkO5c7SPMXUIhswhxuMDp3J?=
 =?us-ascii?Q?2aQHRaccCQhZSC8a+bTPXSunvNHeXvXm3K+u/mTusGGBrMAFF6okFE/2KXrk?=
 =?us-ascii?Q?eoln5l/DzOG+mjvcIayhYM/lD2V98vBetNQSNfnkeYasyAG1WgRVtBIkTSyq?=
 =?us-ascii?Q?xKFRhfxVjYX2bBBmt7kARZ3aVBVkb2tkB4w2qquWXvBY4MGvwrZ1LXGNBLg1?=
 =?us-ascii?Q?DkUUggGn0y5aAocCXp8D0JR7IgBDSNKTEXJkkXpkRehfm+Fj/b3imt/EQujm?=
 =?us-ascii?Q?izk0OcwBDUpYi2CqQ8HsgyWOjppNM2fsj0BFNGtvg9IKH/Pwkmhi9iBtpnjI?=
 =?us-ascii?Q?aKSB+vdkNNr8CaTCpfj1yy5QtYRILKgDXDZ+mhvAakLWN/vVADuY12VL7TQi?=
 =?us-ascii?Q?sBKUrT9Us5LzswJw0KST1/MAeDGRe5qbfrVLqXIe/xbMTHRS6bPvv2CebypG?=
 =?us-ascii?Q?5MLLPiazkW2mXx/4S4wLu4aJsN1u8iePokgSMMFHMcQMRP1qTKZqPXxEPH2J?=
 =?us-ascii?Q?FjRgEFBpKRsQvJNwhvbfLUPSVAsdoMAf4F2zeamAeuc1Jd3PjC9F4kO2tVP5?=
 =?us-ascii?Q?IJA7k4LffEZCv1hk56JKNxyeCZBH3lFuktc1eDUrQmILGvMZP9JimqA0TMel?=
 =?us-ascii?Q?rg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: J3JA2BTnwwwg/110NBDgwXIKn9IBGXtAp/Bn1Wcje1TDn4TKP37mhTdp+/51CiZGvaXYTuNxeH5TuiWwhnfdqRA/w/36THHP6PXbzsiU+50KednR9VB/vFFQiUlzTRBY4Q1tsUj3m9gpL5+G/oReHy+DJcq9uduPJn6u/nA+S8e4Ren10JjCa2MIVdv1ZnRH1xEBc0iQu2/1RJzfDeJv13nzXdDqzjEMYmg86gM0KV0dH8zZJD+0XcDZ2p7TYZ9qf+93IGyekqI6pJdk5fZcOVSiwyNuwAJplJGYgrpDx+TginmkVZoTDlO3G6r1MoGgaT+jCOKT/aE7v3wBarvx7uWQywU186ySEA5Bezqi6fnX1e+9oRarTl4hE21PWZTx+BjIWpYXdWAu+zXthHTa4rAFd2mS0oJRcSNmZeHYwxMqKahWL55mdiYkk4oZ32ZFGrJlfXdk7zBOvBwCUbGVbRdkB1tIOc3tgatlvFR6zCEOjSfh0I4j7GEq/zP40ybzc7+4BzgtddQnNNm07tzrfWKIfRrFup8/bxdlyaqck2K3U7gg1exu2fB0TLiObkdzlrm5atHqq5dqQB7BOiqx3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e49801-dad5-4a01-6857-08dcfcce0cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 12:41:48.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFENbGe8Z0cFxkFlvcqTPA4/qDlbbykLq84td87MBNMvbz07utXyokqPaj3y61wR3pZN+97NT/xU6bb/lrZfo2riW6OW2URVYuLBk9D9ZIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0274
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXNklddFD0X0veihPor5eR4g7dqcL61QG2p8g9AdflI=;
 b=isptif+DRDrLfPF8ZxH4busrVS1/CXID3TCwSBdJQWu2+QoKwYtjOojFdVoNB2jkcx9XsnMVf7fEtPh/nofkHRU29DjGRf/6cPcuOG5PJIkUvIadxttgp/1CxJmfZsIHDQ3xSkWG6bG0k0GhvWHsCJyexyvmac07rCah+yWd8RQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=isptif+D
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump to version 1.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 66f5285cfd..0462203223 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f489e0fdd3ae07be1a6483bd47113727ae931749968379d823e957cbdde9e8dc  libzenoh-pico-1.0.0.tar.gz
+sha256  8f675d72b1141ab844947ad3a2a4932f6469324c76cd819cb2724d5dabee7d93  libzenoh-pico-1.0.1.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 6009b7d8bb..166dbfdb1a 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -7,7 +7,7 @@
 # This 1.0.0 version is really newer than 1.0.0.12, so please don't
 # update 1.0.0 even if release-monitoring.org claims it's a newer
 # version.
-LIBZENOH_PICO_VERSION = 1.0.0
+LIBZENOH_PICO_VERSION = 1.0.1
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
