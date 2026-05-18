Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63261CD4F49
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 14:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C41E42BD6;
	Mon, 18 May 2026 14:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-YXKqa7KCSg; Mon, 18 May 2026 14:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F1942BB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779113762;
	bh=ShAYMMZR8oVSXYVxmOd1t7LNpdDUXaxN/kpzTn0dlbY=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eoqeSadNxDTw49sMOErIUBJ5YU6tSlGXOBPr3n8kqOIOpfuXGpimmxYuWX6rQlZQ3
	 jVAFXPHnxXiJ7cOau2xyPc9hOOFKXuz1Izeiqm4KPQbJc8JurHy+p8q1j1r28tIgQL
	 FTIzVVxHkqt4HTNUtuIvZs/uASNiShsYepLBAQPZaicTE0wedKQEwnX+KJ9rHyECpe
	 4722E6HpfbdWSCCGbLtchJso0oF3YZ/I0bTnQl+7XZi6P9fGBURAd0m28yS8zRQa/y
	 E4vbG3UHhMNM7H1Qr06p+I+uDVXXv0mmt7uP6LqLwE9fSK90EDx7XxBoxsmz1v0FJ4
	 SstR1ObANK/5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F1942BB7;
	Mon, 18 May 2026 14:16:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C34AF265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A935C6F8B9
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T08eDozUN0XV for <buildroot@buildroot.org>;
 Mon, 18 May 2026 14:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E2CC6F86D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2CC6F86D
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E2CC6F86D
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJpb9VK36sRvV4hGIDzepjCIj6tCXTlDgNCe+gLa0yQTJBT71im0UOh0KMm+CgkrIOBdtrpulA5GefShn3twBGmnwRl/5shqUKyGYLuO59eq/JbzgRT1rPNxikvcED+9j8sTn6f7mjGfdk/ysWvGZyBmU004+m+jnqNjA83cE0vdth5kyyrtUv6l08CRfsf9YIcUrzobhZqYUD7h/hiKgp1fb1pNx0MS2Y3d1D24X8hGGxVg7EI8JgI+tTtngKejASB7o2hxHOKcgMubUbjB3iUQTxRXB2h3jKYG+mPGFkS7QKUY2iFmaW0PpgsPhLzBZLvOf8GUaNjXJ1f5aXXhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kch3f0MZS5WpwGztuhl8YOJn1Pwa3l2+iI3T3/cKpCY=;
 b=Fm6AiCvHSQgoF72v6JG5Kj+BuDR8RLZZNrOILwwrgOklJARqb0mvRl1a4oUNgZE/ijaOqsROqrICdLEfvUXCfsg4hdSQyjoK65dPspKvh3NThjfxY9hls5zQW8hk3v120/iPYab81LUB0Bh1XtFgGMM3fC+OwynHq7lRNkkJ0r/O9HJGuXiBpF1JTj6e6gGlmXbv2REhtnyT9bVHhqpKVlGQHU5MjMcPHFkQSZlSRi1xFgpAJBNdIQNjSN5nAO+7OApSnyZi7GYw8/8pCU1WRl8L75rjoaJrCvdd/mPzVtuA3EbOUZP+2HWWCBwxohCg+pQSE0AiWJs5hf+XdmJDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
Received: from DB3PR0202MB9129.eurprd02.prod.outlook.com
 (2603:10a6:10:43a::19) by DU0PR02MB8856.eurprd02.prod.outlook.com
 (2603:10a6:10:40c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:15:54 +0000
Received: from DB3PR0202MB9129.eurprd02.prod.outlook.com
 ([fe80::7510:e8c3:db37:47ff]) by DB3PR0202MB9129.eurprd02.prod.outlook.com
 ([fe80::7510:e8c3:db37:47ff%4]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 14:15:54 +0000
From: Kanak Shilledar <Kanak.Shilledar@axis.com>
To: "bonet@grenoble.cnrs.fr" <bonet@grenoble.cnrs.fr>, "petr.vorel@gmail.com"
 <petr.vorel@gmail.com>
CC: "titouan.christophe@mind.be" <titouan.christophe@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "arnout@mind.be"
 <arnout@mind.be>
Thread-Topic: [Buildroot] [RESEND v3 1/1] support: kconfig: Fix compiler
 warnings
Thread-Index: AQHc4f32vePaSrik2U2wA47TYzT+IbYKZLQAgACAl4CACPhkgA==
Date: Mon, 18 May 2026 14:15:54 +0000
Message-ID: <b42de144f51063702828f71b42da4f668218df52.camel@axis.com>
References: <20260512105602.83368-1-kanak.shilledar@axis.com>
 <20260512105602.83368-2-kanak.shilledar@axis.com>
 <1d003106-63b6-49d5-90c0-4f7c0f2f1f79@grenoble.cnrs.fr>
 <20260512211647.GA67744@pevik>
In-Reply-To: <20260512211647.GA67744@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0202MB9129:EE_|DU0PR02MB8856:EE_
x-ms-office365-filtering-correlation-id: 6f27b33e-6010-4444-c76c-08deb4e7f913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021|11063799003|4143699003;
x-microsoft-antispam-message-info: iwVGWdpjffBdPyzW8qHn2nTd7K+YuNa0z38rQ8RkqiFx9h9FMlgTtCsuiKqTMyLUcLFPuWL+VWchGhxNvoOfUSWv9H6ulMHWjtojzDFZJUSegdfRBqveGl1Et1pOZ/KDGRGQBqoZlI2muncl2hCytNWOiC+8rPChiq8CsFOIZ3KwUYfdrIBMkXbWETtPtyKEHyc88gRXIqZUraFvxi5bTo7+Y9wD9vIWJxDskspgm36RQW55FcKEv1SYsfMBs7tG3NOnvq72UjwEYJG4d+WkpLyB5bFXqL1dMB7scmFaxxurPw0Ib71RTVhsof6IOZHiMWDIIHVN4IN3GL1ZMtnR0IwgKTaqxWSIhk+k//7W5yDD9VZkFaq2+XQrZhdObFlRzsuSQvWDnlH4gz0ENksqa+tX0mZhYvPtuWFu3faPDmwzm8bpvAac+eY3HgrZccSL9Qh1k9RYhmP/Flhw9JJRAz1cciWyHrnnuZEkjePClNfvNh41O9A1bDc5+/BBdG7mhCJwoC3xprJcFxnMRIX4E+xXj+DuoygL1OVaGWp0ZtHL0+0kTBrYfLaqn1QbbeJGRS26StWoTWitC5iirZnNEeXc5H3X539cwOXPDv6aGJ5Y9n9jNOmKAn6i7GQunHU3iJ8fMDWjM+HPndaRCYi05yLExmxX90hG1/bkyqTon0sc/+s35C7Bssg1EG0wCdYXse5JcNfvblTCUjLg+sEQuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0202MB9129.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlUvQ0IvS0o4d0ZqNUt4WFJ5T3BZUERZV29IbW9uTEFka3pYWHJoS0ozT1gy?=
 =?utf-8?B?VnhlUWZXc1VDYmJLbVZybXhISHFuWStZUjc1clJOeTgwbkxrcVRucDlCSGho?=
 =?utf-8?B?Sm1aVnFDdVFNQzlGVXgzMjZWQlB5eHNWSFRTWDBzUDQ4ZkFpaTdHZTkxMUhH?=
 =?utf-8?B?K0gyWFA1QkFsaS85NXdPWFZIdkpVY05YVXRUVFVCd0VvejFqLzh3aDc0Q0JZ?=
 =?utf-8?B?c2dxRXZ0UE9QV1ZRSDVRdVAvYkVDNDlmbjFNWDljUmVMZnZhRklweEZRSkI0?=
 =?utf-8?B?YUlCeGtLVkluaHY3c0RpRnU2N0NiNGJzL2lqYzNYajkvNlluN2xmSXlPTVZh?=
 =?utf-8?B?TnJRb1dKdUM1Nms2a3BieG41VmxNRWdzcEFEcE0xNmdZZHVSZlJ4ZUR0VVZE?=
 =?utf-8?B?Tm1nK1hTUkJKOXFjeHl5L3NPRkU5NklwblcybWNBS3NWUVNWV2tMVG1md2Fk?=
 =?utf-8?B?WVR2SytmV0tyeHRNclZzcmQ2T09tbVZVSjZGK2hUekFJN1hCNDZPZEh1My83?=
 =?utf-8?B?TTNreUZYWUMwek85aUkxaytIdlJRcFZlK3g0SHFIVGJsK01ncnRtSVA1OFNq?=
 =?utf-8?B?ekFYVUQvWG43MXpvT2V2eGMzZWZOdUo1Nlh0STFITTlOU2s4b0cyUXk0bnYz?=
 =?utf-8?B?cE96SWpoTmx6ZXRNVU1RaHRVeXFwWEZIL1FETno4VGxORU1jRUFIcWtwcFh3?=
 =?utf-8?B?VkNWcVNYYzlPV2N4SFJPZFhCRE5vWnJHQ0w5UnB3TWxZTWwrbUcrTFcrQnBy?=
 =?utf-8?B?dVpJN0ZGdS9LVTFUVGN3VVc5b2RBOTk5OTRjSzhkNjdtQkE2TVdkRmdVeXo3?=
 =?utf-8?B?VWdOZGlzbTNiQkRlRnlWcmF1UFRmZjJSdHRXYkx2cjBjYlEzMHhqWTJNWFM3?=
 =?utf-8?B?Um0yNlhzVURrdklqVjdpL1F1SzlhSHpmNVZ5dWMvVjhDcTR0cU9GTFJpSFZI?=
 =?utf-8?B?RGlXOUpKVm8wRWNLQng5WVhrQWpZYzFkOVAySzlkRlAwSnRoakF4MnVZem84?=
 =?utf-8?B?VDN3cjdKTjNnUEVxU1hBTXd0a3VxWGhPS0tnSXFybFBZK21VcUZyTGJINXRM?=
 =?utf-8?B?Rzlkb1NEYnJyS0trNDhVSXJseTdZR1c3UlZzeWtycXlqZ0cxVGIyak1UaTVP?=
 =?utf-8?B?dWhqSjFQb1B1bHlPVHljWWwwYmdjZHhXR21ycEZDb2ZhZGk4dEQ4cnVtZ1NY?=
 =?utf-8?B?N2krSUZiMG4raU1LTTkzQm90RVFDY1N4WnVaT0pXOXFzVE9vRUo3ODJUM2NP?=
 =?utf-8?B?NlU2NytDOTdxcmpOUnZ6TkpoQ3JpTnFqenN6blQ5OEpmUDNYYnRxVnFpVVVB?=
 =?utf-8?B?b1lZaDBTamlKOXVQMElOVHZNZ3hSNHJJYnljUUJ6YmJRKzRDSlF4Z2RrdDlE?=
 =?utf-8?B?WmIvZmpHdE9qWm5BMWxIdlpHRXZmbTRnNjZIUUZuYWVlQlJqQ0JSWi9YeE5l?=
 =?utf-8?B?bjAvelZmYTlYeG9YK1FNZkxCTXZQbUdOMVE5NXViTHNvbWR1YWltZVJWN25N?=
 =?utf-8?B?V2lHYzZsNlp0SGV3RzJjZlhqZ0pzNEhWYUl2Z1NXTmRMMTVGRnNUaFNvZzdp?=
 =?utf-8?B?cjV3a01ZUDZYcURVZE9CSXBramxnTmpETzV6c3Y5alRwK3QxNDZacDlQMUVy?=
 =?utf-8?B?TldWWm5aSno3ZFJsa2RiUGtnVStkTWhSVHYxVkQ5c1FIeDU2RjZjTkhFMXY1?=
 =?utf-8?B?V2QwYitPemtHcUlWU09jSFl3eXVpRUV6VlJrWmVsUGpsdDRlMklDMVVKRm9r?=
 =?utf-8?B?Qkx5YnpHTk1xYzlPNEZsNWhPMkVHUFRMVzBsSHEzMGViRlRzLzFVcXVxQ2xo?=
 =?utf-8?B?cFlIc0I2RmhWSTZCT0FZTlpxYjhtYzZnNENSQ0NxejFsVytPRStERVc0TzR5?=
 =?utf-8?B?L24rbCs4TTVWZDN4dVlESHBTZHJYc2RBVWFXTVI3c1BITDZOWDVhNWlVeUdr?=
 =?utf-8?B?MzZvVWFlNS9HanBVUDNCRG9FaHBFL2MvbzVQMy9GdXFTWFhqNlZGanlsTCtZ?=
 =?utf-8?B?dGJQQUVwdTZIWCt5Z3d5THZXYUtxRS9mTzNQNkhESXFUelVjaHhXVE9VdmJI?=
 =?utf-8?B?cXhyM0lyYWZTaXFGb28xT3lmM3dnalhJUHVjQkJua2tRNG40V2FNdWFTN1Nj?=
 =?utf-8?B?UlJyQzQ1K3ZFcmRoRlpXUkd0Q1pFRy9rcUFzaFNzdVFNbnpCV0xGenhTcThu?=
 =?utf-8?B?WjdyVEcrZDZkM1B2M0lYSUVPREczSVprWTkrcHZzUllUUEphT1NvZXduVkhi?=
 =?utf-8?B?b1hXVGVQb2tWbnc4dDVHS05sNEtWeDg1WnJqN2NjUGFIeEFiMFZEVVNGdEVo?=
 =?utf-8?B?SXNwTm9RdGFKK0ZEbjZ2WVBxZTBTMW1RMmFQQ2E2NjVYTUpUc2tDQT09?=
Content-ID: <785FF763BEC5124D85BC9C37A8CDD3DD@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0202MB9129.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f27b33e-6010-4444-c76c-08deb4e7f913
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 14:15:54.2251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4DRhYeAjQmkSNxlTCF0kDfdsyPQyGh4Q2uvjOcjOwkq96xfx6WGsePMy+gzRBZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kch3f0MZS5WpwGztuhl8YOJn1Pwa3l2+iI3T3/cKpCY=;
 b=dcy5wDqwVnu6BeQAGoSj4GLK3UmPgYTxPQ3mMzdK+HmMVA6bmF6qYP7uIRxbmkJR9O+irxkerNBgBmAnzr9a2YzBRKoUgv14gMk0Honb/yiWfDE/cbQ+QR1YcpICjEaIs2Phm+1PK66yWtIjZyQpFULwba+g/5YiO2Lypg41SNE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=dcy5wDqw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Subject: Re: [Buildroot] [RESEND v3 1/1] support: kconfig: Fix compiler
 warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiENCk9uIFR1ZSwgMjAyNi0wNS0xMiBhdCAyMzox
NiArMDIwMCwgUGV0ciBWb3JlbCB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gWyBDYyBFZGdhciBh
bmQgQXJub3V0IGludm9sdmVkIGluIDMyNDYxMmQ2OGUgYW5kIFRpdG91YW4gd29ya2luZyBvbg0K
PiBrY29uZmlnDQo+IHVwZGF0ZSBdDQo+IA0KPiBAS2FuYWsgSSdtIHNvcnJ5LCByZWFkaW5nIHRo
ZSBkZXNjcmlwdGlvbiBvZiB0aGUgZmFpbHVyZToNCj4gMzI0NjEyZDY4ZSAoInN1cHBvcnQva2Nv
bmZpZzogZml4IGNvbXBpbGVyIHdhcm5pbmdzIikNCj4gDQo+IMKgwqDCoCBOb3JtYWxseSwgd2Ug
d2FudCBjaGFuZ2VzIHRvIGtjb25maWcgdG8gYmUgcmVmbGVjdGVkIGJ5IHBhdGNoZXMNCj4gaW4N
Cj4gwqDCoMKgIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzLiBUaGlzIG1ha2VzIGl0IGVhc2llciB0
byByZXN5bmMgd2l0aA0KPiB1cHN0cmVhbQ0KPiDCoMKgwqAga2NvbmZpZy4gSG93ZXZlciwgaW4g
dGhpcyBjYXNlLCBldmVyeXRoaW5nIHRoYXQgaXMgY2hhbmdlZCBoZXJlDQo+IGlzDQo+IMKgwqDC
oCBhbHJlYWR5IGNoYW5nZWQgY29tcGxldGVseSAoYW5kIGRpZmZlcmVudGx5KSB1cHN0cmVhbSwg
c28gdGhlcmUNCj4gaXMgbm8NCj4gwqDCoMKgIGFkZGVkIHZhbHVlIGluIGtlZXBpbmcgdGhlIHBh
dGNoLg0KPiANCj4gVGhhdCBtZWFucyBJIHdhcyB3cm9uZyBpbiB2MSB3aGVyZSBJIGFza2VkIGZv
ciBjcmVhdGluZyBhIHBhdGNoLg0KPiBPVE9IIGl0J3MgYSBiaXQgY29uZnVzaW5nLCBpdCBzaG91
bGQgYmUgYXQgbGVhc3QgZG9jdW1lbnRlZCBpbg0KPiBzdXBwb3J0L2tjb25maWcvUkVBRE1FLmJ1
aWxkcm9vdC4NCj4gDQo+ID4gSGVsbG8gQnVpbGRyb290IHBlb3BsZSENCj4gDQo+ID4gT24gMjAy
Ni0wNS0xMiwgS2FuYWsgU2hpbGxlZGFyIHdyb3RlOg0KPiA+ID4gQWRkIGEgbmV3IHBhdGNoIHRv
IGZpeCB0aGUgY29tcGlsZXIgd2FybmluZyBnaXZlbiBvbiBVYnVudHUNCj4gPiA+IDI0LjA0LjQg
aW4NCj4gPiA+IGB1dGlsLmNgIHdhcm5pbmcgb2YgYC1XZm9ybWF0LW92ZXJmbG93PWAuIFsuLi5d
DQo+IA0KPiA+IFRoaXMgc2VlbXMgdG8gbWUgbGlrZSBhIGR1cGxpY2F0ZSBvZiBhIHBhdGNoWzFd
IEkgc2VudCBpbiBKdWx5DQo+ID4gMjAyNSwgYXMNCj4gPiBwYXJ0IG9mIGEgc2VyaWVzWzJdIHRo
YXQgYWxzbyB1cGRhdGVkIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzLy4NCj4gDQo+IFRoYW5rcywg
Zm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJbmRlZWQgaXQgaXMuIEknbSBzb3JyeSB0aGF0IEkgaGF2
ZW4ndA0KPiBmaW5pc2hlZA0KPiB0aGUgcmV2aWV3LiBVbmZvcnR1bmF0ZWx5IG5vYm9keSBlbHNl
IGhhdmVuJ3QgcmV2aWV3ZWQgaXQgWzRdIFs1XQ0KPiAoc3RhdGUgbmV3IGluDQo+IHBhdGNod29y
ayBmb3Igb25lIHllYXIgb2xkIHBhdGNoIGlzIG5vdCBnb29kKS4NCj4gDQo+ID4gQWxzbywgYm90
aCB5b3VyIHBhdGNoIGFuZCBteSBzZXJpZXMgYXJlIGxpa2VseSBpbiBjb25mbGljdCB3aXRoIGEN
Cj4gPiBtb3JlDQo+ID4gY29tcHJlaGVuc2l2ZSByZXdvcmsgb2Yga2NvbmZpZ1szXSBwcm9wb3Nl
ZCBieSBUaXRvdWFuIENocmlzdG9waGUNCj4gPiBvbg0KPiA+IDIwMjYtMDItMDQuDQo+IFs2XSBb
N10NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBJJ2QgYWN0dWFsbHkgcHJlZmVyIHRv
IGhhdmUgdGhpcyB1cGRhdGUuDQo+IFRoZXJlIGlzIHNvbWUNCj4gcmVxdWlyZW1lbnQgdG8gY2hh
bmdlIGl0IGJ1dCB0aGF0IHNob3VsZCBiZSB0cml2aWFsIHRvIGZpeCBpbiBuZXcNCj4gdmVyc2lv
bi4NCj4gQFRpdG91YW4gZG8geW91IHBsYW4gdG8gc2VuZCBhIG5ldyB2ZXJzaW9uPw0KPiANCj4g
S2luZCByZWdhcmRzLA0KPiBQZXRyDQo+IA0KPiA+IFJlZ2FyZHMsDQo+IA0KPiA+IEVkZ2FyIEJv
bmV0Lg0KPiANCj4gPiBbMV0NCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJt
YWlsL2J1aWxkcm9vdC8yMDI1LUp1bHkvNzgyODI1Lmh0bWwNCj4gPiBbMl0NCj4gPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LUp1bHkvNzgyODIy
Lmh0bWwNCj4gPiBbM10NCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWls
L2J1aWxkcm9vdC8yMDI2LUZlYnJ1YXJ5Lzc5NjMyOC5odG1sDQo+IFs0XQ0KPiBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz00NjU0NzUm
c3RhdGU9Kg0KPiBbNV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2M4NDY3
MTk4LWVmYzEtNDVmOS04NmVmLTA3MjZkMDZkZjI5NUBncmVub2JsZS5jbnJzLmZyLyNyDQo+IFs2
XQ0KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3Qv
P3Nlcmllcz00OTA5OTcmc3RhdGU9Kg0KPiBbN10NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnVpbGRyb290LzIwMjYwMjA0MTU0MzQwLjc2NjUyOC0xLXRpdG91YW4uY2hyaXN0b3BoZUBtaW5k
LmJlLyNyDQo+IFs4XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNjAyMDUw
ODI4NDcuNGI4NTU1MjhAcGMtMS8NCg0KDQpCZXN0IFJlZ2FyZHMsDQpLYW5hayBTaGlsbGVkYXIN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
