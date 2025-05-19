Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60E5C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA4BF40D34;
	Mon, 19 May 2025 15:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0TOeEXwo2W6; Mon, 19 May 2025 15:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763C740438
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763C740438;
	Mon, 19 May 2025 15:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA9B0E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC32560D72
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUOx4tWboM9T for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::60b;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0EBC60D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0EBC60D56
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0EBC60D56
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZIjboTuOzDz+SEBa6vZCuTYIhOwp/9H9LhVG2SkuoMU+IQAe5TXONwnUsJ9l7usc2Xl/R7RcSybJdvY+JsHHdSN7M0S2pRfA6mpvpmhYQCXBBQPPY5+G77RnvYl3emZ9kX/377BNSDnZtZw8hYX3xvrlVlVkfy2DhhkzYFlSMBPvkvVDC4F8xd859xY10FaqdbqpMAQghxhuU8n60ERSyIDy0/wwZEVpCY/Qp06cqx/cGPv/o6xJ/PNeEqFVmoQqQJ6YoXA2gcw2IKuW37qq7m9twxOV3B0V9vFdqEw7wnkr/MmQYPA2nb6Qk+k/PbU/9d1Bc8eanmbKgL9T8sgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOYKbOXnzDBKBZ7lmiKpHL+8vsujlp3y8C7R44kfkWQ=;
 b=Bh6zAeTjaarvV9sSP5/JdxX7OwCmXVKGuAa2gXjjX3BKJJL03KUOLNfxmDht/423RZHVEwC4GOt9xz5vQ4OfzJedHWEYIaUElDm6bxCcqOyNemDKBy/X3TSR3lV4DhdA8AaFnsUmUhm5mq479GulTL+Uj00QK5zBBxRNbvNBSo9W51NY/A13vi1uB+grkcxlCNhtDVF/4s/1eUE9gjZzqFLXRcNNcW/G3792OHiUJNLJUWlI5OTSMfh3suIUf46fFnkonX2v6Xs1MUCjZMjhht2DSX2CQnro914HEQw1yN9Qs04KYTj556cOWGBr9QtqT+dcdUjQfbT8jgbYRnDMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS5PPFBB8C78349.namprd12.prod.outlook.com (2603:10b6:f:fc00::660)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 19 May
 2025 15:51:41 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:51:41 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/4] boot/xilinx-prebuilt: change versal pdi file
 permissions
Thread-Index: AQHbyJkm3xY26hUHMUWkIaQqhOICjrPaF88AgAACJnA=
Date: Mon, 19 May 2025 15:51:41 +0000
Message-ID: <SA1PR12MB56154D6B686E78BA0E3BD46CF09CA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250519083632.1930804-1-neal.frager@amd.com>
 <20250519174136.676b936f@booty>
In-Reply-To: <20250519174136.676b936f@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=d898073f-5b52-437b-a380-28ac66007c4e;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-19T15:49:17Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS5PPFBB8C78349:EE_
x-ms-office365-filtering-correlation-id: 52835591-f6c3-4087-bca1-08dd96ed0c53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BwhEkuEUHwnJIS7R1E/x2Y5W/L6diPjItwQLTd7ooCgpvn1nKXzs3dK2SVHa?=
 =?us-ascii?Q?oW9k9+eZbXe1Hi5Xx1UM61qIYUkiZ9ew8vavrjvUrgrwiVM18bbYMGE+VME+?=
 =?us-ascii?Q?70XAmD2iSuGwHlJ7ITLHFjc1nNHTMFLSh3n0LC6QQf+acHuss8I00k3HcN9v?=
 =?us-ascii?Q?DRAE6sMbZOdszvAdaJebMMcoDEkYmAuoStaShzoijP527szm9MTnvVufkk+F?=
 =?us-ascii?Q?xTI2BRVlYOEKVZUlkrD2hP0yP0XW4xFQITzl3GlkHIV7rzfrTSxGdhXM1t5d?=
 =?us-ascii?Q?WDHpJMCRpnvg8FyYRq7CXUR7591tEiORLMR7tgo/dMw7+K2/kpPWe0G6ImoY?=
 =?us-ascii?Q?EBJgcHo22oOFCmjGIv50vgz7rNNfmVExznsTZZdmeWGWPfy9RGaRBKT+4jZg?=
 =?us-ascii?Q?EDNTzMB4rachFw9Xip8cDKaKNmcL3oOrRCbnaAOh0EbOYp0X+ZIw+kPLrY6j?=
 =?us-ascii?Q?nIbUHjpFGZhI3PlQVxg75xnwyYElm49RVk7+nPenzXV0Yy0EWYqrE0cVPm3R?=
 =?us-ascii?Q?IQI1D62xUbFO0MBFc8+mYfEQUnIRM6hxsJMWHohoT8RFLVnziNwqs6AcWxI8?=
 =?us-ascii?Q?mZu6aqJjgEUf/cVGi2noM3M7COOBAI8SLCbBub+AUREqRgohMcgrBzPuyLpw?=
 =?us-ascii?Q?r7QSPsrPOuAgo388w/iKgiYRbcOXw3lEDLB2bSMIEpJM62ykod9Iq8gq+uJK?=
 =?us-ascii?Q?n8F4tddOu/B8XO0b+4cDtQisb7z6jCbBbCo+UXxRIiO+pPHDZLeZy/wKh0kZ?=
 =?us-ascii?Q?TS4jV748LVCVSiuPHW/lDfvV4/SvlrjrBJ8iBV5iLT+pRxEUOZpm4t01Xusm?=
 =?us-ascii?Q?+wyEnxo2IK7w32F3Cs0cqCT40lBvdrPW7LzWo+Dx6kmhm7F1XFkPh9Hpn7rz?=
 =?us-ascii?Q?0MDSNAqPMdTU3ClgbIxDx7lilBTDBui6lJKpNSX9ga70+6wgVaYhPcy3DVMT?=
 =?us-ascii?Q?xGadnWyRoLKoUREHMIWM5xwqzESBZANRbpdb5mdtOR2dE3+EDarWN15m4YOl?=
 =?us-ascii?Q?0YHPG1fEByIV0q8NxYSmU5oaVrZexYGRS2WwXX8wNHnGWlky12xIE6TCrhSR?=
 =?us-ascii?Q?6b75LTpfWJ8XPae7598WaZkmZ+KWorfHGxd55RoP40a+MqQNUr3S+V/ytC45?=
 =?us-ascii?Q?9niCIBu6VaiDfLrOPwE8cGgUytDkDC/GePFxs3vLu9ZtHTiXsoPmEUcJ68Uh?=
 =?us-ascii?Q?Mzol/WUJ0ExKi0TLzX7cfJLHAfybWwN7cvPvRvNC8wkEAhLetCAJGThOWyHP?=
 =?us-ascii?Q?6tBp+39lphPVg5yP2VUUH4Jrs7hJNF9OazWczpdZLCwd22GGT9Mn9M1b0tJJ?=
 =?us-ascii?Q?eyeud/FxTKAcFAoLC1aYa72xNpPVnKSvtll1lNbbbMe1pQL8YVnFHydWnPf4?=
 =?us-ascii?Q?YKWfAPxX3TUq2zUI5HTcWQ6zo8E6s/CfH+DzoB5lLLJ6VJX5zqtMZVs6mfvM?=
 =?us-ascii?Q?YDSuRogmYc2yT9ae4y4ZIRe3qexJNG9foKJrYGenBP61jB/Tv9YflSflRZvL?=
 =?us-ascii?Q?MU/wVAZZbpPDNj6hCUl39HD7U1vwdV+Odr73?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CEOpbvaNsdjT+0MWjJdvkaGDjOdGPfni05iFZK08az25N7VRN47vnPPThI/P?=
 =?us-ascii?Q?VQXReic4U70ffoWwFCEH/3PMKhUp+FkDcMrFA2MiCKiY9pTLlaDt8furXuNv?=
 =?us-ascii?Q?nXRv73foa23EMI0fTO59M8L3eEub4IkN9olnfE9Bh4CWzLO0Gh6uZ3PNafFG?=
 =?us-ascii?Q?tXABROlgvYK3ARu47v/HV6lBZdYmwI+TMiAedh/7PaYVuqZqqlei5w5hlbbi?=
 =?us-ascii?Q?JqVNxTEPBJN3WD4NlH/suo2n9KrlKadS4j5t4TDHg59LNq4Ad9MmnzU8x159?=
 =?us-ascii?Q?tv9QWYcuKU6/KLfLmxoq7Ue4VmcZcORJbb6fQCiQJZBQvZAP2jFJEryME4vk?=
 =?us-ascii?Q?V++oG6ZHRG8e/zdMIim/oRHjKXBDXhCUknl1cra9Jp/VZllTbXWWwCUesesj?=
 =?us-ascii?Q?MosXO4yIf+7ansbPFeXLotrp8xgS3Y7mj2Gg8hoX+8zmy+4+J6Jh47EKUxLH?=
 =?us-ascii?Q?nuZamOpgV956WoYHRnc1kjYvg2NLd+xbhxmL96cWoCf548G53uJDuXkFmOUd?=
 =?us-ascii?Q?0BrMxPwAC3/I+j0nG6YLkuuxKVZnDDt3SXgJN6HRAq+sHYPGXziM8/IecNQ0?=
 =?us-ascii?Q?3gDfjde68w79GQYOkXUsn/lIfwGXmGq9SHQ72LKedRXnENqAde1KTJKq3JxL?=
 =?us-ascii?Q?A6Ld0O2IagkvCFrjySNiDL35fFG3kvkgV1QHvo/Ivnb1P4V3GnVEyZMrKIf5?=
 =?us-ascii?Q?zj3/KpINWYRarNfX5/EenATB4yHQt0mNuW0oHwB+zXY8wA3iQIjfpWnH2/Oj?=
 =?us-ascii?Q?jjWhS9Av1jPOTmCY574H9Klafb/kY8Po+fEkmIpSZsJmUdB0REy5d2uasztk?=
 =?us-ascii?Q?jCdvRho8pzQQng7J946o2jeG5XRwCqiJ8niYMZm6uduHvowuVgkJKhdl+63N?=
 =?us-ascii?Q?DLzvBPxc+pEZZYXgHkcr2m+ljWn2Tk0MvoaJ/2w12pCQNhN+3c1rwQBeq0V9?=
 =?us-ascii?Q?GrGv+e0T+hGV4ZMkchNkxEsoiPPThwqYI9xnI+wSVjSNVcEmcBZF2dDIXlHU?=
 =?us-ascii?Q?46cYCrwxa/Nhc867OiwapclSjNvCI7WEDIk9iSQm90udmONuY7DmMzVKLUT/?=
 =?us-ascii?Q?f678EFJL4Apj6hLLPJa5ntAW76Vp8awSJTrlJR38V31iWccAZHxalyI+ivQ8?=
 =?us-ascii?Q?kvo3MFIJ5+rwrip8l3oafiRRj0jTSFJ7KbAqDAWkAPcX+2/DbzoipLSbop5P?=
 =?us-ascii?Q?LoueD7452u3YFGmZZzI++FGt7Fk0Uol/MKwqC6K7uHmJBm9hGSu+kMvgc4/Y?=
 =?us-ascii?Q?+HDzEh1NwZVWTue75vS/VNPxUlwrAzaXGNC3ksu+48iJbo3FsGq5or/C5NpU?=
 =?us-ascii?Q?X7tbH6SascTRwA0m0iCWaXnVF6XZzCY72qwNkEyDBfoFRSV+9MffaAq8Ceei?=
 =?us-ascii?Q?BARsY74qebujJ9PrGU2emM9pDN5rIFHyl1rnSCKOp2Mdd3Uy3FLUT4ickF1T?=
 =?us-ascii?Q?B5MvFNKjtYJqZP0O7xaCImIeTQDBiJV/yQoHG2naOcRxDwuv/s+PgdFi5xpK?=
 =?us-ascii?Q?ooAkHxcfH22PnoI7fD9K4Qdy8PK+Fsr6po6qIzY2o9BSzKIIli5IsCKZXw5E?=
 =?us-ascii?Q?X4k5rAt4aJeJHcxJVmE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52835591-f6c3-4087-bca1-08dd96ed0c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:51:41.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CL5fdwKJL8kq4bEEzVPCLcGxsqzYk3Tnxe/p3KqcaN3a3BQs1/KEfAXsDly7COOJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBB8C78349
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOYKbOXnzDBKBZ7lmiKpHL+8vsujlp3y8C7R44kfkWQ=;
 b=qsnA0G0mO4R691mB+3t5BlNGXWYZ3O7miSDCJXr5eCefcA4E77r2bqoSg1ejsa0z6GY2l4ySBitvCwzWI9OtseP+NCzThSPdmcz1Uc5wLpeuQXi0bd8js/QQW+mml2++ut8rT4GuW22FE7q4VoTtKFSE31zuO7vBmv0LZirlEJQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qsnA0G0m
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: change versal
 pdi file permissions
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
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Caccamo,
 Fabio" <fabio.caccamo@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

> The versal vpl_gen_fixed.pdi file is not a target executable, so the file
> permissions should be 644 instead of 755.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^

> False, I haven't reviewed this patch because this is the first time you
> send it.

> However I did so now, I'm OK with the content, and you can keep my
> R-by line.

Hi Luca,

Sorry for assuming.  Thanks for reviewing and making it correct.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
