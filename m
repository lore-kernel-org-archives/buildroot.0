Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B91C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 362B440413;
	Wed, 12 Jun 2024 19:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCPYh8RpJ7cg; Wed, 12 Jun 2024 19:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3E04412E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3E04412E0;
	Wed, 12 Jun 2024 19:28:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB4E11BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0110402A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MH5NeEi4Bvp for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76F9A40292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F9A40292
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76F9A40292
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK61H6/YiWGDMvYEu2CrWdvubzHMvhN8lZTg9ttS4KUaOLcoRSRW7sb5d0d9BfIVQoCG8I70Ie3OoOrLypsu6tdmZ+qW8EfeJd7P02OD1zFpvwjD6NARg4q0DB7LARmD7vrCO0uio3kWtM94QUJ8hGWRnmy4mVaVf2GbdPhlDYdvHBS7PAhIVIIE5c+dnQZHRBipfpBVGhW9/wvmof/dWdZHx7o3wmByoXahEmzYcg3jLMdVjPg0MVnAyw2hJhb8IpGu+EKMsYIRBZvPv6M7xNtMIk6pf82Vq2bmpuqI5TxHfMHCs7vmuYYC9Cmtb7s/6pWux9iEBWkR+R/uec9Qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIwZym1N3wPBl2mw+cOCFPYmtneM31BKUfN+ZlB2f6M=;
 b=Rh1hjHUraE9Dve+kVWngQTN727mvKTBLTpwZaxF+jCc3Y0mfBH/giU6rVgv7WsP9dNcSZqbYK0cxuv8tjUk0ZM9frEc2YdtP0CGiZaKnGBPJKZxtVvbf1vDItl7l5+iUA4W5TFneY92WorBmGLXnrDLX/kZ6E+Fzu1A9PG4Gw762nIE4PqVhd9tizJ3R7BYzaPlMoF8Dzr/ndXDGdj/YbEzz/XeJ2YzetYSYBGCSGm5BITXZ5DSlTX2rY4uDHDk1pf9FBcvAIqfEWO43+9O+Ig1gwaj7IloGdMnuqmiPAyW97fAtVfmzzDNlMALveh+cnijbifH+E3RBAZ7l2LSl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7178.namprd12.prod.outlook.com (2603:10b6:806:2a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 19:28:48 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 19:28:48 +0000
To: Brandon Maier <brandon.maier@collins.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 2/5] boot/uboot.mk: new zynqmp pmufw
 prebuilt option
Thread-Index: AQHavJ39CXlZmtK630Wxd8FcLl1AI7HEfPmAgAAD8gA=
Date: Wed, 12 Jun 2024 19:28:48 +0000
Message-ID: <CH2PR12MB50040069C1F8476DBD4FFAF2F0C02@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240612075559.436482-1-neal.frager@amd.com>
 <20240612075559.436482-2-neal.frager@amd.com> <Zmnw02UInwrQx3f_@bspbox.kirk>
In-Reply-To: <Zmnw02UInwrQx3f_@bspbox.kirk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7178:EE_
x-ms-office365-filtering-correlation-id: 40bd7acc-fbda-438a-4319-08dc8b15e244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230034|376008|1800799018|366010|38070700012|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Fae8zPKYFa/s7QJGrfaKadN+m3kL7/Ydi1qtzbldgE80sbxMjTIBzVpss5Bo?=
 =?us-ascii?Q?M9U4Xrcx8QzRh/E0Z6lWvsuHkPq3/DPGlm5OfA5W+g8MJdBQpBlQd+TIIdQ5?=
 =?us-ascii?Q?ai4kw8iG7bxaLL6jTTbrwtKpP/DzcPM0uNsrLbC4U+phy9axMXyejs9vQ5Sn?=
 =?us-ascii?Q?XzbJ0rF2p2+ey1D4qT1N1egB+4jg++/0US9z01q5jAnPohhOwyHKKp+VzdV/?=
 =?us-ascii?Q?OkoKA1j/sqOwfj//Fre2kzYlA9OwtBBkrDsrjOgh6UnaXh5b4f3bab+zPEtB?=
 =?us-ascii?Q?FOP3O0tAko0yY0K4TTqO4gp69EJUgRjKCJqk1RIbGzaFMB0wBp5QwvOEhtkV?=
 =?us-ascii?Q?vjeWtabQsaqr6qNhqOlzX8V2dPVg6lWkyPpMiU+CjAxpegIZPkYAuN0erqjS?=
 =?us-ascii?Q?WZeSsPHOcKjWclfd4jRtrB2x5nx/4aOXWrOGRKnHOpdbKmb+lmGV3/5Y+7gZ?=
 =?us-ascii?Q?G8mJithjgVF7oIU5q+Ih8X+YwEu9oFGWexjkS3ACvikISk3+FaAYFCOHt/kX?=
 =?us-ascii?Q?On1HgN2X6i0mmqKaVap/WFHzNfZgLCelxPJDB3vjCEPGRYFsBm03FQOqKv3i?=
 =?us-ascii?Q?QDOUPdUP786/PwdDNE89cFXH29K72Q249k6xdR4NjPw76SCcFAWoUANozmEi?=
 =?us-ascii?Q?t73ry1Ks8EjL27cd03YL5KdMgnHYbOpbq7dQs5J9R60wvamqmARL5BFigDw7?=
 =?us-ascii?Q?VAxBVSfKparcWEaWBn7Y6psye4TmSeqxKq1UA5Pu5sIlXOPrS3y/qyECLAlR?=
 =?us-ascii?Q?xJKz5Rfm+O8E2+ZcgHYMWDRUaSxAdJ/U7HhHoit/rtBSXWFwCR0PltcUQgbs?=
 =?us-ascii?Q?+cY27ENbCsl3HZeATIhqyjjwhb0vaYfO292z7ww7nQfoA5eOKhmIQC4AyL3l?=
 =?us-ascii?Q?VzmeqB6+kcie5XQwMmaPdlrQycbjmPNWNLSeHWKEpV52hUUJ1TJSY7T7hX0U?=
 =?us-ascii?Q?pLZ9RsbUuSw8/tlrQGXjM7qPD3v1Z06Legkxq7xhYjpJRrYoC76L7KKlaIEd?=
 =?us-ascii?Q?S/Zz2D21t49G0+gWZSawNVKUpYyq9C8iNXp+fGzTlEkQrXRU7nSEaOYlpoXM?=
 =?us-ascii?Q?2i41zhqIcTDkzmutII/gbJ+VyRJNmY+lxc11KGeDGhuCuhgA1lTn50dTD39l?=
 =?us-ascii?Q?jsD8NTFvI+ato1D75rBgFRg63oO0NCzmLZaLvTitkDkBExhLu5CGbZbb+ydH?=
 =?us-ascii?Q?e/pe3Z6QSq41Xm9+eDfiAUsUdbU4eaBUs+eBy9lPtjnvEMYxtpdeX1PsIRGB?=
 =?us-ascii?Q?ppkFiXhBQdmVAKpUNfr7buoRQ1PwghQXylsWzeLbEi1Qe81s2G44R94aCyk2?=
 =?us-ascii?Q?NmarUtNxrMmJAynefRa99Gl0BX8bQ9+xcujDwh+ThCrymg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010)(38070700012)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H6qB7fy0HyNY+/TxmAYy2P/sUkpIZUV1sdK59SEBCfVeeiUWI5L5BSz+AOTI?=
 =?us-ascii?Q?Lm2m1bKATF4osrZV+uNjV4kOJS8D0olnnFrvXatk5MPHT8K/TMwwl5W7GamZ?=
 =?us-ascii?Q?ikNk7pdaUbv/MmIrGbiE56b38WxZdCgP1uuF9ox3OYERXa17dGsMwQayj/ie?=
 =?us-ascii?Q?fU91fSVUJcXopecC8Fg3qEHTnf1U6vtraXRCiPyy9rWn3jGnSByvRR/1AHUf?=
 =?us-ascii?Q?CRcb130aGjVY/Sl/l/OJZna7zRFLNUt3IyRHQAMbcxYN7aRhNqFjNOrTYKJA?=
 =?us-ascii?Q?lmYax7iPo+J8QqCikeKJ9Ad5CGVrSvoUAmcktGQqn/K38S9ipfoEIX3H4RX7?=
 =?us-ascii?Q?lpHlfhEx1xL3ykT8J+V/QldfBVk2CV7bfY2QRWK88PODSoWgQyNBHlr+J9PB?=
 =?us-ascii?Q?N11T4yNaUJBi1YCqPuvm+2CaLykBU17fSYVA2tpq8l27gwaEi/DPrO/HO4k4?=
 =?us-ascii?Q?J1PK+3S1EX+5WB7P48rCIW+5oFvLilcmxJgj+Pm7gywybQs0ShL0cUIfZpOa?=
 =?us-ascii?Q?aq27Mbk50IowaWTWROIfi91hIQdXRNttRD7JocPIk4J2gm24Vxq2ySBUueY6?=
 =?us-ascii?Q?91af46mGtXf31JIUFCx9dtOIqO0zj/eL/JJML+huQ9idhjWJ8Ej1NFjkVZx5?=
 =?us-ascii?Q?KcOXD/WdjhmFfuzvGMtruOXQL5U229xkcM7Y3qE3qoS8/5M2caDsXZBO/HgC?=
 =?us-ascii?Q?B+EX8ZpK9WSbOqo+dBlkLyrd2f9Lrb3Erj/UcgHpQg3pFscVnGedCsTwhW3Y?=
 =?us-ascii?Q?obdmZGghoJoqWfVPDOBFyg8Mv/EKVYCgzhOC7Ay5KVrGI065YwKNBd/TuoKB?=
 =?us-ascii?Q?wVy358QK73rpdp6USAJyvX6/acJkfJrR/kK3HycVrRS/SRL/6ThG/2T2tBQA?=
 =?us-ascii?Q?m4Y67RbXTCMX4m92+DYemM982ppvPbs25GDcO760JCfpxXQQoMBUrRiPHper?=
 =?us-ascii?Q?yQsSOjeJKTllFe6ChYgUNtyIJyB5XrfcrHYbEmCSIxisW6gAPkt4lkkm/9y2?=
 =?us-ascii?Q?ztH6Zv1dsDdBNjl1l51xqL0XdN/XuG2f1HbQHnXjGJWBe4fMm/FGhlauYfAK?=
 =?us-ascii?Q?00qCgmhrIxWbP/t5CJV6rSx4lgfZ2RbDotoCohkuS1vTNMK228jbV3VPzK8S?=
 =?us-ascii?Q?r6UrNd0tzMBlkA26fISDE5b6xcLQyePQ6bqwXUAfaM5+4KunbgJJSRNAzG3D?=
 =?us-ascii?Q?fLfdWsr71vHpc47H/eIjK99Yh78mTad92CnUVQzh+K/fqTHvwFl19ndll6q7?=
 =?us-ascii?Q?3B25xsvb7uuJQyKRgAMQVsejD4B+8B0LmE3hHJdm0OSV3FMKKGCgbWRGydmk?=
 =?us-ascii?Q?9rW+D9f8BIoQEnKKuRDi/BsKaALK3c22b44eppZEaBoxfWc+4JY5tZYqKX1A?=
 =?us-ascii?Q?TtKp8LyWmaRzh3HfsQJYfX4+QwE8YYoQYDb8jFuX5gN39RSsTm4hJlIA8GfC?=
 =?us-ascii?Q?dBiM4XuZOuhnh48zRZVkQUxVzjKT9w6kfOV2Mnp+vw5rj4oXaqxk3mHHORDX?=
 =?us-ascii?Q?gROrYy+Bgd2Y8ymImcNXouBWDbNG/CoIkOsCL6qevIMxYdv6lKI9OHoSqGbo?=
 =?us-ascii?Q?Yj42/J7CA6d5AcegmKI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bd7acc-fbda-438a-4319-08dc8b15e244
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 19:28:48.6372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiNE6FjMZnVzZ8nKcJ3h73F/WkdJMjybjnPoxwB1r1RVYqCXgYanLmAKole7cff2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7178
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIwZym1N3wPBl2mw+cOCFPYmtneM31BKUfN+ZlB2f6M=;
 b=rT/zDHuW5vKp3iKJ6WbkV6g9hEh8MYaZELZvmXj4bqZz34at/AI872wAW6zJDQkUdMLhmM1gPgqXfRUoxSnaPAiKVY2n0j6tDLvosb+kzmdNJF8AqMu92qUkWSgRgyPvXMVPE3yvciB0D+TC/X+TDwLmIx5IY0y8mEY7DVv43P0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rT/zDHuW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/5] boot/uboot.mk: new zynqmp pmufw
 prebuilt option
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
> use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/uboot/Config.in | 16 ++++++++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index d0901edc9d..9d275e8611 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +	bool "xilinx-prebuilt pmufw.elf"
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on BR2_TARGET_XILINX_PREBUILT

> Since this is a ZynqMP only option. Shouldn't this depend on the
> Xilinx-prebuilt ZynqMP choice?

>  depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP

The kria boards also use this u-boot feature as they are part of the zynqmp
family.  I suppose we could add this?

depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP | BR2_TARGET_XILINX_PREBUILT_KRIA

> +	help
> +	  Use xilinx-prebuilt boot package for downloading prebuilt zynqmp
> +	  pmufw.elf from https://github.com/Xilinx/soc-prebuilt-firmware repo.
> +
> +	  U-Boot build process will generate a boot.bin (to be loaded by the
> +	  ZynqMP boot ROM) containing both the U-Boot SPL and the PMU firmware
> +	  in the Xilinx-specific boot format.
> +
> +	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> +	  prebuilt option will be ignored.
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	string "PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	help
>  	  Location of a PMU firmware binary.
>  
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index b9f165f041..5d12c6283b 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -436,7 +436,12 @@ endef
>  
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>  
> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
> +UBOOT_DEPENDENCIES += xilinx-prebuilt
> +UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
> +else
>  UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> +endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  
>  ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)

> The `endif` should be moved to cover this ifneq statement. That way when
> xilinx-prebuilt is enabled it doesn't do the "://" and readlink checks.

Does this really matter?  If BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT is set,
then UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf, so there will never be
a :// in UBOOT_ZYNQMP_PMUFW and the UBOOT_EXTRA_DOWNLOADS will not get set.

The problem with moving the endif after the ifneq is that we still need the
UBOOT_ZYNQMP_PMUFW_PATH to be set for the rest of the functionality to work.

UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))

To avoid duplicating this line of code, keeping the endif before the ifneq
seemed to be the cleaner solution to me.

>  UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
