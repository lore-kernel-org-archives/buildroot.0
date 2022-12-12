Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5141C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 12:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B94E4049A;
	Mon, 12 Dec 2022 12:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B94E4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRm_FxYQrej9; Mon, 12 Dec 2022 12:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82779405AB;
	Mon, 12 Dec 2022 12:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82779405AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41B121BF39A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 12:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E9FA40F4E
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 12:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9FA40F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8xRNcDreRoX for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 12:52:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD90A409AA
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD90A409AA
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 12:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeV3fTww2RU4wpTjfddA8x0mTpCQuOySlwiRdQtvJDIpPbV1F5IRkWE74fX6TIfcuNVtSlTBQ2R/DDwPyFu+2ODOdrqMZ6uEEsSNRSf1X5wZB49aJTJ/0+nE1f7E7LYmGX1p3EHz9TuA+IBPITuMXJ9KpkUZWTzKEVWew/30NBIueoOn275TvMuO/UKFa7ualiA9xIzlh8Nne7fm4Eh5Cj5nv+rUZLBm9rft2UiWUVO3tH2A9n47WIOlYsLDm+KqDmx9z5r/F5HxcIr+U1nsMxnbEiZThxok1TmHhb83vEZfz/3EOdKRks32MN6jkdrREEYPdOuYmrOZL6WJCWuRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoZeUayFwnPYYgtOR8VIQCEVs4AdTgKhDzx9iitU4dI=;
 b=GrQwNR+oQMztxdts0KmyEBYinQ33ipFijwCAdtPeeVK3Z3gybK79legLfizAuH93fBhwtQhBDae/XTCPVxWjsRykTztF9oN0jCHUDV3N4uxsRidLzS0wL1ToFFlj3kWatDhUGN1vCu0mcFhD9GRxdAboY2wXgCKtsejaB6qo+fd/X9sl2SVY6SVyHrD6N8ogwR0gxpjlgb+hpi0nPGF5eEgibZrsGk71jNBIjJ6dpeuPI0dSYynDnvQhAo6mfwsVnI9cYAOHkAxlluo8+PPl5v++0jFgNqkErmisf80WCOqgV0xOeP1vh68rbzA4hE8QKWAReEsrhT33IcJd23wG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 12:52:37 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 12:52:37 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Brandon Maier
 <brandon.maier@collins.com>
Thread-Topic: [PATCH 1/1] boot/uboot/uboot.mk: support binary pm_cfg_obj
Thread-Index: AQHZDAYolIx6yte4nUeeBVq6Bchk4K5qAQIAgAA0jXA=
Date: Mon, 12 Dec 2022 12:52:37 +0000
Message-ID: <CH2PR12MB500436FEFB9A1E70F891A504F0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <20221212103136.71c0a850@booty>
In-Reply-To: <20221212103136.71c0a850@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB7546:EE_
x-ms-office365-filtering-correlation-id: 56735304-0bdb-466c-596b-08dadc3fbef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pKCAUt413b3H6hcfXg/gi+XOij7zGBjvvtk/KXh7io49Zl87olAQH55dDYomho5ijY7Xc5jKCgU5JmJMOy3nW/kWb+IXzPd0VxvVcQspv1m9R9C0hqS5KdFdKgUVlDtM6ECOPrQJe+YDgieo81FjKunBomWsFwGSan5myOMlxgMZHz0+HTBD99Mb+7JLWSlbqg28xrm9EvKafyhNXHbNOQRhMeRwJKgm3G0DwXu15p2bRowIZxWWnBlPXf1C3bd7jc9Y6s32iFKyPK3ErZmlNb0MTNK22jKKJ1ctEEF/ZDFo/u8BdNvMBkTLX567rC/nrkI7GoIfBm5W27dLrd8PQAdDx47ZyF7LMfIxJ1wh2ewvNyK19IHl8uG0EA+7he1IB6GtfMn9H7qtTHIQYxwO/PdCv9YpzZ+VADjzcNL9IrAltNyrsXPxUn790hVsjDKavqHYzDARZEqVWLR1vrhE0ZDPqH6RxIh2SUW/bKxufIO7x0k7/BAqp7FdRWN8Q64/LSJmHt04jbitaVCaN9u00iqhnrZRUpcX1qHbusWiBn2lcU+7IFkSMuLF0fP2bX7YwKEyRnHxUGb8ejWkMkP0x1FDlD2BzSr6HgHEXQvTdhUqLTnY+FjJo2XYHJ4gnUw1Q8v2uxm14AG3B7oWTxecJisr75yMKp83X3Xpx2UmgS32aKp8EnaXaJ01U60PXZ2Z/NtJF+6bzLHkhzyKpf0jlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(122000001)(38100700002)(5660300002)(86362001)(2906002)(38070700005)(71200400001)(55016003)(41300700001)(478600001)(66556008)(54906003)(4326008)(76116006)(64756008)(8676002)(52536014)(26005)(316002)(66476007)(110136005)(6506007)(7696005)(186003)(9686003)(8936002)(66946007)(66446008)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rfIzGrQ4hrWncVXDRuxgWDvUryZhwInYzOkSHSnCd+q099K/STjPbxpQUh3y?=
 =?us-ascii?Q?1Xd+LK/J1Wzy92OaenKtlJgtDgu0lT507EkCxBO4iRwUYLJYZ24xJ5+5NX+l?=
 =?us-ascii?Q?+mx+SFiqMI/+lqPPPRmcfGtPTkL9k/bXOoBOIrBjngGgnISDnZVnSDOrh0td?=
 =?us-ascii?Q?CQGUo7wZ2ItrPdSn/OTaAD1VA0MDtSqOswhICqB2t4Pg0fV/0PiloaFdKu3V?=
 =?us-ascii?Q?6vdlv5qgeCHRJs3KAkhPy95DamFYeEQBOb6TzbxpRFykSqVFVtjxBnFhKgH+?=
 =?us-ascii?Q?bIJ371Bf/iaG12pz7MkLtzsvds0jdMv1CqDDsje4S0QqqP+vlAIPpIH6+4mC?=
 =?us-ascii?Q?1HUPxD6mgs5OYQsksn+0G8mkJWsAll+FnOwjWpJBTlE6j20Qe024swxhJ7gC?=
 =?us-ascii?Q?52DdF4dXkqh4hHQIVXivTwwpPj4ZPh6HHhB7RK7iVy7T4APBKOZz7q4i7eKx?=
 =?us-ascii?Q?prcTtD6ftJ+jWZYSaSHs7HVTvmrw1hnBTEfzvddcziQBt4SxsWgJ1szrKXtj?=
 =?us-ascii?Q?QsxfKOH7qrTvTztO5lrFkx3jAYvAbkfb0ELubMGUXRlFWcHJE7gcQYyqaTtY?=
 =?us-ascii?Q?rtpxthlToVSIIgydZyjfboK8omHsqsgfEXfsxknaQFi0hHYJ/Bfos2F8QxPf?=
 =?us-ascii?Q?/yg/jPL3Yh/oLReyOiDVmXrzJ9wPuO5MU4/0F7BslXJtwi/ljKs0jiDluiOq?=
 =?us-ascii?Q?NnetmPTSjwAUe1aue1bATLUvkrjX3I7AcFECmw8r2bNz/MCnLzSIDWsHzytM?=
 =?us-ascii?Q?UGmR12HMZD/jc+kJ5KjObPifbDsKubl7SHQdQSnFpa2TIIJV/19mIvIWw7z3?=
 =?us-ascii?Q?ignf6b0jiQpJU6eNuTkk8C1KbEKAZ0ua99c5KVcTku49mHcEo1gWuTJkdH5U?=
 =?us-ascii?Q?347LXinhrHcpInPQO6dG+KxmcWRZGf/mHE/m9vSLUIgW/L5hYbjGkh7hkGtR?=
 =?us-ascii?Q?AQYCjUGNkU5601I99tuZ+6vsJdhACQucusPyM/rMHIiyIY67clD6wZVy9PUn?=
 =?us-ascii?Q?cm1Z5LBytposOgvhmufX/dEmO6x0dM2BRqiAqJO9RFqtzAAIY03AEYkK79um?=
 =?us-ascii?Q?hrs5VVADE4jcGJXb42/CedAIOoDvA2du5+b0xC/8DUz4f6kGQjknYm5dMerV?=
 =?us-ascii?Q?xglMh584ti/rm4wutfabIfm6mnTtrH5QyjPHdXGtlelEgDsrtywUp/FYaYYV?=
 =?us-ascii?Q?FcddjEIIlWINOwcf9jQPB9aH/G3ryw7sPV2dD9PEWH5Mj1VAQGME8joMDtDk?=
 =?us-ascii?Q?pYN27znC+mYYJoEubVFTiAvDf8BpDuvpWig940s0snZ5/O9r1Q81l+j4f2Lw?=
 =?us-ascii?Q?UIUIePhd7xMhb5Gg5bkQmoIKsAbCyfUimUe+RWp0bq1S8fuULsarWJSJ0yc4?=
 =?us-ascii?Q?cNC9iA0n0fbGpSOgoBgnfRxslcMJUUkFghdhZDJruLugCJLKznLHCOF6DZyB?=
 =?us-ascii?Q?taezq1O0dnk/bItTWYM/MDxb9n0+86Ef2z72TCOFArqAhDa3cWb0tQZO3fcq?=
 =?us-ascii?Q?vX2/QWIx5s5co89bAeqOPvcBkEEd6U0GjrLdyueopkkLh+uttDhOmME9G1Ks?=
 =?us-ascii?Q?bMSBeQF7QGcSN9oCE0o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56735304-0bdb-466c-596b-08dadc3fbef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 12:52:37.0900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w1dmeGDaZ1O66YDjEfvZvM/DYhQ810KM5xKLh3xkh9UPy7rud+48nxFYl4+pvv2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoZeUayFwnPYYgtOR8VIQCEVs4AdTgKhDzx9iitU4dI=;
 b=JCdDY8Q48vQ+XaEGMbPRQRiRr54G2JJD80eE93O8HwImCond2xzKMASPoYoITDcELIWEotGeproL+eEEM/NaGQs8ev6yqhND2W8irnEZiGOjxugTqueJ5ThveFF4SpI/EhR60XAPQ6inqBkXaB3SHhSqh/Lk9h74NU/f8EpWB0c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JCdDY8Q4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always 
> tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. 
> Rework the logic so if the pm_cfg_obj isn't a C file, it is provided 
> directly to U-Boot.

> Can you describe a use case where this would be useful? While I intuitively understand there _might_ be some, I cannot find any good example based on my experience.

> Building the pm_cfg_obj from source code is very easily done by Buildroot, unlike building the PMUFW. Additionally one PMUFW binary can be used on multiple zynqmp hardware, while the cfg obj is very likely to change across different projects, and a somewhat readable text file is way more understandable than a binary blob.

I believe Brandon should weigh in on this with his opinion as well.  As I thought about it this morning, I just wanted to share my two cents for what they are worth.

I agree with you that most users would want to build everything with buildroot, if they could.  Right now, we support using pmufw binaries only because we do not have a solution for building the pmufw itself with buildroot.
If users could build the pmufw itself with buildroot, I am sure most of them would.

However, at the same time, does Brandon's patch really hurt anything?  By allowing users to provide a pre-built pm_cfg_obj binary blob, it does not prevent users from still providing a c file.
Basically, it allows for the capability of building the pm_cfg_obj.c file with Xilinx tools and just providing the binary blob for being included in the spl/boot.bin by buildroot without removing any capability.

So from my view, this patch may not be critical, but it does not break anything either.  I am ok with whatever you and Brandon decide about committing it.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
