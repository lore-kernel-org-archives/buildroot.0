Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F74C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C9F660B9B;
	Wed, 18 Jun 2025 21:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRVXCULbl1Bc; Wed, 18 Jun 2025 21:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4299D60B95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4299D60B95;
	Wed, 18 Jun 2025 21:46:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB567151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10FD60B92
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmWkB3Gurdi1 for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 21:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D957060B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D957060B91
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D957060B91
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=np5jraRJTesQLQMvTF1WZA6Fb7bqYAzs2NxIxmkhN2fq+4HR+0QEAnto58zVVg7Uox92Ax6jonclmSgmaMlMloGjOyrEIc9NfyO9iJ9dO71LQGPQW/yx6HZ1cD3WtMokWORDFur1Si+i3l7A7n7z4zowY8Iq/8ix53rdOwLJPqn/KH/7Py7lVNkUes4TbYuWJ3lhBZPiQBOb/ebRcK/e/Wd7N4EISUmNwHI2cLoBP6Zz5vRfrvb5pMoH+4I3H1c+1G6FsQYBciDoaiVp/Dl+pqonTFu9BkiFucIMt23Kne+3YCYCt+ZdCxkpkDlfETKYiigudqhtcfdQKDRYncL35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNCCwcfxTKxemCOA5ZTy1RhXL3AK4Z6JnQCQh1L9Z14=;
 b=qbksiW95sAfxPQ6QE84Bl52sAOluMDTb9pTYFyUVHPgPY+KsGD3a/GylSCdV5VeBriTL+/Lvci6sJo2TOHoFAxJPcRKNRKNr0qFl33Ep+OPA4zNGzxUTRo0VwcbIqvpmBSYBCcM04SWftR9iPVPdS+Ty91xXbE2x3yB4r6c6NVZ87uRQRtL4hNuXLd2NtsfBL+rFHNZpLkJhJeMjPXv7drKHHvEG0ObRIdyIKappHsugujHelXob+FVnaoMqeOV/bI4z131Tl7AI9AlzrF0nIL/1r18uZ1eYwach9qel9ZpaAssenbMWYwLT6sVOfn0Ac0+tou820DU2S1QsDrhezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 21:46:32 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:46:32 +0000
To: "arnout@rnout.be" <arnout@rnout.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: toolchain-bare-metal-buildroot
Thread-Index: AduJFiy8oFc3ROBmRFmVSI97y0+mlQEPp5AAFNFQneA=
Date: Wed, 18 Jun 2025 21:46:32 +0000
Message-ID: <SA1PR12MB56156107064BD90BC1C15B89F072A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
In-Reply-To: <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-18T21:43:39.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SN7PR12MB6982:EE_
x-ms-office365-filtering-correlation-id: a2145ced-ba5a-4d02-23df-08ddaeb19724
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TzA3Q2J1dnZjSFR2Z0h5eTlqZ0hSR1lyWHF0cXNSU2dwQWY2R0FDdjFvSzkz?=
 =?utf-8?B?RHR1QS9vSHJMem0wQlJSeWI0dHdPak9rR2plV1p0SEtaRkZZcTdad2YyaThU?=
 =?utf-8?B?SnBGVTkrYW1aYzR6UXZKdlNuVFFIVExjTXZZZG9RZzRvWk53b09ScVdFVDUz?=
 =?utf-8?B?M0ZMQW1UaFFkSVJ2Ry9sd2tQdm0ydVE2Yy9rWGpWMzJTaWtsU0s3QVlnUzZz?=
 =?utf-8?B?N2s1bEtNdU5Nc09ibXR2V01LWlg0ai9EMEJodjhXV21aOFYrUUxXTjdIaE9B?=
 =?utf-8?B?cVVnR2MzWFJ4NDJkd0wwemxIRGg0L3htS3J0RzhSNVhLVUxNZDVtNVN0a3VI?=
 =?utf-8?B?TFVUK2RYN2o4REo0dzh6M2ZNNVJMWlZxOHgxQUFBTGhGNUhEcmx2ZVVUbTkw?=
 =?utf-8?B?Mkl4YlFoZEU4SEFYTFVMZVdLT1dldDNCL0ZteHpUajNYMDhDaHlwVXVldnVM?=
 =?utf-8?B?ZWw1UEs3ME9pNlU2c3Z0ZnNvNnNxOXlmS2oxbFdtc1k5aFFKTnRRWlI5UTVy?=
 =?utf-8?B?OFJNKzRud29Vak1DZWh1c0Z5NGNlUzFZaFJYSk1VaDg0RjduR0Q2VXMwVW9V?=
 =?utf-8?B?UHk5YnNPRmdOczFjUnhBUU5uZ0l4d2Q5ak9reW1wY1pMcEhOZ2g4ZU1NSVJl?=
 =?utf-8?B?cVRSQlA5c0VrY2NFRWNnK3A3dlJwZFd1ZmNJNTVndjdIWXNUcjFhZC9zT09D?=
 =?utf-8?B?SERaR29Uc2xzcTJvWnZ3ak81dnd0N3NaSWtXbHJJNC9YcEw3ajJvK1YwcHFp?=
 =?utf-8?B?UmlnVldDT3l6WllETlM2SXV2bzNpMGI2aDk3NVQ0MlBTTmlybWp6UHFzT3B1?=
 =?utf-8?B?TTAzSElZRGw4cllVa3V0WityZWhscVUwZmRpVlZ2UnRqUld0VG5Qb2tnNC9T?=
 =?utf-8?B?R2xZNTEvdWxwSDZZWXR2YUVVbUtpS2QzS3hCZHFsZnAyZHRpaWlrTXUrWmZ4?=
 =?utf-8?B?dUovQkt2emZienQxNHUyVUl1Vm5NK3JIeE5EYk5aZ2ZkbzYxSEJEM2NNd1E3?=
 =?utf-8?B?NDJKd0ticzN4OFRnUEFqUmVjaVhpTnBRWUFOVm5Lam4rMmhHQzc4RGZCVVRQ?=
 =?utf-8?B?dWg1a2dvaUtrbXlQY1FCSkU0aTNadU1uZmN1bmFzb3ExWTNiOHV3Rk9zZ0xY?=
 =?utf-8?B?NVFvR0NFUjNNaGgwa3JBTlM0bnNQYmY5VkFOSVdOMUQ5TXczTVVaMGVFdTlF?=
 =?utf-8?B?YWlUaEg4QTFmYjFYb085U3JnY2lhM2p2eXUyamZ6V0ZxdzkxZXJlbFk4dGxB?=
 =?utf-8?B?ejFDa0t3NGZoS0xZL2tqSTNCU0thSXZlZHczc0ZpZCtNaVZMSnFNUExBUU91?=
 =?utf-8?B?Ulg1RjAvNlJBWlJvSitjYkI1ZGJxelBJdFBjYXd4NVZxZW0xOThPeGE4RzFJ?=
 =?utf-8?B?aHNvZC9QVlU3L210ZWZTbzYrUGhZZWI3SDR6ajlNaVROYmxvTXdLZGpWazhp?=
 =?utf-8?B?Z2h6bm5DRXU3QURzblVIbzFtWERsY1Roais3djg5M0FBOXhKV0U0MldnUVVj?=
 =?utf-8?B?OUR5ZGFTM0dhM1F3YTcwMkp1eG9QbXg1UlltbWdxb3NBUE5HTm9YL3FjUE93?=
 =?utf-8?B?YVJMbHJpZHZEcDdaQ1J2Qkg0OGNFWFBGTTRyZnlMUFNLUk9XYjdCRmFMa3N2?=
 =?utf-8?B?NzV3SkRtUXFWS0tQbDdkRlBmQWpSbDUyNmhXSmhQUGRSR01kcG5mN0dwbUZy?=
 =?utf-8?B?VEl3RDFYb29HQ3NmMTJJQVJzZnlGL2MrN2QvTnpsVmpsbFVjWitrc3p2c21s?=
 =?utf-8?B?dk9EUUcrTDNPeUp2UjZER0x2NkRHVGc1Z1RHTVh5SHVhRW84OXVDZnh3SWV1?=
 =?utf-8?B?aFRlbitwTW4zbC9uczJZcTNURlZLR3N4YW9tQU9PQTJHRDMxalU3a09ibTlC?=
 =?utf-8?B?M3JqRHdNWWoyZ2Vmb3BheFlyaWJ1NWRpMC9JM0dUSk1Lb25xYXFSY1RVM3N2?=
 =?utf-8?B?TjlpN1NxVEtiNzl5ZWQwWmxmSlN4WjhHNnBQeHpJNHhaaDFZa05WZU02ZUE3?=
 =?utf-8?Q?FSgkx2d+4JbsL5M8ieD7+ZiMWuXQoE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDBqQjRpek9ub2dHM1oyQW15UytXa1NuemVZMVIyRGNXRXRDdTBNb3RlTkhl?=
 =?utf-8?B?L0wrT214NVpjK1BpUTB1aHpmYUNQTDJMdkt3MzFKdkkya2ZteW5XSFJvdU9p?=
 =?utf-8?B?Zms2QlE4eHBERy9hL3Jadm8rdHhoY2xWcWJzVWZoRjhrOVRiNitlZzUwdEpT?=
 =?utf-8?B?cjZTVGRRODRWd21va0ZoT0hZbGNSblNSTFhlWFNqU2poekwyc3cvSGZ3MFdY?=
 =?utf-8?B?bkE5amQrbkIwZTU5anJtZmc0Zm4zVkRYdjQ3VldFQVdQVGViYU1CejVsbWI4?=
 =?utf-8?B?YVk5SFBtaDhiemdFditDV1k5VXZ3V0lLZzFZZGpHT0xHNVdqdlEyOEYwNUhn?=
 =?utf-8?B?MFZhMi9lZFYxUnllWTR2eHBkbUpFWXVWT2UvMW1MZ3RhakhKU0ZBOU1ETnVn?=
 =?utf-8?B?c2VhYkZJN3RSQTRweFVHNUVzZUVtQzIrWmJtQzhoeWZpQlo5M0R1d1ZpaEx1?=
 =?utf-8?B?aTdWZkU4Rjh4VytWZWdxRWtzRkp3c2VVeUt4MGEzUExQcDFlZ0NrNzFXY0p1?=
 =?utf-8?B?eVB4VGZSTHRwTGVtekZHVUswUUZrM0tXYlQ3eGozUzgwc3dlT1RtZnRvVm4r?=
 =?utf-8?B?MEtJcjlZUW1MNG8vRWYxNXZpc2lFMzRTL2VYeC9xSjhQL0RpeStLL05UN0tn?=
 =?utf-8?B?MHpOSDgwNEZmRzgyOW0yL25TczRBSVBaQTMvU09URlpkcVQzODlDRFpGZTE1?=
 =?utf-8?B?bDBiRjQ5YUhpOEF0S2VzUlFUaTVPK1d3VW5ZSzFvQklpN0xySDJaUitaaHhs?=
 =?utf-8?B?UURyOE9qWXduTEhxQUhONU9mejNFbmZNTW5LaUVWb01wUmdFdFFycmZXSEtG?=
 =?utf-8?B?cFI1SjNIQVZXWjRSV2xTVFZ6SzlZeExQcTlpVXdHSkU0ZzZxeVp0Zi9hb3lU?=
 =?utf-8?B?bjUyNEhTUVNTSFFhcmRLTnpjOWRoWk9Qc2dnWGNWQ2dEVXp6cUtEdWJ1cnk5?=
 =?utf-8?B?WEowaUVNUys0SW84cXY4ZmtiWGN5b3N5WTVGbzB0REM2TFF6MWhLazBHWndV?=
 =?utf-8?B?ZkpJRTljcVk3cENqMEkvZWJySW1mbTBmb2Q2QmU1M2FPWWIveUtnb1hGWlF2?=
 =?utf-8?B?dzNrNlJnNUw2RVhrWEFFbWY5aVZWV2dPeS9Sb0xGdVVTL0M5MmdnTzlSaWFx?=
 =?utf-8?B?MUFVbG1UR2ZSbndlbEJhQ2pMOE1qZTV4UW1rSGJObUg3U2M3bjd4eHZDU2ds?=
 =?utf-8?B?L0F3TUp2dituWGcwZUV1Zy92R0xZS09mVjJscjdXeWYyTlUyUDB1U0E2QnVw?=
 =?utf-8?B?a1VaaWxqalh3V3lBYmxBNndXMnlRZFpoUkgxaFV1TXcrUUN2L0pUQ0Z3OTlv?=
 =?utf-8?B?bFBNMlFqc1VqZTJrSGYrNFQ2bFpxWDIwcHVUKzNHVnVYTjhsVVVFWmxSOW5P?=
 =?utf-8?B?d1RzWVlOZHpKMllIRzIxOWZPS2JmWGx1SHVjSUtMc0w2QXBnL1I0TzRHVUN1?=
 =?utf-8?B?bGZZbmFHWVZDTVp0SWhBaDUzYzllZHUrcGZsTUpGNTl4T2s4aFYxRDBwVlpa?=
 =?utf-8?B?UGdPbG5jTTVjSThTS1kreGFMcE1zUytScTNlZ0JLb1JmQTV5Q2NDL3FyWGZX?=
 =?utf-8?B?OWx0dXRIM08wdlNheTVPMktiaUhaZDhtNVIxcHZYbkRjalpMNWhyRThxTFRn?=
 =?utf-8?B?QjVwVWFtZEFLMFdPSlBmRG9jSmtza0NmQWU5YUVUYm1Xa3ZDblRaS1VETU1t?=
 =?utf-8?B?ang3ZkoxRUMxM0dCbnVpMFBMS0FJbnJxSjFwQjdDdlZzWnBXeEhNZWdpdmNk?=
 =?utf-8?B?aU9CY2tCcTN1a0g1WFpwZjNVZDhuOHJLSFIweXJEcUF4Ynl3R2pOYi9BaWVm?=
 =?utf-8?B?RndRM1pyVDgreG5wcU9tQkJhVXRZbzlOMjZLSUJIcFBHMExNbkpiUGljakJq?=
 =?utf-8?B?MjRUMXB1OFJIN25BUSs1QmMzQXlQWlpZSHJHUDVsNmJKOVdtVFFsdTc1OUF0?=
 =?utf-8?B?L1hlMzJZQUdVNHpsWkp0ZGtKd0RBMFNaRWRKQmMzaWpwbWdMcTMxenFWb28x?=
 =?utf-8?B?WEZCVUVMRmJoVG5jaEVGcEg5T2pRYVpvRnl0ZDZpSUJldGRTYnl6Y3RyWUlu?=
 =?utf-8?B?SVQwOG4wK3plQ2FXM1ZZZjUxeFBmQkVJNHFza2p1WU9xY3czSzg5ZXFvRTRo?=
 =?utf-8?Q?UCJo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2145ced-ba5a-4d02-23df-08ddaeb19724
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 21:46:32.4415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfNST8Wf0hZo6GiEhG+cHsBEylIcSl1jS8qmpcUIKof50hNscPNsMYFjsoJd8/tN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNCCwcfxTKxemCOA5ZTy1RhXL3AK4Z6JnQCQh1L9Z14=;
 b=dzVrZzDbc4A8zqsYmFFv/f7EcFIHod16f/fDUcxnf7QCW1JANM5rkHeJEKByDi8r3ohS5eeOYN5FYhaEYhay4O4NZ10m92OLFlnYbUOgHTRxWIcxyXWFRbiCa2HN1jksTNw1ChlVhNlTso4XYTBylYbT67t4gdiT1xRkXZaUKUM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dzVrZzDb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] toolchain-bare-metal-buildroot
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

Hi Arnout, Thomas,

I am re-sending this email with Arnout's new email address.

> Hi Thomas, Arnout,
>
> I am continuing the work on the toolchain-bare-metal-buildroot, and I have
> encountered a snag where I am hoping you can come up with a brilliant idea
> to resolve.
>
> In addition to needing multiple bare-metal toolchains, the versal gen2 products
> need the riscv32 toolchain to have "--with-arch=rv32imc" included in the
> configuration.  Just using the riscv32 tuple is not sufficient.
>
> Since the architecture tuples come as a list, do you have any ideas for
> how we can handle architectures that have many options beyond just the
> tuple, such as ARM and RISC-V?  Any additional variables we make will
> also need to be a list.

>  When all else fails, we can resort to hacks :-)

>  The target tuple components can only contain letters, digits and underscore,
> en they are separated with dashes. That leaves us with a lot of characters that
> we can use to add something extra that can be stripped off and treated
> differently. For example, OpenEmbedded uses ; in URLs to give additional
> information (like the download method or the hash). And URLs themselves have ?
> and & to add GET data. So we can use one of these to have additional data, like

> riscv32-buildroot-none-elf?with-arch=rv32imc&enable-initfini-array

> (not convincend if ?& or ; or something else is better; also I'm not sure if
> it's better to include the -- or not).

>  It is obviously super ugly, but I can't think of anything better.

I wanted to come back to this topic, as I identified a simple solution to the
riscv32 bare-metal toolchain problem which only comes with the negative of
significantly longer build time.

If we --enable-multilib, then gcc and newlib will build all the riscv32
library variants.  While this takes longer to build, it would be much
simpler to implement as it is an easy switch from --disable-multilib to
--enable-multilib.  I have confirmed that I am able to build the
versal_2ve_2vm asufw application by enabling multilib and changing nothing
else.

Since the AMD toolchain is already a multilib toolchain (since we support
soft cores which could be virtually any riscv variant), the asufw already
has a Makefile designed for a multilib toolchain as you can see below.

https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/asufw/src/Makefile

What do you think of adding a config option to the bare-metal toolchain that
enables multilib?  It would be simple for me to implement this, and then users
could choose whether enabling multilib is worth paying for with extended build
time.

Similar to BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH, my idea is the option
would be BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB which would be a boolean
used by binutils-bare-metal, gcc-bare-metal and newlib-bare-metal.

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
