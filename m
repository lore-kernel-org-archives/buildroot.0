Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1D7C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E438E41833;
	Tue, 14 Mar 2023 08:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E438E41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbKUwYiFKWzH; Tue, 14 Mar 2023 08:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C472E4182E;
	Tue, 14 Mar 2023 08:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C472E4182E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015611BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE934058D
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE934058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iki51HLJfgfL for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:36:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB65A400D7
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1b::620])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB65A400D7
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvNWdJieLuiOiEjy20pUI7KIE/UqAjxPSSEPzqnsEzhy05g3dYLwPNRrRhyMN4mCZQ1r+kLdnKfZuq6dEBlJ5Erv7jPUyuBffEvXz8zbamZuwYWsZgj9BDKJ1UtUpNr/3pHgakqGr2LTIQu3dLk9NhNEMlJ2Rbs2yiqYSPK3KCuBUUAcAgfgz/kxXuGyRpgVH83Kmv8l5oGj8wLF9d9slxY0wE1PXS7ppE6txNuMbqvilkNkeyaQ+ng92P/Wvktp096HO1XSQaiDE+YUgkJa+1rH8WQHknIyAQJ42WSNNFDEKqrh3wdXCJycmeyCNwFYraMxoEvoYirbfRcBe5ONlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8rJcYT6B6jMEpbZpTin5/tZEi6TjbmqIwkmS11vHM4=;
 b=WXVgDZAgCdCMQbv5GETXSlUjGko/J7gTO7X9e3CPVlHm9Cgpq5bTIq+/qAMHaV0o+pxq0SAPRWai64FTlaFbY9YaEHjz8+LEgh9fUn3qOtTtg+cWeq9vso3GG+DL3lHASPhvNSh6DHhba4kRJGn4TIATSPTP4D5Nwa7t+q6QxbzoutvqylEZT8JwX1Y5Maao/O6vE+/jAjztGua6NpvICC/og+KIZdx/CYw/DC2xP0QOxu4FP4yz76TLoFPP3gejKlOD0GAh5OkQbK2aIW7EhSY0A3nmtqL0NwGkOZv/QfCsmxmMIFwJTZpVWpyxoknZsfdovBYQhqdsF2cnp9ZxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1913.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 08:35:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:35:53 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/network-manager: fix CONTRIBUTING.md hash
Thread-Index: AQHZVk+juQYMkYSw+UqZ3NgtQsLg0w==
Date: Tue, 14 Mar 2023 08:35:53 +0000
Message-ID: <VI1P190MB0493430AE2B3D343A43EF2ED9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1913:EE_
x-ms-office365-filtering-correlation-id: 8b2b1467-9ce5-4a92-2151-08db24671fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vPdfhfdM3yzZDfNutjb1K9gBhlMowgWq8sB1/GCPUzT+KFjM23kl9SLenpN+49gJ31Pjstkza0ArDvL83udQuXnmJnA30SfR7g3QVe/mDuYCUBAUXl/RxYqrJFy4q7GUrg0y2rutlBewbNiHSW2fozpWWkAG3F+UXxJnp6q9yUD1ZBftggRWh8VZmDfjx/Pg/Rqf+DXoU77bahbA3Wu/mSWhm98hjCtXEjtKFUHHlpTUTn/Wt3hIbUX5uTSA1KeXuSfKUEimf8L4Iux2fck9qk1f2lwZ9ud8nWfKc6Bpf1388Il8/eBpGVJ37qpybcanBxKU8d3RvN93/BxA1l6qmpCQ1Fd9XOdR1EfVuo0CHpL174oRuzkNJ32fZ1AHRajKxugJQL6Lckoh49/8pimfWs+lMuFrpLLLr80Jx84v70xtqYKD4oSX8bcHI1e2GkyYneX9fBJguF930DnWQ2imwCS9Apz7ALlmy6+Upm81ed3QSreGrfHGz9ZDAxk92jmOyb83thITUn3EzgcFguBIDbBzxy86zSuSWVtyrJa1TqMSnI4amRdmPRoLaTY9/3nt0qnOue3XHqVfCxMty18uId2cTXUOmctJzqtQ+sb0EurV62UNuUaKjnhXb5YUAwkcD5eC0dcBwVhu14S1VwjtNw8HMxYQS7L/4YwYcq5auHf+wMwiN/O6r4XwuggD3mKN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39840400004)(366004)(346002)(396003)(451199018)(478600001)(76116006)(41300700001)(66446008)(8936002)(66476007)(66556008)(64756008)(8676002)(6916009)(55016003)(66946007)(33656002)(86362001)(38070700005)(38100700002)(122000001)(6506007)(7696005)(966005)(26005)(9686003)(52536014)(186003)(71200400001)(5660300002)(316002)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VhAWopuNU6apekfDaJOUV1Z7FOETGTWgueqdCt/p9x6C/akiWLEk0CG2d3?=
 =?iso-8859-1?Q?cP/GG1wZe/VWYRV9liw6WzX54Cb80ffRTZ/b7tOora8FEh2FC/xTazpcZx?=
 =?iso-8859-1?Q?ukd2AIlWz8HK6F/rM7oKcS55guitJ8ObzvDYpORac2Rw9NrlIJxVK6Vyze?=
 =?iso-8859-1?Q?frsoXCPp1ybcSnWXuGbXi1AkGkqsgRFbmV0UCEz7oAdZvg3oLgrJqdUpb0?=
 =?iso-8859-1?Q?5eDXwxjKJNg5CSv69md8e3E2uyZSkk1qyH5BsIHhtTmyQ9paoiJxaZ2vXr?=
 =?iso-8859-1?Q?wi6palXx6DCI6oSeUXWD2K+CMMCLk0XG8i/T2IHQ4TehyS6ksHDm5Cw8/v?=
 =?iso-8859-1?Q?UUdSYEVJFMBCnTTkvqTZuza3n9e4/xCQRdnsamT7Sc1dxj89qPcazp+OcV?=
 =?iso-8859-1?Q?CX2ZBO4EaLjwtiHgmbkO0befv8pMeFnu8UgnEeqe/S9z1yqnAmaKPG7NWe?=
 =?iso-8859-1?Q?Rt9NIpcK9EBjiKTmJ87BD55nf6Svhi4NKXEByW+4AriBCQo9f10isyJ9j6?=
 =?iso-8859-1?Q?D0HaMrDVCGIIANdMq+6YLJjB1vKai02E13VIZcBzE5gsIn8jzsBH9KgDrz?=
 =?iso-8859-1?Q?EL9/8FijOdjiH54C9Rcg76Yl6GYu5VZPQCOw49CkncQDJoML0REGgj4IDh?=
 =?iso-8859-1?Q?ViNoUeXN+EKgGtW4UiW9JTbEqohW/9jHipDwG2WT8SvEPwdLpOYEmiqVt8?=
 =?iso-8859-1?Q?fziHebHWipw9XCZUvmH0MkFxrY5ZKtIRrECAwQnXSzcBTi5osb6vHmfG2Q?=
 =?iso-8859-1?Q?ua+TkKCQW2CR5n/Kmf7Aux4645jLJPY3y7Uz7Zan0PpD1ebXagyVLTWA+s?=
 =?iso-8859-1?Q?IMG6oDyvZRUZXee77NaJzBYvhU9aWgC7EhX6mJzQH49X2JXHVh8cfkByTE?=
 =?iso-8859-1?Q?q0R/sKVNRkoouw+LcZaXGCVg17KXEcnx3gcTUHVF/qzJYHIoxnOl0segNK?=
 =?iso-8859-1?Q?DYOpB3kxosHbzx3XNMdy0t4WHstDnxqGkDlZiRmdoWG4sie/BpuOMVkX1e?=
 =?iso-8859-1?Q?HQCA3wKXOV5/dWfLpVxQiD3MPv/F7vOReEhgZKATPnu6kePxBHSibJiPMx?=
 =?iso-8859-1?Q?lCj7lL29KjjA2FBIkWCMrtPj53gV7f1eg1tdnYX8YfdQqzacMt+n+NILpg?=
 =?iso-8859-1?Q?6FnoW7AZRfXWtws1jzmUNxSQIcJMN9W1cmwxeFsi6Y+sCrfb5e4wsxJstx?=
 =?iso-8859-1?Q?00NUBkECUKIS1EGA18OFj4950POhCr+JoUqTP6tNbEgU6FPqJG4IBeJ8VH?=
 =?iso-8859-1?Q?UlOk+YAbzaDenLELmhGMIic4fkBZ2ZXkKhULbcakPPp1sDJL76sWBQ/wMB?=
 =?iso-8859-1?Q?ckc+oMaFJsKMV5dhnhp82U6rk5rN6lUqEJt33z+FIqT1vu3SIwAFYCaEqq?=
 =?iso-8859-1?Q?sI2q9od3kV2dUbU756YCnki5MgSUHhDIddRMZWnD7eJW3cn83wQvgnIqky?=
 =?iso-8859-1?Q?Dc+GJvJid0MOQtCce2VWJ1yvR1otUa+wWJ7RuSFtswS7cGLw0gmHvTbhbB?=
 =?iso-8859-1?Q?R4aaGFiIgANtVgKwdBW0c2Yd+gBK5siKDKD/gE0s0S1Zw9JgDMYoAZOCcR?=
 =?iso-8859-1?Q?35ZG8WzMYGrAqBdcV2/6rMjnw4StWTZi6dfY4NCw3S520pmSW1dDXDwHL4?=
 =?iso-8859-1?Q?Fx8TpGyZFg1xg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2b1467-9ce5-4a92-2151-08db24671fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 08:35:53.3866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjuC2Fl0WG+AlOEznpEYsD5++d5Rrnnxyfw/Xb7X6t0iaxjVzM7988Ckw0YczpMUyb5tf05TweZGWYGbcqq8Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1913
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8rJcYT6B6jMEpbZpTin5/tZEi6TjbmqIwkmS11vHM4=;
 b=nAS5mzwL9mF//GLamDSJhYV9DuWOyTfzfsGN9VRgfIYra+HEbsXfoK5aflSihtYWPmcp/6E3gsZmG6D2gDokIs7NGpOUZpSz8cg4YWwAYtKcy7mMXjr7OKm/rJyGOh1D1hyRkV2oyBzHp0tWEEj5PGl7UMubdaeLazkuICDkyho=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=nAS5mzwL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/network-manager: fix CONTRIBUTING.md
 hash
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

The version bump in e3706f1 forgot to update the hash for
CONTRIBUTING.md
The file includes various changes unrelated to the legal information
(mailing list, how to build,...).

Fixes:
 - http://autobuild.buildroot.net/results/bbd0db06663b6df82973173bb044b57f013e844b

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/network-manager/network-manager.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 270699d63a..895351a537 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -3,4 +3,4 @@ sha256  2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4  Networ
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
+sha256  cfb6c71f6df5898e1724be3debe9adac48c115b903915406c1e7dfd362b57892  CONTRIBUTING.md
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
