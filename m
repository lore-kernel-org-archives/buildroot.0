Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC90CCA482
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 19:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44482829FD;
	Tue, 19 Jul 2022 19:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44482829FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKCNZdem99fl; Tue, 19 Jul 2022 19:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 271B3829BB;
	Tue, 19 Jul 2022 19:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 271B3829BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C60201BF5A1
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AAB7405D0
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AAB7405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3go3bYeQgRw for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 19:18:32 +0000 (UTC)
X-Greylist: delayed 00:57:55 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C0A0405CD
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C0A0405CD
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 19:18:32 +0000 (UTC)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JICWAi002294;
 Tue, 19 Jul 2022 11:20:32 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3hbvbn2hpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 11:20:32 -0700
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D07BBC0649;
 Tue, 19 Jul 2022 18:20:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id B45CDA0071;
 Tue, 19 Jul 2022 18:20:29 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A316040085;
 Tue, 19 Jul 2022 18:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFPc93rA2FreIg8xzUoKvOEdNPq2iuc34F/DavnXAe4OHUgwN2Yu9V6lxxhdJxUD/bMM/3vqilNuZWkWG2SSW6E5CJ/ATOHHXCFaCZUwzCkcMuJrjpw8e1igBK5JuWVp41vhVlaIe2yyGtdV/GP6C1dCfhfleRSWnWIC9GhcOBwUmrEM7gxqsY9KFcTzDl6ONFP3X2kVxcl0vSqW86t395aIOQ9/AxNbMdzOLBoy4+xTgiAK6tRXWjFCs272BdzDQqtbBCONtkgUqV0nIQCDQ7tiYBnD4d9HdWJrC77O2XXiOJt+WKN5cyG5xNo1uU1KXth7ujEa63aoBlBDBT3fOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRm+3NW2zJ+8WHCvAqCFdyp6RwnNiltxWDXZ2vODBpo=;
 b=LIp3MtbtxlFZT4B7CIIy9/FYK0wpI8df7CaU3oeJSEEfTDz7SjM7zAqktnfbyZZLayTK4B+8+9vi3M/QPzokH0L5xKBgxZQl9TIVbZzLanV8iwp8RkLGEezZ5n+lKg5cPHoimhoo8KgcruFvrGgffqxf629btzzK0k6rpmviswd9gvaD8/t7uT2pn8XMsPglt30+dhSP3LqYlsT/2Eq7fvmWttEhqQfMAFLXM38lsx7JLuNVG4HGJYcJk1YPCxtUgoHXZIrW1XXMz+YArM5826vxE6S/mxk4XgTdhWkPrdWwaQEqGIa54gD2oSIT9aLcDh7PE75LntwbDzLZcXCRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 18:20:26 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::11fa:45aa:6e72:59be]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::11fa:45aa:6e72:59be%6]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 18:20:25 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Thread-Topic: [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
Thread-Index: AQHYmhhpwB71FNPXO0KVhctIyfvU1K2DDMLRgACq6ACAAkarfQ==
Date: Tue, 19 Jul 2022 18:20:25 +0000
Message-ID: <IA1PR12MB62107029D82ADA688CF7C210A18F9@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
 <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220718091350.4b968717@windsurf>
In-Reply-To: <20220718091350.4b968717@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58190ee9-e30b-4a11-5820-08da69b35a05
x-ms-traffictypediagnostic: DS7PR12MB5742:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q5OmbxMUTbziXgSdat2QN75P1elLixSSo9sl3vaVysX7elQ5foYEm1EnqQ8rCpkZ5oIqKQ2vIRNAxIfqcmqu3Z3E0zzHTW+e6enkyP6NQYYCRrl4OVXslQHO5om2BleTPhf9P494rOP6lXfwy032gzwJHbmE7IjX3uP/9OsU/MiyUgNR/yShPllPGJN8arUhFjHwvfSQheU+TySEeozgr7AaRWld8TQZKfh8InHoM7dMfe9N1FlfeSAcPN+0fDkFTt79gUh0ldjJ0LXT8POPUaKu7q+4+C6KTVrYhl2RMTpIuO+Eki0kwVX57kh0/Cj2dSAR7CQt9N8i0sbJ/mMabbbIspk6SJHcZdplGxPSxjEOsgz4SwD6hE8blf5tpJ4VU3jOtfbq56MKlPoddkmeMn2lQwbl1DRDfBu9wD1r73fLXTRyo2Bzsk/IoqwM937vXplIvVkYFRz1FxWN+uzs64Q6lY+6ElcUZVzyXQJPxU9yrC8HSHw+sQMH10JDprIAygOoHMYPgYDLPbhHQiybaVW3uHAWfa28x31RBEa4xnZX4KB8nWuoTqxW5wmcl9Qi/O7EAjWPuq8AIO68aXBEMTH3w2dAeKY9xL7Hu3gFxwkuBRWVhyCgw4Gnjbx8Ih8XcGCTJ/v39ub0IFwn9djxIMEK7XMufKU2Xfh289ejuKRsyZgFNC+EA6iokq5FNBkSDyV/Pp3xVw5QOYQtJQEFcqkaPaFM546GcVfNeaTGhOQnkyTEmJpV7OJ5mgZ7g3csmArK+RYj6SPw9OwbiSgrFxksCfapiC7PG191scxeyLfrxXAWZq7r6DdSrX2W8HJM36YlyrDZ94qQs6vWp4skiRQm0DgAKwWLVLiF29r47D8If9/YKvI223KAEgsiIK3p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(366004)(376002)(39860400002)(136003)(52536014)(316002)(5660300002)(55016003)(2906002)(4326008)(33656002)(8936002)(86362001)(64756008)(54906003)(110136005)(76116006)(6636002)(8676002)(7696005)(9686003)(6506007)(38070700005)(122000001)(41300700001)(71200400001)(966005)(91956017)(478600001)(186003)(66446008)(26005)(38100700002)(66556008)(66946007)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ammuFN8/+DNmoS9yFRUk8kqD7p9h8UdDU+ivYQDHDj+VGTet+ZADa2njp+?=
 =?iso-8859-1?Q?V146GEUNqXK1bjYqwE/2rO21/e0IbKS4+0mYxYHyL0zKcmL+f6UOKCkPlW?=
 =?iso-8859-1?Q?qaA3Qekt/mv+Yx2OSSlx6obvT80dCjglr+kk4l5KffK6uRE6emTpPrnJwi?=
 =?iso-8859-1?Q?xKkzFK6lVa5WsCAazXin8u3MAKrWwR1uCD2zoPzez9By6hLRvrxZ193Mpm?=
 =?iso-8859-1?Q?I3hEsaf+ET3sy7p9D+r93T+J6NCmT1OsVevNQ43oHxTQ16W3pvAfC2tRAr?=
 =?iso-8859-1?Q?IMSHylb54gHjtw2nr8gzR5sHYlzjQPW+EKU0Bs/sb2Ad0mfClbvO1UAFb8?=
 =?iso-8859-1?Q?OLxCa20erD94voYo77ns8fKrSg9VHWsJcoFobjEzK4jlQjgctoh1Vh7n/i?=
 =?iso-8859-1?Q?OZXzwAOK3uovULVuKRy80ZYeiWsNFRkNV6L0EEw9jgfX7/e0WBfWqfQrE0?=
 =?iso-8859-1?Q?Lxge0jiW5p1jVWeRm/xtu1oISV5unv5uhgxdn1tY4S3gqkk17+w9sUgYON?=
 =?iso-8859-1?Q?/XbhANJJOk7EtbQtA9XsTW/mOyNB0jw6sJxzZqPr8zogouMb0ZhlgijQFA?=
 =?iso-8859-1?Q?2Jyx1CvJZM7hSSMOUOHUOZZwKcDS8GGL8uYM9s53RKuoQ4LyuhUPBzMixa?=
 =?iso-8859-1?Q?EWReaHlcLAoWTpqCxQdvnz1xk1jJOUNHCGq1fsWC7bosvQlZo1pG/zxuSi?=
 =?iso-8859-1?Q?Osg4Zr6wAd9C0OlFvrIEe8H6voa7LnyVkJF89vji+MDNxPo6elJUMjqS1D?=
 =?iso-8859-1?Q?VoGdlXQDb8Ckmvs2dOEeXwmxoy1/MoL2FJfvlxEciVdQ39gw0TobacwbCD?=
 =?iso-8859-1?Q?Oi24sH01brsVscb+9Vm9uJI2xQ5CiO/hBWhAhH0QWDkkI5ygLFGYtzehfB?=
 =?iso-8859-1?Q?WaK3TZu3LZthWFmjxM+rp6cFTRzIqWbP5loD4Q74+AhWVzcNIDl9sPieQG?=
 =?iso-8859-1?Q?034ZayoX1d7UkZoerlkQpW9NtKvhMgm78IlCk5heGYbC5kODhvmddbKpVK?=
 =?iso-8859-1?Q?G3jT6I8QjjvqMrtXUur38Txnfs94MrB2kJFURx7jASjmRoTf0fly7udafq?=
 =?iso-8859-1?Q?5WZX3ukzdPI3TNo+1+8i80dmy+XgcYIrE6YDZuBxLpcrt2M4hkDGoqQ7AH?=
 =?iso-8859-1?Q?0cN+4AnQ/q49UvXucN1MNkA9aT/MVzp/EfI0IUK7nr0kdZhzUJlMFiiNt2?=
 =?iso-8859-1?Q?0rEa7cXu2UUr820WGbpXPtZYIIUDDShjvsmHSuU2sIjUPDyD8/W62Hg3Xg?=
 =?iso-8859-1?Q?ArCl6gl1az3BCrubNH1Cp3nJJ6n2kxRmNCkQHWRGw995VVCOtFR8ERPOF2?=
 =?iso-8859-1?Q?cvyMfntT2HdOK5ZlhkvYtPDUsMGQHQwF8xHx0WRfKG9edVR0Bk8qoR16RY?=
 =?iso-8859-1?Q?hUTjm4yHJI/VSlj3YWx+1gK2H+DT1sMf5l0WdjgmURrRCuMBaivw6QhsKg?=
 =?iso-8859-1?Q?k6CjyMAV9njAKrreGWm8C8cT+qQQw+FOlaQH7zkQhvAcYSNhPlPU7wad82?=
 =?iso-8859-1?Q?2ZNmol42xGPajGj3HM0Ftx1eCkbIwx8MSlHp0DNoagUcUO7ixsdS2AQvi8?=
 =?iso-8859-1?Q?qUjfR2akd0efPMjhpPZwj3J+pXf3/wR6lnDA0XVYjnOF1Wvog/sZLEQgBE?=
 =?iso-8859-1?Q?solmYjiWL2XxGQFUe1efv8LEYlkR5BaxX7?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58190ee9-e30b-4a11-5820-08da69b35a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 18:20:25.6083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1iv4c1eInPEJUhuFnSJFVeqIi1L0DtSWO044HQ7BbrVtfDSSSrNMoFzU1y4LwKKki+gmFqkmeCe8APEV92e30A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742
X-Proofpoint-GUID: 6VekjGrm2Tv82Ij1dQv02XLVh7osxIn6
X-Proofpoint-ORIG-GUID: 6VekjGrm2Tv82Ij1dQv02XLVh7osxIn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_06,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207190078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=WRm+3NW2zJ+8WHCvAqCFdyp6RwnNiltxWDXZ2vODBpo=;
 b=PtRcmAs9M7EuDoMdBZveqeZ3HZJDcW1SKk9XPjhxj4ZNMsGHP2IOjY6UOSJldUyJQFTQ
 dIhUc2gQokjH4M2IaWD69F89LYg4Bjsm3toGLAe415Qjn5rCY5d2TWV6XPQsc5v9k6Zn
 2Yk9bv957+inbijFkUvWDYtVaQ5AWhnyDi0frGsYebz1wnDEftAccamCu/EdmhFyjvb1
 FVo/HC326MBGcqvfHwlNGpbcHaz7v7Y9Vv5DkZvKTBoplbXByDGVFYlnzO0BBhU5Z5rr
 7BvhAn0MUZUtedf8d87Bb3DCK2nhTFvL6DW7bP3sAcP8R8+Uru6Kmqp4bvDa/zBEtdD7 Ag== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1658254831; bh=lqNBsB1pbw1He1Kn2QxgVbJ6XHf0RtXkOPMJRgTcACg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=I9PVbwFVzzvTpNl4nJwX1fKEwyE7eid2EzHZV8FuDEQMEv7C69MruPPohm4TSs90k
 yBgZcLMMWm8R1t5aZIZ8lHB2keOyAzFZd9otR7/WrE3eJDSb+GKcXS5PVedWf+aQip
 Bea2X7mZj1kADdov2Xy4r0K+FdG+VqNXHr1IGFXFNAwFa3qf3kbIZrsW/I3Zj8I1T3
 bWClSJeg9c9DWPOXWiLg77ZVFLiXQtQLR61PziKafnF3lJ/iHMfz5TcXefHeYFqNRF
 vZjgHie4ck7ULAtj+vZBbMYXJ3e9fG3cb8MG2EmQzqox22LZLuwDwalqk4kCUHDr3N
 OIvzf7Bnlx2nQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRm+3NW2zJ+8WHCvAqCFdyp6RwnNiltxWDXZ2vODBpo=;
 b=wN1+mw4WbLbZzZK3sG+6i5kgVLrCTUDiHwRBoLsckjvyT1rXtABPoSe9Abc2vGiTYPaB7cQqPCBcd0nOvJ4mCkqGKYasap4P7Ngb7wQ+Q7AOXQftwy0eCRHEyodc42QcxpHADmjVZhoNUgLbKxvlNhsXUoBYEwtE/tvPTxUFXqU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=PtRcmAs9; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=I9PVbwFV; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=wN1+mw4W
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=abrodkin@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wN1+mw4W";
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Claudiu,
 
> On Sun, 17 Jul 2022 21:13:08 +0000
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> 
> > Please let me take a look at this one.
> > 
> > The point is we do use 4 KiB page for building for the ARCv3 processors,
> > see https://urldefense.com/v3/__https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/blob/arc64/arch/Config.in.arc*L133__;Iw!!A4F2R9G_pg!cxR1QodBjZ2_XZsfTSe3ThcFYm_X7BN7ERYq6smx9IqcZZUrUzXD2gEF1R_oFrKNb0SrguAeGg-kt6hFvkHhbcQpTs3QXHvksOs$ .
> > And so far I haven't seen any problems with either uClibc or glibc.
> > 
> > And since I don't immediately see any changes in Binutils for ARCv3 which touch
> > "common-page-size", I'd like to figure out what goes wrong here.
> > 
> > I'll get back to you soon with some explanation of what we see here.
> 
> Thanks for your feedback. Will definitely wait to hear from you before
> merging this patch.

So that seems to be a good catch indeed.

1. In older GNU LD such a check doesn't exist and so LD never craps out.
   And here I mean the latest ARC Binutils ("arc-2020.09-release"), which are based
   on upstream v2.35. Thus if building with 4KiB pages but ARC Binutils,
   the problem is not seen. I'm sure even built that way binaries work perfectly
   fine as I do remember trying it not that long ago myself.
   
   BTW that pre-defined "common-page-size" comes from GCC actually, see
   https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/arc/linux.h;h=0f1ff055be757ad1483910fc4918e7fef7fe4d5e;hb=1ea978e3066ac565a1ec28a96a4d61eaf38e2726#l48
   
2. And in case of building for ARCv3 processors we don't mess with "page-size"
   stuff in the "LINK_SPEC", see https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/blob/arc64/gcc/config/arc64/linux32.h#L26

That said I'd like to get our GCC & Binutils maintainer input on what needs
to be done with these "page-size" options in the "LINK_SPEC".

Maybe with use of up-to-date Binutils those default values are no longer needed?
Or we may keep default "max" value and then not explicitly set outside "common"
value will be adjusted as needed automatically.

See https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldelf.c;h=bfa0d54753ad8a7de02b4bae999119588ef982c6;hb=refs/heads/master#l90

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
