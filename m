Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1E4D3B9AB
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 23:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F67784CDE;
	Wed, 10 Dec 2025 23:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTIDtXuIVBET; Wed, 10 Dec 2025 23:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA7BF84CC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765407800;
	bh=+LtEOnUIKSuVVT6+sjSoALCOk5BMKzh728Lk+XQz9Uw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rtIQ+2hkE0wbpoGijLHy0YvkEa5zYXxQ9LluMP+IndjAhjAJqloav2n9ZQhTqumg+
	 6GgZVzeAyFErTY2M5s3qSVMuY7Sl0e+lpXUpOC9jISGOJ2c510Pk2AyAFBWvGFBYrn
	 nnWoQYeUmN7mV676eY8ub+gbtqUItvBP6IKzxDWPNN59HdV1wKGHGn3EXmWFVp2+YY
	 KCJ4MyBmXzLVa3THv06c5BcS32ZpDUjenZz0/d61xILxpKhjGBBZBZSUsBN883JtIG
	 u92v93WJLZHgmDV4+2i00CGklO1laiuLRjClE9MNGf0FKGbUe/nhoj7vAHvToX/5vs
	 ioQHH1ZwkTKPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7BF84CC0;
	Wed, 10 Dec 2025 23:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45296237
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 23:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 376284086F
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 23:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbQB0txGMrrG for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 23:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c40d::4;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=afshin.pir@gallagher.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DD8B4085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD8B4085D
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40d::4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DD8B4085D
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 23:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNkp9trE+hqspC0Xk1ryltDJygyQ8G3GdAee6SiQe/BUFjZ44jfHeU5cugBk2kAgMA3CPHeIHEBJya9mhNLESds2op+SEUefh1ckCHLn0oPHA1rWSHu7+c/zVHzFIMWiX/QZAq4SlEsmrvH/KDUXdBO4RgF4BXjIc0WC+8WC9lgU9nXBbvPKchcPB70T3i7XxpFLJ78fgaoIDr4Nyd01aSgcppVXEX3fCUlhO/sSzW9xYsKUhcWUJYPMrUfyyW7s+Qf1DEyZLE6VQVNMiYoXsRJ4Y8qFhMcrmnUuRFTbD2K6gMOGRVP0lJR8PoKWHjvmwjU4SlcVfTsnWQT8W1gvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB1KrFufrG5r2dZalXSheWWkpXRu20qpuOKHMNfHi0s=;
 b=dUvPnzD1qhp8s2qZMLPpsglvrJs2fYCjccQJ0J5jKrcEmCOelHNVncBl0+hF69Vv7o6l5Cn3KHC8OxjcFkZl6ddTAVTi9ltVWzXDlzSibTNpyNNa274j9FLvVCVpxGMczE4J7sm38THxvA74UqZYOMGdpSq5qKQwsXGXhjAwL8FKVWlpUbFUFSqrV75E75I0nmJErKXBFwwJSHhCjhpb82MLYtzKqW1ruA5ZZkVrPOoLMM1BtibPgZV8P59xlJk7wC7s/tP2L7R99fj8ig1X+oJQbKr8tZFsh1RU8KIGPgj4WKnTPaG8+jMav+/VWcC38TYYJ0oBbmJ8zrqJ0xIP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 13.210.31.177) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=gallagher.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=gallagher.com; dkim=none (message not signed); arc=none (0)
Received: from PS2PR02CA0026.apcprd02.prod.outlook.com (2603:1096:300:59::14)
 by ME3PR01MB5671.ausprd01.prod.outlook.com (2603:10c6:220:c8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 23:03:08 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::e9) by PS2PR02CA0026.outlook.office365.com
 (2603:1096:300:59::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 23:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 13.210.31.177) smtp.mailfrom=gallagher.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gallagher.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gallagher.com discourages use of 13.210.31.177 as permitted sender)
Received: from smtp.au1.defend.egress.com (13.210.31.177) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 23:03:05 +0000
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (ip-10-241-245-76.ap-southeast-2.compute.internal [10.241.245.76])
 by smtp1.au1.defend.egress.com (Haraka) with ESMTPS id
 19ECD88A-E0DD-496D-93AB-519FA81D9845.1
 envelope-from <Afshin.Pir@gallagher.com>
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256;
 Wed, 10 Dec 2025 23:03:04 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 ME5PR01MB10153.ausprd01.prod.outlook.com (2603:10c6:220:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 23:03:01 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::bcd0:e80e:b6:394b]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::bcd0:e80e:b6:394b%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 23:03:01 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Cargo packages from another registry
Thread-Index: AdxqKRrcLZBxBLDuQGmHgNTeO7bdqg==
Date: Wed, 10 Dec 2025 23:03:01 +0000
Message-ID: <SY2PR01MB2778F43F8EE8200FB2C1217E94A0A@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|ME5PR01MB10153:EE_|OSA0EPF000000CC:EE_|ME3PR01MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: fd16bd19-4515-48fb-407b-08de38404759
x-egress-defend-domain: gallagher.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?AacuElIaW3KxG5leWfP8j6MjwVCeMTnPrWyKjeAeCovaTIz9lB6m6Zz6UFAd?=
 =?us-ascii?Q?via1eyqrWjQ3WOIYRGSWwJpskgGFU7yDU73dVK1Iosiu4F8hTvZVO6Lot5UU?=
 =?us-ascii?Q?JJDxVWcOewrtu0FKKwxo+aCmnXCwSVNONRltSgLHs3XUpgrfvYkKzUpexUdn?=
 =?us-ascii?Q?Tly+gvWpzl/nTNI6fk/HLBqkPQotEHA0dhVAabnX1iTup8WTvDrD6cMTHVLH?=
 =?us-ascii?Q?ZvcSLhl784EZfr4WzOlEFuJJJ+cwCIyOae+aQYQ5Ni4RW5TTLimvsSw5BzzD?=
 =?us-ascii?Q?9PQZ65wl4+88IC5xV/Y2qkLk+FjiK7d9Go8aNXxidSWfESDhvtk7rkKPKsHU?=
 =?us-ascii?Q?FzW2C3yKWjmdpqJivHAaC2c7eIdIa3iT9xXR67ognK45YjdnYZ9ovmOM8lUa?=
 =?us-ascii?Q?xx2ctdNQjEJv8HRKdBOz3MbHF5TvgdOha34w/UH+qH/Koyb89F4FI5jrNQq/?=
 =?us-ascii?Q?8uk4tDfFUO84Z57CRQFhR+sDJ7EGIhbMZGty3b9VAVyGuXsnuIOI+qifekNZ?=
 =?us-ascii?Q?jXU8alDNdQaZi5IO7q4RkORMlxXY9Z5ySPsISwUihPRXR0AI+C8qDoMiotfd?=
 =?us-ascii?Q?q6z9hftR1SjyrcPRaH+TmnjtNDInfm29MZ4PgaRKLhkzxIin1NYcRbOOu8tw?=
 =?us-ascii?Q?u1B7F+EJQtixWu8xEelpnCvs3b2eSMRN2y7BEGqjCSvkxhAXsxymThej9jfN?=
 =?us-ascii?Q?xcGUO4lz0L8RLPy6yrSm9nGBpo/K9FFHEIuDwF9ZRFPex3Irmcs34x8MXxKm?=
 =?us-ascii?Q?j+3yPOfK5slwRZnIdDisIND7uwCDuzY/VA/HvhZC39ft6DhiKGfyzFB77ZQB?=
 =?us-ascii?Q?igsIBRMI2yknGh3bDUwd+UyheJvCHu8Aa46EpNrpAbl2zEX2ytlKuZZeTJTo?=
 =?us-ascii?Q?ioCfjPhctkySz+dwxkcus1I70VHFCLiJlkWFImSgr+GDy6mse/ICVAWw4Fql?=
 =?us-ascii?Q?At+93zWgpIwjV1v+7oiPX89sCnhjwhoHnyNT7zufoWcndyh1EnVAmunul4G/?=
 =?us-ascii?Q?1vBzdXDUvTmlnE/Pp2tuT0T+/XqV+CpVb8mHWEEbPJF5I5GpPN4UtoqqmBUn?=
 =?us-ascii?Q?oeaD+E6v+HVCeZgMZoquD7m2c4jfGbsQaH6Xzy6Csgex8Rq4e9OqgTP8fLr5?=
 =?us-ascii?Q?tq/wxzYAicmW47RIyDElmF1bXVfRlv7wO+/a5SMGhviqHFoLdCNZvFzYqtvS?=
 =?us-ascii?Q?vlj/tw5lzoJvvuzLLUk3LcY6fOCdFNWlrFQFDDadofOwPZkxPcwI4fFvJxoD?=
 =?us-ascii?Q?L3khm77cVH/fbC+oiDmeTTgsdAu1+T7vs59VJ83mk9DzL+zOPNVAfTk/LiU/?=
 =?us-ascii?Q?qfWvV7BxW7ga95hqEf6sFFe5MtRW/MyFVlUE3BsNbdVdYACc3yV+hKQj2111?=
 =?us-ascii?Q?c57oRoEmKSrj78vtQJc3tl7awQb2CU7Zo+fN1wVN3Zol1nkVSwvsah5adJxL?=
 =?us-ascii?Q?sRS6YPbG7kINky8D2ABOcV73tHiklIOwDN2V0bLDJOxY73jviGFivqnerhnG?=
 =?us-ascii?Q?iOIRfz2jqzBNhQapvp3u1UkafCOGgZZ8r6Gw?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700021); DIR:OUT;
 SFP:1102; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME5PR01MB10153
X-Ajax-SCL: 0
X-Egress-Defend-SCL: 0
X-Processed-By-Ajax: true
X-Processed-By-Egress-Defend: true
X-Sentry-Times-Processed-Count: 1
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d10dd859-29f4-4408-1334-08de38404497
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003|8096899003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X18XSStLowdRsm4nlR36I4YyUeDqbi9ipig8Gbm+MobkeOslXBcUivNsYKYT?=
 =?us-ascii?Q?iUldwU6WzsBewno4tn4hWGkGzs5hCAySJZhq6OSnSU4yrHUusOpdKPgWhQa2?=
 =?us-ascii?Q?j2FzFXhinvbGHdWXvX544PZbADFxOc+EkHHWjsxFD8jx7XfGndMdp018z/M0?=
 =?us-ascii?Q?+ZPV+vweFgkrKED0/CPaiQ5QwC4kC/YrsNda3V50L1yVnIY3hueX6qPHbfi7?=
 =?us-ascii?Q?tkNFHvG4gPZEmKkYrhCwMcZyjMcYQe+zSH/2L7FUqTy40MAWlx+Th9ueixEG?=
 =?us-ascii?Q?vUXQT2JIkMEan/vFKS/n4AetwFLAvbii59gb92R8p0+X/kVAUx6BC1beRlX4?=
 =?us-ascii?Q?dRMys2U2uyn/wq2NOVarn65FELNSfp8ARwt3wgQgsM4IlO640UzgtfsgGFOa?=
 =?us-ascii?Q?ReCT30pNzWyFnYEKuFANt6EevZuk4fdYjB/9p3c38zYhSECBKeQTFply6P00?=
 =?us-ascii?Q?PX+pk/rgEzIuhXakXAjTwHxEFFk7Ul9hwbFwNWdxVQzPFKMASwOl1hfv/xH8?=
 =?us-ascii?Q?iOxoQJwD2+RBTKkAaMypQQrmPZuf2feimx5mLtl+iiHZf3sL24pLLxVlZMrd?=
 =?us-ascii?Q?tFq+qeYAalqN+MobatzetLk7nOwT1a44RovlIdUefmAKX1wwpnDmuv/RZEKX?=
 =?us-ascii?Q?jLK8OH5m5lKpEFl5gPJexaQp1SnYTM+/4DnW3HbccfzhGptsegT/7T8ZVHH1?=
 =?us-ascii?Q?x/wv2Oh0slwjyp9Q1jKecIS8clT9iIQAS59h3EhicEsagjekcI6JfZgWX35A?=
 =?us-ascii?Q?/u9QVQmWG5igFNBEPdTsIyN5pvDiI9lQGZeWnaSDmYd8VYossvNsLcxeb7dn?=
 =?us-ascii?Q?I+XQiG+puuVrmXmLd4+Wa8G1pVqxa5+B1olr0kYsjvfRHvtXWJCPu1gTUOrg?=
 =?us-ascii?Q?qoUPvb1+46auq2CXv4NI/rFZttkeCrsL2PNLiQzKpNbFRDmnFNX+bm9NGvYS?=
 =?us-ascii?Q?TGoIXAhzpa76vGoww6Mu6yOPz+4AgXj/0C2Hzkfbr9nRw9JN+Wsl1UXWfPWN?=
 =?us-ascii?Q?P/zbZJGprRTXsMh3b3GXy51Tirp9a8ONT5SKbnNrqyJ2y9/ZVlv6elTvjG1x?=
 =?us-ascii?Q?uBsp8yAdodWjuVbn5HZaVqMsAWgd6rPJybxW92f4DfrJphwtTGKX2ru9B2iY?=
 =?us-ascii?Q?CoLK16mp8XOxZ8pbHgMz73R54+agvlYfRnTMeb/YF+6qVa88VOjRUvf6ZgTS?=
 =?us-ascii?Q?Q24h9ju2PVDgg2beOxKKpGg8YvB4oSodt094x0xXJrU6XTqb/yyMhavy+vzm?=
 =?us-ascii?Q?bh7B9F1+k/XF9yO3QZFNzpv9c4/GOLuty11A6c8ZoniG7g74uUFfLqHDSanV?=
 =?us-ascii?Q?Q6Q5XzOc20nKDIYifN40JwgSYMPnkqW2b7ajvfLbKB3HwPzoxDaIZNSgGlxy?=
 =?us-ascii?Q?dxtN+yTnB+TOBsoEjb7OIa9tEi613GP6d92ZClw0J6LBWXuJySEX8EGv0iMK?=
 =?us-ascii?Q?LpYoRcWV+ZLtY8VWBbDndA3R9bNB4Tl/VaPo9RvVW9X95D74hoR1+Vqv5u0L?=
 =?us-ascii?Q?B6/42U4fntLO3SVkhEVoJQqMc17/T0dho54BOJq3jO5BOtSpBAEnSzOyXujv?=
 =?us-ascii?Q?V8M2CBarXtT9yyEqTMo=3D?=
X-Forefront-Antispam-Report: CIP:13.210.31.177; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:smtp.au1.defend.egress.com;
 PTR:smtp.au1.defend.egress.com; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003)(8096899003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 23:03:05.5621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd16bd19-4515-48fb-407b-08de38404759
X-MS-Exchange-CrossTenant-Id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2156b869-431f-4815-b2ce-b4893b5c9aaa; Ip=[13.210.31.177];
 Helo=[smtp.au1.defend.egress.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB5671
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB1KrFufrG5r2dZalXSheWWkpXRu20qpuOKHMNfHi0s=;
 b=ZrYIF7AtvdmH3FHeUbF3eJsmBFuHK90RQTqNIEFrsunxGLD/QlDG2taswTuRXL9oVOhVOK1Ug0NPRUtnxOZM2MThKdGQ/iqU6eDZjS4fn8gUTyMBYyT67AgW89hi9cEhcYz6MOyauwX272g+AsuVoZeylR/uR9Wr8vGlxrc98ZoT/A8ixPAApMii9jW1yli+9d91jlxYnFvLDMPY5/7AJ+mu1wqrOTjk5P25G3DOVSUqpi4NxthqwipoNG3+tap+ssj1z2YhlYLMsKMdcqax4rBHh95bZgZ3AZSp8Gy8FB5vXcmSitqSm80ZkK0V7AIAWJk9nlSGHDvgoZ1qevu6Tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gallagher.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=ZrYIF7At
Subject: [Buildroot] Cargo packages from another registry
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
Content-Type: multipart/mixed; boundary="===============3626956052457875507=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3626956052457875507==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB2778F43F8EE8200FB2C1217E94A0ASY2PR01MB2778ausp_"

--_000_SY2PR01MB2778F43F8EE8200FB2C1217E94A0ASY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

By default, buildroot uses crates.io as main registry. I wonder if there is=
 a way to change this main registry to another location. Like similar how B=
R2_PRIMARY_SITE option works in the buildroot.

Best Regards

________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SY2PR01MB2778F43F8EE8200FB2C1217E94A0ASY2PR01MB2778ausp_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-NZ" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">By default, buildroot uses crat=
es.io as main registry. I wonder if there is a way to change this main regi=
stry to another location. Like similar how BR2_PRIMARY_SITE option works in=
 the buildroot.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>


</body></html>=

--_000_SY2PR01MB2778F43F8EE8200FB2C1217E94A0ASY2PR01MB2778ausp_--

--===============3626956052457875507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3626956052457875507==--
