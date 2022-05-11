Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8593FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 11:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B63401B3;
	Wed, 11 May 2022 11:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_xaRXguTl75; Wed, 11 May 2022 11:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A694016A;
	Wed, 11 May 2022 11:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1231BF2BE
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 11:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 177344014E
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 11:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nxr8fhLOrgU8 for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 11:06:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::618])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B08C8400A7
 for <buildroot@buildroot.org>; Wed, 11 May 2022 11:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7o7SgmE9j6dFrTRncEH3ZsyrpVxsv74CBZDqz4UX858MQ2uHuxF3XEnp8rK3246fYp+Rr4F5t/ccJ0bSVcuqkwvYuH2bqoh1hbaMvXBjCq/jRoLvkM2YezxEwvDzCZMgmmtekxNvFjOXD1UIbiBAKUgxtRbuAPelAWhxaJwpQuONOzGMofg7MXo92MDrr5pvffPV2tZgbBi1HO+cFTw25yZJgIi5jXwA3uNLl52MsBESd1MarvV053MHGqVfR4ITz6w3wVrSG27DgRDgex+1mqJRmTVtI9UlpstzVDW7jXi5zsipyGQdkBEdrVO/ZVhvwpqJ2ZnhhmmVJi4awHgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8hqAS4JpXpd9Lm1XTUiwUtuZyxps/2JwV3FN6waVOY=;
 b=SLVezksHpEs2+f+NxVCDLNxGOpsFMYKHIHu44r6Rjroqq54DoBoWjlKVtfEGTbnZStyLQl3AMmIdeqO1Q98RWSu5h0sb4c5cclxm6YqtAQL1RhU689KQT5TohBXQtn1WMu4eqO5hg1ZrCw4mAD0HMbCTSHh7JZvzXu5TBh1QjclkqcTF6gNvL5x+L3qwBkR1zz/gFHkimYHg4sNLLhgdt+QnOOF0nRLPy1kChjrxSsK8kN31Pj5OMFgCmn+OdNowbChKrSsmR6GkOkeLZC8cHoHe3zBsNwr0OpBLUCkKmJd8394xV/Zu78YwixBrODXwy9ZQ4Iazit+OOCHKk1om3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8hqAS4JpXpd9Lm1XTUiwUtuZyxps/2JwV3FN6waVOY=;
 b=e2KVutTvz/YzCx2adVsNRi0+tfhKp9NpnTDFXyEjXbuFaypcJ8ptB6DzBcfwnlqVf1xWdfgx28XI8E6Clfs8V+ePdK+rdNaorL4hNBY/wwP3EkTaWW78zsB5boLaGVWAaGveccDqo6WutnUi1oWwviWytzXcviL68NfHBTPRWas=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CY4PR02MB2776.namprd02.prod.outlook.com (2603:10b6:903:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 11:06:53 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 11:06:53 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>, Michal Simek <michals@xilinx.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6g
Date: Wed, 11 May 2022 11:06:53 +0000
Message-ID: <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
In-Reply-To: <87ilqccu3k.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9379439c-01e8-4046-0e2c-08da333e5aeb
x-ms-traffictypediagnostic: CY4PR02MB2776:EE_
x-microsoft-antispam-prvs: <CY4PR02MB27765E6BF28C2020268E8400D7C89@CY4PR02MB2776.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CdI+CKhiat7OAPleJfB+V7/rwHsc2Y5LNxICYc6x4S/3eQq30FordErYqZuLHhVd+UCdCKzuE7RvZCM/TWMUZIBqME88MAliP/pmoGcgJSGRuhZMTi79syEpZHUBR8Mxxc47F/rnAEtzz8xQy+IXzqFD3RPJUbvksIpTvOTtfb49MV37bHh2zi9JsorvUvKZn/P4i7ia5SsaeSaY5HwJgDJ8lWuk39dCIhpi32baSwm7H3nj3c0dti9J/IIA/57u7RCkbrZWkBONq9RQNUW7WU7m7mZk26PjC9Sh4zEOWFBJwZF1YKnzDWgis1NpmdCPaNm94fKX5q749+l4eMCEhumS4OqX04OyVJ1WlQp10mpLeOH4pX9v9qfpyHFwOSpOwwCAwBW4DeTg67YzmzaSAlF3thb67tHUUqdEtHJd/wv2ePSeCC4ClKN+gH8GkHAThHiuBtZifsqpDT92mviPYHBGkrGQ9bQm11UNescefChkSYnb7sFUR+TX/+uNqy6ytDSQOIupaVRmwvgt6Mpb1l1QYotCSzgSqDk/Mlc2jVMn4hVmJveFUhT+K1GXOOBAJFDqcp0bYxJ+htoCmI/+5y5UFhyneoDEJslPAbH5MM9mwv56q345wj4S4adykCoB2lG19XBFFlhtvL8630IKXPdzPI5wcRJvp6QF5R2ouGSiEilhjIpxKuGx5s7B6RvpSLsKWi6lZ8ygeqlF9I4JnjNGTQUORuu9MpH4G1bw8fQeYiqWKSBE+NEi1KXcJw6rsSmheJdd5ykv7msfLwkqGtlTfkZOND23prrzerXSOTTdLY03lmpqxEa4zShx90cz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2906002)(38070700005)(26005)(52536014)(38100700002)(122000001)(6636002)(9686003)(7696005)(508600001)(86362001)(966005)(53546011)(5660300002)(6506007)(110136005)(54906003)(83380400001)(316002)(71200400001)(66946007)(76116006)(66476007)(66446008)(64756008)(8676002)(4326008)(66556008)(55016003)(33656002)(186003)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?70h0C6NuWbfbXN2regRiLSKFLDhvynJBObxrEYpHwkdcFGFs23bIzEMortk6?=
 =?us-ascii?Q?j97u4lqAK2JjFDheegRaKsBSJEoNJT/95NryYYZxTY3tazYU1jIM2z1BKLZo?=
 =?us-ascii?Q?28qt260/vZxKhx589f+lqPYPaZ5sE8uXDAcNCerdCvQM1KAaa0+KD6B6iSJF?=
 =?us-ascii?Q?eRLuZYzUpI2W+jESxqZNuIxcIyQBEXU2d9HhWJxn7F7DXG6HPQVhkbWYgKAg?=
 =?us-ascii?Q?AYiKt3HgrxQYtZGNF90x4xDJ0Wz90wIJk1tR1oMl3V2GsOAJU917Lz6WZBwc?=
 =?us-ascii?Q?CkEHHJ4uO/6MWvnb9QWUXvHnDRZI3De69ICc7GvA3m+L+vUJnhvrFHT0bT9H?=
 =?us-ascii?Q?wK47LHx8La5quA7u8zhccB7Xh18KpkUIB9Yme5ZhIsZYQlWEWH+lOJKHrKz/?=
 =?us-ascii?Q?v9aQdnN2XyEFZCTZaxYz6DVw2W4PNeOWSECNhrNQvNCtP3TFRm5q1GLdn7ag?=
 =?us-ascii?Q?oGwXpCxN4HuSZHZhs1YL4831g26cscgL5FCcjS+u3m9TDmo6Wh6eEAqQiD77?=
 =?us-ascii?Q?uPcbljXsfbXvjYpgqIshxU+qwZMY+tBrjFlyNpgITMOZ2yz/oQcsfFfagC3v?=
 =?us-ascii?Q?/n6QkPHlJmdGYg/JMdINPJU7D+WTADF9B8z9ols5jPX95pi0Lir2Wub18uMB?=
 =?us-ascii?Q?L4OPrJYLOa77Db4t5TsR3ssSdVXvchg5SemHr7iP8hyvHwlft1lTbDJW5pPa?=
 =?us-ascii?Q?iJrz8mqcIt55UzZyTO0CyDhh1SoGyxK+15V0C0vBcJswW6UNmi5sUzC91eMm?=
 =?us-ascii?Q?ymudMsYpveHQiwAF4qRnK7uI6NGdLdMQM+vqP/PjpSyZGlL2lhHmrXMNbH+y?=
 =?us-ascii?Q?SC3brAUdBXHS5e6Y01yGRhQmL/Cmv3ndjubgW67+KpyAJcAQVWG7jfkncFNu?=
 =?us-ascii?Q?scCCqe/OafbkSChouEGtoR4gTZfGSgfIr09wg97fFh8ezT3ZL0wQzGNQdyRU?=
 =?us-ascii?Q?lH7AVyiEFm9PUsiH8E/E7AsC6qsSMQUCcnn7yGEB0lq/ljQqzug/+SUg50jv?=
 =?us-ascii?Q?r7eS3kC1ntbkSkv2qaC+ySxo/BstfgQBfrU1XX9GvZKMjz5e05/7domLrLBd?=
 =?us-ascii?Q?GKuSWPmsUx2GcEt1w7g7h7eYbv8eIrC5VnqIWN+eyihjFouG6Jz+wYXYmsLM?=
 =?us-ascii?Q?xLclgMfW5afY2lWhif1j4O/1cv8N/8xK9c5NCeTf8qZID+CkBgFDeS9FJNsE?=
 =?us-ascii?Q?fCggo8BSR0DQLfB6oFwbIJlwXFX7wOcIkaNF+xj/YA0LmsV4VwuOBJmnvk/F?=
 =?us-ascii?Q?qjiKZ+WL7TalG3Jjn65t0be/ixtIdzGl2tsec5WXWaVYRKEF2Md0ZlLX4sFL?=
 =?us-ascii?Q?xE2fZO2VwDSZt2V1Mv5uCrMWSPS++sLK3sk7lZxoBXO44kKbq1hJwzyVCaid?=
 =?us-ascii?Q?GuMMDAJczCagR5J1aU0VXAk01HOI5Qe0BabMT9MAlW00XQzN8p84EMq5IkVX?=
 =?us-ascii?Q?FSXfXlJeRH2tIVOT3hcnR1B8HUpzNHbk4jHUWzi6zembQL4764DRM3KDdEgH?=
 =?us-ascii?Q?bg+W1S2c+d8MCgEflEXIuW+KehKT8T19GmbWLlqDwHFO3+aF5JHjQkSv+sWE?=
 =?us-ascii?Q?6/YmbhMYpOPQN1ADpTa6yWgNWEYqGu9Dn7EVlbygc2950r5oAcG9wO0tF18K?=
 =?us-ascii?Q?CyPpamQuqmssWejQkOaLrUcEpG15Iso2smQfnhKWUXWIJ6zcNsqIONaZdGYp?=
 =?us-ascii?Q?4sMZWzHEjMOos9awY30l1l1j6YVQvLBrVuSxpwOXDnX/pf2rAhLIAnC3kVsp?=
 =?us-ascii?Q?gJzj5aZrKw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9379439c-01e8-4046-0e2c-08da333e5aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 11:06:53.2064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HT1cEyrKnkRXbTR4d/Qz9ViJM0Fc3brnWLmwsCYc1LZcLHr5x+ynFEYYn0hbATRr3I/fws6+hDRLw2s3jXZAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2776
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,


 > On 5/4/22 08:49, Peter Korsgaard wrote:
 >>>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:
 >> > This patch migrates configs/zynqmp_zcu106_defconfig to tarballs  >> for TF-A, u-boot and Linux.
 >> > This patch has zero change in code running on the device.
 >> > The goal is to improve build speed and align with the zynq_xxx_defconfigs.
 >> > Signed-off-by: Neal Frager <neal.frager@amd.com>  >> Committed, thanks.
 >> Notice: I'm still seeing noisy warnings from the kernel during boot,  >> did  >> you hear back from Michal abot that?
 >> [    4.384715] zynqmp-display fd4a0000.display: vtc bridge property
 >> not present
 >> [    4.393156] ------------[ cut here ]------------
 >> [    4.397776] More than allowed devices are using the vpll_int, which is forbidden


 > This is caused by not proper psu_init which setup PLLs incorrectly.

> I just noticed a different issue, reboots from Linux are not working, as the PMU hangs with an exception accessing the TCM as the RPU is powered down by default (ENABLE_UNUSED_RPU_PWR_DWN defaults to 1).

> Resets from U-Boot works, but that is presumably because the RPU is still running there.

> Doing a build on the PMU firmware with the PM log level set to 4 I see during Linux boot:

> APU> InitFinalize
> rpu0 active->forced off
> ipi_rpu0 1->0
> tcm0b 2->0
> tcm0a 2->0
> vcu 1->0
> gpu 1->0
> ipi_rpu1 1->0

> And then when rebooting:

> [   15.705425] reboot: Restarting system
> APU> SystemShutdown(1, 2)
> Err: #1 l2$ state#2
> Error in change state for l2$
> Err: #1 ocm0 state#2
> Error in change state for ocm0
> Err: #1 ocm1 state#2
> Error in change state for ocm1
> Err: #1 ocm2 state#2
> Error in change state for ocm2
> Err: #1 ocm3 state#2
> Error in change state for ocm3
> rpu 0->1
> Received exception
> MSR: 0x200, EAR: 0xFFE00000, EDR: 0x0, ESR: 0x4C4

> This is not great :/ Are you seeing the same? On a custom board running an old 2019.1 based PMU I don't see it, but after updating the PMU I do since the exception was silently ignored before v2020.2:

> https://github.com/Xilinx/embeddedsw/commit/b2bc5ed0e63ad1abbf2a3bc28dbf3c185b7092e4

> Any ideas about how to fix this (besides using a custom pmufw with ENABLE_UNUSED_RPU_PWR_DWN turned off)?

I have duplicated your issue with my zcu106 board.  I had not tested command line rebooting until now.

My next step is to test out the petalinux 2022.1 pre-built binaries to see if the issue is there as well.

If the issue does not exist on petalinux, I will look closely at the build options to see if there is anything different from what we do with Luca's zynqmp-pmufw-builder.

We may also want to check psu_init differences between the fsbl and spl as well.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
