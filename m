Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF3AC27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 10:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE749400EF;
	Fri,  7 Jun 2024 10:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppJrm4fZpcav; Fri,  7 Jun 2024 10:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C7640217
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67C7640217;
	Fri,  7 Jun 2024 10:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 216891BF48C
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 10:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ADED40217
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 10:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jD3e7uzCRpCW for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 10:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C346400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C346400EF
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C346400EF
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 10:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdkH/b2tSI/QuoEXHT6DkAp9GorJfLUEsTIUJ9K88dK3Z1J3UjK2gan29bcxNMkDTnbk41oyIHyXGumagg1WfzpDSv1S03+z4PsAhG4JHz6M+ojV2/QKVUvvMYwTeWNr6N/jYtFXQebPZfXoeZZVDoLnbt0G4AsJRbEhYf4Jt/Y3ufx3NDsQO04dowb02ORtuj9pxrTjErwfdPvt9+rFrzxAe/CaxIJLOIl3p+DbwX4k6kNyUITJiaXbAT48YkSDcPOT/Qahrssyo43We01pgTphY5wggxu0s3zde0GR11Jot9EIzOI9BuFy69yYZUqFnx1EqyBAD+waBwpu8mWztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNyddXsd6TW6HDgOEcc49fG6bDERQgF/t8ldfBm25MQ=;
 b=EZLi7lQxU2fV4sOrqy/8fBbPowwrML/N/daGyMRjd0o3f+y2iSvwET2G90oATqmh2imeVG2HS6L3H/KQ9VhiJ1PD6/lo4b+eq3PAiFCtKldiXOAUIRWCmxAbZ5xWYZzrgR3glzuawO6GA5UslZl/AZilm92DFyZZc0x1kASHw1WaiaILYFyRoJn2cKJ/Gvl/2r9OclSSM6p5GvLOEYrjqfjh0N395dtEOqD1HsjTbKSGKq7M6ZtlnZs/BZAWX6FqHJ9PKptWH2bgge1Ww9cWRbL89pQUeAwWOkGxs+33V1YrYRXX23k+t+VdZlohJD9qI7N2OV4VYz1njL5wVhpNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 7 Jun
 2024 10:04:57 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 10:04:57 +0000
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: [PATCH v12 1/3] boot/zynqmp-firmware: new boot firmware
Thread-Index: AQHauL+w9GZ3wdE+SE+CYlYttlT1wbG8Dv/w
Date: Fri, 7 Jun 2024 10:04:57 +0000
Message-ID: <CH2PR12MB50045B54E49332170D4CD222F0FB2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240607094705.1962913-1-neal.frager@amd.com>
In-Reply-To: <20240607094705.1962913-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BL1PR12MB5729:EE_
x-ms-office365-filtering-correlation-id: 970aa85a-7f24-46f4-d9b3-08dc86d9492c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|1800799015|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XA0F5N997A/S7akIoKuL4aenA7ikGXiiMAqOKDV1WNGQiTjhewqVM/ceQUDB?=
 =?us-ascii?Q?xZryEj29+xM0FIMnD38SwB6zZnV02N/QfECkVr+Kb3eSJJsFc4bmhHJavNXk?=
 =?us-ascii?Q?RLyajsIXonp5mVK/ggjjGMvcZy50gWs3JzNWHE5br/u2mJZBQGKO0AlORGPv?=
 =?us-ascii?Q?cLiAX8qxZXwA2tFemFAy0Zb/D9Lh1ql6IBlAuph9AWMQwAA3M5Uxv7mG33oV?=
 =?us-ascii?Q?Sa/Qrsal+jrO02FrhcarHegeUkIDYzWheENuq9RPN70O4dWcQZ8RnSfCJYs2?=
 =?us-ascii?Q?nJGwp3vfyxss6UwXTdtBz1qUEHbHdtBC8h+g5SOhwN3YwvwpDInQ4XGQCkBv?=
 =?us-ascii?Q?Dj1vutSPTtyKbymC7Y+p2nH7mpSlGzzFxTadJ8zM9j1tscuK7CvjO1XV43yN?=
 =?us-ascii?Q?mBg2Zla0eRsCh0/WNtbB3tRn+c/PpHVoL8M+d+kqc30beVlEu5nFvP8anRQn?=
 =?us-ascii?Q?fWiApyWVmSX+RGAWGILVlT7cL6wi985FKLUn2J+XSphxiwe7qCuX/GjUvEM4?=
 =?us-ascii?Q?gzDkNuG/Lcv7I/XqyLPHUTcqaPsUoPoQUwHQshj4r/vmRdYySMkedEcLKuej?=
 =?us-ascii?Q?D2IzvVk9G2xCsVGKRIREvvFGuzM1KGJETuhj2q/TNpB1lpUZcr1X3NLUZDvw?=
 =?us-ascii?Q?BAu6ih6YUD74JVzkaISwLv3oYjNxUqVtG1HYc3zXijbFLDOYurCn8eD7tZgH?=
 =?us-ascii?Q?KAtGH6Ljjza6wMzJU5v29yzW5JE01j32wyTpuMZxct5JIw7lszjOG87yEy11?=
 =?us-ascii?Q?vLjOeziTufvacJWf4NAK/5XDRPXoVdO/J+sDqJGthwhYLfVXkoKBTQya9zdj?=
 =?us-ascii?Q?qmSKW5y6aZ1q2/LeBOn7DkhCQuUDIa+pmT6BoPYjSnnF9hgilCRJImbeVqMX?=
 =?us-ascii?Q?6Ch6SBfAa3k87zOZn30Xnj0gehNtmyR+Bv+ldNOmzyF+azRMCo5ZwqrhNYYZ?=
 =?us-ascii?Q?ecpXoa1wtlKOGtUCv7paDZND6d/Ua37wJsNeQ7VwicOST3iSuPy54vRZrYPi?=
 =?us-ascii?Q?ds4CCEhRed0oJpdmDQ/cHN1W5e/pM75eMnhljj2dlAd8+ZB3UXy07+RM97EP?=
 =?us-ascii?Q?hKUd9rarc8ZuwRSFrhsITZapA81VL0AT7pwdxBJeeqahhq9pR8NFJb56zJND?=
 =?us-ascii?Q?+4u25e+4uOfjs901fTqdXfyxIfvuZtJq9pdwYtll35MszB0B3xm0IPMzGPfr?=
 =?us-ascii?Q?01BZP76oxeDxz7Q5+oHql1E7uWgMLpwDJN4p+vIIf4XIVdCYIer9IADBzRfa?=
 =?us-ascii?Q?s3ovxoI4wCl+lklszwgf9qpQB2rZAjVOkMxnaqQg7jXUp4zkQrR/WbLKmoOV?=
 =?us-ascii?Q?+g46G6nLQUWF8xdrCibbBPV010o+othT965eJeAdgQjVuSxnQjPEK09RDdU0?=
 =?us-ascii?Q?q/GAhfDO2UDluB8lswo55eJcbtwgZ3iUx+g3U99lebPQ1SB7og=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9X7tmEW4T+yAReigQfqrUUoTQagaxL58oRtEZPkFHUN0rW+jpuAPpAPSDOdx?=
 =?us-ascii?Q?9MQoxwlnlbUa9eWjrGc2my04zlqxhvFfWL3AkIgtmpnKMu0rSSnfcsQJUirI?=
 =?us-ascii?Q?8XQuO4tozlHwYDRuZr0FD88bf7QtQGmJJKMbQMgSC83UqB0D/yQDH65+6uaS?=
 =?us-ascii?Q?sNZHic9rMgwEOuJDwWma5rKlJy4lrpKy8EmS5Fz1nj8SA/4YNzlNUzt396Hn?=
 =?us-ascii?Q?fzznu1LROVDabIRhZTf1tuoRGHK+DoxGWiBIfATy0EfMmHedkY+UyOuxjl92?=
 =?us-ascii?Q?TmeodmVMOlrPQ0nss1M8Tg3aNpIpxcyXGkhvCeVDlZPOfh+k6iEJ+aD+MPS9?=
 =?us-ascii?Q?hDk9OSCGHIH7h+z7TAFHsYnRZbkrZU9XHuHb2bW7p6/3fiBFZAHYgK3IcL4S?=
 =?us-ascii?Q?12sibQ2y1/Ua9ApndMGUJtgs1gr+yU10wXWhYmShj2TPNYgZA54y1TRCKZS3?=
 =?us-ascii?Q?YtMnQbmSaE7CcdVE55WNwHH4xgk/E7KYOf05WL01XghOPhAHPBX4Zi9Vwv6d?=
 =?us-ascii?Q?JVU3pXj5HGJTg2qtzXSnMRj0ZmouRCDDa0449qOtp2UV5omcP+XnfE4okrC3?=
 =?us-ascii?Q?EYQ9O3CONg9btUexUj0aWSe+w9nnMS00t8+fIqUxBzWo79WacNmKZdEixpRu?=
 =?us-ascii?Q?dXbrDWAZsxLclFg3EsNKn7FBCzeeGX5Bjg2vf3ytHA0xeTsUASslTO5NZe1S?=
 =?us-ascii?Q?AdeTrOLX9fMrVB1znLwKweHxVzwBDqF5xwF66aIC/FkEPnK7TE/Mm2U+pZhr?=
 =?us-ascii?Q?DNmc72kLTTYJ6GQgL2UWWsl/UfCWVhvoUlPW+sCgySMkd718QCvNjvPT7A6p?=
 =?us-ascii?Q?+Cd4Xb4rZQnVMFr8EcrNETW+rCUFB1snx5iVkBlcFdFq4f7+6jUzfsjHXWmu?=
 =?us-ascii?Q?zL9ASxfoQGnNiafieNs4cPnqeiluAgdcMx7IT11NmnObwaKXo16Dn7vzdLF4?=
 =?us-ascii?Q?NaH/C8S/MR5IoQ76W2NCaLlAMUdGyC5t7TiTZYAjOlXxsUw6sU6/XJt9H0C7?=
 =?us-ascii?Q?gkEOGo/YZPQq5ZPMB5T+qaMMg3zJRwcUd3OUc7eHJ59oeig4oaGKCARTpX0a?=
 =?us-ascii?Q?5ZHU4TN5DxDxe8GN+w9ueCqmUAqsiEjsAODEdN3hrUYOeFw/MSPqGDtRpHEL?=
 =?us-ascii?Q?J8G/6kjlZmym7aBUDILzd51MLWZR3cLk4L/yguXaoptgDRvhU98WCwB/gL1S?=
 =?us-ascii?Q?jJmF7Jx/kqRve6p843pg94MA7JakiegIROtYnvoCnO33+p+sO2zqIVRdas09?=
 =?us-ascii?Q?qG1ozuuN6MJ7QYmribNITEcE8YaiV4zjDI1shF8065HEUeJlW+KC1yK39BI3?=
 =?us-ascii?Q?Q7FM2HHk1EdoRsVqbeeAH0jEZfWBUKIXtuwgBMnE8zJ0edAyJfmz1jHY2K2Z?=
 =?us-ascii?Q?brihfxP0byCr1BrkpuNvnKOz8PjhrCPLfbRIfHVwMOLlwiBjVmJfGms0ljef?=
 =?us-ascii?Q?sZtCSqyrfFHWfA/qP3rVekjyFEMXiY1e+4BpEKHaNpoZxe+8RHstycuHGbeT?=
 =?us-ascii?Q?B7hn50Qy9Avu8BM3x4tpegQzr5PBAA04nbLLNeazQEqTemqKsB0A+soD+CP4?=
 =?us-ascii?Q?yRjgOjh+jY/jj1XECvg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970aa85a-7f24-46f4-d9b3-08dc86d9492c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 10:04:57.3195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjLykDL3L5CU6Cfxb2Dm90x2kkitPFgRr6Iycf/mPZZlzXQ3g+t56dhhcU1VPIMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNyddXsd6TW6HDgOEcc49fG6bDERQgF/t8ldfBm25MQ=;
 b=VxU7Vw+oDNQMwS+J/HC5L/KZPY9XT7Pk7ik97ppw4/3wYDo2xj/Twsf/1BrnO9VypxTI6d9tiHO2pU/3QBGdqY/Edf202vd+4n8az3lBAzy2pTF8oWLack8nLkym4hD66IOfgTwHR6AhIRmrEYdCmGZDRZPqsAf+MUsJ/9NII9k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VxU7Vw+o
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
 firmware
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, et all,

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
[--SNIP--]

> V11->V12:
>  - replace select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT with depends
>  - change variable name for check-package warning

I implemented the changes you requested and submitted a new v12 version.

I left out the following things from this patch set.

1. No forced hashing for zynqmp:
As we have not resolved how we will handle the hash for files downloaded with
EXTRA_DOWNLOADS, I left the force hashing out of this patch set.

2. No versal-firmware patches:
Since BR2_DOWNLOAD_FORCE_CHECK_HASHES is already included in the
versal_vck190_defconfig, the new versal-firmware will fail because it uses
EXTRA_DOWNLOADS to download a PDI file which has no version in the filename.

3. zynqmp_kd240_defconfig:
I did not update this defconfig since it has not yet been bumped to 2024.1.

Please let me know if you think this zynqmp-firmware is ready to be applied,
and if you have any additional feedback.

[--SNIP--]

> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  This package builds the PMU Firmware application required
> +	  to run U-Boot and Linux in the Zynq MPSoC devices.
> +
> +if BR2_TARGET_ZYNQMP_FIRMWARE
> +
> +comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"

Resolves issue of a user building a bare-metal toolchain for another tuple.

[--SNIP--]

> +ZYNQMP_FIRMWARE = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
> +
> +define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(ZYNQMP_FIRMWARE) $(BINARIES_DIR)/pmufw.elf

Changed variable name to resolve check-package warning.

[--SNIP--]

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
