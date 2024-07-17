Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE89C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B9C40EED;
	Wed, 17 Jul 2024 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgwnYeqNcO6w; Wed, 17 Jul 2024 21:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC5E400F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EC5E400F9;
	Wed, 17 Jul 2024 21:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C15B1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78ED8402C4
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gycQjF84k_Sg for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::2;
 helo=bn8pr05cu002.outbound.protection.outlook.com;
 envelope-from=murali.karicheri@sandc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD979402CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD979402CC
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD979402CC
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzDJV5/M5FIsivxGLLk7785vUIIdyMWtfaxLqdzdkKeM1CxTqApnHCm/UH7GcxOE0d4gKjPsQziYDNvhyuEvwnleoVek5Nirlr1Guf4uB/1p+qzNhCe+83vA+9dvK0EBTigenWGXMGGpbhhv29j52hn/7Ln6V9aiD4dUanCampU/Kp5LbAd1rqMrQqvtjKQ8yuM4WJpd6PcrVyPqhuZ60IhwS16e+Md6r0uLgo1UjG1U8dd5jXCwbrMdtK2+67pnLCKUM78WSDHm6j0JgZvTrZD2Q/AQHdhdcim5DtTTnY3DfS9tBcCqtb4BS1HCrHtS238XLxRsdSgk5v4XESwGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSfoHZF/AGrRsJf9p4I+q15Xoz+d7dQP/9wmdD2sJSs=;
 b=euYmLPlwhMvEK/Gsx2efFxurmbqadB6R2qI36Su5kUhes7EgpqjVhKcOQNC6mXLJm3FCscg6jctewmN38uY1hbZeP6VKpu6ocUGAMWk+1kuxqpQ53eh+kD3Vbc1LT1N1d6OzwU+9S/emrCjfW29A9ihffiLMr06ahoTvWSlJ4LXnOyoi1ot1CJfxZ5M0B7neOCwOirLNobfpxbfYP5qaBKqutFE3rE7nlybhucRbIaRaXVXd2Pev1x3KEutmvfHiP12f1Y6o6dAVQ+eXeOP6cOaHiJMGk49fPrUzFqfySks/Rl8CyE8u8ss+iZ4l3iYdVFcatlOTHBcaVk+F04tJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
Received: from DM4PR02MB9216.namprd02.prod.outlook.com (2603:10b6:8:104::13)
 by DS0PR02MB10638.namprd02.prod.outlook.com (2603:10b6:8:1f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 17 Jul
 2024 21:45:30 +0000
Received: from DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023]) by DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023%4]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 21:45:29 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Year 2038 time util issue - Build failure in 2024.02.x
Thread-Index: AdrYdRrLI2+dOxCgSY+eBBejGyACkQAHKhww
Date: Wed, 17 Jul 2024 21:45:29 +0000
Message-ID: <DM4PR02MB9216C52F14C3BFFABA41ABE08AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
In-Reply-To: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB9216:EE_|DS0PR02MB10638:EE_
x-ms-office365-filtering-correlation-id: 605cdb12-da9a-42e2-5fc1-08dca6a9c712
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vLnLIV0suvWcFkLsdxYhH70AdWXopkpfqcgFfNJXz6hZPNcARc+d+kmAa/tn?=
 =?us-ascii?Q?XPUyG7GTIF7DXFzLARHE+R3+o9K/+UeGheANmR7Rv1mrRvd/EHi2jh+2UsWv?=
 =?us-ascii?Q?zoQqGWFh0hNBWWTTJ8I3T8XlxqD3cA1xckyMTh6AeQt+fPfYr1rNr2lwuuFc?=
 =?us-ascii?Q?WwAEVrFNZu+zar3NUhyfKQFQmYGwVMgCUYFWR7Iek7wp1XtutvRKrTAfa3S7?=
 =?us-ascii?Q?S8NKq6uxtq0WYTZqdOhNbSYpTUEUjZ8DzpAtcsbdifxrUjwDlOMTsYFnxd5u?=
 =?us-ascii?Q?LNN31WcPdgesRNGkGzm9OfKjf/ySBhHNPOCqhREorrM5HWiCAlHwrvMxJz5V?=
 =?us-ascii?Q?9FBOyr2NoJFbedF3TkasNJg86Jp/wnHwmVcxEMLeYJpKZD9V0RyfW67ZljS+?=
 =?us-ascii?Q?IG1MxDpSYHE8RxuVli5m1FoLCNKPvOICCW/sjhC1NbJPZQQAgBvceJP4w/dI?=
 =?us-ascii?Q?T0MuZ8FZ4300Qd1dQ6wFK4OV8i0bj8msjJmOhgOCTDmGhFu3kEDj91Ry2Pda?=
 =?us-ascii?Q?PbzaWexLIyLj5ycIs4UhRyiSCswDGY9DTJreXEAneRhYXfLNg62OZi8Vlob5?=
 =?us-ascii?Q?iO3/xkIDGQRx9UhzW+4ajVv6K0DvoETjdFjqwPsI8GhOxc0Xi/l2bOEq7tAs?=
 =?us-ascii?Q?wccn/iSlnhi8IbkR12B57TpDUtcGXETQFTK4jEFvGzdpUyumg0JSHuD91BZ0?=
 =?us-ascii?Q?G58j2xiqc6dMENUgSYBYlwvxmLYc/W7hQ+1PyYu2ZDG7p6ZGQyhobMZTFMcw?=
 =?us-ascii?Q?9gZWSkklAmNDWgSkt7yEv80I2L/pqPoGVKSSOsW43sejvrhgpoT55A3Roa8a?=
 =?us-ascii?Q?pdRd9jlI6ha71AsWm4mqoUuZ1zB6ra1/KBt7kD4C42LB3khbo985f9fPApFP?=
 =?us-ascii?Q?+werxsUXdXjQnahWiLXa2f27glDFLElyaYWVFwskPa+xFONgaG3LfOB5g1Jc?=
 =?us-ascii?Q?5evjDT+H12aPPn3JVrAHIfmkXks33Lm3vi6uEjDhRKBCHLG3zwjkK7TJld3q?=
 =?us-ascii?Q?n57XGfGPnZP0f5/pC+iqmHy9MizwwL2heJxaMQxbJ/PzjkJFbhO3gJEMJSUx?=
 =?us-ascii?Q?tD56GLZfgtZN7hPuzX1o3lEa5WyJ+W7tHhRC5vPzJHBWZUtbQ98J+Iodsxl7?=
 =?us-ascii?Q?rt94Oh6COUIoHINeIX1uV6WAKboZbCla7fOKTNDmMc2FwonfOCn1JRk+AN0C?=
 =?us-ascii?Q?YEYpaEvAtGMuDcQQtJi074IA/LnurBz/qzpQqSxPV7rLakpBpHUpaLmy3tXK?=
 =?us-ascii?Q?vNF/2Of073WgFkiZ9necXalX56PziHGj1yu3WOcq7Xt+W1tcmX8JBbfHiDFk?=
 =?us-ascii?Q?nC/69b3uVoB4JxHHix6+gf/+rzCHknol2aTa8MzQ+ccE1AXQG8wsJplwtA5n?=
 =?us-ascii?Q?MO+eYgTAiZND5fNtM1w2v+17mBnKSzjmGhBdgu1Z/AVvbSLEqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR02MB9216.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/D4Hc+hr5LL1Y/rPuMyqcPmJZ7Oa0liqBIXClIl53+DeRPQ2t+H3y+IwpRQS?=
 =?us-ascii?Q?cCBngsyXPNRO5bbYMObD3TPKNWBxNJPKYOQNJKSDtxjBh3tW2YFm4EIXBsYD?=
 =?us-ascii?Q?x4m7dYnoUIm2yF33Za1nsGST8dA/qDLF31saxncygI6QI75h0r48iEQF8Kvs?=
 =?us-ascii?Q?mNe4nx7xOP8y1crdyupwCimOhl6iJRxo2wM9rwkHjYE+Gs+th4zGBls6Dq/+?=
 =?us-ascii?Q?+Ok4yxjkM64xkEi4btohmz0u9EaSeRRIgLK3HgThINx4SdVoobx1RUCkZudf?=
 =?us-ascii?Q?sZRhLVrZ01UgGZjtwtW8Dma/A5wRhz7ZbBsjrpGsfP3XACByRiUrQ9BfKRqW?=
 =?us-ascii?Q?JFDn8aLdNINuZwFbe87hhAKGlszs60TETHYf9ndhi/9X83lOtaSn/rT2mrSH?=
 =?us-ascii?Q?q+LdcfY071PoM0sfoLTgbfSkNpMIHYK5geqSFUuBJwJODKW9zlvoUxwC3Z+t?=
 =?us-ascii?Q?d64r7hJl27XKQvXqYP0oF6WPBvPaX3CBY8e9ByF3yDmMP+OeJ528qXP+jZtm?=
 =?us-ascii?Q?Bg5JgxcYuP0NQP/juM0aEhAdbu8tciMfi1tKeRXfLtzc+ztscl2PeRGiNHR7?=
 =?us-ascii?Q?PS3q2RvxE7xGx1fHemP15kfFX9eB9iSMBWEkB/lGkJTct10YT2NgTdgLWJGW?=
 =?us-ascii?Q?0m2t3RTiiN2r4j5P/91+kLBS2SLG19X17/vLNGefRYkd1oz3bvtrHGymkWGQ?=
 =?us-ascii?Q?JpxzKy28q/Qqv3RudhV0sb9ZcOYtNDxL2cpukoMg5ls5VAZQbGJzLku2C4d6?=
 =?us-ascii?Q?yqt+L2b8zw2R1pM+s32E5KlEh+W/i2TqQMordAUAm8s3tHsvqaa+tTmIK08I?=
 =?us-ascii?Q?X5BMc/Wh9+x7+8hieSP0tmu5zMNkUOpII22mhc3dJOzblGbgDeANujL/Q0Hq?=
 =?us-ascii?Q?g6xVN1W9qAFI/Ot16hy71K9stZJuazCvYPcuvXZPHkVMmj/7qYq8O/wmyWgv?=
 =?us-ascii?Q?f4ANKjmWk4BlwvZwKwotLQPgYMTkGFOfuBXs2exknSUo0SsgZwMFjaLptKuV?=
 =?us-ascii?Q?wlQaAlG5Ytr0Wz/mffqi0DzYh2FKXAomxSkzt0DQhZjvctCQx2A8zwwmaPlr?=
 =?us-ascii?Q?PA44PFtJn5otcp2OWquoE4c0XpqmQi2nyUP3EQyneAgQdJXHQIYWuyTFokrb?=
 =?us-ascii?Q?8P/hgFYs10by4YUXt1NhwgKyW+szXqnPwkjzw07TSANcaN2Haohgwyjk4w1w?=
 =?us-ascii?Q?j35A+gfeyCneOENOXKemngtTRjnGAasOqi/n9tioMV5zm8SQc0J1C4no1NYY?=
 =?us-ascii?Q?1N5Txar5AfCHQMzeIhoLoCB1H6poapKDi1P5H46S8HDSdVnL0Jpx27dxQSvJ?=
 =?us-ascii?Q?H2nw/LGVqblWMN/I0WcgrmJYop26+YdiCDwJHZbr8k/o3/qsy1WSTCIdsQvd?=
 =?us-ascii?Q?aytVa4ZTWklbrxuegz7H4YN0ZbAizI/9deY1d9ITeWo3AFac3RXqPYIo2jHR?=
 =?us-ascii?Q?hpaWftZAMNEAKg1ikUJ6CG3aDDdtBwnTAeemzmwgXSHIFdRC3X8qzqIlBK+q?=
 =?us-ascii?Q?hThkRpmPXjW1JFH7IIdmWXlEAa8LLcDJ9ngMfFyoLyQJ22epyVAY47d1imcQ?=
 =?us-ascii?Q?35WIvMGVI5SXzGfOZG/hY6xtLMS9xNWZh8JRgaXl?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB9216.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605cdb12-da9a-42e2-5fc1-08dca6a9c712
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 21:45:29.8894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmvCvJVpCl1MarlIgtLToB3+a5/8nhb2ObmZKITOGWhC8bhtmVnp8lglVTg00aOK5bhpVisGUq0fa92CPz8hhePGnQIJePGijbPqilhT5oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB10638
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sandc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSfoHZF/AGrRsJf9p4I+q15Xoz+d7dQP/9wmdD2sJSs=;
 b=QpbGl6mqZ8xs9w8UtNDD5WQ2VZ3nvXXrzCK+nHJHzeOokjlHY7wD3MC1CV7RoRwulgFQC4aIXa7zxSEGWMYNcDpCOWuP0+b/X1pw7JCVVQE2mmbqU8/wk1ejxQ7gmpO6WZOL7iApKTmWIKa8ZLOxPskqnUW1pzhdZGSTrzG3HqOCD4AJ81N1iJIHRYiTJXWuFDkT0sX83rYFyZuoUqiEVhurNMbKRoP3opAv11K+c7uVg/K/LvUZo7aTmA3lt5ttkUBfAqky4uDRkDpW6u3DfPyA375sD/Z6/uOmvjLgRyjH9rk1oDx56jXGM2JDMI8M3wlLL8PUb025/UVsXM1Aeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sandc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sandc.com header.i=@sandc.com header.a=rsa-sha256
 header.s=selector1 header.b=QpbGl6mq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandc.com;
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
From: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Reply-To: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

-----Original Message-----
From: Karicheri, Murali
Sent: Wednesday, July 17, 2024 2:19 PM
To: buildroot@buildroot.org
Subject: Year 2038 time util issue - Build failure in 2024.02.x

Hi All,

We were using buildroot version 2023.08 version and encountered a year 2038 crash when using time/date utilities. So, my research found some work done in the recent version of buildroot. Where BR2_TIME_BITS_64=y was added to build with 64bit time field. My board is based on a STM32MP133c SoC and using an external project to build buildroot. So, I have migrated our project to using 2024.02.x version of buildroot and enabled BR2_TIME_BITS_64=y to get the fix for the 2038 issue. But my build fails with the logs below.

Could you help me answer the following questions?
1. Is the Y2038 time issue resolved in buildroot? If not, is there some work, though officially not supported,  I can investigate for a potential solution 2. If it is in fact resolved and expected to work in 2024.02.x, what I might be missing? Is there specific version of the toolchain packages I need to select in the Toolchain configuration and other packages?

libtool: compile:  /src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/./gcc/xgcc -shared-libgcc -B/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/./gcc -nostdinc++ -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/src -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/src/.libs -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/libsupc++/.libs -B/src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/bin/ -B/src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/lib/ -isystem /src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/include -isystem /src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/sys-
 include -D_GNU_SOURCE -D_DEBUG -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -DHAVE_RPC_XDR_H=0 -DHAVE_TIRPC_RPC_XDR_H=0 -I. -I../../../../libsanitizer/sanitizer_common -I.. -I ../../../../libsanitizer/include -I ../../../../libsanitizer -isystem ../../../../libsanitizer/include/system -Wall -W -Wno-unused-parameter -Wwrite-strings -pedantic -Wno-long-long -fPIC -fno-builtin -fno-exceptions -fno-rtti -fomit-frame-pointer -funwind-tables -fvisibility=hidden -Wno-variadic-macros -I../../libstdc++-v3/include -I../../libstdc++-v3/include/arm-buildroot-linux-gnueabihf -I../../../../libsanitizer/../libstdc++-v3/libsupc++ -std=gnu++14 -DSANITIZER_LIBBACKTRACE -DSANITIZER_CP_DEMANGLE -I ../../../../libsanitizer/../libbacktrace -I ../libbacktrace -I ../../../../libsanitizer/../include -include ../../../../libsanitizer/libbacktrace/backtrace-rename.h -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 -Og -g2 -D_GNU_SOURCE -MT sanitizer_pro
 cmaps_common.lo -MD -MP -MF .deps/sanitizer_procmaps_common.Tpo -c ../../../../libsanitizer/sanitizer_common/sanitizer_procmaps_common.cpp -o sanitizer_procmaps_common.o >/dev/null 2>&1 mv -f .deps/sanitizer_linux_libcdep.Tpo .deps/sanitizer_linux_libcdep.Plo mv -f .deps/sanitizer_procmaps_linux.Tpo .deps/sanitizer_procmaps_linux.Plo
mv -f .deps/sanitizer_linux.Tpo .deps/sanitizer_linux.Plo mv -f .deps/sanitizer_printf.Tpo .deps/sanitizer_printf.Plo mv -f .deps/sanitizer_posix.Tpo .deps/sanitizer_posix.Plo mv -f .deps/sanitizer_procmaps_common.Tpo .deps/sanitizer_procmaps_common.Plo
mv -f .deps/sanitizer_posix_libcdep.Tpo .deps/sanitizer_posix_libcdep.Plo
make[6]: *** [Makefile:533: all-recursive] Error 1
make[5]: *** [Makefile:420: all] Error 2
make[4]: *** [Makefile:13138: all-target-libsanitizer] Error 2
make[3]: *** [Makefile:1033: all] Error 2
make[2]: *** [package/pkg-generic.mk:283: /src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/.stamp_built] Error 2
make[1]: *** [Makefile:82: _all] Error 2
make: *** [Makefile:106: /src/linux-bsp-stm32mp133c/output/development/host/bin/arm-none-linux-gnueabihf-gcc] Error 2

Hi Thomas, Florian,

I could see your responses on the webui, but couldn't get them in my inbox. First of al,l thanks for your responses. I have some updates. I will also provide the dotconfg for the failure case. I would provide you a snapshot of the logs several lines before the issue as well. The good news is that I am able to set time beyond 2038 which was crashing earlier. We are not using C++ in our project and could disable it by removing BR2_TOOLCHAIN_BUILDROOT_CXX=y from my defconfig. So the issue happens with CPP part of toolchain.

Murali Karicheri
Software Architect
S&C Electric Company
________________________________
NOTICE OF CONFIDENTIALITY:
This message may contain information that is considered confidential and which may be prohibited from disclosure under applicable law or by contractual agreement. The information is intended solely for the use of the individual or entity named above. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution or use of the information contained in or attached to this message is strictly prohibited. If you have received this email transmission in error, please notify the sender by replying to this email and then delete it from your system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
