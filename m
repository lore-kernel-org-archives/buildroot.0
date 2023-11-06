Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D9AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A985461233;
	Mon,  6 Nov 2023 19:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A985461233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhLrphwh5W4z; Mon,  6 Nov 2023 19:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9529611ED;
	Mon,  6 Nov 2023 19:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9529611ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F59D1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA377611ED
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA377611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQB1z8RZ1IMr for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:12:30 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B270261187
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B270261187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE4nFbrRKOXuAAg/GxtDVIoqlvQfNmJsswQKIoypmZOlkiUAhAZEJh/pa5T2j8MDUSGRqT82+atS6QOarnxDiGUoFgYkl6luo5iEiIgq4Rc0DCz3xY9EAkQ+3JVXOlNxwvTTC1vjgEYINCsIYTN+9po2/2wifb8RNbMN+a6JbTIMgPppCd8AW9QIQZZkNcuKuq8U23CzCxTgb7Oj1VS3zegZc7QF9tRztatQL0l991z6w9Ui+nxUWEtIx/eiUF1ldriLkTqr6jWChiNlygUMVvluk2L8DHp5jFBb3RvY0efOqLKSbg2A/1HQZsCzUsfBZ81xck5pz9cxtDLF7qhePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKLcYEm4pfdEQ+uFqf4X92JUxikSu+TKXq95Y7rFX/M=;
 b=cfllFldhgSpp5oHMJt7dRIN4aITk2+TipdoNdxc6SZatlf7l5gti2BX/kC1Kin+sqdf8VhUtlzquJM/M5RSHFpzVp5+4Jtl8f0qAg84wS5WLc2XBwZ2yQ/dDVLv4+fv1/8OaZNzBcXAeVqKPO0jZK2V5bG3lQhG5nI8kJx3DBP+LyawMxAt6Vy+jygtlJ7umRY+CaHkrs8igV3TY3FmxLlKDH9itXvw91CZ3vlgTT48LMBg+//BZS9RcLZvDsBDAakhON7caigUJKdwfF/6RB7dN2nn+zwr1261KKhwNeqkVGokJeG5WG+qU2dyPIRjUX4c7z451PGDwbVjCOM4i6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AS8P193MB2352.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:447::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 19:12:24 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7%7]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 19:12:24 +0000
Message-ID: <a9454b05-faf1-4b77-9247-79f028735fe1@othermo.de>
Date: Mon, 6 Nov 2023 20:12:21 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AS8P193MB2352:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fbc879-551d-4e5d-be09-08dbdefc4ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8DfjhqQX62J8ghDI79Qmdc0HICBCpOQJ2ZTU/mVEbUw3U1ygLd5N0e7RiOAsThRviJL33gCaiYMEipSQbr9VFGjjzPT3/Bhk/QD5wAcpmEkdEmlsJJA/0IHVKfrwrmn2OuEUvL7gztwJlWjhJmu4tHtC11QyQz2hKBmNXfYa4SlTkilARYL4Z7ydoEAc2p4zIMPeHrPuZP9Vd1qVFvNhRWLj9PMNOE2hcXkdUIeyV/uejAoWkujCcnzKexkQAmc8yxNGkKQQSdeGygcUgkfyqZPU3/ldyh1R2V24nVxO8sTNIz4xscezlvCYJ6AcSgp+bCxImBalQ+2+oMvUGO4tOZ9R+cc/ldNar/AIPcrLzy7vZR5KXhkaSOLG3S1RD9MWTt/cbFQGYZapGRG2CJxWJt6+e7M0R5OQCx7KIq4JajdMbdOs/Qe6B2xQ0sKrVyzH0BYa0hIm8kQp6OMvye+PUNmAt2KPPcI7tgheX20mK3GZdUpWetNGSg4P91iYcQSVZIb/XQSBxyg99R5OlfDCa/OxQdi4Ni/OkxA+LrWPgXGnlqwMqg+g0iubYUq+iS2frQf97IOmUNFTFXr0fYfbJOxyQ9GGQQBHJaV2e7ce9vIlo7V/sjWGOA91ZZMCVZeiSMPR+Rz86n43GSovym+068N2gLpyk6LiY6wHIx6Y2R8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39830400003)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(316002)(38100700002)(6506007)(6666004)(53546011)(6486002)(478600001)(966005)(66574015)(66556008)(54906003)(2616005)(6512007)(66946007)(66476007)(2906002)(41300700001)(31696002)(8676002)(5660300002)(36756003)(4326008)(86362001)(8936002)(44832011)(31686004)(43740500002)(45980500001)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1iVFBYWUZvbkJRdDBDcXZ4N3lkNnl4ckRzY24waDJVZldBcVQxNkVjbGVx?=
 =?utf-8?B?STFLeHUvYTUzU1BDbXBDeExjTkU5UFpVSEZwNzFIQml3aDI5M1V4dWx0VDky?=
 =?utf-8?B?RWg5NUJQdUtTeVlUUG83WU5uaExJQmo3cXNENDFCc0w0UWFrM3plckx5WUQ1?=
 =?utf-8?B?Vlo1RVlwd2xPbFhlTFpHRUNPbFd1YS9rR2hMRGNrNUlQMkNwZzMyYXRnZDZo?=
 =?utf-8?B?dVQvNzI0bDJwaWcwdktNK09EeFN5eW1JcThDY0t1eUlBM25KUXpIMVdxNjJw?=
 =?utf-8?B?Y1dDdXRyS0FoL3FCbzMwenR1QUpMQ2tncysvZEJEa3NzUE14bzEwOW5Ed2Rr?=
 =?utf-8?B?UHJDYW8wSDd2QlVvV0o5aDNtT21xUVRiRE5OTENRRW4xNlpROTZuTEladmVy?=
 =?utf-8?B?blJuWVMva1BlV0h4bllYbkUwK3d1Y0lwZVZoa0E2WUUxcHhNWmE3VG1kTVAv?=
 =?utf-8?B?ZUlQM29ZbkFXR0t0NzhJNEZXRnYvcVVucWxpU0V2Kzl5OE4xQXV5QzUzMFpt?=
 =?utf-8?B?WlcxOUh2MEIxWWlJVUtQVTYrRGlPZFVNa0NldVN2amR3SWpsamtrQjRTWGxD?=
 =?utf-8?B?eEFQVGlabi9uL3VXTmNGTG0yRm05SnlLWCtiaTc0V3JacUNsUVpPeXp0Z3kv?=
 =?utf-8?B?MDdSNE1PVDFSaUtpNXAwUDVWOU5HMnI0MVdHOEdnUk81blk1WFFBTDhZcStw?=
 =?utf-8?B?RDRxOU4yS3hHQThnS0RlbURqZjV4c3hKQUp6TEFPSFp4VmxBMTBqUjN0V0JQ?=
 =?utf-8?B?THI3eDdHc1l0cEd5aXQ4TW1rZE95cHFQTno4SUtQMVpWb2lDQWtUN2luZ1Zj?=
 =?utf-8?B?YnN5RjQ3NFJGc2c1NzY2dVo5aWVJVlhkaHlmejk2cEVlTGtBWmwzckxIa1Bo?=
 =?utf-8?B?dUF0UWJ4VW54RFRQbkNyY1NIeS9UVWtOck82N1krMlZqeWJjYldVaDRHUjVW?=
 =?utf-8?B?djZ0YWlsdElPTDQyeSthVkliT3B1V2ZnOVNuNjlCRkNiR0pYZ3RvQzJqVEZs?=
 =?utf-8?B?Sk94WGw5WThOLzV4eTAyMlZSN2w1K1RrODIzekxtM1BJNHdhS09WSkE3V1oz?=
 =?utf-8?B?Z3ljQ1cyR05pZkxTYjFBcExDVE1ocyt3TEU0WnV3RDZ2ditIZURocGo1MHIr?=
 =?utf-8?B?VXpCOVBCU1hkZ1NYM1NyRjl4RjRLS3ZNOWVYckNaZmhSc1Q5cElBV3l5Z3N4?=
 =?utf-8?B?SDJsOHNwRUUyWUkwVFpvS0RObEYwdnJXK04yV05HbmlHdy9WVjdockR5dkZC?=
 =?utf-8?B?WmRpczFQR3QyclBBOHp2OUc0Ky9JekVHSDB6RmlRMExrdm5HU2dYTVVQa1dY?=
 =?utf-8?B?cUY5RitwYy9Rb24wRXI1UWZzNjhHYk1McTc4ZG1HNVhsSTBteHllcEh4VUNH?=
 =?utf-8?B?RGJVTk01Z1pZckFRU3RnZGpDdGZ0THA0bnlway9oSkIwaFBsdXAraWhDaHRo?=
 =?utf-8?B?VFNjY1hPRjVyRE9OVzdNSVRQOEM1R0dnVFNmdk1aVjlVeFB0dTAvTWhEUTk3?=
 =?utf-8?B?SW9WSTFKVUpDOEU4Zlh4ZTdUeHBWSGxlNEJqL2JERitMdlkwSHh5aVRtdHp2?=
 =?utf-8?B?dVFhdllxbWY4c0lNVGladTVadFRJaXhKSk4yRmFKTFZDYnF5MWExYndyRlRG?=
 =?utf-8?B?SWlaVU9ZYmxtNEtKK05yMW10OHR0bmhrbi9lbE8vUnIvTzVUMWVmeXJ1b0VM?=
 =?utf-8?B?ZGIyUE5IdXN2bGM1Q3ozWE0zVCtrK1NwY0ZheFN5YlcvMFRGQXhVN0RvUXRI?=
 =?utf-8?B?Z2tJUy9PUmE2Q0xVUmdEeTNYbGE2M3d1ZDFFT1pLRG5BOFFjVm9wNFVUQlBC?=
 =?utf-8?B?Rk52a2tpRHZiRHFhZCtBUFk1Z0dWVy9UbGVWb0pDdlduUmtQRjFhOUdONExZ?=
 =?utf-8?B?L0drdnFBcWtNaUZWVTVMalpKQnMzK3ljdG14TTZueDRkNSttYW1aTittcTNp?=
 =?utf-8?B?eExlQ1FSelJZSklJdkwyUDU3aERhcW40NzJBaExKVnZ1TEx0V25GSEpzbG40?=
 =?utf-8?B?dlhxQ2RlZUJqQ2QvOHpFdjhmTE5rK1RKazBKU3N5WnlzVmE2WEI4WjdaNGEv?=
 =?utf-8?B?VU5QTmoxOHpCVlN4QVFTTVo4YjJBQTFIY3lLdWFxMDNBSytNc2FKa1RTK0gw?=
 =?utf-8?B?Vk1qZlNuajRWSi9Wd1JRWHNIOVlxNmdDSCtBV1kxWm90S1ZnWkpveEh4eGk3?=
 =?utf-8?B?TmxEaGJBZ2hXYytublBpZUxveU5vaVZuOGNMMU9BeDhJQlNtV01aR3U1VVhG?=
 =?utf-8?B?WkR0M0tad1dodzd1TGw0anRlNVpnPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fbc879-551d-4e5d-be09-08dbdefc4ebb
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 19:12:23.8774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLxt218en6G6a1iLlbPrftDgdCHU7EGN9aFEmLrzUGh+an6QuIDLPqdaQwKc2kpt/BF8Eo7jSfzQ4lz3DFa+heHUBvIjH8h4HimtWgNdIvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2352
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKLcYEm4pfdEQ+uFqf4X92JUxikSu+TKXq95Y7rFX/M=;
 b=eNyL0vbZNsHMvZng6vW+jnJPZcfFoUQKYDWuArdOwjHmT4itACqk/kapKJWIQhUoqOPn1SbWPoZkfmwX1uQc9txMMcGi8GQX42WoWRVvBGpUy+o1FZQQ4ugNT7svaFMjBXz5cNc0u+Pq2tSXQgGwMhCRrj/cH9KsFqUdzxXB5G8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=eNyL0vbZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix additional modules
 installation
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
Cc: Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIEd1aWxpbywgdGhpcyBmaXhlcyBvdXIgYnVpbGQgcHJvYmxlbSEKCk9uIDMxLjEwLjIz
IDEwOjAxLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBBdCB0aGUgbW9tZW50IHRoZSBucG1fY29u
ZmlnX25vZGVkaXIgaXMgc2V0IHRvIHRoZSBidWlsZCBkaXJlY3RvcnkgYnV0Cj4gbnBtIG5vZGVk
aXIgbXVzdCBiZSB0aGUgb25lIG9uIHRhcmdldCB0byBmaW5kIHRoZSBleHBlY3RlZCBmaWxlcy4g
U28gbGV0J3MKPiBzZXQgbnBtX2NvbmZpZ19ub2RlZGlyIHRvICQoVEFSR0VUX0RJUikvdXNyLgo+
Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTgy
Ngo+Cj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+CgpUZXN0ZWQtYnk6IE1hcmN1cyBIb2ZmbWFubiA8bWFyY3VzLmhv
ZmZtYW5uQG90aGVybW8uZGU+Cgo+IC0tLQo+ICAgcGFja2FnZS9ub2RlanMvbm9kZWpzLm1rIHwg
MiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLm1rIGIvcGFja2FnZS9ub2RlanMv
bm9kZWpzLm1rCj4gaW5kZXggMmE4YzU3MDkzMi4uOGY4NjQxMzA0OSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL25vZGVqcy9ub2RlanMubWsKPiArKysgYi9wYWNrYWdlL25vZGVqcy9ub2RlanMubWsK
PiBAQCAtMjAsNyArMjAsNyBAQCBOT0RFSlNfQklOX0VOViA9ICQoVEFSR0VUX0NPTkZJR1VSRV9P
UFRTKSBcCj4gICAgICAgbnBtX2NvbmZpZ19hcmNoPSQoTk9ERUpTX0NQVSkgXAo+ICAgICAgIG5w
bV9jb25maWdfdGFyZ2V0X2FyY2g9JChOT0RFSlNfQ1BVKSBcCj4gICAgICAgbnBtX2NvbmZpZ19i
dWlsZF9mcm9tX3NvdXJjZT10cnVlIFwKPiAtICAgICBucG1fY29uZmlnX25vZGVkaXI9JChCVUlM
RF9ESVIpL25vZGVqcy0kKE5PREVKU19WRVJTSU9OKSBcCj4gKyAgICAgbnBtX2NvbmZpZ19ub2Rl
ZGlyPSQoVEFSR0VUX0RJUikvdXNyIFwKPiAgICAgICBucG1fY29uZmlnX3ByZWZpeD0kKFRBUkdF
VF9ESVIpL3VzciBcCj4gICAgICAgbnBtX2NvbmZpZ19jYWNoZT0kKEJVSUxEX0RJUikvLm5wbS1j
YWNoZQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpvdGhlcm1vIEdtYkggfCBT
aXR6IGRlciBHZXNlbGxzY2hhZnQ6IEFsemVuYXUgfCBBbXRzZ2VyaWNodCBBc2NoYWZmZW5idXJn
OiBIUkIgMTQ3ODMgfCBVU3QtSWROci46IERFMzE5OTc3OTc4IHwgR2VzY2jDpGZ0c2bDvGhydW5n
OiBEci4gRGVubmlzIE1ldHouCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
