Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83E2C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:05:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA4F61400
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA4F61400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=thorlabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4840582A17;
	Wed, 21 Jul 2021 21:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBmSD8Q2zqwT; Wed, 21 Jul 2021 21:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E92382A0E;
	Wed, 21 Jul 2021 21:05:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1391BF5A9
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9F0829FD
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWwi3GcLF2dU for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:04:51 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
Received: from esa2.thorlabs.iphmx.com (esa2.thorlabs.iphmx.com
 [68.232.148.215])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0429F829EE
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=thorlabs.com; i=@thorlabs.com; q=dns/txt; s=thorlabs;
 t=1626901491; x=1658437491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yeIsRbuqSk/jdHLT6rt+802xy+1y19RdjQfsWmeoeHQ=;
 b=GlRmTmAFcJ5IlNc3Is8u+czidioULQ5sHTsRBpUnJqVzreVdIdLaIy6f
 7uHOxXFjZTSXn3ucGTsil9DBuy9psOTHHKByrCQbPJmIArIFyoGphkOoz
 MkqU+0SprOQkpBkZRHvEIWMU3nNlEjgmFv+foDnfK8ZZsNREXOSGnpA6V k=;
IronPort-SDR: pQtJfu/rJlIBBFTT4iHUvxHoUda7l6B0x+fF/V/a4f1c9dO2+gNO4R8+SWI3USyAWnMjuZeWhJ
 2xSjp4yUFk1DDxSQB0ij9pBCQzDE9v5Z68r62o+mO3Ph6uhccbU8wMnYHt1OezDRNvdX5QN445
 Lfv7wcEPxUZu4yRn9qK2RshEZgL/gg9rJV+hrdMatCKubfyuMvPNIuRNwZXc6p0+hdI49FSmYO
 cFsHUTvejnLYoHfDcfQd7jD8b9v5LTZR4Y92BoH4CfSFrlLsUrtNqaS8WN8kVcScgzzS28vuNV
 BQN/elPAZ6zAyQPWtdcjENQJ
X-IronPort-AV: E=Sophos;i="5.84,258,1620705600"; d="scan'208";a="24896180"
Received: from unknown (HELO mail.thorlabs.com) ([69.172.143.206])
 by esa2.thorlabs.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Jul 2021 16:57:42 -0400
Received: from NWTMBX02.thorlabs.local (10.1.1.127) by NWTMBX02.thorlabs.local
 (10.1.1.127) with Microsoft SMTP Server (version=TLS1_1,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.2176.2; Wed, 21 Jul 2021
 16:57:41 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by NWTMBX02.thorlabs.local (10.1.1.127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2
 via Frontend Transport; Wed, 21 Jul 2021 16:57:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gkhcdff+8P8BGBCG4jktTa1r4V6fwoTj2gomggMmJiw9DQ4MB1nrMt6O9utYuq7q3r3cDjh9t8x1bNuxmXFRL7TGNUzA4f5uC8zeeSUw704FmFocFoaMbv9vETq5AtrIxbI8VDaa6UULRHA54vsav6mVgM90OHB6NtDnnr0v+z8O6GCcbuub8OMYWfh1NvYZu0zEqfhQ0/8JUTWymf0LdoXZdawDrD6dXmWyCR9Dd5wJGmkGtUTPuo6HoNqizk/dWg3IVu/LMP5Sc5P8DKZT7cgnuwzh1o5caqdcQoRa7lOWmTK/Wbf+npOU2yNsyIEDSZ0VboUVxGBrM1S6aEQYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ7KjN4wQVbNmxa4AfhBt+k2TkTbirUG5DiJCLy6EX8=;
 b=krqokPPrtWm92P/FOu6s0xbOk2DwYKgxRjE/xHxP5eYyiT87n34hac4DMeR56CoJT4lR5FKgMoSrAhqIIQNnYtqpskKBzdey8s0VPYz7TfOTu2YARRS6AiFvrc0uLHga1MGCrcmOuxrrUDGTQN5RPuCJ03S/P3FXkr+ueRFB0TLpHvhXovzioPTEpmpQRnY4+85aEBRcYAAaHl267kPbXHo4ytBqf3+fdNV7XQ31U0eBX3MEQJURS215WYRYTT5rd944Qv7huHj50LvY55s5J6FEp8AcGV0FyZaBHnIpvxa7C8fCt0NkueRqvwfF+SSK3k2/q/hVcmVpnHUCE+wHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thorlabs.com; dmarc=pass action=none header.from=thorlabs.com;
 dkim=pass header.d=thorlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thorlabsinc.onmicrosoft.com; s=selector1-thorlabsinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ7KjN4wQVbNmxa4AfhBt+k2TkTbirUG5DiJCLy6EX8=;
 b=FiXTvHKJ3L3I+Y3dR5IMM9LSSthPhkopw7zHBhufQl3OYVQ5T7F3TmZxhyEiFJZk6BtvBEuiDwozKdkJwjEvzPrGtQtovWhttTPZIz9edkLNT/v3pnYz66/V2xiM5IDY7493NN3x4iLfw/eUFe1k7U5HriHs6gbPScTC0LU6A23VxM/SK9S0sJoz+QPwpnv7A4SOfUQtbAe+bcWXFMiC5Ih6CVpmOSJtxVcLrPyY2r636iKdVT0VpNRQExZ3jtOmwpMymL78/xqFVwjbA4tx87AP2DVimzvxpZRRkJebDJWX0wZ4M4XQ489/eyrNYyPV1QT/bbc4ECvuKyYjyyZDIw==
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com (2603:10b6:a03:2af::13)
 by BYAPR08MB5958.namprd08.prod.outlook.com (2603:10b6:a03:11d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 20:57:39 +0000
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::1108:4d3:7420:23b]) by SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::1108:4d3:7420:23b%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 20:57:39 +0000
From: Scott Bartolett <SBartolett@thorlabs.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] Using Intel TBB in Buildroot environment
Thread-Index: Add5uPRj5DRmmJuFRP2lEzWNTaE8ZgB+mKgAAK/kZ6A=
Date: Wed, 21 Jul 2021 20:57:38 +0000
Message-ID: <SJ0PR08MB6542390009A6C16184B097C3B8E39@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542FA0233EE2F8E14C32938B8129@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210718110022.5f319b04@gmx.net>
In-Reply-To: <20210718110022.5f319b04@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=thorlabs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a1af1cd-de97-4b9e-7441-08d94c8a2d0d
x-ms-traffictypediagnostic: BYAPR08MB5958:
x-microsoft-antispam-prvs: <BYAPR08MB5958D6598FD0213D49471D57B8E39@BYAPR08MB5958.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mz9h3c2ostqJe7b7LMgiu6rUW9r+04+z8DkWmT1jUtQcLVS1DmEqLsGYUtThBZ/Ds3qeAieFiWjMDR5Kd9rElki835kBirrtme/HJufBCAAsIjkWXQPX1myHOgafD4YcfULtKM7u7s7D8LcSSWXzHDN6rBPnA8GK3vn/mgoZU0pcTo7dJgXg9PNjLp78ZeKs4nQ4FkY91AL3vd+gvSvfUcgyuN5ncF80WxA0RfCKi6xd9ayGLLqP2jD8RPt7e/psywm2IWoqDdp1plzjvo7lm0ZUzPLZDQSwdEix281LShuk0DqUD0VG2taQSHV+oCNF/8+NpDcUmvUMVWw/CveBterMLSr80Tz31rJVO2jSTd3GIM+zsT93DvdolcgtyvClaLN73Gq273ttj85oTEquxrLkW+FsuLVZ4DmpKkMvSwyiPsdB3LXOCEvgT4FwKXnXYZWHmSuy2tpwJuVcgmLj+imh64QDuRd4CphPzc5r4W4b6ITH1x3HyK4YRTYhTTJFMO+h/m8KIsi/HVnIqdxj/I6VWHqz6Cy5qEsK1wdrrjy8jGV8S6RTrnjTkkutkPcHxRWPhMGeH6VOqQQ1yexBJqmjm/59XOPKyad3P9rrFvqwxnokUHAmZvQwC9gESIh2AFcWzoZuGVK43CIC5FpitJFKgUHuOV4Q2N9CGZke8BxN8GodbEQt/aiD3zU3rlu8RF/QKh7+Uu/BQV7CEuRFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR08MB6542.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39850400004)(136003)(366004)(71200400001)(122000001)(66556008)(83380400001)(66476007)(478600001)(64756008)(2906002)(52536014)(55016002)(6916009)(66446008)(186003)(8936002)(26005)(66946007)(6506007)(316002)(86362001)(76116006)(53546011)(9686003)(33656002)(7696005)(4326008)(8676002)(38100700002)(5660300002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c10qjkMhpFXkDJKdXPSxLQo/qJ634MlN5vzmwRB9nA9Mp0ulPELXC5uV7mjV?=
 =?us-ascii?Q?ScbTFybOstYG1ncYrNk+M7C85vPcN0VNuAKfsN//PuHA4wnB+ItdOH0HexcQ?=
 =?us-ascii?Q?OjnytqVGiJcwulTlIG72HVGtoQ19ddQeDPlk03lRTMr0rke7nMHaTxLxPlIY?=
 =?us-ascii?Q?WDgnY8O3P1CkysQ6BVPVx5rG4ZSahFx8bEGFF9YRh7RuMHs5QP8bgoHGNxMt?=
 =?us-ascii?Q?dmkj1se61AtpJvyxQFkW2NEMqu3XQVAQRTGlvHYy1XyxoOEr5GtC/1+qFDuO?=
 =?us-ascii?Q?B6VUfIh3en7Nn3nf+PzohCR1XCIM+vSSmi4UdyNIXGXhKxZnR9u32VnpoCE7?=
 =?us-ascii?Q?M/lTByGROweQ8s7LLodxnLABIPVwWNVZ6aXa7PHQa4Ul9rCwxHS2PyVx8JqR?=
 =?us-ascii?Q?ATasSymRlabfvFDo3sOFlAI6VhiAxqv4bRVSNMt+p1dUi1o3B+I9eIZ4oob6?=
 =?us-ascii?Q?V2KKt+5uEY6xgyOovFHFuYaL0z2jjanyjVCBZjaEB7kon5X3N5TGMNgmrZur?=
 =?us-ascii?Q?aobYiaKQ7Nk7JNTN/dj00LWQt5NfnvSVXyNLydpgvB/7hY9f1NiULQ2Nkgl2?=
 =?us-ascii?Q?xLOy3nPXuTIGYEXmO2yzfbQp7eg6zi11xWcA2ZwzGcUbneYmIDD06dRHGCWi?=
 =?us-ascii?Q?t60VeoX48VytVAu2pK7h71nizPxwAToXfjJCxh0ng1SlexFOMCyuK9WKkz8c?=
 =?us-ascii?Q?F8Y9ZH5EZXrIOEjmQGyWywM2o0c334ZWJ50DZ/XuXvriueJhpUdvIqsF6i3S?=
 =?us-ascii?Q?U00vw2IlTqXo2jvN0EMrPx7bHoyvv1jM5ZNq/57VqAqFkxJVJuUNx1IOJDOc?=
 =?us-ascii?Q?BThqkdiqRSz1uT+uDNeoSwFV7Uij/aoDt2Fc+vrUS/b41kSMtpIUw8bgGtI2?=
 =?us-ascii?Q?PaBQqfYokJ3P4hQskg1hga2mvN95A37UG1Va8wwKBSa+ezChefg9pKD5w3Ba?=
 =?us-ascii?Q?NYUy+dmMNtHOWJ42YvDJ+VH6KWaxRsYRzLPsG4xumwSjmgiJwSU1lq3Z9XcV?=
 =?us-ascii?Q?zIlUn7Bho8PGaKUlcqf7LlH41mTArmGJpl6XEJaAxzIIcYtFzJ7ZvkolkNoc?=
 =?us-ascii?Q?ZKUw7aEpgjZwxfZyCxRJj+RHH2B55mXmt5e++U7lZLTFO9XvfhIjL9A/urer?=
 =?us-ascii?Q?Lqdhy6ZDUrLuZ9g8hc3CfgLmndHcpSOIvLcoHktfQzIcK6RjlOS8jw39SPc5?=
 =?us-ascii?Q?UDy9Qpt54DPeByRJnvBflI8hqdlUwIrnEOYuyv+r/tJGbS/osVfFWdbgqaYp?=
 =?us-ascii?Q?a06ctWlivl5ZB/lE7oWpQ0gAlP5tqPiZwA73kZQmK9PCqwgh+l1hXMrVx/3i?=
 =?us-ascii?Q?dQ6ypjI4D6cE+zM8zxN6VGK5?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6542.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1af1cd-de97-4b9e-7441-08d94c8a2d0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 20:57:39.4182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 41151004-4224-448a-a787-d4279c1f087d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRD3vvp5Px18LhNXF1i6Msc9C9JRecTVSiGvOlSyiID7AXFYFik/NX+ZQWbQQb5wsy7Ft8wY/UFfJw8SbwNY2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5958
Subject: Re: [Buildroot] Using Intel TBB in Buildroot environment
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thanks for the reply Peter.  I resolved the problem - I was using the wrong TBB header files.

Scott


-----Original Message-----
From: Peter Seiderer [mailto:ps.report@gmx.net] 
Sent: Sunday, July 18, 2021 5:00 AM
To: Scott Bartolett <SBartolett@thorlabs.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] Using Intel TBB in Buildroot environment

Hello Scott,

On Thu, 15 Jul 2021 20:39:00 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi all,
>
> Is it possible to use Intel Threading Building Blocks in a Buildroot environment?  I am having trouble compiling our application when I include the tbb library.  I have the application working fine running on Raspbian on a RPi.  But when I try to cross compile it for Buildroot I am getting undefined references to tbb::detail::*.  I am trying to use the same libraries that I used in Raspbian.  Do I need to recompile the libraries for buildroot?  If so, does anyone have any experience doing this?

Not experience on this one, but your compile/link failure is hard to judge without further information what you are trying exactly, but in general integrating the used libraries/packages into the buildroot system seems the natural way to go, patches welcome ;-)

Regards,
Peter

>
> Thanks,
> Scott
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
