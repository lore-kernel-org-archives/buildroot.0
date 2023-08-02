Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BFC001DE
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 22:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F9941E0A;
	Wed,  2 Aug 2023 22:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F9941E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4E3qZUCXgo0O; Wed,  2 Aug 2023 22:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06BE441D75;
	Wed,  2 Aug 2023 22:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06BE441D75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1151BF2F8
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ECF181F33
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ECF181F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3Vlj-Ggb1T2 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 22:48:00 +0000 (UTC)
X-Greylist: delayed 5241 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 02 Aug 2023 22:47:59 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA588200E
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FA588200E
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 22:47:59 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372JkS7q027571; Wed, 2 Aug 2023 14:20:35 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s5213u7p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 14:20:35 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 59F4D40354;
 Wed,  2 Aug 2023 21:20:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7742DA0087;
 Wed,  2 Aug 2023 21:20:33 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 989AF401CC;
 Wed,  2 Aug 2023 21:20:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejBhtNA8CeexOf44s27ZqLIpKtlPeOuA+MZU3/v30njxeiKT5pz9MktxBjylBB6WGxoExdCA7GAxKrw7iMTVCraRk1tOTyo7YlT7M6/XU5hhpH4zBHQqx/1dxDJOuTMWTqrEMrn+g7N7ftLrioZOfRS5QuwQprq1Uxgrm9rdSf8o8J0YQANOnne6Tgq4XiG7AHKfmJNA3L1HUfJv+16ZubDtxghl1F0P0hIZ7vIuEsbzwx7w66JAxxcnV4IlgqQdS098hcpMFcsaxqHxjLUwzox2+1UcWUOYUwPTyFUlUtnierWkQ9xTKN2O2tObiUSg20WesXhUgPbkZ1nBsxBXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjqho7linBSCs/O+AuKsP7mLDhsnVfu/EGd7fruEVEY=;
 b=WKcEngulnZm9ENRF+t0DUMZ40VbskG5Wf3Btd5lRhaKFNhkk5IZG+T7K7/3CA3eewJt6Qk0bn4+IFh269mPXdv/ZNu7iXwG0uqCaHd6w9Ez5/9pwzQd3cbXedSekixZ9dwecc6UXwUMt0PDlT1657TcnrMYreIrjGeZlWR/jRL3iNz+ryHjvebVJjFiG6AupP8/EOaPYDvmn4hpFNlCz605RB+guaWsdeL9FE157b54nKMJGheexb5URBvukt1kr/9+DCIu4Os5uJY0UZXFQAD1a0JQZTcxT11VQe+ucP/cWsHd0rnmsyNKD+bFy1QXFFB5ZGviRmIoyWx55bpZjlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Wed, 2 Aug
 2023 21:20:29 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::1c34:abbc:2647:3ac9]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::1c34:abbc:2647:3ac9%7]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 21:20:29 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: ARC support in Buildroot
Thread-Index: AQHZxXxsyVL9JPLBBEuOxJgXjw3kZq/Xb51n
Date: Wed, 2 Aug 2023 21:20:28 +0000
Message-ID: <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230802220321.6af766af@windsurf>
In-Reply-To: <20230802220321.6af766af@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|IA1PR12MB8191:EE_
x-ms-office365-filtering-correlation-id: 46ee73ea-0e35-4901-4d61-08db939e4b94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /RNwzlSS9NpUa3Xm3FXfvLdd1TaotT7S49OtRqFz0c2K3VVuh+KxdCW7SDFNogQc2rWGOAxxQazmvT58GtiUjs3P3Nv7BW2wxO/c6ufp8pNC8uSFwbwuLu/gquNrogUm7mcuHVfS2FmeruiR1D2o+PNj+GV/GMlxTNjk1QUetxjzuA34kXQgWoQpQd/bfluTZUGvy4ucru4HpXPjo9Ibcgi9izUu80e5hcyLjhw7IZ9NrPlMtj4XBy0eYichPOo+dxqKBp/Mxi+Cw77fqkpBZADb4o0EUkl6kY2H3BuYhFdzRZezz+hsCC1SWyabvnp17RCrkm1hWrONl7mbpsAuaa5yWrQJ9y6brn+UjwkAX9usgePZ5Kc13ektw1Ps2nIcFTWICRdVKLd5j6NrDZ6P3oPhAkpqKNpGOiPEjxPpZl3GaNXW2+k2q240QXuBhkKOkniooAwZfUXBH06ph0vxTPkuKsgdiindJftChwWea1puYohN1AFNXEZcoe6tFbb8TBu2+NMi0FuZDmyNPeZNhc3TEdpoIFUZtXwPAY/VF1E2K24v1LGIrnPudbc7O6+1D3pt9X5v4xHpL5R/9GA03LpR4uAvSlnGO9v+3nUQMTmp60Fnz6Qk9i0xf+Bunf/ifBAmOcB61S6S0neAVO5lOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(2906002)(8936002)(86362001)(316002)(8676002)(52536014)(5660300002)(38070700005)(41300700001)(33656002)(55016003)(16799955002)(7696005)(71200400001)(478600001)(122000001)(3480700007)(186003)(966005)(26005)(6506007)(107886003)(9686003)(54906003)(83380400001)(66556008)(76116006)(91956017)(66946007)(38100700002)(64756008)(66476007)(4326008)(66446008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LxNH6QmPtJJcimEpGtEJmPxaOeBU4loeIx4zrjDHiEUcGHCMNMKuuf5EgX?=
 =?iso-8859-1?Q?IEf2edQL9Ms1TBziPdx+huyfj5zWIJT2TYiS9LHwkk5Ks3SwbAKeLY28YR?=
 =?iso-8859-1?Q?oRrSiMO5oCyHSnulIQARex2vvA41CR7PolBEAPVqrGAyVLgUNGitvgTVsk?=
 =?iso-8859-1?Q?TIifZOtfCSvEvxe80cLwDpC7Tpg0++YSyQIbUJ0W09PN8gPJB35cZ+jYmm?=
 =?iso-8859-1?Q?xoK5tS8O2jM9tjsu37TZLsb28ZpZhHwuFAZgOFWzJpk0HIt9V5YbMkLxDK?=
 =?iso-8859-1?Q?UtirM77Yxwusxx+L05eoyrr65H5cVYRV3AuoBzKzMIjWJfqn5LjDFbSG93?=
 =?iso-8859-1?Q?CjMx3WALdrIs/syM9R3RAIQBj/OcieKMlP8CFQJ//l1rGa7xMl9dbHPpXh?=
 =?iso-8859-1?Q?pJDOXK0pspAXyNXnPDsXa82e9/SxIVluD+vEQhRdCJIKNyhX+RD9+4cWum?=
 =?iso-8859-1?Q?1snUDpyFQ0xk7Jwwqa5pcZwtigHpI0EUEYaF7qJfmgjreYoZvYINx6TxrF?=
 =?iso-8859-1?Q?ZE2aILWeK3BKwVXhHxaFaJEkyrEqSlbc6lVdR1qTZA7lCqcaKk66VJT4o2?=
 =?iso-8859-1?Q?OWT7J6jUJEDJsBSW93KRccGNMZLFNr83c5c1sVtphEdwhK8anBtvPYulcC?=
 =?iso-8859-1?Q?WIhSu/qQMgeiMuIeoR/ydCzeaa/Ccagdrj1IRBri/58o7nq7y442zqBCdr?=
 =?iso-8859-1?Q?SmKRF0BPporlKxmGLqrbe5LpglFbmAk1nl1sYfzv6d1vIQfT4TFNUJFiov?=
 =?iso-8859-1?Q?BSlE+/ljT/YIKl6G3Y7MX2frkJPXpZPd+hNQak447BgFzbK+pk/2IvBSdg?=
 =?iso-8859-1?Q?quzU4kgvVZj/Fy9UU/Wk6/UVT9RYb4GxWfSj0Gms1qQlMKN/2JHmp72iX7?=
 =?iso-8859-1?Q?YVMhk5EYkDOGz++O2Xoi/vWHMQRGEyqNKt7dheKhOf0LdEAs4qFR/UHyrm?=
 =?iso-8859-1?Q?OJZEjCN2xXDN78PvCzGk6hRAeSanGuj/Rs3mmw6avmH4WrS1bKwW/tsh0n?=
 =?iso-8859-1?Q?oBa4Xzkm+TD2XlbxDWcPP3pws5nP+lLDnkLE2TyYcs1d1rOhhsVrosg///?=
 =?iso-8859-1?Q?StNPOFMJyMSxeL67X8SoJTPWHBisf//IQb++fPmGuhEZGmR0y5aO1Pkn3H?=
 =?iso-8859-1?Q?J1uwSvwWo+YlTAGkCV59UgLPjBLE/Xmy58Ei6ayVG8VynqkDAvD3/Q+90R?=
 =?iso-8859-1?Q?WwQriX6W098DmUAK+eyejv06YYQTX73hFUr5ZdKfQawwNmd7wdbPd0wcJe?=
 =?iso-8859-1?Q?C7duy3I8II89oGMgTv4CRsK8oK+KnpLvgygvtuwajwn/LUsdR0wPcJ8PEG?=
 =?iso-8859-1?Q?vhyzDXjhRUTYACCPQpsPfQe4oaj3EfvwQVGxSnOucX2TfEeO+9eS/G3bP0?=
 =?iso-8859-1?Q?iWnwPv2kFvpcrdcIgrrq/kHyPciC9PYQZANpSoWFX+DddRMAMyhvH/sOqX?=
 =?iso-8859-1?Q?qmjDroRFSL7/KReKwO3Za9z1whfUG4QEtIls0+7bTClHqV/EeXGma4eJm2?=
 =?iso-8859-1?Q?hG5s7czAvnyC45VbXGGU7wfcuo6MiBRP0j9xmpUNH6gT953Tj5zOJ7wSJl?=
 =?iso-8859-1?Q?n7REtiEOd/pknHyOTJAHAbszRjb6rcTu8jeXa5A+kKaE5b7Dcx2Lfjzscc?=
 =?iso-8859-1?Q?2e0Hi1bgYN8F+Scx3IAXGBOuUw1Hgc3QrV?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cMF7ZUJ1DKJSoKShbnNHovwblk9ERjeiAzKsKalPqTQ8iENArOW9WhEiIFUbaInqkFIYe9Sac7Z/YagjXXyUffR3OCVEH/36Hgp7NvPa9w4VuCQC43Jo9Oqg0w22ODessgjK+wlm6AIzYCxcrhwOghEYZujYaXmbg1bK0CjkQc7fPVdoTgzeehCBUiyy9m6kx28PPg9nhX4wygje7nX/DsKvHha3oPymU2sdV8T23JGXsi6WyfIeD3lEk0gy2h/zwWjxd148U+D826Bt/I6nJlCKzVM7kdwAFnT3N1Y71aitnQCMUkgved+aXuCmHQzSoifnAWpG8fTaPsQ+zwfjC708OgLtgX5Vk4fa6Xhl899Fu6Kz6SUjyTd3145Tt0JuT2gjVXvzRgKXiXV5BuowWDcNckPtsm7iFOA5E+w3uu9rCjpsHupe6DDCLAQlrM5KHYHeuNvqr2WF5XYsJyq/bqRrlnNo4Ynna0biNhT8fxgN4VJFhz5G3NCm2RLVLdn/w24yXZFNr/DmVf9M2pT55waXPrMZ94uxEUf/L64aTmO+8wyOwNu6bX04wKPz/2EKLEqIRENn3vJuekuRadXnOJE++GWk9Njn6KzfJmN7k0UdRTXknVojL/UnMP+fr4WKp0e3BMVkk2mhz93Er/CbKDd4WQsSx7DwMoLXr4H2HXVJjcoE4AKzK+ftMUPB9ei8uh2TItIMRpPduwdb5gvb6ZReQST2q+7TyEestdwOJAHc4owrF54ade5XziEmcOAaRQgKhAvmd4aRoO1XmEDKEzcfJ/3LQ6IOyaDc+DH1rZO+dFSaurz74LKfaXni+uwinoAWehaS6vZCr5k95tO6Qg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ee73ea-0e35-4901-4d61-08db939e4b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 21:20:28.4867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4IHa1chSLFgXOj0YrMuiIcdTyUWhsw45jdWZ5EocgYeRW1OmpEBdcUombdGSue1DwjEFwA/jr6Akw2zB5rqqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191
X-Proofpoint-GUID: _XqYnNoa6IQq-vKKoglcnEdBoECXFjXq
X-Proofpoint-ORIG-GUID: _XqYnNoa6IQq-vKKoglcnEdBoECXFjXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_18,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308020188
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=jjqho7linBSCs/O+AuKsP7mLDhsnVfu/EGd7fruEVEY=;
 b=K63ofZyF76wLaoN5cHltAwB1nLP5EBxmmkw59fdgzubX9iDT0JxQS597MriwRZwv2arv
 +pg/8w5XzQRePerTrwPec0k08SFXR50IkcVr83xDvsooXvijl13AK4yk3TlMN5devCWR
 QeSL/KBG+sF1ehs0clfz5Kbmr2GwbH3OFESqCcaahzyKvZNPMkATPnbVva4JbQHD8UBc
 9yzHpwTjifAAXr5ElOidIGRpJGi3rwrVt79y0LBzC/JI9mBvkrgLy8ZTavq8T0FU4oEr
 5b8cQ2J3cJqJ4zvJJi5uCfA/tYn6xD6GUA8tbMjHUCWyv+A/KtaVyKxOBf23p/YiYyLN cg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1691011234; bh=3c23/Zu4yfNLbL6mHOSGnjbgc3EnWxg8zShanJ4EIL0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=B97irYNTJ8dKGK/Gh+w5YAQc+2GBYZKTCln2NoOwOowaj+rVHiX+XCvfFC/vo9VA8
 /1Kjay/awcGwutpdE5LQC7x/LTlrb/vVTshHMRtudUi3/BlIiuL7E1gI0eTkLYh0Vu
 yJ4RJHG7cdDwfpIx3AT78okhhJ8qe5vPF7+GRY4fmOmTrPSEToD1Blif7DuZ6HR2fZ
 EcAd6vckYVd2vrxKAMp9b09qv+9WIO5lzW+ku/aC6mf5ptEqpGIKR0wqT2aPZIt4ab
 ox9m1rVo5kVdUOOJkP9IbwZTxjFPuyJHB8HImpZaJ+hyF652r579YsZKiZQ7oah8SZ
 mMqNDrh5ZNUwQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjqho7linBSCs/O+AuKsP7mLDhsnVfu/EGd7fruEVEY=;
 b=U+VD80QsiHRZoj0qxCX934jlekGeJtKmq9UQ/fFdhmw3IGYsp8xcQspXtmLYs8ybahlBimuWjKeCbprpevbiyLuPgZFkLeB5p84J8qypOU6kRu5JBeQHTFGkC16LW/lYsrKpI+wDaXzsLfXxoY7eKY0hb91ayKTRWCkSuTQQtYw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=K63ofZyF; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=B97irYNT; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=U+VD80Qs
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=U+VD80Qs; 
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

> I am reaching out to you to understand the interest that you have (or
> no longer have) with the ARC support in Buildroot.
> 
> Indeed, we haven't seen any updates from ARC people in a long time. Our
> toolchain components for ARC are stuck at arc-2020.09, which is quite
> old as I've noticed you have release much newer versions of
> gcc/binutils/gdb. Also, some of that ARC support has been upstreamed I
> guess.
> 
> Is there still some interest at Synopsys in maintaining the ARC support
> in Buildroot? If not, we would probably want to get rid of the support
> for this CPU architecture.

We do have an interest in ARC cores support in Buildroot and in fact
we and our customers actively use it.

And the reason you were not seeing our contributions is two-fold.

From one point of view ARCompact & ARCv2 support is so good
in the upstream components that barely anything needs to be done for them.
Possibly I'm missing something but the only report I keep getting with
ARC-related problems it's glibc build failure for ARC700 - that problem
was discussed some time ago and I sill have that action-item to fix it.

On the other hand, we were busy working on ARCv3 ISA support, see [1] & [2].
Of which the latter is a family of 64-bit processors!
And so, while it was all work-in-progress we kept all the work in our fork [3],
including changes related to ARCompact & ARCv2 processors.

That said, we do plan to upstream our ARCv3 support in all the projects
as usual, and Buildroot will be one of the first projects seeing these changes.

In that sense, I'd like to keep ARC architecture in Buildroot.

> Side question, is there an emulated platform that is freely available
> we could use to do runtime testing of ARC? I very quickly looked at the
> 4 defconfigs we have, but none of them seem to be related to a freely
> available emulated platform. And in fact, only one of the defconfigs
> seem to have a readme.txt to indicate how to use it.

Great question! We do have now QEMU port for ARC and similarly to other
components it was not yet upstreamed as we wanted to have ARCv3 supported
there well enough, which is achieved now. If of any interest it could be
found here [4]. We're still polishing it, but it's definitely usable.
As a matter of fact for a couple of years now QEMU is an essential part
of Zephyr SDK [5] and used for per-PR upstream verification of Zephyr RTOS.
And since Linux along with Zephyr RTOS are the key payloads for QEMU, it's
only essential to run Buildroot-built images in QEMU for ARC.

Now, why you didn't see any QEMU-related defconfigs in the Buildroot,
it's because we intentionally introduced a "virt" platform in QEMU which
fully matches our reference FPGA platform (HAPS) and proprietary simulator
(DesignWare nSIM). That said "snps_archs38_haps_defconfig" will equally
well work on HAPS, nSIM & QEMU ;)

That said, I hope my comments make sense and improve your perception
of ARC support in Buildroot and kinda gives a feeling of our interest
in the project. Let me know, though, if there's anything you feel we really
need to improve and what might be useful for the Buildroot from our side.

[1] https://www.synopsys.com/dw/ipdir.php?ds=arc-HS5x-processors
[2] https://www.synopsys.com/dw/ipdir.php?ds=arc-HS6x-processors
[3] https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot
[4] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
[5] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu

Regards,
Alexey

P.S. That's too bad that due to some bureaucracy nonsense I was not able
     to meet you and other folks in Prague last month, even though I had
     all booked and planned. But I hope to see all of you on the next
     event like ELCE.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
