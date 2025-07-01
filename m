Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87AEC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 09:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 977E840559;
	Tue,  1 Jul 2025 09:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMQWXLI6qoGM; Tue,  1 Jul 2025 09:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A6B405E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6A6B405E8;
	Tue,  1 Jul 2025 09:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0233A197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBD8E60DC3
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABC_pDLv9cHh for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 09:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::615;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06A0D60BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A0D60BD6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06A0D60BD6
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 09:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqlmnxQFhKGVxs4ANRBvMEQLMT5Tz20K2FuPp2MFU9GGD5E7Nw7L8K+Ff5SVNzSYbRRbhRKniwcIn0+ryqFPDSXT+H7L0kpEEKjbJJykkAl3jQHd9l+Lgxh1V1bdc3xkY38HH+afa55IQZQAWM4bjSWRAP4dSnmlJKG+jnTnbL8AePxK7+Dh+7C+yce0z6UlFMZKSgEwG5f8i55NhMTieq6wcUMU4qA5VPcracgcIG1N1IEdtXmI+SGs3ddUzMuOalSbffBu8ZA5nkdxhPMnPwd/kF8SGG79qw4ajamK9u01ggpblXYIjXx/Zj4yez9k1HjjM2xDLLRNWvEkcjOABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDPaDLLIr4W56F1D12O49//aUFWRDrBwRjoKbivCQCs=;
 b=lCMQA37Y72M4Crqf2V6xEsI2b608OLnD4Xx1/s7y766f4ObtPepMIHUpyIca/+XQ/77ZG69Xbr1Yl3ANYcbgU62/E7WJ84J0ZpnNrIze7FJaTGia6wVHpQCpVf4o/IHz26D9V24yQ9ZOFVRPQqtXai9zgkGZMoIqybUDTgSKv7OMU3tIQmWO0J7qtqGMbK6SU+kqZQ3daNLONYLLgXd6CVLta6GVfZmxR1cZ2q2Vswqyp+1g+oZikEKfOv6o0ypp67AkTgfD6EQoQ1dwjEzVLTQ/aRXR61Dk0EXYowForOEo/TeMy5uW7vrRYCTuXl35iJEdXmyj0UT0G9m+XC0J3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 09:40:07 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 09:40:06 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Thread-Topic: [RFC PATCH 2/2] package/gcc: microblaze atomic support
Thread-Index: AQHb6mrJ8qulatDAWEKyDRCOHk5Ml7QdAusQ
Date: Tue, 1 Jul 2025 09:40:06 +0000
Message-ID: <SA1PR12MB5615736E11B75DFA54853ED2F041A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250701093020.371352-1-neal.frager@amd.com>
 <20250701093020.371352-2-neal.frager@amd.com>
In-Reply-To: <20250701093020.371352-2-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T09:38:18.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|IA1PR12MB6041:EE_
x-ms-office365-filtering-correlation-id: 6caf8b92-082e-415e-13dc-08ddb8834380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8o8p+YAuRIClJVyL6yjqg29a9rlZxel14KrTNM0pmkKAYC5Xy7yXtDeAbn2w?=
 =?us-ascii?Q?N+nUBf3ra+yZN7vk8Uann70nAwJWZ1iB7a/XKdtuxxT0bZFk/MSE4LaMUTsg?=
 =?us-ascii?Q?7Hq8Y7yxPsrKyKBeYp1CDsuyOdEeCH8sL5uBb87GxY62Ba168EmQrvlLEDeC?=
 =?us-ascii?Q?TTx2Zyrc1NAKuM7V2T6f8DvQN0X6s9tokIzczo3Cjjv6sWU3FUTUd6nHk1zq?=
 =?us-ascii?Q?7/j7NHi+lhdorOX+AhPsAt1+lcbkXqQDfBsrokd0bo6ywzCBcrzOpusOJoMe?=
 =?us-ascii?Q?F4Ukucwr9prAvG0SnOLG+/ntIlm3izNDzJws5vK4NmwvyBuae5dZjsIDGe91?=
 =?us-ascii?Q?seRG10iB9I8+bq5RIHFlJSbPAr2CNX59P+F6Y2TMYv+VG9gOvOeP0+ilKr3h?=
 =?us-ascii?Q?NI7opGGXiOvRK+iMw3Cy/2KupOHOufazSYMBUSetuXNi60F1abuhkgTwjiIQ?=
 =?us-ascii?Q?KfLz9pq0qA0mH/IQdu4kIOCDyJLrGHPyLUxNTX9TN/hV6ZzsmrMicAqpAkhR?=
 =?us-ascii?Q?xT3gZIaeTUXIMgsPUTbVp+mgQMpR36BYWAijpJiCMO3h4Sw32c3AgAmkDC0p?=
 =?us-ascii?Q?AkWHseTPilmUDfwdhowfvgoVVjMIeSP2bUOos7vzdAOH2bHe2nF9XLmK+zzi?=
 =?us-ascii?Q?8ZYLot1/GNFOvn07HDtGa/CMZKl5K/ge78R2Vd2YtvXlkHzhvejYcFnFOfgR?=
 =?us-ascii?Q?3odShM7YlwwrMY262/GEPTQG5vB64evth2zQCuXsOP2RpdziETVmFpc/ple+?=
 =?us-ascii?Q?Y5+Vy3rZiHQYEJK4CDuxvRX6qIVa7WOBmCHJmcqTcC5V3HD7QrGlPZPToSRz?=
 =?us-ascii?Q?LXsOMHOyxlj+OIt1LxmODYtH5FyCkaeywn6x8IRXSwTHVbacvrZ+6yrPXmei?=
 =?us-ascii?Q?ZChu2rXvap0K6lzMwCkGE2CDBMvIn6vVwkzVbQduWV6KxeoUatKvMZh9Wj3b?=
 =?us-ascii?Q?bbLusXT2sYhKjPgzNgmSk0bKlz9x7WblstSu1YtBsdV+ppTTUcmaBp/X+XGN?=
 =?us-ascii?Q?j8PiNch+eWbnRAm2GPJqhnso+f9q6WE150lPKHSt9Bjjc9gL8AnQ4DuoZw3l?=
 =?us-ascii?Q?9puh7GLkS2xSTZapaJTk0FS0+8xf5xnfm5SJoosM8jXGGJJ3bBlTqU2otmZd?=
 =?us-ascii?Q?FFX80YBjgb90NY8sqstTRCawRSvo4asxyzQOjX246lFRaWFNbBaMPGD/9M8i?=
 =?us-ascii?Q?dmEmURmj5VSk0N237nAc81GMpeLgmIefDvZhrx9dygnVjOoZEMZK9LDIJ0oe?=
 =?us-ascii?Q?yyb8p6hLkA4LuLZo1C1BS71id15+oqyS4SPGdoH1GM//Jb5MWyz6dPnQlQvA?=
 =?us-ascii?Q?epuakmj1DKZwFinCioZho4TDAI0xDpOQ/b0v8upTM5E786cGxENorE1K1bDW?=
 =?us-ascii?Q?Qm6APx/CjBpXlB6BboWgBZPW7aKUxRq2Dq1PvZvpCIHo5GfGrKYzf3EM9Wfi?=
 =?us-ascii?Q?qmAQeUKguOKXQg1Sue/GeTqolAcm1vJJYsCZyb0j8Q5OrQ5w2enhLt7fHN/u?=
 =?us-ascii?Q?tBcuJVCUDicDZHo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ztObeVzKWq492h/6K9h2A1AcDaIt/40q2DUYK65LnVmVyKkwrgENOXpX7V6E?=
 =?us-ascii?Q?NVWtC7VLtxaDF4tulE2MQujB6LVFdXDoycRbre54meV1qnQP5WzUM4z27h+J?=
 =?us-ascii?Q?r8NaRSvRzo1zHPyMkaCCLTncrY0/+yym9Nt3opaEEmR8rICRNLoeNh1WQ4i+?=
 =?us-ascii?Q?zyK4YWr4zH6PstNYDjIJZwpRwOvm32kN8v5Y7z0MsI0BLhe7aGGFj0wi1lOE?=
 =?us-ascii?Q?NDQt/0dBdzGN1XmCctcVU6ols7aVaRaSca0oX9BJoJ9ddMXHMZgRxt9jLx4O?=
 =?us-ascii?Q?Z4fdXTXelapZCyGfmRMMEFBLolF4Zbu0qOetXpFET1UNSBc8Wb9VbO27VZQx?=
 =?us-ascii?Q?mFqTgoShzuTpmTEEKcy/Nd6R9sT5ezNjNorlQ/qXAFHzcPnFUN7bkHLQ4lp8?=
 =?us-ascii?Q?wTthGDUNDK+qnqQ2ti2eAsbK+ZuGtTbv0UGu9bQESjOztM1lg+XafnfwvxW7?=
 =?us-ascii?Q?tFQupmYyVVGu2PUM5P/DIiacOoLRsqd3ib2+OVcO4PxlndinqGgkVsjB5hZw?=
 =?us-ascii?Q?bgRxicoRaMP5VGxQ9+j37+tOplv+H2BZi5zqQaUHVVuWxH4lgbnwvnce9fzJ?=
 =?us-ascii?Q?jmSFpqUTNer9BjmG3fMeQ3KkluEFurEesPpWDt0xSSLOtTPPT72Sbs6baqSl?=
 =?us-ascii?Q?fIQ8xSC5kQuw1J6n1DP8tKDF3CzutGtftPYWrDgenSjS4LU5NB9Nnm0EBN1o?=
 =?us-ascii?Q?0VdcpTJcbT2dHvCrPa1PMV/gf7gRoQ3th9KLPa4a/ir2VVoM00U1aPwX1Cb2?=
 =?us-ascii?Q?ta2Y5ra+2XmGDnoaAvGvx5kLte+BeIbjzJDHEgFosUGHAQKleUPqN1SXAaFQ?=
 =?us-ascii?Q?8zNr4PKrN6fbwoJ6UpEl7w9M/+YZvmIlVI46n70tk/s6P/IMuILOj0xSNXjx?=
 =?us-ascii?Q?K+BdHlh5SdQba1wRr+BDaNgjoBDQraxmvzYvgBJjHv1JrGAwnrin9rAM0SGP?=
 =?us-ascii?Q?Q01NZ6z/q4g0/3t2/d6aC6Y4GCQ9n4TUvNu1uxYG+1RpW/OcUYjLY9c9ld3j?=
 =?us-ascii?Q?wLFtmRI9Az4d/9IjHmjlsbvO+6J4fXL6lmkqj3T7FpkMlAYPYzYZfhEfKuMP?=
 =?us-ascii?Q?r19Cw2ZA7k6A13IGhGHAAVgMtQKRwbxVi9ZaHVAeSh8lodU5+tibamzhM/6I?=
 =?us-ascii?Q?h93Bc1htG8yI8cg1Tqzds915u12HefNbm9A4eXvFmKncYn8/13X26aKALDqx?=
 =?us-ascii?Q?pzU6Gc9YIeJjXEsCpKRWAVWWhgr2ihiNvk1EBXbjjbrmyZMrRsMH2MBdQSX0?=
 =?us-ascii?Q?btXik0He6erjyuGN0rb2GxEHk+jJxkWhkJ9jtMMW3drRw+rMaRk1pvb7o33N?=
 =?us-ascii?Q?0WimZseXa8nZEs3UvPLmQwIAAOZi2B8NTcJ6NOUhlBH58zFmoATkdNldQcLx?=
 =?us-ascii?Q?5w+aJA3+7PxnlWQqiHtX1GislX+am0R1RsCkTvvtNCjU9XCmjYSaHYtHHDQT?=
 =?us-ascii?Q?zgnsVG+19SYRvEGtDDO//O7cQprwJoFecX8RDcT0PX+UEk4T3t6cLBb2SRKn?=
 =?us-ascii?Q?uJHYgG9Si7wXxr5IKf8FW45nKeJT+J+QkpZ2bbLUoJK9aLvYu67xwHazn3Hr?=
 =?us-ascii?Q?18ImfaprRPnh1G+/0Iw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caf8b92-082e-415e-13dc-08ddb8834380
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 09:40:06.9051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UExxFNWC1EPERlXrUv5ZlDHWfNzCydre2xLhiLiqc1D3bhrGbebnREXODRcBJhoV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDPaDLLIr4W56F1D12O49//aUFWRDrBwRjoKbivCQCs=;
 b=I+iWqsaclnbMGbT/euynYVV8zg1z0a1N0k8/tfRI3ZrRGhR3AD1YsPwdsW+bRpZSrDaA3V97fpWnkJXZWrbCFchzFeNmOz/5JvZJSQeSbSKz7yVTKBVQpvlq2GzN8Yi201c8ugZqwQzXLajI0Xoeqtf+EARi8F2QbFc6OP9YTx4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I+iWqsac
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [RFC PATCH 2/2] package/gcc: microblaze atomic
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

Today is my last working day before a 3-week vacation, so I will not be able
to follow up on this patch set.  I assume that fixing this issue should make
the Buildroot community very happy, so if any of you want to fix up this
solution and get it applied while I am still away, I am perfectly happy with
that!

Otherwise, I will be back on Monday, July 28th.

Best regards,
Neal Frager
AMD


> This patch adds atomic test and set support for the microblaze arch.  A patch
> is required to use atomic test and set with gcc 14 and 15 which will soon be
> submitted upstream.

> In order to atomic instructions to work, the microblaze CFLAG
> -mxl-barrel-shift must be enabled.

> As I have only tested this with gcc 14 so far, I am not sure if I have handled
> all potential cases.  For this reason, I am requesting comment on this patch
> before submitting a final version.

> To test this patch:
> $ cat > .config<<EOF
> BR2_microblazeel=y
> BR2_GCC_VERSION_14_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ACPITOOL=y
> EOF
> $ make olddefconfig
> $ make

> Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
> Upstream: to be done with final version

> Signed-off-by: Neal Frager <neal.frager@amd.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
