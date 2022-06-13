Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5AC43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 21:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958BD606F9;
	Mon, 13 Jun 2022 21:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93WXRuhNWT5l; Mon, 13 Jun 2022 21:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C82760BB0;
	Mon, 13 Jun 2022 21:31:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D17BE1BF27C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 21:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD4F60BB0
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 21:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lu3ZINGHCzDj for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 21:31:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11438606F9
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 21:31:02 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7923840BBC
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655155862; bh=8OcjgvDRji0EWjaCdQGk2kcWpL2wt+mxnoKBPQQTFeY=;
 h=From:To:Subject:Date:From;
 b=UTCwfPbEXKaMm/tPyQMXmxJ/Sc/pJ1xDl4o47N1etTIh4yslAw49Cz7zSNDuao/LN
 Mkl71FLvO7A7NTfuACvGfxIMgty9yxqWmXVtv0lbfhH9OAsvWqxYruyxJVUnH/0mbe
 q6Xm/WODevt7gxynK50ot5Ktph8q2beSCpoSubrofZUkFf8h6ZGGLrhbrb/q8CXLwl
 H5CtdEkCvisWRQW5UJ5LuIN0CTyHA0Lc8f/jy0sOm4qJMdM0UUtnyZWDeJQr9WuEJ9
 EVkJkT9DfzJoZ17/JVi5CgTqJaeRGd5dmFju1n0vpygOYhdiC6njHuH/xwDc/h+QOR
 f1D8/dz73TUhw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 61765A0071
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 21:31:01 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 680B5800CA
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 21:31:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XGQRSQ/i";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZD6rwpgsCgJHz/2jeEYRJN5UEc+/4FHBIvIEoSLrKGtxFV3Eh+zzx9NDZ28cQZ6SyViNuj/oCyfX7tQD7YFK23ts5TM2DyvNef/pbbmLrzZIj/yoWSqTx9zLWvNYTl19yZ8Qotirfxhfc7WfyJmb54FPQxg4/e4pVXVzADvCaaoNtPzg3RBkjuergkfpvSZdJE3KGpDngYNM77c86ll93pDQNEP2uGTqVyMphcTrqR45k1+A//Iuy82qVYi+yTWXzC8nGAscg+FiMpCPPBOdjG3zVUl3WGJGam+nTfOVZTZDMG+wEMDHGzhUnl9JwOCDoYXFAPmX3+TXqA0UNt8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OcjgvDRji0EWjaCdQGk2kcWpL2wt+mxnoKBPQQTFeY=;
 b=cBnfO9SXg7uoXgvDgFDLXQ9GojpiG/ZJrMVtroTRvbL67+L+QOT/nyDwA6gPFBKqEfyLv15X988/uo/HW8SUg6wZZJySyTUthbcJ8OmY/5NoN2FzYCtL6tQz89CcaW2btILGNPBepYQlkAheDTmVnKYP/b2Hdk7IiVhnQIeJTFS0oIcf338E4T/GJiMK/z1S+4cdSuIiQPIuzPTgePSQRTn6q7a2Kg9ceWAKL/Qk4diMZ3LPKm6phC9WhfkwhCH0JNwcUyPOWXXjgoSLPtYnd3ibqG4XFrs/uTTiwZnwdVld4uzuAvYthdKzMVSRjBRX0nRQFLTYUEuGYw06mMCKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OcjgvDRji0EWjaCdQGk2kcWpL2wt+mxnoKBPQQTFeY=;
 b=XGQRSQ/iVGvqJNAICbfNAdi+0mlxGqgc2CfdoAawRwqMfmWllEyBuz9nCIIxbuINVd/TI2McnvbriyxG0P66+I1TD7/VNfMNJCN5py+ECAiEVWdQAVNSZ2wBWgB1VrqeBvK1aefdJFl0KG/rS+seNjeCLAJ5rMomhCdwaQUiK4o=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DM6PR12MB3657.namprd12.prod.outlook.com (2603:10b6:5:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 21:30:57 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 21:30:57 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/bpftool: revert bpf_cookie patch to allow
 building
Thread-Index: AQHYf2zemrUYoe1+2UGHv8Rw+I7+Xw==
Date: Mon, 13 Jun 2022 21:30:57 +0000
Message-ID: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dde3725-c851-422e-0df6-08da4d840129
x-ms-traffictypediagnostic: DM6PR12MB3657:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3657C3FAA54527F14DB7748AA6AB9@DM6PR12MB3657.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VGw+aSWuU8bi5afAQ4w3l1iqVy75ZyAYxHiFscXISLvkd6OrTEv0Yb90M/2YsYKIXubewFFjOdISo3uH7UQADXj1Sslwh30mREayae900pZwCPBAB6ScoQeLlzCc5RYH+rPa+pysC7Q4KffZx/UBguGtQmTvyIVrpA3ioMZ+3Plxv6W4PIBevnRh9kVGEay3Nfgg5uOb32OnFz4VPNFkEYafwYMxniz4hn31P6PRX5m7xKLgZfe2oZLbbRq4L50Pip3F/V81/GpMYK7Q5V2BGSCiGRgH56rhSVvfpv/3Z+mwuKYbydPCnVi7Roz/wJunuZfP5X8Rmm1dgsrH/jwIVFrTmA3p869o6dlCdHVkKBoHqpz9xAKI1lfI0l2HD7JcI2Q07viH3CV/KWfCHWcWFOhYIvpMxT6HYPhOWw6hhNZxLl0J4p0eJu/z4EXiNnk+8Z+DmjvD1mJT7m1/TlFdPOSC47LxeNBLWvOzsgIUQK0eforaXi1EXsswml8Ghq7yKuveezArnC+KPcTOc35HBzqqKmD0ZgupHt/7TDPZUl8p/Dc0tHpIZJPZ5vb5EVafawBq066jnhEuKYcsRGeRopUMulTWlkqmqySBhnE+ZtX2YeD9XYnZIC/N1eEUqhqJRfufSkuWDsPYOSCSGE+oM46O+klU4g9N/vQ+b/1aOoKfQd4QtuA8pQ3QnHu3MZZ3cEEQlrqDoFKTRtf0mYwoS2C8b0ymNRBwF+nQtGR5LZdL60ZJeSncH9vgAX9ggk0TNUkeHeLafaNbOsZYSZelwnTmENOYhtELlt0MLVLbmiA8MP9pSHkAPROzcpxdex5pJAd2i8GJ+sWiVBVQyrokXWYwQ8xcln5jAjoluFCj//s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(31686004)(64756008)(8676002)(66446008)(86362001)(36756003)(5660300002)(122000001)(8936002)(71200400001)(66556008)(6916009)(66476007)(66946007)(6486002)(966005)(316002)(2906002)(38070700005)(91956017)(76116006)(508600001)(2616005)(186003)(6506007)(31696002)(6512007)(38100700002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkh6WUtvMEJseDJEbndVb2JaN0h6UGROR3dHWUs5alE2dkJzU29TMHRmODJj?=
 =?utf-8?B?VDFpM05mOGlsd3BCMTIva1cwckF6NlBPQytnVzBib3hyRmJsaTB2TGl1NXRs?=
 =?utf-8?B?ZFlwazN2ZWZzWWczOCtTSEFVTGM2QlJoVzRLelFVTm5rY2RWSm04aTBhMWlC?=
 =?utf-8?B?Q0lGQVNqbDExSXlOaEsyVXlHZ3hWY01LamF0WkNraVJNd2NZZUt4WWhKVHgy?=
 =?utf-8?B?cWpSa1VuYktuTGcyMWh6dHhpREFwSHV1ZXkyazJvSnlBMk5ET01KcS9zV0Vh?=
 =?utf-8?B?REZqYzZOYi8zZnJOdmlNN0FsYXh6OWVieWdXcmtQbXY3VlN1V0dxWVh3WDFJ?=
 =?utf-8?B?ZzFBc2RWWDgzRERQcDFvSkpoRGFXUm9uTEZTS2hPb1hyaFRYNHFvWUpJc2pz?=
 =?utf-8?B?VHZmNGx2bkc0MkhmMDRWTUVKU3FBcVdJeWwxWW53bE1SZEJweC9BYmMxMEZp?=
 =?utf-8?B?bno5ckFyMm95MnFJUlF0Z3NlQzA3ZTZTZStpemNkd2k5RjRvVzRVN3pwSXAw?=
 =?utf-8?B?Wjd3SnpMVUFtdnU3c1Y5OUllZWpiUENzTkV4OXViZ0tySndBcHJiNW5IajF2?=
 =?utf-8?B?OUxlbHNsSEIvYzVoMmVKdjkwajFRS1Mxay9EZDZiRzRYM2lEYnlUT29LdTJY?=
 =?utf-8?B?OHZDdkZWenk0bkYzQUprRkszM2YxMitIb0sxUWdTUWRWN080U0lHU2Yvbytj?=
 =?utf-8?B?U0JVTmN5UGthWDVEQmVxYWI3QmR6SEdLRWUyWGJQbmhzeWo5NW05aHpZTnRR?=
 =?utf-8?B?ZkRDTHlsRWhBbWVsV2JISDg0TklaSW5PTHpjcEk3bERsYWJFb3lhbHpXa0NH?=
 =?utf-8?B?OGdmcTI0V0Q4NXhaR3lDOUlneHRBN0psd096eU1nMVhYSU92OU9oZkFNWGwr?=
 =?utf-8?B?eUVaQTRwVnFEMldUZXFYbzhkSGRjSHFnSlVoMU55R3UrM0NLOWs3cCs3UnRo?=
 =?utf-8?B?TWluN0VRSXB3bUxZc0dkdlNPUWlFcmk4YUlGSWZwZW4xbWZOYUZPbENqQTV4?=
 =?utf-8?B?VjRJNE1oRTZDU25jZWpIVWs3QW5Ga3JhV0N1R3dZVXJoTTd3aDVWQjAwMHJ4?=
 =?utf-8?B?QldZV1Zpbkh6R09qN3pxMEZPaS9Tb0tlb0svOCtrMzh2OW51MW1VWnVvRi83?=
 =?utf-8?B?OCsyZjUrTUJTa3Q1M3FhaGdyalFPc2dKQ25rN2NOV0owV0pySVV0YVE0ZGFj?=
 =?utf-8?B?QzRYVW14cGpiSjRoMlN3TVU5RW5XekFLdnU4cjltdmVhdXJFWlFUenNuVTJa?=
 =?utf-8?B?ajA3SzVvaFpQRFBodnQ3K0hNeitBcTFRMEQ0WmVYeXJkZG9yQ3NmdkFNTUFk?=
 =?utf-8?B?eGxrbDI3N2x1dnA3blJaRmpSanYrc01GZ05ueTFQSytGQm5IeFFUTHZwK0Nn?=
 =?utf-8?B?UDYzNlUzbXBJV1NPL2VRQmVWRlRNaTFLU3IrK1VvblpjTXd4T3B4bUFXNHVL?=
 =?utf-8?B?a2lKVnNWU2kzdm9tVWZPZHB0eTFLOUZLYXMvYlg1S3JZbk5JY20yV0wySU8y?=
 =?utf-8?B?WFBDMXpnaVpweW1IcE1vQU5sQnNsekQzQk9JaVlXd2VUSXJ6Tm8vMDhweHF2?=
 =?utf-8?B?WDN5aFpIdEtEbi9iNTJOTkRtUjFjYm5qYWpPT0l3ZXc5TzYzZm5FZ09JRkU0?=
 =?utf-8?B?dENuOHBidGhFSG5NV2RzdCtleFNwTzFTdTM2NUVOcER0T0tMaUd4MWZyNmRt?=
 =?utf-8?B?OTdEdGlRcnJ1bnBOVyswVXBhNll0TU5BMkZDYmJybEhjRmVqdER4bWp6YkF6?=
 =?utf-8?B?MkJuV3hzMjJ3R2UrL2FTL2VGWEpDL0VGKzVnQVExOUpDUVRTb21FV0NuWmNX?=
 =?utf-8?B?d2o0bjBpVnFKQmppNU5Nb3E4Y1htTWNXQkhCQVN3c2xOWk1tVDJZR3NzcWJS?=
 =?utf-8?B?dVk4djBEb0JLemk3L3A3TTlwUVdCanhNYjFFaVk0ZnhoNnhIbWJKZ3ZOZnRO?=
 =?utf-8?B?TlphMXhxQzQxanIxdWlJMlg3SmYwemprR0RwZ1NaeU9zdDBteG1ScDJPVkF4?=
 =?utf-8?B?RlRqYTh2MDVnTHFHMUFUMU4xcGNwL1V4cUczNW0rTkx2d0Q4SFdYV2x6bWly?=
 =?utf-8?B?R2l5V3RvSTlFS1JBSER3eTVnbjRNci9zY1E1S0l6RVRFaEJkU0ZCVGpCbVZn?=
 =?utf-8?B?dmtVUmdQK2lwQXduNlAzZlQ0YUJNdU1LWWNuRHZBSE1MOUloMEVWbDJtQWUz?=
 =?utf-8?B?clE3dnhoZkVXYTRhOTdkUDZJeXhucVRBNkFqQ2RiYllqa3E2czVObzFaWG5q?=
 =?utf-8?B?VmhtT0NUczhuNlp1T280dUp2VDZOQjE0b1RIdXFXa3hrTHdSZDYreWZqN2JZ?=
 =?utf-8?B?Qys3a3R6L0tnTWVybnUrVHFWTGtEVXJBTS9uc0J4anFETHdoVG9QU0VCTW85?=
 =?utf-8?Q?Nz813nHO1uhEWd6o=3D?=
Content-ID: <F69630BAA4B64B42A6E6A84E9B8F7355@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dde3725-c851-422e-0df6-08da4d840129
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 21:30:57.6367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJ6y4MuMrl5ZuSYgWaAfoSMmBUGU0wIq0Dbo8bwzsoBDFXbQ7wT684l2FaYH+OyUMmr6mVnawmIphzh/yIHy8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3657
Subject: [Buildroot] [PATCH] package/bpftool: revert bpf_cookie patch to
 allow building
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
From: Shahab Vahedi via buildroot <buildroot@buildroot.org>
Reply-To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building bpftool on Debian 11 (bullseye) with kernel v5.10 fails:

-----------------------------------8<-----------------------------------
$ make
  .
  .
  .
  CLANG    pid_iter.bpf.o
skeleton/pid_iter.bpf.c:47:14: error: incomplete definition of type
                               'struct bpf_perf_link'
        perf_link = container_of(link, struct bpf_perf_link, link);
  .
  .
  .
skeleton/pid_iter.bpf.c:49:30: error: no member named 'bpf_cookie' in
                               'struct perf_event'
        return BPF_CORE_READ(event, bpf_cookie);
  .
  .
  .
10 errors generated.
make: *** [Makefile:176: pid_iter.bpf.o] Error 1
----------------------------------->8-----------------------------------

There are changes in bpftool v6.8.0 that assumes the existence of
particular data structures in generated vmlinux.h that is obtained
from the host machine. See [1] for further details. This commit adds
a patch to revert that additional change in v6.8.0.

There's a patch series pending to be submitted upstream [2]. Hopefully,
those will take care of the problem if they land in the next release.

[1]
https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u

[2]
https://lore.kernel.org/bpf/20220421003152.339542-1-alobakin@pm.me/

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 .../0002-revert-bpf_cookie-change.patch       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/bpftool/0002-revert-bpf_cookie-change.patch

diff --git a/package/bpftool/0002-revert-bpf_cookie-change.patch b/package/bpftool/0002-revert-bpf_cookie-change.patch
new file mode 100644
index 0000000000..8c9c6d84b1
--- /dev/null
+++ b/package/bpftool/0002-revert-bpf_cookie-change.patch
@@ -0,0 +1,114 @@
+Revert commit "bpftool: Add bpf_cookie to link output"
+
+Building bpftool on Debian bullseye fails [1]. This patch
+reverts the offending commit [2].
+
+[1] Building release 6.8.0 on Debian 11
+https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u
+
+[2] bpftool: Add bpf_cookie to link output
+https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=cbdaf71f
+
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+diff --git a/src/main.h b/src/main.h
+index aa99ffa..2f2b638 100644
+--- a/src/main.h
++++ b/src/main.h
+@@ -111,9 +111,7 @@ struct obj_ref {
+ 
+ struct obj_refs {
+ 	int ref_cnt;
+-	bool has_bpf_cookie;
+ 	struct obj_ref *refs;
+-	__u64 bpf_cookie;
+ };
+ 
+ struct btf;
+diff --git a/src/pids.c b/src/pids.c
+index e2d00d3..57f0d1b 100644
+--- a/src/pids.c
++++ b/src/pids.c
+@@ -78,8 +78,6 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
+ 	ref->pid = e->pid;
+ 	memcpy(ref->comm, e->comm, sizeof(ref->comm));
+ 	refs->ref_cnt = 1;
+-	refs->has_bpf_cookie = e->has_bpf_cookie;
+-	refs->bpf_cookie = e->bpf_cookie;
+ 
+ 	err = hashmap__append(map, u32_as_hash_field(e->id), refs);
+ 	if (err)
+@@ -206,9 +204,6 @@ void emit_obj_refs_json(struct hashmap *map, __u32 id,
+ 		if (refs->ref_cnt == 0)
+ 			break;
+ 
+-		if (refs->has_bpf_cookie)
+-			jsonw_lluint_field(json_writer, "bpf_cookie", refs->bpf_cookie);
+-
+ 		jsonw_name(json_writer, "pids");
+ 		jsonw_start_array(json_writer);
+ 		for (i = 0; i < refs->ref_cnt; i++) {
+@@ -238,9 +233,6 @@ void emit_obj_refs_plain(struct hashmap *map, __u32 id, const char *prefix)
+ 		if (refs->ref_cnt == 0)
+ 			break;
+ 
+-		if (refs->has_bpf_cookie)
+-			printf("\n\tbpf_cookie %llu", (unsigned long long) refs->bpf_cookie);
+-
+ 		printf("%s", prefix);
+ 		for (i = 0; i < refs->ref_cnt; i++) {
+ 			struct obj_ref *ref = &refs->refs[i];
+diff --git a/src/skeleton/pid_iter.bpf.c b/src/skeleton/pid_iter.bpf.c
+index eb05ea5..f70702f 100644
+--- a/src/skeleton/pid_iter.bpf.c
++++ b/src/skeleton/pid_iter.bpf.c
+@@ -38,17 +38,6 @@ static __always_inline __u32 get_obj_id(void *ent, enum bpf_obj_type type)
+ 	}
+ }
+ 
+-/* could be used only with BPF_LINK_TYPE_PERF_EVENT links */
+-static __u64 get_bpf_cookie(struct bpf_link *link)
+-{
+-	struct bpf_perf_link *perf_link;
+-	struct perf_event *event;
+-
+-	perf_link = container_of(link, struct bpf_perf_link, link);
+-	event = BPF_CORE_READ(perf_link, perf_file, private_data);
+-	return BPF_CORE_READ(event, bpf_cookie);
+-}
+-
+ SEC("iter/task_file")
+ int iter(struct bpf_iter__task_file *ctx)
+ {
+@@ -80,19 +69,8 @@ int iter(struct bpf_iter__task_file *ctx)
+ 	if (file->f_op != fops)
+ 		return 0;
+ 
+-	__builtin_memset(&e, 0, sizeof(e));
+ 	e.pid = task->tgid;
+ 	e.id = get_obj_id(file->private_data, obj_type);
+-
+-	if (obj_type == BPF_OBJ_LINK) {
+-		struct bpf_link *link = (struct bpf_link *) file->private_data;
+-
+-		if (BPF_CORE_READ(link, type) == BPF_LINK_TYPE_PERF_EVENT) {
+-			e.has_bpf_cookie = true;
+-			e.bpf_cookie = get_bpf_cookie(link);
+-		}
+-	}
+-
+ 	bpf_probe_read_kernel_str(&e.comm, sizeof(e.comm),
+ 				  task->group_leader->comm);
+ 	bpf_seq_write(ctx->meta->seq, &e, sizeof(e));
+diff --git a/src/skeleton/pid_iter.h b/src/skeleton/pid_iter.h
+index bbb570d..5692cf2 100644
+--- a/src/skeleton/pid_iter.h
++++ b/src/skeleton/pid_iter.h
+@@ -6,8 +6,6 @@
+ struct pid_iter_entry {
+ 	__u32 id;
+ 	int pid;
+-	__u64 bpf_cookie;
+-	bool has_bpf_cookie;
+ 	char comm[16];
+ };
+ 
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
