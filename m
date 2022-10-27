Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ECAFA3740
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 14:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48523402E7;
	Thu, 27 Oct 2022 14:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48523402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yC56JNERyAFO; Thu, 27 Oct 2022 14:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2654B4016B;
	Thu, 27 Oct 2022 14:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2654B4016B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C64841BF37E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E3124016B
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 14:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E3124016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7kj3dbGj1gI for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 14:10:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EFCE40132
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EFCE40132
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 14:10:51 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RDV6q9007226;
 Thu, 27 Oct 2022 07:10:49 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kfagd4mwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 07:10:49 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 43D8A4007C;
 Thu, 27 Oct 2022 14:10:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 76F50A0073;
 Thu, 27 Oct 2022 14:10:47 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7022E40079;
 Thu, 27 Oct 2022 14:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zgja6+c7eP2HvDr64lEN/yHykMf8huKdNkZowZejtelN323HsIWqfvzmsTQbqHz6VCyOHJhsqt0k9q2VrgdCdv3qsEQt/JCCWYgmzFHMZpCY3PTHIMMHqLDnCnO/69LWduTJy8G97hxwISvKAw3rgNszMeEbS0+8aLa8jkVQQFmj7MhixcrWaUv94BOBLbTc3rAPx/ceXcNeUJtsKD+CuomMvY2FlBQ33193HduRTvKiNaZ/KRZd0dt3bbESvoVHhYxvsdKoErqIXwvHKEmIIIdh2G47pebvk2wCrxBVMi8Zx3Gw9KpBo3CHALLH3iIUkg4ClKX3g0Yv8tv9DNphcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bz+8Hlbd7ydw62tc86kASWAu57dYlylCgcYrztYPTE=;
 b=PQKWs2Ei8hTe2lMdaagoFGodocXmYlrVhKIqVSvSc6lBMikmAdf5quP9QcAIaIJ8ZfJqHHKgdzlznY9L65PmEeNDzGWofTVtlqu4U5DceR8Tmmyj49bFvUgwXuk7PNL11FY8eemnwE0g5E9ewdcoRQdBNpk7/UAm9g6HGxSXZju2lHnYcmUdxV/YY22z+kUdgQkHP5imJYTBsoisfhdigDBAlBKeze8pE+gDyjU5xh3df1+beGLK53RP7X/nHbrzFhgjjU6PEpAcINU1z1XTC8WRZwfT99nWfBiN1Io1xYauuwb/yBtzHiVfuaB4CxKAwKF20vjtAAiZ4OjRscp1sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 14:10:43 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::3809:8dfc:776c:597f]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::3809:8dfc:776c:597f%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 14:10:43 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] package/numactl: point to target libs via
 LDFLAGS
Thread-Index: AQHY59D3zqbiZq2krUSS4e0XDAqR4a4eC4uAgARAfKU=
Date: Thu, 27 Oct 2022 14:10:42 +0000
Message-ID: <IA1PR12MB621033DC230A8F05D8D0A732A1339@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20221024174911.75444-1-abrodkin@synopsys.com>
 <20221024231423.24f384e3@windsurf>
In-Reply-To: <20221024231423.24f384e3@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6210:EE_|CY8PR12MB7610:EE_
x-ms-office365-filtering-correlation-id: 476e9469-4f3f-4276-e7cb-08dab82508ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fk7oAC0j7n21wZ/d5AeYz/JH9uiBZBc/KUtbIXE2HKicskC18Xy1kFmJboRuIRbrEahobM+rnmNWqnxcWsVnifJD3q6n3Oy2kWa10ksbDNuMAwUkxOKkBafNHW8BbJGFZ/vD8beYhpMmWMdAw+/AmS9WdYxRT+IArKxvA1c7oiiO6CFOKAl83G/iNOIv4rJgjbuvQCtwtyeHwKtqYUUh2BvmvS88XBnptQREmYAZDeURDu+zUyyIsug5kYAxg5qpLST/Zs5TjZyZGyhdwOAvEhdVqj9RsKeeJaAMa9noGf20IXp7zbZH+tzZRLmvvm1nx3VhQ5SgMZ+M/hYL+pg05AM0ysvFnbbo3ZAnhLEr+mEDO0aQMJ319Vq8uzwtiIav7YLPA1LFz5KXwNbllGtutQcTwMCKQQRTWsNKmKWItrlCD4ChHrj4lRHJGPbTwtzKx5iyDz1bGiiggJkqQxgU8SCPd+RiObd67wdkm1KkogofMuuRnnW23zErfMPFGItton7Dli4rffzSagMtfd9oT5xoEjTw5blkVElVUYBq1RjTgLixIFnQ9g4Z+0FIM4aYftcjqSicpvsB+iv/BV+X61n0EObwdRJpWIZNJx6KU9RwUUxXxpP8HpIzFYGSbo7dTUqo+8E3cMjjkshPLzscu9rXqJCgc2gCFw2Q7JUuwxRGjfYUckom7EB5xSAqRlxOdLbP6Xt+X+3jQO/0eQz4yY5+Dm9L2qP+ugj15eqnoNnsoY9Xd3ZfZhez3D41ZJavNWZrwmZ3Vh3Pm6ANiyCwGNp+bAl/3ZhJxbkN/pzG8r8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(38070700005)(83380400001)(33656002)(86362001)(122000001)(38100700002)(966005)(41300700001)(478600001)(66476007)(5660300002)(71200400001)(91956017)(64756008)(66556008)(316002)(9686003)(55016003)(52536014)(8936002)(6916009)(4326008)(8676002)(54906003)(26005)(6506007)(66946007)(76116006)(66446008)(2906002)(186003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4CqYXjgRSsILjvdToGRepsBBs6tmmiQSSrLqYYy/S1EmMc7WossxYziIef?=
 =?iso-8859-1?Q?J4sEOBTkoVifFJD53rNJ3huUJLeLcxFEyO62KGo9Ka9Jr9AujF/sfyLpP7?=
 =?iso-8859-1?Q?a+0jbtXiYQTTySczvvmfjU52vfiiSRjyxk+gq7k8KWldeNX+l6Qsc4XqwH?=
 =?iso-8859-1?Q?qwOz1Lipxyq96xL+Uh8HuZvmVuV6hF4PjPi1FvRpSlx7ZCqnoMtDON6vKu?=
 =?iso-8859-1?Q?5XrlV2o/To8JGBap5k3eHoXqssTsT7Yn5Gf2MpK10NSWsLvXpEhC4vXhOh?=
 =?iso-8859-1?Q?6jS4zzjMlSWKYzNYTLsWZayZ1Y5u8gSbcriEmWYAnRH1CQQAsrGCsOJNuA?=
 =?iso-8859-1?Q?bHFBhcmrwAdls3EIU9hs1qoMV3LxxCmMsJtdSNCq7e5Mim0gfsjM6BSWq4?=
 =?iso-8859-1?Q?bHCy2+Yo9xyAwKWJKvoef7w/4aUtmNohysRijiLF3J7JKySZ17PqIg84/K?=
 =?iso-8859-1?Q?aeHzeMvIczFy0Pebx4ZSbg7mYy6S1a7Tf1d1F0vZ4bZaQbfG8Ohr0tpoCT?=
 =?iso-8859-1?Q?zhVYtTl0+cpBc0Xrn6vpcYMZS67pDihBf2uxW7GbRDEMYuW/d4W1bk0Cjl?=
 =?iso-8859-1?Q?dFzGMnd812Fywz986j1SecMBWaEXAk30h8L7EQ8FyR71yDEm/iSRKHJoWK?=
 =?iso-8859-1?Q?3nOPir1QsH9oIJchZOLKtljLDhMCjNJN+u1aRxFciAqQrVLjEQQrfWo3NK?=
 =?iso-8859-1?Q?x7v2v3zvrfAqGolUK2r+MHFhc24fQDewH23HmHAhL6ytUCx5azuurQPqIe?=
 =?iso-8859-1?Q?Ug1MqLfqOkqS77hpgozkwpsgFhh42hSyTWq685XLUrWopLeQIK+NEWtioR?=
 =?iso-8859-1?Q?+2ZFBRUsNBSsnV5qd0Yj4IR9bW+nIX030p8rbbKfbRTW5IqV0aVji+eh4I?=
 =?iso-8859-1?Q?7Rib0PQFr7QxzW/hoYDpWTKvyt9nLc/UM5FDeH6+BQZK5wrb2PgkoZMqHo?=
 =?iso-8859-1?Q?vZWAlOlIVc2OzzyTPo6tLC2ro8J+25Fvg+/N1pXd5JTNfMjpIzLsnHQEpA?=
 =?iso-8859-1?Q?A1urWiBFs0Jo0pc/XLXSC6lJPOExAy8Y/FLTKtE5We6uJ63BXBeEqAiv3I?=
 =?iso-8859-1?Q?QMuQwhvM7Uwk1qI5YptJeFHy8LcSh0hlqXeSAENSvH3KqrlPRk8PfolLMn?=
 =?iso-8859-1?Q?xwaYNUBETxQXgD63m7rxlA6O5tSFNld2T+ewe8/cWv02ihiQ4JpObr2WAz?=
 =?iso-8859-1?Q?z3+ns6pa849Ev+tY/qk6SvjLprbXc+xDJMC4ZMwGa7eFzCaDMzL3XaTPOH?=
 =?iso-8859-1?Q?cu2QjnElNlpqN+rK41GYx1oVRgoldIFfXRNasyBW1GHg5TiAWRPcCKpiNY?=
 =?iso-8859-1?Q?/Wxwm3ZUL9LjwhECfNc8+UjLQlzBS6LcX1YM0mED8HrTbv7nYX1X7o6QO8?=
 =?iso-8859-1?Q?/RDg6B9cXQ19Us3GEIxktOL9a/RA1ArZtWK5eWACEnAPmtE/V22mmeoSY2?=
 =?iso-8859-1?Q?wFLY3JQmyTGWHA8E+JoOfIPTuCaHe3ikaO9C4gEmDupIh4qxZKRdXs9EWJ?=
 =?iso-8859-1?Q?8xyQJ9JqF1Ay+Lca4BAvvbdro1DV8uP+/g/9PyH67Ele6aFzEhSRkkqsv9?=
 =?iso-8859-1?Q?BussJ8cTxd+DqVc6TxxLPfnNugPj2amJGMfwlt9cvHl/eoiDrDXqcWsl7t?=
 =?iso-8859-1?Q?KvHi2I3yawfC9XVBJKet9HE8dJ1DalOLU0?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476e9469-4f3f-4276-e7cb-08dab82508ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 14:10:42.8634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIiMH8EYg+Xi0f7tNfTiRxa9b5RrCB94hDPcivNxBfHMsjnxjBorSdzW6i2Renou1MBCzsuR/e80GCL4KlPFZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
X-Proofpoint-ORIG-GUID: zNYxBwSdh2qWGdwWhPv47Bwg9I6RvKQD
X-Proofpoint-GUID: zNYxBwSdh2qWGdwWhPv47Bwg9I6RvKQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210270077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3bz+8Hlbd7ydw62tc86kASWAu57dYlylCgcYrztYPTE=;
 b=nz/FrvvPqovJlXJLr6yIeUNMbLjcI9NWontvAUmvXqIGAwm+WxIdm+eGBISDWSDL3Ooo
 1LX72WxjhC/P4ktO5zEWOXQ1FmkdvnzCNurtYicfF1SM94uR0JHLvQQFcsIAvxOqilH3
 ZifM6UFjby5MHnl7ZX3Wa+GCIisqL8UhO+wPVSf/PKKICn4w24iC1IKlIeQ4j2O5a0jZ
 G8FG17H3pSxsdufbU49PcA4b+rn1DOwmtt1rmHud9zKYXXvnAKY588TIaAq7GRPT5xLm
 ar3sJeatyrkD7KLJsAZXf5H3yTB9DkYwycQoAJaSIHKmlBcNL2RUYE+35insscWXirUg fg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1666879848; bh=BqHrMkvQ5ZTOxLuppfnXsfuPXeVcyM+cOpeXC0htycE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CuesFTaMG6yni/g/ULvvs1L7SngvmGSB5mO6l6MCpeyB6kFVSdxKtgBB53V20suLF
 BCFU5Z7TdqrlUvrPfrSpj5q/AKhaxg0IhSFToUiRNWTIldFW5LrKYXlHXaMA/y8ZWq
 hsuXrZSxd0bQVDI3OjxhIxfBk7pWRQI9rleK9hTk4nYixG8vz6hH/Y3GKjmyfPVR1X
 JakQzvUhvApIW+InSTBaibMkwYJeRFDtZ1EOvpK6AGXIKk8PH5KvIQkHKvonBqRHWL
 ZKA3KorsdNOvxRl2SXiJmGmf4UVtz93tba3iZf2Fdv4y+F31xFdYd4pZLXsuSUA5CV
 xub2H6zIfQ7QQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bz+8Hlbd7ydw62tc86kASWAu57dYlylCgcYrztYPTE=;
 b=BQo/EGHreRFHlo1uwqV/i8IqRc9GNO0jPF0SF+WehnKFfCUaB1ndrXMDEoTWm0ZH7va3qTBvtZrlXdlDMIoL86ik1JMu+KvHkyZPd9tQwjEvaTjXxfjsgz+HI2q2lZPy6pf9hv9IWYuuqa6nPV4liaZKezzhlQZGgR2P/ZBBAHk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=nz/FrvvP; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=CuesFTaM; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=BQo/EGHr
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=abrodkin@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="BQo/EGHr";
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH] package/numactl: point to target libs via
 LDFLAGS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexey Brodkin via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello, Thomas!
 =

> On Mon, 24 Oct 2022 19:49:11 +0200
> Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:
> =

> > In the commit a699a667bd64 ("package/numactl: add -latomic to numa.pc")
> > we opted-out from unconditional linking with "-latomic" and made it
> > a conditional based on real availability of __atomic_fetch_and_1()
> > in the toolchain. I.e. for many targets "-latomic" was not used
> > any longer.
> > =

> > And in those supposedly rare cases when libatomic was required it was
> > all OK until there's a LD_LIBRARY_PATH set with something where yet
> > another libatomic.so instance exists, especially if that's the one from
> > host (in my case I used a separately built host toolchain). Then we see:
> > ---------------------->8-----------------------=A0 =

> > /bin/sh ./libtool=A0 --tag=3DCC=A0=A0 --mode=3Dlink .../buildroot/outpu=
t/host/bin/arc32-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFIL=
E64_SOURCE -D_FILE_OFFSET_BITS=3D64=A0 -Os -g0=A0 -Wl,-z,max-page-size=3D40=
96 -fPIC -std=3Dgnu99=A0=A0=A0 -o numastat numastat-numastat.o=A0 -latomic
> > =

> > libtool: link: .../buildroot/output/host/bin/arc32-buildroot-linux-ucli=
bc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -=
Os -g0 -Wl,-z -Wl,max-page-size=3D4096 -fPIC -std=3Dgnu99 -o numastat numas=
tat-numastat.o=A0 .../gcc-5.2.0/lib/../lib64/libatomic.so -pthread -Wl,-rpa=
th -Wl,.../gcc-5.2.0/lib/../lib64 -Wl,-rpath -Wl,.../gcc-5.2.0/lib/../lib64
> > .../buildroot/output/host/lib/gcc/arc32-buildroot-linux-uclibc/12.2.1/.=
./../../../arc32-buildroot-linux-uclibc/bin/ld: .../gcc-5.2.0/lib/../lib64/=
libatomic.so: error adding symbols: file in wrong format
> > collect2: error: ld returned 1 exit status
> > ---------------------->8-----------------------=A0 =

> > =

> > That happens because libtool of numactl adds contents of the aforementi=
oned
> > LD_LIBRARY_PATH to its "$searchdirs" and then the first libatomic.so it
> > finds becomes the one used for linking. What's more our precios cross-b=
uilt
> > libatomic.so never even gets considered because that first found libato=
mic.so
> > is used with full path, not as "-latomic" as otherwise it would have be=
en used
> > without helpful libtool.
> =

> Thanks for the patch. However, I don't get it. Where is LD_LIBRARY_PATH
> defined?

I meant LD_LIBRARY_PATH is defined before Buildroot's top-level make invoca=
tion,
i.e. "LD_LIBRARY_PATH=3D_some_location_of_hosts_libatomic.so_ make". See be=
low.

> Do you have a reproducer for this issue?

Yes, I have finally. It took me a bit longer than expected to figure out all
the details, thus answering that late. So there're a couple of prerequsites
for the reproduction even on vanilla "numactl" sources, I used 2.0.14 with
the Buildroot's libatomic patch [1]:

1. For example in my Ubuntu 20.04 on x86_64 I installed ARM cross-tools wit=
h:
   ----------------------------->8-----------------------------
   apt install gcc-9-arm-linux-gnueabi
   ----------------------------->8-----------------------------

2. LD_LIBRARY_PATH which points to a location of a foreign (e.g. host or
   some other architecture) "libatomic.so", plus (that's really important)
   right there side-by-side with "libatomic.so" it's important to have
   "libatomic.la" (valid libtool archive, and not an empty file, see below
   my copy which works for the reproduction). I.e.
   ----------------------------->8-----------------------------
   export LD_LIBRARY_PATH=3D/usr/lib/gcc/x86_64-linux-gnu/9/
   ----------------------------->8-----------------------------
   =

3. Configure "numactl" with `lt_cv_sys_lib_search_path_spec=3D""`, which we=
 exactly
   do in Buildroot, see [2], i.e.:
   ----------------------------->8-----------------------------
   ./configure --host=3Darm-linux-gnueabi lt_cv_sys_lib_search_path_spec=3D=
""
   ----------------------------->8-----------------------------
   =

4. Try to build now:
   ----------------------------->8-----------------------------
   make V=3D1
   make  all-am
   make[1]: Entering directory 'numactl'
   /bin/bash ./libtool  --tag=3DCC   --mode=3Dlink arm-linux-gnueabi-gcc -g=
 -O2  -version-info 1:0:0 -Wl,--version-script,./versions.ldscript -Wl,-ini=
t,numa_init -Wl,-fini,numa_fini  -o libnuma.la -rpath /usr/local/lib libnum=
a.lo syscall.lo distance.lo affinity.lo sysfs.lo rtnetlink.lo  -latomic
   libtool: warning: library '/usr/lib/gcc/x86_64-linux-gnu/9//libatomic.la=
' was moved.
   libtool: link: arm-linux-gnueabi-gcc -shared  -fPIC -DPIC  .libs/libnuma=
.o .libs/syscall.o .libs/distance.o .libs/affinity.o .libs/sysfs.o .libs/rt=
netlink.o   -Wl,-rpath -Wl,/usr/lib/gcc/x86_64-linux-gnu/9/ -Wl,-rpath -Wl,=
/usr/lib/gcc/x86_64-linux-gnu/9/ /usr/lib/gcc/x86_64-linux-gnu/9//libatomic=
.so  -g -O2 -Wl,--version-script -Wl,./versions.ldscript -Wl,-init -Wl,numa=
_init -Wl,-fini -Wl,numa_fini   -pthread -Wl,-soname -Wl,libnuma.so.1 -o .l=
ibs/libnuma.so.1.0.0
   /usr/lib/gcc/x86_64-linux-gnu/9//libatomic.so: file not recognized: file=
 format not recognized
   collect2: error: ld returned 1 exit status
   make[1]: *** [Makefile:889: libnuma.la] Error 1
   make[1]: Leaving directory 'numactl'
   make: *** [Makefile:742: all] Error 2
   ----------------------------->8-----------------------------

So, what happens (3) removes compiler's default paths from libtool's
"sys_lib_dlsearch_path", while (2) makes libtool think that libatomic.so
from LD_LIBRARY_PATH is the right one.

> > +NUMACTL_CONF_ENV =3D CFLAGS=3D"$(TARGET_CFLAGS) -fPIC" \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LDFLAGS=3D"$(TARGET_LDFL=
AGS) -L$(STAGING_DIR)/lib"
> =

> This is really a red flag, $(STAGING_DIR)/lib is already in the default
> search path of the compiler, so that should never be needed.

Well, if we don't mess with "lt_cv_sys_lib_search_path_spec" in the
configure script options, then all works OK, but I guess Peter's change mad=
e in
2011 makes some sense and we don't want to revert it, or do we?

Also, I accept the fact that my setup is a bit unusual at least and it might
be a good enough reason to disregard all that discussion, but first I'd like
to make sure we really don't care about situations like that:
LD_LIBRARY_PATH pointing to a self-built toolchain.

If we assume that situation as one of possible corner-cases, then probably
we may want to troubleshoot such funny things which happen due to "libtool"
smarts.

-Alexey


[1] https://github.com/numactl/numactl/commit/e0de0d9e981ddb53bdeb4a4b9dc43=
046c9ff4ff9
[2] https://git.buildroot.net/buildroot/commit/?id=3D6246704008ef219257f30a=
824903855d0e00cffb

----------------------------->8-----------------------------
 Contents of "/usr/lib/gcc/x86_64-linux-gnu/9/libatomic.la"
----------------------------->8-----------------------------
# libatomic.la - a libtool library file
# Generated by libtool (GNU libtool 1.3134 2009-11-29) 2.2.7a
#
# Please DO NOT delete this file!
# It is necessary for linking the library.

# The name that we can dlopen(3).
dlname=3D'libatomic.so.1'

# Names of this library.
library_names=3D'libatomic.so.1.2.0 libatomic.so.1 libatomic.so'

# The name of the static archive.
old_library=3D'libatomic.a'

# Linker flags that can not go in dependency_libs.
inherited_linker_flags=3D' -pthread'

# Libraries that this one depends upon.
dependency_libs=3D''

# Names of additional weak libraries provided by this library
weak_library_names=3D''

# Version information for libatomic.
current=3D3
age=3D2
revision=3D0

# Is this an already installed library?
installed=3Dyes

# Should we warn about portability when linking against -modules?
shouldnotlink=3Dno

# Files to dlopen/dlpreopen
dlopen=3D''
dlpreopen=3D''

# Directory that this library needs to be installed in:
libdir=3D'/usr/lib/x86_64-linux-gnu/'
----------------------------->8-----------------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
