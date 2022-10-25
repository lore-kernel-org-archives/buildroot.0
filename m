Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8559C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 09:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7327C60B2E;
	Tue, 25 Oct 2022 09:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7327C60B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0znZxfz085l; Tue, 25 Oct 2022 09:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A931960B1D;
	Tue, 25 Oct 2022 09:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A931960B1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1A31BF279
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 09:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28D5E60B1D
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 09:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D5E60B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpiD2h2sLQWV for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 09:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B5F605C9
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2B5F605C9
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 09:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVaF+co83A6biSffUy40/VcvkEo4uC3S0Uox40P1z3OgO8rqs/g2u41dY52G7iLcxGdw7pHz/KoTb85LaH6t2FJnuXHXzUxEIBzQZqq73muvuyJP82vbUg2lpfzellzM2waUrsAhwhMwJlAIA+tLJbzGmIucClF6Yxd0p/eNXBELnIS9AywvHcnAIT/Z8mB7eT+RDRQSAID/tejtyJ5A54C5jYQCVRUL/pJkDwWEH62JBuOfuDvHa/AeQ+CIrO6fe4pGqcVQMN70G0vZJJgY4ZkOawuGAidY3wHnNymQLNeq6GiaEy678y52Kpi33LwCitwgnK8nNcr+CnfEWaNLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfS4P59bSNEJzcWxiteJz/8S9+jbyyqc6qQhrf3QIpI=;
 b=dybDZGSXaq7kCAAEsi9Tc29A772zPwlGQTqq+sAXiXShMzJhUoX864jOxLKzgpZP8B+Z3t0rSqby8Vf5G8yHgVh4JtWUB25EqId/NxPs1/Zi20jD6lFHS2dzc2aWPIm7G5SltUlep5xmeotwgwamUU1siAs159ckPfhfEPMAyoI+ESGaLSJwOiRHqoVIgr7e/sTz4/rDQC3kcosZQpR363BJ9RVDrwa6iYkZd1LhuhnvoFqNpO0RUsZifoBkOg5q/JVrmbcyFN6BE2bdx7/Htwp5kEJK26aYDbwuVDKJgmmhB0z2SgT1NqiYj9gWNO277Fc9RkZufDgdOBlzodoXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 09:50:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::70d6:36f4:f253:d082]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::70d6:36f4:f253:d082%6]) with mapi id 15.20.5746.027; Tue, 25 Oct 2022
 09:50:16 +0000
To: Peter Korsgaard <peter@korsgaard.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/booten: Fix build on machines with modern flex /
 host-flex
Thread-Index: AQHY6FV88tmAkIilhU6c9qvlGiZOPa4e3Vzw
Date: Tue, 25 Oct 2022 09:50:16 +0000
Message-ID: <CH2PR12MB5004CC1F92833A26F0486B46F0319@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221025093752.3520434-1-peter@korsgaard.com>
In-Reply-To: <20221025093752.3520434-1-peter@korsgaard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6266:EE_
x-ms-office365-filtering-correlation-id: d6ef9daf-1ada-4bde-04d5-08dab66e520f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xoScDGhvNtjeIxeZMLupLRbBq52ek8PiASIYqIx7H2U7oym/nxgtt6ZYxgfOOmwkE1ipq7RwCSwSrP63LQQ4SoEBhe4z1PxrZSW//x1vP7/lYxJQ+FUMlHmHgnfeUBG+rjlBawvL6iWRmf2RJqkKdqDCbQVwaWEdsJTnzCzMQctpXZXDC56opYBRUan1m3lQRzO/iVZlvGotGKWxEuBhr1P8E9XKsqmC1fH5Gp51CVRCNV/MahbL9KVvNmgwLLb92Fo7GI8HVMISaT8yEFMbuzNa9Qin/RHyS2T+bOnfLDefPX2IBsbxV2njLBy4s+gkr8Whrk2RK/WR4QD5lun5JKtNhcX1gGOSSJhUrydNcPELXNJhbcVc/InyRTTm2NAX9vPg8QOwXNGj771zH00jMkbVg8JOeU337DSR+b4jrjdSrdxAnbc+2SNu4ariJm2H0cyvre5qv7fKLMrk2p0LFx6AJYv6MeVXCjaPZPBAL1dj/rsHAFdHYAXO7Wq+by/H8RzmiVBn0A0g3TJIZ5ie6DKmZH6vMlFNAUqvA/PM8GxNeldxE+kbCrFlrdU/+Ti9B620b2OtZEAz2vTESajpUAp4xmjlaLqw+Q25GPtjbm1beJgzJwdZ2AsWOwzFOa3I2FQCIvT+V6tv2yI6BhOxpGENnXoa+D1d2AWF+Xf92355wWjwUHStT4TmATizqd2u7nTOVeVZlF5/sh68LZyX2a2Ig3Gtq24uwzK+626odUbvoHFbQVuY+Msh6Bq9wc3gl5ytiZ4hNt28aI0buDKp0KA0oO8rPb5PhW40COh1Kc0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(478600001)(966005)(7696005)(9686003)(71200400001)(6506007)(8676002)(38070700005)(76116006)(38100700002)(52536014)(66446008)(64756008)(5660300002)(66556008)(66476007)(66946007)(41300700001)(8936002)(122000001)(186003)(33656002)(4744005)(86362001)(316002)(110136005)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m2xSHjH9FMabFdDEi3kKGVKsDrPrIYm80n/potUQ4/MbjRuGx93Ldeikznbx?=
 =?us-ascii?Q?EaeorErZjdzZQK8ht6jhL6JT4ay/NGY4EMshiLIV3Xh7xAdUe2paQvTbk5Gk?=
 =?us-ascii?Q?N9NoEL4owIz6the8KZNp3B/d3u/rK3UmHU1sBRgdBxd3MAZnESSkJBxf1KYF?=
 =?us-ascii?Q?Ch/bQxaAmHyZSmdE4DkR9afG94XYbMs2scG9hmhV7nhwcHDWfAHv6+nFbOlc?=
 =?us-ascii?Q?3x0EWwKlAuZEw40gr835ECApDnqPPnSVjnX1plb96whVorYW1OSQI9ODZD8H?=
 =?us-ascii?Q?tgRE0xexgGQtpdcb+71gWKvDmHdjQTIGTK82FqLoMPdCR74Vq2BCzPEklwQ8?=
 =?us-ascii?Q?Go9WXyxp2QBlURCLx4fOq+8pe9ArWPScSgUCLt6HCJhzQQZKlHmjaxwruUJU?=
 =?us-ascii?Q?J4oluqF/MDvAXZ6Ptz7XIgZk8oQrulH/M1Nege9kVpCDuxBRJanNF4r0Qeua?=
 =?us-ascii?Q?ixSkzb+aBX2TceilrUWiI8RpffXH17E95unKXOlPh6fj/B70BC9raBLjcyfW?=
 =?us-ascii?Q?Yc6/71vxZg8E0bxLcmrF1WoFm6ny1OM16ldrrceSHB+x0JGAB8d7SXm7S5Ni?=
 =?us-ascii?Q?Lgyqs0IewAdiRt7FEmw6t4eQ0EZ1m8rsb4CFNd4JwW9aRQCcz34FWTcgyIvK?=
 =?us-ascii?Q?rIpZEJbjU9zIcekchlmSVf3JP6ulroW17pSPRBpi95rwiYofMqpavKBIJ1HG?=
 =?us-ascii?Q?qoEtnyc8OSh2fj2cQPDE9xetMooxYaNGcyIHfMTMN8uq9i4Dm6B5zgpZoeHq?=
 =?us-ascii?Q?N0Qie0cNxKoT2tQdz2LrayyifuibKR787EYR/umtNXY6XmrnVoMQ+M8TnZF9?=
 =?us-ascii?Q?Evk71bvXvh0GUsvncn1g6+nUK0GbeolC4n5BfN7Bd6c9Gkaei4zArZlyUg4U?=
 =?us-ascii?Q?iHa+msJCaPS0GVF+TzxCIwX/D4gVHI2TNENtqouuXIbb1kDYgvFINOAMZnse?=
 =?us-ascii?Q?h/R2SssHON39Nx/20q8ncYIBdLWbh+0ABvAiSoKmyQ8n7XhuPlTZJQTsQG56?=
 =?us-ascii?Q?kIxbg3tqJAEeev/Jeks6QoB2MxZTLT8s/mJCfsbPD0zSsdN18nuhxtLGADph?=
 =?us-ascii?Q?RA1WxY8Y8yTDZjVwVJi024EpGhRbGd/RSjYlxa43ZXkztcUHjpWk6SGZkwkf?=
 =?us-ascii?Q?qboKifQLVUWz+ntpwJuYFkfmcax82DMI3GyWCkavz9uvwoKkWtuneSdK3Qy7?=
 =?us-ascii?Q?tbGJAwPKN6r0BGKgsGcpSd5B+ELD3sEC7zjMb2ONt/rL8UcWMx+wQpDGOZKa?=
 =?us-ascii?Q?5sFy08zgQj4MO2UoIpImxjB8d8BMRA6NYx2AbOeurUbnw4+JfGmQQPv8Z4tk?=
 =?us-ascii?Q?kiKtt90PFxVMsnbw0xWD/9fEsnmu3YE56yYua3w2uiDpQNXzvuTHoXIH5YRV?=
 =?us-ascii?Q?uIWw9jHyiqvHoDKIyGAtwKfc9MlDCe0tBOYLQiAn36TfLIiyb9fXLuUf+RSN?=
 =?us-ascii?Q?MBePIvxGAHzYk/CtdOQr6IYKCXUNv5k1CeYVdbQGMGpCmMOdm27hOcYj8vi1?=
 =?us-ascii?Q?85TvD/SGS+7ABnYU8r4hEDbua7RT4pK0KKtvkk+Jx07j8dd+bEK6kHn6osnI?=
 =?us-ascii?Q?hnHi4I8KXu/0BqG7lGp5kTq5M+GIsqBvuovdYzBTI4jPEJVDZ2otsArDuFYL?=
 =?us-ascii?Q?O3iSlUcZj/to7nUfnblbACY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ef9daf-1ada-4bde-04d5-08dab66e520f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 09:50:16.5407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EiEGsFyUfNMFSVeWm9DctbbktwH1BFHzkynzAOWjsgMJe9WQ6u0hq85zSackjcpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfS4P59bSNEJzcWxiteJz/8S9+jbyyqc6qQhrf3QIpI=;
 b=0JjbFicqcX7/HxBTDehbQFiWvBigBgawvWiMgwKPJk4ULrnWdFFkfye+gKHQNIKwkOvcs2/SE1s75yMAnDUw2f/eSD52Qy2gnDzeidmJN/f475AsqwODAqjAuYDHwO+xxjvuMXEV+zj4+lhVkVdg90RdS76CAB+cD0JKj52RPa0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0JjbFicq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] package/booten: Fix build on machines with
 modern flex / host-flex
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Fixes:
> http://autobuild.buildroot.org/results/3a8/3a8b66027cde3cdd9d02745381526d52bb626a78/

> Bootgen embeds an old version of flex, but uses the system include syntax (#include <>) to reference it, causing conflicts on systems with the development headers for a modern flex version installed, leading to build issues like:

> ../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
> ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})

> Fix it by using normal local #include statements by:

> sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

> Patch submitted upstream: https://github.com/Xilinx/bootgen/pull/20

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Neal Frager <neal.frager@amd.com>

Thank you Peter!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
