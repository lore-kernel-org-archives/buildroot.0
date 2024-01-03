Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8835C46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3389F405FB;
	Wed,  3 Jan 2024 00:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3389F405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dtbf75V1J9rN; Wed,  3 Jan 2024 00:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18B5E40A62;
	Wed,  3 Jan 2024 00:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18B5E40A62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F15C1BF977
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DEEE40A62
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DEEE40A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygjIvAUpr_ed for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:34:34 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3A17405FB
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A17405FB
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 402LicRX010449; Wed, 3 Jan 2024 00:34:33 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3vctnwheny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jan 2024 00:34:33 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph009rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 4030YUln022149
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jan 2024 00:34:31 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4030YT4h019723
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jan 2024 00:34:30 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 2 Jan
 2024 19:34:30 -0500
Received: from UUSALE28.utcmail.com (10.220.63.22) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 2 Jan
 2024 19:34:29 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.151)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Tue, 2 Jan 2024 19:34:29 -0500
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1063.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 00:34:28 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::385b:cec6:a646:74f8%3]) with mapi id 15.20.7135.026; Wed, 3 Jan 2024
 00:34:28 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [PATCH 1/1] package/python-pysensors: add lm-sensors
 dependency
Thread-Index: AQHaPX9JBdCQJLOPdkqjiUp9ec4TZ7DHON3A
Date: Wed, 3 Jan 2024 00:34:28 +0000
Message-ID: <BN0P110MB16731E7120325FCC63EBD321EB60A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240102132618.1255329-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240102132618.1255329-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1063:EE_
x-ms-office365-filtering-correlation-id: 2278ae6e-29af-4e6f-ed6c-08dc0bf3befa
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rh3t1FIByScfWGgQ2IdLegE4GqCDrwKoVVJ4AOP6P/fKe4C7bo+M8Tw4fUqpn4b5T3aR3/P+HBMqfVRDjhrYJTqcy4OvGUSoKOua09/FLRd59XNPd9C4Pn9C18BwI9dk8wre0z85tsQcDMynGM9BNLbLRGjX1tF4jFd6tUL3hkZNup1PlmIsnuRhcoidPphNEpBr7pk80itbnmU8Rg4XlOruE1eYdm6Y94PPhqvGA0kUQHBcRyGB0GcVg7JqQg+wp4132qP2ljJbV5pG1iPWAhUN2kUimRBmbTFiRv6Ex7fWsDb2rYDLYpRyE3aOmf2RVS4LAJk9z1KBKI/GC8qw3s8TFLwPtHGGCbEWq8xa0qgJPCHXF0eW+Ds67b6Q0YnbWrD4LWmJFQQ0+SoF/2CdytRxC6L+155EsD18J/jtF1f873PXb82Tc+/MhuYN99uD2F9WiNsb6fElqEz1W459kkGb+iO59om2dfQVeAmSF0k05prffqMjQvvkdTuszDjURG+1EWmLFC1wB79u6Up7ZzVQWkad7I3X+eaAaVXBQcVBSVBtE3Zl5pZmUGD0TssK4DR2gRb5+b7MtwiXG24+RSZO9Ug6GayCxvoEBxQAC2XTRug5M4BCjRZAiA30GlmFHxk22EIlnHwQ/bqg+1Ql1yTcOHPzNs8ly1kZKp3HOb0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(66446008)(83380400001)(26005)(122000001)(82960400001)(38100700002)(54906003)(52536014)(8936002)(8676002)(110136005)(71200400001)(498600001)(5660300002)(2906002)(4326008)(6506007)(53546011)(64756008)(76116006)(66556008)(66476007)(9686003)(7696005)(66946007)(86362001)(38070700009)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NESq23qEGb2Ktna15l7RlCI/qv8MyrvTHjW6Hv3yUqU49iQdHhZAewFrt5iU?=
 =?us-ascii?Q?JfM1GFn9gDuaoUpkH1Qvh6V7ilkZEjSiuSMyhT7TaMs3pXO7qeJc3ib8mF4n?=
 =?us-ascii?Q?dwwP2N1oFytrE7P1r9RV6bfZn8MC3kp+btxsDB7EMLW5F3RwQtaCH7CuPOUY?=
 =?us-ascii?Q?ziDDHKbJggTrxyWGPECyj+bFERsNH33A+MoOlM6ar+BRtYYb/ZU/umfa4Dqm?=
 =?us-ascii?Q?wIG+JDz8XBDRPYCaZO3seI65yvqkZPCaf+TXlVvY02vPR6dY6sL8of6cJ1L3?=
 =?us-ascii?Q?hqXlMc2o/+tYxA+yYmit6y+cJQLyLJ9vEtL0RYE7MWRBHM8yMIRY5BFn5kno?=
 =?us-ascii?Q?VByU2JpunQciSvpT6efh/8Pfr7ZgfMwHOktsDWdKuOprdO29l2mSO7U+es/i?=
 =?us-ascii?Q?BJjtWyISCzmqDVKvjInEkAJvsHSaCe1joI0IMyc3oSlLBz37uqHiQlhYYel+?=
 =?us-ascii?Q?ZGVEkem8C9Ldh8WrCOCBp5ac8QFWhn74f3NxnU/mwW8sE+kv1RFqHGVkQRaH?=
 =?us-ascii?Q?SpWcKVUnWzR+BVT/DZjliXoD0exC0rxZ1GIYxCnsH34k1KSZmzRwNSwyvjpa?=
 =?us-ascii?Q?rgT3hk4LnqRImyYgIhjcgkkRqq+qH8BE3gCBI8ugD2DTWIV2oyqQbbh349jF?=
 =?us-ascii?Q?wS599cFDsZCE8gigX6uygojP8DgcXdAvGRIGhuAbc0MYebY7fnumjR4QAjzt?=
 =?us-ascii?Q?NcmhN2Stb4kSvQoIQSBuhELe+Z/puPX9VVAqcIDJHUYTZr9uG4O3GrbZ/jn3?=
 =?us-ascii?Q?epL1EXlYq+Cq6ZIAnQizN/YDtTeoI6SItsSkD2xastVXU4PxEQa7mWo1XmCd?=
 =?us-ascii?Q?EDVWR2NurKNViJuaoJ1WHtZ9MBmhEmqXxboztp9HTWbA+E2QJ8koZKvBcYkj?=
 =?us-ascii?Q?1LWxzXWcLvxFkbEKdgeTL7tXh/R1RWBM9WjZEj1xH0rXEAWTpeWG9cULJjgI?=
 =?us-ascii?Q?5s6Am+a9dX/2azjFviz3MtG+NFtpYXyW2Rfb//lFS+u9lomzEe9GbYWUCnEn?=
 =?us-ascii?Q?wjfQ3kPgpwiIo6n6VV13nFIon6NBfGd2Y/p+esK3S7Lz+R+NLgfxMLX3DOGj?=
 =?us-ascii?Q?vQ6QcqJxWhQfwcAHC6emDL7GtqqWYlseQhiCMWU2uPMYHNZATy7mBloHdaPb?=
 =?us-ascii?Q?gUztQkWwQP56gL84+VoFZqyagQ0xuMFBLSBXCYHXZR/88Pg9PnpBMT8UebH3?=
 =?us-ascii?Q?CibfJccl4GTWaPHDYo7c/Sfa1r0xH8jt0/jfOKasMD2VqLgyEmFbIGOsEAAQ?=
 =?us-ascii?Q?2iEYHrkXUbUm/2SUIzBYvT1CNz1CtnmEA+pmnFtZoY3y8KvMQwvoFBVgYHaN?=
 =?us-ascii?Q?tA35ZIb/d9Slj53BsrfWIWvyT1CsF6RdCtIaI7err93WcdoC4VvIQgk3AgNM?=
 =?us-ascii?Q?K0QY3fEXO3j6rvBAYR0ItnvIcn9r918/FrV9AvDDPsXa2l24EnqrPOkMbaZT?=
 =?us-ascii?Q?6hAgsgAC0Bg53Jfq/aaiPQkTkgVibyGKmvmByWfREwvTm4yHao/3Qx9TIfTq?=
 =?us-ascii?Q?ufnPwKJ8kub/JNsLtAXno+T4WAPvQ8kw1f0b?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=qy39VEX51xP+4YWNU9MtEFihZgy1GrwLl7OL/726/FSAWjsuQXyQGApW0Tb2HODyLtS7B7nZBoG7qP5h4LtmkXUgfiHJ3DisdBNHJtGXla6UzWcTpTIfpE6WE9jJn2sXcdm2YGG39ML14ZLBGbvDiG1lE8SLrWnyucve2jfgL1SrK/7RUO2/L+UqJU3HyfEk+0sM/8MaQcmfTfq5DQ5XvYtIS7yxBpCpy/TSrhYg3ep6qJEKbdobqdFKzA9c5ffiu/8KtPWUng7VsfXgGPLSi8yPOrOOuzURebXedxJ56C0alDVTYbwvfiGiYdTgLXfx+NqYsJwS2EjIUXMlTJ66zw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE/F2ekCb8EJty2/ryYJrRGRTNrWPOepj6awrv58AV0=;
 b=YLsYlzUdAiRrHyTQKGkw4iqxmr6xW3gQGNv+54PzSzoYcJAXDa5t9abQbdabE68nbIUA1+0rpV/NcvXNWETDDweaFjzEk4ppWko9ht30BfMmg8+SY3Ea/E/7u/iQuVYZqtIBKXd1sF9naEWJJ9ImzB/pN5TOaf1l7hql3RrBEWLY1GeR6JWUxwAy6Fqev4CP27FOfrKsDkLS6Few7CWTCXqYAVFSM1H181eEVTUEKXe6ifV/tp3xaIszPvc/SMrqQ90QBUC2AeFHqrm7eG82oNUzKuJe8Oz6nPAkjce+0xpIN1FsOHrhtBojjAzu96OfqABkYY2FH8c7+5DTqGEzNQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: agfhuEMbrWJK7WNvnaYlE0dsbd6zcYVKy891TGXHpTpcWSoNzg8NB1+EA4cuLvjsw9AtO3H9oyHEIczAzLmncaiRdy4BcHDCTr7cIjZtgakaq88U78ny0CNHV305o20VhcueFF5wibokAHAEhjTWxDYsb+ECnvxQAiFIMv0lonyo8ALUAs8CZUh0XTABrCur3xThp5pIvHIqqe6BhJisVMGNeDXfeLXt36sYqUZlXtS+62w7uP4wEwlmdFkJxNzV0jG1ihKr6ynsV8w8FcTSCxcAGmvtQGwbUH/pP2eUaPPH0IxORtzjWqCkz8PCdJ/7u1q5Kd+YSGVvLI9SX06Ac8yURvWC5HLl4DQafs8QNPUUFU16bPmR1CqvkL8HprcYrGTJlnGvGl+jVw/xHzjt1CeB3NRXTMaJvlID7XPvMS2djpriJ9Yjp+KDPVqGByKHBaRRGRjqYbXN12c5twAwhj0HO1csD94h6SrbE60Glx6pFrdTbXKOPRdI1+t4A17h7vahVhasm8HdWzGg6j44CfAjjRny4DwplYayQj8qzyvAFVdKi4FKyutkd/JEMmDdm3wdT59z8Dlq6M1zk9hF7WBkh6xwCPkIFDiMoKrFDR/QeIhK3JZNxqb7vLXdwOq3
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 2278ae6e-29af-4e6f-ed6c-08dc0bf3befa
x-ms-exchange-crosstenant-originalarrivaltime: 03 Jan 2024 00:34:28.8839 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1063
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_10,2024-01-02_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_10,2024-01-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401030002
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401030002
X-Proofpoint-GUID: j33o9VCSOkE3hM98SIKPOh5csAjWst7v
X-Proofpoint-ORIG-GUID: j33o9VCSOkE3hM98SIKPOh5csAjWst7v
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401030002
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=CUE7ZXmKHTdQ41mi9Plhv1mNZlId221jRpJ3rz+N6hU=;
 b=kpdoBbcnNIFDRVNIn4c2WGoG875TyAvV18EzIo5SbyAw2r8hwZWjYluYo1siS8S/2Sbl
 or6Mpg3jsjaxJMl8PGk89nSaJLaz2mj9HqxWgqrgi1sXzwAjSEP5P6FOvI2vru9aZCKN
 ktk7OvfSi+dD9KtSkn/A8eKs2+TXtz+tnFSnz+Shgrqq3+CN8wylLNjvOUEvY2V6rZUD
 O0HngQhFod6WIFxWQT5fdS0kjybEZ91CAAA094RygbDqXI//Y1O4C5iixMm70A83J0/n
 FtSaRsyySYxBWlG2wEXh8m0yyl56owpyQ6ucP6mJIhbWPT5t/4G3Y+3ZRGsoqmv+Pslj Bg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE/F2ekCb8EJty2/ryYJrRGRTNrWPOepj6awrv58AV0=;
 b=TRPViZHuPHaICLo3S1rORnBEMjFcueSfZo4MskGVkQl8iomHQjkXs5gRJBaPwfOiVSECFEUsvKhWO96uVNuIC2i1FPV6TdJTustLQzfd2V7UabDSOYSemlgRRfRRJFJQCALZiCdgUe7UWNvcNkQ2AoUHwsFmxntW9+zDCLWVFPI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=kpdoBbcn; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=TRPViZHu
Subject: Re: [Buildroot] [External] [PATCH 1/1] package/python-pysensors:
 add lm-sensors dependency
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

Hi Fabrice,

> -----Original Message-----
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Sent: Tuesday, January 2, 2024 7:26 AM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>; Yegor Yefremov
> <yegorslists@googlemail.com>; Asaf Kahlon <asafka7@gmail.com>; Maier,
> Brandon L Collins <Brandon.Maier@collins.com>; Fabrice Fontaine
> <fontaine.fabrice@gmail.com>
> Subject: [External] [PATCH 1/1] package/python-pysensors: add lm-sensors
> dependency
>
> Commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16 forgot to add lm-
> sensors
> dependency resulting in the following build failure:
>
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-
> pysensors-0.0.4/setup.py", line 3, in <module>
>     import sensors
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-
> pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
>     raise ImportError("can't find the sensors library.")

I tested this patch, but I still get an ImportError. It appears python-pysensors calls Python's ctypes.util.find_library('sensors') to locate libsensors, which searches in the host directories and so misses the target libsensors entirely.

Thanks,
Brandon

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
