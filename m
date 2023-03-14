Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3D6C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A39A81C6E;
	Tue, 14 Mar 2023 07:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A39A81C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVleu0SfrsBz; Tue, 14 Mar 2023 07:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C3F81BE3;
	Tue, 14 Mar 2023 07:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53C3F81BE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3554C1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E641F81448
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E641F81448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBSGy5FtYi88 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:48:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590B6813B3
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::615])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 590B6813B3
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9bEtsnkLu4yOpStbCk/kDyCwO9DojxnSM6pxhxCR8JBJ8crp6w+L2jeunagL0SWiO1KncitZ7x7TTkzBqWdFesl67rO5r3IodYv5IyQZlafwyqu0Wxd3Mdp0A8+ZOHF6wNtaEzaoRnrjj0hcxEwSmRaDLp3SpMevZuOhXneHrw/mLL5ZuTRDYxOHHjleexbeKKXWgZrEbLpGlDrOizwhkGkhqnFSLKrsA7HFtKTpHX9DOH62jhzo5SHogDpITDs44GNhSROcTh0jiduz6Ht0FmQNvH6iQlPpJ5qEzzveEOxj4U/wq3OzpEYT3nYAaEnOi9hOCKrZ1W9h/dLTZcQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL0EdGFDWZZnKlXYoQru1An3znFKHvMR/vkb94K0Xoo=;
 b=bfKypWWvLh+/Jf1TyZ8WUEagzGNhvHGamyuIVc9apqr9cG6iF95Y8aU7Zl1UHQtpXU0Lp+KJDVuXNs2axIge9bqdlLPFJjPBEybzrbuDMU4jbs2J3OeRKKgL8+zUzHqnN1pi7UdFIS2J/Q2+jd7PmwFbIX64AEmyrVvj+qDMdVYkOsTV/ooOKwB1N1njsJ0v0z9e2EAdzIH9Wk4n0h+eRN2Ghi2S7bDN07908bxCtAEYTC5ypvUi5qeTnkpiF4CSbTVWt//A0GCv7e6E59cMTlZLMoz9OEemBbC39WId+qsMFC3FvobIc3lT1PnTdnR7W/KQfj1D3wjkmJTy69vytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PRAP190MB1812.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:293::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 07:48:28 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 07:48:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] package/lzop: fix COPYING hash
Thread-Index: AQHZVkh32sMoiR7W/kCaFYVpyfD/1A==
Date: Tue, 14 Mar 2023 07:48:28 +0000
Message-ID: <VI1P190MB0493A37AA63B6E45036E0F0B9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PRAP190MB1812:EE_
x-ms-office365-filtering-correlation-id: 2e389edc-b07c-496a-97e5-08db24607fc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h7DVmmzNaA8cy+Vp4fy5VuYW93z13uhmaPGVbXrK840ojO1DTr74JO/BW6I7edIdTt35IVQGAQwK1pguiqcFGUgsaZc5ma1ioexXF3iBF+as2rD/+R8btoCeuti8Vsyr/TYKuBCVHMmsDM3DYDSCbDdcZokuaexiSH22EhM294XWROl/4zTJ73djpgBheSjVQluIGHHY/90H6wThIbvjrR+VmithHHIikUrgEwQVpmZ+pOxASSD1x7nj/EtlBn2QrxTiQo4OojBqes1Rb/qgUTZwopXuSn6F05u8alrNRmzXZDdmeuQBjeSsJgfABhG2uXHyF383U+OJ2LHq7lVSUuU6wpJ0zbdUZJZJPxrINmtP+46medk3vv4rx6VwagO4ZG80QGHhgdbhXED3/kxWAK/qak7WNvI+swZWJwvkfNFT7BDfLMG7kvNGqVqWNdj4MBsNc+kbVhZ53M7vT5AugtZIy2smTjr29lpAtCinXyR3tD/PxeKkcDQcHeiXNLpTIAN0x4Uc2Yt5jTMZJKUgJ8guSkXfKBJO1D//QrPxbURzOHtSewhe59ODPm2MnhqSm57cJvZuq4Jg0JDkQ0fwnSovSZ14l9XoHeLyqKiPaWBLTXiAD6QZG/XM0yS/aUa49I1cps673aaxODJVWInC5VCyBGXHvvjUVVKjy5G2ol9Vft4DEILmi1K0gw4aXWO1WGlYtKKvPxFaUVYqsmtqXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39840400004)(346002)(376002)(396003)(136003)(451199018)(8936002)(4744005)(5660300002)(41300700001)(6916009)(52536014)(55016003)(38070700005)(33656002)(86362001)(122000001)(38100700002)(4326008)(2906002)(9686003)(26005)(83380400001)(966005)(478600001)(186003)(71200400001)(7696005)(8676002)(66946007)(66556008)(64756008)(66476007)(76116006)(66446008)(6506007)(316002)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kvIoKlbdKjvdDg4PeinLe+grbzTDxzAysRzwh5BVYo7E0ni4K6Bxq9Rbtv?=
 =?iso-8859-1?Q?1IiJWgRfEMQ1wVzBXqsHE8ssFUet0/jEgHApm8iuBsAzdveDz0u0G+x9CR?=
 =?iso-8859-1?Q?dHVrtMkHLBLH9xNOw6itCZw2Na72BQ7P/e53aRFng9GJRFnd40zRZQdBbK?=
 =?iso-8859-1?Q?aFoMaNShAsRrBDFHKhem1G5Ylu6rS4/sT4quIooa9xwJK/QcT1J0DbBJXT?=
 =?iso-8859-1?Q?Bgo9ykIILerd9vyBzCEy7bz1/R0RMFKR41KwG5Y/kX0dKKXDofhMJgmyN3?=
 =?iso-8859-1?Q?Q1i+wsxieT+icX3x8fkps/4TlwKro/hDtgmgIFH2vyug5nvtI+YIZ2n7Nl?=
 =?iso-8859-1?Q?GOS6vMlrTeXXviJQtDVL7TNMQjt+GbuRw9ifBoTzCJUS3cQH4ZEeUxjNcT?=
 =?iso-8859-1?Q?L8G4XJd2YZ4fbZI4BmTF5kIz4PUB6RWE3re4uCc4zUkEuNCu5E5vXbeQ28?=
 =?iso-8859-1?Q?AYwgdzLy7k6bdujT1KlePOFTvXyXihX8RFbhBO4oes9BeBLL0Bto4BAxSd?=
 =?iso-8859-1?Q?Ks5Ubn8T8BhBR2CBkMCB2giOqB9uE5ezDY61D0tb9JU1G4GwK1kkQzhNJr?=
 =?iso-8859-1?Q?DVLWxGb2AY4fvjY9UywMBl887yiIyf90e6G5qizgdLOezDgUI2iZ4wdeIt?=
 =?iso-8859-1?Q?SKMVHZJXtfN+5g3xXgpWKTQgKz91F2mN70MF4VtzmA0Daa1ja27f3KPDbp?=
 =?iso-8859-1?Q?IxJzGnXfLqHh61IreKlPGQc9djkUIdlh11w86bvWe3CeZUNMKdD97HWFlR?=
 =?iso-8859-1?Q?cdm0wA6om6U1gHVVG1nME6E9tB+w5NIl+iuKkuBmrOseYjyD3qGxDyrStQ?=
 =?iso-8859-1?Q?XsKw4/FABE2oIMDUTXA6MGE5/KWtSITRCpJWBZ+7n/+Dy5kx1QlrQDe/Gy?=
 =?iso-8859-1?Q?0/EXffyIhRGyjcJTQm366qlgfM3xfO0NG4cTi5ZWp20AwYmNlVMIEYZYnK?=
 =?iso-8859-1?Q?r+6SUm7uA7K/j4iQ1FH+04NUCMYzeuvyxVZHORddFJbQQu0qQmHcLC5pPg?=
 =?iso-8859-1?Q?RzCR5SxMwQ4axPSqJkgqL7JBHu0Gs0ZRrLLYTWf0vU+48YZpcAeo9xrfsK?=
 =?iso-8859-1?Q?BTD/IKXhk+Q8TlvWAqDlB7KmCxzY17RUhli+moO2ZpvW1F2eqgBjW/6Cku?=
 =?iso-8859-1?Q?0WP1cikO4QRjvusGcByeAdq69H9Q6vWKcxvxrJbq+2yjLl85f5+bEOvBf2?=
 =?iso-8859-1?Q?OYvoFIABfFoON2sNphUJ1KnKmBr59+XysVWgeC5WdUVQwRRodloa2DHTIp?=
 =?iso-8859-1?Q?FCfqUPqr58y3IBQT3nBBe5kq8iy0uf/M/W1fbExtqoe2LoKYM/iFPmNb1d?=
 =?iso-8859-1?Q?hhq40hca9fbQU3/Hs6xoai6BRYEypvpSz+h/1v3/HI0Y3vdrBN+FcptcyU?=
 =?iso-8859-1?Q?T2eCyZfUEZLIfYhcPJIp4bFPdgRivw3yaGE+BVdbu/898hSCRR4YFz9S82?=
 =?iso-8859-1?Q?YjoMp2Ey/Qa4SDAIz5Af0sbMIelrA/QdMgKiP7IoKi6ijw6F+gKAorZhrZ?=
 =?iso-8859-1?Q?QNNk/p8tRduk1RkG1RhQYW0VPqSG37zBXoll/K+/K2+/pW7EJsK2nJyuF2?=
 =?iso-8859-1?Q?qV2kZYrFY3e8vQlGQDnOEiHMlK28GlQtY9IMkVBy2qvHkQcXx3KYEszNSO?=
 =?iso-8859-1?Q?mh/83Pj/JczMs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e389edc-b07c-496a-97e5-08db24607fc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 07:48:28.1286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1drLuoN3DII2YNxIocBvITtfXp0NZpr2fdGAEknpfhe6BXklkewplz7wzdv9R2WGB3wCiYS1Oq/B7/WdjweoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP190MB1812
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL0EdGFDWZZnKlXYoQru1An3znFKHvMR/vkb94K0Xoo=;
 b=pBGIPGio2CMDZ1cqJ/q3BCnCGVJ1mi1FMzO8EBhFhLRVjwYRPAWp8ysW57bKvpcLS4nFsjAb5wwGi+L5+EU3KxWYX//yo3MOZg+H3kjqZRzDG5Z7WBKXT/PoS6jTxqjNqacD1r4e3WnSDt4avBrKrMLlJumDYXIxnfJgL6XTUxU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=pBGIPGio
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/2] package/lzop: fix COPYING hash
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The version bump in ce95217 forgot to update the hash of the license
file.
Changes include a new address for Free Software Foundation, Inc.

Fixes:
 - http://autobuild.buildroot.net/results/c8a/c8ab973077067b2aa57e4f3ab51bd41ca1543d6f/
---
 package/lzop/lzop.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 99796dc8c93..31849aa0c5d 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
-sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
