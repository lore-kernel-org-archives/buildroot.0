Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8A2C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 06:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 751F24096A;
	Fri,  7 Jun 2024 06:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5Z4yHypKidD; Fri,  7 Jun 2024 06:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B68A417FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B68A417FC;
	Fri,  7 Jun 2024 06:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4DF1BF4E4
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87D2484720
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaY8TcRlz28Q for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 06:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70DAF8471B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DAF8471B
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70DAF8471B
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 06:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjZOfK0ZmehhEYhrHN8pMZub09qmmpIJwqzT/CkdsGc6VXOZUSAdXgqLSp+Eiu5STrhLUmNmb4m4Ka3EFD1zC1EqgTYLS+bivB0lu6UPZWTy5GqBsTCocV+AMDuNGtm/cOM+emVMJv1Nqs6Qk//EJcgyrntnQmxdKQGkmhlEeAc1ZXd/Ib6brYX0H+1KhT60aBw8mxNhVGBFlhscz55iLblHTuYFexyqfaUgXrWjejI2bIo6XqsYkxnRbJOiiUK5gawDJdmbztMBtepHy9nrwvVd5Dx3GDFY4nPqm9cvuEYNSLJSa20MIvuaG8YceLA3hP1PI2ylsWJRYFDg2z+dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBTDvTJ7qKPP2PZCXybfn47BX90YRlG9H/PYpvymjok=;
 b=RYhbuLLenWjT6fr1DZ+FNLog4JAOIJVxs2VBMEckzgi0M0h+OJw56zEE5qThiAa9qPucjcZIuYmAINwHP3EC3cPu5icGdYRwQ6/QcgZFV5+gyC3eyUetEVO2f8puqd4FMsMLVlo19BFFLEopjuOWEoAZBf8og4wUx+lTAnAuwbG7NIBQKxIPXLp+xlb5jH0D1vYz0KZOooYNoymDOsOj143beSnz+0xV+TK+LmDacZ36Ia14E2AeGvR//H/2MaSFhXfKdjfd7LTaqGpGKjtL+9p8BFdlXLL2o9nT8bwlByVIdtmpd0N+v28rq23CLZmBIWlzScleUSCmqvEgf2q+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 06:34:46 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 06:34:45 +0000
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, Arnout Vandecappelle <arnout@mind.be>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [External] Re: [Buildroot] [PATCH v1 1/3]
 configs/zynqmp_zcu102_defconfig: bump to xilinx-v2024.1
Thread-Index: AQHatax9g559kmzXMUmo4Ts21YO5tLG64BiAgAAt4QCAAAcRgIAAyD1g
Date: Fri, 7 Jun 2024 06:34:45 +0000
Message-ID: <CH2PR12MB5004555237FB657D48814636F0FB2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda> <13f2f3fb-31ed-4a20-a0c8-304f359da64d@mind.be>
 <BN0P110MB16733D666EED3DBDBFFC8B64EBFAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB16733D666EED3DBDBFFC8B64EBFAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN0PR12MB6320:EE_
x-ms-office365-filtering-correlation-id: b38b79e5-0237-4136-3dcf-08dc86bbec23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|366007|38070700009|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?WlRkR09jRGdubG1qdStrbEY2VW84dFI3UUV6cm5HcFkzNldUK1JUN0N1MzM1?=
 =?utf-8?B?eUlMMmZUV09IMlJMMXZUNGJQWFI4aHcrOG1pdGdrL1daa2lDcUFzOTZuMG9l?=
 =?utf-8?B?S0pJNkd2TjBVNjB6Nnl2b1JNMG5YdkxvSEluRG4vOWFZNWlaKzhONVFNdVJO?=
 =?utf-8?B?QVZGQ09IdHBNWElqejRraURIb2cxSXU3cHpNWTJjZUFyUVBsMDd4L25EOVpO?=
 =?utf-8?B?aTB6eHM3WVArUlptSE90SWlpdnRvdDF4aERXcWYvZmRGUThaajdwWWtoTDVw?=
 =?utf-8?B?a3p6VEdSekF4RnNWZWpoejFzTlVlY1ppaXhlTzh5cVRQb3hRRWxrZjJnSVZZ?=
 =?utf-8?B?K0c1WmVnS1BtUks3NnBDUUt2bHhja1FpYjQ5emVnYU5Vek1qY0dYVUFUSVVV?=
 =?utf-8?B?LzRNMmxBd2tjODFRNUJmZ0lsQXMwWTRyVUtjRE9YMGkwRm5HcHgvKy84eHJN?=
 =?utf-8?B?NS9TM0Z6NXN3d2pPVmpDWnYzMXZHTDMrMEVKeGVaa1cvMWFnNmNEZkpGMzIr?=
 =?utf-8?B?cUc0M1FGUy9ZODA5VFpXREs0Y3d0TEx3S0oya1BwUFVuRyswaW92OEpUQWVk?=
 =?utf-8?B?WmZMMDNSMmJFWmN6ZDZLT1ZFT0F4d0QrcHVUdzVHL21CRWNaSm54K0RoQnAv?=
 =?utf-8?B?RFZSMm1jYTVYb3lvNlhRalJNazI4UlY5RXY1VXhWN1hER3N5U0dqbzB0b0Jz?=
 =?utf-8?B?bjBLdlFzVFlFa3FQa1VOYlRZUHYzcjZkb1Evalg5dGtwcVdlMlZYZFBuNzBF?=
 =?utf-8?B?bExUTi8vL3dSazFIbWRuQlAwdDFNNzdhNUlIM0ZHOUU5R3UrcU95N3JTM0JU?=
 =?utf-8?B?ZkxHRVhMTVZOd1R6ZXFTdVR2aytrVGVtVGxjTk9QVE1HeVdJdENaL0RjMG9a?=
 =?utf-8?B?UVhOQldKYUdMMUNDTWIrdEUvR1Y4ZFVXSDAwRjVDd3RaTlFZeWlLZUp0ZjZp?=
 =?utf-8?B?eDJQSVZiSlJickNQb1pzQmxtdHFiY3FlOXpBTE10NmtqQ2ZVQnRaOXVUeXBY?=
 =?utf-8?B?aFJYRlpWQS9tUGJhdFJlRUh2K2gxVHo2U0pFdzJoMDRHQnlOb3BhZGd1cU0x?=
 =?utf-8?B?Z0ZqOHJzZ0UxbHdGUThsR3pOR0hRTzltZUJFMkhMaDZqRFZENVh6V25XbDNY?=
 =?utf-8?B?cExFZ0ZqUXhjTkdVSlFzN2ZOMisremNqMFVtakxWSWZQM0RhMVBuc1NBTUhk?=
 =?utf-8?B?aWVxQ1B3aGoyeml1MkpTVzdOY05rQkhwcW9mbWNFMWpZb0JBRUdPRDJoZG5I?=
 =?utf-8?B?a05WRXpYNi9GdXg3VzhyalRicTZvVU05Z1BiWUhMQXM3SC8zcE1sRTlOS0lx?=
 =?utf-8?B?dFdkS2hQRHJqaTlHTGpYM3NwYlN2cFFLUGtRWStHTnYzS1RtRVRyMjNKTDVn?=
 =?utf-8?B?VVhFWmVYc1pndzA5QiswVXpjZkVMcG8zVEw3YlBIa2k4dVNiQWEzOUswM1V4?=
 =?utf-8?B?YmdVZ1VRQXYvQzFtWVVjSFRpY3Bjd0NvcnRUenZCa1dRZy8xVDhXa3FPQ0hT?=
 =?utf-8?B?bkhKTVAxSnJON2RWU2o1MG15U3dDNkEydHBST04wOHRjN1hpOGlkbzNxbVJX?=
 =?utf-8?B?YllWeFpFSUZlYS9paDAzM1J2b2VGeUtXeXl2dGxZbXJHMXZyMHhwb0t4Y0N3?=
 =?utf-8?B?Qlo4elB2bFRTc08rRTA4dkRzaU9uTjVpM0ZseDltWlJ2TGlxSFE4RFA2alRV?=
 =?utf-8?B?enRVdTRqa1RhMytxMnNPNnpWSjl2aEpRRCtmdW11OGZaeTVlaEJCTkhDUTVx?=
 =?utf-8?B?Ty9pVHVOMGJFMi9ydjYzK0ovR0ROdTk5b21DREFsWDhOWmp3bmEvMDFFYzJa?=
 =?utf-8?B?S1lXWWxQeU1LMzZSS0VzQ3pERmZWYWt4TXFDS29rWFIwbG5pTldMcjRWUkJX?=
 =?utf-8?B?WldBdGhqUndsYys4L1BCOG1WcDZPRVNWdmxOSlE4ekNseEtZNnRMaDFEQnBV?=
 =?utf-8?Q?XH7V0CPbcxqrSdWqdStMhg0k5T1c35Ym?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2h2WWpPTXFydnlLUTBVa2k2eHljbW01aHB3dDl2SHVQd0NrZzd2czlXdVpP?=
 =?utf-8?B?Z0RSYXNacTB5bHFXK1hVZ0ZGeUc4c2haVGVmTTYrWkdDbmpMSkNzbllxZk1X?=
 =?utf-8?B?M0taVHdJTGpnVDhjMTVNUnN0OVJsYjhLL0pRam5DQWVGZEQwSHBwNndKYTN5?=
 =?utf-8?B?M2kxOHJEbW1xcWM1ZFZ5ZGhEOW00QUY1U0thOUlBend1U2NyZzU1ZGhhL3cx?=
 =?utf-8?B?ZklXVXNDUG5CbE1CWWVtUUJrU1d6a2drQnRtUkdzM2xGRG1NZU1LaldVSFlT?=
 =?utf-8?B?Q2dhbjFwK0ErWnVkazNncW95a2p0eUUxcW9hQkQ1SUs3ZEE5NFdHeFBveWRZ?=
 =?utf-8?B?Q3ZFNWREQi9mQk1XWHVYaFBwVjlxU3VJTTVXU09mZUE0Vk9pMkxUTHVLS2tV?=
 =?utf-8?B?YjZpcDM2cm1DekI3bm5kV1FMa3M2a1A0WWhRZWxrYlc4UW9EK3RpMkJKM2Ju?=
 =?utf-8?B?eWdtN1U2eG1ybjVoOTBBK1pqZVEyUmtjZ1orc2EyZW8xcVZlWlcveCtRUTgv?=
 =?utf-8?B?TUxNcVZ3cnlwT3QvREN5N2hNVkF3a2tScWdQWlNWYnQ3d3ZITldjL24wVG8w?=
 =?utf-8?B?Q2t0UHRsbkd4T2ZFL1p2WS9uK0ZtUEZhY0ErdnNzUU9pckNsL00vNUZ4eXpY?=
 =?utf-8?B?eWszZmpkVWNvYXZ2M0tydnhuelErelFhTmFDSTVlRFhJcngxZHJ3YjNMM29O?=
 =?utf-8?B?VG9GQ2R1VkliWklxM0szb0huMDN1c1FNaXNaN3I5M1pKVWtpWnZaSFhPZUhj?=
 =?utf-8?B?djNEeGp3L3dRQkc2YWN3QS9VYWE2VU9KNmpaNnJOM2VCYXBsK0lVZXZENnFI?=
 =?utf-8?B?WEx6Q0NDaFVhc3J0czU3QXhJdEU2d25XTE9mOUNxbnBrVk5GS3ZTYzBIMFMx?=
 =?utf-8?B?dm8ySFNwQW9IeGxyaVYyNkdLZ296VGIyVkJ1TkwrU1lUbjNuQ2wyTjJxWUE2?=
 =?utf-8?B?akR0YjEyL21oc3psaG5tZlJHU2hMcVZnbFRzYlNobmM4clpqNFFPM1ZmYmJ2?=
 =?utf-8?B?eFVjalpRZGRzY1duZVlDNnA1OGtoVk03emVzVmVKcm5rV0RiODdRRDdvZHJi?=
 =?utf-8?B?alE3TVMrS04zdEhjZHFXbWV2bE1JZ1NsR1JMWVUzMmJITjY3V1lZZ2N3K29U?=
 =?utf-8?B?YVk5RVl5czZFZ0xuWUNUZ0VoT0U2MXQwaDF5ZmJHZDBUVkErMzJLQlZrV2hx?=
 =?utf-8?B?SFdsVUt6K1hkQ1k1VzI0VkR0eHRmSmRPaFZZUUs1dVd6U1I2Y3BjSjFOcTdK?=
 =?utf-8?B?dHBEL1NkZjg4MFZYdm0yZ0tlZ2RILzNKbHZxSFIvMG9HYjRDeXN4WFdvcUNR?=
 =?utf-8?B?WU5kK1h2cVNocW03eW5RL0dWRklubWpKWkVFcEZnbk1wdXlOUjJHck5vWlJr?=
 =?utf-8?B?L1ZPN211NU1JdHpKL2lGK1Z4VmhyTHNyZnY3Szg3Njg1RjdUS1VsSjNlZ2dO?=
 =?utf-8?B?Y29hY05wUU9TMFFuMWJQODZkc1h6Z2cvU0lwU1FqaE03bHR2YmszVUVBZVZY?=
 =?utf-8?B?M1poeTlyMGNPei9ENXpPQllyRHl1VndMSGZLZXNLRTJYUGJIMVptTE91eEJQ?=
 =?utf-8?B?QmNqbGpjN25LbHloTUl0cmNUVWF3Ylh2aHloU1BxN3NMVmowSVZLcGNJVTRP?=
 =?utf-8?B?L0VpVGx5YlRYMHY4Ukh1ektJNkNobGx5QUM4NEFqRDJhUVVOd1k0dmtTU2xQ?=
 =?utf-8?B?bldZNVNHQTNXVUpocFBlaGZXRitUbDl4Z3J0YjloL3NINEZxL1V2SkZnWlFi?=
 =?utf-8?B?UUFsRDR4TDE2aTE4UklKRFRDN2QyYmJ3TFdWc29TSStyUVRGNTlGTG5LTlNF?=
 =?utf-8?B?TENlTDU2aFIyTzJLWCsvQWxTSll0T2ZUczBnOCszY2RhT3NyeHVSZmpuMmM4?=
 =?utf-8?B?Q3c1bHlxUHdyM3NUbDlkVmUybzdXRVd2WkkrY2RTR3JjU1pXWlNoUGFQbm1o?=
 =?utf-8?B?bFNnekorYXF0Z2tTRGF6R211UUpVNzNQY0Mzd1d3L1BHWmtjOVZwRGNVc2FP?=
 =?utf-8?B?MzlOV09kaGZwOGZUTEs5a2dNZ1M4S2s4VDBQS2ttMnoxdno0a0dKUE1jeHZo?=
 =?utf-8?B?U3NXU0l4M2xzajArdlhOK0w3VzRTV3lHdThGV09pbWhXU0tVZU50WHN4TGs3?=
 =?utf-8?B?VmpCMVdMQ0dieTBQWkJkdThxNW5CUWZpZjhHbURhYmsxbk83c0ZnLys4aDc2?=
 =?utf-8?Q?Nzx85fTIME26GAmUIJzhYCo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38b79e5-0237-4136-3dcf-08dc86bbec23
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 06:34:45.7958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udBl5Qs2nObpq1Im3mY7hHbM6Nsa917nOiX1N75ShbnFb56d5edHXkeqZGt9qYsK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBTDvTJ7qKPP2PZCXybfn47BX90YRlG9H/PYpvymjok=;
 b=ha/+N2bti7/4hiTkZ0gC2OWQTT8oTr+pqiWw7q9SRdE4fV9F6/yMFSB/3mXS/4/OQkCi2tMv6j9VtSAaIrB4LhvidbvtPD3kP23i2NBdrRxvfO1oUNEjnGiJBxW+4moqlra/Ft59v4YTmovLcA/0wZpjvGWCzAzR7WhgB9otAV8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ha/+N2bt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [External] Re: [PATCH v1 1/3]
 configs/zynqmp_zcu102_defconfig: bump to xilinx-v2024.1
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Thursday, June 6, 2024 1:09 PM
> To: Yann E. MORIN <yann.morin.1998@free.fr>; Neal Frager
> <neal.frager@amd.com>
> Cc: ibai.erkiaga-elorza@amd.com; luca.ceresoli@bootlin.com; Maier, Brandon L
> Collins <Brandon.Maier@collins.com>; thomas.petazzoni@bootlin.com;
> buildroot@buildroot.org; michal.simek@amd.com
> Subject: [External] Re: [Buildroot] [PATCH v1 1/3]
> configs/zynqmp_zcu102_defconfig: bump to xilinx-v2024.1
>
>
>
> On 06/06/2024 17:25, Yann E. MORIN wrote:
> > However, while applying, I noticed that those boards do not have
> > BR2_DOWNLOAD_FORCE_CHECK_HASHES=y (so my post-apply hooks
> triggered).
> >
> > I wanted to add that and point to the newly introduced
> > board/xilinx/patches, but that will not be possible.
> >
> > Indeed, those defconfig use BR2_TARGET_UBOOT_ZYNQMP_PMUFW, and that
> is
> > added to the extra downloads, and we would need a hash for that file.
> >
> > But the filename is unversioned, which means that we can't differentiate
> > between pmufw.elf from yesterday, the one from today, and the one from
> > tomorrow.
> >
> > So, when arbitrary downloads of unversioned files are done in a
> > defconfig (or in a package enabled by tht defconfig), we will not be
> > able to force checking the hashes...
>
>   We could re-introduce the "none" hash method... But that is perhaps going in
> circles...

> What about the Yocto approach of appending the hash to the URI? E.g.

> BR2_TARGET_UBOOT_ZYNQMP_PMUFW=" https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu102-zynqmp/pmufw.elf;sha256=1234..."

> Then pulling the hash off during download. That could also allow for checking other custom download types like applying the Linux RT_PREEMPT patches with LINUX_PATCHES.

I like this idea as it solves the issue with the new versal-firmware
as well.

https://patchwork.ozlabs.org/project/buildroot/patch/20240304074140.1537910-4-neal.frager@amd.com/
BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/vck190-versal/vpl_gen_fixed.pdi;sha256=1234..."

Perhaps we can add this to the EXTRA_DOWNLOADS package variable?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
