Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC21C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5380406BB;
	Mon,  3 Jun 2024 17:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfYmIP3hRwqS; Mon,  3 Jun 2024 17:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2480C40739
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2480C40739;
	Mon,  3 Jun 2024 17:32:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF6C1BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731BE821F0
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3uvig9bjdpD for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::601;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59504821E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59504821E7
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59504821E7
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:32:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GObWUcyN+qJNV1w5BA9LBrSTWMUEAELIWof4hNi8pokE+3EGTKegZhIlXGLb1+tcsqeKMjcT3eKLArf4Bv9TzD8LR2w3sFYlzyfbStE/W+6HuVvBfm3T0yE3Wzzn0qYPa4u4zwI8+6amkWtkn2sp13Qq1yTdjP5k7I6NTpGclw8zjFbp1rVlQl/pSfs9i7RNvHF56pvLmC5EJfBTh7ojRn2J+dEz+44pN+XpC6xrZvAZ+n8wEAdL0UZpJgpPjR3RYvexSWN6ozMrV+80rf8kc4YKaQAwnLtJveMxmqgcdoL6suMtVKJMwE6eszzOOR8sDdgyBSXC9eYZb4iRhlkmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnM0MoL8aJ3IxZVLxoKjUmqrUy6Y2wJqMglWuUHXSQo=;
 b=QxuD2l0975b5A3Ew/0JJ+hG4CL3xJA1PNKdnp1Lim4MZ2meYXMtnDtL/ZumKm6DHb7sONtQvMneZ8DD/qZqvnGR9la92mJVLl2i79gFHjo4jPqgjYgYSoFvcmWLKrmEe3/bFsAifeE1DXjegD58YMdp4Nm5vljz8amZXWjAnwou31Gw7BCFrBDRIBZ1HMV+1NGZ0A1g1C+ze/a66d861rvl0h61dbR78bT0aRl5kccfvfodc1jUrhbi+jrA0GDWjsxCA+pA1x35eQM0gYXEVaZ3m6iEUBtsuzGxquu8ThzTUbpgzsQNVzwV37kVSNr5dBp9F3fhU1EWjQJO/Jyybcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 17:32:03 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 17:32:02 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHatax9g559kmzXMUmo4Ts21YO5tLG2OC2AgAAQHyA=
Date: Mon, 3 Jun 2024 17:32:02 +0000
Message-ID: <CH2PR12MB5004A650688B0A3798B0C224F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <20240603181909.50291720@booty>
In-Reply-To: <20240603181909.50291720@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB8799:EE_
x-ms-office365-filtering-correlation-id: b16b615e-0c65-4098-065b-08dc83f314b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Q8kYF1IVn2DQnvk97OzqT+7ll0NHDCyPCqf562ceotc2M4g6fLgbX0vZthZd?=
 =?us-ascii?Q?RYtQLOUshkkA35Y1jOMoxs26be8mbLZaDYiVRLh62bumHxbOwS9MIqhSnQSh?=
 =?us-ascii?Q?V9tx7QcYKTNFWLxO0L+gBYNRCRplAPNiTRDaazmjvmNtyP3FwKYSaIZzfDob?=
 =?us-ascii?Q?b/thXQ1Z49hZZRWR87QU8ZY+GZ4XZdjy8UKsRdmmefPp9TsUVhCbFVH0I4Gi?=
 =?us-ascii?Q?YihsvaIqrjfYkoAVczo60GpAZ+jDQiP25AYMIR6V0D7h7oq5eq4fOuiDUjg4?=
 =?us-ascii?Q?5I/rzlnIFC0kGQQccM3V5uLS7mZdmCc/NOiGclB/6ctgqcUwkBjCIel95h/X?=
 =?us-ascii?Q?spFybqj5iEEunyopGpiKYgcfa4T9M1PGvlXS8qlurQ2/ILuwbxjvdZ3aOFL0?=
 =?us-ascii?Q?KAADnWdgnJdBmEXZngCRutsQSFVEvizIuRRGMQw+5qAjZf6bvhMnShcFKhal?=
 =?us-ascii?Q?e0ptrbZ0oTCfoFWBLk51tsF9qyRv/a17MqfeDBmG+XNvntcc+IsPM3D/DMgz?=
 =?us-ascii?Q?DevN4al2OmEiN0u390+Mlntw/jYhyZFzYd27hS3rE93LesNfZFUrW4ILb2FZ?=
 =?us-ascii?Q?GWiFiCgSJG3NnQ5aCSaSx43fgtl5tZxDMSouJ5/0ahANf5QbUp6YKkQu8n0f?=
 =?us-ascii?Q?5Vi7aQeis5IXvSbBJuDwYCcpypGvcRk37STrfGPqVi0Cf5LEgpeWJTMAUW6L?=
 =?us-ascii?Q?8VZMkjXQiNf2LNo4JxkJrwhVONBW8yjN0CAP9p+EENEZHXObaSItqJ2CpdcF?=
 =?us-ascii?Q?ktAe4kVBjQrq80mlHiDZRlaQz+fbA/JU8hHaoWZhumznZscv1IfSO7k8eB+P?=
 =?us-ascii?Q?/lgXZ3Rr0GcNmMubodCuh5onl5AtPnKiRj7qUy0wh/XZ1+mkMXtpL43tz7f5?=
 =?us-ascii?Q?NS5GDnhYYa9F5WOOxnOEjg8SvSOcroW+wzhlgh7yIVNNLpdwyqeTuHZwa9vB?=
 =?us-ascii?Q?mfGwoNvmm0duZ4lxkGRCaCxLakyxUnhEuA6ZFeaHeRzMHcL4bcf+0lE09+Fz?=
 =?us-ascii?Q?4jn5i2CTUL75uRokIEJESXf2SbNKlarOnDZIongBeadPyLw/AVnKLd3X+TAb?=
 =?us-ascii?Q?6aR4xPM5SJDE9GwYz3bu/a0rb98pLLx8hfLmGLbHpa7NnW8UfqQsoYNWFXFq?=
 =?us-ascii?Q?Db5j3pHbqeSmtIai50trsR9pK6S4KOAvooACgqk1Nd90MTlxIYVlIRh/96kv?=
 =?us-ascii?Q?acrzIwdQEArL8GzCb1uyuKcOvLAxYds4FcEernkHHc6ZgLcVwVbSq8ulA+TY?=
 =?us-ascii?Q?DHYuon0fcH8xdbrpf/gnDJg66o08FzYcqdvSwD2EScF4C6FPuVB4NIgCWdd8?=
 =?us-ascii?Q?8kAmjxH5bWjWC3VXojoBXeLs6JNUIbNqjcUlO3Wlot36QekNXFTh6PETnkcv?=
 =?us-ascii?Q?MpR9AM4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tn17QgTInD7vq56nMveE8chhthbY9RVuDgshyn6AK1ogxtm4s0GEJQN+z9qm?=
 =?us-ascii?Q?IIbwt2Oh8WSwEBI2kCexx2xjJvTddn+ZatanVaJvvpZAxz8lzlyimXQTm0IK?=
 =?us-ascii?Q?qDCdh4JV9baqH5VArWCCcWkRjl9hdrBrOZz3excLAZOGvDd9OmVwbzs4UCly?=
 =?us-ascii?Q?Jw96COHNy05yf8nvrp0szegaLx9ExMSz3HBM0zyHsL11UDDrvQP2tYsCg4qT?=
 =?us-ascii?Q?6YhupexW+RST+k4W6lrSYsvKEFEXDyQeA7b4ZmX7xzatfJM23zkL3FbY0cTO?=
 =?us-ascii?Q?7g8TnZZrScHr6ESXurWdqS0QZAmigoogtU/jmPazB/xBNL3j3ksOH3OpKeui?=
 =?us-ascii?Q?XnmBzb7nkwRidVQCqEmBdNy3yizd/oXQuYyNQ8d1vd3BDuh+bEZdUX9vZMer?=
 =?us-ascii?Q?Av1fWlcU16LnKQoyx795MgB8PCmUf8hiwu2WzR1SEH/rO+VEMWLz9NWhAojd?=
 =?us-ascii?Q?3q22OVOrN5IhAhcJKWqMO/GkFUbs5vHAM/1NNRXCW3JKaYBys/tz6PTe7hBf?=
 =?us-ascii?Q?v5kKzNGUcscwzp0bZBjNOB7kZUFphTZYbIQvEPmZzo5YXnpTaBYJbSdz8tNy?=
 =?us-ascii?Q?oda8ARr9lHWDZo7zxs+wKZkKuieVLEtvb9kKCo/lgOK3WykagaEsmNwuyHLQ?=
 =?us-ascii?Q?BjUPeE/lu/EAEGMRCuRDFCDV6Uw8y/pUrBy4ubC3rUttsSp+Hjxn9mDo/04J?=
 =?us-ascii?Q?d27P3Iwx/WSA/FwZOT9sbE8NNbyTh5h4ojR4T3uIdP+CjdVRip4//PoTt8AD?=
 =?us-ascii?Q?dSIEIXwtnaRebb6CHFhCyoplQPrLc0DMZjkwSA0ht7fbQCnPg3eEzML21psU?=
 =?us-ascii?Q?Td6luMb1uRFFN2qrpMF4tGKuD2w2N7Qk5rDZx1pEizXRwptYnM8fkELnzcys?=
 =?us-ascii?Q?Dg07yk4eiSOwr2U3nJ/XD7RRvGVhlPSjothwGwmz+qoh5CFZHMIWEg+xwFZR?=
 =?us-ascii?Q?x3b/A5MjnTaiFeJHZmIP25VUKUjY9ogO0p3OPbaYgreU3mFCGulynkGuZFLA?=
 =?us-ascii?Q?2XJ6JZPhppH+cFLZXXj/gP/wiBpbOM6c3Xp73hln9xsjO2mz95VmzmKiSBnd?=
 =?us-ascii?Q?kdUj2I9MCX2N4PJoe/8ptRQeMocyam8JMS+keRdAgjc43vyIMedJPkTv2XCG?=
 =?us-ascii?Q?O33nGxYQW7CHG77XtBg3kKGWbLSumcocMPgTFzPYnYQZWO5ms2eqUEoy/IDk?=
 =?us-ascii?Q?7XIucZdSxpfMGTtqcIJRdFwZqp0wyji/76WlQBGwn56vx4qthsAWISC9Ow7/?=
 =?us-ascii?Q?umhWLFw+LdLQmJykaE1ddIIiw8dyhpy8VBbPV8MxFfuol3srvEvYng6ci1ec?=
 =?us-ascii?Q?2ETTgE+dPA5PMIyvrDMtTnE9Rv76EHnGVZC2NU6nlQKHkrfZ6KnXC3pKJJic?=
 =?us-ascii?Q?EYV0m5uf4A5MpwMv+WH7dO4/1YIFeXjQvMwtKBWt+06nZW4IQlILOXDp6lNc?=
 =?us-ascii?Q?M5jyHxnJctZ2D8zmeeiorEStDj8mVlflgfxdljRLgJddHPQ/88X2Al2Rb6z/?=
 =?us-ascii?Q?QLbJZZQm0keWpE993WwSJWBIKpjrg5WycSw64S+PxN3sK8NZcnyt0rqG4Jh0?=
 =?us-ascii?Q?3rzGGcSVjgf9WxBe2G31yMswmCDfAcHMVTxh2BGfcV/iqZge35uU7ee9urYO?=
 =?us-ascii?Q?Bxfvbeo2iimkczKcJYM1U0U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16b615e-0c65-4098-065b-08dc83f314b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 17:32:02.6749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8f+xSKwcLxwMputkxeu1dkGtRtJGzJ+q7qIUCxKa7knTD5eABedYTUmsnUj/vFi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnM0MoL8aJ3IxZVLxoKjUmqrUy6Y2wJqMglWuUHXSQo=;
 b=K7MvASVi9YZNPc3F2scNKI73GynxqYgKWIJ9RdxdpDBeqHX52SbSv/XDM6ro9xsAWBgoyKaELQiczQXQZoViL9YHHWwyaxK1uliHmUCBsi7RFFIYuB0VSW9D0rF6rcuwMSrSxdTRBtaOPjwNuVJqazGIAINWBUkl/Sld0LIoHcE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=K7MvASVi
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thank you for the review!

> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"

> Along with the Kria KV260 + KR260 series you sent in the same day
> today, this patch dir will become used only by KD260. Do you have such
> an upgrade for KD260 in your pipeline?

> If you do, then it's fine, we can keep this directory until then.

Yes, I am bumping the kd240 as well.  Once this happens, we can remove the
./board/zynqmp/patches directory along with the two ATF v2.8 patches.  We will
also be able to remove the ./board/zynqmp/kria/uboot.fragment file.

I delayed bumping the kd240 because there is a board specific patch required
that I need to re-work for version 2024.1.  I should be able to release the
kd240 bump to xilinx_v2024.1 tomorrow.

After all boards have been bumped to xilinx_v2024.1, I would like to add the
rest of the hashes to ./board/xilinx/patches and get all xilinx board configs
compliant.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
