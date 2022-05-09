Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80FCC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 13:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B6581BFA;
	Mon,  9 May 2022 13:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hfi5IB18Nl9O; Mon,  9 May 2022 13:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87548813B1;
	Mon,  9 May 2022 13:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 866E31BF370
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 13:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7472460BE9
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 13:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isxzopgLsCGI for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 13:46:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5623600C7
 for <buildroot@buildroot.org>; Mon,  9 May 2022 13:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD0AevypSP8sUThyZBXYZPkcOR79BVxJ7o9k5YTid05FbNMdmjBEtLi/+mUs1JVrP7PHrWUUD+P/g7bOQjp02vwTKpzi5LAK+a8c6BAT5MR69T1hLyPbTeQPCBWudBl7dmdBTNthRhcBVCpCFbytAGNTo/QMzs12EGcBklPZndY2Oqq1RmiY7gYpAX1CttOMyn8/hPHcFVay6YIRoNAziNiALjUYqEIT6pUhKhxWpFE1SiCBxbUSkpJe7LOuPpbi1G9KN9fr24Clw5ZMDY7RgAefwQUzADdbuFEH9egbB67tj5PhCVYeqQP49MknqwO4z++8Q5PD2mY5h+zaNwnHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/KEGJLUpRrRkgiyc7Vik2NV9CDsmGXFeMCb/a0jl6w=;
 b=NejS/dCNTcIaTW80mlgA3xLoO7pWNGjANBLp9B/eltT7wnfhko+zu6MX1zJQg96M2RaF/lHIwuooAVNx4WP6YDxeO1D8DJoqoTAbxo/8DnTCgENLg4bLX6uJ/4Md84v02V2l0ilROQXcP7OdkZNt9czuxs9wyfW5Lzdo1roaN3IKC++h86whPWDs4V/bXrHT0bqncbJioKIH6H3ywabGOlffJMmBJIKfMJkGFAgHJw+dNjiR3zlP8l68S58PjSoLvrAqiXy0Jaooa0dFifmsQkrXODiGIrG8/79Gm9l+9ciZYk5AeR5e+DOB2Sj/bD1Ugnw9E9vfOOCYb3tmDtBYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/KEGJLUpRrRkgiyc7Vik2NV9CDsmGXFeMCb/a0jl6w=;
 b=Di9Uu6sRq+NKh/22UFewwZnLATKDLKsLadhscv1KKzWSbYOVPRbu6iLKfxdLTMGtZWdntzHXUkie9/Nj3q01lC8eEq2mklfp2Oo6paDRKFUGWuf+2NMpMn55U0CMUFqqaUgGEdyKmIP1f8Hyv4lEhTVqEns0qKRAbdRczjUENqA=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN6PR02MB2515.namprd02.prod.outlook.com (2603:10b6:404:50::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 13:46:01 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:46:01 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIIAAGo8AgAABPJCAAAWyAIAAKG0w
Date: Mon, 9 May 2022 13:46:00 +0000
Message-ID: <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
 <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
In-Reply-To: <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52e87b98-bdd4-41ef-67de-08da31c24102
x-ms-traffictypediagnostic: BN6PR02MB2515:EE_
x-microsoft-antispam-prvs: <BN6PR02MB25152B19D81BE39A0C0F8C68D7C69@BN6PR02MB2515.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GRwPVKOqyXwH/z1h119fxGO5M8S4/Rd2kayc8RtOFKPqzYVe8MqQJidxbhKlTFJOWIb+isec30mK3sXuzCdk7wM8Oloqi0s6ZOj4T+jKQgSdDr/poKtV44RejxyYrCQTid4H++3rjATFnPzuYZzYSCfwpyqC7QlnhiV84VH9Ot96kpHKdVXRDAQC1XvAddm9lf2QERsY13pVkPPps8LELalwFrDik5ve9v+JbO9xGgkjZqo5qiUcRt06H4/IKLHYNtS8jxVfAmW/PtkltGHL9mXnbhTBsy3ccl2kJSq5fWT2nK2FJXXOeVVLN9LC+keVHCqWy4JXVeh7d2GOPkE8VFAdDAQ717ZHj+r4JtUSgoyK1iatPyei7mvMLpQGzNlxwig9xaCl9YbHvmv+KeM67+zugoiF+q4u4wZ1qXNGKCM2b8TMeu4r15OqcaLHEKVbWOYKpWyM2DDrgU/9BpgylkRRLPJ5wmdagsmB60tkpeUxW/jX0a3Yj57jb5OVu1bEEafwj7KQvmeKvOTJR++YBym+Bm33y165rv8mQikEw0dNjGdNViF2B2J7jE6Ihom48K5/b2/OwGwIlyItMzS9bjvr0/8IB0C6hlT72pg5eIJ36lfDVvkhmWYb6INczBSoyQFU/ylv0cyFZ/2KLSL9cN8cEMBZi53wAOBkOqCir3l5EHp/X+3BinQRsgpl+NUd/ZiX8vNmK+z3Qcpwopnzc128ZoKDN4JQQkDySoGsCyZlocQ+Va19HVz78irp4nvrw8/LxBqb4ZMnaAGYWYYslbTRlCw8txq4HJjNfTbe16c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(4326008)(52536014)(66446008)(64756008)(66946007)(54906003)(8936002)(110136005)(76116006)(66476007)(316002)(8676002)(86362001)(508600001)(122000001)(9686003)(6506007)(7696005)(71200400001)(33656002)(38100700002)(38070700005)(2906002)(966005)(55016003)(186003)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmc3M2o0b2I3SWNncFBXOEtSQVBlcEI5MklqQ1orbnQydlIwYlJCbzc3NlFG?=
 =?utf-8?B?dUJMVzhzNkh2dHQ5UWlRYVAvbG95V2tPUjk3aW84SVlFZThmaUxoc1ZTbEo3?=
 =?utf-8?B?RUNaOWt0QWZtV2ZkZHdhbVhmY01yWG9rbWV3RFZrRUUzaHM1VldLVXBSNzZ3?=
 =?utf-8?B?VW5oaHZjanBaY3hBR3g1UHdxUXpndjZ5SnVsSXZLVXRydlJ5Njl0WGtjNGFP?=
 =?utf-8?B?K1NKbmVHVGh5SVBpM3AxY3lWTXoyYmtBcVZlWnZYUHEyUldCWmlNOGtvZTJQ?=
 =?utf-8?B?dGkzOUJnNm5YMzhzUTczM2E2enVGNGt6Y01DYVZWdmhzbzY0cWFvVUJxeFhP?=
 =?utf-8?B?OUtEK2lyNTFScXdyODZ5WURTMHdRQmRtTmEybzRVRHlzNWVkNVVEWmhTZ1FX?=
 =?utf-8?B?L2c2eVhCWERkUis1OCtSNWowa1FLd0ZRcGtxQVdKbnIzQ1RwVVd6K1hzYU9i?=
 =?utf-8?B?VnBldFpRbDVETG5aM2tDQXp1bzI4eVQ4blFBaFFtRXozdmR2RWU2aXpBZ0hm?=
 =?utf-8?B?KzhrWGFRakl5M0wreTJqcStBdnkyV1FMejdxVUVTemhobkJybWdwR2dqQ3NY?=
 =?utf-8?B?NEFhUzV0TW1IaTgwOW5mdlRsVWN2TE1Rd0kyaHcraE9HRnNMR0VzRDdKaWIv?=
 =?utf-8?B?bDQyQ2lYU09wM0xsMTQyMFpsdEt2TElOSnZIUDJlQTV0SGRFNXM1SitBVVhS?=
 =?utf-8?B?bnNkVnBMRmp3SkVqTUJnWWdVOGF5S1ZydzE0aHphYzAwYVRub3paRWNOL1Zl?=
 =?utf-8?B?a0tiNnh5Y0NNVnVRSlkxNU1QRnkyQ01ILzh6elJ5SVI1L3R5SjFneGlFYmpm?=
 =?utf-8?B?dnBJR3VjQURCV0MyMWpRTHBhRktXNHVyY1lXUU1rWFgzK3M3QmJwY0Z4eWxS?=
 =?utf-8?B?dEtjR1EySzlYSDZhR2tQYmxXRDFISHI5SE1JWGpaMFV6d0JDZU5XUjBFVmtr?=
 =?utf-8?B?cjI5Y2FIMHhvZFlncENxKysvOERrUHM4YXNXRjBSdEJRWWhuVjc4dkRBQkV5?=
 =?utf-8?B?Qi84YTNFVkgyRWpyL0RES2tvYWh2WU9hbDM1aGIwdExRVm4rTVJXSkw4MG9F?=
 =?utf-8?B?bm0yZi9FSThpOEs1ZmhQZzl2d0tQZWkrLzZSR1JjL05aWHRnVHZBN1EwT05B?=
 =?utf-8?B?eUFiQlRrYzlXUE8vMHQyR0hkaFFoS3p1UzhUWEF2ZWpneHcrbzlxQzN3Smxh?=
 =?utf-8?B?K2trVTVOSGVydE5EY1pPc1ZEUmh4WGN0bi9sUytwWm1aV0xDa2lBQ3dVOGhx?=
 =?utf-8?B?RktsQng2bm44ZEtjUWJwY2RoMmJnVUg0ZVlhVG5EQkxpM0gyKzV0ZHpMWG1o?=
 =?utf-8?B?UGY1YUhxdnYrYUZEWXFGdG5Ddy81ck50cE5sbDF1WWoxRWxnQlE5bVVUNzNU?=
 =?utf-8?B?MWRXOFNjOHRFb2dnaE00QWNxODZSNVRPenZWY1I0TjlKOGs3YnBYQTM4RlVD?=
 =?utf-8?B?WFhiZDB2QXFwSXRnYkViRjlNODdlb1JhNWE2NE1INldUcHVKbHJmRXUxOUxj?=
 =?utf-8?B?bnphSFF5RlVvM0RaWUhjOXVyTjRQWFN3UGtUaEpka1dnMXhFanFqdzRZLyth?=
 =?utf-8?B?ajhOVEl0UU4rOStlMnFUUEgxVTFZdUN2aytWRlRmTStkT2lxdFY4UjVxcnZT?=
 =?utf-8?B?ZFVvYVVVckN4NE9hcG1pbmpEYk9lSXhzOUJHaUpWelBmd2Y4RHE5Wmo3UkR2?=
 =?utf-8?B?SHY4YUNaT24vR21iM240OFZVQ2F0TGpYdVBDRHNqNjFHNGJnR3JDT2c3Tzlo?=
 =?utf-8?B?WitOWGFKWGsrUFBlQmg5RjVvcVhHNXYwWDRQVjdFQkFXTGIveWNIc01EdE13?=
 =?utf-8?B?Y1pTeHYwN2dWczB5VHdqU1lFN2FNaFpjQ2x3M012WWRjRkJJTndLWWZJdVQ5?=
 =?utf-8?B?b3owVFRvV0VIaDI0a3FNdm5MT3J3Vm5UVU90cmFnclRLTFFCR2h1dzJqS0ht?=
 =?utf-8?B?NE5wek1NaHlwTy9nMHVYdk9uUzRFR09XYmRiSzN3L1daVXVtVkNqR0F0L21H?=
 =?utf-8?B?WWVKbTNXdVJUTU45VWcxZTdFTi9VZFBPMUlSV0JZWUZUU3Y5Z1orQWR3a2Q3?=
 =?utf-8?B?NVJNNVEzaGJKaG1hMjRBUEJQMjVLWFZsRDU5L3BwSk5sZUxGYURXS0xDeUFh?=
 =?utf-8?B?L0tlWS82N3A3eitBeDVPM0N0VEp4UjlzTFV2U1Vremd3ZE5ZajgyVzdtbE9V?=
 =?utf-8?B?U2ljdHVGRU45MEw0ZHV0d2hiU21oRnBSWURwRlhBRXRVZHEvcEpPOUlNYVpa?=
 =?utf-8?B?NlFJaFJNcStFL1h6YkFTbnpDRlNHVDNlRzE0Nk4wd2xFeURFTXhrUXpud1Ey?=
 =?utf-8?B?K3RSMktPdDNOcEp3L3FnenlBR0NUcDFvRFpFckx1S3RIdGM2Y3N5Z3JkT1Vo?=
 =?utf-8?Q?1rRLpeVTqRrJZmDa5Md1nfUGKQYvVHijjxaVAl5u6W1e3?=
x-ms-exchange-antispam-messagedata-1: npIjvXDwDxJk3A==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e87b98-bdd4-41ef-67de-08da31c24102
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 13:46:01.0283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLG2wueDZXDGcSAgxp7csKe+vCX0k2M8P/aIV9d9kuyyJNeK9u2n37kYnC6h6bdCaxdYQAID7Od5UYKiUE5V3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2515
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

> When I was using the pre-loaded QSPI bootloader to boot my Linux image I had to enable some peripherals in the Linux device tree to get Linux to start correctly (e.g. disabling write protection on sdhci1 and enabling the phy) Are any changed like that going to be required in the u-boot device trees?

Could you try replacing your u-boot board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c file with the original commit below?

https://github.com/u-boot/u-boot/commit/02ac1553b8329f866c1761f5d9fe66972817782c

Please let me know if this version of the file resolves your SD card issue.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
