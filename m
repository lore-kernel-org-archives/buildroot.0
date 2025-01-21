Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E8C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 08:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13AEC61128;
	Tue, 21 Jan 2025 08:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm8aGBcQw7hs; Tue, 21 Jan 2025 08:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A6E61115
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A6E61115;
	Tue, 21 Jan 2025 08:28:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18D07959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05A1A40E40
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYtvORbvP8ZO for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 08:28:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::627;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 556FE400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556FE400E0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 556FE400E0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0x+JeDk6USZqzpkOmmtZxbdAwo+0sVfhSRIloFPAcoa2cP3cPOo1wFRNiEvq7vHKhBufh4Zz0W/9KTqOVr46rcrFAIf5IAjHV5CbkaGOKxODLt4bXNV2gKYn8Tcg7XeiEC1LfCFAsKRKni1Zf+djzgNjkVG1sAEayc7s4MGAEhYWBLoxNbNr9dbLbiVKwD0Pkr+xmPTPberR/IWVrtRE4iPsHpNNsHxCtOuvACmQpFwpgW50vRotBIj+W2kidcIkK8zLeqiMt3nr5Rk1GrZ9deQYg/D+JKi1w/32tBdAlyUeUNjTnZBsf2aFGAbj+Vn1tYrzd0DWLSKvgDBZDSOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qitjO6T2Dve35ZNvIYLE0Kq3rExKKCZf/cEaApDP0Ck=;
 b=y8GxI60hyQhq1x6TH1LTyo6ObSh7HYcRpk1Yd0DR1ATcLmmxP4C9XXL+QfSwQq/tgkvH4qYXRfoSPbdvjKVeM/ikL/Z8nv6yIs9u/9eP3RVl9tOp8cDSQRQxQM/4nPWKgHYd4FEfcyQr9Um0vuHz4hdiG0NYmSjZNdK53OBimzlP/tSWvo7AVrMP4Jh2DbeYveHB0m1AkCC47Zj5v+hJHUY4nvc6pfK8JeA7E4YSnMU13Y5KRNPCvDgSUYE1+biZHx3SSt9TUKI/VIHVxBQawHAIfynGnCO+IrycBDZWcPFGzRMmR3WKKglLGcbgT1N+ctV8/k9LUwm+yAG5qh0K3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 08:28:10 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:28:10 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot package
Thread-Index: AQHbay89zGN8FoY7A0ilbt96TJtW2LMf7GMAgAD4ocA=
Date: Tue, 21 Jan 2025 08:28:10 +0000
Message-ID: <SA1PR12MB5615E5B94819EDC72F4E6D98F0E62@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
 <20250120183312.073aafb3@booty>
In-Reply-To: <20250120183312.073aafb3@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB7747:EE_
x-ms-office365-filtering-correlation-id: f9451dac-f6d7-4ddd-27e1-08dd39f58a5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nNfQcB9Kg41QiHD0vOAgU1E8JMxeOTlMDEqFIgPppg+kzq72YifGJJj/vlZP?=
 =?us-ascii?Q?/iVsInptJMLtzKytHNDJPXLV9W1BacG7iwZ8to/xdrco7O0CUpPAm56KWwRG?=
 =?us-ascii?Q?gt+yUbv1O9hZIEUBsF5XJ+G0dDxUu8b3/vzVFnIzguMBdQPXWGdJiVqFfPlM?=
 =?us-ascii?Q?KXHXKrui283TpdXi/yGj6Ppaxr8suOxx1pYmydeuA5ZftyC8mrMWtt9LKVIp?=
 =?us-ascii?Q?tijL/DituBs/YMYielwdX9TI2wpUVATMpSvMIclvE0zEWeVh0S6LSZa2Jr9h?=
 =?us-ascii?Q?BAi99FL2auXOTJ3JpU5Ey7IzrA19o8NVuYSgNzmgtwVpMf2qnw1eJ4na9bnM?=
 =?us-ascii?Q?85v64DvatvyV/AirT/gsuzVOVyZp1gCD6TgafpOPWJfmEftqg9my9LaIdwvf?=
 =?us-ascii?Q?J+XsJjseFVZ4uwAw+HykgvdmHz6ip0m2/bPRa5tNp3WA5h4pu8MuWXoauBeG?=
 =?us-ascii?Q?K8RAuZNkigGn/5kLnB4i7y1GmWaD2OykDl8IkQ68fQzctRKBqW96A4OsCV7j?=
 =?us-ascii?Q?tTbwhO4vsyQ7XKtSOL6atgNAhZrnaUxyTaBFGab9i4lZXteVoAAIp1rvQUp/?=
 =?us-ascii?Q?+depRSYTncuWBrrWC1eMsu03Rnw6c9niYCh0+6mCOmU5TpNB0DdIg8NrWhD2?=
 =?us-ascii?Q?5r9xW5ZkS0+vhKI4lKMX3P5qnIIrmsHikgWz/5X5pe2eIZIiwz0vA5fFllCC?=
 =?us-ascii?Q?Qh5KDuXXrhzLRGvGZLiTcU1eqV2XqmV96CuddEQnLJcb8YG2yVT3P3RlB2sH?=
 =?us-ascii?Q?+RfHeyjPcO6Xktjam6Oj4+kney/+MvfUo0poF1+B9KA+1ttuqEO0QiBHAZmY?=
 =?us-ascii?Q?+ghILE4443VnRd0wa5Mu+6+Mw4mQCrvCeAnmXnca7hCv4Y7+qMEU7SNDyUhe?=
 =?us-ascii?Q?Q/2IKbVDvloHrjpfnv5kNcDMVx7bwnvNRi7z4lLY0i5kRpkigQbIUfEBpgd6?=
 =?us-ascii?Q?l6NBGjfbhLrIMtVrTPV1UorHrOmIdhvXiqFxixCgMbDkH4qmaiXTj53rBh13?=
 =?us-ascii?Q?Ve5EFh9Ez1/i047LH0qL7Edc67CTr6HT6UiNOGX51okRIaxPNKVapqhTkvie?=
 =?us-ascii?Q?wrQ3cEyqDCsrnTRDpml0X14wDQ28wl+QLW13jTqh0rFybLeP+DUcBee5Trhq?=
 =?us-ascii?Q?TIEEzfDpB08vDu9qLQZ8z47uYdLUJCXb/dwkk1GNKOuK2l+GnxAbsaqjv4ox?=
 =?us-ascii?Q?PcLX1pZoy8MIWeTt9iVkJU8Cw0MPqRL0wpbjaEWyUMkBKH32NboyWgnXIALH?=
 =?us-ascii?Q?7oZUGpNIVpJqyEE+VE+Q4Ej/LfB+z9ngaR1YzsrPu0ILho3a9eZ7ONJtxaQS?=
 =?us-ascii?Q?H9eEo+0TesrMeC2+A8dx4LTFESEzesJZjtV6tXFulDQQpUD7sjvHKjCN02Ly?=
 =?us-ascii?Q?hDT0j8jV02S1exzh9QTR45Kk5a+MHaCCXv1kRPS8DvX5U3lzFcbYvWJ6MEo4?=
 =?us-ascii?Q?n4tVgzwOUzanAAyGVvWWuN0WD/CNBe0TGFAM0qAn0ewZcoX1VNFkPj2dwvFY?=
 =?us-ascii?Q?oqhPNRnMOy889Vw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DaMf3vxenFz9OwdWPxfvRtmBCkYn2B/EjQhGET3yiIY1tvLY2X8FRhcTLN3e?=
 =?us-ascii?Q?mDLZEq498oUYYrSs7uKDycIF18KlyMkWgwymdS/HR1mbXGhZOfXBNTRajKc1?=
 =?us-ascii?Q?oXkrpz16jZoHYy8i6cODKwo4VH09os83MfwbunwrM25mwXBjV75m8bradNc2?=
 =?us-ascii?Q?hZF5yBaoPH4fTLqN09jKBcPgj/A8427bqxwWpmXds96Z8LoSdwlLB7KIsv8D?=
 =?us-ascii?Q?pdcljz9GMcj8sp+kFOetKZP6jzPOLvm1YaAbkp0FJql892KhsYcPn6KGJ8sg?=
 =?us-ascii?Q?PThQ4kwrAYdt48YCBynIWV0eY3sMupGMimn2iuk9KkYgfevpWRmmgCok7pEr?=
 =?us-ascii?Q?TSY6IUvPdxoksQpRX+mENBbiwmZrU5cJXJVAoc3VswbLdv6JepLWujkDBC+A?=
 =?us-ascii?Q?yEup9aa+LTmF0Ah2qgwR4WZ3MqxiNCC+s6lJ4hCGsV+rN9TgPV7KRg3fXRvH?=
 =?us-ascii?Q?Cmb6yF+OlPc/KqzEs58eZVdTl7eDDOlDo7jt7mQO/Uak/9i8PAnWkxBIDgul?=
 =?us-ascii?Q?FiEQIIqB793g64g6RC8lpnVcT7Bqtv8bY6qWH5jaSD2HclO2YG+N5Cr/oJsD?=
 =?us-ascii?Q?/mLuShgF49z1x0ci2yDbQ4iMptKOIKmnBjICq+Z7PP55yVv3DdzfJkuD4Fy4?=
 =?us-ascii?Q?txnMoixltvlU30tlUJlpsNjQBhDvwMcJCJ62T79j1ryRf4C3OeOStR8kfMJ3?=
 =?us-ascii?Q?G5Zo8E/2XsOYqSMp8YjMC4gucoAbHdh1LXr2DgVE4IOyY/SXZAe9tLrvHt9b?=
 =?us-ascii?Q?nDpC3cc2Po3tAVk+LTFgexkRWFsSr4mEqx7MFgLr1QB15fcLLmdtRJgJzsPI?=
 =?us-ascii?Q?HrgYgo4wa9LBUiE33UCtpPrT4umiOWOCr8p/Hj06RUqK3UyKqkdW2X6fcwLG?=
 =?us-ascii?Q?/50uYCy4YWQFBvicyWsqGVJ6oB+b6RAg1FEcVHCI10N6XnzX9rPXQNhq4yZw?=
 =?us-ascii?Q?KYV0uK0/V6M+IkX5AddSmlm6XzdnQJJeumfDHw3RJs+0fGafmJyjkRXW30/N?=
 =?us-ascii?Q?jaFHA5tGPDsJ6kNSLWZvq07ym7fjmIUV3eRGmPnLbeN3yYdegtWLJRDkjNCO?=
 =?us-ascii?Q?qQifkN0WTCENfQUhzFIEbJHiOfg0SNgAKisyhbien1kzcBQQUk6fepwithiI?=
 =?us-ascii?Q?tIdqQwZLxAup2Y9kI6yvPIHPCVgNbqsVAPLF0GEM3VRAtRno3QJ0ieaECbe/?=
 =?us-ascii?Q?Pp5u4TwQLMbbwSOCupcliWV2R+7uozZl7rxLOXuk3xOivtVhroOs4fWXxdWE?=
 =?us-ascii?Q?9cH7id/CPw670rK+dGBv8TzAWn2a/fzSC3OOeVp5TIOA/2bBDlH/cKP6vhb2?=
 =?us-ascii?Q?qYg4zBz+TS3YWagQ04bGaqQiM/HQSyNc0NcZ4H6Hk+RUPEr2Ez/HZN5N8a8j?=
 =?us-ascii?Q?s0sxGQJT1LkaPF3OcHRtSOQHg8ln5jNAWAU0+Ci6lw2vj0R5o7In0M+TVpmG?=
 =?us-ascii?Q?IzgUk9lHmrxFkcbhsxWsrPk0mJuzSr7GgMRnsaSqrt+Qj8aaWsHRR6ExRUd5?=
 =?us-ascii?Q?zjhk3lEM9y0dePqK85epW80snDarRJwjuuozUPUUwgXYaxHi0zkcToxQ84+S?=
 =?us-ascii?Q?cS93GmxPK9KT4hd7nT4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9451dac-f6d7-4ddd-27e1-08dd39f58a5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 08:28:10.7429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOh+pRob4TfrivSozeyCSqMKKAPtVUDi/v65Ui6hSj2PdZOHEK4tUwd1j1a7+Rd3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qitjO6T2Dve35ZNvIYLE0Kq3rExKKCZf/cEaApDP0Ck=;
 b=0JIu1r6bqKq42oKBgMMvwbt9IluYmmumbnhbv/RNwLLIxLwvD+SwSJMHQKpSWWROeoRrlrb1iOd7wqzoTnT0U7ccSPaydg3F8aH4o9XyVgrWGM1z+5exqmEtBDXK0h6Ej7Dwk4GKOfDROHJGQNYDvXdKHdayTkoTANLs1yB6Mws=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0JIu1r6b
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot
 package
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

Hello Luca,

> This patch adds a new boot package to Buildroot for building boot firmware
> applications from the https://github.com/Xilinx/embeddedsw repo.
> 
> If a user chooses to build a boot firmware application, it will not be
> installed by the xilinx-prebuilt package since it will come from the
> xilinx-embeddedsw package.  In this way, users can mix and match applications
> to be built by the xilinx-embeddedsw package and applications to be copied
> from the xilinx-prebuilt package.  This is necessary for the versal platform
> because the pdi file can only be built by AMD Vivado.
> 
> Support for additional applications in the https://github.com/Xilinx/embeddedsw
> repo can always be added to this package as needed or requested.
> 
> The xilinx-embeddedsw package replaces previous solutions including
> zynqmp-firmware, versal-firmware and xilinx-source.
> 
> A patch is required for the xilinx-embeddedsw repo because the LICENSE file
> has the name license.txt.  A patch is thus included to create a symbolic link
> from LICENCE to licence.txt, so that the Buildroot hash check will succeed.
> This patch is not upstreamable.

> Isn't changing the _LICENSE value the correct fix?

> -XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE
> +XILINX_EMBEDDEDSW_LICENSE_FILES = license.txt

Of course!  Thank you for this.  I knew I had to be missing something obvious!

> ...

> +if BR2_TARGET_XILINX_EMBEDDEDSW
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
> +	string "xilinx-embeddedsw version"
> +	default "xilinx_v2024.2"
> +	help
> +	  Release version of Xilinx/embeddedsw.
> +	  Must be xilinx_v2023.1 or newer.
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
> +	bool "versal plm"
> +	help
> +	  Build versal plm application from Xilinx/embeddedsw repo.
> +	  If selected, the xilinx-prebuilt package will not install
> +	  the plm.elf since it will come from the xilinx-embeddedsw
> +	  package.
> +
> +	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
> +	bool "versal psmfw"
> +	help
> +	  Build versal psmfw application from Xilinx/embeddedsw repo.
> +	  If selected, the xilinx-prebuilt package will not install
> +	  the psmfw.elf since it will come from the xilinx-embeddedsw
> +	  package.
> +
> +	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_psmfw
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> +	bool "zynqmp pmufw"
> +	help
> +	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
> +	  If selected, the xilinx-prebuilt package will not install
> +	  the pmufw.elf since it will come from the xilinx-embeddedsw
> +	  package.
> +
> +	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_pmufw
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
> +	string "xilinx-embeddedsw optional zynqmp_pmufw user cflags"

> + depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW

Good catch.

> +	help
> +	  Add optional cflags when building xilinx zynqmp_pmufw.
> +
> +	  Example cflag options can be found here:
> +	  https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
> +
> +endif # BR2_TARGET_XILINX_EMBEDDEDSW

...

> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> new file mode 100644
> index 0000000000..9a89f27d10
> --- /dev/null
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> @@ -0,0 +1,80 @@
> +################################################################################
> +#
> +# xilinx-embeddedsw
> +#
> +################################################################################
> +
> +XILINX_EMBEDDEDSW_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_VERSION))
> +XILINX_EMBEDDEDSW_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_EMBEDDEDSW_VERSION))
> +XILINX_EMBEDDEDSW_LICENSE = MIT
> +XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE
> +XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
> +XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
> +XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +# ZYNQMP_PMUFW application allows users to add cflags
> +XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
> +	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
> +XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS = \
> +	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS)"
> +
> +XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
> +
> +ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)

> I still think this looks like a good approach from a user point of
> view. However I cannot say whether the implementation, based on a
> package looking into the config knobs of another package, is clean or
> not. I'll leave this to more experienced Buildroot reviewers to judge.
> Same for the following options.

I am curious to what experienced Buildroot users think as well.  From my view,
I currently look at the xilinx-embeddedsw and xilinx-prebuilt as being a
combined package that just happpens to work with two different repos.

With the way I currently implemented the solution, the two packages a very
much tied together.  In the end, they are only used for AMD-Xilinx boards, so
since they are isolated from the rest of Buildroot, I hope my current solution
of wiring them together is ok.

> Other than that it looks overall good.

> I've also successfully tested on KV260.

Great news!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
