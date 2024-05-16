Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4158C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 12:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FB060E5B;
	Thu, 16 May 2024 12:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m6_POVZuWap; Thu, 16 May 2024 12:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F6960E5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F6960E5E;
	Thu, 16 May 2024 12:01:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43F1C1BF358
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 12:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F6CC41521
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 12:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKR2MmZYURbD for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 12:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44A7141524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A7141524
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44A7141524
 for <buildroot@buildroot.org>; Thu, 16 May 2024 12:01:03 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 16 May 2024 14:01:00 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id A5DC1B5AC9
 for <buildroot@buildroot.org>; Thu, 16 May 2024 14:01:00 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 7AD46B5AD6
 for <buildroot@buildroot.org>; Thu, 16 May 2024 14:00:11 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 16 May
 2024 13:59:37 +0200
Received: from stwz1.wiedemann-group.com (172.25.209.3) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server id 15.1.2375.32 via
 Frontend Transport; Thu, 16 May 2024 13:59:37 +0200
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 951C1B5AD4
 for <buildroot@buildroot.org>; Thu, 16 May 2024 13:59:37 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 16 May
 2024 13:59:17 +0200
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (104.47.11.105)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 16 May 2024 13:59:17 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHX/n23Ynv+NRoMEsfLLTgRavo/CU20zMsOOndai+BDgOa9SPaJoJePWRk89FDiCq2YWvrNWxy7RrWqzHjlYpPI1aKXEcdLgPu79dOZuRF0Ru1kyfYZTfxwqcI8kV3zs1p29TwvQjJMPJCj4oeBR9HKq20lBuCD9CxpufUWXVGDgUhdv7wbBkvN8LmQ2yvX2Wv8AWpL/WHX5oxfFacQ3AzC/L4gtW3MumhUJYjvhWs61RyEShQI342l0oGoplAW3lqSpHU3Z7DY8SxoVtsaLGWfEgvx6opK+vBwsoV+8uGF31ihjwN7cqCsK3FFBiFMc8+rw3RBGs2e+dfqwL0VQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lchhCoSlid5U73WsDeP0HrdAzKZDjhWcGBbGyjjTfmk=;
 b=nH/07DIlDU69/2Lsz3poP5YCWSJtETuIk3RUs+5AZJsA98BiX0vKgLBHXj0LO4Rlu/LbBdFL2fzHOATF/xduvS3VlpEXk2DVOB7CQXns9Y10lx1EIPx2ChOEuIXnrfc4ps5sMdzv38sJaz/EOvsB5DOxaCySZFkSDYBsbhMK7HRvNvfgp6DSP4v84cYaxbMH5Fd+pnxH7KKSrclzmlWZXWmmVw05UAglJzr2TtdL9dRK7/NNgAKt0VuUaCXg6w8wElMOqsEsEsVQOpGxZWk+FC8n3Q45rt4ZngAdqnACgQyduiC8uyDVmrL7Qi2Xols8jPdIdqCg9FG8+1lyBQ3VWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PAXP250MB0542.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:277::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Thu, 16 May
 2024 11:59:12 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 11:59:11 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/libzenoh-pico: bump version to 0.11.0.3
Thread-Index: AdqniF5eYByIp98sRVC5yEGXVgavug==
Date: Thu, 16 May 2024 11:59:11 +0000
Message-ID: <AS1P250MB0608C70246EB85EBC2432F31A9ED2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PAXP250MB0542:EE_
x-ms-office365-filtering-correlation-id: a2c85ff8-96ae-4de5-b5ef-08dc759f99a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?HSC9AGqRJUkreK3+zNJUGAFlmXYoeLVXYCXUCkVBJ8QIpn7JzNHSAUnBFIxY?=
 =?us-ascii?Q?foxcM6FN2q2ZJOPsvoqJUJGf1n+wnaiIgMZPJVtKD7BTVhAv32lR/JPdn0Ty?=
 =?us-ascii?Q?35znIZrbDFb2CL8mIBQMRwogbZomgM58jy4NWlvhUxIl9SmllWp9SawvlO2O?=
 =?us-ascii?Q?AdQEgE7+ePpnQgJePAFDi2p970wpsJB8Q5GfIdrUv5VL9XB1FmAF0vq9qZZA?=
 =?us-ascii?Q?5ZZexrrRMAoLOYn+Q/GPJX1h3PcXwPFNLbiKzImo9SQ2khxnltliP/89vv4b?=
 =?us-ascii?Q?yhZTMNO4qy5BleWP2DoFcCdAkcXO7/VxA3NnjqZW90ADcyl4tQYOm7mG3Zr7?=
 =?us-ascii?Q?pO35N3v///lgTfkrYEGuJiAH00I1/9Cv0dVKYqyq8L1FvI6ff5OaBXQQOrY5?=
 =?us-ascii?Q?gQYsfpQKl/2SvelTUrs0ZCtUsTl/8mEfIDaJWOamC9iQKmoioNy+qNWcYlE6?=
 =?us-ascii?Q?6lEpNhOM+xNngJmO4NafsnU1SLjTg4OmCFc5lZ2uMZDS5NQmdw11RPxZFGwd?=
 =?us-ascii?Q?StdAREkdSUcTjbQMgFilf7+r8hVWQ5iEZV7gD38JVggfOKUiBUk4lHYhW9nA?=
 =?us-ascii?Q?dO0lo4tAKCQV8Lfi6cOKi2xToxt6DLB/neydNztDIr9Becuee8hmLhFrh1yV?=
 =?us-ascii?Q?5bkBjRHyK/17ghBgIOU1wLM+Y7+Fn9mT+NED9yMclrVDGxJxiQkelMtKmneE?=
 =?us-ascii?Q?z3ik/SKOBBgc4pg1mS+hocH3FOqCHadWTjMuy6Huds7abVnPx+f5OCcTiZoh?=
 =?us-ascii?Q?YwEOdZRxqXxRqIAZgvKfA3SJDJbfCyihR95WSAr9z0/Ln5bNqKxd09V3ZgPG?=
 =?us-ascii?Q?eGjpZrvdTs+YRPbxKE4Waq4QfRfAkd9U2RFo7CU4qDSWRxFqbSZKoEZykwZs?=
 =?us-ascii?Q?AWxSN9dhP4ZndiFgOeY27/qmMehrTuvXBPlW3dcd743+T58JxrO9Ats/lPS2?=
 =?us-ascii?Q?9dFS0XsSE5Pj2Z0Q4b266oDnJneLM6lvdhsAPdSskkDIZOJgyL0BxAQDc+eM?=
 =?us-ascii?Q?gq+pYNtYWAYb/XlQ+4SFNtcbTHmWih4VkPmDcA4Q7cKUoCEW1TV+OpEsB76k?=
 =?us-ascii?Q?LT6wxu70Y6yW6dbiIERNMaAXcAszkHgDhdZZi58/eh6BHiehwGnPNafiVLrL?=
 =?us-ascii?Q?GIbnFi0yQvXNfuadkMk/BkThorWjkEbQJQL4X0xLKzGcCSaFn3wvpDQAvjdi?=
 =?us-ascii?Q?MDXsiF2bxHHdML5Hqa7nGZYiY9KtgStgcVyLAvFG3G/fYcMSTmoRLyXLEQ1N?=
 =?us-ascii?Q?XqylKGNIXun5G7c6OIqRj1K2UyifsYsz5Qb5qVCA4A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PFe8lfuN+zTZgIfVx7thV0xS8UHyHP4RdXrRol9FYehc9tNSD1GroCZzuaQR?=
 =?us-ascii?Q?nl92Lb0fZ85+r+12ZTm/zYp7/f1valnNl7nvbrKJjgilvPP3+ujKQ2leqSsR?=
 =?us-ascii?Q?SyBvJVcjp1kf4BLcUDh7/vTNJ+5r/nZeXzpSM7JQ3Ngvw3iGca4IJ9eB7GgN?=
 =?us-ascii?Q?qwZpm47J0yCpjAnqz4yqVWwTDnGIuj+4OAs4ulIYSebCRNR5UOOXMm+97bhn?=
 =?us-ascii?Q?n3/0UXDkRDYpcppNCA4C6Ni//kuqmsZm4iPzB9qZ4Ur6/xHbKlkVlOzQyKQK?=
 =?us-ascii?Q?V+z3TlTOSQHEKXPK6q+NSPXdE5E/R795m529gd5S00HFxs81xg1OeHK5W2eZ?=
 =?us-ascii?Q?oGo5BymDdqXglJzIIBX5FGtzS7iBF1qwgVkBOWmnzBUIlMMcHW1sKJp+9xa1?=
 =?us-ascii?Q?5v7bdhpOYDlhXDGykotbMEERLe0Z99a5r5nPxfrrkGBj8/FioR9qsb20gf60?=
 =?us-ascii?Q?4BYXP4vLT1YT/pSW+/3V3rP0RsvMTQK1kaYDBdriLG1VmjD+iy/G9YWDbFvo?=
 =?us-ascii?Q?VcoUF4pom0S1pHXnFnE9Q1Oj0AHBcZHdvDwqHv7x+/uftTol4u9tJSbGoSLL?=
 =?us-ascii?Q?L+EBh1QFLyMRBJ+tq/yb3TC5VGjkVQ+GTtNpiHf4ODM7oNw5p7TAhVqFM/yF?=
 =?us-ascii?Q?JfkX3FaQyGUOxhRtG12rBzZ77s/v87blUVadgQcAvvDJNhkJcvxho78Cgbp9?=
 =?us-ascii?Q?qK9qX6Kk8k87D7lHk46U6Y+n8Cfzx/vla72PNkKdYo0Ff5l0K24H+z2V12qa?=
 =?us-ascii?Q?KjXugy1JvtebZ2qDGOT1CIPKeAe0fFAyGoAgWZTpHcq6aEz8r9QKF9ANORxp?=
 =?us-ascii?Q?+5x9km8rGOF5WkA6fTE7AyxyMu766lj1BwRbDeM5uXoPCPUq6sBcoDX37y8Z?=
 =?us-ascii?Q?G02YTW+5D+snWXxZA2rjywtlE2XhWKU9q9wuyOwo8xudHcTzKbrosWGnriBL?=
 =?us-ascii?Q?2ZGPqDKvjNwYBoGVeB4EKIyx5A5eDQctJOqqvZXoaf9w57i8mHy8jP3eXMgz?=
 =?us-ascii?Q?UptzYc6KMRlM46MC07sv0h/X+24lKaGoMQG232pSWZDlkQ8ydpb980tW1eLo?=
 =?us-ascii?Q?cvA6kfJP80jwBZdM/ykBI8fh7hQgCzTBRuqZcmpgACVWCdQc+uVPmfNP1hea?=
 =?us-ascii?Q?oRucDm1PmrZWb51EScEN/gWG/1j+xnOBQ1cCQwYXNk3hkshYdbxCD5ekmf9a?=
 =?us-ascii?Q?t1Fln/8EArYaz6sFbBCVflxjJGAeP/CrI40hKq3XPlbLz3/KlrNQyF5PJ36n?=
 =?us-ascii?Q?Lma96N8WtFbesKQiO4mLTsBYSMfJs2MGyNKR374XwgkgT0kYelDEvCD3X3Nq?=
 =?us-ascii?Q?Pb5YLalxmxwikLpq1jemQ5BZE9gAHNBT07r0pwYYtM5MKgxQ8h4/w98I9RiJ?=
 =?us-ascii?Q?UXfXi/4kDbSkesnHpKwIwAErOX3ULV0Dhmfrvf+0j7laKCkAk3eMAOB6gQmc?=
 =?us-ascii?Q?GZ+LPdfWRwN+An86z7Uab6zxEFNdavwnNUltPa/WgpKvHMjKTUQORsRQ2jww?=
 =?us-ascii?Q?0zgv+3WUM744IsbOeNkQmwevnRcyPJN0chPczZLJGLkGgzXHF45LACrBJHUt?=
 =?us-ascii?Q?oVh77z4Pv9Gh/GgQ4pQF/+PUaZE9ZkpyS+q2u6YzMhlXnbQ4Bgb0flW+cCsQ?=
 =?us-ascii?Q?PQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IUN0jM6qnLwa3s1GmGXPAi8VAJH5Hp3P8BuQqo4JJUfxe7Wq+sIXT9ASbDMVDtPV7K91bhuQcxiCCXMGH1sIeakG8TJgR16lfcEyXJ0Lm4JEk48FbM1RmUUvhQtfUBBOgTPogeHyKRX9qArH7F+luG+gs+fwVh+XFznol2YvquF5//wLAgRAwjVVy+LVzc1R11NqdKtYPpillmgOCYJpanyJkekj0StjjMuxGwFWDj7um8e4XRmoKrj79EK28a8TdICiP8FJPIMtIK4e5fX4DdGC3e4Iqai1A3M1Z5HfFWINQmhrTjc4eVRtvW1401ieYvQHPCaxG0l7fuwDN6Cj8RZzhzR9ZtaI5UCEggfM3wBpz0FBV3Nr4vuFMqeScjwsnNT/OHT825uWOXBZb0yHN9tL8iPrAr14zPHwWSQ91HmKX+kvlvkzP+ltQL1fUT4lV/EWY9rwpjzc7Uf/CJvhU0KcCbPjY4sybWSFuj8ICczoN1rtJYeAj+UkkOIyLJV71oJmrQuKzuCsV4MBlVk2xWFEQZ5goOtPz6HjuOZ3KVeyALwqaKzp/bG30QqzNF5ZJ9y71pkxHndG9HL9U3tlDw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c85ff8-96ae-4de5-b5ef-08dc759f99a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 11:59:11.7304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j6abEc8Gu6R+FznwfpiV53iue8nBYr7smu5y/WxBsoOoi8bNm9FivmOBKAif4gpH7bOfObazwytycQSV0C43DPNqnPJrs8P50wHR/7KYpa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP250MB0542
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lchhCoSlid5U73WsDeP0HrdAzKZDjhWcGBbGyjjTfmk=;
 b=TRsVbNWvuLK1BGQoFIIe51N6rZ0kv7idY9Fq96BZnJrvLR5RUt3jv5mmoMRK+HTODjuhTs18AKh3/qyM2TMUNL01+p8NyykbdXwSwSOgHObGBY46C+JhOz7hrT6stE+FExMSM2HwRwOH++QSJPFiTYWGrN6DFMUvsLKHoj3ut7s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=TRsVbNWv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/1] package/libzenoh-pico: bump version to
 0.11.0.3
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eclipse-zenoh/zenoh-pico/releases

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 945d0f9aaf..9ea45969aa 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c259da44aa919919d1129b6a46edb05e2f5f2bf2818f73c27f515e443da9fc83  libzenoh-pico-0.11.0.1.tar.gz
+sha256  a5bc5cae6fd4ade3d69d8a2ed0aef89f4c8f752f79d74b7462f5bb3437680b72  libzenoh-pico-0.11.0.3.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 86204de14f..9163ba30ad 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 0.11.0.1
+LIBZENOH_PICO_VERSION = 0.11.0.3
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
