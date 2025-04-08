Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF69BC3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 12:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3182A403A5;
	Tue,  8 Apr 2025 12:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5fp_2MNVMkr; Tue,  8 Apr 2025 12:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B944090F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B944090F;
	Tue,  8 Apr 2025 12:43:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12EFB1F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD8960B71
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdyXIulvKD3m for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 12:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::617;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C6936071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C6936071E
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::617])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C6936071E
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSn7U3jyF8AZtPkTTaO5rBPtm+8P6UZ754EB2f2mWmcaeosPHkfZvDytmL4hVl0M89vdEl1+UYbzuP3jNfbubqYAZD9EuUrnXg6LdGHo6F3KXIQ1hxYJjx6PmSiRAbLiQQSnscZjkFjv7PR/X2eO/P5qugGthbb5K+lGwRWu+QG7rflPxBCoYYdQOZ6mXjhA8VWUjfSxHicBFkciC6L0sRENhDkrCEKpb7Up6L2Ghqt8WjX38hh5gFQgEzSmcOsOAk6HgFbevwOxxfFBj6VOT2Ge/m6rFdh+QP8zsZrNji0Hsjh5/fJfhIhoKD2qReCVXgfL8h1UOJFvCvOKL5rgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/LPWSv00c+KTRyeuoiyQehcKLmOJ0GCaBIU5o1VVGc=;
 b=k8UpZvBPc9X4kPnWPc2y0oAtUdItpe+6NGP5X5B6ODf4+fQznsgifu2zNBOMTKKj1XQz8LyPART+mMpjVDzmIfvZvC5TQxa7wEc0muD6+AXYBQ+okYI6ZptzXGM39Zcjjz9QaDBf61j9bdSr6axolYh83ajdbd04ZyccBQWWfs18HzQH08j/j884xojTOI5r2HPhvrBkormHwsb162jRc/XI/BEJBAI3aZypK9vD8HTakC2+DtmKMz81JYTL2cCRiBtASLIhLu95kItIZIy8+rvFVif5npX3crPrK9p5vE3VLx9S2eQDGS723GrkZ/Yec7QVWkyusXFgHvligI0/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 12:43:12 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 12:43:12 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 1/3] boot/xilinx-prebuilt: add segmented config support
Thread-Index: AQHbp9HXcZkvyKDjIkac7A2tCA12TLOZnYYAgAAUaxA=
Date: Tue, 8 Apr 2025 12:43:12 +0000
Message-ID: <SA1PR12MB5615AC9ED8BB739D5EDA63EDF0B52@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250407152911.3790939-1-neal.frager@amd.com>
 <20250408130840.212f3163@booty>
In-Reply-To: <20250408130840.212f3163@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=e19ac34d-1567-41f9-a4f3-f64761b4b49f;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-08T12:21:44Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH3PR12MB7691:EE_
x-ms-office365-filtering-correlation-id: c7cfc18f-9ef0-498c-4e30-08dd769aec8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FjVzhQ/CdDkKf6Whdx1UrhqEox+9tp2wNL2E1YI0ZgSPCzKDxrLN/VXgVsyY?=
 =?us-ascii?Q?OEnsqUnXnNNXk/eC/O+cK0yUaimewwQRrYE+2cZJt3VGDg3puWIw9g4+4Rbg?=
 =?us-ascii?Q?/xtQ99YqulN6JuomBjOLDRW+Ml0JujJ5bap0wlcnGMxUg/TEftnTmJv7JnU1?=
 =?us-ascii?Q?X4AeAUy1NOVwJ7GHrMUaXA7cDUpQt3ZYUm4pHr1UPg3JsO0NIPeb7UfW9BIU?=
 =?us-ascii?Q?UwlyNOhV8DHKgWUgMaVWuRNBT9qmf7bevUaa9KFdlMg4Xtk1GhbPC6yZEnxE?=
 =?us-ascii?Q?fOxS/MJE1GFtYR6wXZATmUK8AOlsxkaRppbn+dQky4glUs4Ak/RvwwHrmjCo?=
 =?us-ascii?Q?FJnlHCDd/bU70wLXfhyZy5afR8UZKOF5NxgHtXnEpyP89xL2etDY37BwGVqu?=
 =?us-ascii?Q?ZnKmlcQs6ZvSDQjYFPtc0C1lUqGeKAWVlEojSuG9pJIjQxSwJKYjeBzm/oli?=
 =?us-ascii?Q?rQu3oSqCmgOPS65d6zeUYT5iTzdObt6Q5n9ohTEwcgIn/sWeEbzfk8vqhc+d?=
 =?us-ascii?Q?yYG6yf5uq6mm612YX+g8eNzDQYS2k521XO4DMMustiVpIejnaUH/C4RWBlMN?=
 =?us-ascii?Q?MpBN3Q41RsXBvZgg69+h1EVUxuogo8SqYO8FX4Y9hl7DXSejPG7Kbe9hlnPU?=
 =?us-ascii?Q?LlayaUgq0Q3Wi0Z0HJo6xvLa1i2eiO8VCR3o2qGcQEHnbsFln80Xa8JSN0G4?=
 =?us-ascii?Q?pjLRbB7LWcLBk6PD1vNJeKsZp1KkfgSMEehGMDu8cMUZ/dWhzFveuhiyXEbZ?=
 =?us-ascii?Q?/wZvkIRxweDKPquSYo6kHKmRiGufUqTOTf7TK4i1tC/SFsCrxv9TKXL3/cax?=
 =?us-ascii?Q?Y0VyZcZ2VlAgHBWI84pkY5J9IFoMjt9A8CxvFOiBka/nYWbxfrALeleh1ROq?=
 =?us-ascii?Q?inaGRF3Y5z3sq0/C/Oqq1kt6US661dDFz66mL9OIgcHpHm1sNLPkss0NMJ2r?=
 =?us-ascii?Q?e9aBgzwn8VjlrSNDKD+L5XbieJdJXkea9KCCnqOcTxa4Xli9tRH0U3OP2tzW?=
 =?us-ascii?Q?ymU6siULa49Lx0tBzz89RBZOcl4Cab4G/wZsQ0meKzdw+5nuMkzHDE7/+pHf?=
 =?us-ascii?Q?KECqd5GISQNKM/zEhZHKWwlk1wogCgnVd7IUfcY+t1wW/WUFCD313RM7wIZt?=
 =?us-ascii?Q?tmmD1uQ4lc2i5gw3L50ikigujjAOKnyvVaj+gMipPqDWDOcKMH2Z2LAPq3NU?=
 =?us-ascii?Q?D+wtc3aRK0Evf5c3GGnbK9zpsHUlzwsDr3zGzyhgliX14JL4Am/+3nKyKVsT?=
 =?us-ascii?Q?jAFUVl8y5SKxJqbqt18xCn/EPsghSD+AZh/kJgHQeedm9ehI7ZmzAeE0rHvd?=
 =?us-ascii?Q?qXOdAyewXvF/dx+m+vZsikk1oZsuxI39zwHjEc9QUEzr5uFSl1WIV7gC+IzX?=
 =?us-ascii?Q?lzJLE1jkH/1Ii/lMJkwkI3S1PfLYVHuj9D3wZAqGJu1o+ZD+j781tYxE8GEl?=
 =?us-ascii?Q?wShT1cS6vUbrR4pQUaZdV2+aLPHd/C6uU/+J+MRZXmQKQB7k7ZXBGNXzzWSy?=
 =?us-ascii?Q?jY0uBalsdv+bUAk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YVGLoxPa3iP8G4Jg0LUQBGTwjkzKyVtJBmYAmlqeU5Ralxiv0PDCKghRndYA?=
 =?us-ascii?Q?lmEHbRte7vneqF/wt62yzimTlX0FTseO9TQmecBP2c/v+lD630aRV4SVRMc2?=
 =?us-ascii?Q?m/AzOGDrfstLyBmdF7T8EqdBf+emz3qlq3TsG6qCxPQsWok1NG/u1FubYOw/?=
 =?us-ascii?Q?9wBxvpMYfBuCgjypnbwbwF2awGtIZ7SQqa8vJwLVzP2dUqW/wIpj2TNhPYrT?=
 =?us-ascii?Q?vznG4qPxTQgh6Szt3uAaSSR/D5U6nlV0LdHBrPA1owa9omFq917QH122RwbR?=
 =?us-ascii?Q?33XGVsEQQpnovjUltNiTgBHX8IFuXCY9yZTIT4VJZHFo7ZgGr7CkdTc87pcO?=
 =?us-ascii?Q?YqQjR+LSLOBA85Zwoj6wd+y85x/pEvr4DPnDjWbl0f04Ws4iOcTpV/AoA/7D?=
 =?us-ascii?Q?veC9xMFRPSpm5MwhezAm+ZqdUZvD+D2zV4Mq29zIywWqp+jRXVFooZEwg85d?=
 =?us-ascii?Q?gykpx6vxtepoX7mTg+sigaY17rMzVTOjelTAbppfMgsFM2h9blGYp8I+eFzY?=
 =?us-ascii?Q?vfLUE3Rbadp36ElDWb9lTV2Tk6Felpk811ktxbSn81oOtXspRRYgNfyB6UIz?=
 =?us-ascii?Q?fwO51DYkFVIiwKdg9u3dqpcs6kTpYhBAGWWC/N839DxJ4WjBr2FzOvLFsHMK?=
 =?us-ascii?Q?LJFXNIEfHUrh2T1MJmTfVu4WBdzpA30q+IzkryNze/3oZ24gZ3aL/MMvwdRr?=
 =?us-ascii?Q?fyvz2SbBp7lGNc9jsO4199qTf53PNvsah+kOaAP1F60wlwadG/v7h5uVchHp?=
 =?us-ascii?Q?lnuwQ3PCzdYfwzIkaVER8TUVzOLlSTt+e9pxEaUqL4Q4XXsRf2tVYTn1qXGN?=
 =?us-ascii?Q?3fXvLgk3uXJlW7SU/N9eAGIp1By6GqcImlDJl7oDm19BN/skvY+BfQegwEdX?=
 =?us-ascii?Q?vNIUqSJtOYyIwTBMMwHV49bIVG8bQU6GMYoMCaIwaaFVgMSJjJzIHRUhFlZv?=
 =?us-ascii?Q?ZmGm2b/EV/mM2OazCdNfvvykPfoBvyCSE8OvLqOSnJsEtNdfUWtBZaBnXnZx?=
 =?us-ascii?Q?iig0fTqsoUvdu1P61+TrCPnrveUV8gY1BHGGn2uVeUach24xeRxdwYxEPtDx?=
 =?us-ascii?Q?LTArS63rywDL/NNeBvueoqQy+J+iaAsyOiM45yJcozaJG3jEYv/Rg5J9JG7N?=
 =?us-ascii?Q?c+9Jpt/ak6Ezs0cxdKYa9UogNSBlYjCf+LpMoUNNmprW32dkEQesGeD4oLXZ?=
 =?us-ascii?Q?JnIGkcEWZ5R0uT8qoh6BMhmy+iXe+ycKLCwmcrtOqT5cfZ6XKU/MuucnhtTf?=
 =?us-ascii?Q?8UsK82dZCQYqcNq+qpj9tGFJLWWgEC9G5zM6dxiRx3+/saxpO6Z0oI7z07H1?=
 =?us-ascii?Q?Gd5cFu6zVvFg9WqBpsrZuAXLLdO0N1cVb5wdC3uzBwSGkvGwugPkl46xY/LY?=
 =?us-ascii?Q?cCpg9LS1GlM6FwdxjewD4B0fyRPe0x5ZMdNflWC+gmR/HjdwrbT0d93pIIzQ?=
 =?us-ascii?Q?I0dqisgfaFpalGkQmZ9K+Hx2Q2478PjxeTB4WpCZHfs7xxEAjXHrjPm4by6o?=
 =?us-ascii?Q?bzlHNUrcDA/dE1gwL8RcFBXywmvZ0wbWOv31c+WVISj7zc5zpbJzMUqEp8rc?=
 =?us-ascii?Q?4b2EKEWzC07CK8Do+8U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cfc18f-9ef0-498c-4e30-08dd769aec8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 12:43:12.1857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwtPGPYJhpwF5Gwb6eg/hUdw7Cw1WQh1LQIwHNUeoJEOUCztkc1BiOexzsad1rMB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/LPWSv00c+KTRyeuoiyQehcKLmOJ0GCaBIU5o1VVGc=;
 b=H6+yjRsq1EYzE/lWwmoPnXE2bt5BjI5JNq6fwgKX1Tcg3C754VjxRcj98ygXb9FA0vGlrVgR7l/JQIpTGZ0ola7s/utVIyJ2E/vI6d6gGqCkqyTfnYjcxPg+ARgz9Fby9KPhwduHUiDyilJjIHY/Gv9ZSuma+3bVueyotW8HVxE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=H6+yjRsq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/3] boot/xilinx-prebuilt: add segmented
 config support
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

Hello Luca,

> AMD has created a new segmented configuration for Versal products.  It splits
> the Vivado hardware design into two PDI files, one containing the minimal
> required configuration for the DDR and booting the processors, and a second PDI
> file which contains the rest of the FPGA design and can be loaded at run-time
> via U-boot or Linux.
>
> The file names generated when using the Vivado Segmented Configuration are as
> follows:
>
> <design>_boot.pdi - Minimal DDR and PS config for booting
> <design>_pld.pdi - Remainder of FPGA design to be loaded at run-time
>
> Since two PDI files will be included in the XSA file when using Segmented
> Configuration, the xilinx-prebuilt package needs to be updated to support
> this feature.
>
> For Buildroot purposes, the <design>_boot.pdi is the file that needs to be
> included in the boot.bin for booting the processors, so this patch checks
> for a file named *boot*.pdi which will indicate that Segmented Configuration
> is being used and will make sure to use the <design>_boot.pdi file and not
> the <design>_pld.pdi file when generating the boot.bin image.
>
> If no pdi files contain the word "boot" in the filename, it can be assumed
> that Segmented Configuration is not being used, so the single file *.pdi
> method is the appropriate one for this case, and this patch is thus
> backwards compatible with prior designs not using Segmented Configuration.
>
> Also, Segmented Configuration is going to become the default mode for Versal
> products, so the xilinx-prebuilt github location will also soon have two PDI
> files for each board.  For this reason, this patch is also handling Segmented
> Configuration for files downloaded from the xilinx-prebuilt repo.
>
> For further information about the AMD Segmented Configuration, please see the
> github tutorial below.
>
> https://github.com/Xilinx/Vivado-Design-Tutorials/tree/2024.2/Versal/Boot_and_Config/Segmented_Configuration
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Thank you for the very good explanation, it's very helpful!

And thank you (as always) for reviewing this patch set!

> ---
> V1->V2:
> - $(@D) is not available in time for wildcard evaluation outside of shell
>   script, so moved the wildcard functions into the install scripts
> ---
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index d0817d3cc7..448c71a3fb 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -28,9 +28,6 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
>  XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
>
>  ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
> -# We need the *.pdi glob, because the file has different names for the
> -# different boards, but there is only one, and it has to be named
> -# vpl_gen_fixed.pdi when installed.
>  ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
>  XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
>  # Unlike the psmfw.elf file for Xilinx development boards,
> @@ -39,11 +36,33 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
>  # so to support current and future AMD Vivado versions, the filename
>  # psm*fw.elf is used.
>  XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
> -XILINX_PREBUILT_PDI = $(@D)/*.pdi
> +# We need the *.pdi glob, because the file has different names for the
> +# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
> +# If Segmented Configuration is used, there will be two pdi files and we need
> +# the file that has "boot" in the filename.
> +define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
> +     $(if $(wildcard $(@D)/*boot*.pdi),

> According to your commit message, a more specific wildcard can be used:
> "$(@D)/*_boot.pdi".

Yes, you are correct.  It is probably best to be as specific as possible.

It will help with corner cases when users have the word "boot" in their Vivado
project design name.  With my current solution, if someone had the word "boot"
in their Vivado design name while using Segmented Configuration, both pdi
files would have the "*boot*.pdi" wild card, so the install command would
fail when trying to copy two files into a single file.

Your solution protects for this, leaving the only corner case being a non
Segmented Configuration case with "_boot" as the end of the Vivado project
design name.  This should not be an issue because there would only be one
pdi file in this case, and it would be the one we want to include in the
boot.bin.

> +             $(INSTALL) -D -m 0755 $(@D)/*boot*.pdi \
> +                     $(BINARIES_DIR)/vpl_gen_fixed.pdi,
> +             $(INSTALL) -D -m 0755 $(@D)/*.pdi \
> +                     $(BINARIES_DIR)/vpl_gen_fixed.pdi
> +     )

> It's very unfortunate that you are adding all this code, and in two
> places (here and below). The code in v1 was looking a lot nicer, but
> I'm not sure there is a way to make it work. If there is none, I think
> you can at least improve by using the $(if) only for the filename, not
> the whole command, as in this example (untested):

Yes, I was getting a false success with v1, but I caught the issue with the
$(@D) variable after doing more testing.  I agree having multiple install
shells is definitely not ideal, but I haven't thought of a better way yet.

> define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
>       $(INSTALL) -D -m 0755 \
>               $(if $(wildcard $(@D)/*_boot.pdi), $(@D)/*_boot.pdi, $(@D)/*.pdi) \
>               $(BINARIES_DIR)/vpl_gen_fixed.pdi
> #endef

This is very good!  I will definitely adopt it.

> Also, do you need 0755 permissions for this file? Is that an
> executable? If it isn't, that should be fixed as a preliminary patch.

Good catch.  PDI files are indeed not ARM executable files.  This has been
an issue for a while as the current solution on master uses 0755 for the pdi.

I will make sure to fix it with v3.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
