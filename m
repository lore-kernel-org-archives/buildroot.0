Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C0C021BE
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 12:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA646081E;
	Thu, 27 Feb 2025 12:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwI_soK-vZ5t; Thu, 27 Feb 2025 12:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5FF360836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FF360836;
	Thu, 27 Feb 2025 12:58:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E64D568
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 12:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B694440288
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 12:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeWzkJXYi76s for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 12:58:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C97E740199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C97E740199
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C97E740199
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 12:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foJwPO+bDPw4eYf9dMNcNF+XRyhsB5iObXNSaizuUApWFl4lHr30OMGGQtZbmwKgwV0KJmuJig3oVePsWbjGumQ0vUaEJr9z22RV/a8SmbZVEe2Kfexyv61e5OMs6XeUEpmR/94Db4XyzqV+wQaZyA4ZOETup2Zd24dp7ewFn0SPDp382gdtNgesGtn3DFdT48/2/wdh+9izHy6mhVP+q3lqm6llVH8JqLkxpQMPwlM7tYD+4cXBx9CpOyHadyHCD1fcvCWrg1XqxRjO35M+ivb88gyw0RdXvenCOPYOAgknU86V5bSeKeezyyAaOczCbKPytmOpCXWIp1t3AZusJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhX1sZdUafRxPjtG1LXZnQlcsDBFe0q6d1TMQH5hNT0=;
 b=iowe6xww6lahFAe0pmeViPsS1APwMSkO/cDhfLc33WulVFy3RrukWQRInbNZjNfLoQnrLox+Exm8yxQ0O3qplrdBbgwilCgC4NvZnmbvuvsTDnLlvVuncGmVTan1UKat1E9ISuhGUb/t0fxz3O19CIFrWG9GUJtMXWPBXsG/KV/nouiCyy+NMWIK15iY5iGjjc7APHmAtJLlWYdhtkS+9yAgfgqHY6GvVC6AhQqy6nmF4to2F4uKvuqzMCxtVv0kuE4Hu3oVkkQyO8TcrCbHoTuQs1QEj8JXDGywrVesQ9IqedzaLcgET9p8itosqPsusqTk4iPEQyGrag3O9UDXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 12:58:34 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%3]) with mapi id 15.20.8489.019; Thu, 27 Feb 2025
 12:58:34 +0000
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, Arnout
 Vandecappelle <arnout@mind.be>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: toolchain-bare-metal-buildroot
Thread-Index: AduJFiy8oFc3ROBmRFmVSI97y0+mlQ==
Date: Thu, 27 Feb 2025 12:58:34 +0000
Message-ID: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=e92893cf-faba-4947-93bf-746fe38efb7f;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-27T12:49:21Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS7PR12MB6335:EE_
x-ms-office365-filtering-correlation-id: cbace0e4-e574-42a5-e6af-08dd572e71d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?skE5pp+a6AfJyuzsFOC+TDqFhoAnXGubp1daFHj+S9O2bcrZx60Wo7yOwHHJ?=
 =?us-ascii?Q?qsf/tn3d1wkk2cZFhGDi8gErepx/iolKnQJBP3BoiIOswflFsOhcqbVl80us?=
 =?us-ascii?Q?FOrKzspyak3+dy8MhgsNABqOXg/0r9pIs4/2p9M6sShpwJqOL9TW751k6XWo?=
 =?us-ascii?Q?1XAo4tcfVab8FI/p5ZNebM8She0hiqK1fiwlhZ42CTlOADrkFwGLhFYklAfX?=
 =?us-ascii?Q?mfFEyE7oCrdlMMb1QMywrlned/ezFBoXxm0eS36TfexfNuHLN7kA604vpEmx?=
 =?us-ascii?Q?niBCVfKXFzXbvcMnaN20d/3JvQtNCp9Tgi1v1s3xxtVUO/ld6IccPQmNkA1/?=
 =?us-ascii?Q?cYhf+RzokN6rmxXaWMzj4DhpgmWClGx9PLEUWBinkWXgrpsqBZ5oyf92Ens4?=
 =?us-ascii?Q?m6kF/URjQUFuU9/sFHCrSr7nTova5Wgpxb4LnZVAg02t6riQ1GeXh2cPe0yd?=
 =?us-ascii?Q?J3ySxWbG+5L1QTUvARw0p2UxPhXTjMpnpEmKpqrmdYxV41OXbo9NbYOBM2dy?=
 =?us-ascii?Q?qinRvCnvR+jBi9wFqO8/I9CiHrr/FR9DeNMaoOHTgeX7K9s43x4+MASbSMjj?=
 =?us-ascii?Q?roYKuZ3/+aZXcPAAe47e7g5cs2wej3Bu1Fj5nom6d+WTNk3ZbA2NE62iVdLH?=
 =?us-ascii?Q?zXFDxyNXO02hkgHkfLTzip6Zf5eztpsgIIjx0KMPqBtIZW9vwgBCIMfn7iUt?=
 =?us-ascii?Q?sTf1XeDIROQhMWDB1D7Wfdi2AB8n3B9bHBwZag2ikKVDVocBU0LHcjOIFn5U?=
 =?us-ascii?Q?ZUVvIBi4xkmzO0Ea/fe7t3dKm3K9ohZ18/fcuMwpr3UBt8RBL2BJNfiwrehl?=
 =?us-ascii?Q?wndTqKZkbcIVKyT2z471K69QNA1teyJr3AH/XLNTch3SWLSpYsICM13g7Y8G?=
 =?us-ascii?Q?3GOiQKMNGqA+LTL0JseFpSoqWyIYFg7kxJQposuovzinFwgVZAfEeyrmyaMA?=
 =?us-ascii?Q?Q0VKtYYbmM1lHLra3q8VzZuCv9q21Eh93mZIdWBO5IJwx0wl8x9zqMz56TKc?=
 =?us-ascii?Q?YJdJIsz+5VNQxD9iwjfAdX8RvOyhtzMVosPU29bbFStzUmuXQyDtjDSVuERH?=
 =?us-ascii?Q?8IQNflzo7wux0CYEfVwy92AGxm5yEt1xjCBqCi/GL2Rqbakpxw6qoMtmIP3W?=
 =?us-ascii?Q?2zEkUAWXcP4cdP5j2PndjJnoTHQcrEF07KprQnTKNkQ29/SzlxyX+4DzMRLq?=
 =?us-ascii?Q?nwpBdKId7i4x0CmBNduIfq+lssueYT+X2dFYiumt6VbB6NYV2BxqDd42Day8?=
 =?us-ascii?Q?pRwt7oK9yi3fDGldYZ44DPAXl+0oQP5lzOxlqTjZd798PBcgI0bnLqtzbDjX?=
 =?us-ascii?Q?nx0Cq3ST3Y1qux20bKRsCjGOG1nvbLcMM4t9duAz/ZqYADaSrIcc/kM041wJ?=
 =?us-ascii?Q?CGlaxkNTFKGDqHzJf+z3g2z/ApwpLBldifBltEMBPw/A8xRdQAVfKR/O8bpA?=
 =?us-ascii?Q?bSqd+aKTCSptofZqT6Y2JzYt1YFwqJJR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bOITbaP7SVQCBYV4QO3EdVrA6zsmi2BkoBDL7YJG5pIL/gfwZAduTvrlkaRY?=
 =?us-ascii?Q?Msuz8hiw5hGbpJQP/WlATJzgyQNiSUzdGd83IOeilyQN3q5lGkvyjBc2TQ0p?=
 =?us-ascii?Q?kkGoCn+bYd4gx3QN1sLem317/CKmxup1nX/8bImMkYtPOfdYUKplKb6uJoDE?=
 =?us-ascii?Q?st9FDLe4FscQqZi+VYON+oJO7A82mkwIBv1VyJCDVnCDEuLZkmCCRBl0riBx?=
 =?us-ascii?Q?dMytAlZy5zuWOjBWWjPVB6Ca77cCY5EsrgJaVFHinsn9HwN5gnrI6Zzouarr?=
 =?us-ascii?Q?nXFWNnQVwPkywtgZbg/AN+7TYMKlLGtMnYcdPm+I5yj25dRlEuKRxRpT54/H?=
 =?us-ascii?Q?SyXsFnbttAMB6lwlQiqVMLB8w2Jz53ubRYNVKTgdSNb5VurNNTzo1DjuT6HK?=
 =?us-ascii?Q?mNjFZPMNKFaCNgMppWjENgwqycB0WKGUG966BF0sz9a4YhNcZY+V8nd4T08y?=
 =?us-ascii?Q?jmf7kKvUMCMmkth2oc7AOHTyXetetuvxPJLTJ/GSTKpjYiO+59JQcrdGemHI?=
 =?us-ascii?Q?vGdV+kUg/Eab4ZAApTWwErXc10qLnDvBBhMtkqeXlXh3YmqSNO23WR/XDMih?=
 =?us-ascii?Q?1wVreF+yf4F0J/NpaD+xGrsOxvadLXiiPlDOOMewGIaYmCHpJH965JkqsY2R?=
 =?us-ascii?Q?h8G8q9xQjSZCR+QAmaIVomNxrxQ+bHvKl+E3r+nPb7qg8EHLEnzheZdRBh8x?=
 =?us-ascii?Q?kss2N5q3g0REqOqb6aGxrwDiCj4y7syphcjUFdacOyZjIQYkHgtpEb494awr?=
 =?us-ascii?Q?saGz5ks6r6GgRPx40mz/uBDyoY8uSJad7qrG4KlpbF0Oai5OiroUKoxFygKv?=
 =?us-ascii?Q?cdkZiZ5byM3WxTGOWU2KiQbzL8M50Rte3MVMbZY71kB9zeUPtHw6qBXv/SbL?=
 =?us-ascii?Q?ba/34oMgOoaBBgzSiBPbaZPz8JxrdTi35Onj958wIcKouTQnFQs3SruDafId?=
 =?us-ascii?Q?B2BMo6QGPDXTZPDZbOWXn5BSn1gI/nYgSp1RMX2PhhFqPIq5d7XrhhAYiAxl?=
 =?us-ascii?Q?j0PsMJsPO3qibcH9rfhfEg/rOis7CyWEV4ga9QmuyPBVJ9U/PF48RtIEvliw?=
 =?us-ascii?Q?7rmILHTfHTexKV94OW1fWjo880KpEfbfGMX5OwQqPjHFGLoui8Ub8hiGTQZ+?=
 =?us-ascii?Q?OhsSpexx0/plg1mdvG2y26cxe7JLydg9HUnk/3MBaFYJV/Mgs3VgPHv7DNWg?=
 =?us-ascii?Q?zkC0w1bdrLNLCwb+YB1DhsEIlpUtVSgmPKbK9hdJJJZ6puqenleA10+NGR/9?=
 =?us-ascii?Q?TkvYXt6520lBHA8v/0lo4I9mxLd4sd3xrQwlZT4+eWUqObWL1/QQUF/8+EgA?=
 =?us-ascii?Q?iOXHFLBxc62qJqmWd+Uvv5EScen8HI/bGjpGHV9EKTanBy9Pf86OMpz/mHYA?=
 =?us-ascii?Q?piwFa6G1pfF4Kjux7ATey+H/mcZl0eVHYPBqkZiKYYCe8uXPyBVoTa2RfJbs?=
 =?us-ascii?Q?oXbBiOE3l9jRqXZHn0QXv3V/1lAAZGoPjWTHb7YXb5OSYmuGdIJU3kGtbyOa?=
 =?us-ascii?Q?6+VyYPDeUlpffoEZeLaRd9QAFglh2TzOjE3OMA49H6Xpfbj+mG6vGxTkqKJX?=
 =?us-ascii?Q?XHlxIo1dEjsaBxPAF8c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbace0e4-e574-42a5-e6af-08dd572e71d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 12:58:34.6382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGMR3ozselmkFTVgbSc90WRzlx8Hoio051jy9MCIfNE+QURsJFLGamODEPR402wS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhX1sZdUafRxPjtG1LXZnQlcsDBFe0q6d1TMQH5hNT0=;
 b=TYUFDyFFNp7J3O44lkoynsT2pepEd6xU6qmTD5hGiMzmbH3XToqv3cvwzadAdDXY2JduxCcWf8AF5NiYLTWtoeIPU+PFOM6U3oKqzQLhCmjoJROORN3MQuRuItLv78nW4AxZ7IHOo7qXg4tif8MYTIXWIAtd7XCGljyFFaKskFQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TYUFDyFF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: [Buildroot] toolchain-bare-metal-buildroot
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

Hi Thomas, Arnout,

I am continuing the work on the toolchain-bare-metal-buildroot, and I have
encountered a snag where I am hoping you can come up with a brilliant idea
to resolve.

In addition to needing multiple bare-metal toolchains, the versal gen2 products
need the riscv32 toolchain to have "--with-arch=rv32imc" included in the
configuration.  Just using the riscv32 tuple is not sufficient.

Since the architecture tuples come as a list, do you have any ideas for
how we can handle architectures that have many options beyond just the
tuple, such as ARM and RISC-V?  Any additional variables we make will
also need to be a list.

Do you have any ideas for a clean way to handle this?  Perhaps arch
specific configs that we can apply in the config loop should the tuple
match the corresponding option?

Thanks for any ideas!

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
