Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DF7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 21:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB1C41A42;
	Wed,  3 Jan 2024 21:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB1C41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hv2GCisvpCWi; Wed,  3 Jan 2024 21:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB61941A44;
	Wed,  3 Jan 2024 21:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB61941A44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 510A01BF2B5
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 21:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35CF082A72
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 21:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35CF082A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JF4RoNqLZ-24 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 21:36:26 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0FA382951
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FA382951
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 403InNr9029661; Wed, 3 Jan 2024 21:36:23 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3vctjtj1q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jan 2024 21:36:23 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph004rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 403LaLe7020842
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jan 2024 21:36:22 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 403LaJd9006520
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jan 2024 21:36:21 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 3 Jan
 2024 16:36:21 -0500
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 3 Jan
 2024 16:36:21 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.146)
 by UUSALE29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Wed, 3 Jan 2024 16:36:21 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 21:36:20 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8%3]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 21:36:20 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [PATCH v2,2/2] package/python-pysensors: add
 host-lm-sensors dependency
Thread-Index: AQHaPmuaKW84AyY61EmVVPUsc73I6bDInNHQ
Date: Wed, 3 Jan 2024 21:36:20 +0000
Message-ID: <BN0P110MB1673830030E4E968A7A42A75EB60A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
 <20240103173741.850916-2-fontaine.fabrice@gmail.com>
In-Reply-To: <20240103173741.850916-2-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_
x-ms-office365-filtering-correlation-id: 4efea2da-b542-47f1-3224-08dc0ca40656
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eIkQKc0SZuexXYzSoUAzPhOOvswlgqFokv6xAuKcvgssGbSuyP4iv5aIE0bdnj3ivfAXh70vw1OLgFad0g339B6AUCxfaqVddTVFwplG7DAAxoe0im1jvgkjvzsjGhqY1CcU2184m1P1Eq1pLrSlW4ctwZj7Sd6uOF2etYEr+j9eRMikfODAsbNT1C2ivB+IUSEL1qjt1XbS8dN3/rM3+sp1qLGQHa1SX67JfumGUpiZQxoU4HsFUUZza2GShpim079jXkF0N4DAQetfFeEEqWdveE5kYlnquThXG65HTKJQNqdrvQxpPYlBH3L7obBGsrCPzSKBLQhmXmjVibRxRl+3NF0f/7JHbPCOzSjyHit8zrac3G7vMuJB1GviXW/l4kWYZUoM13EhiJjRi0gnvOZmJSvoHRx7GpqT3UJTQyX901YNWoBbj3KSDhmIDwYVvKHykVhVUxE99CIRW3ZuLCS6USgaM2eRSEZnZnbsgfr1f52Tx04i+4iTYoq1n2Z22I1eR/yKnzO8JcpZ2ZdQ+DzcwzI73ArJSuTrCd/+1wVej99yY+UK44qvrmbkXkRvre9APo3I6AVff4NuJTxvv++FXrIx1XDQ+nvtfke72ZzRk5BNLnIwvOb8G9J6B5uFmSWMEPPDzw+qvg/Ho25rwA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(8676002)(8936002)(52536014)(2906002)(4326008)(71200400001)(5660300002)(966005)(498600001)(9686003)(6506007)(53546011)(7696005)(66446008)(66556008)(64756008)(66476007)(66946007)(54906003)(110136005)(76116006)(38100700002)(122000001)(82960400001)(86362001)(33656002)(55016003)(26005)(83380400001)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4StQvPphh079BnhZ57cTnzik1ncyPRZ/FEBtiwgJ+Aaz75YQ0mrMlB0r8cMc?=
 =?us-ascii?Q?5dN7gAkLM4KsYP+3k8WDhDKcuxpv0pExyzSHFbFCTD4XNnx7i1rRBHbpaWYb?=
 =?us-ascii?Q?Ykl/2qyqAYta9JDwpVXfwsqqOiY4b6I1rc0cHIzMaMaK4RUN5kS+e8zo/Krg?=
 =?us-ascii?Q?/9ibvcBgB2aEhzjE2UdWOCsUlNo0/ozdh+U0FX11r9V8DDzNOjTsGIpftb8F?=
 =?us-ascii?Q?9rxVJgKYfX/1obDkZb8A8tfY08xDtt6ty1SDcWBhUVMTpXMEB3Mxc3rq/W6F?=
 =?us-ascii?Q?cU7F0MJRj2YQAduCX7pnIOO6s3OyEQHdEk7gFlBBwnafUpREt4NkBWMZYTPs?=
 =?us-ascii?Q?B7nCwTnW2eD5T9r7MReNOAS1AMKmutDXldPbPLsdJZ+ZafFsAZpUrczMPiTR?=
 =?us-ascii?Q?+5wGxrn/VlWRohIsytxgbIG1sGdbhZT2lbEPRPoz1GYjWnLC8d8t90I6roZy?=
 =?us-ascii?Q?0XI1Lu3jlM0V17Wde00ehuFdJa8LFnjs+XG8/2XIEczzE9wB8OT8oniUYLAP?=
 =?us-ascii?Q?uYxObfQZjGotOIGaJlmXBSZoz/jjatxZod47Xkd3LWD0p2pl/OeAGVrZHiQ6?=
 =?us-ascii?Q?i1LKw/Eao/M3+lpEnKDh4w3LJNiBjrQnvyGWqyBJ5lOGSpq6YX4GZXOMqP+Y?=
 =?us-ascii?Q?5lDAhPo1qYQ8l8utR5jK0Gq2kIVO3dBEbQhB+wYmxVWO9VDHgX5CzHwmuiES?=
 =?us-ascii?Q?IJYZ6jEmLTurjeG+rwnPOO1y32llJ78LGJkgId0yILVstQPiHPymy/Gf0GB0?=
 =?us-ascii?Q?3kUiTk/V0qBUCfIoTo5Xxf461UXUwjYrZ/qNsTjBldlsgxRD5ZqUUMD6R4U9?=
 =?us-ascii?Q?kdL2hR6iataiTVuZ+EkCSE8lQFrQ2nrWCgARxh2ZoTCMG+pwB2SN20h66n9s?=
 =?us-ascii?Q?raWKUsdzPadl9OlmHscRO3WgwzwKmg6HyiywJ/y83K0hdM1Jl0vj/5NRNZ83?=
 =?us-ascii?Q?UfPu4RGpqfKj+jYFL8ptaAMVlS4kqKMJ5qaWXlyWwfAjevORylc/AGl7xIAV?=
 =?us-ascii?Q?nd9kjTLRSiK6vaePlrMfdCuVL0M/SZl2Qg1PIddT5dWO7dANwbeedsZMBzQ4?=
 =?us-ascii?Q?pW39GPDIlPYw6bDievAIZRbFTk/GbOmjft2McPotr6vtyT6hLHtIzpVAY6h6?=
 =?us-ascii?Q?PoDNPgQV6wbS6X1g+eh20k8/N9Bh5SXj5O7n7A7UPSEKkdfpiafTVYwmM5Pz?=
 =?us-ascii?Q?zYgM0lagksYEhilaHMj67XCdb1waPG25fJSLEaNPD7O30YdVzS/HtVwYxDG/?=
 =?us-ascii?Q?QdFQrfSr6BLS0KMkF0GTpW1RSBlwN7/z5otR9AuBg7aSmekBs3m7hh4vgkQb?=
 =?us-ascii?Q?2GM7zRswbYjYJ6oWCk35x4fvLePa9jB320AIEqY9BPzb4ytXfiP4W2RryxNk?=
 =?us-ascii?Q?Zn70u0ILoHjeUvI3DVIm/EA17NFNUMWRu0RYGhGNuy/+2se7mtOCb0ivPd0O?=
 =?us-ascii?Q?gtqkV+pAsnyPX/OAeOCf0AX0f081AA6biqePkmuxrlFP1qkmd97WrdzpPuui?=
 =?us-ascii?Q?7OGTNJbFJgGvFHc9oBFsX78DX1mgRbI+2aIh?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=w3k6mzS4aOM7i/U68ilyyqeHOyDvDoja9rek+FqgsLle9fjr2NDjXr4eEsPIAQOHyusN9ZTeWpAmx46ZNqakRdyua2zUfJHgcBcMcEcVA+jgNbrMLg3CPHhhAsMd0IOiXzXtsD5+pt6dVt29QxPrF42IsCgdE2kGUnTR5XFqOO2HiWlCy+BcP/K/m7B8qtxXbCRj4nPYrUzrPZ5mND4PzMbHTsdzZiP45BIElKpL+4ZyFSRi2ZZDEV07R8/UTb4vyLKnL3ber/ES4x1fJJh8WxcfM50P+GZp7PwxKfmN1J4yjjTCUfhIcrK0nwnjkielJ70dxBCQxFf4VcIPBjy5LA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCxmc0fNNouwKn/lAS+w32cqDDmzJlJm9InBA4iiJjI=;
 b=bq8zATDs06eSNehYUcbgaQdbx5K8Z5EK9kqQRO6fI4JJdvxxKaEim1glz+yrczhONlApUaFlolUCE9ze6yXFgcN6QnXtDLpcGb7Iaisjwl86GRdY01iumYYsnGxY2Wr3G1vrDnDKyg8BWEI+xD7ccPftvRKt3DMfLXHn45sBGsZmocWUpYtlnHqZ5BduKIXabLLI1Fv9huFBeCUS1EM98cvaXr/7L/QdGjJ/5sk3r8aV58QjnZCj1W86UURQPsb7wX4ybKzPWeLsFXO2x0Y/ZK2P/4vb8YG5rP6I48r3mzu65OPMTBhg3xDHFVo1/HzzSPr3zDy8v9kb7HrMq61d2w==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: HHRaqFPIdgAr1BRw3ntkCstnIoomZVZVLJ+enqJbneLZGQNDg43mvmK3mQINT40fORR1o4Lc2Msn1Sv4gQpUNPMme7havlBEB23zz7yfy54w8bZqKTiYKiNGtPORj/qDVAm7IEJTGg6FqlrQ6LhOJ/QI93IaMoWIObTaDq1GMuVVj9Ox8CDdssfI0jWSkbqW3bXJzR58P/90Y3SCOLBAM1DJ81UqamlTu4B07siv3i/Qg7ag2Tt8txkNMD7XF/SJKf6CDVuHMKdsntxTNnjU33N7vG1lWOoLGuB3ddturXlV2Ri7eEl4zzjpNU6lEXfQHOXCPlFCqRye2N61+NKWdqNmcXoSYR571UKa5A+9m50L7w/0D7mJyWGbuadA9/KtLx1U66Kd/L5kmf7Dyh1QTsbDqX0C/yNFR9KxtAV/+s0MAKVeqy291BfG76IRJenOwvHwr5f+AwTPxHGFZpkOhcNMuiFHWmGBM6AqoEzJSjnIeR/fN4BnCzeNMVQZxL1EIMhadcAMQ+0oNxqNkmAhs2eeqKAKgi0lnp6UyiFfCkpm2YFERFN3pIhZ1uniV4ciU9ujJXN+sW2ShYS2LqtOQpsm5kBhaZrEBHk3wMWvdB0=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 4efea2da-b542-47f1-3224-08dc0ca40656
x-ms-exchange-crosstenant-originalarrivaltime: 03 Jan 2024 21:36:20.0222 (UTC)
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401030174
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401030175
X-Proofpoint-ORIG-GUID: feknvBFAqKIVCHwyf70VO3yfDWJ45EpC
X-Proofpoint-GUID: feknvBFAqKIVCHwyf70VO3yfDWJ45EpC
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401030175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=daixAjXh5zQ/NPkNtrWaf4NsDHjgjwTN7qN7PT6u2Kc=;
 b=XRkd288M6zLPU1xf3MB/GLB/k7DLdc+CFweLZhvuK1K8SIjiZNh+H8Y+6NxLSner/Zrp
 0Neg6XCDXkUGV485BegBftB/BkUv/ELqlLKwTbD/e7pVTNED240VIqwAvzc8Lwg60VaU
 iXs9tmeGozz3n12umRE1p9P5PRft0cyQy8b/dencd0/Gw3deSODaUy94xx1SZWm9HdZ9
 NSn4nv3fRHobyLlycu3GJTvKgSsyzcSgSX0p3DQwIa1Iw0BGdYAmG+rCTNZ//j3+f2Nc
 nA+4IaqYDkJR3XybWFseuO2ISzmK2aJUt4zsdVusY7CaCGjVDdzNsqVv3CB7NPw89waK 7A== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCxmc0fNNouwKn/lAS+w32cqDDmzJlJm9InBA4iiJjI=;
 b=c+qfbeQyCW0H86dvCWeL68B7Qj0dCPc0xMWOIOegHZMkrBKqiII2L9N+MIenFmZWfSyYZQFK5CZgpAZ+3j1bWNlFVJufq66pnXYx372bXFoVaPaQFzPgExnXoWBCuT/+A3bHAXOzebfndMaziiorJfUt5lEhcAbtW7VxOq+FGt8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=XRkd288M; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=c+qfbeQy
Subject: Re: [Buildroot] [External] [PATCH v2,
 2/2] package/python-pysensors: add host-lm-sensors dependency
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



> -----Original Message-----
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Sent: Wednesday, January 3, 2024 11:38 AM
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; James Hilliard
> <james.hilliard1@gmail.com>; Maier, Brandon L Collins
> <Brandon.Maier@collins.com>; Asaf Kahlon <asafka7@gmail.com>; Yegor
> Yefremov <yegorslists@googlemail.com>; Fabrice Fontaine
> <fontaine.fabrice@gmail.com>
> Subject: [External] [PATCH v2,2/2] package/python-pysensors: add host-lm-
> sensors dependency
>
> host-lm-sensors is needed to extract the version from libsensors.so and
> avoid the following build failure raised since the addition of the
> package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:
>
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-
> pysensors-0.0.4/setup.py", line 3, in <module>
>     import sensors
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-
> pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
>     raise ImportError("can't find the sensors library.")
>
> Fixes:
>  -
> https://urldefense.com/v3/__http://autobuild.buildroot.org/results/acd8583
> fb635ea27811405a2478182ddcd5642f7__;!!MvWE!C2Tu3sCb1T5sJd8w2lVX1T
> wgz2nQbtyb3-
> beoYlbDE0GJdOF7h9gXeeIjA8Nr5zOi2IoUmW49NxYnib2RS8hUkk38OsB_Q$
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Brandon Maier):
>  - Replace lm-sensors dependency by host-lm-sensors and set SENSORS_LIB
>
>  package/python-pysensors/Config.in           | 2 +-
>  package/python-pysensors/python-pysensors.mk | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-pysensors/Config.in b/package/python-
> pysensors/Config.in
> index f8e056506b..952d14c351 100644
> --- a/package/python-pysensors/Config.in
> +++ b/package/python-pysensors/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PYSENSORS
>       bool "python-pysensors"
> -     select BR2_PACKAGE_LM_SENSORS
> +     select BR2_PACKAGE_LM_SENSORS # runtime
>       help
>         Python bindings for libsensors.so from the lm-sensors project
>         via ctypes. Supports API version 4, i.e. libsensors version
> diff --git a/package/python-pysensors/python-pysensors.mk
> b/package/python-pysensors/python-pysensors.mk
> index b38c47f0c8..d006109d41 100644
> --- a/package/python-pysensors/python-pysensors.mk
> +++ b/package/python-pysensors/python-pysensors.mk
> @@ -9,5 +9,8 @@ PYTHON_PYSENSORS_SOURCE = PySensors-
> $(PYTHON_PYSENSORS_VERSION).tar.gz
>  PYTHON_PYSENSORS_SITE =
> https://urldefense.com/v3/__https://files.pythonhosted.org/packages/76/31/
> d3383a192f31ce1d79f27ec3d047cca23dd82a1bf0939e774386aba37cf5__;!!M
> vWE!C2Tu3sCb1T5sJd8w2lVX1Twgz2nQbtyb3-
> beoYlbDE0GJdOF7h9gXeeIjA8Nr5zOi2IoUmW49NxYnib2RS8hUkl-MSlL3g$
>  PYTHON_PYSENSORS_SETUP_TYPE = setuptools
>  PYTHON_PYSENSORS_LICENSE = LGPL-2.1
> +# host-lm-sensors is used to extract version of sensors library
> +PYTHON_PYSENSORS_DEPENDENCIES = host-lm-sensors
> +PYTHON_PYSENSORS_ENV =
> SENSORS_LIB=$(HOST_DIR)/usr/lib/libsensors.so
>
>  $(eval $(python-package))
> --
> 2.43.0

Tested-by: Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
