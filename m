Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2E0C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 08:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B5A40123;
	Fri, 12 Jan 2024 08:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B5A40123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SN1mNzHFbdIJ; Fri, 12 Jan 2024 08:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F3ED40227;
	Fri, 12 Jan 2024 08:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3ED40227
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D90E1BF287
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 08:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42E6B83F83
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 08:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E6B83F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bZaiZnBx1TM for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 08:30:35 +0000 (UTC)
Received: from mail.eaton.com (mail.eaton.com [192.104.67.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2668183F7F
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 08:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2668183F7F
Received: from mail.eaton.com (loutcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 738C096240;
 Fri, 12 Jan 2024 03:30:32 -0500 (EST)
Received: from mail.eaton.com (loutcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5289B96214;
 Fri, 12 Jan 2024 03:30:32 -0500 (EST)
Received: from USLTCSPGWY03.napa.ad.etn.com (USLTCSPGWY03.napa.ad.etn.com
 [151.110.126.211]) by mail.eaton.com (Postfix) with ESMTPS;
 Fri, 12 Jan 2024 03:30:32 -0500 (EST)
Received: from USSTCSPGWY02.napa.ad.etn.com (151.110.126.226) by
 USLTCSPGWY03.napa.ad.etn.com (151.110.126.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 12 Jan 2024 03:30:32 -0500
Received: from USLTCSEXHET02.NAPA.AD.ETN.COM (151.110.240.152) by
 USSTCSPGWY02.napa.ad.etn.com (151.110.126.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 12 Jan 2024 03:30:31 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by hybridmail.eaton.com (151.110.240.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 12 Jan 2024 03:30:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWw++wojwrniX/f0Q0o+XJFilvhZGHVzGRmrmlC5O/jr0aHudNh0E2O4GwS1i+WSZwfuzMP/nrHXliDG28CxjBzlLTwTXoOgl/+KebTctjLySRVL0Y42QNZLEoogmMRuZ+ZAuy/0tvtQjB8U7Wofdx5DpnzxXyrjeYaWmfHfJk/dTX46ucoY6AMrXY6lDcFxn2itCsWdlS6flmpD57pjvygqkjrBKtRZhIbLzZQ5PtLhciadXQsDeMA+tB6AH1Z2qc9Ki0yo3b0dDtN5jyB36jpw1B1nY7lbp4beZ84GjQa4ukqTgKdea+48Ohyn6nOrVfTNjylvwSNTLCE5B/N3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWmEyCF0wG45VegALwLd3+C1EQIrB0IziSSJF/xxscE=;
 b=P8jmnSPGxF4tW3XqxkuBERtHVieFdlK9rUAP4A6tArYULNlscrIhiscuRqAUIrLJuSUJaMrkfvV2PnBUO8kGfmYTJzvAVcOmq41vZBMRF9JdxVU8UUUDY4Xu74Ys0pZ+Ih81EmYQa0ijIgHyB4v4o/7oNL+fWYFEPwQ7lq+Of0IlrU2ep4p1/FKLPqFd8rs++0zENVWTF+uSiI4EQthp+LvoEiCkwvg3WZobQSMD6Ez9KwWqvBqbL3CFneaT039mcvCTtPtKkVtr0fzH4g2QJRGCs2UDag3BUO7mk+gZhsFJOxOqt1jXd0T98siSqG3S7CC2aLVRB9CYAKAM/lFwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eaton.com; dmarc=pass action=none header.from=eaton.com;
 dkim=pass header.d=eaton.com; arc=none
Received: from DM4PR17MB5969.namprd17.prod.outlook.com (2603:10b6:8:50::17) by
 IA0PR17MB6228.namprd17.prod.outlook.com (2603:10b6:208:440::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Fri, 12 Jan
 2024 08:30:29 +0000
Received: from DM4PR17MB5969.namprd17.prod.outlook.com
 ([fe80::32cf:fd43:3a95:46b7]) by DM4PR17MB5969.namprd17.prod.outlook.com
 ([fe80::32cf:fd43:3a95:46b7%6]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 08:30:28 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for
 zImage with appended DTB
Thread-Index: AQHaRTGZdWQuMRKB/U250oJc5MRs9Q==
Date: Fri, 12 Jan 2024 08:30:28 +0000
Message-ID: <DM4PR17MB5969BAE4BC2BEC7D6417DC81DF6F2@DM4PR17MB5969.namprd17.prod.outlook.com>
References: <20240111131932.11760-1-laurentbadel@eaton.com>
 <ZaAIkDXOQV9QUazR@landeda>
In-Reply-To: <ZaAIkDXOQV9QUazR@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_ActionId=0950f176-a43f-4fb8-9a08-ae763ab3d76a;
 MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_ContentBits=0;
 MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_Enabled=true;
 MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_Method=Privileged;
 MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_Name=Eaton Public
 (IP1);
 MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_SetDate=2024-01-12T08:30:04Z;
 MSIP_Label_8afd4f73-fada-4b37-96db-6e01034f2850_SiteId=d6525c95-b906-431a-b926-e9b51ba43cc4;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR17MB5969:EE_|IA0PR17MB6228:EE_
x-ms-office365-filtering-correlation-id: b185accf-6e39-454d-4a0a-08dc1348bbcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GD4CXHpy1ZPn6Z9Sj6O75X/0TDshRfW4i+frpQr7/KWwCSoZlsHLpMjsHKS4NhXCB3tOs9MJVslju1k14XOmTkCYUGKD150j4lBILf1Ih0F2voYZXAYQxMBNf9vx83DiKraXDSDb9piq7QQibizpynkG1cZX+PIlvO+dlQNX5UCh5vpUk0mzdYcOZXuTQsa272t13UHg42KyHmGpC01/UPX2I2FTlVfjktHmek1aPF7xDlDEatXVZQav3Bs3Q3AiBBa18O3G0vCd+MjB6sEK4u/wymCHbUnPh4kg/XYGO7EAIW72BG4KaxQNTUOiQS0aVu8l3ion3HShRSO5Zr6c+G84WRKscQ3sTHAGp2WgW3bgjD77IjNzr7QkQkTsST3tyzlG6v+ZeYBD6tu3TmlY+epHLqTR4DSxhMrQUGEET8E0WxlZjsTZVh2Ug0rhAFlgbIeR7Lw2mTvMe4nn+54CSB+k+5qTte6P2uVk8wHCbA4zSjkLM6InqYxXFBl721yBp1spZBZPKNIznhdr7YjBKaoYYp8XZK+8UdtG/sHsX4z9fF/85GQKOCWll7F4taMl5yCv8pV/BxWmb+4oeKiItxioLNWXEofMC86G06N66tddLToKGIIle/iiYL05lcvbuBaUGFrrF/XkfcbJDcr24HGNnzUxqSmJkA937niEkLM4NeblyE/qfwZWms/xczclmcyK5HgSrHywMWU9WN8VyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR17MB5969.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(7696005)(71200400001)(4326008)(478600001)(64756008)(66946007)(76116006)(6916009)(66556008)(52536014)(6506007)(45080400002)(966005)(66476007)(66446008)(8676002)(8936002)(55236004)(53546011)(9686003)(83380400001)(316002)(2906002)(5660300002)(41300700001)(26005)(33656002)(38070700009)(82960400001)(38100700002)(122000001)(55016003)(86362001)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+gIRcVeHp81fVxMcO5Uekx269RTxHxzlS/FHOyzTB+1tHvYf/76YpMRrR+sv?=
 =?us-ascii?Q?sKXQc64I9DPCkJngNnN6gxdsBpksuCYdS/4vDzJ5vvwysmr6WvhVlJcZJcLO?=
 =?us-ascii?Q?c8QathrYPre+9Bbcl+swMNTDsIaoiLdlnd+FM72aL4Oy3SNqipWjm5quToHe?=
 =?us-ascii?Q?E4Wm7GxJgYfA7e0a6MyWtP4HjRNcfp51DF0t6kerVQ5bMN3oZ7sGuFQkvZuX?=
 =?us-ascii?Q?kmuz9CpIfBpBSte4jmJkSogNp8Pap3Gal5a1yGt67DCWseJhcrFB1dVTIePC?=
 =?us-ascii?Q?d3MuD5R/Hl0FGws+KJxBDyV33X7lxbrfCCwX+f5DqjYRbCy3yXKvIN3gRe7v?=
 =?us-ascii?Q?aY6ShXSeeTmO/68YJ0GrEn7rBr1E4VSL6UgHIYW9OGKExf5W0u3PXdzWeQiX?=
 =?us-ascii?Q?Qx7cg+s6ebVKuAgXoFh0VVuXv/5QIzm4Tw18OnQcXZhEELk1XZzKZvWD3MuQ?=
 =?us-ascii?Q?BVCr3LiqgETZQzETR430dMRzexuUs+GydyUWwWiyXV7qHlMfP53+vVrQ8Ry3?=
 =?us-ascii?Q?6bCl2bbM3pkk/p1z3PjMr519P8YXF0KnyOVWsokkdqU7k6sUnzFuiRv0i2DL?=
 =?us-ascii?Q?nNwzBa6ndTVGs1HoQ/Tiz/1xO5W6QYtRvleLNrt9vl8BFiIDVzbH75aeWQHI?=
 =?us-ascii?Q?8btiOlMlH9Mh90NqGacEheWNtr2if6/sW58n6V2UkJn3osFLXQ+uLvc9LTt1?=
 =?us-ascii?Q?PRyoUe+m3+wthXYziVHw4+Qw1DnjJSaRPR0Urw53t1J1YkmPNedfChNeL9O4?=
 =?us-ascii?Q?DRlIXbQetfiZDNCXEkI9aUFbQ3u3sLEZixfsm3EC4PwDFbbAekMuRh9YnN5D?=
 =?us-ascii?Q?dERRReeZgsmsGH0zARflD383HfHIrsIJ5V+Zfh8rPcX/WBBBA3umQ5XVyMdR?=
 =?us-ascii?Q?CzhrpSvXKHXbTcSitssy3wSZj0mZJ4NuLNT8KNIbTBFVeNcgyjFGJCXSoj60?=
 =?us-ascii?Q?pv8bQVSAy1q0DHyWdyXmXrQn2MC7jxoDnw1G5usBnbC2fOJ+w/sSXvLTjoRv?=
 =?us-ascii?Q?baPuwL7O0yYUJjEiZSPk/+s9do7YAyknyc3pTT7xNSg8K8RfGtzYNEELt+em?=
 =?us-ascii?Q?rEw9NmzRZVpQZt2ICi7Owi8x4BweArWppaV2UcMcFFMCkuL7niglxnICCDdv?=
 =?us-ascii?Q?PKZ1RJHdfIu8vfLScY1yudbHJ6v2b24DfcnGX2HW63b0BWz0pdUDrYGosNI3?=
 =?us-ascii?Q?2uR52C+PT5OVFJlGmJ0grJCUzvS8RN9hnS7RYkb7gAWvKyHDJfTGxuyUgOb0?=
 =?us-ascii?Q?7m0Z1+GMo8gFLTErCzUcnwc8nmi4EATDweSAFrj9v8p8iYslgPyV3xt9XX/A?=
 =?us-ascii?Q?tNHs4qxEQMjoQyIa8znVNqYu5j4X2/oSdYM522cT0MfoFLYRN/90wjnyWV7R?=
 =?us-ascii?Q?MHzwNW1A3iYrtp1D1+Fgkcsr8nSwgC5dplSPAd20CEHxbo7OB6Lw3yxSO+gh?=
 =?us-ascii?Q?grh/0cGGmcDTQfS7j25hkJFMgDcDefJ5cVlv0/UVQSI7W1SVBoJAfqZYr4Q9?=
 =?us-ascii?Q?RU+kL4IPi44e3FE4D736rvZGS8WQsK8ovp9xeg4og0CUVqAk+ED6/pD80q27?=
 =?us-ascii?Q?X4UuFABTNfw/LVliQCb+zgy5Re+2Btegk1yQil4p?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vpvOWjFa/MYJPjyHTcu93gyMXKoCS8V0V3RKeIm5JhC0R2erPSWZBB4kfjyVQBH6kT5l2zy2P6tbzRif+Ii1SjHFxOB7PJJUaYvXXxHC8BQ3V3zIbeKQBPLw0YZ94NVGohiTLksUEkWqLK1n3onLSbBZ6wpe2hRtsiWwwufgxtVrCF7ro+fNfRbZbff7WgofC/a0EIZLt4OwE4Js3goyafSQXmxyzOoH92COSABNx1zYpcpDq/jpnsG5WG6t7iTr2pU/3WJ5Xj5/hl/gVhXRUmWOevp3o0/KH2I4hrQNoyw1scCwNuYd8NOIwNC0t2ZfuntzG2x5Yn/8OcEK7PNOuLdArCgNdCHZRT8FnHC/UhEHzjo2+eE7et9aFxSBWh0EYMlWeP6lLFIsgLvZ3VZTZcl+cETyrMeAvrvJLEh+FHQvyjcgHIv9yzroe/4DNFcwd7awWrwDY6gd+mVLCQOR/L9k92/6pq3J/kgCN9RYHJLcgYK3aj7i5PLPZVFp2uZykACnrrrELTWtY4lnZ5vj5IsvPbfG+7MclcZr3Vu4tphVRf2FmkHK7GRVJmpy75GOzgNIeZE24uhXQC9cog8lkjj5AEZ5cjN1951aKfQMre9mi1RMXk3uU7llPp/D9YQcvHq2xE9drBs+uJvcxYd0xQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR17MB5969.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b185accf-6e39-454d-4a0a-08dc1348bbcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 08:30:28.8856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6525c95-b906-431a-b926-e9b51ba43cc4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4M/vIBd+zAsYy+DDWgw1jMhJP++hIKdvZfPu23g/JcrBGbMcnuEFoHBO02pc1UU5bgA0umYYeNXBnE8NbLFfGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR17MB6228
X-OriginatorOrg: eaton.com
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eaton.com; 
 s=eaton-s2020-01; t=1705048232;
 bh=nWmEyCF0wG45VegALwLd3+C1EQIrB0IziSSJF/xxscE=; h=From:To:Date;
 b=X2G0z6l0Kb1yqi96qumHWROa3bNoZ3TxRqKCz6+U11wj+W2+xxDAjJyklfgCn6r9q
 6gB3VSfOr9DL6wLpDroQzo5dnMFtra1J0E5memApFG3eT4lGyNmEYhVhnn8RmK/8Hm
 Mj2o/YE/NoXuXtne9eb1qNFhTKR6WAudAwmSh1iZ5tEs1Kzrmyoa9FiPwGK6ou8Bi7
 1f36zoja2iEG8fb6KzMXhnHdr0B93qwk/hnPYecQOUN2Gvnm20Bc3guRN0c6P20GOe
 cXAOpUBG/ifs6xbD6LgBhmCCaejjyqzARlWUtQnaJ/8VlLGo6UOW/4kJVsvGfnhVFS
 JERwOheFqWz9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=eaton.com header.i=@eaton.com
 header.a=rsa-sha256 header.s=eaton-s2020-01 header.b=X2G0z6l0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eaton.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for
 zImage with appended DTB
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
From: "Badel, Laurent via buildroot" <buildroot@buildroot.org>
Reply-To: "Badel, Laurent" <LaurentBadel@eaton.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

Thank you very much for your time reviewing/commenting on the patch.
I spent some time trying to find a way to support multiple DTSs for
the sake of completeness, please see the patch below.
I would have preferred to use a single loop for all cases but couldn't
find a good way to iterate with an empty string, so this results in
slight duplication of code unfortunately.

I have tested building mxs-bootlets with the following setups:
1. zImage with appended DTB, two DTSs configured (one in-tree, the
   other out-of-tree):
    -> generates 2 SB files with extension .$(dtb_name).sb
2. zImage, no DTS:
    -> generates a single SB file with the .sb extension.
3. zImage, two DTSs as in (1) but not appended:
    -> generates a single SB file with the .sb extension

I checked the output shell commands and they looked as expected, too.
I also minded your comment regarding the naming of variables, thank you
for pointing this out.

If you think that is a better solution, I am happy to re-submit a clean
patch.

Best regards,

Laurent

---
 boot/mxs-bootlets/mxs-bootlets.mk | 40 +++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index adc22767..0a1f7009 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -41,17 +41,17 @@ MXS_BOOTLETS_LICENSE = GPL-2.0+
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
 MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASE = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX)

 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
 MXS_BOOTLETS_DEPENDENCIES += linux
 MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASE = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX)

 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
 MXS_BOOTLETS_DEPENDENCIES += uboot
 MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASE = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX)
 endif

 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
@@ -65,11 +65,16 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
        BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
                $(MAKE1) -C $(@D) linux_prep
 endef
+
 define MXS_BOOTLETS_SED_LINUX
        sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-       sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+       sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage$(1)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
+
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB), y)
+MXS_BOOTLETS_DTS_NAMES = $(foreach dts_name,$(LINUX_DTS_NAME),.$(strip $(dts_name)))
 endif
+endif #BR2_TARGET_MXS_BOOTLETS_LINUX

 ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
 define MXS_BOOTLETS_SED_UBOOT
@@ -83,7 +88,13 @@ endef

 MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC

-define MXS_BOOTLETS_BUILD_CMDS
+define MXS_BOOTLETS_ELFTOSB_CMD
+       $(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+       -z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
+       -o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE)$(1).sb
+endef
+
+define MXS_BOOTLETS_BUILD_CMDS
        BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
                $(MAKE1) -C $(@D) power_prep
        BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -92,15 +103,24 @@ define MXS_BOOTLETS_BUILD_CMDS
        sed -i 's,[^ *]power_prep.*;,\tpower_prep="$(@D)/power_prep/power_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
        sed -i 's,[^ *]sdram_prep.*;,\tsdram_prep="$(@D)/boot_prep/boot_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
        $(MXS_BOOTLETS_SED_BAREBOX)
-       $(MXS_BOOTLETS_SED_LINUX)
        $(MXS_BOOTLETS_SED_UBOOT)
-       $(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
-               -z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
-               -o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
+       $(if $(MXS_BOOTLETS_DTS_NAMES),
+               $(foreach dts_name, $(MXS_BOOTLETS_DTS_NAMES),
+                       $(call MXS_BOOTLETS_SED_LINUX,$(dts_name))
+                       $(call MXS_BOOTLETS_ELFTOSB_CMD,$(dts_name))
+               ),
+               $(call MXS_BOOTLETS_SED_LINUX)
+               $(call MXS_BOOTLETS_ELFTOSB_CMD)
+       )
 endef

 define MXS_BOOTLETS_INSTALL_TARGET_CMDS
-       cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
+       $(if $(MXS_BOOTLETS_DTS_NAMES),
+               $(foreach dts_name, $(MXS_BOOTLETS_DTS_NAMES),
+                       cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE)$(dts_name).sb $(BINARIES_DIR)/
+               ),
+               cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE).sb $(BINARIES_DIR)/
+       )
 endef

 $(eval $(generic-package))
--
2.17.1

-----Original Message-----
From: Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Thursday, January 11, 2024 4:26 PM
To: Badel, Laurent <LaurentBadel@eaton.com>
Cc: buildroot@buildroot.org
Subject: [EXTERNAL] Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for zImage with appended DTB

Laurent, All,

On 2024-01-11 13:19 +0000, Laurent Badel via buildroot spake thusly:
> When building a zImage with appended DTB, buildroot creates a copy of
> the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
> take this into consideration and instead passes the original zImage
> (without DTB appended) to elftosb to generate the SB file. Thus, make
> sure that the correct zImage is used in this process.
>
> Note: this patch only supports a single DTS specified in the
> configuration, because there is no obvious use case for multiple DTS's
> with mxs-bootlets. If multiple DTS's are configured, only the first
> one will be used.

That's a bit unfortunate that we have to rely on the ordering.

So, if using two or more DTS in cunjunction with mxs-bootlets does not make sense, should that be forbidden? I.e. would we need something like the following (code slightly elided for brevity):

    ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
    ifeq ($(BR2_BOOT_MXS_BOOTLETS),y)
    ifneq ($(words $(LINUX_DTS_NAME)),1)
    $(error More than one DTS specified; mxs-bootlets can only use one)
    endif
    endif
    define MXS_BOOTLETS_BUILD_LINUX_PREP
        ...
    endef
    MXS_BOOTLETS_ZIMAGE_NAME = zImage$(....)
    define MXS_BOOTLETS_SED_LINUX
        ...
    endif
    endif

(See below the name of the variable.)

> Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
> ---
>  boot/mxs-bootlets/mxs-bootlets.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/boot/mxs-bootlets/mxs-bootlets.mk
> b/boot/mxs-bootlets/mxs-bootlets.mk
> index adc22767..2003b23f 100644
> --- a/boot/mxs-bootlets/mxs-bootlets.mk
> +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> @@ -65,9 +65,10 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
>       BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
>               $(MAKE1) -C $(@D) linux_prep  endef
> +ZIMAGE_NAME=zImage$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),.$(notdir
> +$(firstword $(LINUX_DTS_NAME))))

The namespace is global, so the variable names have to be manually scopped with the name of the package they apply to, in this case:

    MXS_BOOTLETS_ZIMAGE_NAME

Regards,
Yann E. MORIN.

>  define MXS_BOOTLETS_SED_LINUX
>       sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> -     sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> +     sed -i 's,[^
> + *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/$(ZIMAGE_NAME)";,'
> + $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>  endef
>  endif
>
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://list/
> s.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&data=05%7C02%7Clauren
> tbadel%40eaton.com%7C28583d4b11284523498408dc12b9a4b4%7Cd6525c95b90643
> 1ab926e9b51ba43cc4%7C1%7C0%7C638405835765391645%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> C3000%7C%7C%7C&sdata=koINDlCH%2Bo4Tv20L6jeEvTllYPrpESfnGcFRL%2F%2BbKu0
> %3D&reserved=0

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
