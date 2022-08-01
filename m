Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C334C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 13:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99EB0404C2;
	Mon,  1 Aug 2022 13:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99EB0404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kOoyFGY13C6; Mon,  1 Aug 2022 13:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA74640424;
	Mon,  1 Aug 2022 13:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA74640424
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A51D41BF34E
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 13:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C8E760B37
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 13:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C8E760B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-Be41rIixYb for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 13:36:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A4160A7B
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00058.outbound.protection.outlook.com [40.107.0.58])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A4160A7B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 13:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDFs8WB3jDAYm6sf9wb6ysi0doVT3JuBGgdtPNjyZHld9URbgL9k59eZnAVcvB3p7Vxt0N7Tx0fHdVNbu0MtAZ7DLROxgiQXhOcgwRYZZOXZ8Kv6JiIlgErs+T3hz1zf6UN2cV6YWwOg96YjIS54tnWXQR0vmykP5AxxwoBXM0kr1gfy+bHBl5tlGDW0zpG4DKc4332zrDpecV0iIbvpPnGaMscz3Vp4s7v30nhmrOvGzxAZpb8nihGoW4dyIGevaUmA5s23n8wTdg4cxI63AcSCypGFUbop5OG/LGnY2TW7f/+B+7q1l5pSZgHe3oiRUUBWdgAI8MTitXq4L3zu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFctq3yqQDjM4DbMt2kkEg1CrhMWY1L1PCb6Z3sfypc=;
 b=LoFLOI1LRu+OYguvFq6/08tWwYxCkA2AuZDcs2JdpiygQXZdMElyiabE1NqaGdYQlE00tgTFMm0UD6e1/SD80U+mAcwtkFqcxz7EMqDyuPYLQ1hMSYYkJQrpWEYvFX36MPSU1kPlcVmzq4EXJ5k41QOTa/FaglnPa6lXYwr1J9DG8ehzRNJozKpBygVEil9c3j18mIABjntg5wQXJ8QLqZ0HZywVfAEuT4MgGS2VawNHD0FpWhKc5EYvEFRgoqK3LFNpB/J781swhvV56k3RJnT2/ajesEpTJWR25fquKLJfcU0Lw4+smbrwjZnBml9NqPKnvgsQln6SZldltPhvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DU2PR04MB8549.eurprd04.prod.outlook.com (2603:10a6:10:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 13:36:40 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 13:36:40 +0000
Message-ID: <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
Date: Mon, 1 Aug 2022 15:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Roosen Henri <Henri.Roosen@ginzinger.com>
References: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
 <20220730121955.GS3168@scaer>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220730121955.GS3168@scaer>
X-ClientProxiedBy: AM6PR02CA0032.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::45) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3d5a59-4b0c-49fd-b17d-08da73c2dd48
X-MS-TrafficTypeDiagnostic: DU2PR04MB8549:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utT9iFMLMiM/C9we7CZfI04aNQ5TlcuPFY5lCRRGNWDhhkEtREX8k9RI5plNp9+XgbRrL5X11wx0qn1mJjDcmMi5OSA0h2XTyi48h62YGesYztfeDXr8HpZdYdzvFHMISlCqT9K/Cz3rZTb5NesFQXWuBRCarOOA/cdHeX/CUUIgXOCZceP87ihNGcoWSLE4EtwIesWpryqsjK4w/Z0kMBiFXXCufQwUsJZ+/2fJZTid0GCkg7uR8RUC/nN/EgznycCCM70X/PgAdJC5zy8al9EHKs2tdKaWsSKxEGDGq33qnTUJb7YsD46zevSnvU8sifWRM5dpjQHDur8dVMTjQllmOI+5vmsi4w9HkxYw/uJFs7QSC30dhsqyEoCuxijb9PALD2V+1EiKyh0xn9s9ZpzyGEahXMIjaWtxFgPCJDJY+vFUNfT7yw4xA1/Z/gl79pgv8c/MDxplUhJ2sl98WNWM8aaicUOMTz027NgzKQw0wFELlZmfLzUVlSWz5pn9PXjZ5gPjqLQxLKMYjF3wO1ipLdfsshZUGf53bpusYH1TYpL9x6k9H+qftkQ/vv+SNaHduAokBYSfjIAY1T0BNpIi42X1qbMnDzKFHGsvN/0p3FlVw6EuGd+t4sCWhnP/eM+hCKtmJj2RtBJuQ0R/4MG3BhkMxTJY4v4Yjb2EDJPDxDQFKmecgHdJf9tJ4rjHAYukQ/oxb28pwo5pyy4DSlRC21QdUMlIZUsIOhu4bzZcynspDNkcqI9KBW/2Yha68RSddk92O1X0gvI+0N9vpb+8K5JryWxrmiyiyA//5BwB41BKDdN9fNRiwfZYbSEzmVsgHAszCXn3cpbM8eT1fp+nja9fAdjYZc12VJ29nfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39850400004)(396003)(346002)(136003)(376002)(4744005)(31686004)(66476007)(66556008)(4326008)(66946007)(44832011)(5660300002)(36756003)(41300700001)(316002)(110136005)(8676002)(478600001)(8936002)(6486002)(2906002)(6512007)(2616005)(26005)(186003)(6506007)(53546011)(31696002)(38100700002)(86362001)(41080700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2dGNjJwdDBVSTBxajNVcVhVZnBvTzltNjRPTFE0YllaSDZQY25XSEUvRWE4?=
 =?utf-8?B?ZUNPZE1ETW52ZkRBaTJHaGVMeHJhd2tRSGxRNzFlL29Sd1FGbWNiOW5zZDVY?=
 =?utf-8?B?UEppZUhHUmIxdzA1REdoUi9RcjF0VEU1TWNTWHlTMkZocHNYYVpMUS9GWHNk?=
 =?utf-8?B?QmlXOWV3TmN3SWVzYkNjMWhJdTUydjRmclQvR0Z3bVZwRTJJWHMrUExHMHlB?=
 =?utf-8?B?ckxvZzd3dUVsUEJ0cTN6SEpLelR4M0YrVWtIcElDdGd1enUvU2ZaSGQ2eUFE?=
 =?utf-8?B?d2s2WFRzaml1Rm1vSGNaVG1ZejZuM1VIdURadzNPSW85UERvRnpaaVpQWUlS?=
 =?utf-8?B?bnFLRVc4anpodVBwZzlHWnowL0ZkZHlYZ1hyZjJhU3lVY3g4Smd5aHBrcGFB?=
 =?utf-8?B?dGZ4R1JWaDNUU1FTYW45Lzl0dFZQek1CQzFIRWpIN2swaVZscm1ubjVYOG5F?=
 =?utf-8?B?K1RZYkdJNjdxV21YVUFmaS83TUZaUWp0WWdLYzVsRHhYMXRidUdHRFVFT2ty?=
 =?utf-8?B?UzRyNGdaRmpOUTBwUGNpMENOcGUwd0o5UUZjTGpoN25xb1VlMG0rWXZUQXM5?=
 =?utf-8?B?VCtRTVM4dXlwcmQydmJ6aGNueVh3ZDErUW5ZTk1ZN2UyM2ZpdzNEY1JiUVQ4?=
 =?utf-8?B?enZFa0pyalBDVC91RnF1ZzhhWCtWTGJjM1dzNDJHRVR2ZnJMamd2NnBiK3dt?=
 =?utf-8?B?L2tIazhITVZBTWUvQ3V0Y3hNMXlvamRIL3RJdDZJZVllRWc0dFdnKzFtalRV?=
 =?utf-8?B?RFZMOUZHWGR1S1lLVk9hVmE2UUx1Q2xOMjdTK2JVYzlDa0Z5VlBta0RGQmFC?=
 =?utf-8?B?QUJNOVNmQkt6a3c3QldPSUxBaW9GSHhhaXYrZXdYVTJIbWxzNFdUdlhaN2hh?=
 =?utf-8?B?TEpORy93QjhNc21JWk9TMDV1SWp2cGt5N1hsMENPS2lFTCs3T3J5NnMyK1Rl?=
 =?utf-8?B?VE5GWXdnSitZTzYwMHJYaTQrY2Y1a0liWDMxRVRQK05ZeG1HTGxwZmVMUnE2?=
 =?utf-8?B?dFNFU1BDZXZlVnh6WGp3TGl4dUF0bUFGam9uYkRaeW5Gb0lBcTYwNWxkOFJ6?=
 =?utf-8?B?TUZiV3ZKZUpEY3lmY01RNkJCOUxGbjl4S0tJZHpNaUg1cjZrQ2lhWHBoeTAr?=
 =?utf-8?B?NHlZZm1aWTVLYjNPamVGb1ZNa0hKRFlTVFFTMklRTGt5MnBVbERsbXZEQ1M2?=
 =?utf-8?B?VFNYMFVrQXV0NlkrYmZPTS82Rzk2b2RRaEpZMFhhYkFWMHpOeEtpYlRYaitu?=
 =?utf-8?B?ZHZKdFVMSW5KRjNIY0ttVmVJajVEQ2w3cXJ3MDlGU0pQUTJ5Rzc2NCt5REhZ?=
 =?utf-8?B?VjFMTjlBYVRkMFhwLzdOYm5Jb01Gb3htYWM1aXZMbC9UcmRCdFlhbVA5TXRM?=
 =?utf-8?B?VFBuMWp5WGl6WDJBVjRZbHIxbUsrbThIdng5SnFiVjd4N3kwZDlBdCt5MHFk?=
 =?utf-8?B?RjIvdVg0WS9zd2I1aU9BT3RVd1ZNN3BSa0czdlVaTnp1dHlzeTlsRnIwRXpw?=
 =?utf-8?B?eFo3WXliR1pBdWxJdW1xWmQ3R0VkRjZFT0U1WW5SMTZXdHhFOWYxZ1VTb0x4?=
 =?utf-8?B?OU9iYkRLd0FvdTFPeW1hbStxc0taeGdTUHYyRWxORzArdEZOeXZJWDJHbzVM?=
 =?utf-8?B?VGdMaEVNbTB0MnY1N3JCSy9YYnN2NFFBeit1eHcvdmFQTkZsdGZuZkNEWk11?=
 =?utf-8?B?TU5FdVA5TWEyNVJDanpGUWJwTHNGOUx5NDVFTUJveUpmMEIyeWFuQmFvMi90?=
 =?utf-8?B?NVBlYXNYa0RDWURhQjVReS9MeS9xOVFTd2VFcjV3TnlWSzFMOC92MjgybEtM?=
 =?utf-8?B?ayt6b2ZZRHY4Wm9CbWtzdXJlc3BjeFFxWXFxSVp1aVY1bVV4aDVuaWZIK2Yy?=
 =?utf-8?B?SS8yTWRVUjBRSWlCMkQ0TG1Nbkc2bGZwdWdHZjNqemtvZlRLcEU4cFFvVitl?=
 =?utf-8?B?MG9LNE5EZklxZm1URWZCQ1NIY09adUVZYk1IK1JkMFdyazF2YU41NVh2VCtP?=
 =?utf-8?B?TVU1TG13ZlFwaklaMDdRUXFGYVVxeW5nTEhZSHpLa1B6Zjk2ZlF4YytNQmhG?=
 =?utf-8?B?YnlKeFNKU2lmYThXMWJBWXlQSHkzR2s3cGZaVlNCekR0RUNYVDBsVUdERDVM?=
 =?utf-8?B?bE9ocDFOM0FNY3RGM2MvRXA4ZHVtL2NoNDJNZkpQTHUrbDBkeWtmZ0xVMXdQ?=
 =?utf-8?Q?NbD2erW+L77mJG7Vz84M3bo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3d5a59-4b0c-49fd-b17d-08da73c2dd48
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 13:36:40.1145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm5kfytI2q/7KiyqZ+um79xxwBXgdtULHWvGgsewgUDFQcc+nfJTZ3I4ijS0mabeXfueJwUH3sZdeejMttWInJBEsIs3AaeS7UFJWrgddJfDBIgl1B6ASwP0hdKzMGL4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8549
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFctq3yqQDjM4DbMt2kkEg1CrhMWY1L1PCb6Z3sfypc=;
 b=di5DwEWwDILsPseAu3GIkpNvR6by5xYaAYrEvTI8eqrpfOaXdOLkfJ/mB9/fR2eWXTWI3+md5Kq69h1welmAx4T2/Kd/QrT3aDQ87y+dbPGzHti1aYuCAcXX10GFBihLhz8tzM7ByQWNPkstTyVJeaqHMDkZahXP9kPTUejyVkA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=di5DwEWw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: workaround make 4.3 issue for
 'printvars and 'show-vars'
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gNy8zMC8yMiAxNDoxOSwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBIZW5yaSwg
QWxsLAo+IAo+IE9uIDIwMjItMDctMjkgMjE6NDkgKzAwMDAsIFJvb3NlbiBIZW5yaSBzcGFrZSB0
aHVzbHk6Cj4+IEV2ZW50IHRob3VnaCB0aGUgYnVnIHdpdGggbWFrZSA0LjMgaGFzIGJlZW4gcmVw
b3J0ZWQgYW5kIGZpeGVkLCB0aGVyZQo+PiBoYXMgbm90IGJlZW4gYSByZWxlYXNlIG9mIG1ha2Ug
d2l0aCB0aGUgZml4IGZvciBhIGxvbmcgdGltZSwgc2VlIFsxXS4KPj4KPj4gQXMgdGhlIHJvb3Qg
Y2F1c2Ugc2VlbXMgdGhlICdmaWx0ZXInIGNvbW1hbmQgY2Fubm90IGhhbmRsZSBsYXJnZQo+PiBj
aHVua3Mgb2YgZGF0YSwgbGlrZSAuVkFSSUFCTEVTLCB3ZSBjYW4gd29ya2Fyb3VuZCB0aGUgcHJv
YmxlbSBieQo+PiB1c2luZyBhIGZvcmVhY2ggY29tbWFuZCBvdmVyIC5WQVJJQUJMRVMsIHRoZW4g
dXNlIHRoZSBmaWx0ZXIgY29tbWFuZC4KPj4KPj4gSXQgbWlnaHQgbm90IGJlIGxvZ2ljYWwgdG8g
cHJvZ3JhbSBpdCB0aGF0IHdheSwgYnV0IGF0IGxlYXN0IHRoZQo+PiBmdW5jdGlvbmFsaXR5IGlz
IG5vdyB1c2FibGUuCj4gCj4gQXdlc29tZSEgSnVzdCBhd2Vzb21lISDwn5GNCj4gCj4gSSBqdXN0
IGFkZGVkIGEgc21hbGwgY29tbWVudCBpbiB0aGUgTWFrZWZpbGUgdG8gZXhwbGFpbiB0aGF0LCBh
bmQKPiByZWZlcmVuY2UgdGhlIGJ1Zy4KPiAKCkp1c3QgYSBoZWFkcy11cCB0aGF0IGBtYWtlIHBy
aW50dmFyc2AgaXMgYnJva2VuIChJJ3ZlIHNlbnQgYSBwYXRjaCBmb3IgCml0IGp1c3Qgbm93KSBh
bmQgYWxzbyB0aGF0IEkgZ2V0IGEgc2VnZmF1bHQgZm9yIGBtYWtlIHNob3ctdmFyc2AgKGBtYWtl
IApzaG93LXZhcnMgVkFSUz0iQlVTWUJPWF8lIiB3b3JrcyBqdXN0IGZpbmUpLgoKQ2hlZXJzLApR
dWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
