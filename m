Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3C8CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 08:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B5C083DEE;
	Wed, 10 Sep 2025 08:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBqCTsbEE545; Wed, 10 Sep 2025 08:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E55983D9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E55983D9C;
	Wed, 10 Sep 2025 08:03:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92D96234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 08:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A2183D9C
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 08:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KB3iUiMe58qZ for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 08:03:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::620;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C405183D77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C405183D77
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C405183D77
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 08:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O04VGdUll75DY6ecsHsorXTOiR9QTqj5O0fAl4WkqvOFZsGZwxBDuO9YiZXAKiJaJYm3wQ0cOz+IxiykOhRA2HwCuwnMFhtLN1RBtXS58mv0AmlbEI40mXj9ythPsVN0HjQQKBheTZg+oBct0fuf4GpR9oE+s1ikXBhWlx5KrF+wRiYqdAuJaq6nS/bqeG7THK24FYh1jsqNsfuYJ99K8Vw3VW3EcH7Lejh+OcUT4Bhrrq5pm/WtymQuFvel+nJJE4karGQk7dXuEn8vMUquEZm5V10G/81g9vcbo/gQTF5AuWUc7icHGGSMuWDP9h17J5usObR7chGSUkku5eHw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcBhWRiFtZz3mbl1MCf7ifOphvaDkK/iXhhiIw3Dw0k=;
 b=qoXqkkpNvg2M1HOLFbZa/jqrjdVFZIU9CE+wQp4OLj8adnHSSj0Ey/8cozgsm4hGwlIMxAM/8qLdNDRzrVL2x3p/i5OxEvho34LQ/t8hnSWqO/n/ukTzCmCSBMAYZgOdSsowR3bgd9XrleolBXYU4L6ZkNJnpnxBFq0W/ZqmqJ/3Kkz7fCuhhIF0k6AIiESMcYEhO/XP9u60kG6iegpaI07wlBqw6LA1EGs9rJxDSszrxCW6wAGc+mKx9vWp2OLZiMIAZ73J66Ly8K/OVn8b+85cXKZs/u7/vaKy6Yox3dldDbpJjn0kkmJ8OlS/OC/a4h3Gl2Z72XIr9p/FdsDobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 08:03:33 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:03:31 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/4] boot/xilinx-prebuilt: add support for plmfw.elf
 filename
Thread-Index: AQHcHeCu++bnd51yQk2UTFTm1rWvd7SMEiUAgAAEfKA=
Date: Wed, 10 Sep 2025 08:03:31 +0000
Message-ID: <SA1PR12MB5615F48F7EEDCAFEF42E13E4F00EA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
 <20250910094600.67ead264@booty>
In-Reply-To: <20250910094600.67ead264@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-10T08:02:02.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH3PR12MB9730:EE_
x-ms-office365-filtering-correlation-id: f01810b1-aa9c-479c-d8f4-08ddf04088a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jTXWLikw9vGJtTv/VHJS+fGhh3V7Z20qwFHkSIHKPPuVxBXH4PQfmO4W9lth?=
 =?us-ascii?Q?x9CvlKmw6pRBuqwoJ+fZ4yIcsU0HAb4etVcUALgjRaL+WbMID6u9s6lwnXso?=
 =?us-ascii?Q?xYL1dmdek+vx2yzpV2eFrXEGuQgq/TYI9Ea519MGCuGZ5l9U4cOkVHJAi/pW?=
 =?us-ascii?Q?QgCW4GFFxAuWwxdnJPesm3R7VF8590DoSdaBuZ3wfAzwOjHXLsKWYCST6QvL?=
 =?us-ascii?Q?yZTEMFU48CBfXRPjgkV7+SGZeBGQ1UaXrg8c/2hlYnX5uJx0537WL+KPMGBj?=
 =?us-ascii?Q?18de4x4iiHEymYAIEqU7UNkjTTiwGwjAdYcCMIOcPzLjbe7o5HJeT/9rUo0A?=
 =?us-ascii?Q?dBCKDeLxfci/ECR6P3toNLvj1ABJFUh74hchJ+VBE5YXulA4hk0B2vPHH0k3?=
 =?us-ascii?Q?FKEMxWczbhGvMdVfBP+T2d3pqyFSKwmixVzpz0L3hgCUM2xL2jHHU1VpoD1L?=
 =?us-ascii?Q?nEH2fwsGIWfd8S24sRV6J5FDSQHHIM5LkXjhAT5sXEIp/k3UZYvsKusNtKwK?=
 =?us-ascii?Q?ptNTMHf3ptdMu3Mdr0hilvz2E9GC8r7Q4tWetQysPIbf5jOZKVPOSmF31YVy?=
 =?us-ascii?Q?e9XHhTnvoiCxGO5l4rNkHmDBs2kjzSk1QAK+9LIHrpLoFJVpaV+0pUfdpbz3?=
 =?us-ascii?Q?zt8x+d0PFf+xCmgfyGFQpRSKTIbv8wUs36Og1vYgSzx08zcC1Ytwqd2pEcl4?=
 =?us-ascii?Q?XbeyMMke8w+fdGjG707fG4mAClmVEeRRR8XrvuygYb9++YjtksPac5sCJ6I5?=
 =?us-ascii?Q?2+U8AYEBJ0V7GNdgLHoahhyboMZSTJXPL7g8UZMFFgFX7sHqhfHIZc4jlGPd?=
 =?us-ascii?Q?EW/RQKbk/SCgcfpFKyWBfmO/NmfniiFJSoeidq5WUjt95nJelB6AAv7DhYAM?=
 =?us-ascii?Q?PSE4mqL5YVV5O9xYfmSizIcGQzkMa0tCF1nfk2BmbQpixG6FpMqbKpAv9l0d?=
 =?us-ascii?Q?V6O9ahpXexy3Qr1wvItbkQVDXiDFRU51+pNBaX7FNnqVmrchNrmTE0eLaKdr?=
 =?us-ascii?Q?4RPuGYxr8S3QhAPlh0Ue/DupnVSUGEi6TepPo15Iv4FHdru2Zs1FQzg4aJNI?=
 =?us-ascii?Q?8QxQFpVup3fwIdncLFusjwrrgZ1cw4C1bWs595djDa4NmZd65MI42VouCR4q?=
 =?us-ascii?Q?lwklBdZM8WA/AVJ7furcFPd6CioIrtL1rjYyTnxF25B3hLe4hNSCh4U5+v4d?=
 =?us-ascii?Q?4a8875GakI1a4OhsUx/gOnMA4bjI8l/6vIgLXtx1E/Jt6ciOnnMkLPh93TSE?=
 =?us-ascii?Q?+/dFSrJAAE9CzVT43AB7hFpPXh7Np9i9oamDr7jmLFAJq/phe2ba52dtcvY5?=
 =?us-ascii?Q?H9AGGlbsmzWc36c9VtwdKsfWxl7CxsUURTMuZF6W6zFDsJSRhOgl4Tcd/ZWx?=
 =?us-ascii?Q?ZSr1LsWRSoVnmg+5aIs+q1f4Qewv0cTc2zvMQy48tZFtY1nrugTECa1nhjy8?=
 =?us-ascii?Q?IlxHK25xLK3E4BQiU6Tknlp6hG5bjWv6uwHHMSPxaSMMitFY9FWb4KsfOIjV?=
 =?us-ascii?Q?O/Jx/W8z1grRntscCp2J+fzKaegn4vTYyHCs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T0PcsV6aDxkKRIUF+qqd/ZmCgnVmu1iKRta7fhy55UGH2QrKhALkkPv0D+Lu?=
 =?us-ascii?Q?qbMLsoAlQhxUHGFuOm6NbxdEr1dd6lUf++T/FZWi1Ji9cHa6KYzBhm/7KsKM?=
 =?us-ascii?Q?rVcASiUXFthZANFlUsrXcb9T608AaiNwbH6Ph8Wc5/QXqhdFt46IFZQaAU8G?=
 =?us-ascii?Q?JoXPULhmNqVLs3mruvbvKMwXoeepcUMcSmuH5f/xFw8ZsTV4zb/uUsCbM6lB?=
 =?us-ascii?Q?wd/hbUu+AcxJg3SUbZlQqnRSX6qSQzT5KVsuqPeE5IDms0QdJ/2A97xZ4Zwj?=
 =?us-ascii?Q?LlehPLfqKoa/feVftAOmEUhuq+9lzE5wZGoyh9pRki7fd42/zrcHyN/+0rqs?=
 =?us-ascii?Q?UgLiwUjCyGXA45siLLYB27QaelDBgHcao1LZPNDsqEXw/2InNTzsLncuhCg+?=
 =?us-ascii?Q?Tyqpz/rECbzPKyWom0Har18ukzzImvGM9rgGM1dX1pEvJgcummL0xGSSJTBC?=
 =?us-ascii?Q?Cy326DLs19G5tjJXef4Bt2JTnMfnVI3sQOVPRVoIDQfZkJbWWs+8pDXNsSh9?=
 =?us-ascii?Q?ph/MssxkKkO7u01yaEvCsZiqC7SxbbjAmRIO2N97V8gga2md5LqAdwj4NmFc?=
 =?us-ascii?Q?wnW+vcAT11WbU7ZyjIOooR9WxmhaF+ADTG8w2xMu0ZZNrLBBWoGDg1NW/cWn?=
 =?us-ascii?Q?L/BcavosIOi0Tumijic2n/0iE1/di9SVhSZk4xlwpOLp4JDtL9BoWlt3PVZ1?=
 =?us-ascii?Q?ELHefpQ/AGfbqBFyV5YALzLKnwHbHa9nYrOB+dovuziZRZ3ccKPT5z1P7yTH?=
 =?us-ascii?Q?bWTMvs0VxsoRs2oFGv07h8GsFxkuH1rJ8P15ulJ5Hvb4bQdqkY3csejr+G5a?=
 =?us-ascii?Q?RvgtRhwmpWE6hLJTh4B8hN9TZEWGfnRVET6L7p4NRLFIj07xwtRutS9f7P+T?=
 =?us-ascii?Q?6FeVKY042s3Ycz+YI7nEePrYJ9izvM8jV6STAIDxN6sTYfq3T5F2gw6MSM8X?=
 =?us-ascii?Q?rFX3ZpB8kb1xfo/Yg5XFU+/jA7ymHJF+NbtLxrG7+dXirjdgXb8mqXB3Jiaa?=
 =?us-ascii?Q?ULrqLNiMdAoaQCk1nCbS5rrtVLaXmTxGL1XuvmpJYh/aF4chPg5uPCYEg8RW?=
 =?us-ascii?Q?h6XEPPbxMKg2tL8Cis2skOb6xNi9hlRU5X8vyfhS5phTHG2Z1mluOoR28/zd?=
 =?us-ascii?Q?utYQxi7vjDICYQ0SOh5Sri843YwR3s3deDC2tjrIx/7wu2unG3poWXIzp0pc?=
 =?us-ascii?Q?umj4gs/ol2vVuMoNYEc5fGDpvLlKyZ6Cdix460HlloOJuW4Zn1eAWlNM9QTc?=
 =?us-ascii?Q?fhh4Q/xFv246+DyLWWPEy2Xkp1YxUIZIrIFKTwSUHmIhptXgdK0hiMxM6UkQ?=
 =?us-ascii?Q?Km02KheQ0zG3DVsE+070nqfKvhh+EM8cPt9I5X7bvtkcsGK0Vk16NWED6pea?=
 =?us-ascii?Q?4Du2ISpDqpBAOrX7sBBXhpmkFVeEDUizyC3Bjcc4e0nHfwjDrYB5bNmIhnjs?=
 =?us-ascii?Q?9mt4VS+1SmR1GZvFXVGUD25Oiv8Yo1/jqvuQgDGLQeYv6oQ41/j8ozsTDSGf?=
 =?us-ascii?Q?/JV1YM5ivIS5nKxjfG81PxsMZdDVe6ty86fbOCL0qhGn1UD6xN4KEdoo2B2y?=
 =?us-ascii?Q?IGM5BHpPjVThMYWSvbY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01810b1-aa9c-479c-d8f4-08ddf04088a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 08:03:31.6860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7TNvcO06V2IsBtdoBKx/9nxT4UiBAoSlvLY05IYYA7xSCjkoIpVSbsop4XpCsakV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9730
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcBhWRiFtZz3mbl1MCf7ifOphvaDkK/iXhhiIw3Dw0k=;
 b=nuSH6gBbAGDnx9/i70kc3Jmd6+/SYFTukKRTpZXgzUBGUOmIUILLo2269H0CbAZku8DN2bQS5M+Y0o6SDfkZTAbe2xRdT8EjNlfV3fzR8kUy9qe/dJm6pzyga7AWdNBUuQ3MtNO9AOKYYN8fX9Ui+zDO72Ec4uK303eOnQRSs6w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nuSH6gBb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: add support
 for plmfw.elf filename
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
> in the prebuilt binaries repo starting with the next update.
>
> This patch updates the xilinx-prebuilt package to support either the old
> plm.elf filename or the new plmfw.elf filename.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I had reviewed this series at v2, apparently you missed picking up my
> R-by tags.

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I modified the commit messages between v2 and v3, so since the patch was no
longer truly identical, I did not want to presume that your review still held.

Thank you for reviewing again!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
