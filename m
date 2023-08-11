Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDB2C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D552416F2;
	Fri, 11 Aug 2023 22:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D552416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXI5Az2_2qA1; Fri, 11 Aug 2023 22:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3118B41E84;
	Fri, 11 Aug 2023 22:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3118B41E84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9ED81BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89F741E84
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89F741E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fh8rPeymWpxt for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:34:42 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 918FC416F2
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918FC416F2
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37BHuEb8004387; Fri, 11 Aug 2023 15:34:38 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sd8yand8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Aug 2023 15:34:38 -0700
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5CA98404F3;
 Fri, 11 Aug 2023 22:34:36 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6DC48A00A6;
 Fri, 11 Aug 2023 22:34:34 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2A86540169;
 Fri, 11 Aug 2023 22:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5W8XHMe3nGvkFnlNHL4h7R+1v/UDKJ/U9jrkrXZMmj7Q5L3o/T1nmPGl61dMRKobLhtFvHsBRuf+SDziiYhKgT40lWvihSwrVc2ES0gcLWEoZR45W7VbhHsz+vNWKRSBtHY/4fyki/jQk8HUNcJAuGNzwInEeL3bz/JtYJuq6ilLY7OEaKIpXo/wmgdCVMNHV7gZrRscV/DluAw5sazXRV06g71Z7RuaYrg9GASi5fok6qyHltSPxYP0MTCcabQrhsWp3zGkNPXiQL8Xm2Q9sAdK8Kq0uJcDgLFk5MPKJMALMRnfW8hJmMaczjQW03QnIVy9e0nt2dPlxElHh8RLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fEU/i0WhDkR29CWGw082DPbyoHYEmqSvoKcwunFhyc=;
 b=EcegvYb4pl11331vdcJYnlG56dtcNw3Xy1Jj5cYa1L665TqVGGOa+/M+8WBdmQGnDasjrjUYWnuXMPURuJI9hTchNeNn3s8QdDWMka8WqFqBZzGzd8GQ6M2YfpzKeYkypl8JyP4c3QVeCAxwNRo4EqcQhJL7QAu146hDG7HAo7tS4/FLy3ystMAaTBpdG9HjH6BcPFu5X6fJeHeFtLsmJutoMkd7oI9pPlzQnSXlPkeVs3GqwRu1OIGJR4eFrzAAC9qbazZvANug8Vbf2I3mylllOYr0k0DudS2fHh/vKmIanw+tiNJRCk65n4Syz6JlCXLTTdizyQB4kC1j9T6Dgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 22:34:28 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::d13e:94be:b491:40c3]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::d13e:94be:b491:40c3%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 22:34:28 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: [Buildroot] ARC support in Buildroot
Thread-Index: AQHZxXxsyVL9JPLBBEuOxJgXjw3kZq/Xb51ngAAiRQCAAKOEy4ANXKsAgAAoToCAAAJ5vA==
Date: Fri, 11 Aug 2023 22:34:27 +0000
Message-ID: <DS7PR12MB904183FEC62ABB8A5A372E65A110A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
 <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
 <cc38f5ec-c613-2323-e288-7fc1d0b186b6@mind.be>
 <20230812002503.33f6d5c3@windsurf>
In-Reply-To: <20230812002503.33f6d5c3@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|SJ0PR12MB6781:EE_
x-ms-office365-filtering-correlation-id: aed6b2eb-5e40-4ead-030d-08db9abb1f37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vdLPGDNbKPMl6mP5VqTEwwOn+CWYnAnbVNcVLtjoIVMYd0XQiXOAbmZaVDgFSeDiJYHcRrZCymN8eAeXyvzTMTuAHshpS62n3zMkmI0ngYo/xaVnE/hdYHzefPpG8lDyw1Sq+gjPy8uv6aCukBOkYKcehNq2nT0RXiCUl1nl0XM8nAeT2j/5LTXnYN9zOV6SSO2HFeaszuGjLcv5KstQBR8A/7xmphq/OBj7PdkzayErENGOPsDCfe6F5wDorxVcUI24qZvG6RrA9ZsOh4H6Xt5GBCqImEVO/bfyePsgXtzNmJh8HR6liMT4kL+56wEJIFZR3nSftjFi5k0gRkaozBRuvEpqLLzMg3BGhuaB7ku+IwzmpGkZKrNFBo/eEz9UhaIizEUscPm+DtH+vIRjTiMBZlaRBXl7yh15DjWBoNSBHfdWZ/d7BEtxzcFsZ7lxnODYcht2GncWvzvKwJsyhx991bpYD4vHTkaKa9SHp5Q/OFX6WpxiaZAFsjGyLEGj2rKPGgv/O2PwEks4EP7zjwS5o8xLwj+KDW1lcDYpq5r9IhxnaRWBG2UVoy8D9P2ag06z8x8Hzvf6Whu8NZK/qG4T3UGmdVzmT37znu+mb5M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(1800799006)(186006)(451199021)(8936002)(8676002)(41300700001)(2906002)(38070700005)(66556008)(66446008)(66476007)(64756008)(316002)(76116006)(66946007)(4326008)(91956017)(5660300002)(38100700002)(52536014)(54906003)(110136005)(83380400001)(26005)(6506007)(478600001)(122000001)(86362001)(71200400001)(55016003)(7696005)(9686003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6hUssh+DVkDMdwOiYZS0e2aeKhcmgCjYfrOdfaFv4Sv+uypQ/vwSS1b79n?=
 =?iso-8859-1?Q?7jCuSTAOjZ9TfZQqkRy6oN4gGJlC68pZ050eU9W8/ZbRGLjd7yAgsOGEIo?=
 =?iso-8859-1?Q?md0+jX9TdOFxSE2ZYGxdJHh3KKG76W3IlXqRQaUTQmhKJkyHC/StREYtOy?=
 =?iso-8859-1?Q?EN2NOt8KdEfhbbBulNjPr+WvZ0/zIN20MepC7bxjHM2KC7FIbxdnp9aRd2?=
 =?iso-8859-1?Q?9lcdgn4OG3OWXEqyBKDe7WGoym21kgBmEXRrxH4SlKUIONf+u0H4+bCORl?=
 =?iso-8859-1?Q?sf6pmvAa62lzfS+jIML/hfIUI/Q7eMsgpRAYQgZFxFJTugn3GyjttbVLTy?=
 =?iso-8859-1?Q?Dmyi8WvKSfEA2flnfiHg++y5uYbsHcAU34zHTGmiB9agqpmQC7MhEY63tV?=
 =?iso-8859-1?Q?t12Y0Hop+xEtg09SzezTFXZXMLxBPgZjHz7fRujtuRveiQLOMERu2uTWbD?=
 =?iso-8859-1?Q?ZLiqfVfv/lT0lyWk5WYny0WGrx8b1CMfBGPr4g/A3YI/F/VINDLexaE7zP?=
 =?iso-8859-1?Q?XtYm2E3Kik7UgPIbQAw5o2BI5NTowQKjvUudvB2yqzPvBogEBcKlfva5/2?=
 =?iso-8859-1?Q?2fE6QicHJSdEvyixFzWkCmdl/h+SxEcykb2483sQmxdJGyfN+D5e2Dx7pw?=
 =?iso-8859-1?Q?iYK3nKDipo67ieER9qeYnF0CzcLxiV3Oq6XS0nqGAh9n3j2oEhoo5YjbqT?=
 =?iso-8859-1?Q?7CvqJWaQX4bPmloZuiMWE4KtmyjnDOjAJ1KfHqcTM73r/IGtQQDJOhXBRM?=
 =?iso-8859-1?Q?Yu1IHY463OMnzN3C+tYZdJQ5UsS6uch1ylCF2g3x4562CLZCy7I/RQ9QCQ?=
 =?iso-8859-1?Q?IP3TZMM7gexGvCEsvENKcle+cYA5KT17TeoRNjOAFudwnyUbRVuXHETJCZ?=
 =?iso-8859-1?Q?KPYYyd6sTIb2DwaQFAOaSEBMCVR2sPkejZ1ZHxLJQLg9RIl8h2M3A+4rXR?=
 =?iso-8859-1?Q?nWzi2wzDN2qv6h2rCWwxgLfo2WntLvAN+o6BiyT4VBuCo3SruHGb2CFvVa?=
 =?iso-8859-1?Q?745QGwQWp6ceR2Ceg7BvNokUaQ9x8fSV6VtEslS7m3Q8m5So6gdAO3Z60H?=
 =?iso-8859-1?Q?ss8Co0ELYYKxcP354ZNoxvqBfD9tb2E5QduQuUIHXYdnlLxWfT0CAKO58c?=
 =?iso-8859-1?Q?khLOsUkwKh+QBnXA6IN+xot4zqUAMCqjy7RtMU/uJ4xuR6jL89c/6mz2Fz?=
 =?iso-8859-1?Q?q4yCjKMXUPB3NzKdgoHQu7BlvOSES9xO/tRPjI2XCDS56hJ53gqWjGOyIn?=
 =?iso-8859-1?Q?jf9M+/54lHI6lBnhkJdQvxBr/0SaRzdEuX9GHuBXygqOTZpq3/o5hZLpbu?=
 =?iso-8859-1?Q?k8rpkWcspZpWg/SIUcyB116om2xzKQwZbQ09njO7Sbg6Xgak9nXIsAt/S2?=
 =?iso-8859-1?Q?v+7OHPPl6M6Bo9YmkifcZ4YDTz/Rtld+C8etd449/SBXYTj4qWvC6FkV8A?=
 =?iso-8859-1?Q?4wdPNCjvSW+e0UlYmiPOpoyZqLHqR2VayYRfklGTjtxy0uaTgX78MeENRu?=
 =?iso-8859-1?Q?M3nuGcVfP4QyoonIFdUU/XxmUk6LS/t5MAjONIUhj5YCpNikN9XNRYpMij?=
 =?iso-8859-1?Q?mo/lkk4VV1oJ1+zH6NZGC53dFTCX7gwB9ei4fHtGC2uLb2fOfa+nLoX/Ha?=
 =?iso-8859-1?Q?cIIdu+RsZPsGYB3M8nbkKNDN3pK1N+YmbY?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ef5x5cQuesQIuBl+dxloDB0ZH1hTAOyuXmN5itdb98ruXKQvWV2bhx1wxEM18pIRGq9Yhcsc2K5Ok+Puk4hT8n2qE0Kv07bdkEGEORAmN9qLfI2098HijdTsMTLtGY/GIOPQLCs7C5gUMxp3145HUZFeKKBiPzBCT/H5xp/TpfkmQs9fwbQXvK/I4FJ3S+Ld5B87pEndpYBvllT5F7TTfuiHKA6rRblufyDzzf+BJazfGq1QrAbkmifvfO/V28cnAr8jzhNZ35LGcVYtoqeCWyszoYLaDaWRqyA4Vc7zk0MURDIDrM09pqLJkgiQLZ2MWfNUykc+YCOM+O9EJyez9Xhp1QmP8U0pAYjLQ2xCDnX0nHYBmwkySecSCVOQajFtCnhXRaKXw8fRGu/gyQIHmur2zxIPTJS9XgBWi6Uez7xpRuVc9wUCnL2h4PgPcdjZUK98fxgkJ4gQMsLuRu+ZVmvIV6gWhGjk/1ZjIGYHhbMs1PQGZdQvgqVsEvtBr9yYbD2uCZdXwslk3KpHn8sVqWMm0vb7H5Km24baKBAWjwidx1I7GYvdUnMLPVSsFG1PqSLgiM4zYhVuLmmWDF7ENYq/WCI0RgJTeSPmr7wqGv5Mz6Nh/ZPyKzsDfBkRil+RaLR0GiSBp2zpQ4dWYUrR73wifTqexwnyujmY3Uq9QTb+Uxa3Cq8SZG7SkBX3FJTzH03efWJ6GGFXm/uale/H1aNCOpMJyrfqaaMGMtG6v347yas4Mi4Lop6S0YjaBdwm1rX221AxSn2BQdX6raGD0zG6cVhU/4XOe+eCNHQDUyvJWEIgLj5Sk57ACs3861Vr7Lk87IBBJG7YhECB0lI5QSxOnseq4riP3/PHYPhCjHE=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed6b2eb-5e40-4ead-030d-08db9abb1f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 22:34:27.5814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVD+2EKqktNyRRPpXFzWq3URI9MI7NR9JlfflW2H53UYp3SH2WeSZW7UbOvrOitc4E0QjiFeG9EJ7hUzv47PzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
X-Proofpoint-GUID: ZQRasqZ8ZVsULiQ8p4w12E9QorMNEHew
X-Proofpoint-ORIG-GUID: ZQRasqZ8ZVsULiQ8p4w12E9QorMNEHew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_15,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308110206
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=8fEU/i0WhDkR29CWGw082DPbyoHYEmqSvoKcwunFhyc=;
 b=SpBtW7YweGckpcI/GWZokR1XYMktjKTPmxPAkWLVJa+vE48NMb3fZ2nZr7v2F8vbSzWm
 AcGeOavPkJUUm8NwY6L93t5nXVvB5VMMMF462MnSIc8dgEQ5SFz1CmCcbcw2DMyXX48z
 seRBsUy5Y6+yULmK6jI3GXtqRbBb5mwtNGGDD1FsoWzsNfNTMgNA2m/g7QZ31tAZvy4p
 0gzdKnMXgyLV+FJw3vfdlEWMScs8/ElkjNsU7CWxw+NAISHdXaba9OUbLNrohhFHT9ix
 HClzSWtCmDu3e6a6mP0b5r24WiZUhD06nKQUnY3n7nv0VcfqaHE4p6a0XPIT6vu/HcIA yw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1691793277; bh=d0kvqRKxAstxpwuREJZLXycSW84PZTdtUSLi7Eqq3t4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=EATIQujKfAqQy14L1YYfV3FU+m+Zs3D1h5AhrBDiAHkNUmrk0m0U7IJ7uiDOThSqF
 F07MylYPdXyrAsgsGsoLZ4GJjYk/9Ywu9ZEF4zBn8EwSSiMwwBLVQ+8hyRpA/gHva2
 v/XnfcAIrkYIEwowVvooARSKaXuvyDrBEQmYvqrafy06wOgfxUP8CZUA1TWYp4ATcI
 84l0PhdgWR9jdNsruKOizAAOF5W80rKhg0aoxXcQjlmEzoa/ad4m5zABAqHp38Ip0I
 dlTWKdu6cmDY8xEx/AnR+pd9pT47QDG2lJVJLASifcOgrbBS48MmooWKhp+WeRKBtm
 b1hojLgCn3gsQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fEU/i0WhDkR29CWGw082DPbyoHYEmqSvoKcwunFhyc=;
 b=hUnpkgdYITOmokOtO6X52Sy5hyT2BZACFVZ2qZPfZoqFm1Y4uoP3LjCpvWoSsfd+/l1ASIvytvAOFeKmobEYKwh4YO3AH1u42+51ZthCXh+oKa7p4l9GDMePATSGWJh5DlsaW24eDR3U9+gQKIV7FhWIrvnq4bWq00fdc63WS1o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=SpBtW7Yw; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=EATIQujK; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=hUnpkgdY
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=hUnpkgdY; 
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

Hi Thomas, Arnout,

> On Fri, 11 Aug 2023 22:00:48 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> > > So, in theory it should be OK to remove "arc-xxxx.yy" toolchains from Buildroot.
> > > But since we were a bit late with ARCv3 changes for GCC 13, those will only
> > > land in GCC 14 which is going to happen sometime in 2024, I guess. 
> >
> >   I think (Thomas correct me if I'm wrong) that we would actually prefer that
> > ARC just uses the normal toolchain, and that when ARCv3 is introduced in
> > Buildroot, the "special toolchain" will depend on
> > BR2_arc_v3_or_whatever_it_will_be_called rather than BR2_arc.
> 
> [...]
> 
> >   Using the upstream toolchain components is preferred because that way the user
> > has the version choice, rather than being forced to use the ARC-specific version
> > of that moment. Also, when someone updates to a new GCC version, it immediately
> > becomes available for ARC as well (instead of having to wait 3 years for the
> > ARC-specific version to be updated...).
> 
> This is a very good point indeed.

With that I agree.

> Alexey: when do you expect to submit ARCv3 support in Buildroot?
> Depending on when it comes we might decide to either drop or keep the
> ARC-specific toolchain components, and if need be re-introduce them for
> ARCv3.

I'd say in coming weeks as I already started to work on clean-up and
preparing for submission of first patches. In that sense I may handle that myself.
One question to you though, if you prefer to have 2 patches:
 1. Remove ARC-specific GCC & Binutils
 2. Introduce ARCv3-specific tools: GCC, Binutils & glibc (uClibc is already upstreamed)

Or do it in one patch?

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
