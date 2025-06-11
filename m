Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B6FC677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 10:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8730D60657;
	Wed, 11 Jun 2025 10:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZttHUQlwi8LU; Wed, 11 Jun 2025 10:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9DC60890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9DC60890;
	Wed, 11 Jun 2025 10:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 609BA183
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4681060888
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGBNPvpyrS0Z for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 10:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::626;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC89360657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC89360657
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC89360657
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPR0dQ2/NCNOuCmudyS++BQ2Hsjk6rtwo+HNLW6v269XrOX/pgGiBUjmpH1vgXvOxs9JVy16rKoLohMOnzmhJohZ476nsV0mM9yrU6bsXRFLWnUhSE1La0f4EDHKli7b5K1KxgSIKwItLKrTGa2vmAfJS1KqU2ri4HHQyOvdF229sdsc1etFpzRIZmZjVmhN+hEDJXqrm7cly/XyXy5hxPI0JVM+uX9d+o3c2k05HsvSUspbm5r4CZks4JlIUA2+vkzot72En+zZAYyr1Won36QrC++m/1hErJ4YqDkhbrgGfUwDyORt4xLVvd+pxV/Z7ZNNv4qbimlOvYM+twYemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLZoc4/kDhmyAHeHC3pFXHgxSBdKZEDLpw6L/hrg2+M=;
 b=khpAn/vVJm7gEkHTICSZ00/KpEyIZUkZF+3+7WCKJ+DEk+leni1SONQXXu86txbf/+1+ArW9iS7IKZcdhGBdDU4ulwT9toVKt5YgdBvknEhBzB3OrMCyxCoCF964aEBRgNvZbsJa1+GCj95Uq2Jd/Yj1Ze0mt5nP4fbG0aPFJoyV5VAT7W8rQI1w0CJbYMDlAxv/Iy1e5/l31WV6wYj3hZ0N0cUwoNHB1ub4TzEHDVoBLhsErj/iB5zCS95KL347j7NafN8UV88aBwxzptB03bc1bDfUDcT9yOEYpHd8YawOizJxOtfVevGbCnL7cPdoCANMh0p8xIgjELzU86p2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Wed, 11 Jun
 2025 10:16:04 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:16:03 +0000
To: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] configs/qemu_microblaze*: move to
 external Bootlin stable toolchain
Thread-Index: AQHb2qXTtYhEA13dM0OZ2Zgm8N53hLP9uiQAgAAEDEA=
Date: Wed, 11 Jun 2025 10:16:03 +0000
Message-ID: <SA1PR12MB56153E72BCBBDE5006942BD0F075A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250611075235.1039898-1-neal.frager@amd.com>
 <df4877fc-af21-45ae-b265-864207a4c516@smile.fr>
In-Reply-To: <df4877fc-af21-45ae-b265-864207a4c516@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2434ea05-ac47-4986-b9e4-e3b5bf820999;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-11T10:15:23Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH7PR12MB6611:EE_
x-ms-office365-filtering-correlation-id: f3aa5cbb-1f48-4f82-ef06-08dda8d0f89f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?VHVCejcwRGhxdnUydE1BNTEwdlRIMkNBOENFUXRMRWEwRXZmaHRWSHNQRlVS?=
 =?utf-8?B?NGRYd1cyekJXZEhlVm05eEpGZWxSZ0FrQWlZR0dKQTVQazJKZ2ljT2NNcGFK?=
 =?utf-8?B?ZU5PZ2ZxZFpKUkJqNDRJYWc4b0VpQUUrNkEwNVpacWtrbkROLzBUTXExeFQv?=
 =?utf-8?B?UlFUNFFpdFM3ZzBhcGlrMTJiMXpMS09xQnFwS3R4NkkwNjg1SlNNdUdVeUtH?=
 =?utf-8?B?LzFBSU9PT0JqMUNVaVRyb3JjbVdpM0o0a1UxMW9uZWZaWEJldUxaVUNBSEVQ?=
 =?utf-8?B?Z2hFQnBldVl6dndhaFBEOFhGR005cnRkR1gzL2tla2ZUWTFTNmtFWGRhQUVP?=
 =?utf-8?B?aGZDK1Y1bDk4aElOTjJaZXJ1dlpYUC9TK2ZxQlBRb2tCK1pCR200elZYWCt1?=
 =?utf-8?B?QWZxOE1VYlJmQ2RQU0FRaWVDYVZFMUNuY2FhdENJVjF0MWlzYlJ5SERGeGMz?=
 =?utf-8?B?VGtSWG5yNjhNc3VLRWVSbWpYNTZ0UGE1NCtJVzBjWExVYzdvU3k3SHE5L0NO?=
 =?utf-8?B?VmgwMUhyd21ibk5VR2tiTDdKQ09Wb3NvYjJaRWw5c1NDMjFxZXNDelpFTHdo?=
 =?utf-8?B?d1dOdlMrMWNtSnF3MnBMaEg1cWFPWnJvQkJOMGVhencrVEEzUnNpYW5QRS9q?=
 =?utf-8?B?dXVOY3N1c0I2TjlBUDJCWW5TdnhIKzNWd3BjYnc5RnorWDV0RHU3aWxRSzI0?=
 =?utf-8?B?UVI5Z0hNTEY1cWZqeFZFS1JaeDlGSzNZZHNqQldiakJBZUNtcndzTEV0K0ll?=
 =?utf-8?B?b3d3THlKcWF4ZG5haWpwNkxpak9IMGEzTEFaNGVrUk1SQVNjZ3pCK0NTbDNP?=
 =?utf-8?B?Q2ZETkREQm5TYVNDdHNkanhydE5qOGpmemRWSzB1aUl5STFYRGFzczkvMFpx?=
 =?utf-8?B?d2ZjTWdtTGhPL3k3aTltbHpSR0Y3MGlWU3ZONXF3cGZKaURXZnRPa1RnMmww?=
 =?utf-8?B?c1ovYjVyVDBoMmdrNndJY0p2TjlHWWdCT3VSNCtzdGkyRGlacW5UbUg0UzBZ?=
 =?utf-8?B?MmVESlBUN1cxQVhQeW0xK3RBcmh1eWdMSmVPc0tlSkRFdzFWSmw1K1BJOHl6?=
 =?utf-8?B?VWF5bnhuMTRUNGxvZllXR0RrTTdmeUVPa1JFbFdpd2xENHdqQWNFeVhIa0NR?=
 =?utf-8?B?S2RZZ0VtWGdJbnNlQ0hWb2Q5RTNVN0VSVzNCZHZ4VHVWMGJuSXU0Z1UvRFB4?=
 =?utf-8?B?WG5kTWV0eHYrU2U2R2F6UzhWL29mb21XK05aSzZYTmoyUWlzVmZhWHJXdVli?=
 =?utf-8?B?ajlwOFBobVZwaEdRc0x2cHpZSmFPU1REeWNQNkYvQWJtZTF0Z1UvamlEM214?=
 =?utf-8?B?dGxSMXR5cndHK08wbnZ4V3k5dWNZZUQ5VFFHYjZJMkNXSDRvTGYrU3AzZHMv?=
 =?utf-8?B?MEozNUhMME5USHRqQkZpUWJIbG5WYXkxZzBUTHZzQXloQk00NDBMc0hIQSsy?=
 =?utf-8?B?M0NiNmJZZVh3UkNrZTgrV3dqclZadm85ZEE1SGhzOFI1ZDhtL2JQMUJnNlRs?=
 =?utf-8?B?QXNrV3lnOUVKVnFsMnY1WlJFeEEza0NkZVZLV1RZSHdsR1FzTWJRYmNkRVJL?=
 =?utf-8?B?WEcvcEUwMThnYzVlcUZGV1VYWnUwL2JNL2o4b0RDL0dDcHFLQ2hnZm0vUmtu?=
 =?utf-8?B?em1Nd0ZhTGE3MjB1eXFGdnpvMDJnc3Z5SHpZTldnUTdZWURRZFFzY3hkMXlx?=
 =?utf-8?B?Q0VVb0tTSXQ2TmxUK3gwVnJnUm9hUHc0MzlpNFRmNjdzdDFRM01Fa0cvYWRt?=
 =?utf-8?B?RDdOVjRXSk5BNGtLSUlXWEZwZW1wOG04REkwaWtXYVNwaDZoUzMyczE1bksv?=
 =?utf-8?B?RTR0VnVmSlVPOGpHb2VnbTl3a2Y4YkY5aW5GeXFsMWtGbmdnMGwrUVliZHg4?=
 =?utf-8?B?d0dyU3huSXJ3YXU1WmNXTzZ3VTZrUU9oSG9lV0ppZjZlbi9PMWw3MHY4bSts?=
 =?utf-8?B?bkI2b0dpNmZsKzA2YzVIbnJqRks1aFhINmFDZTU4bWVzbU5nZmxweEZReVJz?=
 =?utf-8?B?aXhGMU1DbnV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SC9CZHhET2VRc0g3U1VRdG5ESHNMVWJHNFQwOFdvTXR4NmRzS0lQdS9iNjJH?=
 =?utf-8?B?cldwRGhoQVR5Q05WbFBtUkt0bE9EcTRZSUNJMTBDYzJuQzhDSmYwc3Rsd3lv?=
 =?utf-8?B?L1JselVGaGYyZXU1VW82NU45RS9SejJsSzJaVi8xNEZYUXZpbWhLbGJhUlVn?=
 =?utf-8?B?eTJaVloreWNiRUd0Q01mclRnZ25kcVQrNytlMndFRTI1M1NWM2NiM1BMcE5G?=
 =?utf-8?B?SFV6ZkNaNkN1RTRGRGNxVzh1akFDdEZ3OHFaQVFIWWdIMExaRmJJYjk0M2R6?=
 =?utf-8?B?RmZiTzl6UVlLMDlNWHl4NFgwbzZvNitNQjAxblRGMDNaVldNckNkQUZwOFh1?=
 =?utf-8?B?SFIvVnVmSVRaaHBMQzJ5alJSZi9FSjdCQTVuWFA4WVlLakVwcFZCaFU3cFNE?=
 =?utf-8?B?bmxzb3NZRkpza0Yzdm84djRoNFVoSHNZMFF1Zk5Mak1rSGpyRXF4bW81N2cx?=
 =?utf-8?B?L0tNajBuSzVBNTFwbVFCU1Q1S1hxYm02cVpkQmhjb3dmN2FGNDQ4b3p0bGtz?=
 =?utf-8?B?K3NKam9oeG9pM3VZdVlwTlQ4eEpDZHZUZVppaWlrcHhxNWwzbzBqR3Q4QTl5?=
 =?utf-8?B?NjBRak93OU5LZXlNbzRoTkdaZ2Z0aHJESHgvdktZbU9TSkRJWGNCSFY3Nzlq?=
 =?utf-8?B?MVdtU3lWUTEvV2QxVytua3duNFVYcUk5WVlTZDlEWjY2TEY5WGZJMnkxS29I?=
 =?utf-8?B?d0VsRlY1QjJNa2k0S2hONEZnYzhtemlITDBVQWl6MmJxOFdUd0plcXJxNU0y?=
 =?utf-8?B?c2I5UlFKb0NJeGhPS1A2SDJvRUZhVmdrbzgxaG83ZnN0a3hlTG9GSzY2YlRm?=
 =?utf-8?B?ZzdRZCtRemxJOXRDN014SjNjekpvV3Y5R0hZSnZRS0NpMWZZWkNyaExqV2pl?=
 =?utf-8?B?ekY5ZitwMkpZN25BUUgrQ3BReGhiTnBHakFudCt6VWtVTXdUYUw5VDdXcG5S?=
 =?utf-8?B?Ky96NGtWb0JRVHNEVVU4YkcydzBEWlBXck14RUthN2FmTW54aVdNdXQ0dTVa?=
 =?utf-8?B?YU50em9xSFoyU29PM1JHNzJ5ZHA2WVBnMWczdXVNdHlmNXpCT1J6Nk1veHlK?=
 =?utf-8?B?ZnVnY0JTS2txRkVXK2pOTWwvVVFTQkwwSUh4RmJHc2haRWtsR29yRzZYdGk2?=
 =?utf-8?B?Z3FRekFNaHluNDlUamw3R0s3cmhTVTFyQlQ4enVPVncwNm1FNG1TcVN3bDFq?=
 =?utf-8?B?bi9DTTFBblljVUVXbWJsWlJiVlh2cGhHNll3Y083RjI1STlnQ3pnR1d4MXFl?=
 =?utf-8?B?dnVvYTNtdTR6bkxLeVlLbkcrT05HdkZESTBpK1NLZlhHSmJaZkhzelhZYXUr?=
 =?utf-8?B?clN0RHdJb3RkU0tkTkc2RWFxMys4dDd5Y3VZOEVWNk04SFQyWmFwSUJodmQw?=
 =?utf-8?B?SlNWUlhaNEdWOGJPRTcwNEtrck90cnpJWmJPYUtOR05DbWR1bHRNL2xMaEM5?=
 =?utf-8?B?dmN0a1lDcVN6NmI0NWc0OVVaN21RN3ZraFY1UnYwa2c2ZExsSWRXblU5MEwv?=
 =?utf-8?B?aGJJMzNlSmJ1RGF3Q3RjSGllQ0RtL1oyWnNYWm1rMGVpeGNRVnNSOUpzS0Rz?=
 =?utf-8?B?M3FZU3NyT3JoMG1HQ2pYMGV6VDIvRlNSRnJtd2JHRXFrRjZud1FIaEp5cWRR?=
 =?utf-8?B?VHNMTGNGMS9RZzIyYndBUUxHNHpXc0svUytWUjNRTzE2L2d3enRPY25GMHRG?=
 =?utf-8?B?Ti9YcExkMThvQlVvNWxmUkNOa2VOeElQN09qWGJ5cFF4R1I2ekRYUHV1SStv?=
 =?utf-8?B?UWxDS0FIdmRZQ2pBU1R0ZkgvVDdIL2NuYS9nL1kxZzkyaWMwMnhlbjdmM3FY?=
 =?utf-8?B?UHRMQm9vaXpudG9aVVpxeEtEWTI2OEVjVnZUY1pzbU5ROC9ub0swQkV5V2dQ?=
 =?utf-8?B?dWJCamZNdlo5WG5WbXFtTlpaM05Td3E5UUhjUzVxa0xLdmZnK3AvaEZsWVdM?=
 =?utf-8?B?VEhFU1UxdE5iVHhSOWVEbzF2cVhpUTVzaGw2RTFBQWpvUGJvVDVQa3NLM2Zm?=
 =?utf-8?B?OEdndThlWnQ5RlJYYmtEdU5PdEZTYW5iRHV0YWtaM2YxSUpyMGZkVlAwYnJO?=
 =?utf-8?B?ZHEzT21wNUpuNDQxOEgrSk5sMVZSZHdtTGZ6N0p6bE52ZHdBbDI2cUlJcmQy?=
 =?utf-8?Q?/V30=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aa5cbb-1f48-4f82-ef06-08dda8d0f89f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 10:16:03.3762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CtQf9xZCtivMUXW2ghMUdHS70Fdvu7u+NhWncGMVzCDTVWAnVtSXklgIiQdEOYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLZoc4/kDhmyAHeHC3pFXHgxSBdKZEDLpw6L/hrg2+M=;
 b=z2pi3HiggFkGzEQrtXzTIPvc9OU1wXDt7ocgMblBlWiYIOaKzjLGyls0Nv66f7j+UE642Ee8YcobtHdW6Z+pcGfq8MdfymdQUlrhTPG3a99hXMjlsLW8XKs+6twOM4y9ZMKPrMPMIJdecOI5c2qtOUzfx1j6FbLetn4LCT3lQgM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=z2pi3Hig
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/qemu_microblaze*: move to
 external Bootlin stable toolchain
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

Hi Romain,

> This moves the qemu_microblaze defconfigs to the Bootlin glibc stable external
> toolchain as per[1].
>
> [1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

> I'm using Qemu defconfigs to tests any new version of toolchain composants (gcc,
> binutils, glibc), kernel and host-qemu.

> Since Qemu defconfigs are tested once a week on gitlab-ci, it allows to detect
> any regression using the internal toolchain backend (using the default choice).

> Unlike other board defconfig, I think we should keep using internal toolchain
> backend for Qemu defconfigs.

> Thoughts?

This sounds perfectly reasonable to me.  Especially considering our current
issue with gcc 14+ and microblaze.

I will retract this patch.

Best regards,
Neal Frager
AMD


>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/qemu_microblazebe_mmu_defconfig | 2 +-
>  configs/qemu_microblazeel_mmu_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index 9d67d71920..8ad377979d 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -1,5 +1,5 @@
>  BR2_microblazebe=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
> diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
> index 46befedd57..c2bf2201f5 100644
> --- a/configs/qemu_microblazeel_mmu_defconfig
> +++ b/configs/qemu_microblazeel_mmu_defconfig
> @@ -1,5 +1,5 @@
>  BR2_microblazeel=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
