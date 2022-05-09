Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D61FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 14:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B91409E2;
	Mon,  9 May 2022 14:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqV_n7utuF85; Mon,  9 May 2022 14:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A82DE409BC;
	Mon,  9 May 2022 14:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6000F1BF33D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E40781A65
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4nx6xNHMCI3 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 14:41:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::619])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BA8481A58
 for <buildroot@buildroot.org>; Mon,  9 May 2022 14:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJQtbNE6josLPddETAWBjh2YLqio+W7iswrdmJ5tzoQmfKtnox9HCYQrEdvj4JMvEidduonKFRT3LlirpplGRjKIDYiEFAazNFyvMNYDYauXMexMzZV5cgsZtPfr9oKWds8A4fw9XAVfuaQbWVGWdSXaB2SLisfcaLoI51KH0FkN4MpgN/yjKgOdaCAamd3mrFIDP3y0sq3ezk+rEUb503lZfOmMmPNrmAZoEwiRZ6tniuW5h/QMbVR91AZN3uQuFMDqnzYYC8gvFOSWV1GNmpDJl9ecJaCCVL2E+TMhOAU0AFbf9+pxHIhe/yXRsIM3eMUa8ISEzjjVzEsAma3YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIaOwKh3vr71XOy2DYWQTZyrxQKtxt8yZ5BziMohQ3s=;
 b=aupW1rBRWYs+PD/x9UFlC1qnfkub9lbRfw7Q6yejBe97v12twym1LcpyHJGLTYERnSn5xOQq1p2mtiF8cPowyyx0fFd5Cf3iRyISMeEkJT9MrlCPdOS7TKST2LpzSr8VqpexFkKfmHGFvz0XN5R7qvBcGE0sk/47D/Z7Dz9aVo2VEHyQjo/aULGwRSw0HgGh+7gZ5kurJ5S7YxpvdWOqv7JXSAt66dNIgoMH/RTKxsmxXFpf6xJBP837/ScZMwnP74CJNjsWplNMO8BGQroBKvJQXmN5opvWuAWCRo8IvW88bUN6PWKDojWdw1THPoqc4lZYSeW1XoLfNoYognZNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIaOwKh3vr71XOy2DYWQTZyrxQKtxt8yZ5BziMohQ3s=;
 b=Y4HE5Bvq6nqoY+rsdkSTfoqYZzV9fP6Acowfleceo8XcMUvQbAZSO3vKwFOq7l0hJ4fcwIvB22Eb1grggHXuNYVqiIPsmndaCFajhc/JeY+/yGv0Fh8s3N5PHda1VmkSZUK59fkCVo0h0JzpYh/Jcind/R7BGl2Hjr49tvF66Q4=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5899.namprd02.prod.outlook.com (2603:10b6:5:179::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 14:41:01 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 14:41:00 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIIAAGo8AgAABPJCAAAWyAIAAKG0wgAANy4CAAAB54A==
Date: Mon, 9 May 2022 14:41:00 +0000
Message-ID: <SJ0PR02MB7758B99F6AD8F668FE7F318AD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
 <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
In-Reply-To: <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32f46d7e-4bc3-49b4-9531-08da31c9efde
x-ms-traffictypediagnostic: DM6PR02MB5899:EE_
x-microsoft-antispam-prvs: <DM6PR02MB58990C304590B14D8431F7E2D7C69@DM6PR02MB5899.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4wtBw5gzxJMwbXovBo7SeTOJt30foULOMETmtYvThA9tAF1wSADZndt6u9Qjel2jk5zkD4vXoZW7OQaLF4GITIRo8Rb2MeVZbr3t47DvYCAq1PlYZUPd6ot43gGI04vFeW2bc2pZ2OUBYTMjeqrUE7lrjxPMWFPDlC1TB3nWa3GiTysYssuafP6AYxMLmG9/tcNuL2nCCPLlXSMbGRCl5/M2ZFDlTwc8w6+XTmZZmP3svFXF5JD3F1bDgrrK+bpOnBeAASuxzi86RNcfzR3DzKIy/aQbbwXo/EZJXTvUy/Zf293IkR4G4ztcVwdFx4y/RLcMsSlH14ntBUpofcle1zWs58V/p2qwFDR1sCkWxKVwERYLcYg2CZxzmFDZdlQ8Vz4MN4qjpsqG4jm8czthUoMMETf1pqo0KdtLrre6yVhpEu78u0AhIRq0TI5itL71wB6+nEUdsPKMad6lebeIqRfFhnpU3tU4cKbWCHPHJI8oSmC0oKnVXzUJC8d4T0/CvO4/HHNCn5mw0DB17VAP7BtcpmjIAWTR8sgTgBWJMXjHUVuqfnPwN2p73Rmj7Eto9B1I4VQvvvT+uMvUV8PoMKAJPS2L143IA707spCnqpKLIFNguhPOnxmDd8P//LYT7RTGaGf6+Qgysl1jjzy6SWT+1RpGMVQhAnt4XHsM1/2jKb6bmjTL5NPrKXkKdgZUpwZNkBo7r90kqG/DNTWiHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(64756008)(66446008)(8676002)(6506007)(8936002)(4326008)(316002)(55016003)(83380400001)(110136005)(54906003)(4744005)(2906002)(5660300002)(52536014)(76116006)(66946007)(38070700005)(7696005)(71200400001)(33656002)(9686003)(186003)(508600001)(86362001)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aldCL01DNzcwYU9PdTdpd3h1ZzMxdkZzQ1pIY0FkSXVNMkduRm52Ly9nZ0ZY?=
 =?utf-8?B?VEc5YWpCdjZ2WldwNVlSZEtCY1BlYlAyQlIyUS9ndWhSZURlNUdkbkRhRGpi?=
 =?utf-8?B?ZjlmRUhQMTZzMy9WZno2V0h6REVWakhMWTBWcHlGenNuZUNvQzZOZDlHTmRq?=
 =?utf-8?B?cmtJMTB2TEFHOElabHNYbmRsVUNXUGFKVkJwSCtseHVYcXNuRE9zaVk5VGg2?=
 =?utf-8?B?cFhMS3lQS2tKREdEdUhXUC9iMS8wR0t6SVAxUmd2clFuUGd0cndJMEhkTDRM?=
 =?utf-8?B?L1Bub2dKMzBaZDFBNXFyTG4zM2lqbmJIKzRHUEpOU2dwMHFYRjRiN3MwWFpD?=
 =?utf-8?B?UkdnbVJvTnlYQkRwOGN6Nm95dTgvYkFZejBmNktab0Y2Y1p1elNzZXRpbkVM?=
 =?utf-8?B?eVRjbWRYem5pbnVvaFJtbG1MMHQxZEkwN1ozbXpZeUlEd1BDbklZT0dHc3Fm?=
 =?utf-8?B?T2lsdjdERmN1Y0JkN1JwSVJkTlJqVWlxbHgvVlQwZmxXY2xsUm1RZVJWWUxJ?=
 =?utf-8?B?V0V5S2MvZElZYTh1SDAzT0tDYWhHT0JCMmo4TUkyNXRQNFk3TS93UG1rWnp2?=
 =?utf-8?B?VHdOSnozWVZrcFlkcTAya0xZNStrSXJoK0NMdXBEVHhTY3FLSHo5ZkFjWDRO?=
 =?utf-8?B?RFhjZHpuWk9qREt4NmtocG1TZjVteFlMZm9PVnJHc0ZnKzN0SWxjNWZOOU1p?=
 =?utf-8?B?cWtWZkNLUU54dDAvc01xb1Y2THA5Zzc4RGNDWWM4M3F4b2ZTR0pTRUkyaFU5?=
 =?utf-8?B?dVc2TDVLUVNCOUMvVmtYYmJxRmdXUCtpNEoybWRSTUdDejlnWkFMY1hFTlA2?=
 =?utf-8?B?NHB5QjZEcmJrcEFBd3l1Um5ITzBuSDhHQ21SYk1sem15UXZCMzVncjk4VWZK?=
 =?utf-8?B?V2J1ZldLNHZuUXVOSVlSNm1mN3RlTm02ZXREL3FyM2xnMEIxeEhMeDBhdi93?=
 =?utf-8?B?T3NRbmFUUUY3ZTlmNm9NSmxTQUZ4aGQvc1hMZUdMUFJNVmFLclpvQm1qMmIw?=
 =?utf-8?B?Vk1Wd2lIa2JxMWYrSUZEQjUvZDY5MGNhZFN0Sko1Lyt6QW44NmZVRWxNZEc4?=
 =?utf-8?B?RHJEK3NRbHRTSWVEVDI4UTczV2h6eDdQLytNck44NmdxQ2lxZkxzV01VSkFQ?=
 =?utf-8?B?em51MmlBRFhEaG1PTnhlbHJIWnl3ZlVTeVZjSTFranhJZ2lMQmxCcDE3VnVF?=
 =?utf-8?B?VVpaQjBuM0o1NXYyOWZ1a2V5N2llcmZNcUVkUGoyci9TZGZrZGRCZytvUS9Y?=
 =?utf-8?B?MVpNVFF4K21qdlFWRkVLU3FzNWdMQUl4WWJhaXBLeDJYakxYS25veFJUZ2lp?=
 =?utf-8?B?Q2JDVWkxUFNRTEppT0o1UzRwQThFaDZTY0VzTXBxS09yRjBheEhmeEVOU0pw?=
 =?utf-8?B?L0FBUkxCWUJCS0JQWGFyNjY1MGMwa3BHWjRzWUkzaXlxNmRsNk5rODRkcW9D?=
 =?utf-8?B?dkJMUUtQNTB5NXNwTHVhVEZlNHV5ZkZQcVpZYThZYmFQT3Y1cTdTbHNDYjlN?=
 =?utf-8?B?OEZocTI3UTNJQWt1bSs2ZlRjQVViV3RjOThFQktMYzRJZ1MwUkNGUnFhMXF3?=
 =?utf-8?B?c2ZMTURDS2xDaHVPOHpISEhxY0NHYnVGYlphS1NkeGVNRlV5N2ROYTE4ZExl?=
 =?utf-8?B?cVlvMTZ2RUVobU5XVzNYVHR1TmZmTUpDcmJKaUFhYUJqTnNucGk1T0FGVG9Y?=
 =?utf-8?B?V3A0T2duQnorT1FYV1ZEbTVSUmlvUUpiVVdLMCs0TVBFQ0pxSGFpUUpUczVI?=
 =?utf-8?B?T1dQY3pua2MxR1VpZTh6My91RlRjdFJneGxJRjZVcDgwZG9mMXlRc0VqdzJs?=
 =?utf-8?B?cVA0d1FLYjdOSHhxelBpNTQvREk3U01FWTVJakdHb3JSUjZ0R3lrNWJHYzJG?=
 =?utf-8?B?ZzhoSlJqcW5aTjJ6MkgvS3M0VUVLbDFXUVh0dVV3Nmw5S2QyNGFkMVJKa2s5?=
 =?utf-8?B?ZmRqY2tMYlI0enRnRjEwdHNRV0YxdlNFNFVvamxqVnl4NGtFRlVYNmppNGJ6?=
 =?utf-8?B?QzFxMXR3ZUh2dkVBYVY4bzRyeFFPc1o5YTA5UlFGbUs3L0NaVHZCU0dEL0lX?=
 =?utf-8?B?cmhWcDNZSlJjR0M1alVCM2xjNUNvODRjd2Z2U0ZrN29wbFNSSlhyRk1LbjJO?=
 =?utf-8?B?T29EQTEycjR2WTBHbVZsTDZ5em9EbGRMZ1VqNlVkTUtVYnE4c084QTZPMnNM?=
 =?utf-8?B?U3hDQm5XZVczazNQY0NRRUdZZU0rMVBGOE45UWE0SWlqNVJvcGZTRnBBUTdp?=
 =?utf-8?B?VzFlSzlObWZvSEJzZ3hvb21DM3pBRTJXS2MyaEpTVkhkVXEzYk9JdDRHUlBm?=
 =?utf-8?B?V1VJSXJtMFMvMmtkUnBNbVpUN2liVVIxM1IyMTU4bnMxSXZHcHM2NE1mMVNi?=
 =?utf-8?Q?8s2JLIpvu3dvYuNW4lxzKNQLqKhvYUOGTw9IG5OYrUNgS?=
x-ms-exchange-antispam-messagedata-1: iU4j+RGWT36GKQ==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f46d7e-4bc3-49b4-9531-08da31c9efde
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 14:41:00.8719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOJs1e2bAF+Y6jcfJY2GSfP0BXtcfO/64AQiEiGOlj2QqCR/Q4smoamYZ+aBAu4JG4XL0BZXAFLu6pZr85+2UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5899
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

> No change with the updated psu_init_gpl.c.

> When using the pmufw from the 2022.1 BSP is there a different pm_cfg_obj.c also required?

> I am still using the original in buildroot/board/zynqmp/kria/kv260

I am currently stuck in the same place as you with the exact same boot log.  

I generated the buildroot/board/zynqmp/kria/kv260/pm_cfg_obj.c with Vitis 2022.1, so this file should not be the issue.

Also, for completeness, only the zynqmp_console needed to be correctly defined for the atf as the zynqmp uses uart1.
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"

The PRELOADED_BL33_BASE parameter was already correct by default when using the zynqmp platform.

Once we get this working properly, I will patch buildroot, so other users will have a working solution.

Thank you for your patience and let me know if you make any progress on your side.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
