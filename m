Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0BDC87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 09:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5AAF607BA;
	Wed, 13 Aug 2025 09:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrZxVApRsAOx; Wed, 13 Aug 2025 09:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9FFE60742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9FFE60742;
	Wed, 13 Aug 2025 09:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F23938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD28740137
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yomho16qWhkX for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 09:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::610;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E5F640134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5F640134
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E5F640134
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEERJLIejfGqSzTGMKJO0cbpaBQ+tSkVqemubO04m0FhIeI0lgmrocIVNVMH7jcHF161Wt7cJp7EcD7lMQlqjtb2lxVCjlf69gEuXTAm+NPjUa1BJ3vEjqb0oLwDC4Gcq4IWu093xmuDZhlikFu3HGAl6S9ii46VKo9swskVHFm/3mqRuK6JlfEQ8x0UwddFzecgasUw+RBST70dppNdOcFq2cdJVvNl/VWlj8p2ga8r3tzE2T4kxpojTH3VKgqn/eegwKLwe96baNAJugVToF3pz1S0TgIunuqwXHn/fry4Wza6K96/KTEt1TSkjsO8kcy01b4NJoRwQN+BLii+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub8Xiyi7ZwsNwUs2UOpVi1Zrno1EDpMnrNbtLyfSMgI=;
 b=fjrGxgJR3ZBtiC3xzOoC9lnZDsp2HmLNqa5NUZ6kUw8ycS8i3n79SzdXXd0E20FP3js5NBsf5B/JWrTpvLOYKK5VAFAfoJbPPF6Tlc+uW+71xnfrmFvaseh+5cfoJ1fhwwFnv96ZiOj5pTIVgyLFa6253MlcEkw+v2npZMI9+RuyKs02FR4N7vJeHTdws0nRrzs3mNrXG8NdlcQSwBy0bkZ1IxpsvF3oqkuGJ49MuL8JcOC+HWvTnaTKdkbBDnV94iPd2uLYDu7TMnhctoiBx9Jzxv2A/i2/uWZd+QHhGIabAbNumEHtiE4r+gxd/XEd2IXZJs3+Oyo8z/xOBLQX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH1PR12MB9695.namprd12.prod.outlook.com (2603:10b6:610:2af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 09:44:43 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:44:43 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTsyAgAAB8ICAAAOasA==
Date: Wed, 13 Aug 2025 09:44:43 +0000
Message-ID: <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
In-Reply-To: <20250813112755.63b17355@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T09:40:48.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH1PR12MB9695:EE_
x-ms-office365-filtering-correlation-id: 6a431406-cc75-4144-6db1-08ddda4e084d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1YROZY9ucbUnvSn+YBqGEOKJeK4Z+xrui9EBkm5hiZAjnfBxmTk1CzAM15KB?=
 =?us-ascii?Q?KKqTXIMk8KqwX30x7/k3iTlv0yt9rZ3cJEoqtKgd34LdH9qvF4Ak8CbWN1uy?=
 =?us-ascii?Q?X/rAGuIaNTLuXDUlaESaoDeNw0c5yd1Rck9JbdSMdsJmVRDUpyVqIheSslyI?=
 =?us-ascii?Q?joSZFzLsrxyuJicw0eP5puPB+k8l2rkEDpTMA6LPUY99jna+sAX7jn53Jd1e?=
 =?us-ascii?Q?MpygYs8V5HwGGmAKKi98Ra13ej6qU6jMMm5i2v8+5zEFEaWM1fGz4bxfiiZW?=
 =?us-ascii?Q?L7Su2OLGOpem/oxjEcXhlJxWX6FMKg3YPmZNUwiIe5TrL2fTxr7GMkG8puQG?=
 =?us-ascii?Q?kA12fdw19zh6vL6QvBCp2udQq5QouYOBA0AaPa7VXI09xsJXjaxZUTmudnoN?=
 =?us-ascii?Q?KSogJSJkxmidWDVG59nKi1sVa8/QPIQnB0rqGoaUibwhAm5Qa3TL3BEQpeVC?=
 =?us-ascii?Q?bfp3hO8E9+ydMiiKLHwIvBAQkwhtxZZswNnWA/ehCfSPS/4CXKSXuwtmWxyw?=
 =?us-ascii?Q?qOJ/H8Prcitt2fxMwQSg0ntrjqhzHcpSFZeglC7n5cWHdcB45i8hJWIF6kWo?=
 =?us-ascii?Q?AajsZ99B1yzjYb2Lq9X06sO7sN9jszefJ83Ogydv0MPxnpJWChpoTM85/qRS?=
 =?us-ascii?Q?8SqvMuzNo19F+o04jLtAjhWvbK314BIHuYWxNZhKZjf2tfYOcb0tXVBZf9CR?=
 =?us-ascii?Q?4RsOzWssvJVzcfft1f4Gn77uWTuO+H/SEgWnbUWIHHYQ/igSpBFReABU9CP+?=
 =?us-ascii?Q?ygJ0f4OMdlQf4RAjyDj5nxlw0wO9883C5yMZDFndl21koiFjJ4RoXz5Dgb11?=
 =?us-ascii?Q?wL3Q+k4wF4T3xOSlgYtpWQLu+3KefnPYFD9GvtNCqnsFBWDN+jDW059zAUag?=
 =?us-ascii?Q?O7OdEqIxk9X2X7bsvo1emPs1UDBtPjOgqR2Baa+2zU0Zfd0unEqqxgWeAnHv?=
 =?us-ascii?Q?fgvQqtcph/0hfOCRiKy1kx6tPTwf8mgK/9tTIP1rd9ZoMMWf8Xi0CrExqHv6?=
 =?us-ascii?Q?B/ksCGwcRKC6Ez6JMiWlZJiZwMn1JLIp5/qsGAa0+Qb0+jKB8mTcKZ9aHfbp?=
 =?us-ascii?Q?NGa+fjDOxCTdEZ4lN84dDfKrrCkTmBzkO673qAwnDxiX4Q5y4/QoF23osbAy?=
 =?us-ascii?Q?JxbfKImlX9IL9gdUyQnljIhJF4tTlVbWZhLuQcddCAxMbsE/DKf9Ib0SGE0t?=
 =?us-ascii?Q?qP20BRsXESEoSM87+XBxQU/g13K8Jh4+kB2PElbtcAdCkD3zsyAAm2oY3QBv?=
 =?us-ascii?Q?W2ngOcNXRspzooT7qpVSEOUXE/nvprUf5NshZxoaUrVSqMhwazE59bXtEoV5?=
 =?us-ascii?Q?wZUBpxt1m1okoPJfIS4SN6BM0NKFmFsPLcq2oflWgYGzQ2F+jH5oZOhxlaty?=
 =?us-ascii?Q?nGLP/zpmcJqSkAtluL1OmrLo3ap7wi93yMZLE/IH6pQ9OHs5OtNLzM1f6wJd?=
 =?us-ascii?Q?AetzwQHhXjEf5xz3MCYvs5rcEF+/obNGBPuE4TJHzvVPYQ6VVAmhxKiaUqJS?=
 =?us-ascii?Q?G6Ca7iY+8dGq3dRL0Rf81FX66N8DUAaHraBQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Tmt5RviopG6jV7hjuLzMWjZnHwItEb8xr+pO5NnvrakKYLoR57BWHVgP/vh?=
 =?us-ascii?Q?EUfgKD/JEY6YV0rd5Sl54MMzxD6ZO+ENtTCZQeF0hZ2V1iwZ0V44i3IuOm5S?=
 =?us-ascii?Q?D2DPmSnUpdCCi4NrrV0qCSN7FfmP3CiwekvnZvwXv4WgxAbBaqd/Vrke75Pn?=
 =?us-ascii?Q?F5l2uFbHrsP/QuzUNAjHUtdj57lJQONY8BHILlXT3H02gUuyg6Sj1dP7N2FP?=
 =?us-ascii?Q?Z4m/AQNDxVGIKTAxZRfAz63iBpqHiNrvhUg5+JaIb/5Tcb7IsybDmU8OzTne?=
 =?us-ascii?Q?aWXNBShhCsTdU0uzxnVnAy7+lhcWA1PYXWsxbQVs3WqiOawElBbXViMVPHxh?=
 =?us-ascii?Q?EnpmSeIafhO3jLEyZ+/dbann3ftaMYCzEklCbK9glf3tqJdTizJTKp39QnBr?=
 =?us-ascii?Q?5Vv9bLMrnsQgGyLUiuykO44iofG6RUhEiObla3Q0Mk8wAo8a2f1Jyfw/iojJ?=
 =?us-ascii?Q?//sSMdxNpqngnJEAcIMfvNxQYFml7WSOJh0oB0L+BDRpYkdv+FcIpeug+yNV?=
 =?us-ascii?Q?e1UTLHrRyiX0Uz7JVTPBYk5Fk8fp8NMPPHt/a29YgkjDxq2rIDkt+TNVqFXe?=
 =?us-ascii?Q?VwSEgutGqrUCWtNcALxpq93DgSTpLh25c5iLl/Auo+5gjrscjOOyIa8EEIXM?=
 =?us-ascii?Q?lPGS2lrnAIhEv90qctGNBxorHSog4jhPDWA/6+l1OfQ4nWrbXYuKp+gTWfdq?=
 =?us-ascii?Q?IcnHtUNb8eAiX9X5Utu0qmkr/8JBXkFGrvK1i70HkSwQxvyGUS45a/Ea1Nsb?=
 =?us-ascii?Q?OTHJYVpNX2q1rybFDvZGKWgvrORV24rkf7IVN5srzrE47grPOJRtXuVDEp//?=
 =?us-ascii?Q?R3ef35qOURzPmdjcqt3kqXHTzx/0p+4qndoqzjrSNpfJwH4/pDhIlUbx1AIK?=
 =?us-ascii?Q?e/oqkuf+dIh8KHyPgB7Wg2zHMo2MPFI2j0AhNPul81FaDRDsQThA11CICNEg?=
 =?us-ascii?Q?cV1ORhB1qQLVpiKWsMxG2hpY5fXCWICJPM2O6DmKBhF28KT/Vtb4TzZr3ymq?=
 =?us-ascii?Q?4JkrEG7JuufYXbDRhamvNmNYWUeMtrXlKZlja1KhEk56cG4v3RNYGCLauT7x?=
 =?us-ascii?Q?bUCdPRR2hB8ZKBZI0ijYPkrHZqpdmtfYLBAG3C9fAMGIvBevM95t47pyXpOK?=
 =?us-ascii?Q?Ykan+1DyJNu+io1Y1z+2Rz65Pj1hUM6N5SXeTkVqakr3D+ggfk56DJYiWya+?=
 =?us-ascii?Q?IFXBWxIz4JeuiY0Eo3Rj5CYkYjcpNslLnj+gNFmuz1U2vtC4K8w9SdpBfgRX?=
 =?us-ascii?Q?gKeEq0CqRCIeP2NXVr7u6Q9pSa+fxQbf0zdjWrZGkou6t3IxLL57HZrm/wqz?=
 =?us-ascii?Q?UQcB5SvxCboutZ71I3AJMeUVHJUlTq3fiWPDZn4knOg7zBk+7N0fARNJdsUY?=
 =?us-ascii?Q?a4Yzc4XxwJEp8No2BKv8nL4EDIlHaj3C83uPe633V/Vvf7Y31kfsMxKnuCKA?=
 =?us-ascii?Q?0aREpgCUAkKoXLOFvW1cfz0/uC7o3fFcAtIbPHidqc/o33f6zve1zrpESg4a?=
 =?us-ascii?Q?HQKPg2uWjrkAAQ/J5LwSQA+CaCm5VG5KVOkwVq7zxjdLkuzkL0le5dXZGFLb?=
 =?us-ascii?Q?DjBx/e9tJxgVoiJK0yE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a431406-cc75-4144-6db1-08ddda4e084d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 09:44:43.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rnmrv0yHbctAq31AdtkvbV1tV7sLbk1gzw+KNjI8JLIXhH3Srv8jwu9M352moBlw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9695
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub8Xiyi7ZwsNwUs2UOpVi1Zrno1EDpMnrNbtLyfSMgI=;
 b=3ENs68b1JNUgHS6oNo4IY0F1xJVribeUAKK76PTPjKE8DCqADsz4z/ZkOCVmbOk9TIhAX0T2j8MHZJhE42w7NoCw31EHOkIbPxdwN9oue8daUysrfEhUobqR7msmz60Sv8r3moKT4V2vSzWDSAewz9ma/HaaNY9EkCjnqhSC4P0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3ENs68b1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Yann, Luca,

> Neal, All,
>
> On 2025-08-13 09:43 +0100, Neal Frager via buildroot spake thusly:
> > This patch adds an architecture cpu dependency to each application to make
> > sure that users can only build applications which are applicable to their
> > target device family.
> >
> > The versal_plm and versal_psmfw applications are specific to versal devices
> > which are based on BR2_cortex_a72.
> >
> > The zynqmp_pmufw application is specific to zynqmp devices which are based on
> > BR2_cortex_a53.
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - Replaced new family variant config option with an architecture cpu
> >   dependency, so no new configs are needed.
> > - Updated patch title and commit message accordingly.
> > V2->V3:
> > - Changed package dependency to only appear if the cpu is BR2_cortex_a53
> >   or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
> >   appear with zero application options if another BR2_aarch64 cpu is
> >   selected.
> > ---
> >  boot/xilinx-embeddedsw/Config.in | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> > index 0dd6433608..96e9ca2fb0 100644
> > --- a/boot/xilinx-embeddedsw/Config.in
> > +++ b/boot/xilinx-embeddedsw/Config.in
> > @@ -5,7 +5,7 @@ comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-b
> >
> >  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> >     bool "xilinx-embeddedsw"
> > -   depends on BR2_aarch64
> > +   depends on BR2_cortex_a53 || BR2_cortex_a72
>
> Note that (BR2_cortex_a53 || BR2_cortex_a72) is not a subset of
> BR2_aarch64; they can each be select when the target is BR2_arm,
> BR2_armeb or BR2_aarch64_be.

> Ah, thanks for pointing out! I was indeed assuming that (a53 || a72) is
> a subset of aarch64, or maybe (aarch64 || aarch64_be).

> So if xilinx-embeddedsw really is AArch64-LE, then you need to keep
> the dependency on BR2_aarch64. If it's really just AArch64, then you can
> relax it with a dependency on BR2_ARCH_IS_64 (plus the individual CPUs,
> of course).

> AFAIK all the impacted Xilinx SoCs are aarch64, this that would become:

>  depends on BR2_aarch64 && (BR2_cortex_a53 || BR2_cortex_a72)

> But I'll let Neal confirm or correct me.

Yes, all Xilinx SoCs using this package are aarch64, and I expect all future
SoCs will also be aarch64 (or whatever might come next one day from ARM).

I will thus change the dependency to the following:

depends on BR2_aarch64
depends on BR2_cortex_a53 || BR2_cortex_a72

I think it looks easier to understand as two lines.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
