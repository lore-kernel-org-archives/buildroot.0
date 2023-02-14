Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F23C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 11:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C54360F82;
	Tue, 14 Feb 2023 11:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C54360F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJ3wN3WkjZ2m; Tue, 14 Feb 2023 11:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4E260D4C;
	Tue, 14 Feb 2023 11:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4E260D4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73F2B1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 11:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400B240922
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 11:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 400B240922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnV0jjOLUkuS for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 11:39:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2EC40921
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::609])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA2EC40921
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 11:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYxUqxWltGlVdLoC8Z6mrXcHKFHVelUyeJJ8zLlJNREscuwqcBf2BOXkOH442e+fCGH2hDjJP29IBY/ogXV9XT78+kWNqzZU9HCWISCdN9xEE3RZBjG9z/1r9dOyerSA5juWF+SyCd6uE/UakCKPUtG5uLiRolu9yg8Cto6aPWOwXrL7QphsyXksjcC98qyw0r3x8VcCK19DZ00XMjHyEit+sMVrYo58FpFA8lasIRGsbN5Sga3Hm9HcA4pVjrHS6VjtSSZYRiQImsLs5c1xeSIyUsjpW33MWsXj87imlpVA0i9Igg9obpJF8jFwtwQYwy5+TYW583rOIx7C83RuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1JTPncsezGCgwtyCk1lJ8VqGyNiYV1m2UcsWav8Jzk=;
 b=iiW3co/IZyZBs6+OSM9HY3KsHRB/MXO3QNOp9uBda9eBdvQ7A6795c9zm81bKGC2pzS0A2QALyv2zalhxOg0RYCLf1O0YG2Qq0PWKfJUowczQgBizuT1csDBsoZIC6q69Tz1XhnDMsdaYOAJ8X5INjVRae3qi3dbjZV1SDoH8YA6DtuQdI1M4L0PVoKre/HbMrP73IZlRg8kMU7dDwLBhMS2nmDAJRJSC8aDK+JYQFllPM4wgmxNowQE2B6gNxI6sO3bRDcpVviuwp0/STC81wiblKPKiVixVoJcXhUqs1nyNwDXe947dTUyFLYDeKc0sUQp7FeQFNoC3QBVOhmmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by DU2P193MB2421.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 11:39:23 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::5736:e326:f7e4:7029]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::5736:e326:f7e4:7029%4]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 11:39:23 +0000
Message-ID: <0bd69538-a3fe-2162-03e0-42db7b49766e@othermo.de>
Date: Tue, 14 Feb 2023 12:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230214090424.9335-1-heiko.thiery@gmail.com>
In-Reply-To: <20230214090424.9335-1-heiko.thiery@gmail.com>
X-ClientProxiedBy: BE1P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::13) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|DU2P193MB2421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffedee9-875f-410a-bc99-08db0e801d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASazuPfqoviqVqzm97ZZGVkKhek+OjI4/vYCSyh2iVfLeSuzCgHTRmB2ffIrnDt/tiE4r3VzamZ9rfgHiihXyohk2gKElYUSZLms3/Zchh4GC+RhhWOBH1TWxha3OBBBZqSPboZzDIUP0g5wA+J/YY5a8Q4EiyBl142gOBAAhvLBgIUmcFfo46MFiPtn/zVJRrCxAkVwlh/cU93gPeZu4EqCBgYbnKsSdiv+zBt19ireS3yCnV0BV4Qp5FSqg61P2IZM7DobdMfxYcRneCC0+2u86LRykddlRCZFJ3ibdSXcaj5kQZncICJqUSM2uMR5950RiewcVSHi/Nmb0/RCSr1+CMZhA6bF/5KQZKYGP7q2A+CnoZXX3dSm8nyOgf08k1pAWAtHx7z3LMLqU4UK/jLARWoGkJTzDLRy9LpYBJ0uC0qBKmphjTNHmwCzLMqGSRiuuKpKjh6t9OlQC4QfRwOgzZ2vKW/LAF/ETMXQMBrmIpMhcpLXbyO0SQJUCYw9/mLPu11aIRsMx6E5s9x7aO5uYcoO5bWaryo4Ponr+cPQu/0qbzCZbCyqbxxxwGUQW/+Wz8Qm6auslLWat+uRMYOpbE/OuZuw3o1QLYDoWU9ScCAHzem2hHnHZ5eS5IOJRwuCk+PTlhpm4pOyyt01Zw/CY62r5WHjHMb1+K9+W7vrzKYq2UPQ1OxKaekNcd6do79PV8H2ufcvux5DPzhoXDCdowkqLOhtCnBgtX6awxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39830400003)(376002)(366004)(136003)(346002)(451199018)(31686004)(36756003)(41300700001)(8676002)(316002)(6916009)(66476007)(66946007)(66556008)(31696002)(38100700002)(86362001)(53546011)(6512007)(6666004)(6506007)(478600001)(2616005)(8936002)(44832011)(186003)(2906002)(966005)(5660300002)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZVcVJjTXp0cDNVSVFnNEV3bVNJTVBlUDBnaEJodk95MXZtRjUvUlo4bkd5?=
 =?utf-8?B?OWIxS3UzdUo2VDd0OUEwZXlzUW9rd1hHbjVGcTlVREdJaXhJZTIzaWNPdTJk?=
 =?utf-8?B?QW5qb2dHdittZFh2WVM2Vy9SWU9rQ0ZFVGp6bTVVcTZoRkEvZWNwdi9GOTkz?=
 =?utf-8?B?bzhzUGRoMTJHSHk1U2hZTUxkRG5LSWs5OGNHeUJTbmY3SEpvNS9CVmRxQ2dj?=
 =?utf-8?B?UGlZMGRMZkR1b0JlcVBCeGtCSVcwdEpwdkZDR0dGQVJKTWl6amtBZ2MrYVU3?=
 =?utf-8?B?Kzd2TGNqeHRzaXhaMVFUVGpNOGY1bTMvNnc4KzM2RWMrMDN5QXY2OWFOUC8y?=
 =?utf-8?B?QXBLa3JUVUV2NHhjdHFKaWRZUGxpSDVpb3lseGZnY1YwTDhDbE5KL0QxblFj?=
 =?utf-8?B?T3k0eGdEdnpUWnd4MnJMMnMwWmFWdW5BQTBkZ1RiRDVWeStmb1VySGtvQWdv?=
 =?utf-8?B?Ylh5VDcxODlJeVRJdXRUMmkxeXdnNHVBQzY4Q001SzZ0R05lM2xScUlZVnBY?=
 =?utf-8?B?TzcyS1lYUThQTXQrSlJWeDhBQm5yUmFtQmhVWWEzaUp1T2JzaE54V0hqTHRI?=
 =?utf-8?B?SXZUUnI2b0xhc2VWQ1lTbzZkaVVBY2JKakZ0aURaVDZjMEpRcENBYkdYQ1Zn?=
 =?utf-8?B?MndDTlFrK25zZXF2VjRqQUNRNE92QnV4cGowT2V6UXRieHZvYWR2aE5wUzV3?=
 =?utf-8?B?Z2NJRElENHI1c1NNeFZhU3VjY0lqcFNBTlVIUnpEenNpK3FQSERzejYraUo2?=
 =?utf-8?B?WXdrTGFtY0JGMEQ4ajlFVHpoVkZiSFYyWmpxc0JBeTAwZEJ0VkoyVHR0UDhu?=
 =?utf-8?B?bHBkS2ljSTRrRm5iOFNtL09sSFl0bnZHdDc0ejM4TklLdS9PVEdIN0tWS2dy?=
 =?utf-8?B?ZnF3RUM2Qy9Tc3F0NllGN0dDSDlMWnVTUlpkZnJzTTFkc2VwMm9kbDZnWjFu?=
 =?utf-8?B?TW54a04rWnJyRVFQcTR4VWFsb3hWbXA0dHFXaCtOU0ZLTU5sbWRYdkhjbHkx?=
 =?utf-8?B?RXd1VVI4dW9YY3FTSHh5UExtQmpHbnpTYjJmalArM2I2NHpWaDU2Nk9BYmo5?=
 =?utf-8?B?VENIL1EyQitENUs0RTFtekdmUWlNdUpNU2RhT0lkT1EwaHZNNndia2VTc1JF?=
 =?utf-8?B?OFNLU3JHZUlkS1NUc1JIS0V2UGZQbjhkT2N4bXhvdGtnNG8wVFljb05xQ08z?=
 =?utf-8?B?dWVsZ2VrV2J1b1hTdTRnZ1N4c0doWkI1bDFHUnc4WGZZMWYrWEVqY2E2ejYz?=
 =?utf-8?B?Q2hOenhlS0xnbzIyWVdXKzdRMU1qemhRRy9aYWZiaHBDVk9nbUZGa05CNFdZ?=
 =?utf-8?B?d09uRXVvSUF0TzhlVkpnSjkrMmhnMXIvbFU3WjlpeTJQWldkbHprbEUwdGEw?=
 =?utf-8?B?U0ZNOVo0c1BTMExzWFFwV2w2eExQRXQwZCtUN3J5M1E1Ni9aRVpaMEtVblFN?=
 =?utf-8?B?N3lZNWxoN3hBU1lJa0VuWU92Z2d2ek13akI4K0xxU3pVUU5FclBmWS85Mzdm?=
 =?utf-8?B?a3REczAwc0xtOFJhWkgzK08ybEpkNWQzUnlkd0V4eHcxU3hnQ2pvUU5OZ0k3?=
 =?utf-8?B?QkE3M0EzOFIyZXlqbjhUNmZpaEJ5ZzFVOC84WGY4RU0yVGE3UjhEOEdJRTZx?=
 =?utf-8?B?bXl1Rmw2SUd5RzRtV1NMdVJnQTBtT2x2eFlwSm9YSkIrSWljNUpwVnpZM3dE?=
 =?utf-8?B?b3F5akxHY00xMGFHb3dhTUJ4aEZxRlpwZW5MVlBraFo3TmI5cXRwbmxCd05V?=
 =?utf-8?B?dXNVY0hLV2dSYUUyQ2JEb1ZiNjYveFc4KzhlQU8yRmxFZ0hHclVIN3ZkWUFI?=
 =?utf-8?B?R09Wcmw3dlJNNGwxU0NQTG1zbTAwZGM1elBsSnhGWitGTnZsWkp0Wm5ueDR3?=
 =?utf-8?B?UnhhUXBNS3JaR3lzV1lraHVtSTJOZmp0QWl3MEFCUGV5WDFodHVRZ3FJZHlL?=
 =?utf-8?B?WkxISWpubVI0Y0pTaFBzdSs3TzUwdjBJNlZ1ekdmQ0VIZGtBQ0IzM3ZMOUkv?=
 =?utf-8?B?cWZKS2RJNU9uS0NDYmZmTGFhd3Z3TE13ekYxWVI0QTNRQlRaTjlCVU1rOEFY?=
 =?utf-8?B?SWU3c1pYQlNLa1daR0Z3dnZEcWRVSUlEYnI1Tmx5NXR5ZGhRZ2t1ZldmdThW?=
 =?utf-8?B?Y0NCUDlGOWN4ZXlKd2RwTlNCRnU5SGlHSlF6N3M5dmhGZi9wWmxYbW43akN1?=
 =?utf-8?B?K3lUQ2FlVnZFMzBZOTVHVTlZU0dRa1owRWp0VFU3NDBKbSs0S0tMUjA0Sit2?=
 =?utf-8?B?MXNjbGlRbnE2NDdTdFNvTCtxWGFBPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffedee9-875f-410a-bc99-08db0e801d5b
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 11:39:23.2792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzCi38W0HYjJuEeZv4tDVqoKEwKilI/o0gAko5LwRP9l7j12WlX4uLrkSmdv9SaYbbww4qb/ReI7omdvW1wzIB9Gw3J2i+16czHryYLll6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1JTPncsezGCgwtyCk1lJ8VqGyNiYV1m2UcsWav8Jzk=;
 b=HSyiELm/Qi1XHGF02D2jQvlpoHfe7newrdNozv+3tNUMcnwK6OuKGMEAI+QuYdE0LFfEVeuYzPEhZ4mrtcfb5SCVbiq3oms+7F7YW+GZQccWCOavl3pBhQJbYxWGTqwshgKbBANRkKWLwnobs38CuAuyDFsuyFlRMAVf15//Ovc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=HSyiELm/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.89
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC4wMi4yMyAxMDowNCwgSGVpa28gVGhpZXJ5IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KClRlc3RlZC1ieTogTWFyY3Vz
IEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4gICBwYWNrYWdl
L2Ruc21hc3EvZG5zbWFzcS5oYXNoIHwgNCArKy0tCj4gICBwYWNrYWdlL2Ruc21hc3EvZG5zbWFz
cS5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EuaGFzaCBi
L3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNxLmhhc2gKPiBpbmRleCBmZDAxNWQzOGFjLi4wMmZmYjI2
NTZiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNxLmhhc2gKPiArKysgYi9w
YWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gICAjIExvY2Fs
bHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCj4gLSMgaHR0cHM6Ly93
d3cudGhla2VsbGV5cy5vcmcudWsvZG5zbWFzcS9kbnNtYXNxLTIuODgudGFyLnh6LmFzYwo+IC1z
aGEyNTYgIDIzNTQ0ZGVkYTEwMzQwYzA1M2JlYTZmMTVhOTNmZWQ2ZWE3ZjVhYWE4NTMxNmJmYzY3
MWZmYTZkMjJmYmMxYjMgIGRuc21hc3EtMi44OC50YXIueHoKPiArIyBodHRwczovL3d3dy50aGVr
ZWxsZXlzLm9yZy51ay9kbnNtYXNxL2Ruc21hc3EtMi44OS50YXIueHouYXNjCj4gK3NoYTI1NiAg
MDJiZDIzMDM0NmNmMGI5ZDU5MDlmNWUxNTFkZjE2OGIyNzA3MTAzNzg1ZWI2MTZiNTY2ODU4NTVh
ZGViYjYwOSAgZG5zbWFzcS0yLjg5LnRhci54ego+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAg
IHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhh
NDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwo+ICAgc2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdi
MzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjViOTAzICBDT1BZSU5HLXYz
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNxLm1rIGIvcGFja2FnZS9kbnNt
YXNxL2Ruc21hc3EubWsKPiBpbmRleCAzOTQ1ZTQyNTZhLi41OGM1MzkwNDMzIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNxLm1rCj4gKysrIGIvcGFja2FnZS9kbnNtYXNxL2Ru
c21hc3EubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4KPiAtRE5TTUFTUV9WRVJTSU9OID0gMi44OAo+ICtETlNNQVNRX1ZFUlNJT04gPSAyLjg5
Cj4gICBETlNNQVNRX1NPVVJDRSA9IGRuc21hc3EtJChETlNNQVNRX1ZFUlNJT04pLnRhci54ego+
ICAgRE5TTUFTUV9TSVRFID0gaHR0cDovL3RoZWtlbGxleXMub3JnLnVrL2Ruc21hc3EKPiAgIERO
U01BU1FfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikgQ0M9IiQoVEFSR0VUX0NDKSIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCm90aGVybW8gR21iSCB8IFNpdHogZGVyIEdl
c2VsbHNjaGFmdDogQWx6ZW5hdSB8IEFtdHNnZXJpY2h0IEFzY2hhZmZlbmJ1cmc6IEhSQiAxNDc4
MyB8IFVTdC1JZE5yLjogREUzMTk5Nzc5NzggfCBHZXNjaMOkZnRzZsO8aHJ1bmc6IERyLiBEZW5u
aXMgTWV0ei4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
