Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FB4C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 498BD81BE3;
	Tue, 14 Mar 2023 07:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 498BD81BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNjb2yCyHXvM; Tue, 14 Mar 2023 07:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CE881CEF;
	Tue, 14 Mar 2023 07:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99CE881CEF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1078E1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD28781C81
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD28781C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQi7J86CwqFm for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:48:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850E281BE3
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 850E281BE3
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCpCL/7eM4ij8bSMqHLUYE6guKi5ym3NDaT5APLHYvBko5SBSrvTau6Rw71vnqHXaAfXIB4oJ4eBLaWJEyS9EvC/+G4vArPyJpVdU4zzqYijDBdVx0ZqsE31kzrQFxZqsYiZeoTy15yo0Hz7FHx18t5DUmh0xyd8J80CQAMrUGe8iMEgn1QtQYdVBYVcqFjti8zuHD8QcwUmsHzkayKOCqNaPsf5eMpSf5K3vXRPXCsblK40yJ7kgnNNLFIX7R6sep3LK6gD3xVcLVzS/X1nGMwotm+gKfcRREV/7V8aJXQ1SVkhAUSqQjmPKpPqfLfpW60ILtXQokl+03389j8GLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdG6ZpYTeO/eXgby9/q30SXAQnZRvg4GLqOhZVSUOJM=;
 b=O/x9YhO1D0wh8fxWbZX/XrPfbYD2sFhEnJGcQOpRqyb+VOmXh1rf9LbfeIxcmDeWzyebLxI5fmSf9vM90S3rODVX17kEYmMn8iP0l9mGIGRFypeVpJJZnccEtYpvJY5NfjBvW0IRYLYSwOLPAf/CDV1nEZDJtm31YlUAFHUrsMj3ejqZjqsAJ8wJZEPTSEuUjVrNN3hhKK+prF8Vr5lzOiMOoU02SvRzRU+RLqDjU9tWum5FHLxFen0rJmy+BS0qdb9pC4/m9+zugrsqVGtE8Ftu3ssSFjn+vdc2iLBlVPJ33cCPaSqAgJv9pydSRE5tzkVRJsHmcH+3wK+FyBv/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PRAP190MB1812.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:293::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 07:48:35 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 07:48:35 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/2] package/lzop: use upstream download hash
Thread-Index: AQHZVkk+t/oN4KBAHE+MJd6nfVuqTg==
Date: Tue, 14 Mar 2023 07:48:35 +0000
Message-ID: <VI1P190MB0493500E7F02AFE9AE14744D9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PRAP190MB1812:EE_
x-ms-office365-filtering-correlation-id: 3a118986-90c3-46f5-b1b8-08db2460841f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Av7pRPwA649dUuwSJNsTIoSU/NeMq8nNpekuPliJobdwmxSSPFu95U9ayk2dUbPxZ1EgJ+yg1Rfqe+ei230zgJBczeoRr9Q8LyI5U5zbjzQANkqYDHbRxK1OIy6Pc3THIS778EClmsEAEUxlryjHW25JgRJC+GIUnbpPagw6zkFWBvHFBIW8zpIKJKCkmW6a5yTfILIGhvWv0dXOS3HtUfgDjHgrFbxHo8DLeWuZmLL1xLFlcGsDE9DdpvHppMg5XumDrCO7eG8LJrT4+HidluqCWsPJOAw7PbIRb4JWnlvRRGa3VHcNQn6oFzHvwqtNtl5jCkILflKL3/P69NTWoIdSa9BMGfRkQvq+ZdreBO6NpnIG0vl4eRtfc+ZGngpKE3w897JFMhZyL2lv0xl7j/UfsPJo8wsmYWeWnoDi0sktsYTnB3AvlJSZwEXnzlYZ074WWqorLIOziZZv7aVZNmmMb7J3z29kS18+jOzwbfTD8QLpSCnlHu4FPqMXhLBTMl3WWQ0tCDHOBycGo3cgi5nXsnCHM9L8/HXM2sRwkeLKi0hgfF3nYswQRT/X6YZSkq55lBKTeIF4cROEI/++DTvUzk/GljQHsYwjyRE5482c1PnTEim62P3MuBGgWfnsVBI0Qx3BhWw0aOsvMMXcM2VXc/tCOnGFwiTzeZF9gVlILSgSoH+J8nyijWJSGi2E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39840400004)(346002)(376002)(396003)(136003)(451199018)(8936002)(4744005)(5660300002)(41300700001)(6916009)(52536014)(55016003)(38070700005)(33656002)(86362001)(122000001)(38100700002)(4326008)(2906002)(9686003)(26005)(83380400001)(966005)(478600001)(186003)(71200400001)(7696005)(8676002)(66946007)(66556008)(64756008)(66476007)(76116006)(66446008)(6506007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XQsV3NbCkw3vfJhxTKDHoI/jnZ9Wn1kMQRtJwkG8J3CmpFJfygxbAc9QSc?=
 =?iso-8859-1?Q?o6YY3F68HNptrY67gLR7tQDggHpUNR0DjT/hmqjQytE1n0l01JEqCRGmsg?=
 =?iso-8859-1?Q?8DulBAazxCdrvKreRjyQgqVSpmXL8kKVHhGsvsuAbQyXEdXGIHenf/Vv/J?=
 =?iso-8859-1?Q?86mVjLgxUGjNZilgPLoNBEi612G+gblQr3Iw6rlqvSVs511HfTbGwhJ/4+?=
 =?iso-8859-1?Q?rj+ag8Q/CpjezbLU5PEukZAZZPAfJveIYOOspoSGJylncctnjZ1f6VS9qO?=
 =?iso-8859-1?Q?uFMhhM9s1S/nbiJUiYbGUce0Lbpnuwm6pko1CD25sMDjPrDpM6YnzTL8o8?=
 =?iso-8859-1?Q?5zlWdylFZFvV+ZC0BtaWiEtKQzjWLnj9SZnHRGicIJfthFjjcgmCMAVoxc?=
 =?iso-8859-1?Q?Q1jo9tg80OibLtpysCNccn5mbka/GS1BhAtSarVC01s2Ujx5kmqyy0Cino?=
 =?iso-8859-1?Q?r0prDLlhOWs0wgbT4YfiwPQtG9D7LbTydDP9Nuhpo+z4FciF7iVW+6sCYy?=
 =?iso-8859-1?Q?q5Qrmfz/rT0HZcu6fWbPufCqxEkVnlZiOyUxPTXi2ZdF25t260GIt+kOvb?=
 =?iso-8859-1?Q?LdEd6lg2nr4LHuTTT20x6MFFZNjkFqFwZGqvQmnT47uU1gz7HzHgg4i72/?=
 =?iso-8859-1?Q?rW3kDko00UUwdeJRzEavx4rsl7U/mF2GxbwhMRG8ymAyWn8dcHjmKBkHgc?=
 =?iso-8859-1?Q?cw5AgdqKkm/uqmXnHpxlT27URKiGcBrMLgPaQjIAa8EL+UarjZugUTLeO6?=
 =?iso-8859-1?Q?K3MWzovML/3SWiwCVv9HMKlYU+MdCLH00rZQ9SjHCEuODbtlooD0u3BQ0j?=
 =?iso-8859-1?Q?2epRw+Enxc2eQLvSIdnB8gVoOGpslx0mEc7amF+LAAgkrt4Jhp+4iUPysL?=
 =?iso-8859-1?Q?yXTFAPBXGx8USXWZPTychGplCi82/RNwD+6VY0FL6cMxWA2OmoJN3/MjRB?=
 =?iso-8859-1?Q?MDaTapNbma9LkyF2l8WXHufipnn2oo503GOc6J4R56NyrPzHWMSKsOxj7Q?=
 =?iso-8859-1?Q?eDRrVQFFlC8brh9Zh7p7fREQBXh/SqK5rI0yuzD1WuRTJwholmYsFHm0ZG?=
 =?iso-8859-1?Q?yncc4D5AQ05+8VDpI/701Qe667bcXa5k5RmCilOh4+6Daz60b2Cpdam5VY?=
 =?iso-8859-1?Q?623bJYIqMnINcyPsShGuCCBmWAyu6wrRu0uKcuOApA+vlee2WJGh55U1zu?=
 =?iso-8859-1?Q?gWXaK1VLfvaFbHjgFo2opKVJyxMjPW1gjtXy40NaHaPu0xio8ernGLhISg?=
 =?iso-8859-1?Q?YehQmEJFHSckqUedX/O+iH955lrFlMKOHjPJW7CFsH4RfxwSya5e+sA0Fx?=
 =?iso-8859-1?Q?mLoZdHZ0U3BxendjwF2z7PwfQTNJCK/zsiDf+dMgURDI5T9ICOtSg9un1l?=
 =?iso-8859-1?Q?478y3x+668Husnl2CQ65PzzTbAywo79bigFxIXi6SFb/KnWHxEaaGYb4el?=
 =?iso-8859-1?Q?92ACPX9ur6amORSkkCALErSyBhB5nDfqF6FI68TA7ELvTr4nOoMO1j2p50?=
 =?iso-8859-1?Q?EiUN/zyGYdwRmRAqLGapNM7Ye2RgzS4Vp8cahVAzbV1bkIxKaE/L96VY3d?=
 =?iso-8859-1?Q?q2KIrqcpg7dofLeUsv5XuOrlUJEUQvpJoQkQI7yn5gsJtR6d69EJ+4oHpt?=
 =?iso-8859-1?Q?UjAbeGgUAL2Yg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a118986-90c3-46f5-b1b8-08db2460841f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 07:48:35.4874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cu6jfFFSa5iDmYAGn+qdWtOFYywxHGeAkOvEHRA11jmCoVFoRrv/DddcZ5PxbY8zOjokRYEfZnJmZUSJ4Za8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP190MB1812
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdG6ZpYTeO/eXgby9/q30SXAQnZRvg4GLqOhZVSUOJM=;
 b=s+zjWYWNMByOsT0p0tpoUueBJRfobUtFwP4AIzRsQSYGxjT5FgKiyhP8dUpQyUMmd2gNA+A991L2yJCycOOHE76Tz2cTbcJ+sSBgfqTXjQhnUvLYvP5qpm9vzZi+dKHHYNTd5YSaYSNrr2Rcqj40mqBBKhszn6+jC39XE7yzJzY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=s+zjWYWN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/2] package/lzop: use upstream download hash
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

The official website includes a sha256 next to the download link.
---
 package/lzop/lzop.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 31849aa0c5d..c7dd3d2fe8a 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,4 @@
-# Locally calculated
+# From http://www.lzop.org
 sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
+# Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
