Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD067C28B28
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F07081FDE;
	Mon, 17 Mar 2025 19:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7tHNeFrGJUh; Mon, 17 Mar 2025 19:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A53C081FDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53C081FDB;
	Mon, 17 Mar 2025 19:16:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FD7D5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 088B34056E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ge1yfstDpghG for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 19:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::62c;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 676BC400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 676BC400F2
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 676BC400F2
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 19:16:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ot4rc+CY/l/y5s/ogwcMX95eITXUFRCidKgUMQukbbvReUxrKWqhAta4uxU/IDactUTpE+FiDE5HLhRp7CZrCEn8MPMGlac8ni/nQkS/ZnwqEtMyg261PJ4X8q6ZyvvB6XKYQ8KK0dx740DlwYwPRvM45XN3AgU5fEIgrrhUPe+Ox+wfYmXgTyYPekPdRUVqo/nOdqFDdek7c7tjXLLOr3qbtgCJHAqGEx7GUMRHw5e2FYiEwpPM5mX7VyoUkJf8G0l62EzEW135X1v9MMTIvUuafFfwhnr0FExiCCOQEyvestkhNTggZQHXqwjfvmezux81gua569irMDKUwrML1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhH0iAvLgKOI/ZwCyXOAIZ78cBaVwFc8gnCKfUSfaN0=;
 b=OPktfkrhKUWLxjo41UqZr9AB8W1s/TGhd91DE8/EEoP7f60pVrW7P8778PNKWOMKscp4FvSo9xihSGPJrCJspXIY3NAoLersGzeG7dRsf6xj/3n+jamIWm/OY2ooz+XgYgBUG20II9P3zernGUNpGmRK9pbP7TGY4xGPhOwvEA7b0Fp/Oc2LAG//md7boyexl6YrincDi7OXkDkXr4DqMOI53cEAHOy+Rre7tY447FSx+2psgtoBaTE5bEuu+12DXY8PhLMPkGDBnNHl2tEeD9IqEHsi9w9VHBMp77efqvb/Ra2GEcJFJI3KwvxRRNTS2MUXegSvKu/H6Xi4qjJYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:16:28 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 19:16:28 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alistair Francis
 <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Dick Olsson <hi@senzilla.io>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Lee Jones <lee.jones@linaro.org>, Sergey
 Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, Xuanhao
 Shi <X15000177@gmail.com>
Thread-Topic: [PATCH 1/2] boot/xilinx-embeddedsw: fix menuconfig visualization
Thread-Index: AQHbl2Oy0RPPTk9SuEeRvnO3biciDrN3svaA
Date: Mon, 17 Mar 2025 19:16:28 +0000
Message-ID: <SA1PR12MB56156CA90A17F44049A8DF80F0DF2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
 <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
In-Reply-To: <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=70e0d14b-6111-4b06-a87c-9f25e2fb9b1a;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-17T19:14:57Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM4PR12MB6616:EE_
x-ms-office365-filtering-correlation-id: fbed52c0-2255-4b0e-3bfd-08dd658837d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UjhoM0FRamRRS21YRlp2V0N5UUwzdTM2VFJtcVV5dXBNZWxWSG90VVBPbGVB?=
 =?utf-8?B?bXNSZmJMZGlNU2FSNnFUZWtFdHFrdVc5NnFEMFlWWVJZMHFLR0d3RnA3TmtM?=
 =?utf-8?B?QmtFL280MUFPYWtsVHdSQmEwWUJQUmZwS0U1VHczMVNDZGNmWUorc1lvekNv?=
 =?utf-8?B?Q1BKSjNIbkUva0E5NW5iRFhieDVsb2s0cjJCV0FibUNDSVVoNW8xZFB0a2FZ?=
 =?utf-8?B?ZEtlbXBmeVpYeXhQN1VlWGszTlFQc0ZYUnRmejF5TTNUbTJJWGJ4Ykdhd2Fm?=
 =?utf-8?B?emM2eFovQkZsakhMSVk0azBCck8wTEozaHFXTGUvL29UWThvZEpmNmF2RDc1?=
 =?utf-8?B?UWk3eW1oN2pYbkRqQ0JMU1FtTWdVYytndEJOVVlXUGFwblFoelNJSVoxaWNp?=
 =?utf-8?B?eDRPRDZMT2s2cWZIdGQ0WDFTQVZzRU9wS3cvVVcyNkszL0FuYnR4dkxaRGFY?=
 =?utf-8?B?UVAxd1BuREx1WUtrME9vSGZoajVhVVNLcGR6dFJpeGFPNGNvQ1loWmZBVGU2?=
 =?utf-8?B?VG9BNmZHc1BOTWpvTjhQdzFlc2JwZFI5NlNkM09MYS9jd2lHbDBUd2pqaG1u?=
 =?utf-8?B?WjFCVVVHTkZKS2RBL05OSlY3THN5MW9yZEJycWU0ZC92bTc0Rm16WGhGUkdL?=
 =?utf-8?B?OEtPWEpaVWFUV3FOV2RFL2tUREVKczIvYUlIOXFmbTh1dkFGWHVJc0Z2VXVU?=
 =?utf-8?B?Z1JiRGdyTnNqQ0VPam5CQlByVkFzMmdFWTNGc0Vicm5vV09Ba2w3WmRrTE5B?=
 =?utf-8?B?YXQvbVpVRy9RSXVLdThBVDZVVmdTZzNlME94cDBER2o1cVBPSGJwaDRDZkh3?=
 =?utf-8?B?L21qZklJZFdYOVQxRmMwYTcxUTI0YTUzUHRZMnBJNUdCQXVKMTFSYURydjY0?=
 =?utf-8?B?NFEyeTFPTGZvc0x5bjRhcENYUnFkMXV4ODhRZ2JTQ3dwTjFVbkNDL0h6aWNJ?=
 =?utf-8?B?RnY5QnZVci92anhCUUZOeTFmazVmdXg2M0NURGFNcWZzZ3ROL2QybGRqS1Z2?=
 =?utf-8?B?M3RIcGdLU0toanFkejRNcU9wS2FLQkhuYVh0S0Z0anQ4N1JkR0phV244Zmx2?=
 =?utf-8?B?bWdxdjlFT09WdFNQRm0wVStLTUoxbTdEV0tmSEYzdk1RYWhtM21MbWcxaFln?=
 =?utf-8?B?Wjh2WEsvT2VqaEVKT0FkSHE0YThsallDWjZIZXZqYm5IRXVBWGQ5L0lKVXM3?=
 =?utf-8?B?ZVRYMlNGeHp0QW42RmdxQ3pGZ01DbjMzUjF0MWxZcFZxSUNYaWVIcUFKR2Ft?=
 =?utf-8?B?dEV2RjE3ZmhScWVxSm5TaC9IMmZ5K21aUFRVMnNnK3V2QVpMUUNsYzZHZjg5?=
 =?utf-8?B?NGxFdEJrbXRSMVlXQms1TXpkM2dla1cyNFluNktRVnJLeEhoOC9McWhEVnI5?=
 =?utf-8?B?TS9GUXl4czlTYzE5MFVmU2ZUU2lZYko2ai9raTVUS2QyN3g3Q3JET0Z2d3Rz?=
 =?utf-8?B?RTJNZkNtUWt2R2k1V1VRT2M1S1VYOXdLUGw5R0MyRjhFTFY4YTNzMG1vMFYw?=
 =?utf-8?B?ZjExcnNYU1lhUnlDT1RoYytsb2NUTzNvVTBVSS94TlhwdjZkZWorK3VQTDFP?=
 =?utf-8?B?c3ZkRnJmVXdsaml3bnNhNFRydWdEMUMxdjM4Q0JpNXcrT0h4L2U4enUzeFZv?=
 =?utf-8?B?a2lKUUVDaSsrdHM2ZndQM1NoKy9BZ1drMHd5dzdpSGtkQVhFTkZJQWdNeisr?=
 =?utf-8?B?QTZCdDVIeEpjcjlHM2RuV1dxV1pLbkJtNFVnSkpHeU1qdGtPYmN0NmxSVEJX?=
 =?utf-8?Q?1a+LjCB/t1DeiCu9ys=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzF5TlQvUzVmSGlzOU5SRVI3cVBIdldONGhPeDU4aEZOMHY2N2NVbzVTUkF0?=
 =?utf-8?B?LzM3OFB1MURUckNjalU1MGIxb3JxKzdIWU9YR2lPR0t0cFF2Smp6a2loazl4?=
 =?utf-8?B?Uloxd28vQUtpMnh5ZllVaTR3YkpTaXIzUWdreG9HYXBFcWV5d1lsdjJ5QjAy?=
 =?utf-8?B?dFk4YWhxM0tmREx3aS9aWDBJRFRlcS8rR3RnMGtPRzZNRlY1b2Y0OHV4a1Z6?=
 =?utf-8?B?OWFyWWlvM2RvZU1oWEp5QTBIQzhHYldVZG9yaW11WEVwYzhnZFB3UzJEbVB3?=
 =?utf-8?B?ZEU1ZDV1SGs0WTRBNDJIRS9scTl5ZklIYUFBVkg0LzNEdGtONSt4VDRUTHRt?=
 =?utf-8?B?b1RPc2Q1K2xGbG91MlpLa3FMbUVUZG5IVDZRRkZpNmZRcVdKRWk3eEdXdEp0?=
 =?utf-8?B?N1BYb0NuTW1wVWhVVllXNG4vNnNIckdLV3V0U3k0ZDZtQ05NdU9BN0dxY2w3?=
 =?utf-8?B?Qi9NYnFuUC91REprUE9tK05mdmZORzlrWUduSDNseXR0c0pIVFd5RHVBb01y?=
 =?utf-8?B?UDRwd043MkpPYVgyeStrVVM2Q2diTndHUEtkTmhGU25FZUVKcjUxQUswR0Jo?=
 =?utf-8?B?WmtnbGJCdnd0eCt0SDlkdEpLS3JMZzJtQXprK3Y3eFNmZ09wVnZRV0lGd1B5?=
 =?utf-8?B?OE9GbXNYSitrNnJqUEFVdW9wTHQ0VUlPWFZFZXRPeGpQZ0VzUy95WktKOW9p?=
 =?utf-8?B?dG0zMnBPTVR4dExuYWV4WHg3UFBHZ3VIK1FWNXRTRE1BUm56Nko1R0xkS3hY?=
 =?utf-8?B?NzlnVzFUNUNxZGZDdUtCbU9JT0ZwSkJhOEk3YTJlaWY1ZnVoYUZsNENMbU4y?=
 =?utf-8?B?d3U4TGVHUjBQU05XdE9rTkQrcFdlUHZFYnpOcGJaQklJdjVSdUxKUExoMFhE?=
 =?utf-8?B?L1hOOWZNY2I0TXpGQ0kySDdHUTNHYWduMjNBZjNQV3RuUFN5TEN5OTZHbURE?=
 =?utf-8?B?TlRJeTViMzBQSnBWKzI2OXArMXF3amNyY2FPSUhaVU9nS1dNODkyd1ltdXhq?=
 =?utf-8?B?U2l6cVRaZyt4b1JzN2VQMTdFTFdYUnZOSFp4RWNhaTBKc3NubWNmcGdoOEZy?=
 =?utf-8?B?WXRldjNKcnNYSkg0em1HMEtaY003V1ZGRzN2S2gwRkFzM1RJbHRvMzVPQjh4?=
 =?utf-8?B?aG5wVWNTditBcE92aHdyZlQ1QnFrazF4THhTMUw1VkoxcmRra05TdkpsaFQr?=
 =?utf-8?B?RzJBRVd2L2Vpd2pIcytpejAzdWFaTzRpZXFZMkFhTGxrSTN4UGJBWW4vNU9X?=
 =?utf-8?B?OE14VHlsZE9IVzFIVlZ6bEF3d0JZeTFEblp4S2VDa3RpMVc4Uk90STdac1JF?=
 =?utf-8?B?ZWtaUWNSTjJDbHJpNGtCTXFUbHJFWG4vWklZbWlHd2wveWxabHlPL0FhSjZN?=
 =?utf-8?B?S1o5YWVkcXRjM3ZIVHBzMHZRZW1WQnRwaldMQ0o5Z2QvTHBoZEd2Q1ZIQTBv?=
 =?utf-8?B?cGJxc3YxdVFlbllCcVpIdFpqcmVFdE0yYjR2bkV3YmxqM0hiTTBnTlVpdEdN?=
 =?utf-8?B?clZid3h5QWFFUVY3MzhGNytvbHkxTVJnb0lYOVdLUEVTNnlXbmozME9CeUFQ?=
 =?utf-8?B?NERvNW90WnNyNGFLS1dOUDU5aFNXVmZZeWUyYTZRV3kvNDhsRS8wWXc3aXpj?=
 =?utf-8?B?aEIvM0VnN1JyaGNBSnQwWFVGVWt2b0VvbGdjNi95YmYxc28vYkhGZENzcE9W?=
 =?utf-8?B?YkhjcXhnTU1rdm1PRWNMa2lNTFJ5T3VuejFYcUxmNnkzalFlamZESXdBSnFI?=
 =?utf-8?B?TWg2Z3h3SFBJWUY3aWVpUEFCSUU1bHozZ056MnlaNEg1Mm5WUEY0R1FIOVFh?=
 =?utf-8?B?U2xycFNtb3dqTERSL0duSlh1Z2l1d2dzYWNtL0cyb0FnQTNFUzFqYjJVdWdC?=
 =?utf-8?B?UGl2S2lkL1AyRVFsaUtieDlTMmxkUnhrbTVoSURmUjhWbER2SzB6WXpqNGFm?=
 =?utf-8?B?bFpRa0R3Q2xZWTBPU2x6Y0VDaXV2RnBoR3hHcWdCTDUvclVyTFdPYjZPdHFm?=
 =?utf-8?B?dXp2QmVPTXdFZGVqWWJSdlVEd3JSdlp2S09yWjJyWCt6TVQ4dTl5TGhOeCtl?=
 =?utf-8?B?Uk45M0hmRThrQ05oSlBqSzRZbVdBUS83ZDIxamwraHluU3BseGhuYSt6UTZO?=
 =?utf-8?Q?KAFE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbed52c0-2255-4b0e-3bfd-08dd658837d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 19:16:28.2726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrn3d1W4c1sanG2MoRlrigLRGyC1RiTZtw1pHuRFjLgE2IegHBK9xI/5NAQ9119o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhH0iAvLgKOI/ZwCyXOAIZ78cBaVwFc8gnCKfUSfaN0=;
 b=iuFiYTr3qnuDNlDWWtn95i/UM/kRg0/1P/uaKjQ6yjIVOrP2XNptRn0no2kLVSrVJiIgtPeyu08t5kFc+NLeJeH7N9rDnlNDIzZXRfOaTcHmdeOJ8Ed3sYce9wmR2osmjCTRdauwawi/0c/59hTxWUYmviEgsSta2m1HfNk4RQ4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iuFiYTr3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/2] boot/xilinx-embeddedsw: fix menuconfig
 visualization
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

> Due to how menuconfig works, a 'comment' entry following a 'config' entry
> prevents correct indentation of items depending on the 'config'
> entry. xilinx-embeddedsw currently shows as:

>  [*] xilinx-embeddedsw
>      *** xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf ***
>  (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
>  [ ] versal plm (NEW)
>  [ ] versal psmfw (NEW)
>  [ ] zynqmp pmufw (NEW)
>  [ ] xilinx-prebuilt

> So the 'versal *' and 'zynqmp pmufw' items are not indented even though
> they should be.

> Do like most other Config.in files which have the 'comment' before the
> 'config' entry, makeing it render as expected:

>      *** xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf ***
>  [*] xilinx-embeddedsw
>  (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
>  [ ]   versal plm (NEW)
>  [ ]   versal psmfw (NEW)
>  [ ]   zynqmp pmufw (NEW)
>  [ ] xilinx-prebuilt

> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thank you for this!

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD

--- SNIP ---

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
