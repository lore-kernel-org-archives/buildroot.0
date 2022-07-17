Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E962C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F0AC40AB5;
	Sun, 17 Jul 2022 21:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0AC40AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XX0lixKcctJJ; Sun, 17 Jul 2022 21:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1557F4053F;
	Sun, 17 Jul 2022 21:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1557F4053F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF0211BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73DBF833A0
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73DBF833A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5D71q5LMC5BB for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:50:08 +0000 (UTC)
X-Greylist: delayed 00:36:47 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D57E983372
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D57E983372
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:50:07 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26HIiq7g020464;
 Sun, 17 Jul 2022 14:13:18 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3hc6de4mrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Jul 2022 14:13:17 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E7C83C0148;
 Sun, 17 Jul 2022 21:13:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C12CDA0066;
 Sun, 17 Jul 2022 21:13:14 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 11C29801EB;
 Sun, 17 Jul 2022 21:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5SKWa8gxKiUz15O6VNE1Fah6rrqhmB97+gBi36FFQd1IAsps84FSIoIGx4C4UQOhRNeIFj8nVcACv57nw14Y52gqIWYbgufw5Wo3LkfsIt9T6m6e+27RFLKUhMRbnF0/kkG2GXreLrzLY5HfRgV/v0WiREpQR/fvyVkVNsAzo1pcaRkT8YEjVnLjzlnUwq8m17xLBE5SLm98gCMoZUlRFVazAa4xOg2rNKIskLKRBqM47OOBP5A8VNWb6Ywf09537omGzxnom4jel5ZI59Qyt6w6M5OOfzKjUx2JG7f0HxQ1AG+y6heEcuzvaaNh2I3aWk2r6RFmBsaZJ6avZX1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVxVXfnJY6jS1++pX3I2n1LlA59chv6f3x8xUaiQN48=;
 b=WQ/QxO5d+wbPBqz/TehMVkTw5jF9M1/suLmEaU1x9VOaP3d12i8BrUgOmjXAQ4Bz8D8w9rBcCSJlLOxLw5UfTvA+JCNdlYod4C/gsjTXSzlxgF+20zmFVfL2oB353LRRAyQvmchR08Iay6YrmGMknc2xNAsNycSvigLxN1dbvKM/iNSD8jJ2sRlVMg6LY/1PKLS1o/DrAePQnvlmHCpgAz3RhFyRqkFcIAosj0tztW2XfoGinxjPvf73rkq3e+FJsDtukNm8dKcss9N8FEwv7Wtv4wknZvDlp3BCynAE//ylD4aI5642XbqpnuyFr5gKHVB8gAOeqiI1QvjBSDQ+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by MN0PR12MB5833.namprd12.prod.outlook.com (2603:10b6:208:378::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sun, 17 Jul
 2022 21:13:08 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::11fa:45aa:6e72:59be]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::11fa:45aa:6e72:59be%6]) with mapi id 15.20.5438.022; Sun, 17 Jul 2022
 21:13:08 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
Thread-Index: AQHYmhhpwB71FNPXO0KVhctIyfvU1K2DDMLR
Date: Sun, 17 Jul 2022 21:13:08 +0000
Message-ID: <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15aef601-1580-4c00-64bb-08da683925ce
x-ms-traffictypediagnostic: MN0PR12MB5833:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pm5+jGPabDw9CbSdVUijl/kHFbn6WVYR/j075tUzn/QRD/yxxWKEVAn68q99KG0315hTF4k1mk2vkLuyMSVlpSzuNqvvhYZ1gLrQ7G1fWG2hM7ngle42WdePYU0/ePvQhlFCT+Ptjmx9RAgpOXYCjSlvp0OTAFTcNjsitBGl9waTGgzKtNQIpjpt7KAGRlr8dEQQN8KnTwEIP+GZ2OxPEXYzQidB0+mgHFTftQ4Y7WmlVaFl3XZC+yJ9pVImbD552O22XTs8fjz87vSO2DgQXI1fjnviEJUW5j5wYwJBFG+n8BLt2w30q87zKV5A2YoQAWErhU2lnIJxDa3ESSFPwn0Uwb2XySCrF13ipAJwwNMbF+xpCn3D1Y35EBjpOoOdDn5ijnOBCxQrix4GQCF8KYRU28cF848/RGEqIJaYhh0GRUwtu+RG1LjYnQN3jp4uWpgMAavkg7W0Rib+9r6XGScsJZe8hSCeg0siHmEAGQgSG3GhiZdE+zQtF27xdhKh5/BQIkM/XQ7+eYSHji1vetS3RjtddTSD/soTZ31Pj2df8R5HV4FVWtdA6s0dCHHbzT7Fn35iVGiXexlceGKUTPwkQjy/OcrK5XzwHoYKmiZD2uWUZVakHT4RHUEJFRU7bGqpTjasqUPN7QRqEZALYtwO8r7Iy06dQnb253L+7WwpJ0f6UejG9B7DgxBqkOPFhBbwaTOzIEuOw3tcPuT8gokcpnoQ/QCb3kE/JMV/hjTQqft1nYdlyDfwwe/FbQtAo0M6QRF2hUpdve1MirqKPW3xQoxa+WWpl4igm1fKiKdrHkqA3e8p/2/ZkRbWEAC25Lsx9YXYnbXJqKO3x+TOhLkJa3J8XagjLG2oivT4WLA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(376002)(346002)(136003)(396003)(366004)(966005)(71200400001)(41300700001)(478600001)(186003)(53546011)(7696005)(6506007)(26005)(9686003)(122000001)(38100700002)(166002)(38070700005)(83380400001)(19627405001)(2906002)(33656002)(8936002)(5660300002)(52536014)(55016003)(316002)(91956017)(86362001)(6916009)(54906003)(76116006)(8676002)(4326008)(64756008)(66446008)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gMKvKQtYh9I0ikCOeTPnBqwU6mtUEFJeN5sXZPHOKH77JOBSM1QLC9SkS1pn?=
 =?us-ascii?Q?H5CaS5rw52CZ3RBhtCjusZcI0BH25/YuoOr8vKu6YDppfrEzTIuZbUc490cX?=
 =?us-ascii?Q?P7fO880Dt4V2dLQNFuQw7X7/Ql9J9WhOb2qChW5AIkue40weVDWaO5mecAsv?=
 =?us-ascii?Q?slV3oDJgEcXp/nskH1ni30406sEjriDf9uHz22i4ocU2MYpJNmXeyvkXrV2F?=
 =?us-ascii?Q?ehGlSb4S1ZW3gHD71pkZdDKiMMXl4JssD+380wYHiAIDfJB6lZpbO2AJEYWa?=
 =?us-ascii?Q?nL5VRr1yF001czV9vloDFH/Jz//C+C4RqmPpF+QoK10aV6JtCF8Fw6JX9oNr?=
 =?us-ascii?Q?R6OTxcRngwGJxlWy7kWZGfAlSsNsIU1MDtv32vQU8deSB96xSrluPgA3v5iI?=
 =?us-ascii?Q?d5LOzoaygmqoR2q2bxv8BQdUCeYL8SGLBhPrDpq+7va+Jq6JUBF1kGrTLKbG?=
 =?us-ascii?Q?pdtnrlE2XKb2doHADi6k5chqaofpXn5Vty+589MWViIoj1ytsLF2JRQC/M2/?=
 =?us-ascii?Q?tdlEdsZP69YEu+5FP6qMOIDvJaXq9aR6mqEhMCDPupAW6lFGDvVwp9z+OrEN?=
 =?us-ascii?Q?xnf+X6nn/w7RjVPAMKgui2aZ+vMAJjRwIOtscogtoIgRKt18TXz2cOxarmW4?=
 =?us-ascii?Q?B7TDNwjyFeaZ1DvMFp4l0mDMojC2FyrW/YslqfFnm5RnZzlMa3GoZu9Qkue8?=
 =?us-ascii?Q?uKQnYnreKk7dgOY4o/MjE5xxHLtfgeZXCiSwjSZ0XkXuX65PM6XqIIuEBVx9?=
 =?us-ascii?Q?KnnXkfnyYEMbJLPdX3XTh5iDVIlmW2eK0ze/e7KsTE6b+Ic7e/zfxq4QLJuw?=
 =?us-ascii?Q?IjmA9WvBlpulhwhEtChog+zc75TRoin6HR5GGkbvVwsZd+p6v6VHYdWrdg1T?=
 =?us-ascii?Q?M8wbf157EB9lDnancaU5l2BkiJ2gw3ZG4sEI6Y0QHB2DB0tzgJRncY/+/HCT?=
 =?us-ascii?Q?B65dzgLbGWNSfNWF0Dw607S2TzgoChzawAaFn4+et36icLI0kKnrdDI/HPmt?=
 =?us-ascii?Q?mzcQOnQ/vdGVx31IbfMR9mZ5E3itHNgHjLS4bn03+v4ARMKYHYQTC8QnyN5f?=
 =?us-ascii?Q?64vwtZd+Nj17C61uO/DgUNsqTPrsYOyg/+vm/VxaYhhWVVE7/G6QzKqhfh1A?=
 =?us-ascii?Q?trs4L0lsO4LCdggzHpKN0G1FMoAvVkHISdPl1uKgcP8DIfKcbvmm+zv8ePjj?=
 =?us-ascii?Q?ZvSEx+Oa0oSt0MnWYq4UD/VzXIs+RtMOGOWWVfzeu0Kul3a1OHVSliK2K4SE?=
 =?us-ascii?Q?Xcgl4Qz/liV/Eih7LydtvLSgmbEJl3PGY064cHPmdrzX41EFlzcdH2rkCJft?=
 =?us-ascii?Q?VxatwM5pIY1dR706MclsSyDxYlqTPt6N1aKtAJv8pqHXz6C1C0RTsT0+4GUb?=
 =?us-ascii?Q?hx1KDm7hzq++3s83Ftujg9dvjQizsqOBChqhkzS01FsGw2BvQPFwRueAEW8c?=
 =?us-ascii?Q?vGvNw8SCfoIuZkeeJ8rL/S8ll19ycoNxrSZgoxMbFkkVmFai/OCZF0srRyDq?=
 =?us-ascii?Q?Uvmpe8u1tAzanrB4u6cDPW/PY/pO8jfgDJsuMMfPutrBFwchFw0NYV7DmPld?=
 =?us-ascii?Q?cPaorOaRoeA1hqdgRK9k27ODYFSRoVi/+iJvDnSd?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15aef601-1580-4c00-64bb-08da683925ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2022 21:13:08.2416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uERd87Ofh2rFrOEEIOXYvudBaAkKQIsJ0K5gab2BUMPxuUkEdVx5hkHWLCeRGv1X9DUnaz+7JpuFWtRkGNL3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833
X-Proofpoint-ORIG-GUID: NFRe3mCeZNvrtCAcPST3cvlTpEAQdNBy
X-Proofpoint-GUID: NFRe3mCeZNvrtCAcPST3cvlTpEAQdNBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-17_14,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 mlxlogscore=999 clxscore=1011 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207170102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pfptdkimsnps;
 bh=iVxVXfnJY6jS1++pX3I2n1LlA59chv6f3x8xUaiQN48=;
 b=ZVHhiHeSaKxHPdWKUNBza83UnaWLHFk/Dke7lMonQa8ruUSHxmxYZQyULROY0bXNdug4
 bncMNInE2fqXCoIJybMmRWDgTIpaDV4laZNVnUyxMIOi9wNrMDzEwY6NWCB4CvGrTJlM
 V+gD1fRUuLaaaEpTuNEphaxHTcdB63YI+j3JfRyiRWGWttwD+g+3P+cm6Ye0POoiBmdH
 HVbMXrk6aqVxHeX1xqiUBg6JhUV1TFGyaVZDXyU4JWfXb8xbTBuMEvW9coIgv5gRd1wU
 7t/F7ymEgbNHpt218BiOXXX4F8geHebqGk+lHA8CO4ApWpHNd26qN7uOLb+JM8xFXlXd ZA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1658092396; bh=+tw7LoQf7KS6sPXZDaSE7/1FXxVKqxwJFs+2jky4orE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=LyVAeNEy7lWf+rBXVDmM0b4FF7lekj0G2CIORgSj/GhBeP7uEf2L139rjLXSlnGmE
 4Xj/hRK3pn/f2BOHgQ/LWlepAEUFVl16mDybm4Pz8DVKNGt43tN4FaO9eClwJBhLdE
 rfcHpH3diqDeiLlpqOu5d/A1bYi9c0raPmUb74If0COnEkv9sftyFn6vMti5kbFf4X
 rkQGd8CnSoNJZIFCn40jqmnSDtTs+tXylaiYaQzpKuCRzftt0PDQRNk4985J2i0cUN
 8vEq6rmHzaTJ0Q1KPjVv9PLEfx+Kfl/MDXiTsNvqm2yK/Zj+SHih7U7v2tqUZju9bn
 NvW7RLisqYPiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVxVXfnJY6jS1++pX3I2n1LlA59chv6f3x8xUaiQN48=;
 b=NSg2b+RN/dhI/LYZRZ0WMvfPffa/JGEiNk7QwS96YshQnToi+ar09sIPH5o5jKFMbEo5+PTG2ebDOBh6MYbj/lBEkVabLcaOWLMtCSPrlQzU2iv/abR/LAv8eW2djZCfS4c1RdZ0z5ip36Xs6s/JdhEh+xBLYeaF8UAIfgmuGx0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=ZVHhiHeS; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=LyVAeNEy; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=NSg2b+RN
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=abrodkin@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NSg2b+RN";
 dkim-atps=neutral
Subject: Re: [Buildroot] [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Buildroot mailing list <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8435959041048967885=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8435959041048967885==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_IA1PR12MB62105EDFE310AD93A55A33B6A18D9IA1PR12MB6210namp_"

--_000_IA1PR12MB62105EDFE310AD93A55A33B6A18D9IA1PR12MB6210namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Please let me take a look at this one.

The point is we do use 4 KiB page for building for the ARCv3 processors,
see https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/blob/=
arc64/arch/Config.in.arc#L133.
And so far I haven't seen any problems with either uClibc or glibc.

And since I don't immediately see any changes in Binutils for ARCv3 which t=
ouch
"common-page-size", I'd like to figure out what goes wrong here.

I'll get back to you soon with some explanation of what we see here.

-Alexey
________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Monday, July 18, 2022 12:04 AM
To: buildroot@buildroot.org <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; ARC Maintainers <arc-b=
uildroot@synopsys.com>
Subject: [arc-buildroot] [PATCH] arch: remove support for BR2_ARC_PAGE_SIZE=
_4K

BR2_ARC_PAGE_SIZE_4K=3Dy is broken with both glibc and uClibc. The link
of the C library fails with:

ld: common page size (0x2000) > maximum page size (0x1000)

This is due to BR2_ARC_PAGE_SIZE_4K=3Dy settings
-Wl,-z,max-page-size=3D4096, but binutils apparently defaulting to
common-page-size=3D8192.

While this could potentially be fixed by passing
-Wl,-z,common-page-size=3D4096, these failures indicates that nobody has
tested 4KB page sizes on ARC in the context of Buildroot, so it is
more sensible to drop support for this feature. Should anybody need
this, and have the ability to ensure that it works, we would certainly
be able to re-introduce the feature.

Fixes:

  https://urldefense.com/v3/__http://autobuild.buildroot.net/results/c8b2f3=
31c98453670cd982558144c4fd84674a3d/__;!!A4F2R9G_pg!d146KtaYDg9TTYEfT0WXaW0a=
ZMlQQKFLOg2D6B-sBZTaF-Z9vn7WvMcW7awUpJi0eotuvN5Rby7WE8qT-3KSx15eJwata0p_gA$=
  (uclibc)
  https://urldefense.com/v3/__http://autobuild.buildroot.net/results/3a22f7=
aac38145b26c549254b819f87329e7a77e/__;!!A4F2R9G_pg!d146KtaYDg9TTYEfT0WXaW0a=
ZMlQQKFLOg2D6B-sBZTaF-Z9vn7WvMcW7awUpJi0eotuvN5Rby7WE8qT-3KSx15eJwbxDr7yig$=
  (glibc)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy   | 7 +++++++
 arch/Config.in.arc | 5 -----
 arch/arch.mk.arc   | 4 +---
 linux/linux.mk     | 4 ----
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 956da10a9f..1590a9fa25 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif

 comment "Legacy options removed in 2022.08"

+config BR2_ARC_PAGE_SIZE_4K
+       bool "Support for 4KB pages on ARC removed"
+       select BR2_LEGACY
+       help
+         The support to use 4KB pages on the ARC architecture has
+         been removed, as it was broken with both glibc and uClibc.
+
 config BR2_PACKAGE_PHP_EXT_WDDX
         bool "php wddx removed"
         select BR2_LEGACY
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 388d3496bc..58103ad171 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -103,10 +103,6 @@ choice
           size matching the hardware configuration. Otherwise
           user-space applications will fail at runtime.

-config BR2_ARC_PAGE_SIZE_4K
-       bool "4KB"
-       depends on !BR2_arc750d
-
 config BR2_ARC_PAGE_SIZE_8K
         bool "8KB"
         help
@@ -121,7 +117,6 @@ endchoice

 config BR2_ARC_PAGE_SIZE
         string
-       default "4K" if BR2_ARC_PAGE_SIZE_4K
         default "8K" if BR2_ARC_PAGE_SIZE_8K
         default "16K" if BR2_ARC_PAGE_SIZE_16K

diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
index 32b818b0e0..697c0ff524 100644
--- a/arch/arch.mk.arc
+++ b/arch/arch.mk.arc
@@ -6,9 +6,7 @@ ARCH_TOOLCHAIN_WRAPPER_OPTS =3D -matomic
 endif

 # Explicitly set LD's "max-page-size" instead of relying on some defaults
-ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS +=3D -Wl,-z,max-page-size=3D4096
-else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
+ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS +=3D -Wl,-z,max-page-size=3D8192
 else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS +=3D -Wl,-z,max-page-size=3D16384
diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9..f012689a9e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -362,10 +362,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
                 $(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
         $(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
                 $(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
-       $(if $(BR2_ARC_PAGE_SIZE_4K),
-               $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
-               $(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
-               $(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K))
         $(if $(BR2_ARC_PAGE_SIZE_8K),
                 $(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
                 $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
--
2.36.1


--_000_IA1PR12MB62105EDFE310AD93A55A33B6A18D9IA1PR12MB6210namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Thomas,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Please let me take a look at this one.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
The point is we do use 4 KiB page for building for the ARCv3 processors,</d=
iv>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
see&nbsp;<a href=3D"https://github.com/foss-for-synopsys-dwc-arc-processors=
/buildroot/blob/arc64/arch/Config.in.arc#L133">https://github.com/foss-for-=
synopsys-dwc-arc-processors/buildroot/blob/arc64/arch/Config.in.arc#L133</a=
>.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
And so far I haven't seen any problems with either uClibc or glibc.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
And since I don't immediately see any changes in Binutils for ARCv3 which t=
ouch</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
&quot;common-page-size&quot;, I'd like to figure out what goes wrong here.<=
/div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I'll get back to&nbsp;you soon with some explanation of what we see here.</=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
-Alexey</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Thomas Petazzoni &lt;=
thomas.petazzoni@bootlin.com&gt;<br>
<b>Sent:</b> Monday, July 18, 2022 12:04 AM<br>
<b>To:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Cc:</b> Thomas Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;; ARC Maint=
ainers &lt;arc-buildroot@synopsys.com&gt;<br>
<b>Subject:</b> [arc-buildroot] [PATCH] arch: remove support for BR2_ARC_PA=
GE_SIZE_4K</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">BR2_ARC_PAGE_SIZE_4K=3Dy is broken with both glibc=
 and uClibc. The link<br>
of the C library fails with:<br>
<br>
ld: common page size (0x2000) &gt; maximum page size (0x1000)<br>
<br>
This is due to BR2_ARC_PAGE_SIZE_4K=3Dy settings<br>
-Wl,-z,max-page-size=3D4096, but binutils apparently defaulting to<br>
common-page-size=3D8192.<br>
<br>
While this could potentially be fixed by passing<br>
-Wl,-z,common-page-size=3D4096, these failures indicates that nobody has<br=
>
tested 4KB page sizes on ARC in the context of Buildroot, so it is<br>
more sensible to drop support for this feature. Should anybody need<br>
this, and have the ability to ensure that it works, we would certainly<br>
be able to re-introduce the feature.<br>
<br>
Fixes:<br>
<br>
&nbsp; <a href=3D"https://urldefense.com/v3/__http://autobuild.buildroot.ne=
t/results/c8b2f331c98453670cd982558144c4fd84674a3d/__;!!A4F2R9G_pg!d146KtaY=
Dg9TTYEfT0WXaW0aZMlQQKFLOg2D6B-sBZTaF-Z9vn7WvMcW7awUpJi0eotuvN5Rby7WE8qT-3K=
Sx15eJwata0p_gA$">
https://urldefense.com/v3/__http://autobuild.buildroot.net/results/c8b2f331=
c98453670cd982558144c4fd84674a3d/__;!!A4F2R9G_pg!d146KtaYDg9TTYEfT0WXaW0aZM=
lQQKFLOg2D6B-sBZTaF-Z9vn7WvMcW7awUpJi0eotuvN5Rby7WE8qT-3KSx15eJwata0p_gA$</=
a>&nbsp; (uclibc)<br>
&nbsp; <a href=3D"https://urldefense.com/v3/__http://autobuild.buildroot.ne=
t/results/3a22f7aac38145b26c549254b819f87329e7a77e/__;!!A4F2R9G_pg!d146KtaY=
Dg9TTYEfT0WXaW0aZMlQQKFLOg2D6B-sBZTaF-Z9vn7WvMcW7awUpJi0eotuvN5Rby7WE8qT-3K=
Sx15eJwbxDr7yig$">
https://urldefense.com/v3/__http://autobuild.buildroot.net/results/3a22f7aa=
c38145b26c549254b819f87329e7a77e/__;!!A4F2R9G_pg!d146KtaYDg9TTYEfT0WXaW0aZM=
lQQKFLOg2D6B-sBZTaF-Z9vn7WvMcW7awUpJi0eotuvN5Rby7WE8qT-3KSx15eJwbxDr7yig$</=
a>&nbsp; (glibc)<br>
<br>
Signed-off-by: Thomas Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;<br>
---<br>
&nbsp;Config.in.legacy&nbsp;&nbsp; | 7 +++++++<br>
&nbsp;arch/Config.in.arc | 5 -----<br>
&nbsp;arch/arch.mk.arc&nbsp;&nbsp; | 4 +---<br>
&nbsp;linux/linux.mk&nbsp;&nbsp;&nbsp;&nbsp; | 4 ----<br>
&nbsp;4 files changed, 8 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/Config.in.legacy b/Config.in.legacy<br>
index 956da10a9f..1590a9fa25 100644<br>
--- a/Config.in.legacy<br>
+++ b/Config.in.legacy<br>
@@ -146,6 +146,13 @@ endif<br>
&nbsp;<br>
&nbsp;comment &quot;Legacy options removed in 2022.08&quot;<br>
&nbsp;<br>
+config BR2_ARC_PAGE_SIZE_4K<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Support for 4KB pages on A=
RC removed&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_LEGACY<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The support to use 4KB pa=
ges on the ARC architecture has<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; been removed, as it was b=
roken with both glibc and uClibc.<br>
+<br>
&nbsp;config BR2_PACKAGE_PHP_EXT_WDDX<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;php wddx remove=
d&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_LEGACY<br>
diff --git a/arch/Config.in.arc b/arch/Config.in.arc<br>
index 388d3496bc..58103ad171 100644<br>
--- a/arch/Config.in.arc<br>
+++ b/arch/Config.in.arc<br>
@@ -103,10 +103,6 @@ choice<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size matching =
the hardware configuration. Otherwise<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user-space app=
lications will fail at runtime.<br>
&nbsp;<br>
-config BR2_ARC_PAGE_SIZE_4K<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;4KB&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on !BR2_arc750d<br>
-<br>
&nbsp;config BR2_ARC_PAGE_SIZE_8K<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;8KB&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<br>
@@ -121,7 +117,6 @@ endchoice<br>
&nbsp;<br>
&nbsp;config BR2_ARC_PAGE_SIZE<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default &quot;4K&quot; if BR2_ARC_PAG=
E_SIZE_4K<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default &quot;8K&quot; if =
BR2_ARC_PAGE_SIZE_8K<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default &quot;16K&quot; if=
 BR2_ARC_PAGE_SIZE_16K<br>
&nbsp;<br>
diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc<br>
index 32b818b0e0..697c0ff524 100644<br>
--- a/arch/arch.mk.arc<br>
+++ b/arch/arch.mk.arc<br>
@@ -6,9 +6,7 @@ ARCH_TOOLCHAIN_WRAPPER_OPTS =3D -matomic<br>
&nbsp;endif<br>
&nbsp;<br>
&nbsp;# Explicitly set LD's &quot;max-page-size&quot; instead of relying on=
 some defaults<br>
-ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)<br>
-ARCH_TOOLCHAIN_WRAPPER_OPTS +=3D -Wl,-z,max-page-size=3D4096<br>
-else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)<br>
+ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)<br>
&nbsp;ARCH_TOOLCHAIN_WRAPPER_OPTS +=3D -Wl,-z,max-page-size=3D8192<br>
&nbsp;else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)<br>
&nbsp;ARCH_TOOLCHAIN_WRAPPER_OPTS +=3D -Wl,-z,max-page-size=3D16384<br>
diff --git a/linux/linux.mk b/linux/linux.mk<br>
index 322ccabbd9..f012689a9e 100644<br>
--- a/linux/linux.mk<br>
+++ b/linux/linux.mk<br>
@@ -362,10 +362,6 @@ define LINUX_KCONFIG_FIXUP_CMDS<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; $(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(if $(BR2_powerpc)$(BR2_p=
owerpc64)$(BR2_powerpc64le),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; $(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(if $(BR2_ARC_PAGE_SIZE_4K),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; $(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; $(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(if $(BR2_ARC_PAGE_SIZE_8=
K),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; $(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)<br=
>
-- <br>
2.36.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_IA1PR12MB62105EDFE310AD93A55A33B6A18D9IA1PR12MB6210namp_--

--===============8435959041048967885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8435959041048967885==--
