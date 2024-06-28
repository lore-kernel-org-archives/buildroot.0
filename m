Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CDEC3064D
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 15:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49227401AD;
	Fri, 28 Jun 2024 15:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plThR8SKbOLj; Fri, 28 Jun 2024 15:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0976541C4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0976541C4E;
	Fri, 28 Jun 2024 15:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8FD01BF398
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4FD041DCC
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 15:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pheB1viABzJH for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 15:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::60b;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B69241D7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B69241D7E
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B69241D7E
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 15:47:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeA8HykOzOeWA4e9La9oDtLeVNK+RLBqC9+8Fq3ApGww/dFJ3APjdfYCT9GeGDKHG5EN3F445nh5U9cDUSW+8tjb+Bn/IjaZY3kjjlLnJSGz5dQ0mv2tYR5B8RYt9cZZr/qK03yOaj60OVgtjxEU4wZzuQYrueFgXlJK1wuhU7Dr6d91nxIDpVhK0OO3yH+P/ezDW7I04SWGb7RQaC/Zv+RPwfJdsgELqTeWxUcqNOngnRFiuxKS/NsWgZHYlBeEeHocBdBjYe7nj04e35lXz8bVMPpZb6ASHLvR9QNmK3xyIejeLVbNEszLWCjIHGea4D4wYmLx6KJ0MtkjWCiJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SkZco2cE0cMW7KEhJIf8i2OUfkEMAPHSINChB0jgzo=;
 b=oKA2R59ZKzJ975GvlDebYrtbTbLTwRFwUMGrYKfxcbir0mhfJiA/ee9pTVxLJq2ckQOMCs6pSLXTQMuPLK+y1qOIiCxG14sNrCvV660iW7j5BxUcBoGOX6kfEtmMDDwjJqQ44+kkEIl0CF0rAq/IlkbSnfCFekP4B/te7ynYjrDs2oR+5HSTIW10FrdLUgviWj6l0jowPKziW8A9ULAi6wviFoE/+k0WLO1GlXmzWonQYME+UFBLmZGI9bYAae3EUNMLN1FvWofuY+9UKlbDw0ejMzYa2Q0AclkmYPfZUumzfDwYxH3aURGFQk9Y2rveJS827BFJN6eH7Yvlu68l5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.33; Fri, 28 Jun 2024 15:47:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 15:47:35 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] boot/xilinx-prebuilt/Config.in: versal needs
 bootgen
Thread-Index: AQHayVYt3O92eXAFf0q7nbSY5kXl8bHdOB6AgAAZk2A=
Date: Fri, 28 Jun 2024 15:47:35 +0000
Message-ID: <CH2PR12MB5004C374FD0330CBEA26D104F0D02@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240628122436.1630911-1-neal.frager@amd.com>
 <20240628161349.4dd003a1@booty>
In-Reply-To: <20240628161349.4dd003a1@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB6559:EE_
x-ms-office365-filtering-correlation-id: 2b71818f-53e2-4c7f-9c82-08dc9789a164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oF9rbyOcCK5wj2b+df+b7UrBxuwga7dLMHtlpSeRokiVU973yswYQ8Nph4Y4?=
 =?us-ascii?Q?gpOYphjCa5yFitAAjC7m+H5/+issSnxRT+kJHDSGKqLJbkwbxsYWhIPyowi4?=
 =?us-ascii?Q?Do+x0CnsEIkw30Fs/Wqp61r129kvzJpurh/t2cJcpYmuWJS3jR4ogKNdHcc5?=
 =?us-ascii?Q?32co99qHKJggFQMNhzUMs4utt+XCettlVOe82nrtCYnpjqjtY7OEWzLWnjYS?=
 =?us-ascii?Q?oGoNX29AmNjcMxKMD77+9uYN3tvMW0bh4FzBs9sWL5KSTd20vgAgy3S21Aly?=
 =?us-ascii?Q?6VuNU3YPilkoeAI7362Pi1vv7/P5GG0vcHTMchZP22aSl2X88pUHcJPcC/IK?=
 =?us-ascii?Q?yig8vNm3QA27dLQwVWTkG7u5F0OwJWwpB62xBB6V/g7K51+r2FMjpl07LHHi?=
 =?us-ascii?Q?Fbo68emkniYlxdzUv2jcMrUA5yNLUs7Nl7GQ7/Toys53hiR6M/xpvgJ20NY8?=
 =?us-ascii?Q?jFrx33ZouKwCNjx8GTlLhXI01l2Z0SGy5ANIjqsWjTIiYiOMcFiDhcvUoRy6?=
 =?us-ascii?Q?ffWWq87ZtqBL1HQvbMPJTc2YtD4OTu5+GvVoz5NGKzdUjKqfeXjjA5DW6sHo?=
 =?us-ascii?Q?tOyNvOrB5PQd9mok6kjRFaBWd04onjKQlPSjM5FbTVhdLbMffHVFcXi6Fm+v?=
 =?us-ascii?Q?/yav5nDiCOmLSN9kPzSDkoFqNMybC7EALookYYrCNfH+kQ0nBtosBLLrAzdf?=
 =?us-ascii?Q?fwzqxoggoR57B2ULoPPoyiQeARiaG1c83JnBDC0MiTzBoJKk52uYfZ9I+WBg?=
 =?us-ascii?Q?pW3dWF6zhP9IvzPCs6Lr0Vz33RMIGn9WsH4SlW6piJEglqmBI1RkYgNZ0mRX?=
 =?us-ascii?Q?xsUaf+vfoAwnLaUnUvUVykK0zVRj0gGjPS/FnmuJN4Wkhs+j4FoxAXLUHF3E?=
 =?us-ascii?Q?85X3VY1Y9MFWFLPgQgNPbyAD/3yi8eUWE4P0cAQqtvWeTTbzo2FaDem8giKv?=
 =?us-ascii?Q?UX+4enNu7CC8dDJwN93iNORHBexIzOyAi0n+8YdNZhuozqjO0JHqYNFs6Pgc?=
 =?us-ascii?Q?NGJREjfTZ3xtOD0eNDJj+GSPwP4iIBYaho4pAfPqhFgWgdAuw0JQKG4IaXXy?=
 =?us-ascii?Q?J1sgvqeS3TFxiU6CwBdbAwf0S7/1zThwp9v2J8LXTDO/gauEaSxOrWYg+ADy?=
 =?us-ascii?Q?M3ZsX57USgYy0fcsJMJ7JAb9PZgl/zcKyzWUfMnE0E5CgokhSMa5r8DktjhG?=
 =?us-ascii?Q?8ORSkkoLQyzTkhpBxKLXvKwBBly502uXqAxolRsAvCGEv6IolUiq+zUtppjp?=
 =?us-ascii?Q?ZFh5ym/gx7+F1HDf+omnUc0rMCUfBkWSDF2GueNGhKZfgUyy/B5nhatwzl7t?=
 =?us-ascii?Q?WGratewZOSUWRXRVQlhc20V4cqMijP2ic67Z+416P+dNxtr9I/bIYsJszVWT?=
 =?us-ascii?Q?OBLlitTY/W3x5QO7cjs/XG4fqvGYoYxuC74TwZoz+uUhM8g+IPLke6ZWDIMj?=
 =?us-ascii?Q?30wfYCMeLNI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZlaNygXTxw6QrrniYDX7F8lY+sWrOiCkPtaalwRzsxOvhxITNmnDFKdjrDEv?=
 =?us-ascii?Q?INi/JTjMyFuQJ0XOCktUrXPW0YdBl5ZR2k8IC1576+sS5bnO3qSdrvjdakrC?=
 =?us-ascii?Q?+aMEKkN7Nc3MgsGhetIx7+U5st3OlJIiO4Tkf0sTNWmZ+ZPGi1VZ5VCj8Lk4?=
 =?us-ascii?Q?kz1A8qCwujCldKFnvb9b88oC2sDVhTrx8+aHpxnMjb0tQsRN0695TV86V9+8?=
 =?us-ascii?Q?gHj7pEMJzcT8EHzBpmmFRxJVByykj3DxML8rCCtf0wJqLQHhvuNyIbC81IIW?=
 =?us-ascii?Q?UqbGLc98TMPVATP2lRhdA4afYsjkh1y9kkViaThuLmm2IK01krmiWQg7a/LU?=
 =?us-ascii?Q?4+KiUy3QDxAt/nSBtCA+nboEoyIu1Iiw/DvFW4VCAnfzSTtLXhR9YbUdunDj?=
 =?us-ascii?Q?GOosOKgxjk7XMkS1KFQRkMr+MnG4WKjgrxgPvJvhuTgCU4kjptbG00KSMmIZ?=
 =?us-ascii?Q?eXd5pQ1fEGWhlnjuvFJYqVQ4qy/c/JFh3zYgUh7BsyBBit5DAJU6SRT6ubAU?=
 =?us-ascii?Q?n1TifsagfsmVslRah/znrJFn0wHniUYqKSRc7adeylZbTWd11cL51aixEHrp?=
 =?us-ascii?Q?R25okwlMUatKygWiFeVnfTTd+2fks2JqTtdPKCHpqsE7aNEpMSoSBMfWVza2?=
 =?us-ascii?Q?yZym1ThcMdTwA7agSexjTCba1LzIJgcLJuN+EIVwFtbovaV8LHWm9OQBhxlt?=
 =?us-ascii?Q?DYW6Gtzer4KULtrQyriA1BI0/2th7qswhbDYZjrvi0V3amR+laodPIVnfCWs?=
 =?us-ascii?Q?k4CqXBH/+LtJ2mgATzFejH4E2YD5bJKE3tH5885XHicgJVueX0tMttxZ/fOX?=
 =?us-ascii?Q?xv2K/Syl85LrsOP+hyWMrWuSshFin91oby4dFaq3qSNgfmj0qtIbKK5TCLaP?=
 =?us-ascii?Q?nHEdWf/YabEQWGOGMADmUZJlhwrgA6S03nEeAhRigM5KOOZ2Qgr+UcFALhOl?=
 =?us-ascii?Q?zNTf3Lelo7Xk7jq033ewW1OKYdcVaTqYO/6K+CgPYelAFNEXSc5a4h4+MWc4?=
 =?us-ascii?Q?7jGiw41YCn2yv4Oq76UcnyKlXU/zDn69DJBfBTr6WIV/h+E88T7tgcYZdP2Z?=
 =?us-ascii?Q?PVZ7YTfYOLYJoTXD8mgAKk1dhAelcPM34eUPxoCcrkwkKYYOlgfk56rCCF4X?=
 =?us-ascii?Q?BLoaxiXDqUfx9nut86GAF2b4597Pe4K4EPgZlhH7SlZ9temMCrziVeAXQlTn?=
 =?us-ascii?Q?IxGtLV0qbwN86ZF4QngsCGgrY866THP/ujtIFMpTlYIY+G6KX5jDpKRj0nvw?=
 =?us-ascii?Q?YwZvx/+7djQ1Rtol2sybc9eB1l0DBr8NboBToBsMJzBmf3aG8++QDt0dC/Nn?=
 =?us-ascii?Q?wQaF5nK+44t5KrPqpQhOKJALwO+chPqiL/9/ocjupkp6CjV47DW34rDgRtDL?=
 =?us-ascii?Q?SoS/WXpgBA/rfu465OG/YAR+riv/Pht1uxaMIO9OPVztp9olTvQqI9BpP55t?=
 =?us-ascii?Q?cRb0x9kYJDySQq2Zcr8dE+HrxldwbbqRRNHx+JC+JiJXZfwsKWWdee4DXPUB?=
 =?us-ascii?Q?Rty0MiNe+ps+vtLMLr4Z+oJkippcpbm7sAQv39pi23NF6GJ1icp/vC+J9K3Q?=
 =?us-ascii?Q?TAuNuBleTvq5qEKW/CQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b71818f-53e2-4c7f-9c82-08dc9789a164
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 15:47:35.3697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9fireb22OO2HapqYd0qlm3b9z29YJc3qsDzB7eEV8jqFp4rumgxe4nYAFg+lj21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SkZco2cE0cMW7KEhJIf8i2OUfkEMAPHSINChB0jgzo=;
 b=hPNzAxRbp6EiXk8hCs6vuZaSnWoXgzxjibdU+tmdYfEKjN6OKVX052PLjOB2UQCgrlkaC7/PYzw/qKvseeeA6M+BMF7Rc0xWe3NgjWmO1n7BG6XKm1h0HmXZ7jsfEzV+8vovuoPS9x6yXj/0byN3sKZHGFVJjl+P0QtmU/XGYbQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hPNzAxRb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt/Config.in:
 versal needs bootgen
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
Cc: "andy.a.kennedy@collins.com" <andy.a.kennedy@collins.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> When building for versal targets, bootgen is required for packaging the
> boot.bin.  This patch adds the dependency.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-prebuilt/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
> index d3df1c06e7..a1c2075d7c 100644
> --- a/boot/xilinx-prebuilt/Config.in
> +++ b/boot/xilinx-prebuilt/Config.in
> @@ -28,6 +28,7 @@ config BR2_TARGET_XILINX_PREBUILT_KRIA
>  
>  config BR2_TARGET_XILINX_PREBUILT_VERSAL
>  	bool "versal"
> +	depends on BR2_PACKAGE_HOST_BOOTGEN

> Looking at this better, I'm not sure it's the right thing to do.

> xilinx-prebuilt can "build" perfectly without bootgen.

> This is similar to genimage, which is not needed to build any Buildroot
> package, but is used by several defconfigs to generate a bootable SD
> card image afterwards. Thus each of these defconfigs also sets
> BR2_PACKAGE_HOST_GENIMAGE=y.

> Sure bootgen differs in that (as far as I understand) the *typical*
> usage of xilinx-prebuilt requires host-bootgen in a post-build script.
> However in principle another tool could be used in its place.

> So as I said I'm not sure. Adding the 'depends on', possibly with a
> line of comment to clarify this, could still be seen as a convenience,
> but it would break existing defconfigs if the 'depends on' were removed
> later on to accommodate other use cases that do not involve bootgen.

> If there are no stronger opinions I'd vote to not add this.

I see your point, and I do not have a strong opinion on this.

I am fine with leaving it out.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
