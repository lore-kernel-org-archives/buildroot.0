Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED21C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DB1861579;
	Thu,  4 Jan 2024 22:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DB1861579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFynKG_PtzRb; Thu,  4 Jan 2024 22:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8A116152A;
	Thu,  4 Jan 2024 22:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8A116152A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B90C51BF3E8
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CAEE6152A
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAEE6152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reTtAHKJ8Tf8 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 22:22:56 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01EC6614FE
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 22:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01EC6614FE
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 404MMFuV014990; Thu, 4 Jan 2024 14:22:53 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ve1ehh3qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 14:22:53 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52468401C4;
 Thu,  4 Jan 2024 22:22:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id B47A4A008A;
 Thu,  4 Jan 2024 22:22:50 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 003F540358;
 Thu,  4 Jan 2024 22:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrOUJcfaMyNrMuQ42CavAhArfPhyvCnw6pmbGU9b1b0fQYV8hYYS3KaACRNrqlvOEHMA0ec85bFmnpE8wXHREDoiVNTaGkarpytC4PU7p30PZokkuHVsopMbDGfUo+Q/LZRsLSG25EbZeueP69LXJoMbQRMoC9tfLWqrZ8q1LmsHUYBxoxMftQBHRHfsaYya7XmFC+tXC5Jzp4qa++VKsrg+ld6o48/R+aW/D3c3r1s0y5978qoQ2JnRhKZAw82w3RcEL4oyoQmk21HQ4UF6lCP7o66OvS8vbk1Lfo0xM5W4O/ypQjEBeP8tHi+XZ1TzG4ro/eyelMeE44oTL39PcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sol4VmNwaO9Ju+zbhlyB2CyBMpqti8zBPY05JOpieMY=;
 b=lQps592bSnk8WMR2RD4m/ULFaKchMEAm+ZrpQdqrwAyCAzvMUDZ0zexsa9Q7DTNceMau28pKSZoucZENEHsPspvKZ2I3lE1LIz8EV+P+SV3eSh/ZMG/iiREExrE8119g6CnntfCRHkZAVy6oiAEJUdNp1HFjN6P68od5mW38+UIbjI4JrZQ2zvnNTGtSiyO37D4t4i7a0YxB6+k7c1zx42PZy1XxC55BPEpjU3sCxFOkybwpX5A+7ksiSOxn3pF6O5gkY88GZWA/IQJHU2uBO3As1/RbAVXmA51AwbgMU3S7soStaFXzyAxecsQ1+t1dG18GXZx7GVuZIdopq4aVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 DM4PR12MB5038.namprd12.prod.outlook.com (2603:10b6:5:389::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.14; Thu, 4 Jan 2024 22:22:45 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 22:22:45 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
Thread-Index: AQHaPi7i7v+f2yOfEEGURB914RR6W7DKKxeAgAAEKQCAAAERgIAAC6Vl
Date: Thu, 4 Jan 2024 22:22:45 +0000
Message-ID: <DS7PR12MB9041AB129B87AC54AB7CC445A1672@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240103102311.4048759-1-abrodkin@synopsys.com>
 <20240104221941.044adcb5@windsurf>	<ZZckauC7K7-qR0lP@landeda>
 <20240104223823.1bb97896@windsurf>
In-Reply-To: <20240104223823.1bb97896@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|DM4PR12MB5038:EE_
x-ms-office365-filtering-correlation-id: 0eb1b626-e8bb-45e1-70a3-08dc0d73acff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YwRh8n8rvUCQvmRkS/IVqGtAosbJlX9asTWbRqPMpQ4LP0Ofm6TqNZVZ2z4JhNvVE3mMBBVf+pMgrNl9A11c/6Zp6rz2+V9fl9KWhVd9rrCwCT8l+8TSa7NvjT8G88D2PeYLd24Pe57uKMvDDcXPDfMEM7D1P7TFsoAAokKckfOduOxFFUKTNa+aKboOJh29LE7buy5Axk4y7YRv44qJ+Ybj4x5hMqXcJEBGNSJZ/0DRGXmAyE5lcERb8jzt0outddGemJxxQIh3fuEZwB2nT221pc1kcZ0l2r06yQk75w/WJ3eEuxSlUBPcCVuIqkcOtDqXGmdNGoJz9X8PS5vUMhZFm7RDu69eYXjfTyvm81j1bwYOm5lnDBLSktsEgH39VpFYkQ8U5DQ82va0jYBZM/v1LaB/F9seWe1SKXZzXPGrzAmfZdvGLgNn+7wtqDo2GNP9/jITl41/M5r/IdMYeJnVOuKI9KASvRDhk/hdJrM29Vkn9GdCv2gdtDgMv2MUEsfsoYWQF3v+R401DeWyddtyiOWnOI7APdY/yh2hZAGYW8lnIzsRB46prhQ/KWo4CkxRHqqIsuKqGC77evlReyi71XpVM/KGx2LRxIOpQI4T6lkejmTboriqJC/IPktde7Lc/cTvxXPkiGKOoTYoRAyxJyBtKKn2RqEnkmDj/Zk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(33656002)(38070700009)(55016003)(86362001)(26005)(122000001)(71200400001)(966005)(6506007)(478600001)(9686003)(8676002)(64756008)(66446008)(8936002)(54906003)(316002)(76116006)(66946007)(66556008)(110136005)(4326008)(52536014)(91956017)(66476007)(7696005)(38100700002)(41300700001)(107886003)(2906002)(5660300002)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?n2IkgzmXW48G6eiau5CJxqceAvapfWsr8fU1iS663PYzeT/yuawh7tZ7QF?=
 =?iso-8859-1?Q?Peg7YQ6sPQVBTAJEqGVh4XpB6jvHsGLK9dwDKQVZMCjRbh4kS4a5wFByy+?=
 =?iso-8859-1?Q?2VaSJEHqtH5BrO9/26VRr4Qev7sSKwjzuLyija6ji1T6FBNiPyfKellWnk?=
 =?iso-8859-1?Q?Jq/bHh9sdfJzSzoQTQgvxN4h+gYfr3J1DbZZVFkYdK1YZF06qe0eYEGVhQ?=
 =?iso-8859-1?Q?k4OuvYv46FqIYl/qA/+V0+VYO/XcB+WxzQFzgqFvxb/LEpgMUXwLrN5o0A?=
 =?iso-8859-1?Q?9M/XUUsjUj2Anx3k8aG+S0nieyU7zPPth6Z2iTQOxw+XYi1wS7ywQXRSa7?=
 =?iso-8859-1?Q?LikfvtcO9iJUzi2BZC0/hI6acSPlTe3gHQciRX0MCbe9zL2GWz4WowmLlm?=
 =?iso-8859-1?Q?sLo85FOgX3//bcSOCrly2bytyXnaYsz3hx071u1HBFRbuh8R2HlnRgYMMr?=
 =?iso-8859-1?Q?hm/04U5WBwMVfmPS4eNnqijVUk1+STFhCbRVcRptmRp+0SSewiifQjy4fa?=
 =?iso-8859-1?Q?Hkl8Ov8g68IrNA9dImFF7yeecyHNHTotu8oVBg3vVCnU99EbMYUikHS3RA?=
 =?iso-8859-1?Q?4HFWyBuOIp+5Wp8ob1sAo2CbwG/L1+3KgK6hydZ+BRwxBeoKqsPu42cg84?=
 =?iso-8859-1?Q?kDalqY1foY+uHFBxZg8tUOMUHgASGxvl1x+vqKU3hNh2iaUva9IkXUZNd2?=
 =?iso-8859-1?Q?9Dv0iedpxhlbmOd+VLUnqR43fc8Lg1r/ZcpANe91unRBl4sHJdGHDilH7C?=
 =?iso-8859-1?Q?u8F3b6yilZEzY8A/YJVnxq+bsDk2LID0JwEBoGWXEPtSatMG9wdbkmSGUY?=
 =?iso-8859-1?Q?e7yjpYigC/W4EV0fxvsFJyRqYzydBEbZjTqi2A+cGS93/QmViT2+UerSlq?=
 =?iso-8859-1?Q?zCqIhzMX3Hb279dNEjz1UaXc0r+SzEXLKbEgiSt4zO/P2chVJkcWWYXxos?=
 =?iso-8859-1?Q?R5OJ8e25w8iR5sJryPvN9wCahFybHvGntgqWhwBs0KA6nnJw+yehx3yTEl?=
 =?iso-8859-1?Q?+Ts8Gx/yxyzeY7/jPhuyWH12LBo5w10IFE7atgRlmYRfWw5/IKcE4eV1UI?=
 =?iso-8859-1?Q?ntHdf3R2vdgPZGoRsweWZfdqDV5Y/oAzrlygD2lJ8OqMmkq4JcmUE5aBgT?=
 =?iso-8859-1?Q?HMV+bpkNEM6/gGz69GlX63E3IzVvJZ2ZQIFm5DeD6Y8dU/jPSkk3RtGTKs?=
 =?iso-8859-1?Q?IRq6W2bVg/pgoLhZGzMeSuBGTBWX2fo0biDZAOxnC+DouvIzFn7lLfHqL+?=
 =?iso-8859-1?Q?BFE1KGA/mcdvjM54EF4+BKIRRt05o3fWPZhNCHxNH2gAImVPjqpw6tzDYb?=
 =?iso-8859-1?Q?O4lAOzMjS7QrWAub8137f56ESKIb0weMxccXX6HkHi5qXT0JZaPz4JvxBC?=
 =?iso-8859-1?Q?R9LJttS6c5yxRQk7UkEC4+ZwAFqwOnEJdrOiHFaVRsihwbdAhyktZ4otI0?=
 =?iso-8859-1?Q?n++d80K27RlC3/I3fRaZ5A2/gsYX/Gq/4HYuUaHJYAsNvmEGUHi8tWXRr+?=
 =?iso-8859-1?Q?qDJAnabdQy2/HzKFqy5YqeMCQur2Vl44FtAvTQe+rqTBmqZIvRZItGFXcd?=
 =?iso-8859-1?Q?dZutWHN1l3GpbyLBSOwVR6Ehw4/K6S7cPt5nh2TGCKxwR29YndMV3gJG7v?=
 =?iso-8859-1?Q?k4t0IwXr6PpP4vVWKPA8O2IBpeSYcHrJWh?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nJfd1AiUxrrr7p5OMwSnDa/Gx0euMhcHQbI2LVTdT5+rsYf7UqBhfW0q/O+ZVknRxoooqACO4gn3Hykw1gzZ+g66LruX+p4PXLlth/aShQQ5aw+3lVsyF5G+VCSLUAQ944eJ3Ts9MFW9Qfbep5/DlPZQq3DR29r5TQeEu+ymxcKK3cdIx802ZS9V24KG0Wqa6MgkooBf8cpv/a6xhLTFvR271AHYihdr4Ry3TWo+IR3lIlqcXLg8+WD8/9vOYUTVB4PUWZrY/ZnJb9Lf+R9rdgXUuI1SQ5qJHtlrFEK5HblMWxBrQ+Vzf+jWmg9QoKk+422rOp4sojJw5uPwV9cDOjcT5lLueq5rxejzAaB9H9+YujIj6xGz5J5wnNRGloRvD79mfMBlQTfdSF0GUfo+7wPyA0YJZcwbteazdvXlMbygwWA8XLZ98Chx/T6IF7KlRMkmghSFAS5Ec6d7hzg+LdV2PVrMzR0xRAUxus3j35ozlBxyZxNcBwA+Y8B9DBAZWh8csxVp6b/eeZKydFK3o/HaGAAl8QjTGnN/mpj+JbyZ0tQsWuT/qjPJTvF+oJjv6DREF1EKnrCd4mJBNzqqF0jTh64TMTUro2zAQwwGB7BhPb4CHrVhzj2HtD+5dNcdxh8Al/zIoDs/fMElvuirTg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb1b626-e8bb-45e1-70a3-08dc0d73acff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 22:22:45.4046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/tSbQ0pAj4fHv9Y/SQlrD2BkK1slpsZviOl+XvFO89LkejyzfWlkjnh+Yxx+MzuNTPZX8IMbrnQEygn6cmFnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5038
X-Proofpoint-ORIG-GUID: Apo1uMIpGx9_x_YFV28BvIqujCLYwVmp
X-Proofpoint-GUID: Apo1uMIpGx9_x_YFV28BvIqujCLYwVmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 phishscore=0 mlxlogscore=906 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401040173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=sol4VmNwaO9Ju+zbhlyB2CyBMpqti8zBPY05JOpieMY=; b=
 m78plhikysVLylKwlOSoDb+iXVjDQzkiBUt6MV/MH1/z/dZwPg6yfYtXUKrsOF7W
 JsGxlXy7MUSeg3C7m9bATukMUKBpkkVwvJBzLFVJKQpJkN9zSDqIj0v6E3dOfLal
 hMQebqMCsf8IAUXzv66pLaSo4pT+L7Sa3wcBhL0YUQ1pg7cpaMPBcHgqrm2wGwRm
 LO6axt1o6VTChUEewFbDZYhH/myu5dKJpl00ZaqGuXcsKiP8p4QOYsFoI/GlA7mA
 sRYbXWdIOIITtR76gUjc4VINZxtMZ9sHttnrcIpQFbFLSNJ5S6JVj3TV/UJxvPSa
 2ES7UjVJbLJFV/A8MFLg2Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704406972; bh=JqL7Iy7bZSq9I/JEp5r3N7uCX1k0I6Q76Zes5aVkCpU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DehnykvK0PKsyvBPbuW/neUuiqFiCeVdsuC4S7ZvsAp0XeF3bY6WIccwg+nuvZgVr
 p9cFAOfLdGdtNQcbgFnsrFTpacA4LYe5xN396dOYv4eoRKAQMOLaIduAipsoGekIUq
 tsGohKczCgJTBQQsj64loGS4VSKKuye2m0EwO7M2zjddfOPeNS08djWN4tlmJpYtBi
 s5J25DqBLLM81S2SIkK2xToaDukzF3qJ+qHGDLf5lDvke+bJJP+F7haMXHZbHbWLFn
 pSXeWJtZkrFgtwrDmw0djs7GDxSx87d9ER53f4vrWPZRG5Lsc72iNoHOFl+4uf5/It
 MyZ4QY6HlAuHQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sol4VmNwaO9Ju+zbhlyB2CyBMpqti8zBPY05JOpieMY=;
 b=Hv2H2W2AgTT9Os9b6s4WmcZjJuIbmu6XWtalpm/iQTmWu8XbPrAIplIz55ltLnz8M3g5AM1/4XfJ+sXbt7Y2/48QPZAUqxjIftNBNZtJ6sEXpG0Xjf0+raSQX9f3Ms0IkLovYdJ/mOJi4if76KJZcvGd2VlVcitgrgyTIdj+HTo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=m78plhik; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=DehnykvK; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=Hv2H2W2A
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=Hv2H2W2A; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
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
Cc: Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 Vladimir Isaev <VVIsaev@gmail.com>,
 Alexey Brodkin via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> On Thu, 4 Jan 2024 22:34:34 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > > But I'm surprised they are not needed also in the C library build. Why
> > > are you not seeing the same problem with the C library build, it should
> > > also need the same page size flags, doesn't it? 
> >
> > It is my understanding that the toolchain wrapper is installed as a post
> > initial gcc hook as well:
> >
> >    package/gcc/gcc-initial/gcc-initial.mk:
> >    59 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
> >    60 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
> >    61 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
> >
> > So the C libraries are built using our wrapper.

Right.

> Hum, indeed. But then, why doesn't that apply to libgcc and libstdc++
> as well? It is because libgcc/libstdc++ are built with the second stage
> gcc, before it is installed and wrapped by our wrapper? I guess so
> because the first stage gcc isn't capable of building shared libraries,
> or something like that.

libgcc_s.so.1 gets built with:
-------------------->8---------------------
.../output/build/host-gcc-final-arc-2023.09-release/build/./gcc/xgcc ... -o libgcc_s.so.1
-------------------->8---------------------

while libstdc++.so gets built with:
-------------------->8---------------------
libtool: link:  .../buildroot/output/build/host-gcc-final-arc-2023.09-release/build/./gcc/xgcc ... -o .libs/libstdc++.so.6.0.32
-------------------->8---------------------

And that's the reason Buildroot toolchain wrapper doesn't affect them both.
Also from the snippets above you may see why they need separate env variables:
CFLAGS for libgcc and LDFLAGS for libstdc++.

BTW, that's the same problem I solved with adding "-matomic" flag on libgcc compilation via
https://git.buildroot.net/buildroot/commit/?id=d2ae7eb2a24c9033f8d8a9f81c5fe2ff2febdb5f

> So, indeed, my proposal to Alexey is to use ARCH_TOOLCHAIN_WRAPPER_OPTS
> in gcc.mk. This will allow to get rid of the special -matomic addition.

Do you mean something like that in gcc.mk?
----------------------->8---------------------
GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
GCC_COMMON_TARGET_LDFLAGS = $(TARGET_LDFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
----------------------->8---------------------

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
