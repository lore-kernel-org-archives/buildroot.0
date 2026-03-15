Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33794F3026D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C3780E44;
	Sun, 15 Mar 2026 15:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFzMjjkIOtCt; Sun, 15 Mar 2026 15:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F06E180E5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773588414;
	bh=9YKTXxzDaZm2UUaoyQX6wgT2zZbEntYPo70d4p9Wd2E=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mWeHG/jd8lQcyQQabFIFvmolDHnuxpXkn2JgtZTrKVcBDBsUAXHHWW8FimtDDWeWy
	 rX0AQfQhjEqSh7fk6Yay32eTdGvIqi25J0GXGe+kCKb9GXEcGMY7E1Jc2Sad+haXZG
	 BO+7X+G+g1S2yCQdS4HXtwtdYOlffHlca6XveO+AzdVT1aZvWN53XT2I525zt3PDpR
	 FLS7I5cc0AqMaL1jMH6T/afGbgfKk+GlKFfn1awK4kSHtdc/74ClCS/G4HnM+ALnnZ
	 Yw+udz+FEQ16/NBFSX5rzktkIWhc6CNwr07nZ6gujIzppoMUJ+1kQJVmob3SbyDWR7
	 fMvKrYTrA0dGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F06E180E5D;
	Sun, 15 Mar 2026 15:26:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F19B4201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D79E580E5D
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeAC7hccXwOb for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CFE280E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CFE280E44
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CFE280E44
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGurxG0GDCSC7F2gR579fn8n1rZKSFNxpjT9tEOxMe0/wbw/0UbSUpciB6hVWm815LYr/6IM5Dxse4uErvPFENU9bOczy/sx9GKYLDzFaW0v/YVcVei4V2TGZyLDKvO16yr10VjgHlw0MyYlDz1pECYPC70goDBYoNiPiTdIoYs8pv3ctmxcJ0Mn7pVOSi3t6CIO1izTH/ycvCbSTxmDpsH+owrTnOrlFNhx8M4PhdRKw1vwUNR/XG7NO5ziZxMbkbaon00du7IVd1U8M1GSIqxWKP5BBsJCXWXZmxVT2Rgl6IybtZHTUeJ3/5nAhcFrdayP2nJILNBvGUWXuErf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFu3BiuOgHy4qDLik0w8ELET53i4wGRYawr6WsuzXjw=;
 b=hNpk8vCKMg/U+QDbkVEfpYqLQyTO0meNBAryydkdpQYFatIoEbc9OioG7V3ZAHKW132/f0zU6GFWoLH6KRA0ZzPE7rzJsqwtE1dNHXbr0kqIzIYS1EQt3KtACicqHMdKUea17rGc+AlikqVk/U5HfGji1YentzCXEvAYU7AWk64Psq2FpxswooZ/bER663ZI/Mip58BE8h25gskE+Ir0UE+fjuI2sOKCEj84pwBwsWeDFhsWPDTVsiDr4mjZwNre1M0fPERnKyfaWwjO5k4u7DjBfwpGp9APIDMHpl6dnwHRtP5JSnDCPdxtAp7rFgCOifrA4+5o1G6Zb/WWuI9e6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Sun, 15 Mar
 2026 15:26:47 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9723.014; Sun, 15 Mar 2026
 15:26:47 +0000
To: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 2/2] board/versal2/post-image.sh: add custom hardware
 support
Thread-Index: AQHcr5mnSim0eAK+x0mn3yR3/WUeWbWtEdmAgAKu0EA=
Date: Sun, 15 Mar 2026 15:26:47 +0000
Message-ID: <BL1PR12MB5032F8817F6224F48071E04CF043A@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260309075127.801847-1-neal.frager@amd.com>
 <20260309075127.801847-2-neal.frager@amd.com>
 <f744e2cb-bcaf-4db1-81ea-295c41188b95@smile.fr>
In-Reply-To: <f744e2cb-bcaf-4db1-81ea-295c41188b95@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-15T15:25:18.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|LV8PR12MB9360:EE_
x-ms-office365-filtering-correlation-id: bbebaa00-fa99-4fe5-df67-08de82a74583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|56012099003|18002099003|22082099003|38070700021|41080700001;
x-microsoft-antispam-message-info: nJWFK+6LSR6vac+m4PqNhhveRMEvZe11piUUV5ytSrIztw2SMw+LT8HTfyVS2VwV2fEldC6pueuN26cQMAiAzokmCGE/v70zmzU6HPdGaYHWpKaQjw13Axmuqho20Eo1gTIDJZlPSxNtNArlt1TBBbLv8uhiVZkEyQYa/q7JA+5xEYghPEzqO3viMlvpTIjMV66gPMfU4BdV8ZCThjMg8SPjxiuuMbNZ9JwcKSSL8o7VATBUcSq+UJXS7Qf+ya1abQqEM1U0QDuMzAUdiKcyeZUQJmI7lHkbsIDUiqAEt7Qt+oMG0ox0eNU+52fdLv1gJEsUggQPTqwBKyqqjwKVVRmVOIzQ2aEpakfYp+5JVzhaDbtYMncSfka0bMOFw2WEFGqjVHnPb+B5dfqmKPVNprx+FGCrJpYrkQBin6pejcefW6Khl9CN0ldlQBXOryqQ9quobaf6E7I0+70kfOFAd7gmTU7dTrGL7KqU+tG/at8BijoSxwJA1kil716z8cduBH044rPtj6aeNccvQzkE+oq3Zgw2So3yIjBzaO4kdaOkNc4Jl0pulQPFiMkrJ+QNxqlqKr/JDE9RRj/EQHRXVIh42mJxx7p9Qid9xVo7oDd7JnHbMFsBPARBcmFOGeS8xYY/GN9yAHmZwZUakc/+3yZ+rP/kbDqcf789jQFFVTNCHQyaMgGfalx7zT+lQXs/NO47W7DoF0u7kWOF4NDdEkh371CbzDJrzGZbpyeKon+ZvVKscyMbP3pA3VAnt0MEZjtjPvD0zEfigHLPPkBFLKKk/MnDNwq1Y124oOUSncaFgHQ1WVvqK21dIdfC0sHx5G9q5GagRGft1021RBibfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ynk4dStvSmMxb0tybk1HeFJOTzFCcVpJU0RTNWVzU09jZGZwYjZ4SFpkcUxy?=
 =?utf-8?B?Tmx4YjNKVFJqWkk1RDNob1k1WUQ5Q3dkSkdoMUVLeE1nUHRiSjFwN1h2cVVV?=
 =?utf-8?B?YTI3MGc5Vk5zVzBKUVFnUWR3OFRod05oK3pIV1l4MzErSDZaWTY4dzF3UFVz?=
 =?utf-8?B?UlBYV2cxWHU5Z1NaK2ljRTJGWEVKalhzT0tmYTllcE8vTEJ0aUZGSVVPazFZ?=
 =?utf-8?B?aXgzTVh6ZndNNWFnVzJUU2U1UnV2ZjNBK0plZkh1cUdGekZJODNDMzBwdTdu?=
 =?utf-8?B?eHZXeDZNLzRRckg5ZWZ1ZFVQckpUWXl4TWttUWgzSXZNek01WE5FbWtaQnYx?=
 =?utf-8?B?T3lHNDFEbXI4YkFHR1FtQ1R1cFVicDlDM1NyMVByZDR2dGM0YXRMcEhUdzRO?=
 =?utf-8?B?ZHlDQmRzNFA3WWhydDhGQ1VTd0NRNFVpUEYxa3Z4RytTUlRnTVpCb2E3ck1O?=
 =?utf-8?B?WkVOQnM1Q2twVGFvQXVTanhyZXc5MDdjU0R0TTlYR0VhekN1b3ZycXR1OXQz?=
 =?utf-8?B?R1BaazZtU0VmTXBJMmpBTjFJWk4wTzJWVmtmMW9mbW8xSUdFbnhyZytCRlB4?=
 =?utf-8?B?MTByRk1LVmRrajBDSVFGbWlvb2FrejRGaGdTbFBudUthRzQ2WkxZSk1QWlh3?=
 =?utf-8?B?Umcrc3hJNTR3T29HM1FqbzIwT2xYNE0rZk9PODkwUUU4NW5LUXlsL2dDR1NX?=
 =?utf-8?B?MStONHhRc1lraFR4bHpPLzk3aGtGRW12RWtxbWJuZWRZNjNZNUNicnpSQ3RM?=
 =?utf-8?B?S0lxU215cTlETUZIYW40UENaR1R6WDdKZUphZVFKelhzdURLM01iejI3WjVJ?=
 =?utf-8?B?QW9pSGY0Mmtwd0l2YWVkMjJMU21CRGRvU1lmTmNpUmRoaEJibzZVNWlWNlRN?=
 =?utf-8?B?UEMyMWRSbTZhVkxtcmg0L1hrRXJjdnZobG54Y2dWaWY3azdXWWhUSGJMblRV?=
 =?utf-8?B?b2ZmUzM5ZURTYmFZcElDejdPckRHUnRoZ0VZWlRHR1RkZFVIMFBXQ1ZsQkFw?=
 =?utf-8?B?K2ZJWGJMeEdJY1R2WktyRHFZSjlmVlBtZjFUODRIZkl0dlczREZXajVEN21L?=
 =?utf-8?B?M25ESjQ2bEE0OUNoRzZrOEVjNzMxQXNTQWlBeFVNTmpRL3VRWEJTeHUzdU1C?=
 =?utf-8?B?VHlobWc4K0hjekdHdUZMeHNVVW04RnFXanZGUVZaYkJ4VitUbDBQemdNMk5y?=
 =?utf-8?B?ZWczNmh2YlNrb2d2WitSOGlCTkVmMXd3ZCtCalAzVzFDOVREMHNDTnJJYkZV?=
 =?utf-8?B?TWxLL0hUMnRYR0ZzYmFjTC9jM1lJTzZ3Q2JGZU13dzFDWEJjQjVLNERlU0d6?=
 =?utf-8?B?dUVFTzZYcmluWVVkL2t0T1ZFa2luSzV5aU1XTGE2YTU4cGdub1VKNHVoZnM4?=
 =?utf-8?B?enRwelA2dXUvUHRxelJEWS9iQ0tSSDNBbXJrS3FzbW5jalVWVUFmNCtMNDJy?=
 =?utf-8?B?ZUp1QzIyb0pLSm5oMTV5TnYzbElha2ZSNDh6aE9NV1FqNUVHdHZ3U0dOc3V0?=
 =?utf-8?B?MTdnK0hzSWxVUksrSDFxbW5IMG1FN0NpcXpjOUdIKzJMdGJtWFJibHpPYVV5?=
 =?utf-8?B?Mk5oN3Z1c1RSMDFvQytyR2IxczhBZVpZMXVZZFM5MDRLN1J0OCtCUGpFWE5z?=
 =?utf-8?B?WEtUVUFHNUVaTTRrbFk3cjJ0MTYzeDlaYWJndXZMVEExR3ZSa2pCeHR1M2Ry?=
 =?utf-8?B?Unc4OVlkN1RQbWdCZC9uKzlzc21tdTV1U0xTN3MyQTBkMFNWWE85WHpQdm5q?=
 =?utf-8?B?bkl6WnYrR3BuNkExYTJZMGJzaHZlMWtaYzdNK0pSZE5LYVNpRTdEZCt2ZDBC?=
 =?utf-8?B?MzNOMzBzcGpzTlR3SGJUZnVSdk5HeXhLVzFEajZla3h6d2FBVHVTQ1BwTkZL?=
 =?utf-8?B?d2tYMFZ4Q1pFeTZTNXRzY251a0tWL3A3VVZTM3JHTmM4UFVldnQrV0V1VzJi?=
 =?utf-8?B?bWR0a2FObWpzYUN4MGcrZVhBbkVuTDJTTW80RVE0VmlOeklUczZiRHV3YVM3?=
 =?utf-8?B?K0VDSVpkWGt5L2VJa0RRTWFnaVc0OVBCaHJQUTlvK2dUSTJMQ3NoZENPUFpj?=
 =?utf-8?B?SEp5TjI2aGNtOUpwcWN5TXRGUjBBRVRuTEV2UkE4M0xRbGhEYytIcFAzaEJ0?=
 =?utf-8?B?VmxzTEZXc2F3aW5OWis4R3J0VWdaUmdrV3FqNkxWK2VaWjM4MFd4RGFtNEhR?=
 =?utf-8?B?a0UzYU9uNVVMdXVJY0RvdXphNFIyZ2IxeXk3Q2ZUM2srM0FmNUlsQit0MWw2?=
 =?utf-8?B?N0E4eFI0YiszU2lBMUxSTitxeXZTUEJnZUpuYi9Oc3VxWGJtbnF5RWJ0RkFT?=
 =?utf-8?Q?Awzhu2BoYKYlwnxH6h?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbebaa00-fa99-4fe5-df67-08de82a74583
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2026 15:26:47.0547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7mMIxCkv11hFtdhL7gUDoy02TKKUSB7e5B7bSUUgrH9ZOFa4ZmqEjaAZVcx0Ra++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFu3BiuOgHy4qDLik0w8ELET53i4wGRYawr6WsuzXjw=;
 b=qdQHYMD5H0tBVSueWyIkvj+dvA1Mn/0svBvyLQ8rnuh2i13UxewR+sHQ/yaYNexSVl5wCJQ08JP0R+5W0B+rp9Rc4vind4ANxvIjThKYi1HNJGj4O+NviVoVPBZDTKrGzMwQ5Q7/hVT4Q/d5vmABOfl96QJ7AdZ3bVYUK0p5C08=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qdQHYMD5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 2/2] board/versal2/post-image.sh: add
 custom hardware support
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Simek,
 Michal" <michal.simek@amd.com>, "fiona.klute@gmx.de" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Romain,

> Users will ultimately need the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config to
> import custom dts files for custom versal2 hardware. Improve the post-image.sh
> to support either the default device tree which comes from u-boot or a
> custom device tree for custom hardware.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - new to patch series
> ---
>  board/versal2/post-image.sh | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
> index af50909fb1..dbef33db28 100755
> --- a/board/versal2/post-image.sh
> +++ b/board/versal2/post-image.sh
> @@ -1,9 +1,17 @@
>  #!/bin/sh
>
> -# By default U-Boot loads DTB from a file named "system.dtb", and
> -# with versal2, the Linux DTB is the same as the U-Boot DTB, so
> -# let's use a symlink since the DTB is the same.
> -ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"

> +# By default U-Boot loads DTB from a file named "system.dtb".
> +# With versal2, there is no default dts in the Linux kernel tree
> +# because the default is the same as the u-boot.dtb. This means
> +# it is necessary to cover two cases, a custom dts or the default.
> +# The BR2_LINUX_KERNEL_DTS_SUPPORT will only be set for custom dts
> +# files, so it can be used for checking which case is configured.
> +if grep -Eq "^BR2_LINUX_KERNEL_DTS_SUPPORT=y$" "${BR2_CONFIG}"; then
> +     LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
> +     ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"

> This trigger a shellsheck warning, can you double check?

I fixed the shellcheck issue and will submit a new version. Thanks for
catching that!

> I'm not sure about this change, LINUX_DTBS may also contain a dtbo.
> What happen if a devicetree overlay is built?

Yes, I thought about the dtbo issue with LINUX_DTBS, but I am not sure how to
handle it. I can imagine users may want to apply the overlay immediately and
build a system.dtb that includes their dtb with the dtbo included. I can also
see the use case of wanting to put the dtbo in the target file system, such
that it can be loaded and unloaded at run-time.

Since I do not want to assume how the user may want to load additional dtbs
or overlays, I thought it was best to keep the solution as simple as possible.
In other words, the solution will assume that the first dtb in LINUX_DTBS will
be used for the system.dtb for booting. It is then up to the user how they
wish to load additional dtbs or overlays after boot.

Best regards,
Neal Frager
AMD


> +else
> +     ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
> +fi
>
>  BOARD_DIR="$(dirname "$0")"
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
