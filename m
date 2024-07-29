Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32574C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 12:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9453404AA;
	Mon, 29 Jul 2024 12:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmBMvLqf8h6v; Mon, 29 Jul 2024 12:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891BC404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891BC404B6;
	Mon, 29 Jul 2024 12:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C655A1BF473
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B24B28121A
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXbPetQW6DPn for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 12:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::62a;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5719080DF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5719080DF8
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5719080DF8
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLGxU0EgT0s5wHDBGAOBeoNQ31IuHjrniQ2F329GYRbQgWKKK5yLUZTvPMcTWNztHtzjgQRKEyupUgE4gXi8BA9R/knN1TFMW2QRAZviKdiCP7YD023Q2lpMqm3wWLttSnjL3hsPi+qOH6AqybQDBgVqY+9F9+7ZMwQYgsRbUHfK1MFEco4u6i1P3RQFvpla0ZjicKkUNDzKGm/DZsFcD+0atniqWaom4CJyu2Z1vfr69cDFaI7Izs1+HcRYTQ/pA9hWnYfqYjun+wnuoLQcI4LzwKMvVtOC/ayispLMTv9uFcFiMuixHOdXHSL/PhDxu6fWtA0WJfrlRN/cFkCzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKcaRX1+MEQ6QQu3wRxeq+veIs7Jy1IS/l+y91t4las=;
 b=kqFHv9/cRHmeiNbGELKchSQ8q86EqjvF/DEQvbx67tm9QlLfsGG7qq4Rg3//9MqnaR+TyYL5k9KcT9IiAJMDVuKGvVoEds64bfr7lPywT9GS3VUAaS8qmYjvAnUUCcols3NOjzeDdZU1C94C/3XUy/ygx/eamg76UBNO1H/buKlNwXE+9gamDaP827Z/H7G/fwsVb4kHshgHohc68n6ZsPMQ7zXH9vFSgljQW0BKl3KQyGJPXqD1iclTgyBtZrYgYFZv5XyPMDmRxzBPt/zsDDg4UHPAjPzYwdw/+OGouV+KshVYKxgOJkUYCY7aAPr0OzGkF2YGMirvZ1orkQ0oSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 12:20:40 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 12:20:40 +0000
To: Bryan Brattlof <bb@ti.com>, Arnout Vandecappelle <arnout@mind.be>, "Rush, 
 David" <david.rush2@hpe.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] bare metal toolchain tuning options
Thread-Index: AQHa14ugAJ9WnrA4oUW9urCaOjJIDrH9EqWAgBCdUnA=
Date: Mon, 29 Jul 2024 12:20:40 +0000
Message-ID: <CH2PR12MB50044D706A928BBAD5E22621F0B72@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
 <5d78c650-f662-4733-ba33-dff3aa71727a@mind.be>
 <DM4PR84MB1664C75FF1FD9995EEE4E3A8B6A22@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <fbabd24f-673d-4f60-a5b3-d502146947cd@mind.be>
 <20240718222143.v47khuin7vl3g5nt@bryanbrattlof.com>
In-Reply-To: <20240718222143.v47khuin7vl3g5nt@bryanbrattlof.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6578:EE_
x-ms-office365-filtering-correlation-id: 00390f39-43af-45d9-e885-08dcafc8dc3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFJmd1lKL3J0TW1rd0RrMGQxaDZlcFlqMXBXOUljaS85OUY5NmFuemhJQldu?=
 =?utf-8?B?dGxSWHAwVkJiVTUrYUwwdU5ZWjlUNmt0MjhJV2p0V0JwYmQyY1IyblJzUVVp?=
 =?utf-8?B?czVvYlphL3N2YlExd1lZR1QzSXRBTG1tWmgybnFJcm1zbFY2TTlNdExWMGho?=
 =?utf-8?B?Yk1MYitEY3pzSnV0c0pDaEM4SG9YUVI0MDBoK05iaVhreTQ5NUg1bmgvU01j?=
 =?utf-8?B?WVFPYmRpVE5oN1p6QWN3WEdPUW9xQWxrTGNKeFN3SzRGdGlDa0diZ1kyWWE4?=
 =?utf-8?B?NUxyeVBGRG1jMitJbzAwYXNtWVBiQmVHaDlVRk5mMzAyaTdJSS9hdlkzZlpk?=
 =?utf-8?B?aWFXb1RLUm1La3cxSmpGWDZwcVA0cUc2MXBDSDB6VGU0cXl2dldTdklhSkxL?=
 =?utf-8?B?ZndBeFEwZmd6SUJ4N2VkelFEbmN0dytSVm1WK2JmRk1YUElib3RXamovRnd0?=
 =?utf-8?B?UTYwQzNEVUZwZHpkY2RYQjd4dmxJSTZoZHBUSHU4ZXYrRXRmZ3Uzd3VCbGF3?=
 =?utf-8?B?OHpQajJ3clkySWtWdmJmNTlDbmdZUitYQ1RqQlRVS0FDeDNPdG1FTDJ0Z1Y5?=
 =?utf-8?B?VFVhbGx2bDFoQWxQNEVvZDArSVhYS1NrQ0ZNWlNSSHc1WmE5Sk12cENPeElt?=
 =?utf-8?B?dEJ5YVMrazhZbVkyRFI1UURncUZ1a2xwVWNVdVNBWTc5amJkeFBOU3pDb3RP?=
 =?utf-8?B?V0ZNY3FUdEl1czR2RWxYdXllWFBtRWlFWUZqV0RHUTdzNVZZY0NVZWFaemgy?=
 =?utf-8?B?YnZZU3ZxVFpST1RzU0Q3Q25BSm1WQUdpdU9kNkhKQTZ6WUR5cjBzU1FjeWc5?=
 =?utf-8?B?U2hRYUcrR2E3eHNhbkNZRGVvL3ZldWJweVF4eUI5NTJxZlp0cTViYm1GdGRR?=
 =?utf-8?B?SDUvcU53SjV4TDJWcEFnd2hmdnAybHpWZVhka1FjZVJ5WURtNk93eUQ4b2Zh?=
 =?utf-8?B?NzR1bTNhL3lZM3g2c3hieEo1VUJGT0Y3SkxtSW9PbUhPSUZrNG50WEhEeWRu?=
 =?utf-8?B?dm1XbGlhSFlhcDNkdUd6YUgzMDQ4eW5jMzdFMEJva3dCNTdlL2wzU3ViQnhV?=
 =?utf-8?B?enA1eDVmbUZHYmh2T2NOUXBCMEhRb3hIaWpWbDhKWnlkdU1idVQ1Q3E1M2pu?=
 =?utf-8?B?R2dUa3lXamw0OHR4ZG5CeWZ4dUlXRTJ3Z05STWEvbCtNbVNIdUpyNDlTcnhx?=
 =?utf-8?B?RFRUdFU1Wnh5UkdCS1R5TzcvQ1hZVE1LSUhUOHlMTEp5dVFyU1Yvb3BOQkE0?=
 =?utf-8?B?ZTB3ckMzbzNDUVhwY3ZOMzJhTVFvQktjdFk3cWF5VXd1OVlTRFE4YkpmQk55?=
 =?utf-8?B?R3ZyeWQzdTY3M2JJeW1uQTV4c2xjYklQS3VZdXFQQjdveHE0Qm1qT1B6aEM5?=
 =?utf-8?B?R3BPUnBWZnhoQWZ5SW5GSkorQWhEL2RXZ1pjWXFqTi9lQ0lQdWhrL3FVaDFM?=
 =?utf-8?B?OTNMcEI2aEFQVVhDRUZBVXpsSHd3NGZCTXhaNW9OWlBVVnFibzBtcDBDaE5i?=
 =?utf-8?B?OGtRaG5SZWZxYTlOT3FVL0FpekFJeFRWa0RQTEhKVG84MjJMRC9acHI5RWNz?=
 =?utf-8?B?TlpkT0hSNk1zdzVzK2s5ZHFWWXRhcWFYWGRPRUFPS0V0U1B3NjZXbDRoeDBY?=
 =?utf-8?B?V3p0eEVkZ1FVZTc5V05la2g4U255ajliYjJjY2hvVUt4OHlJaitDV0owYXJP?=
 =?utf-8?B?RXdMZjF4L3B3TWJwdlR3STNlSW5YQzdDRjU2QlVvblNucTFYUEJRbXlwYVBt?=
 =?utf-8?B?dUJpMHo0Z3VRbGVacENPcmFNOEJQNXNOSG90UkVicVJjeGlzNnk4UG1vTWcz?=
 =?utf-8?Q?2SGJgwzXtRHfUfPAHDzJa2fzpbd9VzXjeB+kQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlhlTVVGRlI5YndPeHZRbWFGRW9oY2VUc0tpeExSZ210K2w4STRSNUNrT2tC?=
 =?utf-8?B?aG5uUXVtdE9YYmFGZ0JZRFBEWkVpSTlTb2IrazRRMUR0MHhPVWplS0hrUDZF?=
 =?utf-8?B?R01rcHB5MFhmUUlXd0tsVm1NbGt2VzVkYmhhemM5WVE5Z1BjdXNXazRFUDFa?=
 =?utf-8?B?MU1BNklYQ3RaRUdJdzF2RWFZRTBGeHJmclk5ekxXZzlSNXlTcE40aURiL2pu?=
 =?utf-8?B?YjA5NlZjQjNkYXROcDM0TjdaZkZ1TTNrVVE4ZTl0WU1jQW15MFZqZjVVY0ox?=
 =?utf-8?B?QjlGeXNaV0ZRM2FHUklha1JxZFVmUS96UklEMHpBVzY4Z3o3WWVoYnU2M0Vs?=
 =?utf-8?B?ZHJ2KzNGREpoZU0yaHBCaE1JWm5GL3FWck1pd0VQcXdSU1FNQnA4WXhtL0Zx?=
 =?utf-8?B?OWY0b09xS1BpR05FbWRRMHNYQkVoOW0vRTgzM0xjT0RTdkVpS1dTUVY1RU56?=
 =?utf-8?B?RTJQem5Cdndqb3RDUnVySHRJb3hRR1hKWUJmeDJKay9XSXdkc3YzMnY4WGgr?=
 =?utf-8?B?SUE4VC9nUEQ3ZTF0S3pWZFNlNzJyalgwT1hUd2YreFhNS2xmbGRwS29YOWda?=
 =?utf-8?B?K3Zqa3ZwandnQjBsOVNteGVNWlM3NnpLY0oyUVNNTTFYTEV6T1dIckNTeHUv?=
 =?utf-8?B?RXBKUTdTTUxZKzZEZkhBMERlZUYyN1VaUW52OGs4dU5WejdpbnR4aHhZRk0v?=
 =?utf-8?B?ZVFuMVk1Q1djdFJ4MW4ySkJrR1hEbVNPaVlsMGh1RXZ0WTJwYmpSUVF2dG5S?=
 =?utf-8?B?TnNxM1hrcnRXODNtR21XRVpObW4rUFdmdkIrckVBQUhkTENmVTRxMXpYZzJU?=
 =?utf-8?B?cXJtb2thcW1XYlJnV1RVY09KYUtOZS9zcUllMy9UczFVeUdYUVIva2x3YS8r?=
 =?utf-8?B?dHpNYWJxTW1QeU1nVk9CZ0MrY0VzVVVTZlNzOWtjUSs4bEd4WGJGeVlJWjBq?=
 =?utf-8?B?VHhEblp6M3JGamJ5M3hwZnZhVzJLUTlHZVBIaFZnbDdxemFKY3V6c0xaV0JO?=
 =?utf-8?B?QWdPYVkrNHVneEoybXRJS0poMWVFd3MrNWI5Wk1zTTlnWXJXcW55SUo4b3Vs?=
 =?utf-8?B?SE9FNWN4SjAwTFloSXMwNm4yZ1hjWGFaTDNEdUYzMlhWUnNqcTc5bCt5V3FQ?=
 =?utf-8?B?enJCQU1STGVOYStsNkN4eTlMWmdtTy9pU3YwZTNsK2NVSVkxVHR0REhveGJV?=
 =?utf-8?B?bmhnZUdRWFB2em8zR1JKS3RQQ0EySmkwQ3RtNW1sQ285VnMzeExjYWtUNEsz?=
 =?utf-8?B?aEJNOEdXQkhySU9ENzZSZ1JiMHJVcEt4aFRQVGhDMHNreDY3alpsWStEWFpK?=
 =?utf-8?B?K25SQXVFUnNPU2x3M2VxYWg1M3lzZ1FMeEdqb0lnNEc0RTlKdGhlU3ZrQkhJ?=
 =?utf-8?B?czhMcTFlS2doRERMY1Rvbnc1Rmc2M2ZYV0JSdjIzT056QWZ1Umc2N2JJWm01?=
 =?utf-8?B?bFIrWmtScGFaUVBwUnNyM2pLNXJqVVRGS2F4alM3ZzV6VWs2cUVHMFI0ZjJa?=
 =?utf-8?B?Y25RWFJEb3VmN2x0TVVFSjZsaUI3VEJ1MW0yc0I4MVdMSXRvQ21RY0V4WVFz?=
 =?utf-8?B?OG1hYUZ6djh2eW41c09iQ3QydEJERG5lNlJSdUg1enI4ck5vUWpYREx3VWFM?=
 =?utf-8?B?R1BaMjBFQnNmL25IcVYxTUFvNGNNNmZybVkvVjNQMEQwdFBieGtQQ1VzeFFG?=
 =?utf-8?B?Vlh3enMycDdUSXo0WS9TQU9qeDBRMXVUbHlYcmxiOVFERFZiR2oyL1dEdVdX?=
 =?utf-8?B?U0NaNDFIUVVBMGlTcHdvekdVZlNKbTdUTzRIZUtBNDlhc3hXMDNieEVSUnZQ?=
 =?utf-8?B?V3pMVVZsSHRWMU8zTmhkVk9HaFJ5U2FQYld4dDNpYkFDYUZ2ck94T0dlKzhC?=
 =?utf-8?B?WHhaSmhuNUpGVGRDb1paR0w1S1hkRnJjeW5qR3NsMTlLdGtpTFpBRmgvVlV4?=
 =?utf-8?B?bDlPZlEvT1lMZ0xqR3U4QXNiL3lQRlBZdXd2cDlTb2pQdnVZUktmd3pBTlB3?=
 =?utf-8?B?MWp2L1YyeW5NeTZzRDY0VWNtVWx4QkJCQjBaSVFwOEphSkFHR052UkZGbUpk?=
 =?utf-8?B?SGtrYWM1aEhBTlpiMDNib1dLL2k2cXBHdVBhSFBOMFowNWdWNlZ0bWx5aVh4?=
 =?utf-8?Q?mlGQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00390f39-43af-45d9-e885-08dcafc8dc3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 12:20:40.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sVx+8mN4uKFytwpwOMUTKCJZpLl+pOCwN/zSFDHNdCEIu83uVnK8/RSKqmq9bp9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKcaRX1+MEQ6QQu3wRxeq+veIs7Jy1IS/l+y91t4las=;
 b=SzfhdEyUBXRwVQhDhn53DEmPeGZiy0LFWW6hrYKv/ogiacxR8GwJLgl1DIPuACwAZGT/RKNcepTt6V/G4pKZbtYbbLUC83R0DhKW+MCo6QzF+kMxqGS2MF6DWhoyjghYvu7jizKcOS1vWxB3+97zdJCp7AOko91HhhS4Uo9Llx0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SzfhdEyU
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] bare metal toolchain tuning options
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsLA0KDQo+ICBBZGRpbmcgc29tZSBwZW9wbGUgd2hvIGFyZSBhY3R1YWxseSBpbnZv
bHZlZCBpbiB0aGlzIGJhcmVtZXRhbCBzdHVmZiBpbiBDYy4NCj4gDQo+IE9uIDE2LzA3LzIwMjQg
MTY6MTMsIFJ1c2gsIERhdmlkIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+IEZyb206IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4NCj4g
PiA+IFNlbnQ6IEZyaWRheSwgSnVseSAxMiwgMjAyNCAyOjUyIFBNDQo+ID4gPiBUbzogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+OyBSdXNoLCBEYXZpZA0KPiA+ID4gPGRhdmlk
LnJ1c2gyQGhwZS5jb20+OyBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiA+ID4gU3ViamVjdDog
UmU6IFtCdWlsZHJvb3RdIGJhcmUgbWV0YWwgdG9vbGNoYWluIHR1bmluZyBvcHRpb25zDQo+ID4g
PiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBPbiAxMi8wNy8yMDI0IDIxOjM3LCBSb21haW4gTmFv
dXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToNCj4gPiA+ID4gSGVsbG8gRGF2aWQsIEFsbCwNCj4gPiA+
ID4gDQo+ID4gPiA+IExlIDA4LzA3LzIwMjQgw6AgMTk6NTgsIFJ1c2gsIERhdmlkIGEgw6ljcml0
wqA6DQo+ID4gPiA+ID4gSGksDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSGF2aW5nIHRoZSBvcHRp
b24gdG8gYnVpbGQgYSBiYXJlIG1ldGFsIHRvb2xjaGFpbiBhbG9uZ3NpZGUgdGhlIExpbnV4IGJp
dHMNCj4gPiA+IGlzIGZhbnRhc3RpYy4gQXMgdGhpbmdzIGFyZSBub3cgb25seSB0aGUgYXJjaCB0
dXBsZSBpcyBjb25maWd1cmFibGUgdGhvdWdoIHRoZQ0KPiA+ID4gZGVmY29uZmlnLCB3aGljaCBt
YXkgbm90IGFsd2F5cyBnZXQgdG8gdGhlIGRlc2lyZWQgcmVzdWx0LiBIYXMgYW55b25lIGxvb2tl
ZA0KPiA+ID4gYXQgYWRkaW5nIGNvbmZpZ3VyZSBvcHRpb25zIGZvciB0dW5pbmcgdGhlIGJhcmUg
bWV0YWwgdG9vbGNoYWluIHBhY2thZ2U/IEZvcg0KPiA+ID4gZXhhbXBsZSwgd2hlbiBleHBlcmlt
ZW50aW5nIHdpdGggYW4gYXJtIGNvcnRleCBtNCBtaWNyb2NvbnRyb2xsZXIgd2l0aCBhDQo+ID4g
PiAnbmFubycgbmV3bGliIGNvbmZpZ3VyYXRpb24sIHRoZSBmb2xsb3dpbmcgY2hhbmdlcyB0byBn
Y2MgYW5kIG5ld2xpYidzDQo+ID4gPiBjb25maWd1cmUgY29tbWFuZCBnb3QgbWUgYSB3b3JraW5n
IHRvb2xjaGFpbjoNCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBCUjJfVE9PTENIQUlOX0JBUkVfTUVU
QUxfQlVJTERST09UIG9wdGlvbiBpcyBzb21ldGhpbmcgbmV3DQo+ID4gPiBpbg0KPiA+ID4gPiBC
dWlsZHJvb3QgKGFkZGVkIGluIEphbnVhcnkgMjAyNCkgYW5kIGluaXRpYWxseSBpbnRlbmRlZCB0
byBidWlsZA0KPiA+ID4gPiB6eW5xbXAtZmlybXdhcmUgKHhpbGlueCkgcmVxdWlyZWQgdG8gYm9v
dCB0aGUgYm9hcmQuDQo+ID4gPiA+IA0KPiA+ID4gPiBJIGRvbid0IHRoaW5rIGl0J3MgbWVhbnQg
Zm9yIGFub3RoZXIgcHVycG9zZS4gRm9yIGV4YW1wbGUsIGJ1aWxkaW5nIGENCj4gPiA+ID4gcmVt
b3RlY29yZQ0KPiA+ID4gPiBtNCBiYXNlZCBmaXJtd2FyZSBldGMuLi4NCj4gPiA+IA0KPiA+ID4g
ICAgQWN0dWFsbHksIEkgdGhpbmsgaXQgd2FzIGludHJvZHVjZWQgaW4gdGhpcyBnZW5lcmljIHdh
eSBwcmVjaXNlbHkgdG8gYmUgYWJsZSB0bw0KPiA+ID4gdXNlIGl0IGZvciBvdGhlciBwdXJwb3Nl
cywgbGlrZSByZW1vdGVjb3JlIGZpcm13YXJlLi4uDQo+IA0KPiAgTGl0dGxlIHNpZGUtdHJhY2s6
IHdlIGFsc28gaGF2ZSB0aGUgYXJtLWdudS10b29sY2hhaW4gcGFja2FnZSB0aGF0IGNhbiBiZQ0K
PiB1c2VkIGZvciByZW1vdGVjb3JlIHN0dWZmLiBUaGlzIGlzIG9ubHkgYWRkaW5nIHRvIHRoZSBj
b25mdXNpb24uLi4NCj4gDQoNCkkgY29uZmlybSB0aGF0IHRoZSBvcmlnaW5hbCB1c2UgY2FzZSBm
b3IgYWRkaW5nIHRoZSBiYXJlLW1ldGFsIHRvb2xjaGFpbiB0bw0KYnVpbGRyb290IHdhcyB0byBj
cmVhdGUgYSBtaWNyb2JsYXplIGJhcmUtbWV0YWwgdG9vbGNoYWluIGZvciBidWlsZGluZyB0aGUN
Cnp5bnFtcCBhbmQgdmVyc2FsIGJvb3QgZmlybXdhcmUgaW1hZ2VzLg0KDQpIb3dldmVyLCB3ZSBz
cGVjaWZpY2FsbHkgZGlkIGl0IGluIGEgZ2VuZXJpYyB3YXkgYXMgd2UgdGhvdWdodCB0aGVyZSB3
b3VsZCBiZQ0KcGxlbnR5IG9mIG90aGVyIHVzZSBjYXNlcyBmb3IgaGF2aW5nIGEgZ2VuZXJpYyBi
YXJlLW1ldGFsIHRvb2xjaGFpbi4NCg0KSSBhbSBwZXJmZWN0bHkgaGFwcHkgZm9yIHNvbWVvbmUg
dG8gYWRkIG9wdGlvbnMgdGhhdCBjb3VsZCBleHRlbmQgdGhlIHVzZSBvZg0KdGhlIHRvb2xjaGFp
bi1iYXJlLW1ldGFsLWJ1aWxkcm9vdCBwYWNrYWdlLiAgT24gbXkgc2lkZSwgSSB3b3VsZCBqdXN0
IHdhbnQgdG8NCnJldmlldyBhbnkgY2hhbmdlcyB0byBtYWtlIHN1cmUgdGhhdCBub3RoaW5nIGJy
ZWFrcyB0aGUgYWJpbGl0eSB0byB1c2UgdGhpcw0KYmFyZS1tZXRhbCB0b29sY2hhaW4gZm9yIGl0
cyBvcmlnaW5hbCBpbnRlbnRpb24gb2YgYnVpbGRpbmcgdGhlIHp5bnFtcCBhbmQNCnZlcnNhbCBi
b290IGZpcm13YXJlIGltYWdlcy4NCg0KUGxlYXNlIGZlZWwgZnJlZSB0byBzdWJtaXQgYW55IHBh
dGNoZXMgdGhhdCB3b3VsZCBhZGQgZnVuY3Rpb25hbGl0eSB0byB0aGUNCnRvb2xjaGFpbi1iYXJl
LW1ldGFsLWJ1aWxkcm9vdCBwYWNrYWdlIGFzIEkgdGhpbmsgaXQgd291bGQgYmUgZ3JlYXQgaWYg
dGhpcw0KcGFja2FnZSBjb3VsZCBiZSB1c2VkIGZvciBhZGRpdGlvbmFsIHB1cnBvc2VzLg0KDQo+
IEhhIGl0J3MgaW50ZXJlc3RpbmcgdGhpcyB0aHJlYWQgc2hvd2VkIHVwLiBUaGVyZSB3YXMgYSB0
aHJlYWQgYSBmZXcgDQo+IHdlZWtzIGFnbyBvbiB0aGUgdS1ib290IG1haWxpbmcgbGlzdCBhYm91
dCB0aGlzIHNhbWUgdGhpbmdbMF0uDQoNCj4gU2FkbHkgaWYgeW91IGdvIHNob3BwaW5nIGZvciBu
ZXcgSVAgZnJvbSBJUCB2ZW5kb3JzIHlvdSdsbCBxdWlja2x5IA0KPiBub3RpY2UgdGhlIHRyZW5k
IChERFIgZXNwZWNpYWxseSkgd2hlcmUgZXZlbiBpbmRpdmlkdWFsIElQIGlzIHN0YXJ0aW5nIA0K
PiB0byByZXF1aXJlIHRoZWlyIG93biBmaXJtd2FyZSBibG9icyB0byBmdW5jdGlvbiBwcm9wZXJs
eS4gVS1Cb290IGFuZCBvdXIgDQo+IG90aGVyIGJvb3QtbG9hZGVycyBhcmUgc2xvd2x5IGJlY29t
aW5nIHRoZWlyIG93biBtaW5pLWRpc3RyaWJ1dGlvbi4NCg0KPiBQZXJzb25hbGx5IEkgd2FudCB0
byBlbmNvdXJhZ2UgdmVuZG9ycyB0byBiZWhhdmUgbW9yZSBsaWtlIHhpbGlueCBoZXJlIA0KPiBy
YXRoZXIgdGhhbiBkbyB3aGF0IHdlIChUSSkgY3VycmVudGx5IGRvIHdoaWNoIGlzIGRpc3RyaWJ1
dGUgdGhlc2UgDQo+IGJpbmFyaWVzIG9wZW5seSAoYm9vdC90aS1rMy1ib290LWZpcm13YXJlLyku
IFRlY2huaWNhbGx5IG91ciBETSBmaXJtd2FyZSANCj4gaXMgb3BlbiBidXQgeW91J2xsIG5lZWQg
b3VyIE1DVSsgU0RLIHRvIGJ1aWxkIGl0IHdoaWNoIGlzIG1vcmUgcGFpbiBtb3N0IA0KPiB3aWxs
IGdvIHRocm91Z2gsIGhvd2V2ZXIgb3VyIFRJRlMgYW5kIERNU0MgZmlybXdhcmUgY29udGludWVz
IHRvIGJlIA0KPiBjbG9zZWx5IGd1YXJkZWQuDQoNCkkgYWdyZWUgd2l0aCB5b3VyIHBlcnNwZWN0
aXZlLiAgQXMgYSBmb3JtZXIgVEllciBteXNlbGYsIEkgd2lzaCB5b3UgdGhlIGJlc3QNCm9mIGx1
Y2sgaW4gZ2V0dGluZyB0aGUgYm9vdCBmaXJtd2FyZSBvbiBwdWJsaWMgcmVwb3NpdG9yaWVzLg0K
DQo+IEFueXRoaW5nIHdlIGNhbiBkbyB0byBhdm9pZCByZXBsaWNhdGluZyB0aGUgR1BVIG1hcmtl
dCB0b2RheSBpbiBteSBtaW5kIA0KPiB3aWxsIGdvIGEgbG9uZyB3YXkgdG8gaW5jcmVhc2UgdGhl
IHNlY3VyaXR5IGFuZCBsb25nZXZpdHkgb2YgdGhlc2UgDQo+IGJvYXJkcyBhbmQgU29DcyAyMCsg
eWVhcnMgYWZ0ZXIgdGhlIHZlbmRvcidzIGRldmVsb3BtZW50IHRlYW1zIGhhdmUgDQo+IG1vdmVk
IG9uLg0KDQpBZ3JlZWQuDQoNCj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2
MjAyMTM1MzkuZnRtamhwaHlwc3N4cDVuNEBkZXNvbGF0ZQ0KDQo+IA0KPiA+ID4gICAgQW5kIEkg
d2Fzbid0IGEgYmlnIGZhbiBmb3IgbWVyZ2luZyB0aGlzIGJlY2F1c2UgSSBmZWFyZWQgdGhlcmUg
d291bGQgYmUgbm8NCj4gPiA+IGVuZCBvZiB0dW5hYmxlcyBhbmQgYWRkaXRpb25hbCBjb25maWcg
b3B0aW9ucyBuZWVkZWQgdG8gcmVhbGx5IG1ha2UgaXQgd29yaywNCj4gPiA+IGFuZCBJTUhPIHRo
YXQgZmFsbHMgb3V0c2lkZSB0aGUgc2NvcGUgb2YgQnVpbGRyb290IChidWlsZGluZyBhIExpbnV4
IHJvb3RmcykuDQo+ID4gDQo+ID4gSWYgdGhlIGdjYyBhbmQgbmV3bGliIGJhcmVtZXRhbCBwYWNr
YWdlcyBlYWNoIGhhZCBhbiBleHRyYSBjb25maWcgc2V0dGluZyBmb3INCj4gPiBhcHBlbmRpbmcg
YSBjdXN0b21pemVkIGxpc3Qgb2YgY29uZmlndXJlIHNjcmlwdCBhcmd1bWVudHMsIG9yIHVzZSBh
IGRlZmF1bHQNCj4gPiBsaXN0IGlmIHVuc3BlY2lmaWVkLCB3b3VsZCBnbyBhIGxvbmcgd2F5IGlu
IG1ha2luZyB0aGlzIGZlYXR1cmUgbW9yZSBnZW5lcmFsbHkNCj4gPiB1c2VmdWwuIEFuZCwgaXQg
d291bGRuJ3QgcmVxdWlyZSBhIGJ1bmNoIG9mIGV4dHJhIG1hY2hpbmVyeS4NCj4NCj4gIEkgdGhp
bmsgZXh0cmEgb3B0aW9ucyB0byBnY2MncyBjb25maWd1cmUgaXMgZGVmaW5pdGVseSBhbiBvcHRp
b24uIFdlDQo+IGFscmVhZHkgZG8gc29tZXRoaW5nIHNpbWlsYXIgZm9yIGUuZy4gYXJtLXRydXN0
ZWQtZmlybXdhcmUuIEJ1dCBJIGd1ZXNzIHNvbWUNCj4gb2YgdGhvc2Ugb3B0aW9ucyB3aWxsIG5l
ZWQgdG8gYmUgcmVwbGljYXRlZCBmb3IgYmludXRpbHM/IEFuZCB3aGF0IGFib3V0DQo+IHByZWJ1
aWx0IHRvb2xjaGFpbnMgbGlrZSBhcm0tZ251LXRvb2xjaGFpbj8NCj4gDQoNClllYWggSSBsaWtl
IHRoaXMgaWRlYSB0b28uICsyDQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
