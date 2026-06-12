Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD225CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ACFB411F3;
	Fri, 12 Jun 2026 12:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2VTPOeJ-W9Z; Fri, 12 Jun 2026 12:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB1C340CF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266540;
	bh=KaSn5wernqmaiW6sRyjUf5l2J/GUM9LavS0Kg30s1aM=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2VFi5dfy+IdQqQ6sX/Z6pphdkkW7ymAAd56Sx9v3SohN086Z6Dfz0y0IhhiNF0F9
	 tc380Mj0Sm3v1QKg+qUDkJIXh8MirbejGWZVEhmsgfajS73xx3zLv9h338ssGuI6Sx
	 bugJfrMAM+VdjhId86eTM6Ut+B8EQaFDQGjaYtwTwywAO1jFJfegPzU0AwHgTGtmBN
	 8eST9s8pF2Exmdg0ycO9s9XPC59ZwFCNutZ5KtpsfOA1MYJO2rT3zPtXqJLY2uybSw
	 DAsGZ8XFpbaPG37kXfmMwhwWpvVdUI0gLKnrTK4XoordXU7DueyWFAoo/aman2qWRA
	 fbFbKCEgIV5Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1C340CF9;
	Fri, 12 Jun 2026 12:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 351B812F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26C4360E9C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jE_6ThYj9w75 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::1;
 helo=mrzp264cu002.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E2AC60DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2AC60DE4
Received: from MRZP264CU002.outbound.protection.outlook.com
 (mail-francesouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E2AC60DE4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSEQWFpOlg35r6VF0bl4pmZ6Fsbdu5ssxSv5ypYfe7bMDAq6tMsSqIY4Vojvy3bVBxQo+i1n/a70Z2aFKXBhCMSPvwfaGthrihuDWjD4GcGXeQ7bh91N6dW83Kw++3XHyWs5F2uEbJ5gGl4PCKfQoJkipTSp4iq4KpmFYln3ZbHaSbM8I/oLXfCQE4EtOn2HFCkoldXNPFOss6IWmhLAwp3J8+gXS0pH+ApgsBXbbl5nzmiK81hR3HUkgviPiHPThOin3j7ngYcARyjHTFKZc/sGDE72u9ltioZ17AlhFFhGlGpcoFYQWpiW1qbtDs0zUCoz2F6d5WpyHBZeRy1C5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5m0SkH0BMQIzJ0KpG+5mIb06oUWHjpBOETiwrKzxlE=;
 b=JT/zQ1B20BhgKwlxj4Qt1aL23X6qKKm+sRdyGGL7SNZ5O9DzDEVYelJ5dNQ9nMiab88gX348AAEuzTA3kvAFicU8hONYtC46FvduZGCftGd2HBi1c11abb4J6SRbNEkL1pJEyLW/sRnkYJ3zwWRXdBQyrJ/aW7Dg983MMxx7P3TCNYdklvsT4IikshdGk+V3cIuaNR2qEkJqX9mZp0KXdoZAsIp3H0Xe11MWRNtAHDbxO66rgvFKDenMiE6ozMipco1EDhp1cFElKSqX72LrFZZxqMaT3cwR9ZijMsNZ110N4e98bsiF+ILPmZahbjfzj4z+JvucaCSRhiDdljSd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:15:31 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:15:31 +0000
From: =?utf-8?B?U8OpYmFzdGllbiBHdWlsbGF1bWU=?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?utf-8?B?U8OpYmFzdGllbiBHdWlsbGF1bWU=?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 00/11] add CPE identifiers for pkg-stats
Thread-Index: AQHc+mUpn8ZbTMIRjkCmbX1Qvv6xyw==
Date: Fri, 12 Jun 2026 12:15:31 +0000
Message-ID: <20260612121516.1634-1-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: 2ee2c7be-1140-4bcb-625c-08dec87c4c3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: I5dyVQibb3nMAms8/plEax6ttvoU9IzJF89JQtWomFTpneGeyUFq28Sxa2UZswAW0k0OrnHGbSGau1xtDNQ62W+2yr7fN7NHIFL5Oh3WwJZjrYs79wiziFdPIqQZ05ypfktrwyuhziwu9azaFo1kQFfaNGUn61NuGkq9XoIxBSH6dIgtkTPNS3WvEn5nuPyOl5pstN5hRjGrpsqyjvd64qM/HEpTdMQddbWHCLzVCafPsu53uwgH05XXGz8awzRa2PTTFQeFVe4pDeO37T6uw41EkXGOaU64OBMhLGadqq92/sYOFeRRinyCErfxd+B997QPn7SKOdARMW955WYEBKoInnCiaFCNxdywsMm8c8FHmKotF7Ii/I25Sjwk6GpbeilDRRy65pFnFfDWhBFdU+rISyPONWlv4HeH54uqFC2li64sQZi27DHTXJqKKI8+OPF0jC6482/mZuHkKnpNIo0oCouP6MUX4mUNTBKbap9f9roQ9tRf2dgDDm6YUYJEV7zzvsszl1Zhqm8nrCBEkcxxSMaRRW0r1i1ZzHHonqZ6h8WtbX3zI/tOKRJ+VXDWPDw+aoFdLbYs6N8I1njdShpWeaBp8LWyyJy6JAnZ6Of1NfinXayomjZHfEb7Myx9lMKXwQA7Pu20wvdrmQp5e5cxm3plGn1PPKuc2wKY2O9s34YldPrkk/tRXNbbBnYUWhsysJHadt9Nl99Mo1P/ex0BZDZtOlEqTqeDr0MQ+yVnRHCCN6ITiI/2t7QlWrqj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVBJT2g1eEE3a0RiQ05TZFBxMUVyRjlQUEtHMSs3K1FqMFBBaUJiRWFVL0Ni?=
 =?utf-8?B?V0dWaStZamJuSFZLVTk3L25GcXp3dFExWXIyVlNOUkpYTk1USVRvNjFjQ3Zu?=
 =?utf-8?B?VDhNdFdxVW94TllUMGdYYkxTM0lSaGRycG1SQ1FqRmc2eTFuYWVtNW1PbXlk?=
 =?utf-8?B?L1V4OUhlU3d2L2JuK3ppa0JCUDVnV2ZPdFhEdHgvM3Q4Z0lndTFUR1F5UjhL?=
 =?utf-8?B?WHZWdENqZ3lrMkM3d2g1c1pCQlM5KzZpSVBqMjQxZWFYd21IVGtOZmVlRVR6?=
 =?utf-8?B?cFRaSmtoYTlHWXdzMm8wUmRKL2xybkJ0VEY0WGJxUVl3d1VZVE5NVFJrTERM?=
 =?utf-8?B?VFBhM256WGJqTmtGVXV3Vnk5amVvb2Y1WUxmVXhZc1pJUFl1cGlwcTg0elQy?=
 =?utf-8?B?N1pzYk9aa0o2UFFXUDhvVDZMeVM2VER6dUFxRFZLblpyQVBnVFBJY0VpRnNy?=
 =?utf-8?B?SEU1WUFDY1NYdkxyZ0tJNGNwTThpSWswd2ZucGJyUnRvdW5uZWRJZGwwSTd1?=
 =?utf-8?B?RWJKZENFVzNhWkJncmVrQThEbXg2dWQ4STFmb2xTSGNGdmlmNHlkS00xYXZK?=
 =?utf-8?B?TFhYd1BGN0xnWmZncEt0TmZxN3FXR2FkeXl1c0lYa3lqbUduSUc4VWZwM2xY?=
 =?utf-8?B?N0VyQS9CSUpuMkxzUU5QTXJ3bzRwMFg1Yk5ENGhwLzRJdE9uK01wZnoxZ0ZS?=
 =?utf-8?B?Z1pic0luNG9VWFRmb2VleUN3VDl4R2ZnYzl5NFhmakE0RHdnZWZKc1lqUm50?=
 =?utf-8?B?WGxWdXBxN0NYblVqMHFvUGl1c0hBRkE1VkNOVkd6OW05R1MyK3hmRDZTb2wv?=
 =?utf-8?B?R1U5VEZlMFpKMXBOWGgvZys2S1V0Yk00UDJBMkdBTjB5VEh3YkJGYzlhUm1U?=
 =?utf-8?B?SUdFaE0vNW1SYUluQ2JTUldTN1hpTzE1RnluWmZFVzlhZHRqa1cycGVPRVJm?=
 =?utf-8?B?Z0dwdkZHMFhDaktidllueTZ1TVg1NWlkejZoYXpEU25JM2l3N2lyMG5yaGUv?=
 =?utf-8?B?V0hKYUR2UW5WZ3lzSEExTGpyTzJqM2NsUW5zaldIaC9EU2ZMaVM4YTh2emxP?=
 =?utf-8?B?eVBaaEMxRzNadVY2RHdhMU03d1lYTEJ6bU1yTFF6a1lWZ2ZpSldRZUF0V2Jh?=
 =?utf-8?B?TzZBekI5QlhuSlNRT0h3cWhKTDVJZXhHd01lUXp2S1hFU2pwUG43WURyZElU?=
 =?utf-8?B?d0dxVEFkbjdFR1dJTU4wTWNkcWoyTVNOVFZOYS9iUzM4cHZoNVNtTXdTY05U?=
 =?utf-8?B?Q1R3ZU5NQkZLQkJJZXkxQWIyeWdNVkFUNXlvRndzbDREOTl5QUp4M1hrOHZC?=
 =?utf-8?B?SjcyTXBweWI3WG1wdnR5cGRZS1pSWFBaa2FGYS9YNHlSU1MySWkwTk40ODlt?=
 =?utf-8?B?T054ZytmdVNreEpBdEZJbWlxREVOZFdaUittQTJtVEtzemptV0tRNjJYektG?=
 =?utf-8?B?MjUrd25GdjVrcTVId05yeWt5NFhHdkdIdzRIZ1RkR2ZRWmcxa3V4Q1RVOFFC?=
 =?utf-8?B?SmpVZDlObEQ5c2w0amhOMXVWejk5cHVRN0c3ZWtQd1VxcDdLTzZ5K1o1bGpL?=
 =?utf-8?B?Z3Y0cWZ5cUhOOVBmOUEzc29ONUpHcm04L1Z3ejl0TkdxclNLNWlqcVU1YXA0?=
 =?utf-8?B?ZFZyNHBHZkFvZlNZeCtjUkZGTkNBMndXOFBQSGlvaGt0aFRjb2pQU29UdVpn?=
 =?utf-8?B?alpUMGJQVzMvdzU4SVlWRUU2T0EwTlAweU80VEdLMC9COEZ2UEo1bmRQU0pI?=
 =?utf-8?B?WE5zTzU3QzJOUFRWWkpPZGNJdmhXcHNqaS95THd5NUk0RlhybFV6SUdNSjZ5?=
 =?utf-8?B?Q2NaNWN5SHdqcTZjUFRxbFk0UTRETUNxTFBvQ3ltcGtadDdYL0x2RzR5M2Q5?=
 =?utf-8?B?K0daKytwZ1hpOWsrN01WMDhLYnRQZDIvOHkxWSs2UDlMcnBEbmt4cmh1a21x?=
 =?utf-8?B?eVJGeWlqeGJOcGVNVkFNeXV6R1JSdldpb0RabzFGRGZLYW1BWnV5Ry9XUzRN?=
 =?utf-8?B?cUp0TjY5YTNBcHdOaDFEUzhtYXB6dXVyY2JCUDFyMDNEVERsNkxNVG5XZTBa?=
 =?utf-8?B?bklVaC9OTDVKYXhRT3IrRWkzVnFhR0tlRFZtODA2YmJtdGYxTEJTMDVvVVVv?=
 =?utf-8?B?RHFKN2RXNjBhWTFNaHB2V1BFTmpGWC81RTVYZTZhSjNyQlo3Ujc3dTdNWnVZ?=
 =?utf-8?B?VUEyNVZKL0dBSG5BV1VoVDVzMUVCSDFNc1BjcVg2SWVZZ1JkaGFTMzdJQldj?=
 =?utf-8?B?U09QUnRUbGlpVzZRQnhCaFhHTEpmK2ZXQkdJQkVwbFU3RVRkRFdmeHR1QVUr?=
 =?utf-8?B?RkZxdjF6SWJXd1FrT2JHYmo4d0VIY0lhQ0NkWm8vTFQ0VWtjc1RIcFpQK2pO?=
 =?utf-8?Q?IqsSIjZctV+0W7HOeC/7Wkhtyoituxms7o17z?=
Content-ID: <82E14084B801B74789BEF66852883701@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee2c7be-1140-4bcb-625c-08dec87c4c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:15:31.3365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bSyZDDLmsGMNbk5Pd8HDNKKjhTqqwdOeOAQtli/ohb0sqDsw5uOpAf50yVAOhWcSp4VsnK6dvE4EOrdo0rQb2tIbYBA3+4prIzaYDjyMP6iK9QpCSKWG8pLeKQy/vOA9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5m0SkH0BMQIzJ0KpG+5mIb06oUWHjpBOETiwrKzxlE=;
 b=b98AeOuNXjvuwXXDsRPeBN3EHp+spiqvgZMM0mYsNP5a9ENStej+vsFruL1psF1/GkpsHfRiQ5K1+8ky5QL+vXKHydt2G4fjQ9SnbO5gqXR+ljNRXjcYcofpKaHWcwG543UhnY5OHR9CheEVgF10vPD1Ke3BaLakIukC8TtI1+o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=b98AeOuN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 00/11] add CPE identifiers for pkg-stats
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

RnJvbTogU2ViYXN0aWVuIEd1aWxsYXVtZSA8c2ViYXN0aWVuLmd1aWxsYXVtZUB2ZW5kZWVjb25j
ZXB0LmNvbT4KCkhpIFRob21hcywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkkgdGFnZ2VkIHRo
ZSBzZXJpZXMgZm9yIDIwMjUuMDIueCBiZWNhdXNlIEkgaGFkIGFscmVhZHkgcHJlcGFyZWQgdGhl
CmNvcnJlc3BvbmRpbmcgYmFja3BvcnRzIGZvciB0aGUgTFRTIGJyYW5jaCwgYW5kIEkgd2FudGVk
IHRvIGluZGljYXRlCnRoYXQgdGhlc2UgZml4ZXMgd291bGQgYWxzbyBiZSBuZWVkZWQgdGhlcmUg
b25jZSBhY2NlcHRlZC4gSSBhZ3JlZQp0aGF0IHRoZSBtaXNzaW5nIENQRSBpbmZvcm1hdGlvbiBh
bHNvIGFmZmVjdHMgbWFzdGVyLCBzbyB0aGUgY2hhbmdlcwpzaG91bGQgbmF0dXJhbGx5IGJlIG1l
cmdlZCB0aGVyZSBmaXJzdC4KCkJlc3QgcmVnYXJkcywKU8OpYmFzdGllbgoKClNlYmFzdGllbiBH
dWlsbGF1bWUgKDExKToKICBwYWNrYWdlL2dhd2s6IGFkZCBDUEUKICBwYWNrYWdlL2djYy9nY2Mt
aW5pdGlhbC9nY2MtaW5pdGlhbDogYWRkIENQRQogIHBhY2thZ2UvaHRvcDogYWRkIENQRQogIHBh
Y2thZ2Uva2JkOiBhZGQgQ1BFCiAgcGFja2FnZS9tNDogYWRkIENQRQogIHBhY2thZ2UvbmFubzog
YWRkIENQRQogIHBhY2thZ2UvcGF0Y2hlbGY6IGFkZCBDUEUKICBwYWNrYWdlL3F0Ni9xdDZkZWNs
YXJhdGl2ZTogYWRkIENQRQogIHBhY2thZ2UvcXQ2L3F0NnN2ZzogYWRkIENQRQogIHBhY2thZ2Uv
c2VhdGQ6IGFkZCBDUEUKICBwYWNrYWdlL3gxMXI3L3hrZXlib2FyZC1jb25maWc6IGFkZCBDUEUg
ZXhlbXBsZSBvZiBkZXRlY3RlZCBDVkUKICAgIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0
YWlsL0NWRS0yMDEyLTAwNjQKCiBwYWNrYWdlL2dhd2svZ2F3ay5tayAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDEgKwogcGFja2FnZS9nY2MvZ2NjLWluaXRpYWwvZ2NjLWluaXRpYWwu
bWsgICAgICAgICAgICAgfCAzICsrKwogcGFja2FnZS9odG9wL2h0b3AubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAyICstCiBwYWNrYWdlL2tiZC9rYmQubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvbTQvbTQubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiBwYWNrYWdlL25hbm8vbmFuby5tayAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKIHBhY2thZ2UvcGF0Y2hlbGYvcGF0Y2hlbGYu
bWsgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogcGFja2FnZS9xdDYvcXQ2ZGVjbGFyYXRp
dmUvcXQ2ZGVjbGFyYXRpdmUubWsgICAgICAgfCAzICsrLQogcGFja2FnZS9xdDYvcXQ2c3ZnL3F0
NnN2Zy5tayAgICAgICAgICAgICAgICAgICAgICAgfCAzICsrKwogcGFja2FnZS9zZWF0ZC9zZWF0
ZC5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKIHBhY2thZ2UveDExcjcveGtl
eWJvYXJkLWNvbmZpZy94a2V5Ym9hcmQtY29uZmlnLm1rIHwgMiArKwogMTEgZmlsZXMgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjQ3LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
