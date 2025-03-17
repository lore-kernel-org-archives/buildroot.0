Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31798C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 19:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27D08201D;
	Mon, 17 Mar 2025 19:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Y0_7HkpvlDH; Mon, 17 Mar 2025 19:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D48BD82018
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D48BD82018;
	Mon, 17 Mar 2025 19:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC3B1D5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D011C6090C
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUc2Zlo2_-60 for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 19:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::61b;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0572600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0572600D4
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::61b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0572600D4
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epti0KjWA1K80RS99XUPQuLIRErhe4b6LpcXM6RayKqGwQPxYWqrgCxkHR9cwhE/7u34zOK895jiatpzME6DM2qlpq4bJcoaWVdVnbqvFTP+UpqX1lrRtiMD4JncMIVmHb6Y/+BFgk0/aW7Hx5IenKQWW7ZLGKK88XgNp+PIfXaMKqXISEn5QlOgEClsG7T6mgTVFayGqLFeKTOFphpnVszgGJaEDT0XWk6cwFuc18H8ZOlyf+50ZEhN++m44bA1SKiGF0kkSzTSIMVCS5e2mdQcOQYgUMW/qh3XOusTYOs6MFsgHg+xx/cDaSA0hzIVf89OEsCA+txlyoeD2TI2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g15OvYAW1ckr2iJDutNztrE28GNrQBY19aFVRWBLPj8=;
 b=xtIAruIXHdZngcG85uL60cBELyzzoEODlxIL8Ug6+ohc1Epk4mYpdOHQCMnfqDNvpwV/UNMtIiQTu6qDvmGWxEFWG6vPWSfKUlQMze5zIFMP4gYfMlxewJxMNcj0Lo7/y5t466w08+zBWaHoGw+Ad5NZ760xx/o8IOkaywlygShq7YgHZLGA09DCCkXzpExcKkqkGMRMN9OGYjTcL1vxwX4pv47Erv3HfiqkKi+aAXf60y055apUZBBHBv49VhoEYUl1S4FPJMLOW3K/EjtkY+IqSMAPlNUhj3KMHlbZFKH+4bRtvBKwCr+6GwvjIBziiqVIKg500a0glqLRWMzMIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:18:41 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 19:18:41 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alistair Francis
 <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Dick Olsson <hi@senzilla.io>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Lee Jones <lee.jones@linaro.org>, Sergey
 Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, Xuanhao
 Shi <X15000177@gmail.com>
Thread-Topic: [PATCH 2/2] boot: move package options to a submenu
Thread-Index: AQHbl2OwydPdO1u3TUCJ1ciXw7DuRLN3s58A
Date: Mon, 17 Mar 2025 19:18:41 +0000
Message-ID: <SA1PR12MB5615A74A7C82F0207343AD63F0DF2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
 <20250317-bootloaders-menuconfig-v1-2-8f893d3bcf5f@bootlin.com>
In-Reply-To: <20250317-bootloaders-menuconfig-v1-2-8f893d3bcf5f@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0fb86bec-ac3c-4545-986d-0ec2b2018511;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-17T19:17:18Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH8PR12MB6772:EE_
x-ms-office365-filtering-correlation-id: 8e662085-a9f4-4f39-b9c0-08dd6588875d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dDJIMER2QnduYmZnMEY4UXdDNkRWN1duRE90UUZrSndIbFU3dnZTRm5Bayt0?=
 =?utf-8?B?cGR1eDRQWWdhb2JaeVhlNVJxNUNKY3gycVZHMHZ2dllZZkNHUk5tNUtERm1W?=
 =?utf-8?B?TXZkbTBWYjlUbVNvSVk0cUdHeXBDTFdSZDNpYUwveWpub2lPS1gzWENMWFR0?=
 =?utf-8?B?anRBcHg3MjVJSGlnaDhSWDZZb0hMek5FNlIyYWlUVUhWZFV1TXJkTERWWnVO?=
 =?utf-8?B?aGxaUVVLS0dxekxDdU9pM2xaSUc1NUxDdktmMVA5ZEhQWEFrMWZBVW9XbG1N?=
 =?utf-8?B?a2poR0t6Wno0Y0xnTzV4eGJCKzhuOGNuRXdQa1VUb2xYdHlSVE9nRUk2R1o2?=
 =?utf-8?B?UWtNVTdoeExPRkxlU1c4YS9JQ2hYM2RYRGNnSGU0VTZudnZ5cThZK1M0clRZ?=
 =?utf-8?B?U1NOMzdvbXVEdHIyYUxyNk1jN2ZTY3FHeTRUc0h1SHNWazU3Mk44Q2Q5ZnVv?=
 =?utf-8?B?WmVIT0p5cHk2Vm53RzRPRFdRa0Q5Yk5Oem15eFhKbG5iL2c4bytZa0JGVktv?=
 =?utf-8?B?Wk9McVg2WENibWxuYXdFaUhyTnhDNUtjc0owczE2Zm95S1NBSTQzTlZXby9y?=
 =?utf-8?B?UXY5dnM0Q2tKcjNyMThZaGN0VjU5SHpNL1hHbWtJY3lUNnpMRXZlbzRqOEpt?=
 =?utf-8?B?L0s5ZWM4Tkl2SjRPaXZUL0hJUGNiQUJyeGJ4VUxIMmVZM01ENUlXRVZWZzhD?=
 =?utf-8?B?VW5KSWZ5SDR5eEVjUDRORE5JTDlJOXFpeHJHRnZmQnNXQVpnR0RDVDhVNHU4?=
 =?utf-8?B?bGlPcmZjUE5GbG1XWmZKQ1lyanlDRWcxdTd5eko0N21GcTUrMWk1aFlRNWdi?=
 =?utf-8?B?dXFieWdUbmZJTUw1ZllxaGJtNG4rUnEyWWdRM055eDZuZ2JlZ1Rsa1lROEtV?=
 =?utf-8?B?RHBPYm9wY0FDUTVrNHZ1aXdOZGlKeWxrNy9xTnphdFpxQWxxVFB6RktZVkgv?=
 =?utf-8?B?NDBLeEU1eWI4M0pOVkplekM1U0xXSDNtSHh6Q29KWU9DREZRdHdrMTBpNEJB?=
 =?utf-8?B?OHoycWM4Q1Q4L2VGUDMwa1kvS0wwWFJPSVJMNlNQRWJJUUdBNVMyd1IwSlA2?=
 =?utf-8?B?b200ZGNwS1FwQjNpYkFwaHdZZDM4ak9LVFArSXhMR3lFV0lJK3ViRklCL2Ru?=
 =?utf-8?B?ZWdVemtZZ0k4OEJwNWowWFVGU0U0S1lwS1RHdHZnekFKSXZ2YXpObG9iaStX?=
 =?utf-8?B?ajVqVHRmNjlKekFPRzYvemJNY1VmREdlQXZmcW40WjhHRWRCdEdWc0V6MEVw?=
 =?utf-8?B?c1V4RTRGS0praUhtUG42aFRKVk9rYkFJdnlVM3ZscXBSS3FYekl1U2ZrRE9S?=
 =?utf-8?B?cDZqOUNUdnhrWkFpQUJIdkE1R3ZnNE9nQ1pzOVVVaW9YcXNhaTZSc0dRQzhh?=
 =?utf-8?B?ZDZ1TllBenZxQndnNWxaamZ0L0RvallqTDJuNk9NZ1JFaldyOXJjYXJFRVZX?=
 =?utf-8?B?T0QzQzM0YXhUd3dzNHppYm93a2RLWjdKcVJKVFQ2TkpyU21kWXVpT0YxNUxC?=
 =?utf-8?B?a25zM2JJQXZqTzF0eklPaEtCMk9wL0ZUNFZWbmd1b0poYUVxQUVOOXpVOWJY?=
 =?utf-8?B?b21ST2lObG96RUdPUmlsM1lBLzBLd0tNVWNXbDRMS0dNUE5GdUtLN0E0NGo2?=
 =?utf-8?B?N2NaTjRzajRFYWRxSXArb0w5V3dibmtCb21QZE80RkhXSW9YR0dNVU1JclJ0?=
 =?utf-8?B?eFNOYkVIb2d3WktWZGd2ZzJjY1JvMldmUC8xcXdwVSt3TkpGamo4czJJTlBz?=
 =?utf-8?B?djJzTytGWnI5cmgxaTE0cG15YURwUU9IMFFkdmpQbG5heFZ2QmcvOTdqWmVK?=
 =?utf-8?B?MUxLd1lIR3g0OW9RMFp6cXpSZjFJZTRaNTFNZ0tNdlhBdTBDM0lCUjVlWENr?=
 =?utf-8?B?NG85WTc0T2xadHBIanRoYjJzcnl0RjVhL1lSWmlOTTZmNDB6cStKYk1PZXpX?=
 =?utf-8?Q?s5UDzGvROStDfDsX/uwbLbVCofdAGXai?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEFXYmpMbEQrSTlaSXhWdDFJckI2SERNMFcyYkZkQ3BGTGwzSnorQmZHL0di?=
 =?utf-8?B?S3FsNUlwVGxqenZGTi9MUlFyS25FVTJoMnIvVmpwZjliMlFKY0R1eGlHQnY0?=
 =?utf-8?B?OHNmb2JTV09PYi9VbmZac0E4NTNZVTRPNzYzTGRHbWxPTzYxY21oZVlxT2wr?=
 =?utf-8?B?M1Y4OWg4bFpMVlZHUldJS3hSVUErTVh0OW9tNjZEaGJGWldEZ2hCRmhjMjMz?=
 =?utf-8?B?L2RkeitMM1BGQVNya2tLM0Q3V3I4c3VXbW80Zm9QZWtTQ3ZJUjdiekpGR0U2?=
 =?utf-8?B?bEdoQlE2TndQS3phWjZTMWdZU1o0ZEQ5MEwyM2JBMERMRnRpbnJnQ1B6U1Y3?=
 =?utf-8?B?RHJ4aHBpZy9nZUo5YXV1bjhhcitiU0tkMnVKQVBiUjVDckRVT2VqMDVGekFw?=
 =?utf-8?B?OE1GcE5ZRUc3UFJmVEVuMDVheFBuY1c1U0JnaThHdnVVUDhuQUVtc2V1Vnlt?=
 =?utf-8?B?T2hwYys1WE8xZDRJY2hRa09WUG1ndUk5Y0oyVGtXakd6ZVRpakUxK0Rrbkh6?=
 =?utf-8?B?Sm02QWR2NTVCQ2lzOGU2R1JMUm9pcTQxWjBhNWlpcWVlSjJUU1NSb2JDTFlq?=
 =?utf-8?B?ZE43anBJdjlhUGVCSXEwdW9NWmRJamF2VmhtWUF5MHdsTlVWL2ZSSHZQL2t3?=
 =?utf-8?B?ZFV1VE5NYWlRekJYaDhWQjVLN0lINXRpZlhPbUdxSDNDb3hFSEFwR0xqR3NS?=
 =?utf-8?B?ZzZ2TnNDSEhHalNuUUVQOGR2QW5DNXhIb3B3U0dvVVJodGdzc3U4K0pBTjRv?=
 =?utf-8?B?YXJPL2toYmtBZmJscDFFRGpEbHM0TWRiZnJaQTF4S2VPT295QUp4YnhSd1Jy?=
 =?utf-8?B?QmhaeXptOXl2dGg1T05MZDErWlFTb3BJNUpqeXIwcDR6UGFSbzE2eTNWQTRG?=
 =?utf-8?B?TlAzYVluYUxvMVBhVElmVVhBZVFzVVdwTzkwd1I0ZjI3UmtId01iVURJbWdQ?=
 =?utf-8?B?YUJZZGtRRWljUHJkTEo0K0VPWmR6VHlCanhoOHJkbndMdjc3UVhSMTU5emxs?=
 =?utf-8?B?dHEwWkMwbGRteU1vNXFtZGZkL3U0eVJTV3V2WURlOGNqaFRaNWYvT2d5L0VU?=
 =?utf-8?B?MVVkc0FIOURobUNFU2VrSUZNVnk5VFJZcnRUUlBZOHliKytTV0Y4Rjg4WUsr?=
 =?utf-8?B?Y0doeVJBaFQ1amRUMmNyVmxjNXByK1U0SVZVdExwZTZOMEhDTitvUWpMVldp?=
 =?utf-8?B?cWIvalRHNnkzY0tjdWhCUnV3VWk5R2hBc21HbndLeFpmdW4wbEtUelBTQkho?=
 =?utf-8?B?V1ZkT3c4M3crTXZjK1hjRWdTUVliSjRLQTRvNXpNMVV2QjlQVkl0WTMyMDdm?=
 =?utf-8?B?TmdTOW9nbnNYaG5paFZGenJWaTcvL0RpVFdZZlhCMnVmTXlmNVhJdVVFK0U3?=
 =?utf-8?B?NHloaWgrV0lSaE15cW5RelhoL1gvNk1GTDhQeDFvYnYrbWE3Q1hERFRJbGRX?=
 =?utf-8?B?Z3lYb0pFNlBITEFIL2h4TE1jMlVOQWFDMTlycFhFYjNaa2Vqa3RvdFNPMDU3?=
 =?utf-8?B?dXFJR2RtMmx3UTg5d0t6ZFAvaVdXbkZ5dDFzWis5bCtwYjFYc1hiR001Ylpo?=
 =?utf-8?B?cTVNblN6WW1HOFJhWmJBc1FZNjByOTM1SEZ3aFlzcVNFTzNGbk9iaU1lbytC?=
 =?utf-8?B?cXozeU9oZkdTcWM4bGI5QmlKZllicTZMbmJSY3EzVUw3bkJHa1p5eWtYQVRL?=
 =?utf-8?B?azRRQnIybDhsenFyY1ZCWU11bTdzT25yV0pMU1JCdnlDSTU2eWQ5L20rcWRR?=
 =?utf-8?B?Q3NmMlpqVEZteFpreWtSV05wVXY1dDdSN0N0WlVMN1d6eFNycTk4QjgzbGZZ?=
 =?utf-8?B?NkgydVg1TEpJVk1xUFdqM0VTVVZnMHFabXpETUVJcnN4emtZcXZzYmYxSjVo?=
 =?utf-8?B?RG1naXZaNVFhUDV0TEsyeStoMEwwTXY0M2pmaUhidDNQalFLSVM2M3NyMnNp?=
 =?utf-8?B?THBMUUYwU3JxYXVyeVpPS054dzUvWTZFOTl3WDFVamJxYi9PL2pjc1dMa2Qy?=
 =?utf-8?B?bW9sVUdidXB4SWV2OXNCcmlZU1RJN2ptbmtKLzBzSFVrTzI2a3VYR2R0eGVK?=
 =?utf-8?B?VWVwYU5rR2NOZUNINWpBdC9rTUhYcjBzRVVlWUU1dk81MVEzNzR0MlRMWUNR?=
 =?utf-8?Q?4KEY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e662085-a9f4-4f39-b9c0-08dd6588875d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 19:18:41.7148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImRMXaiR68zCsEv8Cg7rZcYh9y5OzGyXNNA1YeTV5IzuFHJZ3QykOwAPVmsPdcPo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g15OvYAW1ckr2iJDutNztrE28GNrQBY19aFVRWBLPj8=;
 b=pUZKM6GcmFiOI/tkGU4W8VB1cGPs1JwC/DAusFGVFzBN0G0qLwHt9ZlGSmOm2zDchSLY2BXcpKUijCry7ixgN07oUERX58xiCz+IYUd1rX7tGPtah0OivXk8s/XlGxj9QDuqe1rM4UY+hH6pmzcmjuaj1qEdw2UuzA8TsdBvw40=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pUZKM6Gc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 2/2] boot: move package options to a submenu
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

Hi Luca,

> Change all Kconfig entries for packages in the "Bootloaders" menu to
> submenus.

> Currently many bootloaders and firmwares in this menu use a 'config'
> keyword and thus menuconfig presents their sub-options as a flat list in
> the same menu. This is not very convenient as some have a lot of
> sub-options, and in (more and more common) configurations with multiple
> such packages enabled the menuconfig screen becomes very crowded. Moreover
> options of 'string' type don't have a visible indentation when their value
> exceeds a few characters, thus making it visually hard to grasp which
> package the various options belong to.

> Non-bootloader packages having suboptions usually use a 'menuconfig'
> keywork to have sub-options in a submenu. Do the same for packages in the
> "Bootloaders" menu which have more than one sub-option.

> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Looks good to me!  Thanks.

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD

--- SNIP ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
