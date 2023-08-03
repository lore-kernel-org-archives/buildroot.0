Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE1BC001DF
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 08:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 012AE41E77;
	Thu,  3 Aug 2023 08:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 012AE41E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xMrefV2MvuK; Thu,  3 Aug 2023 08:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80E3941E87;
	Thu,  3 Aug 2023 08:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E3941E87
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2834E1BF277
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 08:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BCB7402E7
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 08:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BCB7402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DshzwY4qCtD7 for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 08:56:30 +0000 (UTC)
X-Greylist: delayed 3371 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 03 Aug 2023 08:56:29 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D0941737
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3D0941737
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 08:56:29 +0000 (UTC)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3734Bsvr023308; Thu, 3 Aug 2023 01:00:15 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3s51dd7hjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Aug 2023 01:00:15 -0700
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5C9D140357;
 Thu,  3 Aug 2023 08:00:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 657E3A0083;
 Thu,  3 Aug 2023 08:00:13 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 734B24013A;
 Thu,  3 Aug 2023 08:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGdPBALuE0jyWm6m69dN1i3k7H5PK0PZdWTpnzz5TqbRwe1UczaTgnHBa1LI62s3H2UbWg2rBl6L3SSPN2hcb7aUh/rbGMF+66VTTy0ZsUtzIIRGZKNRtf3cD/vbyNrcmQj5QANKUEdS/clgrREfOCTEFa+UZO+fwZ7krCWv8v6KKNPTPnqP9bbovWNz4xZJ4zZTs865NKIifrsMTzFi89pkfEhNwyAyWSzOTixFvlDKa7r7zIf/9VbzyG0Wh8UC1UnCVWCPfDMPUFEoEYVhnWqJBSioar5FhU/YGLLYCJ9m4/R0EpbFPHaoE0ilF/RtnSjpToB+I3hbsrDRYHp8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcQQgnPkhKTNv4o2ooGCWNQmFV3HI6yxP04cW+FlbaE=;
 b=f4m3gF7tX+lXl/dnbzCpLwvbTG0JsykoiM7VpF+4G8jbQ5MMs3CkypA48IuIe6q5aX3aF4VBfCFdTAGNOJtOFEpKZFXdCeS0mf7ZXF5WEHmxBLQubzcr5SwvEzVqn0DkB88xyJbm/F4eHrl2OuX71181hvjrtUCZJcOoLC8AM6m9XTQBwsoM6A+4Zyn0+m5NXy/1hIdEiR6ljyui6IXQTBE0GQzCwXIzUG6sHrOdL22zRT9KwV/kEt85FNU1kv+VyvXUK2OvhAxVCLH0Q8QgRUyy+WHBiMEYrRpeV2AnB/O4X5CGC26GlYyj7KndhgtmsqcbgqxwetJm2iYzBq1AGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 PH0PR12MB5483.namprd12.prod.outlook.com (2603:10b6:510:ee::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47; Thu, 3 Aug 2023 08:00:04 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::1c34:abbc:2647:3ac9]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::1c34:abbc:2647:3ac9%7]) with mapi id 15.20.6631.043; Thu, 3 Aug 2023
 07:59:56 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: ARC support in Buildroot
Thread-Index: AQHZxXxsyVL9JPLBBEuOxJgXjw3kZq/Xb51ngAAiRQCAAKOEyw==
Date: Thu, 3 Aug 2023 07:59:56 +0000
Message-ID: <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
In-Reply-To: <20230803001230.284ba84d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|PH0PR12MB5483:EE_
x-ms-office365-filtering-correlation-id: de8ea6f5-a517-4a5a-1497-08db93f7a0b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Ajs+CDzng9QsEHtUT7BdIyqHQ5exf13IiMdwz6+VJBfyQK1sRbvOKShLY/liFT/acxKB44EX9Y8tgA/du7qwXujmrilUm8K3QFSxXZVJzsIcDwgkhsdI2j6pBoEvlwrIhTYPSfQi/kcOc6GjV/6XGCkPJyGr6Y2X8J4pTaVONpkc4/BIR/xVwaxIBjqzzj8DTEN16i6kSMys5OI6ORPErqkKSH3M2y7o+0lzYwaXtiImwMwU1CdjOy99/EkbvBgXe6x72g5md/wRLFM8bcHH0/OIndJbu9M0KC5PxXuwu2X3/fpbdPY7+ZODRbQgwkZf0tJtV8IItjmNn/3j8mFvmYcWUxLyLBPH8ZGzZRsLzU/t0LoFmCqQIiqiK7DyV2APRH0ye7Ga50gBMuDqj3ws5b9bB1TBMmfxp9djYp+vytl7vzgAy/i2EJ0x3Q3QPLEyIHVW+f/1cJFRZE2b9Xn/7K3hZBm0rqOwVjVmZKxbVK2tIX77HHrtBAH71hkmTNK5jeBjUqJsij16iVOPozsmLeOGhIrcmsrOrTx06a2uhvMkr5ZFk4qjWij+WB7MXzpw3My7Dc2hCFP7ZH4OleyPlKwoc0mudLTy2rCM0/A+1A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(107886003)(6506007)(83380400001)(26005)(186003)(3480700007)(316002)(76116006)(2906002)(91956017)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(7696005)(71200400001)(966005)(52536014)(9686003)(54906003)(478600001)(55016003)(38100700002)(122000001)(86362001)(33656002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1mqDgli9hw/ax7GlirFXkjNV9387DgI/QO3vNaXUGqgtEAzNcSsagrpqoD?=
 =?iso-8859-1?Q?l1DHYagYyETQYJiHrjJldIFrW3lQAiYb361UYAgN7aZ+kBhuObxNJ9dQun?=
 =?iso-8859-1?Q?WufDXID3odF+7wGmEZBRA2b9LDcaHh3xr6X6VFXFaQrbdnRk+HFxeFAFMU?=
 =?iso-8859-1?Q?1cP52pCobO03yxjO4fA296wpcw8jHkT8YrCFcLkBMRjtPJG5t/0yXQkk26?=
 =?iso-8859-1?Q?uRnty2wme3xbVMeP+4JuOOmtjJZUo4/e5J/NSCn46UMFGKZ+CctLkHybZO?=
 =?iso-8859-1?Q?4bI4VS0eB87iSFCyq0Lzg4ulb/6eDK1WeRI2KGmfX4fMUPRobeLm1zawJY?=
 =?iso-8859-1?Q?YKEiEwWMGrPUu+1q6u5lQEFeK3xdE4WYy1Km907RRpOWGLc0GDDdaYDzMm?=
 =?iso-8859-1?Q?0BoFAPXknHhCNPoliAEgVQ/30+AP2qOYn9OYFyDEgmXopNb3YxNT63Sq1b?=
 =?iso-8859-1?Q?n9du8SJfWmnZ+1wbwpmQqsbuZA2zzHIwHBvcEWYBCfMadgI6257eSooKof?=
 =?iso-8859-1?Q?e01ZpjyO32cPjgGH2p8NwKtg1XT1xc+UoalVQieUo58RwAU+CnEMgDTPTm?=
 =?iso-8859-1?Q?XmGmjcaSw5wkUKvMm5coqlH8UPaiHPk6Gw2NfXlP7MOh2N1fGAMUi+J34E?=
 =?iso-8859-1?Q?WlWXlarIgw5eXwtiTviSo4n6r7PMtAtnVWzhWLFRS1l7Ul70oIdQoAQ/xG?=
 =?iso-8859-1?Q?849AMQiypaA3Fj3hpc6VlgV3GQ9sRIkHNTfSJYOSS5riWV2uqvx8JOThlq?=
 =?iso-8859-1?Q?sYb4G05Nw3xx6/CHN8FoMUT9FhtJkAilKf5Q8baHStl0TZXQBoIjMIYyTt?=
 =?iso-8859-1?Q?TFfMHzUAR2dhw9w+glYs291rbl22Ne0KfIk/ZuYZVsa8RLLjCZnhKloWQ2?=
 =?iso-8859-1?Q?TbJ9HovvNc2CbgGbc8DPLmt9kCAWEgFLb9YJUUVyNeojQEoY9XdwDMvvg8?=
 =?iso-8859-1?Q?l/1SrHoxQfRtY+3cYHvDKsly0bwVghP6jvEavbYfo0LDeNTCYqVPItiNlU?=
 =?iso-8859-1?Q?f2E97ntgzEM4e3UAcmG2IZUm6y7WDHcZagwvrh4H10rGw1iF5y7KIJYCK/?=
 =?iso-8859-1?Q?x1E8DMjQ0Fac0Us60LjTHN+61RbTMwJtceFdqJyPHy2bF+yVy8aLbBC2i9?=
 =?iso-8859-1?Q?ttn7++S+iJiPBbv5PbkdMKcZrPivEO4I9dMrHhfEty8gFHS7/ly+jM6xZR?=
 =?iso-8859-1?Q?P9XC+8E4axoYmvBtFlLwEB9hp/klh32jc3vcorL11b3zXwUHOXUjkAtsxp?=
 =?iso-8859-1?Q?wbptPWZ3c8+tYvhICSpuyXOz3CyE2Br2C36/ooxItuV7BaZTMRgDYI+rE/?=
 =?iso-8859-1?Q?YRyv8ZmxFAjQ1M2gn83Q6ts63H5FfzrytiUduKz3+HR3C3ZBOAss2eUqnC?=
 =?iso-8859-1?Q?xW/PvmWSQCDs0V8cnnErmu3uFOMWmnKitKZ04w2AIPzz9WeKRkkOPK7tvf?=
 =?iso-8859-1?Q?PNYyf/IUy2sD5/KtNWOgIUibJeDOAT7me0SNaNy1OsC5hPoXsbVpc0JBcg?=
 =?iso-8859-1?Q?qteVckK8amhBIdB0M56OoUv5gRDJAEqjAYDYzqgpfmBNtc5089DCMWeXTd?=
 =?iso-8859-1?Q?pTOlZwAN5yMbsa/BNtuV1R2XnIrteKRq989TJO1rvqe2i1GYzDXmUxPuBn?=
 =?iso-8859-1?Q?lA4qthsC/fGOw2xiDGSAZJzG+Iq77DCnlr?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4bFtYrKq/71noshFlv0LICOD0cfjS+7dijbCl2zlPYfQEbHJ1IcQuLbgGEQhwjtBcdkQLPRZzUMvX0Eo5ZQAYxr3K1GZKkI1Msnnr6rhlcVad/ov7lLwx8iVOmcscIuU2cyYLSIEONXC/v8MsumgtCCykmoBPEflOsjOwgSoNSpFjVFFuirtbbnKbEBzZJ/XP10tpRBq5yW9Mxmo1bqhcL2/Usm2AgNMWptMcrbCpCJbiy/TNz03RTfeAyogyJWDX9HVZcVso5vW++U3fP8HOGMzwespSikJQtWRA05thMdy9OYSVJFUvfxR8UnewWUAQ+h9NnzkV33QGN64T5hq/4GTk/JbZsQr1Igik4LNaUTMAVIu+Md7u3/kQxkE0ZmPkvHygh6hE6zSlYkKM36ODQsXB4ICKUumXuWWbXGHkbiNo4elZxr+fcH1NpFZoEwNhKmdI7i4yKD2m9YaRP3qZVA8azF30Pzdx+6Ia3TKzyKK11MXOM1KMGP9kzeS0lQB4u7ghq48ceiW5KrxfFMLa+Bm5leRLionoNij7uy0Spguuih4ebSClFKN43yHJMJEvpCQ/HBDuiRcwJ03+4mQxEX8I3J2eWYblY6NNu4rkr8f6X/kofijhn9hHYNRGHHGqg2Yy4c3ln/MikXj15uv7JT674LlUgMEMhXYXahpb0gfgdSpWg+Is7seufkXRUdL3I9KjnWpaCjvByktokOo7CLnyNaSD39fwmVkOKLqBHY3ZnwlJyBrw6Pt5z80X7txG4dUaC3jRfBL//N4OIF2zvY4VOwSsgiB63nNffhJKB14QtoUlU1hvY4oWFtDKr0wRwKzTKvuViC1G6tT0y7l3Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8ea6f5-a517-4a5a-1497-08db93f7a0b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 07:59:56.5123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: migkzVFhe7GRMKayEnu2a33zrV18yx0s6h8SbkHjE3im/cdBNdbmUHqq1COHfzSpFkwvJdYyOHpTpKrNLwuAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5483
X-Proofpoint-GUID: iV9ZGUUKBbzFYhz_9W522TDxuW7JrHlt
X-Proofpoint-ORIG-GUID: iV9ZGUUKBbzFYhz_9W522TDxuW7JrHlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_06,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308030070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=gcQQgnPkhKTNv4o2ooGCWNQmFV3HI6yxP04cW+FlbaE=;
 b=EtUnhVx//eUp9/LxTjZ1bZLByp16ssqKTtJt1FrAnWgNrqz9TdZF9YrYgrvk2ZFh4N4V
 nep1CFER/1Z7Sp9xjlKLU/Pcn1Y+34SY3VPhAMaMPpFAyCd8NXlMIp21aT4B9BRQskdx
 hDNcD1T3K8RmZjl4pCH081Qzn5CJUquJkbgEBnDFgwRseONkOfD2v3Y55fg7dwlskcS0
 2MQFeEtjwT2dJPqSE1TGf1EBWouDuVUoMJ7j6V/OTRS0zDJJXG7CYI3pzQlN2uqZkOQM
 /59wsi9kZYLWeGIf7zf3ULA+9cgny+QzZ5yT3KtCgPhlTpy+ilzOrAILo9aZEIizR8Gi rg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1691049614; bh=oqLkpti2S7DwLRjlVFiADOiUIMrjQEHvFRMVD3zDy/o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=AAt7XbjRUzuV4Qy4fJiyzMAgWHYE3UAlDT/oyiSk/CUmtjbfZF1QTt4NhQ4zclunE
 utdjBCL6DegHM9xRsTHoLsLjAQyDLXXevxc9eDWeK3b2gM9H1s7nZse/Niidq32K/6
 q635H+yVsQnmcirSu41oMJyy8SyYV8pHOFYbZp45yUFlnrwJW6ZGRZ5HoL1TbEBuaL
 2gHV0kVdwwKam6qxHQrDAoL5cjGYkCaaNflXavf2vQ3KRLDjvpyesNq227pNQcSOVL
 qszPJii0y5FpJd91A87ZegFqFnQT9SRC7HeP13/vDRNekw//P6jp11rjwfq6QfBP3l
 Ytxx8/hR4B9HA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcQQgnPkhKTNv4o2ooGCWNQmFV3HI6yxP04cW+FlbaE=;
 b=TI2jXK9wig4wUsg86cKahRzupqIc20sxowpXD9tyAnKGhuV2xvGC5d6ifDY+hHS49Z37FzVHp3XuQvOQ2oFmFF5EIQ5F6pzqML3RLnzQSxwG3HQXDA38SLfAlHTZDX0HRPTfaf7yqmUlFYI3EkVZ12z7CYRaxr8W9XMSo+o6lb8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=EtUnhVx/; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=AAt7XbjR; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=TI2jXK9w
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=TI2jXK9w; 
 dkim-atps=neutral
Subject: Re: [Buildroot] ARC support in Buildroot
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> On Wed, 2 Aug 2023 21:20:28 +0000
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> 
> > We do have an interest in ARC cores support in Buildroot and in fact
> > we and our customers actively use it.
> >
> > And the reason you were not seeing our contributions is two-fold.
> >
> > From one point of view ARCompact & ARCv2 support is so good
> > in the upstream components that barely anything needs to be done for them.
> > Possibly I'm missing something but the only report I keep getting with
> > ARC-related problems it's glibc build failure for ARC700 - that problem
> > was discussed some time ago and I sill have that action-item to fix it.
> 
> Well, if the support in upstream GCC/binutils/GDB is so good, why do we
> still have ARC-specific version that are now outdated?
> 
> config BR2_GCC_VERSION_ARC (based on gcc 10.x)
> config BR2_BINUTILS_VERSION_ARC (based on binutils 2.34! super old)
> arc-2020.09-release-gdb for GDB
> 
> Can we drop those special versions and assume what's in upstream
> GCC/binutils/GDB is good enough?

Well, we'll just update it to say 2023.03 [1] or maybe even 2023.09 later
in the fall :)

And the reason is that ARCv3 support. As I mentioned ARCompact/ARCv2 is
well supported in upstream GCC/Binutils/GDB etc and all the fixes go right
to the upstream repos as we have our own maintainers who take care of that.

So, in theory it should be OK to remove "arc-xxxx.yy" toolchains from Buildroot.
But since we were a bit late with ARCv3 changes for GCC 13, those will only
land in GCC 14 which is going to happen sometime in 2024, I guess.

Thus, we'll need to have "arc-xxxx.yy" anyway with sources from our GitHub
forks, primarily to support ARCv3 stuff. Thus, I didn't want to introduce that
turbulence with removal of ARC toolchain and then adding it back next week.

I hope it explains the situation.

> > And so, while it was all work-in-progress we kept all the work in our fork [3],
> > including changes related to ARCompact & ARCv2 processors.
> 
> Would be good to see things being upstreamed of course :)

As usual, we're working on that. But you know it better than me - it takes time.

> > Great question! We do have now QEMU port for ARC and similarly to other
> > components it was not yet upstreamed as we wanted to have ARCv3 supported
> > there well enough, which is achieved now. If of any interest it could be
> > found here [4]. We're still polishing it, but it's definitely usable.
> > As a matter of fact for a couple of years now QEMU is an essential part
> > of Zephyr SDK [5] and used for per-PR upstream verification of Zephyr RTOS.
> > And since Linux along with Zephyr RTOS are the key payloads for QEMU, it's
> > only essential to run Buildroot-built images in QEMU for ARC.
> >
> > Now, why you didn't see any QEMU-related defconfigs in the Buildroot,
> > it's because we intentionally introduced a "virt" platform in QEMU which
> > fully matches our reference FPGA platform (HAPS) and proprietary simulator
> > (DesignWare nSIM). That said "snps_archs38_haps_defconfig" will equally
> > well work on HAPS, nSIM & QEMU ;)
> 
> I think then it would be good to add a readme.txt in Buildroot about
> the snps_archs38_haps_defconfig configuration.

Clear, we'll clean-up that mess and will add readmes for all the relevant platforms.

> I think the action points are:
> 
> (1) Drop ARC-specific versions of GCC/binutils/GDB if you confirm it's OK

As I said, we'll update ARC toolchain instead:
 - Primarily to add ARCv3 support and while ARC toolchian will be there anyway
 - It makes sense to keep it for ARCompact/ARCv2 as there're some fixes and
   improvements which are not yet upstream (because release schedules don't match)

> (2) Add readme.txt about the different defconfigs so we understand
>     which platform they target, and where it can be found, if freely
>     available.

We'll do that.

> (3) Perhaps make it possible to build the ARC-specific qemu, so that we
>     can out of the box have a qemu that we can use to boot test one ARC
>     platform. Then we can enable that in our Gitlab CI

Well, QEMU for ARC is easily doable. I guess it's more of a question on how to
integrate it with Buildroot's GitLab flow, any references to docs on the matter
(sorry if asking something simple, but while I have your attention, possibly you
may point me at something immediately)?

> Yeah, definitely. Next year ELC will be in the US, there will be no ELC
> in Europe. There is Embedded Recipes in September in Paris, then FOSDEM
> in Brussels in February.

Good, I hope next year I'll be a bit luckier with traveling.

-Alexey

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2023.03-release
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
