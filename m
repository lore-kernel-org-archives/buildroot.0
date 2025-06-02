Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932C9C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57DC68128C;
	Mon,  2 Jun 2025 11:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20OTatD9gybW; Mon,  2 Jun 2025 11:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB22812B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EB22812B8;
	Mon,  2 Jun 2025 11:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ACE5127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30F4C812B8
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23Oe9IvNFx5G for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:57:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::608;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E6F181182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6F181182
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::608])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6F181182
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:57:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhxuOWFAWb/+Ixyy+wRHu6yPGafnZxDDQRdLfLcU6rIi3CH+I1QvEzZsNqRFGMZZg3gKiECy6N3EGbB7ZQuLM/i9a3fIUVLBEHK1Rd0FD3v/FJ3V6oJ2uCmWsG87Hc5jL26r4FVwZKlsbSvvqtWuBZKRCTYEdWF/Uodcl2ZKWQz/Y74lQCjbLZsnYnZWjgOxc5fWnHZaTij9Lf1V/tZpxq1MDeVS4g1/tqaS5xdpLUwSfIuzI6EcXbdkT4M3FdOhLktOHSuzLYXFbcH6o/qenVAiiLhd/OFxq53xDY9UdsOWytcFb9W0urmbvImaoCVZTP4I+RTXhmBSNjh9qwVbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG6ZmeyDC4yB2Hat493/pXIbWobpUqXfbOc50qR27yM=;
 b=WL5Q0TYjEQ8GwP0yuOIztvrB4fLMBmi/axbYSO0HOhM/9/K0yC3N68mtCV/uans8xYQdwtcIUaIwubQZoX/X75kuAtDg7cT4omtOQhcLU36p5LbTqAzwJc54JAQbaoD0nbDAKD+/aUG7VavyGCtQ2F3wGFXZcwxhIg+jGAckmGs7CD7oC3si9+kekNw1r1P/Hp+et0DWGse3kPWdTLs7tBqRRO4/o2bhCopr4GnRWTpffuBH3VXF/84IkNJxv4sqyEf84JzrQFb5GhgkXHTX8lAmZD1cVAaPCF83L0/q516S1Ly+2dwfmOKDzvFZDxledSHlFvLeptswjzPzse/mmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SN7PR12MB6768.namprd12.prod.outlook.com (2603:10b6:806:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 2 Jun
 2025 11:57:23 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 11:57:23 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: bump to xilinx_v2025.1
Thread-Index: AQHb0YGO/lcJnXJMBEmVHbli4/1qfbPvxR5dgAACS6A=
Date: Mon, 2 Jun 2025 11:57:23 +0000
Message-ID: <SA1PR12MB56150EFB6580E77979B89CD3F062A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250530164017.473549-1-neal.frager@amd.com>
 <87h60ypdqi.fsf@dell.be.48ers.dk>
In-Reply-To: <87h60ypdqi.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0444bda2-1ef3-4ea1-9141-853ac8c69fdb;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-02T11:55:18Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SN7PR12MB6768:EE_
x-ms-office365-filtering-correlation-id: 9c37b458-086a-4489-52ab-08dda1cca2c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ELsrvBx8FKsMlpNe1815fDfgGTtotQehN/wAcH7ljlgaAknSswJ1AGW+5ZaM?=
 =?us-ascii?Q?gTjuyEwSQnE2TD1H8W9wtITQ87Ngau5e9/PeD+OmUQrrqwgee/BEbeS29u35?=
 =?us-ascii?Q?/t/lKu8zzXN71eiFEhaF1WIu0ARcJkfDLnLACHr1iSAkITqZxKKD6OSVD/SI?=
 =?us-ascii?Q?O191wiYoEWBFcPjpHWlTZ+40GDecPFe1O3wK0dICDlBwxkfw0I/0NeP1O6Z2?=
 =?us-ascii?Q?YDh72HZ2DpDmerQI9frnq8ULTPjlRemOwOAgW5Kjrri0bL52gUyZOJqCICup?=
 =?us-ascii?Q?gZfxixFBGfOWUDhB5grdSqbg4B28z5rNP9lDkHzgnBolruV3VmleN7J+945G?=
 =?us-ascii?Q?8rT7xh6HTr3XiXHDjMMxwfa6JPE0RgNQ3qJxyHIiHZzTF7hIJCNX2oH+igmv?=
 =?us-ascii?Q?y2CnbaK+ojMT66cOC0MUGmNIWGn55j0DbG5+PW1VJwqCyV7JbSXVeTR4BCDS?=
 =?us-ascii?Q?8cBF/3KsczM5ssPPxqIo6XFuPGNbQxA6ABMEZNU6mJOOQ+7kztd3nf6exsUw?=
 =?us-ascii?Q?Etv5qZ875N6Uz+z6AEBWxUERiy2JMupMBYsPtjPTOe0VrNhfg3oROzalKOFy?=
 =?us-ascii?Q?bxmXPHpkJgA1HlsdJiYwUaUCQfNqxhACLn5NUUKGeMshDK+HEC3/shy1ukWx?=
 =?us-ascii?Q?/nn7Uu4NMQ1hgYvC9j6Pdty8dOO7IS+a0oRxlSRF+iTCNvvD42FW6Og5Ic2J?=
 =?us-ascii?Q?6RMccoQeMWppbaHP+qgMAvBBOxL5u5vMdc5cXhQiIgzdT+Lcrd/HmkbfbS/+?=
 =?us-ascii?Q?yR35nv98UO2+U2RAMu8twvKhALPFGv1+AiVVwUnuuGRzk5l7/UNtufObqyFX?=
 =?us-ascii?Q?+IsekzhX65+XqENCtAOJQ6cGEkBRgZj+5g+UKMs6RxUQDINvom67E3VbCZdL?=
 =?us-ascii?Q?JcWBi6zu9Zf8XEmM0JYuuzmQkyNY5m+d9Ov+SmR83KqAQjTFU+uhUBsIlqFR?=
 =?us-ascii?Q?V9Fx2lyJ5aF5lathfZ1CmsgUR3d7FAMQ2RG7UEKQ8kS/gvO/9YjIWesEY0kA?=
 =?us-ascii?Q?NHg4yViLzsfMTOwAzViBseeZ2oLlEBzAU6zXKCEEbRLYCKhZIxZ5jj0j1p4f?=
 =?us-ascii?Q?i34an04zxI8kTkX0IhDpelodZoZHIDHkCVh9LnJ52KjKrcr5oGCHvPA1RxND?=
 =?us-ascii?Q?Aq3FTwu6VFoyY8KI7IvqQekoi6uXJzRpRT2Mj5d/Dt03NQmBKJpeZ2TFSod8?=
 =?us-ascii?Q?UrIjp3aUg5iZIon0dRutIp86u74W6jGd+xm3hSGWlziPHqvs3fhcZjpEGU+B?=
 =?us-ascii?Q?LGl+QVWesaoU4gKX7aGYEroR9syRM26gpWrKgHZkiMqiYUbPmOeWJah4Acbm?=
 =?us-ascii?Q?068BJWs/6LC11dG7gf4grp0sIVmJZGK3w6UEzTikJRh7gLrkg0RiL6xMIu5C?=
 =?us-ascii?Q?1V3IUGtWGWHGdp1Cb0ZdcFuCyc8JWt/oFYI5hTBxAVJxGTp8orL+Zeyxi8nC?=
 =?us-ascii?Q?QObzVP3Z6RkJna7NRADSBwSvwGI3XiINvzvSHjZmXairWTMNjjukDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b/HsIOJPrAjtzqXe+psEHgZdd9MAOOMhVEJ6R+RL17gXqgCfBIyPod8Zp159?=
 =?us-ascii?Q?OMgWZrlu0IqeZVJRdzHw6GrH1EOXPk8+I5/izQudFGy1UPg021Bktl5PK14I?=
 =?us-ascii?Q?RPvaF6otef0ACafUYdh3H6d9BIVl7FuWuNGukeiZSNlQrIDVTkiFIxdqXtFk?=
 =?us-ascii?Q?wEIX92wIDYNPCc3vo9oP8LwthelAsq39DicTTgN4eeLtPpp9U4RnjEfBWo09?=
 =?us-ascii?Q?FZBGlXGnLoeT4YX1c/tvrQ+6p0PiAv6DUrhWeOS4ttmoZAUWghaBprhBoXBP?=
 =?us-ascii?Q?OtHyDwYCP32uiRFQvIKnp9ZYbVeGe2kTNiss0rq6Tp1wXG0xol6+xA/uRG5w?=
 =?us-ascii?Q?Q9LFbxSoxe9uVmzwggRvJF33a/UNhwFOOPsKPzmCJD11xO9syjJ+ledYXFYz?=
 =?us-ascii?Q?hSWAOnLjygm+232l4pRqZLMMN58ip18dH8Unm396BXXbCyj3T8NeMoi+mswE?=
 =?us-ascii?Q?8Tqjg6rNP3Cos0jATNJNFY7yBbRkcj/AZAjI1tPxwU4nBAJkX9ul6cv4rPOJ?=
 =?us-ascii?Q?nBiMx4m4akbuZ24I5xpVgSu2XXxr1HAdLennsQ0miDLvfJXO3twMePVQxdDi?=
 =?us-ascii?Q?nuAbCGsxEdxVu/3Av+NOX5ortpx35Buwp9b0cUFspaMXkMx9TVSgGtaSNn1R?=
 =?us-ascii?Q?vNBbKYSnnTzo3+mm94uaFIggV2nzRRcPq89+N4fH1j7mBgAaMnqKJz8SgTMS?=
 =?us-ascii?Q?iYYzZxVMQNhcnLxep5rCJ5yzb3oLTYCJAzZKo4h4t7WQqUTaSTlXZW7MJJr0?=
 =?us-ascii?Q?6cy6FrgtVSmeUZYVr58qNINuAHPZk+hmd7lV3VnYVRFKChuGvblO9fax5oQW?=
 =?us-ascii?Q?tDNbsE7Jfr/lpVKRl5llQb4XUIXbxi0lCObbxLR01vj5Pz+h2ZWxNzrEoqqa?=
 =?us-ascii?Q?cJO9GzNSFW6acC723ntLduTo/PnmMXEfrAs+romRLLC/8GCPec3pKSuq0jVF?=
 =?us-ascii?Q?A3h1BurwDzyZY6Cxr/K8tKQ8Fw/7CPZENBXx35HObeQvC6bKGr424iczcpX3?=
 =?us-ascii?Q?HFTDxiNhmNgb66QT0dzeaBa7JfSzrXVaqksCYfY8AWfe2geftfR9XHUrPwVg?=
 =?us-ascii?Q?3TrTbSypBUaqh5VB7oxmpLGVwbvE159oId/rBdjZnaM9x5paA8DU5MyYJ0Cz?=
 =?us-ascii?Q?G+bfn5aoV1cSZdF1zKBo+57ZuhIsfbmvjXtpzNcdUaDCZS7sxK9PAaBJ/eAf?=
 =?us-ascii?Q?S6+RLCZ4KfrL8AlC1Z2+vnG2rDAe81uRL/GAOxlbqoPthGW/jKx35zRn88i9?=
 =?us-ascii?Q?xqGZ7ZskQE4yXBqR0PZAfPjGD50YkAieqrL5U0KYTErDSpiopwrdmp3YpXmB?=
 =?us-ascii?Q?CH4g8T7EXRGyoqKpo6WL9vGmxM+2/XVRYU4XLMhKjZB3hyXLb/G9mGU/8sXs?=
 =?us-ascii?Q?+m+thA/8atE7RuHPPjTTNTJAml7TAq35vuZuw4m8Ohhhu+AGrHbpixfyL11J?=
 =?us-ascii?Q?7ArhITmAFCOFXl7L7iLXL5pSQTOUg57qj/r6wVdJJPdfAt86dO21unSBpD7g?=
 =?us-ascii?Q?5saxlrfIhXMupHY+MGtZiuj77lMJdfwjiD16XjNN36ryyxb+E0itQ3tWHI32?=
 =?us-ascii?Q?5+d5F9iKbwFnRvctaCo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c37b458-086a-4489-52ab-08dda1cca2c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 11:57:23.2725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZjPc46knot5AUu6MbIQ3M3lUZoLr1jvJbwvaCoKgrBFnNNfOKFJRaQzdJsO+QEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6768
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG6ZmeyDC4yB2Hat493/pXIbWobpUqXfbOc50qR27yM=;
 b=dgHvqqVE02P4uHfvRjbjBlZAT/7arfbYNPI/r1KB+8A329eoZfI6EuFz+Y+fzKbm6yS/ovIBg7AyVVSZzlU7Fc5Nl4yNpUkRMzLCZhsddvIFVxJrrR+Xh/qyHNivhrlzM6PJEqVgCx0F/dS8JYKeSCx8PAnq/zYjpfzR5alMxPQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dgHvqqVE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2025.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, 
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Peter,

 > Bump bootgen to xilinx_v2025.1 release.
 > With version 2025.1, bootgen executable is now in the build/bin dir, so
 > the install step is changed accordingly.

> It could be interesting to add a shortlog of the (fairly limited) amount
> of changes done:

> git shortlog --no-merges xilinx_v2024.2..xilinx_v2025.1
> Shaik Salauddin (4):
>     Latest versal specific changes push to main branch for 2025.1
>      RDI version update to 2025.1
>      Adding placeholder in build directory for bootgen bin generation
>      Fix for sdcard bootup failure in zynmp/zynq

> bsaihema (2):
>      merged and restructured code for versal_2ve_2vm and spartanus+
>      optional data fix for versal_2ve_2vm

> Please also document why the LICENSE hash changed, E.G. LICENSE file
> changed by a conversion from DOS to UNIX newlines by commit 86b862096bcb
> (merged and restructured code for versal_2ve_2vm and spartanus+), no
> content change.

Thomas was too quick for you this time... ;)
https://gitlab.com/buildroot.org/buildroot/-/commit/4850405d8aa2b4f7aeb84a0db7cd3369a727d214

Best regards,
Neal Frager
AMD

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  package/bootgen/bootgen.hash | 4 ++--
 >  package/bootgen/bootgen.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
 > index d040a2e280..7670a5d1ee 100644
 > --- a/package/bootgen/bootgen.hash
 > +++ b/package/bootgen/bootgen.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  2c8345a3bea4fcec6ceb6c8f8e727a610aaca3ec71cdf7f892d7f89f88438650  bootgen-xilinx_v2024.2.tar.gz
 > -sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
 > +sha256  3de43a331e10b2a8079d4681ad72cef4884bc3a09250d3d80811d677f3ffe560  bootgen-xilinx_v2025.1.tar.gz
 > +sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
 > diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
 > index 51eacde462..939872b29c 100644
 > --- a/package/bootgen/bootgen.mk
 > +++ b/package/bootgen/bootgen.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################

 > -BOOTGEN_VERSION = xilinx_v2024.2
 > +BOOTGEN_VERSION = xilinx_v2025.1
 >  BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 >  HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 >  BOOTGEN_LICENSE = Apache-2.0
 > @@ -19,7 +19,7 @@ define HOST_BOOTGEN_BUILD_CMDS
 >  endef

 >  define HOST_BOOTGEN_INSTALL_CMDS
 > -    $(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
 > +    $(INSTALL) -m 0755 -D $(@D)/build/bin/bootgen $(HOST_DIR)/bin/bootgen
 >  endef

 >  $(eval $(host-generic-package))
 > --

 > 2.25.1



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
