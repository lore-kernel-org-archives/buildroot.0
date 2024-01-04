Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00B5C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 19:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78AC083560;
	Thu,  4 Jan 2024 19:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78AC083560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mtkI8Dx7bZ5; Thu,  4 Jan 2024 19:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D69B835B1;
	Thu,  4 Jan 2024 19:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D69B835B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3F61BF25B
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 19:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12F5241C1B
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 19:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F5241C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SqodBdDNS6R for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 19:59:33 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 571D541BE2
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 19:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571D541BE2
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 404HPFSZ024263; Thu, 4 Jan 2024 19:59:32 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ve129th31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jan 2024 19:59:31 +0000
Received: from xusxph004rp010.corp.ray.com ([128.13.120.224])
 by xusxph004rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 404JxVlc001470
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Jan 2024 19:59:31 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph004rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 404JxTgT017119
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Jan 2024 19:59:31 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 4 Jan
 2024 14:59:28 -0500
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 4 Jan
 2024 14:59:28 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.152)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Thu, 4 Jan 2024 14:59:28 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB2020.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Thu, 4 Jan
 2024 19:59:27 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8%3]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 19:59:27 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [PATCH v3,1/1] package/python-pysensors: fix build
 without host lm-sensors
Thread-Index: AQHaPzHxvpGGporAQE2/j/1NN9T2X7DKEkHg
Date: Thu, 4 Jan 2024 19:59:27 +0000
Message-ID: <BN0P110MB1673CA34C04DBF88F08B9EFBEB67A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240104171737.12200-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240104171737.12200-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB2020:EE_
x-ms-office365-filtering-correlation-id: 79f59d55-bcf0-4fbf-e22f-08dc0d5fa7f3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FqjpLkP1Goakrm2IC4Awc6li1BD5AjbxYyy8RZKvPPzHVIsi7NXRNI9rkmWNCYkVRUvlzUIo/v1u1Ljmp/RrYAYsHiLnrSvaShc4ktLHujUDjK557uisU10W5Od67zKUlBQMQgO30IWlO3CKpVLPz5uSob9FKbvZwXsghR2QSYm/hPB7W1exPbHC5A97mrpPe57dHmKF2Sb9ReSaW7QYTDybst+H2cDxl4Yi4asH9mIAM0Y6Et7LqJDVaVa7llwBayK3EyLgn1GyCIRqas+Mj5WROPSWh62Dx9GxwxHi/Dcy19l4eSYNkPfi2KCoJJiwZaza5nEdfmyrklDVzSqkAdgA/ogxDFJiaX/8XlzSIUI/sM0d+oMpZQMGCwUnQlV19X+r/0OgDQ/R0RA/WGLMHbYPV/ZHUNcyfT2KiKkYvnV7dMN8dWX32sfsPW/xCwlUlX+Sa1lgvAgne7kG5oJhnRKVpCwL6PnwzQW+9jqXfjXuPlBquV4THFprqCQxygF3PHTOdXy4wpwbpXAEvSfVyS3M2NJOCcqjMWjhNKfplVFVxx6cIHA+bvWx8JHNJqZPNmByhkBnssn7F91urVYZsxlJar/kApvihja5I2FpVU4fwyQrsfuqjDTaASqaa7YCvLMGHqXaiaXhmcR38TzuAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230273577357003)(230922051799003)(230173577357003)(186009)(1800799012)(451199024)(55016003)(84970400001)(83380400001)(26005)(33656002)(86362001)(82960400001)(122000001)(38070700009)(38100700002)(76116006)(4326008)(52536014)(5660300002)(9686003)(7696005)(53546011)(6506007)(71200400001)(54906003)(66946007)(110136005)(66556008)(66476007)(8676002)(8936002)(64756008)(66446008)(2906002)(19627235002)(498600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/HobaZfR04NAot6Gr2R9EQrnlPi49Ci+PKSWpvKZToJNhjSK1gGg42+ry8zB?=
 =?us-ascii?Q?tN4mE1Kom8z+MAbG/TWKIrI7dzPwCwx5rizIVKC+HqaWH2fJBgecw9QhDaKI?=
 =?us-ascii?Q?9h+COQby+Y7iNByL1rYiN1NhlxRzniLxFFlTjs0NnAILyF2UM0/edu1hfpOv?=
 =?us-ascii?Q?1LlsEYVHYUbi+RGCnHkuO5aZlV0IWO9KMjZPR7T534vD0e162Eqoe7VRiZXY?=
 =?us-ascii?Q?CAJRDq+hP6vAkYULhl1Dvau5kgIDR3u3nEy01z/JFKNSHx5SOYxnvydd6X40?=
 =?us-ascii?Q?VcY/Q31qeHKnK0I2nmBaQxrWMSAcBUfCaD9VVLTg4A8RLhcS+OfV1H64jqfV?=
 =?us-ascii?Q?g+lwbmQiXYia3my4gyKVXP6KPeoH61c4APHhuLcWHupz/ZS/4OSQIAmTq+MT?=
 =?us-ascii?Q?KiAOByhxEkahlVTTt5fQBI6aFo3UP1kO0DcZ2XPGg+6eFRCGdhAyR2jKkI1K?=
 =?us-ascii?Q?RwJ27fSBEgDQg0MWEzgTV7jMnJuZqhGzGkgosK/YQnNh0/5OEYXaH/I5sKgX?=
 =?us-ascii?Q?sonNp3OJzKv/hLEvwucelZwey5E5MHPaAZz6bIwG9DBqxoGvwlkOsUXj2s7w?=
 =?us-ascii?Q?fIPUvI0t6QMaypy7GkEUaG0LaVr/rMCvU6YfcVdN7gZmoAsp39RiICnAXAvs?=
 =?us-ascii?Q?Nep8hSZ4q48ob94wxBWDC6Ju7ER9iBwpyJUjRjrfoAaCU6PgI48h6Sub+jo9?=
 =?us-ascii?Q?NyqNSpK5wa33CE+nlWl4WYQ51TxvdyCDMhGogc1nk0h7pHlZH+JaZv2+gqVU?=
 =?us-ascii?Q?gxXrGBvdQzWUen7o5SPAseImW7yXa77wCcKFArrTie11lL0aZdSnaDL9CejG?=
 =?us-ascii?Q?dyikMuLfFGEM2FSdTn0q8xAHp8ww9DdYjOSFECdyD6QnIVbAU89CKIM4JmsX?=
 =?us-ascii?Q?Jz1w3he4VSbT7b+cRnd+bQjvXdaT0psYAoKpWA1T8F+m9qqoAz3ffGQKCvfk?=
 =?us-ascii?Q?kIFVaCyJgS0HWo98jLhDxa8/6c8eHqjSZ9OiYxPQlf7QkZG5uwjjovtqLcNx?=
 =?us-ascii?Q?wkMEbTQn8j5lu8Ae6SkwNdFXKEskXrFXxVGpWigkQZ2deBAqlB+xTCNwXW6i?=
 =?us-ascii?Q?Bog6tLYzBjNVSShJVfOJSkEwA14Ylts4yPBqmy3piA8QurF1gHzmuwQG3Vn2?=
 =?us-ascii?Q?0jYBZ57rxLUVttMU0IraK65kLX+5fdHn9E/RDvV950kQ5VSItMKTCO4TPZ7G?=
 =?us-ascii?Q?kvVJEKZmKLE0mfiLapNbIFF7qfqVISSfmQNrgmU5uhbYgWNSBGTEtT+vL7f/?=
 =?us-ascii?Q?G8VqFZ/VojyfOG1ajUDRQinAMAO8ROonA+we1LvYPnl8BrEus7gU9MRJBrLM?=
 =?us-ascii?Q?WKVl1VH/EPQY4kCcyqr2paGorTDk6RsM9XdcIsQEGjiRbjLLUz69AOmwjlj/?=
 =?us-ascii?Q?tIFI4eEm2Gs0ycUZ9PVbFz9yB8oWk3OKWREGRvR2QcTL2dHi9JXLx3MT7I88?=
 =?us-ascii?Q?XPeO1GafSSOUU7maAQgVljFFDK/gFpqhOOouC8vJ9M19W7xPn76U04+XJYHH?=
 =?us-ascii?Q?xRa70gvASdze70avtkYOL0FHNIjhJN8aCGhp?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=qhygjSPBbvRtoq4ELJsz8g5LtV3DVtsjJl2rfZ5jjKVE6YajYIUUVhhicmI8L6MupaK6X+aU7TEJ2FQGPdiG2g0NlmXZJ2yu21hM489gV6B/MCIzb/Cfc5yTnn0+t6EXDgmjhhB2azQ2zJZ9bE5ArrgJsVtCBA+dUhHTnzeHFI7PecAPe1vxcZl2MOkUlX4GMqf0TqD1hT43/goYdvxpJyH++nC+TEMXkGZWag4OHuVPHzShBNn9C/Mu3K2NutfpQZUhhibmScQVPTAy6POU5saCQO+YFhmDD73DYEWJycoModf+sjmBAoAMrk/Q8JQWnTIfmpuuyFHt0XluC9OU5A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmBlAyOh8NVJe/1TGzMUfinUTixmCUOMaEHP3XxZa+c=;
 b=i86dBYje6H4l5FgrWtgErPMYPvCVRX6XFTtOlvilaCV1T+2XpoILVnhcHXNbC1p+vUO5+0diS3qKz578yiXvGRu/i8bNTd7do72xx4o/+BXlh5D2ESfTxHrnVvtFXfM/N68WmxVFiKnbavtRsj562xfJjigdItvDfqW7fkfmyP46C7vaRau/fyVR7iGQm3K7zBP0VFLNRhY+OU8Cd7FkamBFkzHFMYbOkaYpqS9piwYkGa+FWetyiHI/gWc7/4fUutX7+z89Lr3rM8Fd4ldLtc1XzInEX59fmooffyKw4dhqWRjlV4FNUpsSeT971iBtJCbJkWO0+z3wJRgLMNZbbQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: bw7dxlRULwPAHt25gfoTYWdHPpl4yTnE4DSV6Xpi54tsAZNSzrk2Ctu/m8TrNrbzjOThEnMC3qgx3VIhZfz9uIiF+xQhssdY73RN4sDFUQZsb7PS43wic1PjYeBU2EI65sYVvNclBFXq8tOuxMvLb0FDVmclsKL4KuNNHpPbr66DlqXtgTZYluUZ/N6EmWRf7jOvra6EjA5wQEUkwuExRLD1HK6fJYJ2w1Lsj0VjFEQEJBsBO1uNsiOauS6AkFp72HIe7TurlP7niESjt6cH9tz20arwt0H9f2LPZSO4KP2+K7AwbsWi4NNyQ8D1vFMR02vfgmkBA4ZjqbNv530MqL5A9lFOtFZh9wMYP6qmpAlNhoqZzjM0ThIQr5XJUxSISqOnZ1LMwNy2h9XMiPQSdV6lkZKPZ1/cxuNVGWkq7SfYcrhM99VxzI1CPif0t6NNHk467QKZ/QtlTif5cDbNG7ml7P3WCl6sa9OYTbHZj54i3/DJj3XQyANr2IKTBvbj0O6vE34Xf29e3YNbrcq9EimeN7KJVyfkls4XYoMIMgiWjPz6nAQPtlzH/sQ4b2ajMf0USqpoZBCzk6npGao9qYUV7CzvJ/+yrd61ILnDlco=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 79f59d55-bcf0-4fbf-e22f-08dc0d5fa7f3
x-ms-exchange-crosstenant-originalarrivaltime: 04 Jan 2024 19:59:27.0595 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB2020
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_11,2024-01-03_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_11,2024-01-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401040156
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401040156
X-Proofpoint-GUID: 797LZUTM9_g-osdFBNwlVG9rcHA6LmgA
X-Proofpoint-ORIG-GUID: 797LZUTM9_g-osdFBNwlVG9rcHA6LmgA
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401040156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=37CWE+4fZUZB39s1ZuebqbB8xLC/qwy0kmo5Uej8wXU=;
 b=ZGoS2CrRPOQdT1d9TApbJfF20mzj+QVtqpvAc+OmWyYqbfPzqDZ4F35Te4ZE7/TpW2LN
 83Ghf8FHiSM4gS1+mz+YquQjrR0CUWssNKa5Qan0PbueIqf3+DO3FWbWq5PIYLvcpBCo
 sPM7uy2qYBomXcJ9nSXqHeNjrxuLGqF1ABXHd8ILTqapJv95dIQO8WFIlST+ImosBxLj
 Bl6dhUUApmM2S6JB7OzHwO0pZj42u/J8HdhlB7qBHO0wD6IwR7qDrlQwuA7uK3/SKq/S
 Wz/B5byWJxp0++hL21DpkjPvVKkhh3lo6B7TdxVCeU8hlQXVORQ7AF70DUR1PaWQvtKx fQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmBlAyOh8NVJe/1TGzMUfinUTixmCUOMaEHP3XxZa+c=;
 b=qZJTSBUgn5dGyGRttT1XoEzeoACU7mGXCSY7q8SnHLxARZJ1ogSCu1rDDCrGJagAGGp6ftnP11n07ft2vSRwxQWncU3zSR9TTwxLL5onQ0H/CkJvbU+r3LoG6fPJVDVeVM7IQoTybxoGPge3K6DPLLNN2GEpqzERtglOI5BR6OI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=ZGoS2CrR; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=qZJTSBUg
Subject: Re: [Buildroot] [External] [PATCH v3,
 1/1] package/python-pysensors: fix build without host lm-sensors
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Sent: Thursday, January 4, 2024 11:18 AM
> To: buildroot@buildroot.org
> Cc: Maier, Brandon L Collins <Brandon.Maier@collins.com>; Yegor Yefremov
> <yegorslists@googlemail.com>; Asaf Kahlon <asafka7@gmail.com>; James
> Hilliard <james.hilliard1@gmail.com>; Fabrice Fontaine
> <fontaine.fabrice@gmail.com>
> Subject: [External] [PATCH v3,1/1] package/python-pysensors: fix build
> without host lm-sensors
>
> Fix the following build failure raised since the addition of the
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
> https://urldefense.com/v3/__http://autobuild.buildroot.org/results/acd858
> 3fb635ea27811405a2478182ddcd5642f7__;!!MvWE!FdrN9I_dN8olqAB3yG
> v0wt4DbIRaVHj0a5Gyy0r7EPMWfu13tzrq-
> ISXCPpZZgI4APscx8PWjCClFlE0q9Hq8XEowT-mYQ$
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Drop dependency and add a patch  instead
>
> Changes v1 -> v2 (after review of Brandon Maier):
>  - Replace lm-sensors dependency by host-lm-sensors and set SENSORS_LIB
>
>  ...-Remove-import-sensors-from-setup-py.patch | 55
> +++++++++++++++++++
>  package/python-pysensors/Config.in            |  2 +-
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-pysensors/0001-Remove-import-
> sensors-from-setup-py.patch
>
> diff --git a/package/python-pysensors/0001-Remove-import-sensors-from-
> setup-py.patch b/package/python-pysensors/0001-Remove-import-sensors-
> from-setup-py.patch
> new file mode 100644
> index 0000000000..737f194fd4
> --- /dev/null
> +++ b/package/python-pysensors/0001-Remove-import-sensors-from-
> setup-py.patch
> @@ -0,0 +1,55 @@
> +Remove import sensors from setup.py
> +
> +Don't import sensors in setup.py to avoid adding a dependency on host
> +lm-sensors. Instead, move __version__, __author__, __contact__ and
> +__license__ to setup.py
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: upstream is dead since 2019
> +
> +diff '--color=auto' -Nura PySensors-0.0.4.orig/sensors/__init__.py
> PySensors-0.0.4/sensors/__init__.py
> +--- PySensors-0.0.4.orig/sensors/__init__.py 2024-01-04
> 13:47:07.114179107 +0100
> ++++ PySensors-0.0.4/sensors/__init__.py      2024-01-04
> 14:07:24.701178768 +0100
> +@@ -6,12 +6,6 @@
> +
> + from sensors import stdc
> +
> +-__version__ = "0.0.4"
> +-__date__ = "2019-09-19"
> +-__author__ = "Marc 'BlackJack' Rintsch"
> +-__contact__ = 'marc@rintsch.de'
> +-__license__ = 'LGPL v2.1'
> +-
> + API_VERSION = 4
> + DEFAULT_CONFIG_FILENAME = b"/etc/sensors3.conf"
> +
> +diff '--color=auto' -Nura PySensors-0.0.4.orig/setup.py PySensors-
> 0.0.4/setup.py
> +--- PySensors-0.0.4.orig/setup.py    2024-01-04 13:47:07.114179107
> +0100
> ++++ PySensors-0.0.4/setup.py 2024-01-04 14:07:04.657260411
> +0100
> +@@ -1,17 +1,21 @@
> + #!/usr/bin/env python3
> + from setuptools import setup
> +-import sensors
> ++
> ++__version__ = "0.0.4"
> ++__author__ = "Marc 'BlackJack' Rintsch"
> ++__contact__ = 'marc@rintsch.de'
> ++__license__ = 'LGPL v2.1'
> +
> + setup(
> +     name='PySensors',
> +-    version=sensors.__version__,
> +-    author=sensors.__author__,
> +-    author_email=sensors.__contact__,
> ++    version=__version__,
> ++    author=__author__,
> ++    author_email=__contact__,
> +     packages=['sensors'],
> +     # scripts=[],
> +
> url='https://urldefense.com/v3/__http://pypi.python.org/pypi/PySensors/__
> ;!!MvWE!FdrN9I_dN8olqAB3yGv0wt4DbIRaVHj0a5Gyy0r7EPMWfu13tzrq-
> ISXCPpZZgI4APscx8PWjCClFlE0q9Hq8XE5xs9oHw$ ',
> +     # download_url='',
> +-    license=sensors.__license__,
> ++    license=__license__,
> +     description='Python bindings to libsensors (via ctypes)',
> +     long_description=open('README.rst').read(),
> +     long_description_content_type="text/x-rst",
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
> --
> 2.43.0

Retested in docker-run

Tested-by: Brandon Maier <brandon.maier@collins.com>

Thanks!


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
