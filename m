Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D14CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 05:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A506846FA;
	Thu, 14 Aug 2025 05:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc-Gbw1r97mg; Thu, 14 Aug 2025 05:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57CCB846FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57CCB846FB;
	Thu, 14 Aug 2025 05:27:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB21271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F4704007F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrdSfUAyraes for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 05:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::60e;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52B2F4007E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B2F4007E
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52B2F4007E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 05:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX+Sxx4/2zrDKtLJXnMpVFilkSVdv9ptGrA2V5MSlHHGdF4BKIiU8APpVjdh90Va682oigfTeLHJOC+nBv+BScw1WcCa2UdaPFbML/Y5z33sPNE+Wttvyos63RyCfDugVfqTgxmSvgGTzk6Sm/8G0JO3mMJI5dNFZkrBgRQa6mQfPvhc8HtDpacyNJk8/bJyIr0+kz8DpdGN3qHksdnZicAUjmR88qLtXA1dE/AmJT37yp1bsGRfn2FeKnz4UtjKsjPeCNjgOQBWbBvw7wZTkGOJmxhXRNhry51XbMgilxh0PTHe9oTWLjF/MkmjaPDKd4pgvNI6iIIyH7zktQ651Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+luw5YXp14os3r67Cml96M6nLRy/My2Mk3O/YHFvvzg=;
 b=rhhoBR3LZw6gDPLjjvv1fOGm/w/YPsZY9VUxSCRbjgPBzp3h7nqtkHJ0iZ3Zr+oaNdD/ujzk3yDId3yH2tDI4pHqzgsZAGtiBbzomIXK1zmiico6KwglC/Tb58rRlG73EKNT7Qyh24y19nV2Tz+E7PcDZv76bJQfMJ0utPr2Q4ukPx4RM4ws1fHzrNH+lZJnNUKCdTxI435s+5rI1gMt4If7ToMlXwL9haJnUP3YYOILoW7RCSRzce6E0RAOI5fT6zMPNZIwcTEAuDTnBj5Cc2rZ8XVxct2Lo6oqe+8lW8oQVhiokh1AeIUqTjaT2p994FCVAN7wZVHukRsiCf5b/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM4PR12MB6352.namprd12.prod.outlook.com (2603:10b6:8:a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 05:27:53 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 05:27:53 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTsyAgAAB8ICAAAOasIAABXwAgAAF3OCAAA29gIAACYbQgAAd3ACAAA2dQIAABgwAgAAL1sCAAA4wgIAA3A5w
Date: Thu, 14 Aug 2025 05:27:53 +0000
Message-ID: <SA1PR12MB5615B50AA7E352187C3149E2F035A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3>	<20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
 <SA1PR12MB56150000BDD0EC7C783A9CEFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813153132.5942d8f7@booty>
 <SA1PR12MB5615D280061C41231F1D0DA3F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813164154.797c9077@booty>
 <SA1PR12MB5615804C1824C82F59F1FEAFF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250813181503.0a6b1bfc@booty>
In-Reply-To: <20250813181503.0a6b1bfc@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-14T05:22:39.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM4PR12MB6352:EE_
x-ms-office365-filtering-correlation-id: 1388a55f-1c07-4325-1693-08dddaf35193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?d7BdL1D+fBTPAv9XvOnpauNDC7hyJL8r8m/hT8UGUu6yJjNrvwsZXI9C+yFB?=
 =?us-ascii?Q?2kd4xgQYexNrP8EENKZl+qZu1ypWw3LRfb5c+H/efFcWVI710c681gk0wj90?=
 =?us-ascii?Q?eeAm7+XcfkcA5Qzluha2CszAfNqpfx3OrzpBHPeyHL85pB5Pu7J0X+t2gJd5?=
 =?us-ascii?Q?C9vRVY0/CiSPe0Lm+GGv7frE5xNEATi6OHyIIxqWH6E+QXm2pXNi0jYAevgm?=
 =?us-ascii?Q?HQFzzo1LAApcqJm+4Dtu5qlSK+Wa1to50y5Fq0oCq7EcYyOuAtKQ9TjJ5xvP?=
 =?us-ascii?Q?WqJbNVJ7V7u9FF5Ls1xc8GN9hghqxiw0fIlT0QbMPraX9jfDz5uglHoedIA8?=
 =?us-ascii?Q?ysGeLQPpk9MvN6qG1vnO3WFeRWRHk6i+RocuS39JCayWWwdpoT66Vqydr7xM?=
 =?us-ascii?Q?Ma4OAPNlk1mynd8X300PJ04l29noI7KzueZgSvVMzMH2UdOW8JTcEhiEJpGM?=
 =?us-ascii?Q?kkLhFHnadxTpsDOwdTf3h5/gDb5HrAzR6+tWUGllcihl7kSxT5Khh5vfVvhy?=
 =?us-ascii?Q?jqvaXrSLk9mHPVwSxb6TO5SrFH4kDXiIxiPiJ/aLXWChTD2OHUUEPoGLBP1p?=
 =?us-ascii?Q?suSasGYrQE8eJ4lyRB2xcYaWRm+LIQxj+6rjmU/QMMBUAU/Odl356v1s4xID?=
 =?us-ascii?Q?QCUObT1GvDq/Yim6VY++18N+MyIG3iAVavYobepRDqY7ZZgNya4rvYKDr8tK?=
 =?us-ascii?Q?uaT96p3ne5rI7V/ZxjqmdhXOfwohg00hu+/WyaaRxdcXUgOq56ys+Uz5y6Nr?=
 =?us-ascii?Q?lW0kyuckONKAJaOwbs4Um8HluV1B6McjfX3QsORDYUATBIhNRq6Qd1aPrRVm?=
 =?us-ascii?Q?u4P329EkWT8HmQp2fJ4H+7HBQJhfInKbh6zb51PvimrYWVluBNaQxaVNTW7k?=
 =?us-ascii?Q?SBRadbFgFkB0pjjWc2rKSnETtvwRtnXofG9e3MHAYItifoW+kdZMNfPErIyi?=
 =?us-ascii?Q?9JU4xdR6RcZtw2A1dTQONtGMPpEK77lGh3xdTQ8WSwL+M+fYm8mqLg1ruv00?=
 =?us-ascii?Q?LR+M8G7rE+Tyn/KjNul+BaiYCZHb/INvNFp/6xtzwOUe1hAvDYklt39uzIVQ?=
 =?us-ascii?Q?tYhgIl2WGGaMDU0NDt69RimEWsbtVswjASCARZVDdjZb912tZ3I6lWU3rf8J?=
 =?us-ascii?Q?bDbOye6zl4XVIeSJ4lCNY4V2OXt3FgnoNHxP4dVYhDleRJ340jw+0B7sWFzc?=
 =?us-ascii?Q?XyhTBzr5H3QX2rCzekt7UuQfYcQAyZOAwULRWTsYXnI6ltRtkKfWbiAvsbmR?=
 =?us-ascii?Q?LjNLYBGT2OHlSMTVVfgpELxhzIrqJXGMcwTg+IXhifjT+IrbtoYlxyi7qgU/?=
 =?us-ascii?Q?nue7Y0tvLuZ7EMGEIRT4xUlBDqN6A5BKg+64sbQb9fDDczgQWEvti1V3ss7u?=
 =?us-ascii?Q?dUyfL1GIrcW0fPgzVyTUWITS0KcAWNLCtcihqM/NUZLkojTBK82LD8WvrYB9?=
 =?us-ascii?Q?adL7GQ1DuoDeynaqJ0u9dsCdDYE0JCDwku4MBVwA9a12nvQJw9dr7z5+biHi?=
 =?us-ascii?Q?8WMcsKv18evjcichyG7b17DzDHUhamGu4tc9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YiJ/57gCofNci7Sw8LXSsvrrArmLA/Zv/RK5pvvi10Jdg/lg1wiuh03p2aUV?=
 =?us-ascii?Q?bwWjueMeqbG8Mcxnw0cD4fzlhR2dDV8mRseaZfgq90ppd/64bS+klbaRDfHm?=
 =?us-ascii?Q?iyB2RBgYIfPS/gw9qe8O9yfZICI/e7hi+Fae0dSqKvQCPILm3ZPvJlJspyTt?=
 =?us-ascii?Q?cjAmD+D6D5O+3KWlkT/AMuVwnmi1zDiXoNcTja5ASsGLxK7IxNGZeL+GI9Gh?=
 =?us-ascii?Q?ECP062KFw3v13a96b+GaeZHwr7cUg3KIyGViuDirsO6d1js0muxdYTsM7usB?=
 =?us-ascii?Q?myID4u8sNgJSQPAJva/s//IdX6jXkt8C6x0h7gMf1yc+lfLlhg5jIoX7rdq6?=
 =?us-ascii?Q?8X0mgsjdBaZDhgcqm1BC+p/urVWutpIrqpvbT5CXUg0M4TMmtIejoU4FJyp7?=
 =?us-ascii?Q?p+Qz66I33LGGPHsTAIbq50pjMQqbxZKxdTNFAoCF0QFoe2IoOvQez5WsvHiL?=
 =?us-ascii?Q?O3t6UEq20ufSTIFGJH05PPtXKOAUUWee5OR+V6ckhCGNTfl/rcH3dMxigaI7?=
 =?us-ascii?Q?nYU86i9T6CbAW8yhGcbXvoO8E7pAgLHeDgQDpTH/LpCeV9VygbVXSth8SNuJ?=
 =?us-ascii?Q?VCygYFDM8uoGeynx+QIFsSkKryaDk5MA0gATiCyjwNb9dC48SW4+ydjUU1XT?=
 =?us-ascii?Q?Ea79pTTWLvDHgW5Xb23LWsZQ0frp7Vyiezsn9cs6cApR9JDYn1L4tarnf1jc?=
 =?us-ascii?Q?Nu09RoWpxEJW262RPhrZU2rlDU/Df0Qz6cKB0uhKJZ3uF+h3rwtnd8Vjcfrp?=
 =?us-ascii?Q?8dn/Va4JZe8x+51Scg1g8bKlo9pclysUC305gGBT/KKnmPIu1VfBO3mg/+RG?=
 =?us-ascii?Q?Yfa5ltxlhZGq9vnO9qzKWiGe5XP8x7aFCAgwU7Ejpo1vSizIABFafXxJk7g1?=
 =?us-ascii?Q?K5Jyfol/8CNH6MCejQSaXZyR09fcy8b89bPIIKJEM0VKmJz64/W4fPghHbJx?=
 =?us-ascii?Q?8FLveKSx0ULCWh2g0h/mXc2eNhVZckj/SSmPi/xyHtpglF+DsDNHqpPrQWo4?=
 =?us-ascii?Q?wP7Ln2GPynuaQwyTsepPPNmJYkwN0EyphTRd6oFIsmfaYL5J42ygxa2S3hva?=
 =?us-ascii?Q?zJKYEXRzMExDqlcwWBFqv+N7mgiZGhp2if0JIOI+27BKDXFcoRM3h4B5Dmnx?=
 =?us-ascii?Q?jp3s31NDiPA60/WKTOqCKNJrftJu0u4JudPG9ZaUc2mL7E+8N1ySpJ02ojik?=
 =?us-ascii?Q?QGPjsslVNhWniJT9aWSbxk3S0zgnt7P44uBn/wtWRiq8xzKP/DkLPyGXPXWi?=
 =?us-ascii?Q?hlHxqymEowq5H49IH/rPnCIZCwpZF0jXt8cME9Mgaz2YV8R7GUsPiB3svaHe?=
 =?us-ascii?Q?utGJQ/ZzTAWVgsb1GU2CMh1mFZoKCQBQhu22+h+kEqZIs1/IYcd4NiZfpd7U?=
 =?us-ascii?Q?VXAok2wj4bW79cKT8PLh8y2zoPWEFXnAse8H0qhE8V+7YuxwSBU/aA7arbj2?=
 =?us-ascii?Q?lfe3pKQR+UTS4rwN6ySk/7sbhmkiwrNKaNFUbAaBWbvCic/+MADS0GDMxAO1?=
 =?us-ascii?Q?TWpBNqbgp7CJJK5U9YTE6Z+/j8cqwSTEzvIYTbF5ylbwV9yIMMpdN/ejxer1?=
 =?us-ascii?Q?FfI3ICbyJlvn6Fh9FgE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1388a55f-1c07-4325-1693-08dddaf35193
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 05:27:53.6828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IleWRs864bTohckMrS56FBOv3iUQc0thHCJHaAy1LtEmJ7LY77g6Atr8xsd9LUdR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6352
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+luw5YXp14os3r67Cml96M6nLRy/My2Mk3O/YHFvvzg=;
 b=Jn3Dk0zfL4DFzIz8xwBH8ZeTbomzckjRtJz5aAZIGTch5g9WEP9BvAg/908nxjfXZpyaQ9WTFw0rfsapMIRURGf805uqOMiPQ2e5ebXlddmeXDp4nZQY4i9N0hzkvcMChcKeL5b//BWABcEiSNQP0X51fLrQrLeTaSqybztRM1Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Jn3Dk0zf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

Hi Luca, Yann,

>
> Hi Luca,
>
> >
> > Hi Luca,
> >
> > >
> > > Hi Yann,
> > >
> > > [--SNIP--]
> > > > > When the dependency is not tricvial, I think it is good to introduce an
> > > > > intermediate symbol:
> > > > >    config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
> > > [--SNIP--]
> > > > I see your point, but don't you think adding another symbol is still
> > > > a bit overkill?  The dependencies are still only 3 lines and are rather
> > > > straight forward.
> > >
> > > > This would not be unheard of, there already are a few packages with very
> > > > few arch dependencies, but that still have a dedicated symbol, see for
> > > > example (some are more interesting, as they do have comments for each
> > > > dependency they carry):
> > > >  - bayer2rgb-neon
> > > >  - bitcoin
> > > >  - bpftrace
> > > >  - dpdk
> > > >  - host-flutter-sdk-bin
> > > >  - (host-)gdb
> > > >  - gtkiostream
> > > >  - ... and so on...
> > >
> > > > Note that we usually do that for libraries, so that it is easier to
> > > > inherit their dependencies in selecting packages, but of the above,
> > > > only two are libraries.
> > >
> > > > But maintainers will have to decide what they want. ;-)
> > >
> > > In the end, I changed my mind on the issue since there are two places where
> > > the arch dependency is used. The BR2_TARGET_XILINX_EMBEDDEDSW as well as the
> > > comment about the dependency needs.
> > >
> > > To avoid having the two be out of sync, it makes sense to create a
> > > symbol BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS that keeps all the arch
> > > dependencies in one place. This way, when I add BR2_cortex_a78 in the near
> > > future, I will only have one place to add it instead of two.
> >
> > > I agree this is a good idea.
> >
> > > However the same logic can apply to other Xilinx firmware and related
> > > packages, such as xilinx-prebuilt. Thus I'd rather create a single
> > > symbol that can be reused for both packages, and it should probably be
> > > in boot/Config.in. It should be also named without "EMBEDDEDSW", e.g.
> > > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS.
> >
> > > Side note: I personally don't recommend sending new iterations so
> > > quickly, without letting the discussion settle, it produces a lot of
> > > noise. I'd wait at least a few days after the latest e-mail in the
> > > discussion before sending a new version.
> >
> > Yes, you are right that we can create a global symbol in boot/Config.in called:
> > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
> >
> > This symbol could be used for both xilinx-embeddedsw and xilinx-prebuilt.
> >
> > Not only would this enable us to only show the xilinx-prebuilt package as an
> > option when one of the correct cpus is selected, but we could also use the
> > BR2_cortex_a53 and BR2_cortex_a72 to limit the available choices in the
> > family variant selector. This would prevent selecting BR2_cortex_a72 and
> > having a zynqmp or kria xilinx-prebuilt family selection or vice versa.
> >
> > It would not change the need for having the family and board information
> > because the xilinx-prebuilt treats zynqmp and kria boards differently due to
> > the directory names where the pmufw.elf files are located even though these
> > are both based on BR2_cortex_a53.
> >
> > But at least creating a BR2_TARGET_XILINX_ARCH_SUPPORTS would put the arch
> > dependencies of Xilinx components in one place. We could even update the
> > uboot package BR2_TARGET_UBOOT_ZYNQMP symbol to be dependent on
> > BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS instead of BR2_aarch64 as well.
>
> > Sure.
>
> > The only exception would be the zynq platform. The BR2_TARGET_UBOOT_ZYNQ
> > symbol would stay dependent on BR2_arm because it is the only family that is
> > not an aarch64. I suppose I should add a BR2_cortex_a9 dependency to
> > BR2_TARGET_UBOOT_ZYNQ as well, so that it limits the option appearing even
> > more.
> >
> > https://patchwork.ozlabs.org/project/buildroot/patch/20250619153922.891360-1-neal.frager@amd.com/
>
> > That's true as well.
>
> > If you do all of there, please keep them as separate commits in the
> > series to be easier to review:
>
> > - add BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
> > - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in xilinx-embeddedsw
> > - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in xilinx-prebuilt
> > - use BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS in uboot
>
> I will separate the patches to the individual Config.in files, but to
> simplify the usage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS, I plan to
> use it right away in the first patch by doing the following in boot/Config.in.
>
> +if BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
>  source "boot/xilinx-embeddedsw/Config.in"
>  source "boot/xilinx-prebuilt/Config.in"
> +endif

> Aah, yes, if it is that simple I guess a single patch will be fine.

Could we move this discussion to v6?

I have created a patch series which I believe is much nicer that covers all
the points we have discussed.

Could we start a new discussion reviewing from the v6 patch series?
https://patchwork.ozlabs.org/project/buildroot/list/?series=469156

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
