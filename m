Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC659C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC4580C0A;
	Fri, 23 Aug 2024 15:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m24dx3JxH20A; Fri, 23 Aug 2024 15:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7786B80B84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7786B80B84;
	Fri, 23 Aug 2024 15:49:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 063BD1BF313
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6C4240399
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-BXA47cS8q7 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.19;
 helo=mx0a-00230701.pphosted.com; envelope-from=yuriy.kolerov@synopsys.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29F4C40277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F4C40277
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29F4C40277
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:49:30 +0000 (UTC)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NEJEG8021111;
 Fri, 23 Aug 2024 08:49:28 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4160byrfbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2024 08:49:27 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A22040346;
 Fri, 23 Aug 2024 15:49:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id BA63DA0265;
 Fri, 23 Aug 2024 15:49:26 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9FAE140362;
 Fri, 23 Aug 2024 15:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqLB8ydLE46/uvrxzu1s7T4R+bOK8fyLcgDvLB6kJ6lN0KNXzM4PU/HGwbZceZOhsWrKJzH9DJNZNuqtfXh748iQWH4tkzWJLjXUaVW0Mhe57GwmeJjS0CAYkmnc1XqWiPLv4I0tXp39XBH6YE03h/PeBc8EKyaLjYjRzL0xqB+u6bQIviytD0WPJ0gNXC/6oF2us5BkxAdiRaxyxcOc3YiizP90ynvyNG8Pbn2EOi6/EkVlhPKbywCIp8fLwmkyD0pDWa7FxrpCJT+cv9NY7F/utk105ZCRl5N0j2Oh2Shwc2iojyTUxGLeJzHDgI0ZZ62rpJziuMSaSK8ORhu/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIn55xTpa+zFtoKlqQITxMd4OTA1btdXmmcrhZ6Y9VI=;
 b=GyOZL/D+RlP5DhbLyYt6fFukzh2v/CvfOPlMwZqYjfKtZdiBisIjEzF2Ye3yRO/tjRB6/q0x/+QIU8QACh2LZSYJtPWszrbFP8aOX3bzhxllDpjZnKpaiGMYNgrVUkcORE1S35f2VTG8zjyGnGrxepeyBYONAWAySdLFJ/6us1vP4Z1eL3s69Lxnipd/8tyCbyyIJMrv5acdy+iHa9l9WnEOFBtwZPodMOtvw8Gk7DJskwSfsdQpEYjHC8rWHb2K7BSqtUyZvmcZC52/cupo1FKugFZ61a3wgTwCdqHPaMHY39nSVBxbFosh5g6Xu76SO1wSREicpTdSeSH/96bUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 15:49:22 +0000
Received: from CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::d8f4:4e96:1d37:2239]) by CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::d8f4:4e96:1d37:2239%3]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 15:49:21 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH 1/1] package/glibc: drop support of ARC 700 targets
Thread-Index: AQHa9XDDOWN72+6nE0iIlZ+42Gd/ZLI0+CiAgAAAZOQ=
Date: Fri, 23 Aug 2024 15:49:21 +0000
Message-ID: <CY8PR12MB7516DE5EC9BAF13631235DB1A8882@CY8PR12MB7516.namprd12.prod.outlook.com>
References: <20240823152547.1023215-1-ykolerov@synopsys.com>
 <20240823173127.36b44786@windsurf>
In-Reply-To: <20240823173127.36b44786@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7516:EE_|SJ0PR12MB6832:EE_
x-ms-office365-filtering-correlation-id: df7c36b0-c01e-4f8f-a812-08dcc38b27bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?a3AUg3kgRSxX67krFRL/5G/PzVGSJf/GfHopYcBezm9Byo2M3uxRPRkVyq?=
 =?iso-8859-1?Q?5jH89hXygHGRpmOd2FsnRGJ2sI8rLgDEBP1Tbima2iDYX+wW1mRHUoEGoH?=
 =?iso-8859-1?Q?v9MexMV7GBB3lNlBeAAOvVXCETQS5sOwlfds6cjdVmPy8Qp0yHwlRw4Ng1?=
 =?iso-8859-1?Q?vhPlZFfp9m5STO9jfD8rsQVdkgetFfiL73K+pRD6o52b3OZyjLF0S+iijs?=
 =?iso-8859-1?Q?nJMaw0zJWTrVL/BGoU3k8J7I6J+7H/TMnlFngVpBViP2ifhRFlBJMAb7pw?=
 =?iso-8859-1?Q?zdLC4axKn1rVEwV4ZL3f/v3reHFWhZvXddh/qEQxfrAs6mfM0RahisRQCU?=
 =?iso-8859-1?Q?lkfMC0m3HQTy10ZAz1H+o4wbkL0DruynOgGcoW/SZuDldyX/CcxVabxav0?=
 =?iso-8859-1?Q?9JJInow/aU2g5jAYCwHsczdzeQuNfO36hsKOLHmFIUWFcQcOplyp8sDnCq?=
 =?iso-8859-1?Q?K+STi2lST6r5Nc8tSZlvq5Eb909EBIg6r+Ba3RDugPrIX+R5/io3MedbaZ?=
 =?iso-8859-1?Q?piC1WRmltSPhIMYnWpa8xLVoE6Ml1E7gBABUMWnwZSnFy6y55x9VmWOyWA?=
 =?iso-8859-1?Q?Uilu9kzzJe0kRFVHXSja6BJJ3NS7AK969xx9wcdS8EUyOyne9TOnMebWsk?=
 =?iso-8859-1?Q?vuUX7hjxq8W7YtxtLRt7KNfopVyp4mKLgWGWxePPD2/1gDTnFmnvoCghP/?=
 =?iso-8859-1?Q?ptquRbVToBx7mDdcoB3sKnJpqKXwbmI5UnltvwtAmmq31GgyaG3/rsT1UM?=
 =?iso-8859-1?Q?2uZwBPX4gJHBnksTyhrLENzPJ5wgnfRphvtixJ5vV51Fy05silqsEx5efI?=
 =?iso-8859-1?Q?VCxOWT/rtXTOVgOvhdyOksia4RENiAUJSyiTgKwD6NNIyriEm1m3onj4N2?=
 =?iso-8859-1?Q?4CzfkkvKJxUrp/tDpj6JkhbUWJSuvsGsoDK98x3cPr47EeeovjIPDVqzX/?=
 =?iso-8859-1?Q?fnI2cuaZsB+jnlBi/JMTmjVzKrO+f6CeexnHH1zYvXVCZ1mtHPW1hTlCJX?=
 =?iso-8859-1?Q?1foPmclebcFjsZ4Stno1rJ6gGSrBO9f1mqFVlwkaz7uQ0mrPAayDiSc8dt?=
 =?iso-8859-1?Q?zpsZKVnECen4Be9a3f1hcmehdTwbnyMSofK/jQ15SGzS18aN3tOb13iGqR?=
 =?iso-8859-1?Q?f7O0ZoN4JKgkivPKyxpbCMeLzhH5R+YGI+mPKTMJHIZxbJXSshotETS9vb?=
 =?iso-8859-1?Q?pUorx+VLYDi0J3hu7J1tFiXoAL3NrrSghUKDyRCYMuFfY7y/3uSvFL5YUf?=
 =?iso-8859-1?Q?xeTBod+lxjRCLUP5U3tGz5Y+ZO3gAReW3HxFC366wTqly+a1YfE/wsLaWH?=
 =?iso-8859-1?Q?DtXn/FbeFkUKNwROVgGI8C7gOCwYxWbFkI2f0ArXDASW6KuUoW1m+DQVSA?=
 =?iso-8859-1?Q?Y8ON2LcqH8U4sEmgIaalsv35cs1s+0Ig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7516.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RI+GenqziU+xEWiwOxU5liXQcr/sLSUNZxaRPrJWQPtMaFzEhXOcD5UloQ?=
 =?iso-8859-1?Q?8csf7j3v8YBOPcs0NvQeuhlLWn6iVVh6enQfJuFz7S+Y6Ie7zNTGkD68LL?=
 =?iso-8859-1?Q?8K/UqMv/5hCLppacpTCyGgMnq1JZcrVRBc3frDx+KoFex0z2wiynyrHnI8?=
 =?iso-8859-1?Q?zJGSu8E/kIbxiW/pLbhFK//2eJWrazyE0MsaXAlPjd6HmO4UfxrXDG5mCX?=
 =?iso-8859-1?Q?rLBf46B0E0PrYNF2lPFZT3xR4z1cX7RptWJCJ94f5bcoc3svrSaQXEe3hS?=
 =?iso-8859-1?Q?xR2Ip96zg8TxCBIpi/hfnXcG/rlhx20b7jcdfnV5tJe9nRrzDDxl35Y6n7?=
 =?iso-8859-1?Q?R+ixzGEzgp9GTPMqHnW7iUBdz7mMcpbQU+gxI8gDhD2oqWQINS51w+9BVU?=
 =?iso-8859-1?Q?mRynF7XzDxXlCrCsFj0Ecb2rkbu8G0sGfebvIj2ARYXxKYF4hCtVLPk2OG?=
 =?iso-8859-1?Q?/lKcy/mQZ1vDLheNt4S1KPkxQob3S0qG1UB8AGcabYaM851CAagRXhTDdZ?=
 =?iso-8859-1?Q?NMq5coOepmw6xiYAvfQ2LS9Wrl1pyWvL+WLYyAk2zXE1RbKR3hNgElcyO8?=
 =?iso-8859-1?Q?rdQPYZ1eDS0qFGzdpT1aW9IkSJFBIr6kTDliOFagCzdbUFoHzULLeeuChr?=
 =?iso-8859-1?Q?T86vlwoPd9wLI/kOzULjZNBa4rRlVddrL6vBrBar6zFivuTB2HanismMi7?=
 =?iso-8859-1?Q?WqPNbYaVhs5QWk/UJp8sWFV2tUy5X4sB2PzomJBC2b7AoH1Nseon/w9scA?=
 =?iso-8859-1?Q?ypWFW8lq7JJ+9g6/7JbG1eLmEyN0rNauJqBMCDb3Pc3UpzJnobBrD6+c76?=
 =?iso-8859-1?Q?61xsDp8kpN3DZxK9ZVLG87Uyz5sAXl2xnDc/dHrXR/hoO5WqOWQalu9D8r?=
 =?iso-8859-1?Q?46RxPRL+iVGL5su6hdZOxKmYNnPYkk4burUewGHdObmO7K9rU5rpC1kI7g?=
 =?iso-8859-1?Q?pqKfKR1hiAnocNNuHN0X2If6D8fmSHSc44haswiLriQwManLxIy6shln4f?=
 =?iso-8859-1?Q?Aj2UA0AEqzr5jssFh6zHnX+cdpfmTtP3ZII7UY/svAkwjT3qBONiPphaYC?=
 =?iso-8859-1?Q?5/r8gRawWRd3CqskLrm3HRD79pLhmiFYOLhHiOvPK6Q/TDVwsWBMOcEWdu?=
 =?iso-8859-1?Q?/kmeqb9QzgRJndL/wpwHSOiLXX30fbAdLKmjZjpox1CS5wVlTJf56nrUnf?=
 =?iso-8859-1?Q?QDFLehhxLekzme/FCFpqcKAycMp6/CxpzPVu7WE8EB62vbq12oiWHLbjrL?=
 =?iso-8859-1?Q?MoX76fJLNMfGZFR54E1mknyYSsuHgunAaOwzB9T7dcE3sZIeGp09DSAcF1?=
 =?iso-8859-1?Q?UYGFSi4y+M4k/iJZfGcQx3FnEOosNLXyG24eywgKKczsG4Fog7lhgL2Oh7?=
 =?iso-8859-1?Q?f8yJnaxRLZPXLZw+jwWJI7y18vJ6HL/e1V0hQGAZZn5EagRd3X7iQFUfHl?=
 =?iso-8859-1?Q?zXtmC+lBmyHqwQkZoSQURdiH2fWyU4E3QM044YIFKp2GQOeVGDM0lp76ec?=
 =?iso-8859-1?Q?Op5cRXXLb/DPezANawnBpmEo0FYeaqopcyIiPl1xBSJFKetOqcw45Kubkv?=
 =?iso-8859-1?Q?JxDqCiStlkv6kchnZU3J2i+/1+ujHrPPenxNS/EBVOYJD/OqHGlJ4fRpTG?=
 =?iso-8859-1?Q?oL4dX4iCKy6n/SuwIO6Uo92s7vocpPvdST?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OtyhCzCA6jXM3rwT/PHFUVQ2B7Y/tZ3Fq+TvZ0pPmQ90foNXWtpauMqVDxlRMqwM4ZHK/3vMpYPx/A9aO8Z6qSo614vGOWGN6E8ouVyzS1YhaVOCOe8X/ODaEUqXNjSzrUdX64ZYmuSkdg3OMvuYlIMA7U0MRSBCZf+5V4wd37OKXol+2KoZD/xN/52fKu8U4jMYrgmNQnEKCWXyWDiPBA0Vz27eJ+k9sQZMxRl9zB1k22nTrEPkZH+va1RXkRMDZvDnGSnlVlS8yuLLsYgjp8Ee63GMCHucEGpn6gSmR5v3MjxPIWe/59NOCdkpj51MoHLEvRNrQaWfEkDiBtQQXkSNlglRHC1CyYwqQO1/iIHMSIUVE2pucKerRtcCKAu9vMcOetBwhbFfbCU/F1GT9DWUfwK9gJqRrysCQ6aUUk/5aZQVidPgsen2cFvRX9ee7BeMzy3X86qSdHl8bvnNnmQ/I6HiqaX7fRFgqmu7CsS4g2z7Rtbqd+k7XvvRanPGb0Mgr3W4aPNFhwtaEqUeIwXdDmFsj5BLLhGrA8mbyOVsrfbRjvYsa5CvFOciFeVCkbjKWXcXYjniBszyD0/G0uxelYDmgNAGicncPVz56iQS09i5r6zo5gmqjVDBcA7upk4cQyUNZJqCVYJ6zouP/w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7c36b0-c01e-4f8f-a812-08dcc38b27bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 15:49:21.4005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3D3vYTnPsWckmXfb15947/mW/f/R/bRmY07TMYeDJi0M/OqRTGyGazfy/q782vgqX/z1jDRULqm2R/Ou5mVEjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832
X-Authority-Analysis: v=2.4 cv=PZKthThd c=1 sm=1 tr=0 ts=66c8af87 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=nEwiWwFL_bsA:10 a=YRHvXXt1AAAA:8
 a=P-IC7800AAAA:8 a=jIQo8A4GAAAA:8 a=pGLkceISAAAA:8 a=BoJB4dgYAAAA:8
 a=W4FKIdMWFRNrSTBkde8A:9 a=wPNLvfGTeEIA:10 a=tdlbvnJM15nTszQW9e4A:9
 a=fvkl_8B71cHWRB9p:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9bw_jnHfPby8klRCszyn:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=zGR_d48pMUbmtCY1HACo:22
X-Proofpoint-GUID: rWOWnBvLQ4z9tTrrqGwsiLkkRZsUU8c3
X-Proofpoint-ORIG-GUID: rWOWnBvLQ4z9tTrrqGwsiLkkRZsUU8c3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=903 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408230117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pfptdkimsnps; bh=iIn55xTpa+zFtoKlqQITx
 Md4OTA1btdXmmcrhZ6Y9VI=; b=mrwxpZIo5r8cmt7YQaVzvAc1v8UGFOJAgvgFU
 aIvbxBthyoXERlnBEVJf98zTUvnOUdBjF8rSKpm4cx9owvHaF+KTD6vWSKBluZeg
 lLrjE5BJBbmmafJFzoAP9Q4BZzLZZg3sOdnJ7SarRhQonHHOyXU3Lz2Oo7CQF3yI
 A1huPfnJTC4KBYHC7KoDRlcBRJvyZLiJDIeJEi+eUt7Iu5SSiQK1EG3Wly2fyu48
 g9YYSSAcA0n/dlrt5WqW3v/GqytMTITWIBdTb1b+OxoIYAX1/3NQCO824KocS2Nm
 vUVdisQ94QDExi8mFt60GpRvOAXTLGgLn0sBSJU4W29I5Z97A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1724428167; bh=bWLzDz9WOqEjsRVwcfDKyp1uKJgtKe+hhS3mqRoDg74=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Wg4CNVNnf6mNqodgV64bWslIUpYhDr2M/SlW1Pwtz855SN6i2h2FJ2a6uuAzXWVYQ
 jM9W7hfEFeZMD3saXkx3es8mfeltgdvDLoNtm1mMZ33NzZIADCFy1Ag4F8mTH+gSuu
 /Esz7Vr1L1IcgwnonXrPBa/SGS9mm8BxD/TdCiBugKmupQFLGHP7O407qkKi/Ud/Vt
 zqx1rCvAKJ2xwuSZc82R4I5+2X+MakzUkEiZw03Wejl68vzPGlo4v3QYpNP1xvE5NR
 B58zf2jHqgjzNwgafI/9l/ZVAA3Z0+soaXZt2aFTVez54y+vXq74blFr75YCh31zuu
 xDUrRClND0+HA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIn55xTpa+zFtoKlqQITxMd4OTA1btdXmmcrhZ6Y9VI=;
 b=Py8SYmceKAcD7la5t1Motz/8qYcPRBSTeUBjIhhcL4VQyaG8a/BQD8vuKjfd+BKdLLpiSfVXE3ySjgxxv6rh4nLqDcTzODMihH8myLHhFggCgB0jwSboiPJsAbNT3O0BZpQ5+ysAed/q3JNNTdVDYOn7p8GdOK+Aglev6lkm2I4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps
 header.b=mrwxpZIo; 
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=Wg4CNVNn; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=Py8SYmce
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=Py8SYmce; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: drop support of ARC 700
 targets
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
From: Yuriy Kolerov via buildroot <buildroot@buildroot.org>
Reply-To: Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6720602259714202058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6720602259714202058==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY8PR12MB7516DE5EC9BAF13631235DB1A8882CY8PR12MB7516namp_"

--_000_CY8PR12MB7516DE5EC9BAF13631235DB1A8882CY8PR12MB7516namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This patch excludes glibc from libc list for ARC 700 and it makes all glibc=
 based cases irrelevant for ARC 700. So, technically - yes, it fixes that c=
ase and this one too:

http://autobuild.buildroot.org/results/fa9960365bd54872762d5e959b98882b86c5=
e956/

Regards,
Yuriy Kolerov

________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Friday, August 23, 2024 18:31
To: Yuriy Kolerov <ykolerov@synopsys.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Romain Naour <romain=
.naour@gmail.com>; Alexey Brodkin <abrodkin@synopsys.com>
Subject: Re: [PATCH 1/1] package/glibc: drop support of ARC 700 targets

On Fri, 23 Aug 2024 18:25:47 +0300
Yuriy Kolerov <Yuriy.Kolerov@synopsys.com> wrote:

> Synopsys ARC 700 family is not supported by glibc. Thus, it is
> necessary to prevent selecting glibc while configuring for
> that processors family.
>
> Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>

Is this fixing:

  https://urldefense.com/v3/__http://autobuild.buildroot.net/results/9f0a4d=
69aed71a840b1c278a9623c9687207ffc6/__;!!A4F2R9G_pg!cDvQnRyK92Nee5maM5oKWn-p=
EzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2rOgQLENcE9Q4=
$

 ?

Thanks,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://urldefense.com/v3/__https://bootlin.com__;!!A4F2R9G_pg!cDvQnRyK92Ne=
e5maM5oKWn-pEzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2=
rOgQLHqKe_Ek$

--_000_CY8PR12MB7516DE5EC9BAF13631235DB1A8882CY8PR12MB7516namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This patch excludes glibc from libc list for ARC 700 and it makes all glibc=
 based cases irrelevant for ARC 700. So, technically - yes, it fixes that c=
ase and this one too:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"http://autobuild.buildroot.org/results/fa9960365bd54872762d5e959=
b98882b86c5e956/" id=3D"LPlnk437985">http://autobuild.buildroot.org/results=
/fa9960365bd54872762d5e959b98882b86c5e956/</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Yuriy Kolerov</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Thomas=
 Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, August 23, 2024 18:31<br>
<b>To:</b>&nbsp;Yuriy Kolerov &lt;ykolerov@synopsys.com&gt;<br>
<b>Cc:</b>&nbsp;buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; Ro=
main Naour &lt;romain.naour@gmail.com&gt;; Alexey Brodkin &lt;abrodkin@syno=
psys.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH 1/1] package/glibc: drop support of ARC 700=
 targets</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Fri, 23 Aug 2024 18:25:47 +0300<br>
Yuriy Kolerov &lt;Yuriy.Kolerov@synopsys.com&gt; wrote:<br>
<br>
&gt; Synopsys ARC 700 family is not supported by glibc. Thus, it is<br>
&gt; necessary to prevent selecting glibc while configuring for<br>
&gt; that processors family.<br>
&gt;<br>
&gt; Signed-off-by: Yuriy Kolerov &lt;ykolerov@synopsys.com&gt;<br>
<br>
Is this fixing:<br>
<br>
&nbsp; <a href=3D"https://urldefense.com/v3/__http://autobuild.buildroot.ne=
t/results/9f0a4d69aed71a840b1c278a9623c9687207ffc6/__;!!A4F2R9G_pg!cDvQnRyK=
92Nee5maM5oKWn-pEzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdU=
FCB2rOgQLENcE9Q4$" id=3D"OWAbb05a847-2e56-f6ff-2e4a-cbcd63b482a9" class=3D"=
OWAAutoLink" data-auth=3D"NotApplicable">
https://urldefense.com/v3/__http://autobuild.buildroot.net/results/9f0a4d69=
aed71a840b1c278a9623c9687207ffc6/__;!!A4F2R9G_pg!cDvQnRyK92Nee5maM5oKWn-pEz=
TjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2rOgQLENcE9Q4$<=
/a><br>
<br>
&nbsp;?<br>
<br>
Thanks,<br>
<br>
Thomas<br>
--<br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://urldefense.com/v3/__https://bootlin.com__;!!A4F2R9G_pg!c=
DvQnRyK92Nee5maM5oKWn-pEzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9=
W9XdLdUFCB2rOgQLHqKe_Ek$" id=3D"OWA1e031252-9106-a265-9b2d-e3f62654afe8" cl=
ass=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://urldefense.com/v3/_=
_https://bootlin.com__;!!A4F2R9G_pg!cDvQnRyK92Nee5maM5oKWn-pEzTjL0ar-y73sg2=
UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2rOgQLHqKe_Ek$</a></div>
</body>
</html>

--_000_CY8PR12MB7516DE5EC9BAF13631235DB1A8882CY8PR12MB7516namp_--

--===============6720602259714202058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6720602259714202058==--
