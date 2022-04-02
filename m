Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BEEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 18:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7382860F44;
	Sat,  2 Apr 2022 18:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r06N2yX9sSsi; Sat,  2 Apr 2022 18:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466B760E26;
	Sat,  2 Apr 2022 18:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 065D81BF2B5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E387040256
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZDhv6jBgGRi for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 18:11:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::612])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88D1E401A2
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 18:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDJojOqnp9LR7w8kL7wPahVjhJ+KmllMI4v+rN2tiZkeK8gO6X3YSZ1BK2cL6i75obJpvz9sSIanOGtVHP500SALusIqHJ9HfUl2M6VtT74iSk0dlBGe62aafApBrGAqA9M8V54e/pL52aaKauDvrQUFbuHpmWlLULrgne85lRudiZIk18zgM5OLSHkH07Vc58L/UgVakb76DEnGf8KC1ejvlVjoG5E5uUDZv6VfeJKsUxawD9UQ9LX4MKRV/WDTWREDfTjR5pa6EneoFVffsLQTiZuFP4FlGDoGyjTW9I60niP/eKhQymueKiGxZiT17kHX8kKZDK0bf6a6tPQC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enDGOzA060JRybafmJkKCHhmUiSaWpMPz0+gmldPXU4=;
 b=QqaUuqKuLcQve3rCmbRMMyl0Mhr7epF03t+TxkhK8Kq+iTKhayqZWx7AzgA87F0vkaNYU0hU+Uai0zV16yFnmKUtMv5KkwIHW3RIaa90doreLT26j90qcj0l2UynTzG+LUzkSw3TsP/2s0EHVtrXA1drCHbU4eEFI8cH4A0XHMKQsn0+6fK21aqeg70kCPnzNQbkGdzkGSCvSbKOU82ppjy9hiuWfp8BrytX42q+nDCgZZtYhEkUf6WwYx9LQqyRk9F9Fs2pDPcjiRGRZ3RAKGBKWyh/3g536k2PRZ0K0sm9QDwUlnamrmkZUA9kX5BA94XE5PoZYpe0DjxosGW72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enDGOzA060JRybafmJkKCHhmUiSaWpMPz0+gmldPXU4=;
 b=Jszn8LP6KoHkXWCKnHaV9d2/yDlZTXhKhDW11BWSocLdQL7JNHTfYZVLK9a2e0Lf/5EIfM7pMDU+1PogYdHM9LeBhmVJAX0Z3UvfIMLzLtUn369ZEckx1kSMFnqFSyheIZ1ypyI2BnZeVhaorPvcZaf5aLL0EX1akRDkwveEvYE=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MW2PR02MB3787.namprd02.prod.outlook.com (2603:10b6:907:3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 18:11:02 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5123.028; Sat, 2 Apr 2022
 18:11:01 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Thread-Topic: buildroot xilinx zynq_xxx_defconfigs
Thread-Index: AdhFGBf8UYBkoZTiTP2Rkfs2kUZllgBhoPMAAAeZrHw=
Date: Sat, 2 Apr 2022 18:11:01 +0000
Message-ID: <53FB2DCD-5FFD-4E9D-8868-2470FEFA9E90@xilinx.com>
References: <SJ0PR02MB77585F3C5EE0342A6E82571DD7E19@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <1e1b5ec1-6fce-a8b8-d2e8-db5cd5f923fd@lucaceresoli.net>
In-Reply-To: <1e1b5ec1-6fce-a8b8-d2e8-db5cd5f923fd@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b38edc96-9f59-4f23-4d9a-08da14d4253f
x-ms-traffictypediagnostic: MW2PR02MB3787:EE_
x-microsoft-antispam-prvs: <MW2PR02MB37877253C97843BD3350E6EAD7E39@MW2PR02MB3787.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pAevsv14wxyZRcieCpZ2eqMAwOTd655yi59lM84X6Z75MAWIE8aCQjfvmXFrWur7/9RYjOkmz1JEbsxz/wZKmE1KLRFgxp1Z48CNQQ1SQIM4QBLRKIoG475FcNC/z/rb3kn8zggRoRyOn7B3C51JARcOcGNqZ+BRt+n58YYY5gaOcg6M/vndDqFOxMT9IzOZXVTP8bd3jeWWwkZHW3PBW+TXW2NfbA5lcOjZ3S0iOupFnpECxnEH9BumA054LMsHbBr95LPNDfCP6dbY95dJUp3YdsynDvV01pXu3N23pVz+g7M9dosIDnChDELZBTjPaRhxQ3lsM3Zyvantxji6NThnx9Y0CrPysXuKFUcvf7uxEg6U/D+REemZVZVvP9SmXqxaTnwimBvFPUT1vs6Uhvc2Ux2oK3UI2HAolpUyzmDP7cRwqpJA3YaS7Zv0Utl4xIRDrd3WUyqTqhMTWNLekZcBqBbiCCUUU+IT5M7639ozW4d+/NjoYaMH3CbJfoNCD6F6KGnKmE+v06gPNpQH3pNrTOPrTPxS2M07q+qXPFdw/bZKsg2ZHFoKB4Y7g7E5i7noAWp2ta0NSUfAZzfwrUH33GBQgTV8+GiJxJgMDn4ncYWsoXngmmI83QsB94muqS3Quh2Gfedt1sGDHTprJcVo9c+FNHFBa8qNIy5VqOkDUSgaZfRcUc9fEQY8yYoUxqDXS3dlCZZpPvX0Z0kJPRtDCT+kFTzbiaC3I0f/PpgL2+IDW++yagfGUaaOKzIwctclYJ+q2UBJ/mwOO7UgvvjhhItBY23/I9NUB1tTF+Slk9vxsKbx6XM12FM0kNcO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(316002)(6916009)(36756003)(166002)(5660300002)(66574015)(33656002)(8936002)(122000001)(2616005)(38100700002)(54906003)(38070700005)(64756008)(66446008)(66476007)(66556008)(66946007)(7116003)(71200400001)(8676002)(4326008)(2906002)(76116006)(86362001)(508600001)(83380400001)(6512007)(6506007)(53546011)(966005)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUNXcWw5cTJtNWMvUGtLSlNzeWMrRzFZeHBpQWluR0dqbjVqTWhySUxpaVla?=
 =?utf-8?B?cmptTXNWTi85cUQramprOFhqRlY0V0k5V2RxeEJTY1RQeHZZYytOYUk3Q0Ru?=
 =?utf-8?B?OUplalhVSDliVWxCU3ZNUllCWW51RXFvZlJiUU1mYUcwRGY2ZmVERzUyaWhk?=
 =?utf-8?B?clFta051YlRjT1REWlpwRDRHbW95UnpXOWk4ZHNvc2tZbE1GRzNTQzdra2Ja?=
 =?utf-8?B?S2gyRWJBc0xBTStPSjEyS0hHU3hOMXdSUXlOaThKa241amxQUTJzL1puOHdX?=
 =?utf-8?B?T0NYQmE2NWRaTjZMWGM4NUt5V3YxY0Y5emhlR2pvNU5aQmtuK0tydEFEbGpq?=
 =?utf-8?B?Mkw0WjFnRGR0SVJCaCttOXNKYklocWRHdXZPRndOelZBNFU1eTBBZ2x6aXJz?=
 =?utf-8?B?UURrVjBMV01VK0V3R0IxcFpydlNkcnVhMzR3UnVmZTlKWjVkaWNXVDdsSHhT?=
 =?utf-8?B?L0NOOGw1TVhWWHl1Y0NQOFFCYmRNY3F4YytrUStZMDJ6TXBqZWZtNVZUQ21L?=
 =?utf-8?B?eE1WcHhJZ1FHRXg5K294R0EvM09xbXN4cENFY3Rqb1d6TFZGMkhISWJtTHl6?=
 =?utf-8?B?czVPMXh2MEt6cVRBb25WSDdmb1JUMS9pblpHVTUvWXp3U0NYRHRaV0NGT0NY?=
 =?utf-8?B?dGR1QXBSMWJGdUlBTXUzREFwT3pqcm92T2ZYamtiRmI4Szh4b2RlUjVrUjBa?=
 =?utf-8?B?T1NyWVlSTmhlcHRIN3pkd0dYWFg3VGdNU3JKSXFINnNicDlDMlpyRGZaYmM4?=
 =?utf-8?B?eEQ3Yk1GRmU1ZlZtOUFYQjF0YlhYWVZwUjVHd3M0NkNwTkwwNnlCdEhpdE90?=
 =?utf-8?B?T0MyYUZMelFWTk5DWXMrN1VlTnBwRENlcnRJUE1CWFA0ckVCbmt2NnY5bXdD?=
 =?utf-8?B?VGxHamIzWVhKNUF5T3RVRkpONnZscjJWUGE5NlNENy8yYlhKMGZob2dTRStG?=
 =?utf-8?B?R3V3S0dnZy9HZkpJdmhmUmZHdFNDMklIQUdpMld3cjllUWZicWxOTGdUcTlt?=
 =?utf-8?B?Q2Fnc3dTcWFPYlIrSVVuOUFod2djTm9YWHBOQk12RXEvTjcvM2RONmtDVkQx?=
 =?utf-8?B?ZVIyejNaRWNUUlYyT0NQQW4wVC9hLy9HRzBGSTI0L3RUNldieGdBdllsczA3?=
 =?utf-8?B?ZnE2OWFLMi9wUFVkNS95bFo4V0RHQzB0VGprcTBaeGJWcEVwNEhNQkFSSVB3?=
 =?utf-8?B?VEVseVJuM2YyMFVFRlR2ZWplcEtyUFNpZXd6akpLV1hFbkludlFvZ1MvY3JF?=
 =?utf-8?B?WDIxWUdUeUR6TjJTb1JaMGI5K2l4V2J0SG02NUx4UkVwQVAxZTRyWmNQTVAw?=
 =?utf-8?B?U1hoUmMvSndLZUI3RnpXSlVzcEJTYVZ3OEZBMFBqczVwYVZ5NjM3RDQ4OG5z?=
 =?utf-8?B?TjRtbFRIWnF5NVU1QmlBSzI5d0VoSzlxalI5MUVmbUVDZDNOSWwwOW1uOERN?=
 =?utf-8?B?UkVMcnp0Y3AxZ2ZLVDdOWENHQnByY215d0NobDE0WDh0OW1FZVNPajE1V1VD?=
 =?utf-8?B?SnlqQW5mSGg5VGNxbW5tTFBFYk9iRU9hVUYzYWVsYlB1Vy9XbG1hYUJ5RnI0?=
 =?utf-8?B?Zkg5Z3FWMjVqd3BzL0JVZVNqcnhpL0RiZ0F3TGF5cWNTK3piQUN1OVBUWHlK?=
 =?utf-8?B?R1A4bko4TVJ5cFlLVGRIK282WU9FV1FxVEd6NWMxQVFBa2JxQjdKWW56OGdt?=
 =?utf-8?B?UGhJZjJ3VU4zZUMraUY2VzZqQUVReVl6VFBsQ01ha09WWVVuUWk1WkdEWVdY?=
 =?utf-8?B?S1NUTENsMkZaVnNJS1VTZzI0Q283MFZMY1ppdjd3ZjJ6Qk9MRktpbGpUTXg1?=
 =?utf-8?B?UTFySmNEdGlJZTBGWk10UXRVaDVVWFFHVXpUbzlraFFFemVhdGUzeVBUZVlj?=
 =?utf-8?B?eUliTTNRcitXV1N1SSswM05wbkt1Rmw2dC85OU1vc3RacEdRRDJ2eEJ5R3c5?=
 =?utf-8?B?TFpReFE0K2xPZDlLdEtOVHh2UkRNRnNKa3p1ZU1kbWgxbFBSQWVQRkx0aDRj?=
 =?utf-8?B?YThTWit0bGlQd0J4b015MHpZMkZyZVRDYWlZaFdIb3Z3ejh1cHhma3NwRm1U?=
 =?utf-8?B?MTdFbGpUU25JNjg2bHMyNHpOSHlyeGc0OUplb1pXNkwxUEtlMEtTakdQUGl4?=
 =?utf-8?B?bmc2R1o4SmNjZWNhTk1aU09DaGtOU3J4NVdpYWhLTE9BL0VseCs2OG9UWURB?=
 =?utf-8?B?dmVKYmU3b2Y2TGd2b05WSk5pbWdpQjAvTjVodlBKWmh2MUhjNGZaclp2ZjMw?=
 =?utf-8?B?OVdHQTZqM2kzZWNoUnNGZno0YUY4K2NiM1BTQUdLYkl4cTNVdXkxMm8rQUJJ?=
 =?utf-8?B?WGphQUw4Y1pIbW14Sjhoa0dseHN1WmxqVVZUMFFkUXR2UTZteVFoZz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38edc96-9f59-4f23-4d9a-08da14d4253f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 18:11:01.4062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BwYrqa5RNkTl+3/+WZqj2K6itA4BY4W+XlEtz0vEF7xmg9+5cPVmztma3tvaoLhEvkdKlvWnfX6pEQ0BZ9M5Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3787
Subject: Re: [Buildroot] buildroot xilinx zynq_xxx_defconfigs
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
Content-Type: multipart/mixed; boundary="===============6770220114763234752=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6770220114763234752==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_53FB2DCD5FFD4E9D88682470FEFA9E90xilinxcom_"

--_000_53FB2DCD5FFD4E9D88682470FEFA9E90xilinxcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTHVjYSwNCg0KDQpMZSAyIGF2ci4gMjAyMiDDoCAxNjozMywgTHVjYSBDZXJlc29saSA8bHVj
YUBsdWNhY2VyZXNvbGkubmV0PiBhIMOpY3JpdCA6DQoNCu+7v0NBVVRJT046IFRoaXMgbWVzc2Fn
ZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVzZSBwcm9w
ZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2lu
ZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KDQoNCkhpLA0KDQpJIHJlY29t
bWVuZCB0byB3cml0ZSB0aGlzIGtpbmQgb24gcXVlc3Rpb24gb24gdGhlIG1haWxpbmcgbGlzdC4g
WW91DQp3b3VsZCBwcm9iYWJseSBnZXQgZmFzdGVyIHJlcGxpZXMgdGhhbiBJIGNhbiBkbyBhbmQg
YWxzbyBvdGhlciBwZW9wbGUNCndvdWxkIGJlbmVmaXQuDQoNCk9uIDMxLzAzLzIyIDE4OjAzLCBO
ZWFsIEZyYWdlciB3cm90ZToNCkhpIEx1Y2EsIFBldGVyLA0KDQpOb3cgdGhhdCB0aGUgenlucW1w
IGRlZmNvbmZpZ3MgaGF2ZSBiZWVuIGJ1bXBlZCB0byBhIG5ld2VyIHZlcnNpb24gb2Ygb3VyIHNv
ZnR3YXJlLCBJIGFtIHRoaW5raW5nIHdlIHNob3VsZCBwcm9iYWJseSBidW1wIHRoZSB6eW5xIGRl
ZmNvbmZpZ3MgYXMgd2VsbC4NCg0KQXMgdGhlcmUgaXMgbm8gUE1VIGZpcm13YXJlLCBpdCBpcyBh
IG11Y2ggZWFzaWVyIGpvYi4gIEhvd2V2ZXIsIG9mIHRoZSA0IGJvYXJkcyBpbiBidWlsZHJvb3Qs
IEkgb25seSBoYXZlIGEgemM3MDYgZm9yIHRlc3RpbmcuDQoNClRoZSBwcm9ibGVtIGlzIEkgd2ls
bCBuZWVkIHRvIHRvdWNoIHRoZSBmaWxlcyBpbiB0aGUgYm9hcmQvenlucSBkaXJlY3RvcnksIHNv
IGlmIEkgYnVtcCB0aGUgemM3MDYsIEkgcmVhbGx5IG5lZWQgdG8gYnVtcCBhbGwgNCBib2FyZCBk
ZWZjb25maWdzIHRvIGF2b2lkIGJ1aWxkIGZhaWx1cmVzIG9uIHRoZSBvdGhlciBib2FyZHMuDQoN
CkRvIGVpdGhlciBvZiB5b3UgaGF2ZSB0aGUgenlucSBtaWNyb3plZCwgcW10ZWNoIG9yIHplZCBi
b2FyZHMgZm9yIHRlc3Rpbmc/ICBJZiBub3QsIGFyZSB5b3Ugb2sgd2l0aCB1cGRhdGluZyBhbGwg
NCBkZWZjb25maWdzIGFzc3VtaW5nIDMgb2YgdGhlbSB3aWxsIG9ubHkgYmUgYnVpbGQgdGVzdGVk
Pw0KDQpXaGF0IGFyZSB5b3VyIHRob3VnaHRzPw0KDQpUaGFua3MgZm9yIHRha2luZyBpbml0aWF0
aXZlIHRvIHVwZ3JhZGUgdGhlc2UgZGVmY29uZmlncyENCg0KSSB1c2VkIHRvIGhhdmUgYWNjZXNz
IHRvIGEgWmVkQm9hcmQsIGJ1dCB1bmZvcnR1bmF0ZWx5IEkgY2Fubm90IGFjY2Vzcw0KYW55IG9m
IHRob3NlIGJvYXJkcyBhbnltb3JlLiBIb3dldmVyIEkgd291bGQgZXhwZWN0IHRoZW0gdG8gYmUg
ZXh0cmVtZWx5DQpzaW1pbGFyIHdpdGggcmVzcGVjdCB0byBib290aW5nOiB0aGV5IGFyZSBbdmFy
aWFudHMgb2ZdIHRoZSBzYW1lIFNvQyBhbmQNCnRodXMgdGhleSBoYXZlIHRoZSBzYW1lIGJvb3Qg
ZmxvdywgYW5kIGRlZmluaXRlbHkgdGhleSBhbGwgYXJlIGNvbm5lY3RlZA0KdG8gYWxsb3cgU0Qg
Ym9vdC4NCg0KVGh1cyBJIHRoaW5rIGl0IGlzIGFic29sdXRlbHkgcmVhc29uYWJsZSBpZiB5b3Ug
dXBkYXRlIGFsbCBvZiB0aGVtLA0KY2hlY2tpbmcgYWxsIGRldGFpbHMgY2FyZWZ1bGx5LCBidWls
ZC10ZXN0IGFsbCBvZiB0aGVtIGFuZCBydW50aW1lLXRlc3QNCmF0IGxlYXN0IG9uZSBvbiByZWFs
IGhhcmR3YXJlLiBBdCBsZWFzdCBpdCdzIHdoYXQgSSBoYXZlIGJlZW4gZG9pbmcgaW4NCnRoZSBw
YXN0OiB5b3UgY2FuIGhhdmUgYSBsb29rIGF0ICdnaXQgbG9nIC0zIDAxNGU5NzAzMjQ2NScsIGFz
IHlvdSBjYW4NCnNlZSBJIGRpZCBSdW4tdGltZSB0ZXN0IG9uZSBhbmQgQnVpbGQtdGVzdCB0aGUg
b3RoZXJzLg0KDQpSZWdhcmRzLA0KLS0NCkx1Y2ENCg0KVGhhbmsgeW91IGZvciB5b3VyIHBvc2l0
aXZlIGZlZWRiYWNrLg0KDQpJIGhhdmUgc3VibWl0dGVkIGEgZmlyc3QgcGF0Y2ggd2hpY2ggd2ls
bCBtYWtlIHVwZGF0aW5nIHRoZSB6eW5xIGRlZmNvbmZpZ3MgZWFzaWVyLg0KDQpJIHNob3VsZCBo
YXZlIGNvcGllZCB5b3Ugb24gdGhpcywgYnV0IHNpbmNlIHlvdSBhcmUgbm90IHJlc3BvbnNpYmxl
IGZvciB0aGUgcW10ZWNoIGRlZmNvbmZpZywgdGhlIHRvb2wgZGlkIG5vdCBhdXRvbWF0aWNhbGx5
IGFkZCBpbiB5b3VyIGVtYWlsIGFkZHJlc3MuDQoNCkFueXdheSwgSSBoYXZlIGFuIGlzc3VlIHdp
dGggdGhlIHFtdGVjaCBib2FyZCBiZWNhdXNlIHRoZSBkZXZpY2UgdHJlZSBpcyBub3QgaW4gbWFp
bmxpbmUuICBBcyBJIGRvIG5vdCBoYXZlIGEgcW10ZWNoIGJvYXJkIHRvIHRlc3QsIEkgd291bGQg
cHJlZmVyIHRvIGF2b2lkIHRvdWNoaW5nIHRoZSBxbXRlY2ggZGV2aWNlIHRyZWUsIHNvIGl0IGNh
biB3b3JrIHdpdGggYSBuZXdlciB2ZXJzaW9uIG9mIHNvZnR3YXJlLg0KDQpUaGUgZm9sbG93aW5n
IHBhdGNoIGlzb2xhdGVzIHRoZSBxbXRlY2ggYm9hcmQsIHNvIHRoYXQgSSBjYW4gdXBkYXRlIHRo
ZSBvdGhlciAzIHp5bnEgZGVmY29uZmlncyB3aXRob3V0IHRvdWNoaW5nIHRoZSBxbXRlY2ggZGVm
Y29uZmlnLg0KDQpDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgYW5kIHByb3ZpZGUgeW91ciBmZWVkYmFj
az8NCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRj
aC8yMDIyMDMzMTE5MjAzMC4zODcxNzIwLTEtbmVhbC5mcmFnZXJAYW1kLmNvbS8NCg0KQmVzdCBy
ZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRA0K

--_000_53FB2DCD5FFD4E9D88682470FEFA9E90xilinxcom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGRpcj0iYXV0byI+DQpI
aSBMdWNhLDxicj4NCjxkaXYgZGlyPSJsdHIiPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0K
PGRpdiBkaXI9Imx0ciI+PGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+TGUgMiBhdnIuIDIw
MjIgw6AgMTY6MzMsIEx1Y2EgQ2VyZXNvbGkgJmx0O2x1Y2FAbHVjYWNlcmVzb2xpLm5ldCZndDsg
YSDDqWNyaXQmbmJzcDs6PGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIj4NCjxkaXYgZGlyPSJsdHIiPu+7vzxzcGFuPkNBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLjwvc3Bhbj48YnI+DQo8
c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPkhpLDwvc3Bhbj48YnI+
DQo8c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+SSByZWNvbW1lbmQgdG8gd3JpdGUgdGhpcyBraW5k
IG9uIHF1ZXN0aW9uIG9uIHRoZSBtYWlsaW5nIGxpc3QuIFlvdTwvc3Bhbj48YnI+DQo8c3Bhbj53
b3VsZCBwcm9iYWJseSBnZXQgZmFzdGVyIHJlcGxpZXMgdGhhbiBJIGNhbiBkbyBhbmQgYWxzbyBv
dGhlciBwZW9wbGU8L3NwYW4+PGJyPg0KPHNwYW4+d291bGQgYmVuZWZpdC48L3NwYW4+PGJyPg0K
PHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPk9uIDMxLzAzLzIyIDE4OjAzLCBOZWFsIEZyYWdlciB3
cm90ZTo8L3NwYW4+PGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+SGkgTHVjYSwg
UGV0ZXIsPC9zcGFuPjxicj4NCjwvYmxvY2txdW90ZT4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
PjxzcGFuPjwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij48c3Bhbj5Ob3cgdGhhdCB0aGUgenlucW1wIGRlZmNvbmZpZ3MgaGF2ZSBiZWVuIGJ1bXBlZCB0
byBhIG5ld2VyIHZlcnNpb24gb2Ygb3VyIHNvZnR3YXJlLCBJIGFtIHRoaW5raW5nIHdlIHNob3Vs
ZCBwcm9iYWJseSBidW1wIHRoZSB6eW5xIGRlZmNvbmZpZ3MgYXMgd2VsbC48L3NwYW4+PGJyPg0K
PC9ibG9ja3F1b3RlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+PC9zcGFuPjxicj4N
CjwvYmxvY2txdW90ZT4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPkFzIHRoZXJlIGlz
IG5vIFBNVSBmaXJtd2FyZSwgaXQgaXMgYSBtdWNoIGVhc2llciBqb2IuICZuYnNwO0hvd2V2ZXIs
IG9mIHRoZSA0IGJvYXJkcyBpbiBidWlsZHJvb3QsIEkgb25seSBoYXZlIGEgemM3MDYgZm9yIHRl
c3RpbmcuPC9zcGFuPjxicj4NCjwvYmxvY2txdW90ZT4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
PjxzcGFuPjwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij48c3Bhbj5UaGUgcHJvYmxlbSBpcyBJIHdpbGwgbmVlZCB0byB0b3VjaCB0aGUgZmlsZXMgaW4g
dGhlIGJvYXJkL3p5bnEgZGlyZWN0b3J5LCBzbyBpZiBJIGJ1bXAgdGhlIHpjNzA2LCBJIHJlYWxs
eSBuZWVkIHRvIGJ1bXAgYWxsIDQgYm9hcmQgZGVmY29uZmlncyB0byBhdm9pZCBidWlsZCBmYWls
dXJlcyBvbiB0aGUgb3RoZXIgYm9hcmRzLjwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3RlPg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+RG8gZWl0aGVyIG9mIHlvdSBoYXZlIHRoZSB6eW5x
IG1pY3JvemVkLCBxbXRlY2ggb3IgemVkIGJvYXJkcyBmb3IgdGVzdGluZz8gJm5ic3A7SWYgbm90
LCBhcmUgeW91IG9rIHdpdGggdXBkYXRpbmcgYWxsIDQgZGVmY29uZmlncyBhc3N1bWluZyAzIG9m
IHRoZW0gd2lsbCBvbmx5IGJlIGJ1aWxkIHRlc3RlZD88L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3Rl
Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+PC9zcGFuPjxicj4NCjwvYmxvY2txdW90
ZT4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFuPldoYXQgYXJlIHlvdXIgdGhvdWdodHM/
PC9zcGFuPjxicj4NCjwvYmxvY2txdW90ZT4NCjxzcGFuPjwvc3Bhbj48YnI+DQo8c3Bhbj5UaGFu
a3MgZm9yIHRha2luZyBpbml0aWF0aXZlIHRvIHVwZ3JhZGUgdGhlc2UgZGVmY29uZmlncyE8L3Nw
YW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPkkgdXNlZCB0byBoYXZlIGFjY2VzcyB0
byBhIFplZEJvYXJkLCBidXQgdW5mb3J0dW5hdGVseSBJIGNhbm5vdCBhY2Nlc3M8L3NwYW4+PGJy
Pg0KPHNwYW4+YW55IG9mIHRob3NlIGJvYXJkcyBhbnltb3JlLiBIb3dldmVyIEkgd291bGQgZXhw
ZWN0IHRoZW0gdG8gYmUgZXh0cmVtZWx5PC9zcGFuPjxicj4NCjxzcGFuPnNpbWlsYXIgd2l0aCBy
ZXNwZWN0IHRvIGJvb3Rpbmc6IHRoZXkgYXJlIFt2YXJpYW50cyBvZl0gdGhlIHNhbWUgU29DIGFu
ZDwvc3Bhbj48YnI+DQo8c3Bhbj50aHVzIHRoZXkgaGF2ZSB0aGUgc2FtZSBib290IGZsb3csIGFu
ZCBkZWZpbml0ZWx5IHRoZXkgYWxsIGFyZSBjb25uZWN0ZWQ8L3NwYW4+PGJyPg0KPHNwYW4+dG8g
YWxsb3cgU0QgYm9vdC48L3NwYW4+PGJyPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPlRodXMg
SSB0aGluayBpdCBpcyBhYnNvbHV0ZWx5IHJlYXNvbmFibGUgaWYgeW91IHVwZGF0ZSBhbGwgb2Yg
dGhlbSw8L3NwYW4+PGJyPg0KPHNwYW4+Y2hlY2tpbmcgYWxsIGRldGFpbHMgY2FyZWZ1bGx5LCBi
dWlsZC10ZXN0IGFsbCBvZiB0aGVtIGFuZCBydW50aW1lLXRlc3Q8L3NwYW4+PGJyPg0KPHNwYW4+
YXQgbGVhc3Qgb25lIG9uIHJlYWwgaGFyZHdhcmUuIEF0IGxlYXN0IGl0J3Mgd2hhdCBJIGhhdmUg
YmVlbiBkb2luZyBpbjwvc3Bhbj48YnI+DQo8c3Bhbj50aGUgcGFzdDogeW91IGNhbiBoYXZlIGEg
bG9vayBhdCAnZ2l0IGxvZyAtMyAwMTRlOTcwMzI0NjUnLCBhcyB5b3UgY2FuPC9zcGFuPjxicj4N
CjxzcGFuPnNlZSBJIGRpZCBSdW4tdGltZSB0ZXN0IG9uZSBhbmQgQnVpbGQtdGVzdCB0aGUgb3Ro
ZXJzLjwvc3Bhbj48YnI+DQo8c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+UmVnYXJkcyw8L3NwYW4+
PGJyPg0KPHNwYW4+LS08L3NwYW4+PGJyPg0KPHNwYW4+THVjYTwvc3Bhbj48YnI+DQo8L2Rpdj4N
CjwvYmxvY2txdW90ZT4NCjxicj4NCjxkaXY+VGhhbmsgeW91IGZvciB5b3VyIHBvc2l0aXZlIGZl
ZWRiYWNrLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SSBoYXZlIHN1Ym1pdHRlZCBh
IGZpcnN0IHBhdGNoIHdoaWNoIHdpbGwgbWFrZSB1cGRhdGluZyB0aGUgenlucSBkZWZjb25maWdz
IGVhc2llci48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pkkgc2hvdWxkIGhhdmUgY29w
aWVkIHlvdSBvbiB0aGlzLCBidXQgc2luY2UgeW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIHRo
ZSBxbXRlY2ggZGVmY29uZmlnLCB0aGUgdG9vbCBkaWQgbm90IGF1dG9tYXRpY2FsbHkgYWRkIGlu
IHlvdXIgZW1haWwgYWRkcmVzcy48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkFueXdh
eSwgSSBoYXZlIGFuIGlzc3VlIHdpdGggdGhlIHFtdGVjaCBib2FyZCBiZWNhdXNlIHRoZSBkZXZp
Y2UgdHJlZSBpcyBub3QgaW4gbWFpbmxpbmUuICZuYnNwO0FzIEkgZG8gbm90IGhhdmUgYSBxbXRl
Y2ggYm9hcmQgdG8gdGVzdCwgSSB3b3VsZCBwcmVmZXIgdG8gYXZvaWQgdG91Y2hpbmcgdGhlIHFt
dGVjaCBkZXZpY2UgdHJlZSwgc28gaXQgY2FuIHdvcmsgd2l0aCBhIG5ld2VyIHZlcnNpb24gb2Yg
c29mdHdhcmUuPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5UaGUgZm9sbG93aW5nIHBh
dGNoIGlzb2xhdGVzIHRoZSBxbXRlY2ggYm9hcmQsIHNvIHRoYXQgSSBjYW4gdXBkYXRlIHRoZSBv
dGhlciAzIHp5bnEgZGVmY29uZmlncyB3aXRob3V0IHRvdWNoaW5nIHRoZSBxbXRlY2ggZGVmY29u
ZmlnLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Q291bGQgeW91IGhhdmUgYSBsb29r
IGFuZCBwcm92aWRlIHlvdXIgZmVlZGJhY2s/PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRp
dj48YSBocmVmPSJodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjIwMzMxMTkyMDMwLjM4NzE3MjAtMS1uZWFsLmZyYWdlckBhbWQuY29tLyI+aHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDMz
MTE5MjAzMC4zODcxNzIwLTEtbmVhbC5mcmFnZXJAYW1kLmNvbS88L2E+PC9kaXY+DQo8ZGl2Pjxi
cj4NCjwvZGl2Pg0KPGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+DQo8ZGl2Pk5lYWwgRnJhZ2VyPC9k
aXY+DQo8ZGl2PkFNRDwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_53FB2DCD5FFD4E9D88682470FEFA9E90xilinxcom_--

--===============6770220114763234752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6770220114763234752==--
