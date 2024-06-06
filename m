Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6CCC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 16:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4350C40521;
	Thu,  6 Jun 2024 16:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1wPWMUwTkVF; Thu,  6 Jun 2024 16:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B094240E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2B094240E;
	Thu,  6 Jun 2024 16:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64D701BF584
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 16:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F1F5846AE
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 16:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFhywdEim80f for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 16:03:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::62a;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10A46845C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A46845C1
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10A46845C1
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 16:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0Lc1BH8hXaycQqWOrpXC0vKBuKwCwTcerwvVmEbYpouZMNUvwE+11Lk9waaNNbPyXP0Q9Tu232BENKO0QLWrsc6VpgtCy8L2pS8KkUeHNq2xIvwMqfgiQByOvZ08YewVQFfWyfRQQtSxDFrE26/nsrgSm4BVt9XMcR/gt4+kXiUQhCUhRw9KHdk22KyHHCtht6EN2HyRMdFStsApdUPpynQLIp4M4LIDarePd+9PnxJqGe37jfg6ksOn4TQQx4OJPABdmaft9ZzpRTf5eIBBq2rWz2B/B5aJw8hXGaqEfWgaUjsdlpySYvKmpFIfhJpPjqwPaTWJ7dsKHsBA2PFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6qX/nhVPdipnMMaEBXO3Va0YcC+EqGQXjg3Sj+3YVc=;
 b=VH5ovQJE1yStuJjLspz5FYsL9tYY+LK7e/WOox9U5YHU+50czMVywd+P4/H4ULIiUB68V76iArVk939Yq9byPArOek6Y8UMJSAVtB21OOwcTwoOof2Nqr9F7tDm6rCbuiXW5DaMHvVL8jPy8Y0UPDAjKfySkxLUB6TCOtVegi6XLP6hq7PVvzheFjSen7kq+dz+6usmtyIk8dSNkFcZXrOFoEHLp7oGp4fO8k7rHhZI3cH2S5B0CHm9TJOTMBFQR2xqkx+ZEJiyZirJgmsZxcOioTGStj7o3E1A0X8RRjmeZ+k12HxdAO75x9pG7Kks/T1T84TMRVil3bUGRt7HjNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB8595.namprd12.prod.outlook.com (2603:10b6:510:1b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 16:02:56 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 16:02:56 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump
 to xilinx-v2024.1
Thread-Index: AQHatax9g559kmzXMUmo4Ts21YO5tLG64BiAgAAHwMCAAAIEEA==
Date: Thu, 6 Jun 2024 16:02:56 +0000
Message-ID: <CH2PR12MB5004A214F904E1B9AB3BC9EDF0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda>
 <CH2PR12MB5004460067BCA2D50F456AE0F0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004460067BCA2D50F456AE0F0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB8595:EE_
x-ms-office365-filtering-correlation-id: 8e18e4a7-5434-41c1-430e-08dc8642217a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|366007|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?OTE2SzhxTXZnTHN2bEo1cEJQdVVqTE9HNUtjL2R5RmRtMlVTRXpkN0lZakFq?=
 =?utf-8?B?b1dGaDBpWDk0THd3c1ZnTXdoNHBQS2I3NEd3ZWtpWWFiWnR6VjVoOVF1VTYw?=
 =?utf-8?B?bmJpOEpSM0lnQVpXY3VrRy9VV2VnRHNMakJaT1pPVFBoVjJxTm9yQm9EQUhK?=
 =?utf-8?B?Z2pYcHRnZkNKMHNyM0Q4VVV5bnZKLytoNkpzekYzb3hRYlVYekdYdWExbFcy?=
 =?utf-8?B?VVhSM2wwNkNvT0U2a3g4NUlIeWVBRW9HYUlrNnRpaDZyeG0zb3pFME5jLzVX?=
 =?utf-8?B?Nk5LMXpWenV2Ti94RHRDdUE3M0hhL2U3NFZIQmdtc1FuSjgweU0wK0g5S1Bq?=
 =?utf-8?B?NUREbHZma0ZnSVVDRnYwY2ZoYXNQK1k4M2hpQTY2UmxQQUc4NGpYVi9qNUpF?=
 =?utf-8?B?Y2F5ZGpybFRxdTdoQWgybTAzM3E0TjlYaFVVUy9uaHk1LzhtbGVWcXhJRnNH?=
 =?utf-8?B?Z05kbnUyTy9COEFFTTBiYmVjQ29TbGJOQitOUnlLbGIyTGF3eE5XS1Y2dzhY?=
 =?utf-8?B?amptUmdLM0JxSjVzU1VsT2ZXVmxCUE8wWTZwWVNvOTdQVjZoOThPSGwzUFdp?=
 =?utf-8?B?QUlRUm1naFNBQ0NhU1VKU2NjOC9Gcm9UaFg5bGZIR3BIMk1iRUJQUC9TTVpK?=
 =?utf-8?B?dlhLbXBmQndJdHNTY1hGNERoYWpMSk52UWZjRFRzL3hUMFM4bEFmSi9zTUl5?=
 =?utf-8?B?ZXhpa01HbXM1TFdRcWo1YmxCc3dwaXNtNmpZSVloYXNxKzZhOVJoYkc0SVh5?=
 =?utf-8?B?clFuaC9od3NnbElycW0xY2IxM1VJQTNnWjc3WEdDYVcwT09sU05WaG8vMnp5?=
 =?utf-8?B?eFRGR0pNVWJkSHA4VjhKbzRKQUVUelpyUUtKZjBoSzZpRFhxR1RNT29WRXlO?=
 =?utf-8?B?aG12dHVqaWF3WEZqYmpGUXpTczJIT3FJVEFmbGhsaEFGUUgrRXk0WStubnMw?=
 =?utf-8?B?NTZpSk9OVEt4bDJVSnJJcFZ1RlhDNmpBOHhGaDAxWHR2TWRBdndXeUg4bFVv?=
 =?utf-8?B?WFZBaEVPY3I1QjJnWWNCUDdkdnJxTXR0bDdxOFVVWEFNbGdnTXg4RitCR2Y4?=
 =?utf-8?B?YUhsSCtKQytKYUY3SzVIbVlkSFFnYmMyY1hRYmduVEt6VDNPQmh5cXJ3MmZS?=
 =?utf-8?B?UzJ3a2xVbXZXenB6Y2RUM3VSTXZtUUE2Y3dBTVdONWNuTk44cUVYUldqTVpJ?=
 =?utf-8?B?TG5MOTBCL01uK1VqWHQxblpybVl2TW5ORjVaRURjdm1uM1k4S0ZmMU9zR2g0?=
 =?utf-8?B?eCtHZHlydXBIUjg3YnpocnpGeTFWdVpYeTdqa1o5ZWgzdmxDQVdGR25aTmhh?=
 =?utf-8?B?ZHJNTXBLaXdhUi8rMW45bWtBbkIwTFhhc29NODY2d0U4QVRLR2lpc1ZPYy9R?=
 =?utf-8?B?RjlGcXlheWJPeVBTelNWWDVwQndFRi9vaGlrOXhyN0hkY1Y1RysrdEhseUN6?=
 =?utf-8?B?NDRnaTZWYm44M3U3ai9vWTFlL3FNb2NWQUxRV3NnNkFZN0ljbjJ4cW82eWxz?=
 =?utf-8?B?anNlWVBVdmpCdng3MzRXK2hoTENZTEQvZkpoS0ZBdzVrazNrOTdKZ1RqdGNT?=
 =?utf-8?B?V040c0RLaWVqWFdGSTMzSTdTUXZNVlJNT21CbWNPYnFUQnVxS0h1aVFNTGRN?=
 =?utf-8?B?UnRIblo1cEFPY3pKWjZreWE2VTRoRzRRcmZhNVVkY3d5YzBnVW9XMGxJWUgv?=
 =?utf-8?B?OWVZbG5MZVJaV2hNVHdHV0xmbmw2S2hKdDF0VVE0bjQvMk5NR29qM1E2ZTdC?=
 =?utf-8?B?SFJZcDhrVGMvc2creWZWcGRHZlBWWEFKMVJnMkpWaWhZbWdwbXgySnBHaGdl?=
 =?utf-8?B?ZjBJM29yekw5MXJiR0xIZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bS92MFZPRUlhak5WSzB2UytmNmo3V0JybG55V3gvZWdZa3NmQm5JSWZMY3Nm?=
 =?utf-8?B?ZTZldkpaelJSbEE3cHNzdU5rTlI3ZXlGcWhlME8zaDZLc3hJazlFWUFQOG0w?=
 =?utf-8?B?YW4zZmYwQ3J4Qm1aaDJPZUhkUmRxRXZkd1pQaVJYMXRsVUxoY2VQRUNoWjhF?=
 =?utf-8?B?OUU5a2RVSHhGcjl3SnpSSHpZZkNZbitCdGxKaUNINndqWGJ2U29sdVZtZjNE?=
 =?utf-8?B?NVFqZWIwdWRLQXVYSms3Z09jN0RsWk1QKzN4ZWtxWVNMcVh2MHFmS2RtdTZl?=
 =?utf-8?B?a2I5ZmFaYlFRcUxRUUt1L1UwNHB4WldtSHkrOEV5VDVENGtqclhaZk05cENi?=
 =?utf-8?B?bDByOHQ2bi8vVWJCNDJsYTN2cmUxdHJHWHFoYXIyc0hnSXgyeTZxMW9QVks1?=
 =?utf-8?B?cklsbW9ncHdnelREZEpNcElyOGhQb3VNUzRRK0JWejJEZHQ4dzRtYldJS09N?=
 =?utf-8?B?ejhHdkdRa0x6SmFoVkxnWEtNRGxoOWoxdGdnanFBR0Vscmd4ZHlrRVJic3Bs?=
 =?utf-8?B?WGFZMVphcHR3TlVkcEtaVFJOZm9TTDgrcVZMRkVXRnMvZVRERE51TzU4d21F?=
 =?utf-8?B?S3hBbXQvcUl1eTY1RVpUeW44d3FjcEwvSGttMlk0K05nSmhwcC9IYWpsTHJm?=
 =?utf-8?B?TytiaW0vVGFFUkVjN1lvck8yZlBJcjVlbVZOTTFkWjFTVCtxdDVYZ1E5aFJl?=
 =?utf-8?B?ODVsQ0NhbS9aeWthMFZjNmU2bDh2dUY3WS9DNjJYemRkZ0w2T0llMVBCWnI0?=
 =?utf-8?B?bVdKbzhGdXlRcWwzNnExbEhVVExjZWFsYnE3aURZU1h2dDJjNVJEbks3dzAx?=
 =?utf-8?B?dk9aM29KTy82UWp3ZE9NbVhpcUdLUVlWdUcvaHJ1TlJGUWVRbWw2SDdEeURk?=
 =?utf-8?B?dE1TUnBZcldvb3BwYWMraytXcEZZS3B4R3ZNUGMrWWNhaERVNi85SUNtWWtn?=
 =?utf-8?B?Wjh4Z0YrczRsdkkzZjFxS2NwakhHM0ZyajNsT0pLOTkvOFg4czB0d1ZiakpG?=
 =?utf-8?B?NGhmQk4wRWEvMUpkTTgvWHVGeSszbkVsbldzb2psZURDaFBpbWpiekNwaml4?=
 =?utf-8?B?S21zOVdIdzhYcTltZEpUejk1Yk5HSnc4MjdteWp3R25VQ3p3UkpCbVI0ZVdR?=
 =?utf-8?B?UU9lMmc1aTdxREpoenFoUnhnVXlteWUvMEFHME9YQ25hTlpkZlJGdkt6bFFM?=
 =?utf-8?B?OE1ZOStmTFVqVFlNdGFhTHdGRUF1a2tWUnEvbkdLZGFvK21IVENiRmVEeGhB?=
 =?utf-8?B?ejZHcXhvekVsZmM2YlpyWUpGNzU3VFZocE9XZTFBRW80RGtqZ1NBN0xjUll0?=
 =?utf-8?B?RE5IN2NUNGc2cmNUUUd5Z0dUK1NPeDJhZGwxZ0lZTSs1RFNPWXVneVRWTXls?=
 =?utf-8?B?TEJ0cmgrTzJZZGhjZkJrd3dLQmlLRzZvbkNUTFdRU2Zsd01SRS9jWFA1MW16?=
 =?utf-8?B?ampXbVNOWW43S1M1SHNpaTM3NGhJd0hON2dmalMxUVN0STNYRzZGVGpPaXdi?=
 =?utf-8?B?ZzdVcGM3bUxQbjNMaUVYL0dvRUh5S3AxRjVDTE84YlRhQTVKT1FHVCtXVkJ6?=
 =?utf-8?B?M3JmcVJydnRkRi9JVHp1NUNLRHA1TWptQ0hrMTZuY1FDVThsVndSbEp6MVpR?=
 =?utf-8?B?MlM3aUJOT3ZLQWd5YlcrTk1TTHpFd0NoSm1JZjdKVUxjYStkZk5seXEwWGF6?=
 =?utf-8?B?UWxVV2ZNa1NlbWVhdTB2NVJkUUVUa2RwNHZweG1UR2hwRjBGZ2ZHbG10dk9M?=
 =?utf-8?B?bndFZHNSM20vUnN0Q2UzaWFRYkdvcnNQT0w3UjVDUmhDTGM1b1YwTjk3aDRr?=
 =?utf-8?B?OTVNVVZPZHF1ZTNJdy9SbmtlRTV6Z2dXSFpzWGFsazZINUtQWm1kbTIzZlJD?=
 =?utf-8?B?SmNLTHkrcnVRZUcwV3lhaExTbnp3SUVHN2h6RzN6YmlyZHdHQXlpbEdpRFZ4?=
 =?utf-8?B?ZnkzUXZGV0cwY1d2RFJTeXFpb3NhSmhMa2pWU3JTS0ovSWJjWDF3ZGRPbEM5?=
 =?utf-8?B?N2cyNHFXbWVTMWtkTFFIVFhpbElrUmFkR0tPeFNUeTErTDNoZGtSczUva25D?=
 =?utf-8?B?VlpFS3Z2c0Y5MnBSZzNLMmExWlFzdjgwWHNId1ZqVGJIZkhOWUdCSmwza1hp?=
 =?utf-8?B?OXZIODVYWnh1R2luUm5hV1FGUCtib0pvUW9TR1d3dnBRY0kzQzZRT0RvdFBj?=
 =?utf-8?Q?GRx7EJeoRYO+jjGEGT4XPqY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e18e4a7-5434-41c1-430e-08dc8642217a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 16:02:56.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPOEHmR5bRReEX+2CJuU4zrj9cRDBfhlxfMZnk2QjKqGJbi+d3238yaNqe9I6QIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8595
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6qX/nhVPdipnMMaEBXO3Va0YcC+EqGQXjg3Sj+3YVc=;
 b=RMI3kVI9abG2bbWdG1kZeYXAde1tMH3q3gvgj/RRBMyE01YQbaZP4vZvl5WfH37mF2H9cCb3v5sRcw7GClkGFxzOPRzQh3LOIqSOMiaZAC9inYx2fuxCOMorSPsCqkUN3KS0JwQxMqngHrrZ3XjeJ4w88fYoIVNDvv4pd1nxsUg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RMI3kVI9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I've now applied this series of three patches to next, thanks.

> However, while applying, I noticed that those boards do not have
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y (so my post-apply hooks triggered).

> I wanted to add that and point to the newly introduced
> board/xilinx/patches, but that will not be possible.

> Indeed, those defconfig use BR2_TARGET_UBOOT_ZYNQMP_PMUFW, and that is
> added to the extra downloads, and we would need a hash for that file.

> But the filename is unversioned, which means that we can't differentiate
> between pmufw.elf from yesterday, the one from today, and the one from
> tomorrow.

> So, when arbitrary downloads of unversioned files are done in a
> defconfig (or in a package enabled by tht defconfig), we will not be
> able to force checking the hashes...

> Of course, this is not an issue directly introduced by this series,
> which is why I applied it.

> Still, for this case, I wonder if that would not be better to intriduce
> a new package (e.g. boot/xilinx-soc-prebuilt-firmware/ ) which would be
> properly versioned, and on which uboot would depend when
> BR2_TARGET_UBOOT_ZYNQMP=y.

> Luca, do you remember the details why a package was not introduced bacj
> when you added the ZYNQMP PMU support?

> Another solution could be to apply patches 1-3 of the following patch set which
> create a zynqmp-firmware package that will build the pmufw from source that has
> a hash associated since it is using the Xilinx/embeddedsw repo.

> https://patchwork.ozlabs.org/project/buildroot/list/?series=397588

> I have to re-do this patch set now that we have bumped to 2024.1, but I think
> applying this zynqmp-firmware solution would be my preferred method of solving
> this issue.

> What do you think?

By the way, is this still allowed?  Perhaps we could use it to skip the hash
check when the u-boot.mk downloads a pre-built pmufw.elf/bin?

BR_NO_CHECK_HASH_FOR += $(UBOOT_ZYNQMP_PMUFW)

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
