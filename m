Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BB3C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 10:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BAE6058D;
	Thu, 14 Dec 2023 10:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48BAE6058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZT8dJUa47SU; Thu, 14 Dec 2023 10:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78CAF6F4E3;
	Thu, 14 Dec 2023 10:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78CAF6F4E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9453C1BF4E3
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 10:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D6036F4EF
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 10:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D6036F4EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dm8iWvndDn-B for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 10:55:14 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2606::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86A9A6058D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 10:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A9A6058D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0CBFUW4+qBshuTYjFFLzsQ5h2CpND5eofkRuY4c7kmgkG44cEAuLLexVN900Pi7H5B70qiXTuSaxHG30nck9zbRdnRIQyLye3b+VMcxvqX3A8pcchCqr57pyNE5GyQTnKO3PU9Zs/RYap41iOnMRUvCFDsxgcyjv28yK5mcEDe08WJouXx+A2c2g/tAPs9NQM+v8Jd58uEoiT65rr524QhrjgZpbZE8LWam/sn3q4sNTNMTQ7EOfBgLKMvXWLqHlqL1o6VMapJk45c4FjYDB7PLrZxvFh9OuaHHaCFLL/pTq7D/N7dBQWF/ymK9KNaXk0KE7/WxgVmOczR1fzLXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sf5m8725JJVRQ8yVphOaw50k0D7q1HWci+nYAAwo+I=;
 b=P46odCulatwvJp6llVEA8yV54je0o/84/bji3+7SXm1Tml0QYPRfUDxzEnXRrvtXp3M+FeR8wv1jJapV9MGx8m8XxltdKczZoBBXQBotbMtMr+kSwCVgg32uvW7zw5JUSdgHqGM1qydRTRaTp2tfC921I1c0wqtgwmJMlQtcIZdVGpBnyATyEGFgFtCiwMG4013i8gsC1unJUbHl7rF/g9VOBj264JOPI2D4lC6Otwehz8ltiyIa+tIPEMOczlkjMJEVmqFw1WwQkwjS9y8aNl7n9dtK1NycGxZ7CvdZVQWF8sMzNQd8phOTxG7YdXjpJtP/vw1vYDlSIUprfq6y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by VI1P193MB0511.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:15b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:55:07 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:55:07 +0000
Message-ID: <a93feebc-1591-4edc-8dfe-aa36d5c630cd@othermo.de>
Date: Thu, 14 Dec 2023 11:55:04 +0100
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231214094846.115655-1-james.hilliard1@gmail.com>
 <20231214094846.115655-3-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20231214094846.115655-3-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|VI1P193MB0511:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e0ca29-eea9-42d1-2ca0-08dbfc93225f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4V8DqwkMZV7/rCnK6H0M5Y8nQs3Ao2LWBDlYqjEbQWsk4GB8xPwGrTQcK3ei2wqePS8WVlCvOxTe2WpAxAY2UbUJzOJwjE7nuFLc0c2GYIITVIMY/0+ZCBrEkmadGphsg2HAEkuvEKzghJgLAjUb7/HTF+lEEH+waET+KIt4uDguMGtfywRv2ephU244+nD7pEdIPR66bqbrmh1V7toxaJBy/qu06x4IJ9WL3pLUKbRvmVpIhWRuNfsW/RTBr0H9s66SE/qtdXRR7udTEDDMEt7QopFvX2M/WiFJ3WK0dqf3f+p9wIEZk4cKmUNPwyYeMOnlhIIWZhcDhyqGnisD2NjI+pd/EhAQoF/kKNidnDqA3fZCTNwUHW9CexZc53TDlLekicY+ZUry1QPTDo3lX1uAbisNN2xIfJ6T1vNgfuFCfBsa44oat65lUnlxK6Kdw9KSm0ol5wiy2p/33NqC6OB7Mz82rAIu55XdxjhyGofieFnttzG51eOHjZso2hauz6GxRo6PxuRWPFDEo/qiLhiCZKHiEQXBXhy+OLOupL/Hd3GgK81FbhQ9IFBS543c1dE0WAq3kH1wUr7mNdGk+XaE+w5DOPEmaYjl5lR0D0kXm52d30WxBwGOgTIw1FBDRHRrsD6Bjnq7jvMz4E8AxmpVvH4cvnZBSQ5eee37ro/Sn49P5DeyC7bAKq6N8Fm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39830400003)(346002)(396003)(366004)(136003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(64100799003)(451199024)(186009)(31696002)(86362001)(36756003)(31686004)(41300700001)(66556008)(6666004)(478600001)(6506007)(53546011)(66946007)(66476007)(54906003)(26005)(6512007)(38100700002)(83380400001)(2616005)(5660300002)(2906002)(316002)(966005)(6486002)(44832011)(4326008)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdLNm8zWGpIZ0RhZlI2R1FmV1lqWEJCSURVb0k4cVFpeUxVZzV4MnNJYWd2?=
 =?utf-8?B?c2ZKOWlPRTFLbGhwekFTNWltRzk5OGZISUJIOUR2MFk2WE9YRENOQSttcUJZ?=
 =?utf-8?B?dFdoc3VyMmdvMmlWbE9ZZjFMaXo3Y3Zzdi9ScXpPQk1uNklHcFRXT1F2OU9M?=
 =?utf-8?B?STYzbko0Zkk1VVd1YmN4MVRBR3NVRmgwazFsY0hKZWw3aENuZGFnUENnNlY0?=
 =?utf-8?B?MVJ4OXhndFo2T0RlTzF1SGh4RC9hdmpZaWZzNUFhbkk1YWdKQ1FzakRWV0ZI?=
 =?utf-8?B?dDNHUU5yS2RLT2xuU21sQVZSeWo1QjB1NjJIMjdjejgzNVg2VkE3QWVRemlX?=
 =?utf-8?B?Wk5DaXU0Z0ptLzNMNU8yMmQxWVBXdVlKWXFXMU5hQUloZTlrQVYwb1hNaWsv?=
 =?utf-8?B?dWwrUU1UUnhIRHRvTG1PN2FJWFJaVTlJM0VJeU14VzZ2ZXU5VzBnOTMrd3ZZ?=
 =?utf-8?B?S3hVbUwvbUpkUDV6QngwVHVYUnRNekFoeWNLNkhBeXZNNmtldzZxMzdkWGNR?=
 =?utf-8?B?ZjRodnZFa01KUzVITXhuY2NRVDNVd2RINGQ4SWFXN2QvWGtIRzBtc040Y0xR?=
 =?utf-8?B?VC9yQkI3Z0hHbjZrWExqSmxWM0NNNGl4U0NibEN0aUIxVktSM1dONlMvaHAy?=
 =?utf-8?B?NjJEWUtKREJVV1dETG1IU0wzWjBkMDdYMmdEb2tsUlkvcStkL3p4SUdjaEIw?=
 =?utf-8?B?aUVDMkpERkphcUo0VW5QSjROMG4rbXRzNVEzT2llSjVLQS9SZDF5cmQ0V1lv?=
 =?utf-8?B?RWNkUEsreHZMYlRWYklFU20rcWJTTHZHaG9qVGUrOERub1VKUDlFZjhFWU41?=
 =?utf-8?B?TSthbG5CRnBFbDJZMVl0bFNZbExHYkRmMmlaNE5mcXRhLzlIK0ZraW1pN3ZJ?=
 =?utf-8?B?ZVhpb0UwRitYSFRGdnEzdFc0UGM3aStyL042UEhkNk1ORkM1N3dhM1ZLV3J4?=
 =?utf-8?B?T0pFNi9yM3JTY29aTnhHdTNoSHZ0MzVobjF2RXRzQWUvOGkxZ2E4OTBxTnRT?=
 =?utf-8?B?UEtHa2RrQ1VEMDR2QUxNRVc5S0VDMWJ6a2lzY2FWWDhGckJ5cTVsR0RkdkJm?=
 =?utf-8?B?TmVFNTV4WGZTR3JqOWxTbWNGTG1IclFyUVFINDhYc2V4a1NHWW9NV2NiS1NC?=
 =?utf-8?B?YTFtSjk5RVRLOHF1c2RORjRDcC9hZzB1bWM3b2ducG5hZ3psMlNmaCt1Q1U2?=
 =?utf-8?B?VWhrZ0JlWXhtVGZ1dlVtS2crZTBKZUdRSlVEc3Z5N2FLdG5iYVFJSlUyT1pL?=
 =?utf-8?B?dHNVenVjaHFBazYwUFNzMk9UbDhLcThaeW5MRi9YdGF3eVpVYVhpcVVja2NM?=
 =?utf-8?B?RXBLa25HdGplazMwaFZ0ZUNOQUJuRmc4czRkZG9OWTN3ZmlBaTdWMitDMHdR?=
 =?utf-8?B?dUVzNTRReC8zMFlGNDE1VTE3ZXNNTjlVM1lDLy9GazVSdFZxa0lMYVU0SHpa?=
 =?utf-8?B?ZVFPSUFRRWRGVUZkOWI1OGRDUmdTZUpzOE1MRlBLVUlKMUtUbEl4aTBoY3ho?=
 =?utf-8?B?Qitrcy82TDV1ZXVob1lLWGtIcER4RDQ0U3lBcDB0SWtmUUdleWNyVHhtUkR0?=
 =?utf-8?B?ZWdlQmxMbEFSWHBSb1JsbTlsempFZkp1K0FOd0RrajZtVldvQm1JK3RYUjRL?=
 =?utf-8?B?WUw2dGd0WlgrUnZWQVJwWDAzRnZ4Z1krejgyNHV2cnFoSkd1b3dsWGVXQk4y?=
 =?utf-8?B?VnZVMkwybjk5cTRTelFZSW5tYkFmQUF1TEQ4d3JyMEd0aDB0S1N2UzVMbmJO?=
 =?utf-8?B?OUprWVFWQjYvZnZaNUc2VzBUL0xUQ3RkVzFna0RHU1RaSjgwYUlyVTBZMjI0?=
 =?utf-8?B?TGdkeGdBZXJJOVRDcS95d0hlRmRMRnlCZmJYdmtiMTdZL0hPZFhuU0RIZjlh?=
 =?utf-8?B?SkdRU0RXb3A3SjREanBScXlQNG1uT041QTZuN2dOc1BuUXVOSFlXOEg5VE1C?=
 =?utf-8?B?Qi94SEo3OTFweFhhMXg3dTFXOWRmQThVbDhlVGVQeWlZdnFCNytVVFRFclpX?=
 =?utf-8?B?ZFAwa3kwN0krNkZsNk5NalZEVlVna3RYak5BcWhjYVFmZ3Nva1FUTDVYWTVh?=
 =?utf-8?B?WkVQQUZBVm56b3ZyRElldTZqUHVMVWFkOG5lMkNRTkNnUWo2Ynd0UjVkd0RD?=
 =?utf-8?B?SE95MUNTVFZLQkVBU2FrbnRRNTFjSkFBbGJrV2VxMVl3VUZvUndzTnJETFNZ?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e0ca29-eea9-42d1-2ca0-08dbfc93225f
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:55:07.1616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4lQC+el81VEMR3CEYRw43201fC+qQxrk9HUDKs515NxKk7hteG7OsOqSDSYHipNZ8Gul48IsEEynL/tafL5Z7WApiYU1B67pVqVFnF/HGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P193MB0511
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sf5m8725JJVRQ8yVphOaw50k0D7q1HWci+nYAAwo+I=;
 b=bq4Jk+X8Q36q0DzSiBwfU7Ng0TeeCjrGkubwO/fiuwpUBbLjuxpuBoLG07rFrKY7aUbp0z5n4r4dTuQA1IQw6aDPDLViVxOBcWuxio1ReH2G13rbJcmbBWMDghsDXTDv7uVZmriVSI8cAmck4UxFmLhbS2TS3saf/u26VC3Wxcw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=bq4Jk+X8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH 3/3] package/python-fastapi: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpmYXN0YXBpIGNsYWltcyB0byBkZXBlbmQgb24gc3RhcmxldHRlIDwwLjI4LjAg
YW5kIGFueWlvIDwgNC4wLjAsIHdoaWNoCmFyZSBub3QgdGhlIHZlcnNpb25zIHRoYXQgeW91IGFk
ZCBpbiB0aGlzIHNlcmllcy4KCkFzIHRoZXNlIGFyZSBzcGVjaWZpY2FsbHkgYWRkZWQgZm9yIGZh
c3RhcGksIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8KZm9sbG93IHRoZSBmYXN0YXBpIHN1cHBvcnRl
ZCB2ZXJzaW9ucyBhbmQgZG93bmdyYWRlIHRvIHN0YXJsZXR0ZSAwLjI3LjAKYW5kIGFueWlvIDMu
Ny4xCgpCZXN0LApNYXJjdXMKCk9uIDE0LjEyLjIzIDEwOjQ4LCBKYW1lcyBIaWxsaWFyZCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiAtLS0KPiAgIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgIHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluICAgICAgICAgICB8
IDEyICsrKysrKysrKysrKwo+ICAgcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFw
aS5oYXNoIHwgIDUgKysrKysKPiAgIHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3Rh
cGkubWsgICB8IDE1ICsrKysrKysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNl
cnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZmFzdGFwaS9D
b25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5
dGhvbi1mYXN0YXBpLmhhc2gKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1m
YXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcu
aW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDNhNGJmMjFhMmEuLjhhOTdlYjI4OTcgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+
IEBAIC0xMDczLDYgKzEwNzMsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiAg
ICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWV2ZGV2L0NvbmZpZy5pbiIKPiAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWV4ZWN1dGluZy9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJw
YWNrYWdlL3B5dGhvbi1mYWxjb24vQ29uZmlnLmluIgo+ICsgICAgIHNvdXJjZSAicGFja2FnZS9w
eXRob24tZmFzdGFwaS9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1m
aWxlbG9jay9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1maXJlL0Nv
bmZpZy5pbiIKPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWZsYXNrL0NvbmZpZy5pbiIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmFzdGFwaS9Db25maWcuaW4gYi9wYWNrYWdl
L3B5dGhvbi1mYXN0YXBpL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uN2QzNzZkM2RkNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5
dGhvbi1mYXN0YXBpL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTIgQEAKPiArY29uZmlnIEJSMl9Q
QUNLQUdFX1BZVEhPTl9GQVNUQVBJCj4gKyAgICAgYm9vbCAicHl0aG9uLWZhc3RhcGkiCj4gKyAg
ICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRT
ICMgcHl0aG9uLXB5ZGFudGljIC0+IHB5dGhvbi1weWRhbnRpYy1jb3JlCj4gKyAgICAgc2VsZWN0
IEJSMl9QQUNLQUdFX1BZVEhPTl9BTllJTyAjIHJ1bnRpbWUKPiArICAgICBzZWxlY3QgQlIyX1BB
Q0tBR0VfUFlUSE9OX1BZREFOVElDICMgcnVudGltZQo+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT05fU1RBUkxFVFRFICMgcnVudGltZQo+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fVFlQSU5HX0VYVEVOU0lPTlMgIyBydW50aW1lCj4gKyAgICAgaGVscAo+ICsgICAgICAg
RmFzdEFQSSBmcmFtZXdvcmssIGhpZ2ggcGVyZm9ybWFuY2UsIGVhc3kgdG8gbGVhcm4sIGZhc3Qg
dG8KPiArICAgICAgIGNvZGUsIHJlYWR5IGZvciBwcm9kdWN0aW9uLgo+ICsKPiArICAgICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS90aWFuZ29sby9mYXN0YXBpCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWZhc3Rh
cGkvcHl0aG9uLWZhc3RhcGkuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uM2RjMTU3OGNiNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhv
bi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiArIyBtZDUs
IHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9mYXN0YXBpL2pzb24KPiArbWQ1ICAw
NmJmYTdjNjEwZmM5ZTgxZDA1YjAzMTllYjcwY2FlNyAgZmFzdGFwaS0wLjEwNS4wLnRhci5nego+
ICtzaGEyNTYgIDRkMTI4Mzg4MTlhYTUyYWYyNDQ1ODA2NzU4MjVlNzUwYWQ2N2M5ZGY0NjE0ZjU1
N2E3Njk2MDZhZjkwMmNmMjIgIGZhc3RhcGktMC4xMDUuMC50YXIuZ3oKPiArIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiArc2hhMjU2ICA0ZWM4OWZmYzgxNDg1Yjk3ZmVjNTg0
YjJkNGE5NjEwMzJlZWZmZTgzNDQ1Mzg5NGZkOWMxMjc0OTA2Y2M3NDRlICBMSUNFTlNFCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsgYi9wYWNr
YWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kYjg2YmZjZTMwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsKPiBAQCAtMCwwICsxLDE1
IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBweXRob24tZmFzdGFwaQo+
ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtQWVRIT05fRkFTVEFQSV9WRVJT
SU9OID0gMC4xMDUuMAo+ICtQWVRIT05fRkFTVEFQSV9TT1VSQ0UgPSBmYXN0YXBpLSQoUFlUSE9O
X0ZBU1RBUElfVkVSU0lPTikudGFyLmd6Cj4gK1BZVEhPTl9GQVNUQVBJX1NJVEUgPSBodHRwczov
L2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNzcvYmIvNTk0MWU2ZTJjZTMwMjBmNjRi
NTM5YTQ5ZDM5ZjQ5YmUwNWRlMTdkMGM0N2ZlYTk1MDEyNTg5ZjgxMmE1Cj4gK1BZVEhPTl9GQVNU
QVBJX1NFVFVQX1RZUEUgPSBwZXA1MTcKPiArUFlUSE9OX0ZBU1RBUElfTElDRU5TRSA9IE1JVAo+
ICtQWVRIT05fRkFTVEFQSV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICtQWVRIT05fRkFTVEFQ
SV9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1oYXRjaGxpbmcKPiArCj4gKyQoZXZhbCAkKHB5
dGhvbi1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCm90aGVybW8g
R21iSCB8IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogQWx6ZW5hdSB8IEFtdHNnZXJpY2h0IEFzY2hh
ZmZlbmJ1cmc6IEhSQiAxNDc4MyB8IFVTdC1JZE5yLjogREUzMTk5Nzc5NzggfCBHZXNjaMOkZnRz
ZsO8aHJ1bmc6IERyLiBEZW5uaXMgTWV0ei4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
