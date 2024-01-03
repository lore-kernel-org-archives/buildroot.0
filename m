Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0498C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8106241A42;
	Wed,  3 Jan 2024 21:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8106241A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qD4kp78EHJSu; Wed,  3 Jan 2024 21:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C1B041A43;
	Wed,  3 Jan 2024 21:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C1B041A43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2B741BF2B5
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94F1582A7F
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 21:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94F1582A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS1_blz6TpMz for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 21:35:49 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59DDD82951
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 21:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DDD82951
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 403JOLXB016457; Wed, 3 Jan 2024 21:35:46 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3vddq91g7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jan 2024 21:35:46 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph009rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 403LZimw025529
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jan 2024 21:35:44 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 403LZdbQ005267
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jan 2024 21:35:44 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 3 Jan
 2024 16:35:42 -0500
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 3 Jan
 2024 16:35:42 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.152)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Wed, 3 Jan 2024 16:35:42 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 21:35:41 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8%3]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 21:35:41 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [PATCH v2,1/2] package/lm-sensors: add host package
Thread-Index: AQHaPmuXhwXLJZAHUUyYrblDFun0ULDIllIQ
Date: Wed, 3 Jan 2024 21:35:41 +0000
Message-ID: <BN0P110MB1673878F0FAAFA0A35E114F3EB60A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_
x-ms-office365-filtering-correlation-id: c5ec6a41-c797-4050-5262-08dc0ca3ef75
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ger3B9L6Au/VVIHMn1wXgsBE3HZ1hEMsu+pGxjo/lNjAEIQFqP8Nr4S7nXBE5YISNqwn92QXMfHUaxOeFgPfD+w/2uzu4gvoz7p8cqmy6wpsnsTqYcGURqDtQyr5CB5Ion7M3D/LHptb5FO+TMFQtGcChm3w7THRmDKGrugYwBJqWD+EcupWNV3y5AS//Q/gzriVWybTc2SeWpDuc9OZxkolr3DAh2JuhIyEIclkoS7zVticEFfzvusLkiMv0SQgV/QngMayitAvPurZ5maw9P149V5ekVYKd7hHwU1x6F3OaA+LmejbNx8w2ZKmDuOedFNAveDKxWek3ev4zpZ0NTDtvF+cIE5U+4Sd7rvFMFpb8PlKNVPTSN7gF2TIHejvm+Z7MLHbIcg/nz2pkPoX0AvFW1elUPWr1Y+M+de0CIezgGiYAa5tIU5OfGQZv5FiWghSrQS2lKTS9G9B5kdisZvkWeq8Kv8Z3sRD5KgM+KBFrWHFu+BFUvAi+CMigIdF6cBcGUhh87v8k/eHQRHCwt4rVmnS1pIYzD8ucQKlarJ8thkNLBIlk2Q9krVLWBHuiQtjdoe5CpObU6+7DO8g7oI9llrXkGQEWFafBq9mrbMhkNSOeFQ/p4hVqqHBTtS+MoIQe9lG28YqED9RGwN26vIEHI2c+HI2Y2VUpqBR52Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(8676002)(8936002)(52536014)(2906002)(4326008)(71200400001)(5660300002)(498600001)(9686003)(6506007)(53546011)(7696005)(66446008)(66556008)(64756008)(66476007)(66946007)(54906003)(110136005)(76116006)(38100700002)(122000001)(82960400001)(86362001)(33656002)(55016003)(26005)(83380400001)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tsvU94XZRqX4y3jhTYqgXKWrTX2k6D4MNZ3IF4V2ONSz6wU3y7CBxH3mrKtW?=
 =?us-ascii?Q?wxTbnjSYTVCJulCJn1vY9+vkNAd4cfaty7plq9rxJcS5Pf2wuuQCgE7BBJzQ?=
 =?us-ascii?Q?e1a3DyFJ9n4tr0htoBDiFCfykp9lalENxwd9NtvUlpJI2RH1bFoQx6FFSc5f?=
 =?us-ascii?Q?g4c6uzUouX6njxDt9/tU9qQYeezJ21KdJm0Lcai9M67JfZk1sF15VEkgCMb9?=
 =?us-ascii?Q?nwGFIKwUE5E+YY6o361SppLV5QMoBv2fF5mn12nuaqBaGRp2sLYglE6BHJZ5?=
 =?us-ascii?Q?zNQ5af5qGKdRDMf65qvFv8dQfFN+p0yJO9Ln1CPhw5qgIiCVeb2gTxAtEeHH?=
 =?us-ascii?Q?6UmLSnDLsl3sEcl4Yyi7fWaj2NLQ/klVoyOyDeC+WcvcJo94BC4z5Fj5nRoz?=
 =?us-ascii?Q?V0nsxuO8rF4Y2tTIyaoZCdzDvxwRr63LzmRSfBTmccgrYGUxZLRo0vYa/iJ7?=
 =?us-ascii?Q?4DNSS5OzROR62GXxcyD4iG6RjhR7EkDJsDMRKWf2o0v6RRBp6llMEXmp1pW0?=
 =?us-ascii?Q?ZhVirC9Vk6EeXxwaY4AHw/7z8l60up06rgxF4H1B/c/oNzLn2uVP8FMJ9hiE?=
 =?us-ascii?Q?9VAo9nigfSme0At9jdhd0YA8DpCUqU4AkjRr9a3Paa1k7X65kYFJ8HE5U25y?=
 =?us-ascii?Q?gC64xn9sVeLXXjfDVNzqW/BEkK2LXF7BdBkrOej69EKI+zgchQOdBiYlRvYP?=
 =?us-ascii?Q?vTBAUD8AZHArFDkAF9wYDE4LyKE9wBaASUGyTjHvdIOjdqqARaqLNLDIy/Lh?=
 =?us-ascii?Q?LKfJgV9IUSLm+YfAJYmScjYPU6ZQrM+aQwDvbSplN+eWjl9JVOBoi50jsVsi?=
 =?us-ascii?Q?Mo02qDVPL2xqmfv8Gku/Bjr/dXSBEoZr5yYNo8J45lwsmnxC37dnMKbdUypf?=
 =?us-ascii?Q?vo6iqQKy63t2bA/75JB30h9wg9dOamG+uXvXT5Dq5gSpoR9zvnityAvUSLkM?=
 =?us-ascii?Q?qVAiTqoVFwI0Vur3BS0+Ec1WYw87VI8YtWfn+pvXNZwx63fYIKuN+lcBDU8w?=
 =?us-ascii?Q?63CdC/ko/Ln1HWBzrjK6q+OFBpZ+YMJkJbXl1s1CSxWteThbOVrz6kCe+ENp?=
 =?us-ascii?Q?t/jmc0qE/5PCIE0gVGGv2V63qw53cttROAHzMGoKhftOXgi/5OswTXxywAws?=
 =?us-ascii?Q?G9j9wJYG3DndznTwfQ1rrFjAM5uhz69OaJn4u7Ni66/GlVT9BBhCro728l0X?=
 =?us-ascii?Q?qPp6363GhhIOEDJvy28yUjBZJjycP/69RW5MhVQtR1ih/xmJMaJ7eSZpj2r6?=
 =?us-ascii?Q?SOdiRF+tyHYnK/+sLman2ggfTzk4K41nIC2qQvH0nGeAGPNDACq1e5fFT/iG?=
 =?us-ascii?Q?4BgCWrUepL+aR1YJonV+p3pp58Rz4uLQhudf/zlLUF/xE8By87VKLgGdE39v?=
 =?us-ascii?Q?QS4ADQ24MdOHtfugojA3k5SlEKi9sgmp2Uff2I+Uzy/LU0WGxROZ8Jy/3GQg?=
 =?us-ascii?Q?zgi8gqwxydwFFmdOxEtVY8IRuaCCEk4o6oR7wjzZW7D39snWLpUp2sjYYAU+?=
 =?us-ascii?Q?AVewMmJtZiurYRTcq3LOR/MejzrKoSxQNyPy?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=yLO3A3idtsIH8h28BtwTvBpANwIkAIPeOQnverpeCWEaD1FiKwpEod0BOZJ0bErFLzinFilulCgBdfa03iTEUTuam5t27Zy5+giNFUnRwfvTiAJjj2pP5O08H0hu/I5p2oh6AHAeJOTTlUtkhK4GMYjRPZPC3z0Ie7hwY2LxEJNhNwh7tkyCI1b6myE8mrf+XUChudmfEMh99Dbmk+5UTgMx9SHGN6UocQsDbXTLsbNeWxFiISDDQ/pi4efXQrhXtbBlfpSIhTAsw4SVMVWFZsbDGNcwDJGTjh64saqPYp/hP93+gSmO9ioOZTFoqL2z94BomOzIx8qMAX9oU35Yxg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfpyUx2gqZNt8U/jxfPfF2KUppfOYkzi8FZzPpPOklQ=;
 b=kP4BhgrABPNVWG5SlE7exq502V28kMql+LVHBw4tUdEqjRUp7kf2OtkAXTSnatFjB4H/83T6Am+N+d2PBEigerDxOSSC8ByeL6OxMqywe0JYy71QA8ewjRnQT+S9oTRtfn6II5yalRpVqKQ8jvUeZdrTkCM6g9KSlFLX4wQlRGT1atteODBywVbEmQEm5iw0Ry7cexZYmWyjGYJ3RsQWMXuqaRRLKJWhvxGdedazYsssxzK+y+HRFASJVHq1TJPLZ1RfXUBNcaCdYFqa9b312WZMjF+P93mnVvZJlsiC70Zw1A3jbp6o1dUTyVcB76C7NfjGl+2fUu0iK4EREbm+RQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: PoMb/gGsNKTQ1uBGV05VwDCbXWsybGW79pYpV7GHIw2F4R7lRlN87CkD/7ZzZqOuXKjkaq91JO19PN06h4uCYvqveEJE09j5JTf1RZ+QF+Y3YrDdxz9Y7ErOa7+VmzIBJ8GDCPlzQQYJnPzBvUGS6TL7o+b9oFVRGIHY9blDrU7q7SX6mz6idKT171mJd1gOJ/BIL+dW5yiBy79LcmmfpnT+RHKvqkH7K7SsSNSuUF08RfvzvmjdhICvI/yQyRxC+vc2BdPKUrC8D8beTGDio3eKQyIiuLJNhVTZhwEFeF630NXXYZheFdBHpT0G/r8pNUOpnA34nmgiRXzBeGMvp6JBbrOHWhcMxJP3ourKrE0qfR+9pBsAr22oMDqTGiAap34ZmwJ/exPVG5Bo7dj+gfR9X5RF7Qf6vYpaI2ofld+BdOj7GguBQYfA76i78MWACUiYUaee8egh6KkDe8OtETITxeb/WSagtdZHZwiziN1YyeFin/TBTbhSddpIEWhYoX1vqIqtyZxeme25W0SJlCFYa3EtpRdPIAOAz9F3wnJKk4iPHT5iHl+9dYwXXS+wvnE0dkb8F74Z8Z9lml0XqP45krAfxCB//nP0qhCpp7s=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: c5ec6a41-c797-4050-5262-08dc0ca3ef75
x-ms-exchange-crosstenant-originalarrivaltime: 03 Jan 2024 21:35:41.6168 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1673
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-03_08,2024-01-03_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-03_08,2024-01-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401030174
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401030174
X-Proofpoint-GUID: 4H94Bd96dTiKI8kju2IHAKiLlm6VMrZQ
X-Proofpoint-ORIG-GUID: 4H94Bd96dTiKI8kju2IHAKiLlm6VMrZQ
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401030174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=K++3eU0YX4gN1gkJiA/rKTOqDrNDBPHDG+a+GSSvD8Q=;
 b=AVylm1Aw9qBzREtgOxns9FoiC+Ck4ywsEvpoaJazQfWtXYj2ZTQYd5Y1WSX41PzkPDsC
 gB+qe0PI4RGarEiK5ixsB9IRxONncEyd3xmHax1XoNW+yjvOv8HCW7JaPfpATlLLVtYB
 3uY91e88au0YPTct3uSQXhYOxVOF1dxBiu/m53Acreig6TL1en5sVTM//a8fa2fVat/O
 Pt9W+lS/7c0G7jfxMLbfoHXaNcG1BJHrT+gqL4LB6GtB8QuWNECip2+TABSrs5YIOkRz
 HO5nk4w8+wDgEmT22XRRHQ1mDR5a5MhkmOEbQ1NxHLnlONFKYr5d+bVl3vA3hHTnbPkT Bg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfpyUx2gqZNt8U/jxfPfF2KUppfOYkzi8FZzPpPOklQ=;
 b=0IkP5CJWSQoOAezM1QyX42xH2p98AO8Xz/dKsGmXlnTkduhjEsW8Jp6YDcDbksBUwoqVvkoDk3MJxqJmXFg3+G0SqM7f/BZ10zsiFmGoGoE2KMz6knWwfZ/W6V8i/rwguUh4/5T/Vn79jR+hjjqnXQP5nZLXQmvXVfflftk0yWo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=AVylm1Aw; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=0IkP5CJW
Subject: Re: [Buildroot] [External] [PATCH v2,
 1/2] package/lm-sensors: add host package
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

> -----Original Message-----
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Sent: Wednesday, January 3, 2024 11:38 AM
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; James Hilliard
> <james.hilliard1@gmail.com>; Maier, Brandon L Collins
> <Brandon.Maier@collins.com>; Asaf Kahlon <asafka7@gmail.com>; Yegor
> Yefremov <yegorslists@googlemail.com>; Fabrice Fontaine
> <fontaine.fabrice@gmail.com>
> Subject: [External] [PATCH v2,1/2] package/lm-sensors: add host package
>
> host package is needed by python-pysensors
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lm-sensors/lm-sensors.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-
> sensors.mk
> index 1bf27fc25a..f085c8acb0 100644
> --- a/package/lm-sensors/lm-sensors.mk
> +++ b/package/lm-sensors/lm-sensors.mk
> @@ -9,6 +9,7 @@ LM_SENSORS_SITE = \
>       $(call github,lm-sensors,lm-sensors,V$(subst .,-
> ,$(LM_SENSORS_VERSION)))
>  LM_SENSORS_INSTALL_STAGING = YES
>  LM_SENSORS_DEPENDENCIES = host-bison host-flex
> +HOST_LM_SENSORS_DEPENDENCIES = host-bison host-flex
>  LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
>  LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
>
> @@ -50,4 +51,14 @@ define LM_SENSORS_INSTALL_TARGET_CMDS
>       rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
>  endef
>
> +define HOST_LM_SENSORS_BUILD_CMDS
> +     $(HOST_MAKE_ENV) $(MAKE) PREFIX=/usr -C $(@D)
> +endef
> +
> +define HOST_LM_SENSORS_INSTALL_CMDS
> +     $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr
> DESTDIR=$(HOST_DIR) install
> +     rm -f $(addprefix $(HOST_DIR)/usr/,$(LM_SENSORS_BINS_)
> $(LM_SENSORS_BINS_y))
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> --
> 2.43.0

Built this through run-docker and locally and it works now

Tested-by: Brandon Maier <brandon.maier@collins.com>

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
