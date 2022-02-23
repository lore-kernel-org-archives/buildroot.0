Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 12:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6B060F66;
	Wed, 23 Feb 2022 12:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaaI8ODXmHRH; Wed, 23 Feb 2022 12:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776E960F62;
	Wed, 23 Feb 2022 12:55:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F21D31BF83C
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 12:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDD240112
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 12:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IoCwWGD-KKy for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 12:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1ECD400CD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV0NGnvenivTbBzK0ythP3wyQxYVM+x7JFZGYAIRTk0CxgfrXE0ony1LCH4FM9s8Zn9OWEqGxw0O1eKeBtu8BNmGyPvrbWRRADpmvBMWklugoNY4b/VBwkXTq5qe3FacrfSjonzscCVNiEFH2Ezgc5Gs6wYqfLsD3o1rzxrDz9kRkwqevf0M77JNwxrwy7Ok/zcTutAGDZwc+B+iy9nzpOS7IwWfHYz/bewf4w4lUMBVTyEbp9QPOwVykMCNjfwvXhI6rmB93SYkUiLmXWqYEyOWwm5IGuITmnRJVcv32HcjZvZ7CkMFJO3BzkdHxjJ9apgQSPsa15mIwWZ1jKmLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voF2SyIWI4B3orR5SuLNslXbBBbtNpHJPaVM5yRHW4Q=;
 b=DHGbzGbHI/PlmHBlNC1lHpI8y4EJ8s5NRxQtdaOezY3ZBPwBreDwSvBtXfLeH/GCnkY0xTRCUgsQdUhleo7S26Te3NIhGxxt5EKcgBJIRtevkT5nNyQAF/0cSsRsJap/5m72zsOAdCJvOPoxYXyzaxLlvOrxQlUsJSCEGTsiZXIhpo2YNM61WH1kEo/stwHOp0N99lplWoGl/94L4MVFi9I0buLSYg+EnhSsfpxACfUYbdXAU0ShRTKWHYbJ3OEwHg4gH40xF+8G1Pru55nlEO5C0ZuN2TE/gR/vSZwpGGO07Gj3ymn9+tnx+7gYjwQwN99VeFtAWnDvcud9cApdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voF2SyIWI4B3orR5SuLNslXbBBbtNpHJPaVM5yRHW4Q=;
 b=fxEK8fcu0M3FNU0mSDY+nItO4j4UDARgczvqfhdUP7w2D5jza9PJJU4oti7eB1YLUTEH/qhJpq/U7gurBK5jsQu4i9b5OaM4mHMT7mqMNurDe9pN1wcd/XJpgjSVOPO0UTTIy5IjTaBL/5gXhcWF1bXO1X86xCUQNdvgLpL8BlU=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SN6PR02MB4445.namprd02.prod.outlook.com (2603:10b6:805:aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 12:55:45 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 12:55:25 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>, Luca Ceresoli
 <luca@lucaceresoli.net>
Thread-Topic: [PATCH v6 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYH1Xayzc2KIF7FkeZID31n2sKs6yP5foAgAAI+jqAEQwhU4AALzzA
Date: Wed, 23 Feb 2022 12:55:25 +0000
Message-ID: <SJ0PR02MB7758B6311A9CFB84F6A245F0D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <69189572-6eba-ed26-52dd-08a8b098f124@lucaceresoli.net>
 <87bkzcnqpx.fsf@dell.be.48ers.dk> <87o82x6gps.fsf@dell.be.48ers.dk>
In-Reply-To: <87o82x6gps.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9bc65a3-9faf-4d35-3892-08d9f6cbc2fb
x-ms-traffictypediagnostic: SN6PR02MB4445:EE_
x-microsoft-antispam-prvs: <SN6PR02MB44459F0D2A090500CE165DB4D73C9@SN6PR02MB4445.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V6HuurPFROannglVuKNFpH8MW5Qmm0mOqMAWbMo7X3nx2stBqTs2szJRXdzayGoCbObtGEzReRI0fuA6sclTfB5k1I6CT0j7+ek4kv75t1VlV+2fXJ+3mTg1i5Pn8aMCCdQti44IHrXa3wLzX4JkqhhPzHsRgqfZB3LculstmvhhA2OPSZY60SvfTqbH+ye9En0Xo20OJIYvpbUK3/0AKSSXWeR/+WMP8OlxyfCWdb8OyGPxfCZE/uvRL6xKx7eYLRovPgrtN9ItKGC730rauFeIO1gsRtnToVcZPPiUjIemiodUz1OA+Gv8pEmCfdajXweuFe/l4RDHb6GpGoN/25eoh0Wz2sRCXtLAaGa1tLNyeNYmXsvCpOa+Io6edtpSfCjcqDr70O8eEAVXTszio5mvH1Z6Dc1JvJm2YJtcDCuq18lvEa9BZT51IiWKbA3PpnzguJ+dl9wkXqpfsMrRW+l5WUlTeF5rxRclXtAHJW1woEM2bvRQLl6+Lk2AaPXCh4qtu5kEfbpOL/7JgqEG3lhMXoyFOAQnD/JFAH1XudrlMGfIqHVtA2rw0fzPE/n1GsJoLrAh2/qYHCXAAQMhpZXsFuDPTpypDfRTYsL+OEIJjp2t6xocoAXs1Z1gYbxO7fD/nqs33MMvlwHktAc86UjDPwnr2tlgoz3cNhBMqklgXVOmrdlFRrYpx/HPQf4M8bt+C3N1slh015pZ0vlRfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(558084003)(38070700005)(33656002)(2906002)(55016003)(122000001)(7696005)(76116006)(38100700002)(66946007)(66556008)(316002)(110136005)(54906003)(66446008)(66476007)(8676002)(64756008)(86362001)(186003)(26005)(4326008)(52536014)(5660300002)(508600001)(71200400001)(8936002)(9686003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s0voYmSXn1q51uA/jx+pyt9HK5DXNE4VCZxQVIYNAbFw/rjQ1h3Z0TSmLSHD?=
 =?us-ascii?Q?YQSFzmOMeBBupvlKhqaZnwYmCUib83nQX7G9qNmVEjPUGGXGAzddr/u3rEcV?=
 =?us-ascii?Q?qocbLRGo+nbD1U+jqV7nPEvt6WwY787d+MJ0AIQAquwmQtEn3rSNR0NOWKRG?=
 =?us-ascii?Q?P7zQcAC+T/nfftD9Dlx+2u2hQ2WbeQxofel37/eFaiYjRnuAhuTeNfH4pHrv?=
 =?us-ascii?Q?dC86Ho4BuMRIuOaNpF8UBdd76vG+/KmYF0eIGimoeEHu5px4CrCipMgqiWdI?=
 =?us-ascii?Q?5d65rUPuiZs9boHLTBsTcvKNqxWoULw7OOd1/SIY4JxQaC2JFksVE7alODfh?=
 =?us-ascii?Q?1oXeFbF0uPR/Tka+Snd4czEap3wkUttD1nsglxK4YtoJS0BqlhvtJN0u/d3S?=
 =?us-ascii?Q?fX/zZPMmIg52GPfNs++ZY7REmbyf1zBwg68/k9YOAGWC8sQv3pTH6jcnkYQu?=
 =?us-ascii?Q?u908D3dCT4BY9KYwrfpo0ylF5+EcM0HKUdFPVsJK5tfMaoQWkDO8L/95T+Kq?=
 =?us-ascii?Q?sJYa/kisg9CY/mM+L7dlik4OX/CaqgcPoFxZUoCOKjLR/EseOPepjX7YE3Lk?=
 =?us-ascii?Q?eXRn+EzZtljJ53SWMUEG35acm+5yTsLcoxvxlUeVi6Pj2aMt+7UabpxSuVYS?=
 =?us-ascii?Q?hoYXDejBaO0Dxixr18ie87l3PDxgYcjQRFPQzsYo9p0tBi9xL3nj4rCszn7K?=
 =?us-ascii?Q?fshOefQCkkqlcgImBL2mouWCT7TezcKi+UBiVp94pDnLMVzaI/Mjt+pUovKH?=
 =?us-ascii?Q?ObGrgy8H6qulEfQy+ajRYu0i5druKJZN8gey6LhhWNN+5uFLQRgNcHlymUQZ?=
 =?us-ascii?Q?S9rUsQFjyz7a+oLzbhAYfUUaEwq7y7rssi7Detel8IiBwDdsXcw0oazF+RBf?=
 =?us-ascii?Q?GlYuF+K3UhqLqiV+U12K2zPUeqJ7y7yy0s3wVNOy8TogxEfb7m1/JSRJN3AV?=
 =?us-ascii?Q?rzdxo4RgkNp8mEmikU0h1EKLw4n8zHZbPzXgtLg3U1Wup2puq7tiUqog99+4?=
 =?us-ascii?Q?zKPG268T8ZAG/xPLV+wUIfHKQ6+Lhc9+h8sUlHW8j+uw2KEZH+H/KNdp8SoT?=
 =?us-ascii?Q?5HmMgRJ+WkDMT5zkjBqQ2SgYtP2XICwlpwcKM9h953zqo62pEa73evcq6/95?=
 =?us-ascii?Q?llFREOOs856a9r7zkCtxWyi+Flfuk2Se6nmv0VFJ8OYryFYKfpcsiOUnJ1Qa?=
 =?us-ascii?Q?wx7ugeg+WVJOfyjy4EWnxnx1j3KinjzWJeK3eNeSb8pPHzht8TXEg/iDqybn?=
 =?us-ascii?Q?BH1VLJW3hFFFSYzr3RZlBJ1kIlfpMTAcpkdahCo2tib82gpBHCUD3/sAcfCY?=
 =?us-ascii?Q?L11fn6hq03mKFWiAI1CPs8JvngT2q3g40qpZ/QWLr356syPSzcSsHEgn4s9A?=
 =?us-ascii?Q?m+ycbWoDj/lIE4BuZkwaoZ2VAMER4BT7K0E4jlgnBppOSBoVcS8wZNdWFo9q?=
 =?us-ascii?Q?4FvxLrSBr/wZ2HceSoJZk3616gNb97lxYCEgRvsi0ChC0m87N1Lxkgdknfac?=
 =?us-ascii?Q?sPZSQH9PuqZfAgn1P0Ws54X7eW4BYfIjOJJXqg+PqTtEKmTqkNLr0NEk7kr7?=
 =?us-ascii?Q?8AxkOon6DcX3OtzOw9gXuX1BTLxGYVwwrygw/skNcL+oGZb8wJORVuXmJSQ8?=
 =?us-ascii?Q?vg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bc65a3-9faf-4d35-3892-08d9f6cbc2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 12:55:25.9048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64HdhMR1+jTHURzKi7Tp/F/8BVmcipt1t9WybwRW+iT2GtyuRfdL5tUc0wZNsNdOkozurZJq9ITC0Rx3vq2syg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4445
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Neal, will you send a followup patch for this?

A follow up patch has been submitted.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
