Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA2C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 09:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D7B240AF9;
	Thu,  3 Nov 2022 09:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D7B240AF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6u_nkglOnwIV; Thu,  3 Nov 2022 09:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDDCC401A2;
	Thu,  3 Nov 2022 09:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDDCC401A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6A701BF381
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1706080A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1706080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgSb3ltLx-yv for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 09:03:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C232607F1
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C232607F1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 09:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0voNe8dN3vPESwkA4TeZoRIUlUpWAgWBe/0dNkEmzito/Al8w79OrCcojRrJL0JxzQYkl6ZjWlstpZGVYPM42ZtZJMVJMeOj4bpLnPS1tVNY7eXn0pwThnIVS9tzvERqB9PXGBT+m6P31pdSLlQsXklpH3Dh2ANTLgxRvOvRM5k6O3633uuuDzDCnY6lNwFAaOGVNuxJ0pORiqmJp+j+INukRHuiwAzhBunzxMt6bmb2INQr6KZYkRDM36e4HpVuW9Nvx1lIbfsbVgGxY+zprnlayQ/ERWQknl4smOhOLryygTcBvfPaGFybvlJYIBMqjYMtWqX7KitcfxVUvH5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhmnKnRwPfnzU/oIRqsDGwm5MxWt8LtjxcCHzrRcZtI=;
 b=b+eQjVloUK8GErl8fz4INalQyAb/qgW5wmKME097ENaU3X+Kf1K6TmD0f5DyQCoRSlMBFLUImDX9Nk5XiD4Yy+SM+6GsidVjyRurJsYk01Q0pQvglayWfOQi7ZO2xyE6W4w1TKNdalHxcYSjiBQ/8m3c6RJwQyYSq/cn5yN1lKG8wnxt+xr1h9LvE+YqbxwXt39NzvtBOsTLt6HytXzsUxJd2gyBuYxjLSZpAtZy78t11SPh2Gr6TO8K16uZ5Kd71bmrOR3iULMAhIDE1ErzRwnwhK6lf0hKLvGsyT/Z9Pl6ZD9r1jrw6GWlNzxJ2ar0sVk3d8SGzA9ruqYuEyrxUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 09:03:08 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 09:03:07 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 2/3] add board/versal
Thread-Index: AQHY57QJFMeAQuZyl0SGBDmD8mbSS64s6TGAgAAMYBA=
Date: Thu, 3 Nov 2022 09:03:07 +0000
Message-ID: <CH2PR12MB5004151303A834B41D5BF52BF0389@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
 <20221024142216.31273-2-neal.frager@amd.com> <20221103091431.5e57a65b@booty>
In-Reply-To: <20221103091431.5e57a65b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA1PR12MB6678:EE_
x-ms-office365-filtering-correlation-id: 8328ab8d-d7f2-49e4-19a9-08dabd7a3998
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WLW0ItjR2UWiqsjeM8mFelcx8L2OQIKI/j6TdaOZoGdoCRAqwp8CbjtUzm/2lVsA6fcOzlT8piAY6yCvxe1mgOrnvWEvncM/bDxXnVcuMkQFJxDacRdpoDfbmF3triYqN1F06iU92ZP6Lv5TlYwaXP3sjCWyN5KufnLpqBtnTeqs1MghhGO4HyrxqC+/hGvLooP7er642XKLNuxdm3hw5JfQsN76BJXriLDQDczK/8Y2wv+rbI2RZg53C28u+2wVNS9CmnW47bXvgz8XaNmgFo12WXCK/x+SNJOcXWbLzB5j4xbqEWnXgFvgTHxCQoK8He50KyWdd35przcVbYQBplgZqJcBgA6Ca0fjpfT4VekGS8+qQC2qOWXYRRsbu0pqo1cKUhh1RtykkSsdM/0eMPNB1JImbvdPrHS0sotW1uKqrjC7jqlRdIDDY5NI5CtOPeK4zmY68ZDZtByhnzMZcrqBFryhtYXxYpHz7NkZ1U7Bgl2LMOhHgC19LcT7Dm00YRwudkdl4Foge11cTIW484KvhVwx5Nyep6sv3gYbF5KGPeD40T1vAwoI71EJcBw4l5Ud2WfCJfZctIHjkN57LsEjGB55FY4Cfa0QsfSFU6K7OMVwv87tszKsQQ2Vvhcus3QvU7ZSUIKrSALCHqQ7wX0dIUgzKmdsksZ7doN4so1+4eAbWFWtQ3M9gGFx6yQlLmnJLhtfJkGmp6mYGJ1x3Irwr3eCqfZKrnltTsdXW/oyM0YrUU3NeRWlmtHTlet54a6kmj0PXbzhmkkNH1V1yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(8936002)(38070700005)(478600001)(52536014)(71200400001)(6916009)(54906003)(316002)(33656002)(86362001)(55016003)(9686003)(76116006)(7696005)(66946007)(6506007)(8676002)(41300700001)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(38100700002)(122000001)(186003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wvjrilYi6+h8wo+MzbhJpIGSSv3Tb3ooWS/OqJUiGvUysGUmkkEASigS2SUA?=
 =?us-ascii?Q?jGIk8NKhr0KCqTXniToLQbnR+N52Cp6vMAIUu3GBeZrE1DuvD0NfXHpLNLJu?=
 =?us-ascii?Q?n+F15vgQ8DXvek9jSVMbQyzTINPzAxTeKuw+eK8SO0nWO7Ggt/I+AGiC9S1l?=
 =?us-ascii?Q?IVzm7jx7/xG9AfQP6lkX5u8Dj1Cx5VlSEXh680+afRkhHLVJWdWPwsbiob7I?=
 =?us-ascii?Q?uihbqdqTabzck+xI2Sc44E1NCfe+G6qf8is8ptT8BLRJe96nt6UuRD9A0QJU?=
 =?us-ascii?Q?mYR2s16D84+L1Somyvs1y0CO05NvgajNhiRUGEXfJsxCqTevy3Ns3+E/IHcl?=
 =?us-ascii?Q?ObCWuPfJqdT8UNqs+gqC7wABicZ9n7ynboq++064B0DMWsjwY2HyKqmlg05o?=
 =?us-ascii?Q?AkFEZXgLPiLsxrriBxcz3nYKszxeeTC0AjyDJh9UFqTx1AK/Zq2Aei1S5o4X?=
 =?us-ascii?Q?e4Tmtjnq8xka39eCjGkyA2jtPM4+COaulpKVC2KQfRFIpRX+mYScVT1OEJXP?=
 =?us-ascii?Q?jTO/TDvj0yRnT74KDdt5UJCxCbDySjF+UMuXT7v9PeTMk8tHN5Tzs/u6agd/?=
 =?us-ascii?Q?zE4ZbqIoUQJ5QC4b19tXP92EJnv1/tJYj7ag2yc0wTmjsjT0dhQxtWHZvWTp?=
 =?us-ascii?Q?tdfSo7DmPetxxE75vNvydBw+dYNWBX9PWPK+s5Gc93aj74KYHFvsXJDGBpAq?=
 =?us-ascii?Q?wjeMieOP6vogQKFeE38z3WyRDmXnfNfEe/blH+c9cuvSnMEM9uXiAxuY5wcb?=
 =?us-ascii?Q?UmWc7sXvfpubePZsH5IRNTz37qcq9zE8SDg4QBSAvLYFEH55Ire9Mta/UO/U?=
 =?us-ascii?Q?MfILmJJoj7DVxdL/7j2YTo6j5mJhGZqlXRTodkDriB3ipcbNqYF0XoKQV/K9?=
 =?us-ascii?Q?Trxv4alJm+K5aZW1HZnOxgQEI3AY/ZSKBxokKgNDE/3XotTlnMGZtCa/ewt1?=
 =?us-ascii?Q?BjZTMeb5FqLbn5zIziD8SwE67Kc/D43B0vGKnG/bf15FKrATvksbaJcJfkfz?=
 =?us-ascii?Q?B3DsNrhyB9jZ28+FEj5WgR8a/OWXbWlQacqHcxjkKekrSIzN6zuSpyMnp1ay?=
 =?us-ascii?Q?odFoK9noWp7xnY1NaxpT4ecJe4xzPh/iT7uxynjlp2VlLAMTwYq/WHbIGMOh?=
 =?us-ascii?Q?cVgzuP8L/7uycbBPn3ROIkPY1XuBrbzeomZuf9WPkI/n1fP5y2Uv6Sld01nS?=
 =?us-ascii?Q?7CG21oX2dLdXbyxU2atClh/ijYl+v9JN+1Q63d6jXHk0eGNLgwyQp2KJQG5H?=
 =?us-ascii?Q?/d01Vzih+NTP2heNEBZYtIZWtvjLJZOuuxjdLlQ7BZ7nLjspwRpScdUfryoe?=
 =?us-ascii?Q?wiEfPPdLL1tZDFCY5ialBO4wweomUe1Szv76ph+Bl/SqEyD04KpY9oTo7P1T?=
 =?us-ascii?Q?9TS6CqLsnlitv+uZyy8gFnScH2ZBkRaGEK6zGcUfwSfn0fVABRMF3FSf8X5B?=
 =?us-ascii?Q?s62fzUH+ptU7VgD+k2MI4Vm42DIuz8te9r2D4gBaG4UJ7Hqau8GrstUbljH6?=
 =?us-ascii?Q?DFVCro2H6JMLWg5dyVKA1H7zEf2rMDi5rNuA+rd0ytOsVqQDLUMgtyhPsZS4?=
 =?us-ascii?Q?1p6l5Xjl7Qj1BFG75JB7g0VNjB1VqxMkFV9V+v44epF8MEOo0XDg+TlVIdhn?=
 =?us-ascii?Q?EI+jaBzuBlAScFaiCL28CGg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8328ab8d-d7f2-49e4-19a9-08dabd7a3998
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 09:03:07.5650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpTpbDo/17c2T7y+nviw1u5nME+qsWqPC4aF5302JL62auWZ426VYIosF8/SO5tT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhmnKnRwPfnzU/oIRqsDGwm5MxWt8LtjxcCHzrRcZtI=;
 b=g88beO6ZeEmSD8EH7C24S5ai2XxhYhnrN2NPMDQoPY4wBxZsviCBqYX5swfG2WVHGMQLFGsSRUDoOV52CudPj3PSjsZiE1TeBSSifl5kDPk2Lb7DpfhK5Mesy5zntvqBMP0ta4HHawLD4RpscplzCNMcJ2p1aC1HkcjL29EayoQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=g88beO6Z
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/3] add board/versal
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
Cc: "O'Neal,
 Terry" <terry.oneal@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> --- /dev/null
> +++ b/board/versal/genimage.cfg
> @@ -0,0 +1,30 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"boot.bin",
> +			"system.dtb",

> system.dtb is stored in the FAT partition...

The system.dtb in the FAT partition is for the Linux kernel.

> --- /dev/null
> +++ b/board/versal/post-image.sh
> @@ -0,0 +1,35 @@
> +#!/bin/sh
> +
> +# By default U-Boot loads DTB from a file named "system.dtb", so # 
> +let's use a symlink with that name that points to the *first* # 
> +devicetree listed in the config.
> +
> +FIRST_DT=$(sed -nr \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               ${BR2_CONFIG})
> +
> +[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb 
> +${BINARIES_DIR}/system.dtb
> +
> +BOARD_DIR="$(dirname $0)"
> +BOARD_NAME=$4
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
> +	the_ROM_image:
> +	{
> +	image {
> +		{ type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
> +		{ type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
> +		{ core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
> +	}
> +	image {
> +		id = 0x1c000000, name=apu_subsystem 
> +		{ type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }

> ...and also in boot.bin. What's the reason for this? One copy is for U-Boot and the other for the kernel?

Yes, the system.dtb packaged inside the boot.bin is for u-boot.  

For versal products, the bootloader is the plm (platform loader and manager) which runs on a triple-redundant microblaze.
The plm does what the fsbl/spl does for zynq and zynqmp products.  It parses the images in the boot.bin and boots tf-a and u-boot.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
