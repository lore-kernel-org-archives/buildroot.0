Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F66C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C3B6128A;
	Fri, 16 May 2025 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndav7PC_8vZ2; Fri, 16 May 2025 09:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E1C6125C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E1C6125C;
	Fri, 16 May 2025 09:35:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90A86185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7651B41790
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILT-PMf63zkB for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:34:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::607;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B57EE41795
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B57EE41795
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B57EE41795
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZwZ7wjdXY/ZnKpHyQirjET/hRbMDYuBJjo3eNB/3fAsqh7ToWWZCAFMsmYTwAV9Z9G2FA07aGAq7zDlFUc+Hgz+MLGVdSjDTWVGqG7RdAdcGT3mhFbgm5ySEE1kKfn6GJpAJrqoGEK7zurjRN3v0oJfBQ2djtwItq1Qj84kNnPbshUxHPGShi1LKDZcGE2Z23L/qSHTefYOESxLIODn+EMGOiYqA1WwO3Jk4vAr1jnwtVft8yOkcPCbzZ1QXewA3kS4cm9N+qK9P/yd0S+Fb0qD9lfxOxvYXFIajEulJOdWT5EUjSYaQuoCCUAJ5hMm3GHBsFV0ylVDuNkbWukx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enovti08VTxdvFehx35Au+f0Ro27xArVhJ40IttlOo4=;
 b=bCsUpeUp9Ho6iJiSId2N0QIg0ufuTKtCtfcMH5BEJFTYZ4Yzoe2f/iNt+Z9CeDGeag1cI1WBGXcFDeBr9dLGaqflLExjXvXt3eVX/RqwmfRg32dAzjBKXdLoymE3HZ25XQqsJ9j5IQC7qevrQVm9FsehnSJZPrWYA+V74wd5Ias/ZW6d5kE77aFn7vgBhilSsP31tyFC+j88/iyG2gqO5BgcZ8XoBYEWqxyT+clau5V98HaieBbLKjfR9RbwxNaXiV2K1T3hrjcFER3c9cEp3iblFkgPANq+mJkmH4e0cp6sCvBEG4z/wXMRc7Rr8VtqTPsPL6kXQm/BEFWBJD+jlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 09:34:54 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 09:34:53 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v5 1/3] boot/xilinx-embeddedsw: rename toolchain vendor
 to buildroot
Thread-Index: AQHbqRtChc7/MKRTuEqmyDdbX7oR5rPVKqCAgAANBoA=
Date: Fri, 16 May 2025 09:34:53 +0000
Message-ID: <SA1PR12MB5615919365719A06F37E3ED7F093A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
 <20250516104213.0ed78643@booty>
In-Reply-To: <20250516104213.0ed78643@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=4121b1ce-ab57-416d-8a25-ce8e59301ea2;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-16T09:28:49Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SJ2PR12MB7963:EE_
x-ms-office365-filtering-correlation-id: 435544d9-b4fd-43b4-6927-08dd945ce9ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?W9tjrLKYePkKdPFz1fzyZUK2Ko9mVe6KGZKLmOkPt6Pb9+DhjS6w/hQuhYPd?=
 =?us-ascii?Q?/LGbSR+aY4wQeLMyABSsgHZRG2YDACDuX1IVnZBsCmht8XZki+70RHMQTMdW?=
 =?us-ascii?Q?ipD1EgzC9KgmEVAeMPiqW/4hibTHK/O0gNV0RHs59hJ4VOum87XwPpXoLKk0?=
 =?us-ascii?Q?4PWKFizGO6U7Fj1Pudwn6NUrODOSgsbZ8KGDjvm/XEWZcwcJdahzZNYrS+3v?=
 =?us-ascii?Q?Zb6V8wyr6KZFkWHEe9e5NWUAn+iKXLoAP2n065pZZs0jyLaw9EA8tf/NMv3u?=
 =?us-ascii?Q?REyT87RsDKw23YhIV2BQlGGf5DHfYOY1GXfIGvOMmUWRbwAEueNuMhe/A4eh?=
 =?us-ascii?Q?LQbdoEj3dRXebE6itbJ/J67lZ/k1jLnE4aOT9zaeUQHf0bh8LwfFV60/do0k?=
 =?us-ascii?Q?S2/yNHJnlDg4QDeRCNxRKcSKXTDuYKdluF8oSmk0cxVb/7JNK8aHvm5h9zbQ?=
 =?us-ascii?Q?dCVQh4uw7yCN7vuAHPWkqIRzmMimCD8MIjVK4kEJGcc2NGvh4OJY0l2GUaao?=
 =?us-ascii?Q?ksyp6U6WkYDvgaSX55dsDwUNlyIBdOtL5uMi7lmn2wqEfXlaTzYph6UFIK8N?=
 =?us-ascii?Q?Tapj4GomCNBL9g59kED3NgWN1cjFHxIjK+iR+TRq5ntizd0J9aHXsPuWBhvM?=
 =?us-ascii?Q?iBeWXrT9zUuWI/tCu2UCqjpTG44ANOJcd+MdyQ2YkhBt6rrAOumFjIz6zovE?=
 =?us-ascii?Q?o7Y3deyk73zO72/MC/UQJ6u7TiG1p63qPw9NqWdIqw765MfGq9RqmFqb8VbM?=
 =?us-ascii?Q?oYUsIb93uW84LHTR3EHkd80RXl9DOZ8KBiqDQrIjGA6b3coW/IaEavECXiDg?=
 =?us-ascii?Q?erbuOhdWYJ0y6HcfrNu7vUTJ9pwXA/Z6V9IxUY0OdosyTOKEnsY1em7eyDEu?=
 =?us-ascii?Q?YG5UxF+10f+Eym5I6ObEshFMHN7BT53X6wpiM1fRjS9SBOVNn+WRXVmVGZty?=
 =?us-ascii?Q?iRnqe4TewaZjInkBWMn4yp/OEpKEYLWNiptmwS8aUNznwkd09UiXT4JAZvR7?=
 =?us-ascii?Q?UEuNOE+SS4mZslzsl+j1UlKPfa0E+mAvXmqSmSVoQ1gHmuBpN9dsAKMq/SH0?=
 =?us-ascii?Q?UMj7JiROOn1d789ED4z3+7wlhejZQEyt7CTF69gouOTORkXJuvVG5H0sspaI?=
 =?us-ascii?Q?K/yEGEpSmxgzP3nZlJU1HTe+ysj1/jmOoN547LByCNHoQysbXgdsnSWNReXE?=
 =?us-ascii?Q?oEIdr2QAhQF+H/pSBgqXIuwtHznViQJoyYhoCe7D0NgYLopiMGBEBxkj1E91?=
 =?us-ascii?Q?a8jnLfSLMRT/OBuc1sq/apnPOgHXVZrG0xmZWk1544/tF2LRnkIA3j/LoaIh?=
 =?us-ascii?Q?S4lDZfJzkmW1dhJVOTTDdnNpBFQF9D/RGMzNphkAAT5jC/x6LeBe/gWnU90y?=
 =?us-ascii?Q?hbrpSbeWawfYhypA0N/x4lHIAiYBTXG/iA6HBLvfumn5RkqXCblKX3GnVnBO?=
 =?us-ascii?Q?vMCS7GQJlPy6dWjzwBOOqx+n6CVWroexlrJcrfX0EUpRRthuKPBMknNgfiGh?=
 =?us-ascii?Q?bxZyiRkrLGqO8ogDTjn9EtrZIj3YJLE5Xp6D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yiGpjkOx6tVRdXKLXwvYvUp2ohTlM7INz5BulnClGlXAkkWbzEwf8qRVt64i?=
 =?us-ascii?Q?QRi+UBWhjSyby/ideq/irSJG6BsWVXCNFF4bHWEQ842AuFDXPsTdLPEVWsNj?=
 =?us-ascii?Q?iK4FEVh8YPTqne167Y27Bhb6ovxuq1W1YdBEpQmRpE+1M+RD0fXMKMC8qzUc?=
 =?us-ascii?Q?JqqXwm5FUHdysUA4ARXIEOZmz7mpp1Kz1M7K3AYRLP7bMFUO8d1qotFTam8F?=
 =?us-ascii?Q?XsqtS+EsO3gzC5bia2Vyj99H7isfk1FbCrAndGsS7Basas/JpS8toJCLUnmI?=
 =?us-ascii?Q?Ii6du2Xym56hBgD2pr4AirbFOxp6BYnPso3beu0OfjkF1xwD/4Wg6TFrJrC3?=
 =?us-ascii?Q?5Q63szmAw7UDDOvCAtpgyLTxkj51QoBbxrQ6VupV6m8IwDH98GmJ/1BzB0p2?=
 =?us-ascii?Q?6ZK1i3KskoCqO80EvTkNV5k6OeshCIWNsYLTilwEIFEPe943w19ivXXVbsyq?=
 =?us-ascii?Q?KoZINDys1Ss1N8/JB9o4nrGu2hB2BcARswj2yYMLguDs91wUiOL2nkjbolrT?=
 =?us-ascii?Q?nOoDSbPKkZSpLo3dWZWGNDCWOp5r37W9mPLL7CdYEty8Ej5uq0NZX24Nqvib?=
 =?us-ascii?Q?gFeGym8Wc8R2XIm4LTrbpK+66VT1kcyHbK7XAdldWxLb88Zt6ZFT/H6/wbgF?=
 =?us-ascii?Q?/wOc1m15aFTeB3Qr3tVs7WIBX/3Z8lyHmA3KpE5f/HogF2srt6Fge0DR0UxR?=
 =?us-ascii?Q?PZoe/cAsasfL4uOQRVtA9LKeCmb1DSHJv1UzreCYaxQ1iEj/AixTN10/5Ozv?=
 =?us-ascii?Q?M/HEd1yM/2Og4Nb9fuwNc4LM2Pcisf3tDgjc3JKmGaBdNHvAJ5X00mQEZak8?=
 =?us-ascii?Q?KFjXRcXAQRJIvB9BoEBL/guZcpsQMvpl/bPdG3wkHhciUZ+mt1OoMeWiPmgI?=
 =?us-ascii?Q?ec+Q0o0f97CyU3Y5WNYPL6lY+xrcmIyf5umLpf5/HQpC/YMP/CpfTbIXmSNI?=
 =?us-ascii?Q?h4loMiKyaooCG+9KEWvPeOqxEZLDxOuU0eT1Knso+bCyzWoOgmeYji3cRDAF?=
 =?us-ascii?Q?XdsmrgXyfG7Vy3ejC0trKQBg3xCskwvu7rujNs77SFlfvih9TYrpigxRKWAG?=
 =?us-ascii?Q?HAhQ4tP+gu/YXs1fkemQwRG8xJkNjhnig5IOq4IQ59IjspsKhs7Ip1+rwogX?=
 =?us-ascii?Q?APiOOakrd1WuMVRM+tr5yTNxJT5enc7i1kBS6UE6G8Ii357MsT3PXuFSHUwc?=
 =?us-ascii?Q?J+2FbLqWDKQ6uV1gNrblIM7tSmSC6A1R6kr4upCAvLtXlu8FJyjf9V9az9sx?=
 =?us-ascii?Q?mBvqU+fu3xAl5+LCeWyHq10szPHRFk3zpSrl8ol3cjeDneosiWEQoNcJE53T?=
 =?us-ascii?Q?vkNQVMEb6Cbhto16/TaHq6E+WkJwoXrK10ann/rKUSSm6yM99lCCh1t5s9/N?=
 =?us-ascii?Q?uuafQ279xKkbBZR/PeobMV1/bZwMa93Qqtryj4GO0RHhakMSKFSIpA9JXkLn?=
 =?us-ascii?Q?KGVSwgHP0G64LVaj/tcqMM6g1Sqq6LbnwIJQdKbzXnuMLRRPR5ueKkZeHy5d?=
 =?us-ascii?Q?/lpUs9f7NsIzMfPa0aA47XglVS3D7ED11oTcuOXkZ1W/dt+L7TLdQn4DURxA?=
 =?us-ascii?Q?D0sBf/DMMs2OeBP1RL8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435544d9-b4fd-43b4-6927-08dd945ce9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 09:34:53.8901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUBinX/2iqyuu2vHMcXdkvOLpX4FLuQZBMskGFGhiRE6nnzAsf9rjTzom3DpdLU8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enovti08VTxdvFehx35Au+f0Ro27xArVhJ40IttlOo4=;
 b=FlvNV0JrgMHFKG7pzDIfni/20l+XSaTJ4mkI8aMajOYHIrMjlUDZQUxRJlsM0dF4xhnz7A3i2J9PxdYpSlY8qPz1LJh+VUPkp9EHktfUG8zVPJOBJXbDAomJuVKjhWtP+TOJ+/e0jRk7Llnz06YzCSxVs+FCtJQEef3Qvj9WgAM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FlvNV0Jr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> other toolchains built by Buildroot.
>
> To build the Microblaze applications available with the xilinx-embeddedsw
> package, the following config is now needed:
>
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
>
> This change keeps backwards compatibility for users already using the
> following architecture tuple:
>
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>
> Either vendor name is now valid, but the documentation will describe using
> the Buildroot vendor name.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - xilinx-embeddedsw is now backwards compatible with either vendor name
> V2->V3:
> - split patch into series
> V3->V4:
> - rebase patch
> V4->V5:
> - add deprecation warning for microblazeel-xilinx-elf tuple
> ---
>  boot/xilinx-embeddedsw/Config.in            |  3 ++-
>  boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
>  2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index a27253d594..31b12baaf2 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -1,4 +1,5 @@
> -comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
> +     depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
>       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
>
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> index 7d4fcf8b8f..6e37dc48bd 100644
> --- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> @@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
>  XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
>  XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
>
> +ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
> +$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
> +     will soon be deprecated!)
> +$(warning Please migrate to new bare-metal toolchain config below)

> A warning is not very visible, so it won't be very effective. You
> should really use the same logic that Config.in.legacy uses: error out,
> and clearly state how to migrate, practically. E.g. (untested):

> $(error microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
> $(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)

If I do this, then it means that users must switch immediately to the new
microblazeel-buildroot-elf tuple definition.  My thought about the warning was
that either tuple would be valid for awhile before deprecating the old one.

> Moreover, an existing and working defconfig with
> microblazeel-xilinx-elf hard fails later on with this patch:

>  >>> xilinx-embeddedsw xilinx_v2024.2 Building
>  ...
>  make[4]: <...>/output/host/bin/microblazeel-buildroot-elf-gcc: No such file or directory

> Steps to reproduce, from a clean Buildroot git clone:

>  git checkout a4249a20243bb620d095a36e78d3722aa29f8da7 # current master
>  # Apply patch 1 (not 2 and 3)
>  make zynqmp_kria_kv260_defconfig
>  make xilinx-embeddedsw

This error seems to show that the following dependency from the
xilinx-embeddedsw.mk is ignored when building only this package instead of
using a generic make.  With generic make, it builds correctly.

XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot

Should the dependencies still work when specifying a specific package to build?

> The patch looks good otherwise.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
