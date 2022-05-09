Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEABC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 09:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2723403CA;
	Mon,  9 May 2022 09:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScweTE0Kirit; Mon,  9 May 2022 09:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B194028D;
	Mon,  9 May 2022 09:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA5CB1BF3AF
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 09:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D873F400C1
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyKra-KgpJKe for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 09:22:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A97E94042B
 for <buildroot@buildroot.org>; Mon,  9 May 2022 09:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lChLOQi7L4aQ6CM9iJcEK0wJn3IY0OWXjGkwCW+LFZEA8m+C1MuPbDy63chrhYrmKZJm5/EoPhjapbvkDrHvpF6UftEEckidyimDqR3XrS2PBv98EwgjIgHeaa7w9kxiWzvhtY/luJVd4KlHWJudF1m6ukc6exBYqVnsgLY7jIUsARp2W1VCkZY7/oxKK87JqSM0vd2rqn6eaeRoZua7sTvVNhQPJldZGpUKen4wMKCBtvFMuB4molzwUwewiyBUswIEgFjkjhKLdhC9rLF95hkHKoT5YAMwbTtLF0iuv0C6a1oAXhrAm6XEQ9ZvK/CVbClc8/OKFoZIZ3ThaxrHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwEK8vQNF6FOX+xlhH8a+nmDiaSRPqwI1SXFLvW25Z0=;
 b=Xtr4vZICqjMMiu20JWpqSEK2sKk4pocHZvGlF1u8DquQ1RxHFgg/khP1KCiMNjQMp9ouQDDQKTimMvwqaA8jIsNfMK4gFwlvjeXqC5pJuDOoAboBow5BagYKNqSYOjTyVWmixlj+RKwe2rcZDKXQ6tMYWI+vg/4ZeMmzV2NgK5wDcZcGziD46X1Wq4/9SgoRH085t50+KI5+3+eEhyeGjoxUiwAaey41g3Hr04jtLzvAuTkhswCdLUqsUIdzW/7qaR7xIuqFdznBuZKNTEVaqyjgtMmOvArs6hNG8aV2e6bChB4BIIIX8svYwIGQyWrfure4sy6nWKpnUcBqnJiCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwEK8vQNF6FOX+xlhH8a+nmDiaSRPqwI1SXFLvW25Z0=;
 b=LPOxupW2IOR3nZPVj26fDLVZcFjNs9gxx9RaO+Q5gqR9lTiBKpYooPiIJVCi1fCmOVHcFXiFCcDaFrC+3Z1psri1sfXJhl81Z37+ofBFzt1j5Fy1golx8llvPaG+SvzSNpH1YjN9BCXHI2Ph3uCFo/PkGklvPf/Oe/OHDqJDxUY=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5130.namprd02.prod.outlook.com (2603:10b6:5:47::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 09:22:47 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 09:22:47 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIA==
Date: Mon, 9 May 2022 09:22:47 +0000
Message-ID: <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
In-Reply-To: <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e94f78a3-a085-43bb-ee32-08da319d7b26
x-ms-traffictypediagnostic: DM6PR02MB5130:EE_
x-microsoft-antispam-prvs: <DM6PR02MB5130D3E8579A1C181166A3B2D7C69@DM6PR02MB5130.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4jDJGq/z8ZqDcSZILVb4f3MJ2lH88C0UAwQHSqslTAbBqgp7uVLDMyXSdSE3UcYxowmmxOjI3amAW0tyESI7/TMxnMuirv/5t3rD6Nm5jvUZ5FE7Mub5t35F6EkSWyVAcrbTsvOf/Xd0fsa5oSrP/UT4ORp1SbXWGiPWUtwOHhSf17Sx1OyfZFv6JSZKLGWExVT+vQxrbkR5fh+SfUmkXGcA50kkh8A1y88TB393vmC7DT60mF11F5ENo3EtmsVun/A6IyrdO+pQXELdJPoIWDCOXONxe2NSV5tWgUdGCr91gJ4GC8YWd3Fv5buIfGBWAFg6RYKsFZqddGWiK5KDuDon/XphyE+DxBadSimEX1Nx0Ih47sdwn4BX8zfMDIT3wh6Jq27Po00DUovNDAP2AF3sOkFhU1lXnwXK7A+dbAVkCeFkv8OuvzSTbjNnL5H3Ed8WfNokFxYg6wYDM5t2Hfbnafu+vDlzYodPNZt8wlwhRelwwJw3ye0U+Rrsmpm/Zs0cSDAvuz67gkwyu7Xl3Wy4WZSI0w9ex0I9SO8a8FM6qY2ciOI6egCvLlHKoZsVIYqUcC1zoC5jjJbv8HvumhbF4QeQcG3cd3mlDjxMAjRTu38KFitJJgzivMYE9RSnraxIZjGS24ksmRyqfFdQTqMZ095stUw1GFiYBBHmQGqNWD5SwileVPMRPpxuG0BlZZwW4ySXmPTeqhYUFO8uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(55016003)(83380400001)(4744005)(52536014)(8936002)(33656002)(110136005)(66446008)(76116006)(66946007)(66556008)(54906003)(66476007)(8676002)(64756008)(4326008)(38100700002)(38070700005)(9686003)(71200400001)(508600001)(2906002)(5660300002)(86362001)(186003)(6506007)(316002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm41dE1Yc0JMdVFvQTJDRGZrU28xT20zUU9pd1ZxTTJkSzhPS1gyaFJVcVZX?=
 =?utf-8?B?VGhhMTlrM2lPQnh4eDloN0lYWXRBQ1lDdGVaQ2g4OUI4WTdOaUc4OEJtQTk5?=
 =?utf-8?B?elhiTFlrK1JxeGpOeDNOTFpPRzA4blBkTDVnZmtyVzBVbnU0S2hNWHpGYVlh?=
 =?utf-8?B?aGpBWUl4YitMUkVIblZJWGNhbHpkeFRoMHR1QjRQUDh0NVJOWDNmdzUxVjRT?=
 =?utf-8?B?dFMvT0lOQlVVVlhHWGt0bkNhTlRRdjg0dzhRMURIN2tYSEJzSEQyZHNsVnRi?=
 =?utf-8?B?VVFDQ3NUZUc3N2ZhRm1GdUt5Ujd2ZDlvSlI1SmFjMXdHMkRNYitFTXRWcklY?=
 =?utf-8?B?Zjd0THFWRjd3WmlyYUJyNEFxeEp3bzhuVnd6dll6M1BrTi9ZQWJpWWZIT213?=
 =?utf-8?B?b2JZaEhJUlFvTGZrSU5Ia2ZJSzVHM0pUdHVLcWZVa2JsdE93N1lxOTdETEZk?=
 =?utf-8?B?TG9SUlVHaVA4eW5zbHV6SzV5aXNHcEJhNDJMdmxjWEt6d0dVK2tTaU1sUE5W?=
 =?utf-8?B?YUxVWUw4VUJraHNrSUxTZDBPSEpQSkdVMU12aUp5bkhUb2x3MjRvMzc5bjlk?=
 =?utf-8?B?V1BnTkdlZWpaVUNvTzlKWldBcjNWTGRadVlaU2YzTTZkcVhVZE1VKzQyM0Fv?=
 =?utf-8?B?bHpLSTIzcmNsT3laYXNKa2UrS3dBTWpQSmpnbFYwckM3VEtzVDJWSDZIT015?=
 =?utf-8?B?RUR2cTFnUlJRV05FZ1lnTi9mdG81Z0o1Y3BTTXdqenA5d2cvVFgrWHVUd2kv?=
 =?utf-8?B?MVZsaGZWanJNMzlwL2tRT2xVa216Qk1BTVJzNkdOSGwxTkVuNkszTEVVQWxB?=
 =?utf-8?B?ejlaa0pyenVBUVUwa210SWlkMVU1c21VSE9kamRPMHI5MzFLdXJPU2xJaDVM?=
 =?utf-8?B?bnhyNnF3TzBRYUZ4QzUxWXY0UTljTzdXVmhyRytTUm9lblVqaEprU2xUaHV4?=
 =?utf-8?B?SkFTSW4zRFhLbjlKeUxGNmlyeVZBTk9hSzgxT2NVZGRxU2t3bHRHbGQ4YytU?=
 =?utf-8?B?UDJDWlBVZ2FZNVN3QnpVdG95OGlLNmZ6ZjErN0gvZjlaczZmTGpmNC81dXZN?=
 =?utf-8?B?S01hdVZobnU4UmZGbHVtWEV0MUp1T1E0TjkxY1h2bXhYNHBvUGdVYzcwZnlv?=
 =?utf-8?B?VnhqYjUvckM0U1FLQU5WSmNhVnNPQlhnbjdFd3RuWFlyVW1sKzJhSWtNMW5x?=
 =?utf-8?B?bURwc3MwQXNDdW56QmtNQjdKQ25pSE0zTzAwZkkycVk3MkpFYTFNeHh4ZHZG?=
 =?utf-8?B?aWhFMEtuOUdLYlN0UHRkQXVSWHV1MmhmVlFPS2N3dGxqd1FvejF6NmRtaHhG?=
 =?utf-8?B?ZDZCakhZNmlmYUdUZUU5bFJKN2lWUnM3MkFtM0xXMkRLREY4NTZYZVV2WXFD?=
 =?utf-8?B?N0I2b2dEbGpZZUJHMkR1NmhqQVNvUzZtdmlzUmJvOEhpRGJ0ZmRNZ3ZGWGRI?=
 =?utf-8?B?SW13Qm5uTFF3cTlpY3VYSHNjTStuKzBMSzdBSEwyNWFET1FIMFE5Y1ZPalp1?=
 =?utf-8?B?anVVdXRLeGY0TlRjSEZRVkdqMWNpRVNvcmNNaG5nNllVSkorb0Y2dm14WnFT?=
 =?utf-8?B?TnZvQkQ2T0k0L0FhQUFPcEcxTUdBVWREMG9DUjJCcjBONmgyNDl3NURsSVZN?=
 =?utf-8?B?UnB0WnB1UVprdDRtajhhVEU4MGcvVk9sTEJubmNXMS93MWg5UERxVEg0WW8y?=
 =?utf-8?B?cUdPS3V3NmkzdUNiYUNuR3hwNWREVmU4NXFqV3hDaXVXWGduY2lTaGRDekNR?=
 =?utf-8?B?Z2ZRdnlEdzJyZHA4UEdBK1lIRGRINE10YWl1TEVWTHRCUUJuaUJSRTZ0RExI?=
 =?utf-8?B?KytkWFE0amVqcmJySmkwV1JqZUUvemFPczlCeGRXYzUwSEJxWnppRmlYK3hK?=
 =?utf-8?B?VDNsOVYweGpwcGlyNGNvc0xDQWtqeHJPT2hwcjZ5L3YrVG9WT1F3UjdUY3gy?=
 =?utf-8?B?VVVsZ05LMUJjWXJJbkFDSVdSMHlqMExXOU5kcHg4MlVVdC9tMmRPb1FzYVZY?=
 =?utf-8?B?bVg4ZC9pN0hEd3hmd2NQakk3cG44VEQ3M3VwZUJMalRjaHZBK3BVM0dQb01X?=
 =?utf-8?B?RnF3UnFZSm0wMjNxTXZNeEp1MGptNWUxSnY3WEZSVHJOMjBVYVgwOVhTVDFK?=
 =?utf-8?B?WEMweU1hRllXSFpVeWk3ZTEzK0pHUy9TN0xzb3JXQnRPSk5KV3FZTUhOb2Yy?=
 =?utf-8?B?cmhWQktFMVhRMGR2RHVnai9nZHBWZ29RUmd1VFByN1dvRHgvU290ZmpiTysr?=
 =?utf-8?B?d1FzdDBLQ1dDTFB4bEMxRlJTZlhFYUtsd0JsNFNqNnF6YzJndzhuUGEwZHlY?=
 =?utf-8?B?Rnd3VEFNU1U5MERXNUsyNWtmUkIyWEZNOHFWOVplcStSRlRHUWFOcEhnMHgw?=
 =?utf-8?Q?uxd2X5nntaIIjmz0Dcf9mjwfDtaXQ/azH7mLN?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94f78a3-a085-43bb-ee32-08da319d7b26
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 09:22:47.1809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8NqwyMdPXfK3wJ1yGb16Eu8pNPdQXtnFA2/HNFLtEBrRwgxiT9ukTCKn8FiCZLvhbH6wAHb0tauP0bGdw9iig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5130
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wesley,

> U-Boot 2022.01 (May 09 2022 - 09:51:43 +0100)

> CPU:   ZynqMP
>Silicon: v3
> PMUFW no permission to change config object Detected name: zynqmp-smk-k26-xcl2g-rev1-sck-kv-g-rev1

I am working on this in parallel with you.  I believe your remaining issue is due to the pmu firmware.

I was not aware that we had changed the build options for the pmu firmware for kria, so using a standard zynqmp pmu firmware will fail.

This is what I currently have included as it is downloading a pre-build standard zynqmp pmu firmware.

Instead, if you take the pmu firmware from petalinux, convert it to a bin using objcopy and place this pmufw.bin in your buildroot dl/uboot directory, 
this will enable the correct pmufw getting included with your spl in your boot.bin generation.

Could you give this a try and let me know how you progress?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
