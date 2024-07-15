Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F07BC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 06:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE4B140195;
	Mon, 15 Jul 2024 06:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhxao4bYK_uT; Mon, 15 Jul 2024 06:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C5D84025C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C5D84025C;
	Mon, 15 Jul 2024 06:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99FC11BF41F
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 06:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86CA7403B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 06:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yElXo0F9vtn2 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 06:34:13 +0000 (UTC)
X-Greylist: delayed 433 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Jul 2024 06:34:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4801E403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4801E403A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.102.163.124;
 helo=mail-edgebi124.fraunhofer.de;
 envelope-from=stefan.walter@iml.fraunhofer.de; receiver=<UNKNOWN> 
Received: from mail-edgeBI124.fraunhofer.de (mail-edgebi124.fraunhofer.de
 [192.102.163.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4801E403A1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 06:34:11 +0000 (UTC)
X-CSE-ConnectionGUID: Kzba1Fr0SSiJMpqMSOT0QA==
X-CSE-MsgGUID: zFLNCOM2R3SRfU6YpmkViw==
X-IPAS-Result: =?us-ascii?q?A2GVDwDOwJRm/xwBYJlaHAEBATwBAQQEAQECAQEHAQEVg?=
 =?us-ascii?q?U8CgT+BA3oCgWSzJYEsgSUDGD4PAQEBAQEBAQEBCAEUAhEUCQQBAQMEhH8Ci?=
 =?us-ascii?q?ScnNgcOAQIBAwEBAQEDAgMBAQEBAQEBAQEFAQEGAQEBAQEBBgcCgRmFL0YBD?=
 =?us-ascii?q?IJ4gRKBJgEBAQEBAQEBAQEBAQEBAQEBARcCDSiBCRMBATgRAX8mAQQbgnmCH?=
 =?us-ascii?q?BQDMRSsCoE0gQGCDAEBBoJy2DIYgkQDBgkBgT4Bg22BBIM/ASSBMYQkhEOCD?=
 =?us-ascii?q?EOBV4Iwg1cCAhiBSCuDaIIvgRWEcpBIgwaLB38mC4U/h3yBSSIDJjMhEwFVE?=
 =?us-ascii?q?xcLPh0CFgMbFAQwDwkLJikGOQISDAYGBlk0CQQjAwgEA0IDIHERAwQaBAsHc?=
 =?us-ascii?q?gWDJQQTR4E3iWeDMYIZhBqFNYFrDGGHfYFxgT6BYUyBF4FlSoVTHUADCxshM?=
 =?us-ascii?q?T01FBsFBIE1qHAEOYUMASuBZcZiAwQDgjOBYQWMDJVZF4QFk0SSc5hrIII0i?=
 =?us-ascii?q?ySVVYUWAgQCBAUCDwiBbg1UgS5xgzZSGQ+SG8h1eDsCBwsBAQMJhkiEJAEB?=
IronPort-PHdr: A9a23:kcFOKxGbzRu8Wnj5/tk7vJ1Gf3FNhN3EVzX9l7I53usdOq325Y/re
 Vff7K8w0gyBVtDB5vZNm+fa9LrtXWUQ7JrS1RJKfMlCTRYYj8URkQE6RsmDDEzwNvnxaCImW
 s9FUQwt5CSgPExYE9r5fQeXrGe78DgSHRvyL09yIOH0EZTVlMO5y6W5/JiABmcAhG+Te7R3f
 jm/sQiDjdQcg4ZpNvQUxwDSq3RFPsV6l0hvI06emQq52tao8cxG0gF9/sws7dVBVqOoT+Edd
 vl1HD8mOmY66YjQuB/PQBGmylAcX24VwX8qSwLFuRr/ZJDsvXvqn+8s3gOcetSudoIpXwSZ4
 4poU0fIqiEKEDIm4Gv1s8xaoqEO83fD7xYqxq6IOsawa9tcWf/HbI0oaTUGZ8pBcgFhMtqVZ
 LIsLeMtHeVKoqb6/lwrsye9Xi/0PODIjTtTnCWvwJI30OUGQT751y9xJpEfmUnLk+T7CP82A
 eSslbXlx2rbMddf0m6gzq7BUCsBs8qlYOheQcuM5mwOLVvM1XWKqar7IT6IzeIJszKi7epcd
 6XskG0E+jtuiWOdnMUzp4POmYNL8GLl/Cd6z9slJdimF0srNI3sAN5RrSacL4xsXoY4Tnp1v
 Dpv0rQdos3TlEkizZ0mw1vSZ/OKWanRuE6lWvyYPDF4g3xoYvSzikX6/Uuhz7jkX9KvmBZRr
 yVDm8XRrH1FyRHJ68aGR/c8tkes0DqCzUbSv8lKO0kpk6rcJZM7hLk2k5sYq0PYGSHq3k7xi
 cer
X-Talos-CUID: 9a23:345FU20gSpBZYcpsk66307xfOdIveyTz1i/rGE6aLH5wbYaydQep0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AJya9/A/mewG1wvPGvEYli/iQf9VGx4KFL2VXq84?=
 =?us-ascii?q?9gce5ax1oPjSjjSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.09,209,1716242400"; d="scan'208,217";a="2132747"
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28])
 by mail-edgeBI124.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Jul 2024 08:26:29 +0200
X-CSE-ConnectionGUID: uujR37tAS5msl3OO3RJtQQ==
X-CSE-MsgGUID: TNHj1hRHSxyu8vnjtJwdlQ==
IronPort-SDR: 6694c113_eJ7DXrzhd/ihyPhdhmoH49SwpLyeNmiheTB1dkWvt1psrdt
 l4dMdUl8FFq83MwqczwR2uexaUzZ2pU1dhCIbNg==
X-IPAS-Result: =?us-ascii?q?A0A3XABcwJRm/3+zYZlaHQEBPAEFBQECAQkBFQkcgSoCg?=
 =?us-ascii?q?T8xUgc+NQJcD3mIIQOFLYZMAYJcAZwpgSyBJQNWDwEDAQEBAQEIARQCERQJB?=
 =?us-ascii?q?AEBhQYCiSQCJzYHDgECAQECAQEBAQMCAwEBAQEBAQEBAQUBAQEEAQEBAgEBB?=
 =?us-ascii?q?gMBAYEKE4V1AQyGdhsTAQEUJBEBfwcfAQQbGoJfghwUAzECAgIOnygBgUACi?=
 =?us-ascii?q?yCBNIEBggwBAQYEBIJq2DIYgkQDBgkBgT4Bg22BBIM/ASSBMYQkhEOCDEOBV?=
 =?us-ascii?q?4Iwg1cCAhiBSCuDaIIvgRWEcpBIgwaLB38mC4U/h3yBSSIDJjMhEwFVExcLP?=
 =?us-ascii?q?h0CFgMbFAQwDwkLJikGOQISDAYGBlk0CQQjAwgEA0IDIHERAwQaBAsHcgWDJ?=
 =?us-ascii?q?QQTR4E3iWeDMYIZhBqFNYFrDGGHfYFxgT6BYUyBF4FlSoVTHUADCxshMT01F?=
 =?us-ascii?q?BsFBIE1qHAEOYUMASuBZcZiAwQDgjOBYQWMDJVZF4QFk0SSc5hrIII0iySVV?=
 =?us-ascii?q?YUWAgQCBAUCDwEBBoFuDSgrgS5xgzZPAxkPkhvIdUUzOwIHCwEBAwmGSIQiA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:N1jcrxB/zNA89SMMqepiUyQUIUIY04WdBeZowoRy0uEGe/G55J2nJ
 0zWv6gz3xfCCJ/W7/tUhuaRqa3kUHwN7cXk0jgOJZJWXgIDicIYkhZmB8iACEbhK+XtYTB8F
 8NHBxd+qmq2NUVeBMHkPRjcuHSv6z4VFBjlcA1zI+X+AInJiMqrkuu1/s62AU1I0RSnZrYgA
 ByqoFfqq8MUjIB+eIM80QDArXYNWsgE7mRuOV+Vg1PA99+9rrtC1gkVhf877M9HV/fKOoEDC
 JFIBzQvNW84ofbmsxXOVyKjzXsRWWZF93gACQiQ5xTAWYr+4jvTs7t78i/dJJXNf60yaQ+uw
 qRwED/KjiogOyEp+kPuiuZej/cIxXDprUl649KOJ6TKFdhZIrnMI+E2Gi14UtZ0egxxW6q3V
 qgtBsYhPvRVgI6koH4QkRjlI1GUB8SoziRS3Cbr4qA50sNxLj7N/10ZXMMnjWvrndvJbINCV
 fns0ITCki2dS/pdgGrbzoHqSTAzmtixB5xAcJf+7GgVTwqerk+Qj5L7Mi6O0OAN6VGZ79ZCE
 qG0iE12kR5a+Qr1xNgBgI7Wh9wv+HHN9yZ2nZY1IMPnTR4uMpa0VZpKsCeCMJFqB9kvWHxsp
 HMiw6Yd6vZTHQAPwZUjghvDYt+uKdjO7AjqSeCRJjl1njRpdeH3ixWz9B24w/bnHomv0VlMp
 zZYiNSEqH0X1hLS58TGAvtw90usw3COgijd8OhZJ0Azm6fBbZknx787jJ0ItkrfWCTxnS3L
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:uZjqzKtqVFk6SHRAEJCK2Jmj7skC54Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H5BEDyewKmyXcV2/hZAV7GZmfbUQSTXedfBOfZsl7d8k7Fh6ZgPM
 VbAtFD4bTLZDAQ56eb3ODRKadj/DDtytHMuQ6q9QYLcegcUdAF0+4WMHf4LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFU7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiXuBtVt6ZbcI+l4dYOxY/suW3vRY8GTFcVcsoi5zXwISSeUmRYXeZ
 f30lQd1o9ImgnslymO0GbQMk/boXMTAjbZuCOlqGqmrsrjSD0gDc1dwYpfbxvC8kIl+Mpxya
 RRwguixu5q5D777VbADuLzJmRXv1vxpWBnnf8YjnRZX4dbYLhNrZYH9EcQFJsbBir15I0uDe
 ErVajnlYBrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRalHYd85A2TYVC+o
 3/Q9NVvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXOljjHLFvAQO/l3c22sRE2AiHQu148HJpou
 W/bLpxjx9NR37T
X-Talos-CUID: =?us-ascii?q?9a23=3Awr1YXGtleJo2ghDR3aHt3a7X6Is4b3/nlyjMCnT?=
 =?us-ascii?q?lDH1tE5qyEmWy5Jpdxp8=3D?=
X-Talos-MUID: 9a23:kTOWqQtI/Q0da5Trcc2nuBdCNp5o2YSVGFEQwYsAudWmKiB0AmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.09,209,1716242400"; d="scan'208,217";a="16537741"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
Received: from 153-97-179-127.vm.c.fraunhofer.de (HELO
 smtp.exch.fraunhofer.de) ([153.97.179.127])
 by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:26:27 +0200
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jul 2024 08:26:24 +0200
Received: from FR6P281CU001.outbound.protection.outlook.com (40.93.78.4) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11 via Frontend Transport; Mon, 15 Jul 2024 08:26:24 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwsA0ot8bfk2/4Y8Uv5dSZhd4TvjlESgbzEDQ/ntfLuqGhj7WMkpgEvMgeW1H3JrnDCrHRawEZAQdz8ry68IDIWFkn1OH6wU5Di+tXZV2tGF8nLLQdJh2N+7ezSvs7vETpW051fpQwtpWxm+7Ov3TGr6K4WxmSSTutdQ4X7oeGxvp7D2XmbxhjG2JQTnjJPPyIh3Tc7d3X9WafEQA/RVplBylsgf8E0ahzXu5RYC+Pz66/Bpl/8DieU/g0P2DEIzX2QD42k6HCvivIXixedCb7meB41lBTPVP1YJAu+zvlS9hcgd+CaVYvOtLA5Jo1awdqLbpVjFhrx+ip5ee2ALyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmRoug8xAm9nBn/q0SZunXSdEks0HJneOdwxbJQhBFk=;
 b=xiLwkDkMuAi4ytNYc6Hg8gkZErCNZJvfjdTeq6jOOeMfcBfiYVzfxqULT4+d0v7UIkbqxA8iZ+tZY3JfDFiXOeofPWvcAk9G18MS8n9Aq/2Bi/VIpImmP17HD0JTwAFNYlPF6B5C1n5B5y7LbUjfuMv0JXY/13VyykYQDFFoeyZQbFQMQfzB1hmHn6cgG7YpfWMEy3NAjiyIga/4g0mHyfuut4gfEIXXSNdGAxjf7I89LKLBg5KC2oCB4Mcqk3NZgLtBmPg7aL6Z+zGf3PF0Ws+9SCmppEMF+j1y8HuzuLMdsnpXz+4/I4ePAGaeGsRo9NxjqGBg31t9JKoQeAazHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iml.fraunhofer.de; dmarc=pass action=none
 header.from=iml.fraunhofer.de; dkim=pass header.d=iml.fraunhofer.de; arc=none
Received: from BEZP281MB2979.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:76::6) by
 FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Mon, 15 Jul 2024 06:26:23 +0000
Received: from BEZP281MB2979.DEUP281.PROD.OUTLOOK.COM
 ([fe80::f120:3ee6:964c:32df]) by BEZP281MB2979.DEUP281.PROD.OUTLOOK.COM
 ([fe80::f120:3ee6:964c:32df%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 06:26:23 +0000
From: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Installing host compiler's libbacktrace
Thread-Index: AdrWf1o920wo2ZFtQj2LMx1x4NN+Uw==
Date: Mon, 15 Jul 2024 06:26:23 +0000
Message-ID: <BEZP281MB29791638EACD79D23FFBFA68B7A12@BEZP281MB2979.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2979:EE_|FR2P281MB2669:EE_
x-ms-office365-filtering-correlation-id: eb7c356f-7523-4559-3982-08dca4970c3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?RpLeyQzE+9qmXZMYfoDJo/SpWHpb1vyQWXjWT7kAI0o10Y+9bOBuHVbEzPW3?=
 =?us-ascii?Q?3+14PfGTvUfyr4i8m0qtlFcpoF8wa1eCcgcFX45D0ZgwmHPr7DWFXVpulI8c?=
 =?us-ascii?Q?I5+J6MxFxVFcF3tJ8kxM7JHtrmTjl6J9p4jqfKbpmkDaWcQehl0sgWSVxm3D?=
 =?us-ascii?Q?LptNoEOsVxHfWWGaTw1velKUjjY1bvx/okGbNaNHOaKSnxBwuAgN0F+cVZag?=
 =?us-ascii?Q?PnbNfpeF6EjkIERba6p1HWevVXeOl4CdSzJ2UrkAkbPnm8hKQ779kXO0kq1/?=
 =?us-ascii?Q?AnY3pWILQYwAk8luy7dvcg6n1f5Az0yYKRhscZvFRyUcqiLWMqvsPnWD5BTI?=
 =?us-ascii?Q?wV+dOBOuDVNpeMdbnBH/krSIB/oc75+HQDxu4g0gYPWkSkq5lsI8Kk5PB6MI?=
 =?us-ascii?Q?zwX0/oM21w9Dz3heXZzi/OUAC2YCquirELV4IzelyPsatl8YRuyaKG9EfB65?=
 =?us-ascii?Q?rPzBClPeNUo1RyABwo9VdmdDk0+F+SY4CGBWABP9awSKRQU0SZRsYE9PEHs+?=
 =?us-ascii?Q?7n5SKlq+Jy+JONPQ9KDSpm6bWA59P0P68QOKW7dt/gHsh0h9ghuYD37/fuJf?=
 =?us-ascii?Q?K9npC2kOvkmxR0RsadHbHHNoky6TJrCR5SXzN99ElMbXp+Hmggo2fcMQ4yUa?=
 =?us-ascii?Q?jphLZEm/U9PfJJwuiSSxGI65GXDwA3KG3OzDb8GrUYdRgRAp+wdgjsPRNXkt?=
 =?us-ascii?Q?dDxTC5YmlKaDgAIQVR9OcE6QggDFdhUrV1ZyNL/thgDUeDJdqFsuivqjZgZo?=
 =?us-ascii?Q?5YDSSxCQI1F7wg0e0rEKNLs6f3nUPM/M2iJsK9vUta7399S3DddH3Zzdl5Kf?=
 =?us-ascii?Q?pjKLv/c+BcufbnijoS+LE9tyRuK6zWZfviuZoKf4e0fh82MVJ/xJwU3Ett+I?=
 =?us-ascii?Q?+xKxo30o1LJX0tdmWQtRQUB6I+t+qnjNB3HnREjVzZnYzItgoKxTSTkkcMxB?=
 =?us-ascii?Q?lx7/q+qL9jXAxu+VwM/xw9huAfJ8bHOD16LdzJvWxq9oL1M7Q7YAS8nsgAft?=
 =?us-ascii?Q?5eSay9IUdpoNG4naknzBl8ZkjKeAPMGsTa9wirqXzjshIIXOX0z1O6vzQGcY?=
 =?us-ascii?Q?2muXB1UoWUCdIfWsP6apVXR4rvVsC/ElRo71smoOzH2xog2yvshHSukEy/ZE?=
 =?us-ascii?Q?QFvqwjJqwX8eY5UIAlzZ41gb2NKtqEaFWt1NuWEDMWxJntLlJLKbLI7PtfpG?=
 =?us-ascii?Q?BI6VCLJ1MCts1K0FfT33u9G72vdeReL7xyuNDe3SqR8BdtE0BVZ7OYDWdedw?=
 =?us-ascii?Q?ryVLL20op7EwqIleSI/B+ErEuGLvzu5K4jiQQmVsranvAXao9FM4iWH3k4Tj?=
 =?us-ascii?Q?M3TmBTXpI7tin9Us/x/v1ZSV+z7QPGZNvQkDNTZjEFIv5YHiodAArivadkK5?=
 =?us-ascii?Q?pg7w/PA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2979.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0AlJ0fcEzhoE4vOwPI11Q9oonAvPyOesfIKQ8jNsUTKbdw0EEFp8FuRG1H3n?=
 =?us-ascii?Q?mKVsauZfn1V5gY/p7xaN1Xl0CMQvBDS+8HUmc1rEeJadcFk4EWqb6xVK7U7g?=
 =?us-ascii?Q?kPxpO3k0ciOVPj7wurFF3kMVMPUKl+g31G36hOrabtEJ9e2rHgMeqTUKi8m1?=
 =?us-ascii?Q?z0yzWuKRGytq2sx0BNWInkDnQgPf1tNVWP4zqUm+nc0RGHS0bDA09wKW9PQi?=
 =?us-ascii?Q?6HEssKtRm2tjLboj7P1NdLKYWYDDjLufH2oKQW5E0GkKYLO6vauSYr+VmdIa?=
 =?us-ascii?Q?jeka/Y0eBR7Y4EYxWF/aDVgW77NOCQWeV7IQQ+tfI9coxmYBiTiVjWbu5jUU?=
 =?us-ascii?Q?2dFZyOGshN4wvJD7yS9bK/UIkfsLHwIOH6JOSyL04wUHOOU4mDMGWA1J0KW7?=
 =?us-ascii?Q?dkikBS7OC3kBQZYskePtgpB0BOx3TXwk8uxTnPGOqzCkwjoSuAlmVn+hhAR0?=
 =?us-ascii?Q?XevSjEr+h+u84cdGgPeMqzS+qktclACYajWHaPndY9prbIy2dEkSs6naVvlP?=
 =?us-ascii?Q?sPhxGNMXibiTRWXOLIXIMFrWpARQyY9l/t9QEdVXqB+3W5GrjYOKHrKmIjgQ?=
 =?us-ascii?Q?6B8EusSy5J1rou3jVejkPt9memHYd9E5hk7cIW/YhuwJwL4GJTlcbCS+RMv5?=
 =?us-ascii?Q?7jgM4CHgrCwcPYNmovm0FvsFjWjS1Re6L4ZYvEaylsG8seAP068wl54ZofTK?=
 =?us-ascii?Q?tyq+ham53Hqcq4EHv6dRzYG3Y86MOFHWFJgM1PjVDrC+NguOqj1lTgP3HBuV?=
 =?us-ascii?Q?iW0W3uG5U/b83vLmPVGiujgwKBZu1ZPhmB3S6bivd7LWrneoWDagVnLiJBu9?=
 =?us-ascii?Q?VWzPgzBvc6KbqH7HePxCB7CKw6y8YASo7zK7pR+jY+5j16guaj5rQDcVwUEI?=
 =?us-ascii?Q?FKBEADllTxMSqgUuwbcG1FMnJxqlpBNLh48NGxHruQjU9KmCfXuI9aEeq/cI?=
 =?us-ascii?Q?8kentXX1NTdGG7e1HrQZZF4Rm0lKZPvddMA30/ZAFX5f03VwnezBGxVyNxXq?=
 =?us-ascii?Q?W9IR9nU1J0Iz+zt93TRvstthukvMR/DJqwq6HU6f+tmDV5znWVA6BdwSbEHp?=
 =?us-ascii?Q?2U42zdWtRqVxvxZjT/F0ozzlsO3fp6Hz9gO1lZ47uulY4YFME5bV1cQEK88t?=
 =?us-ascii?Q?fo7iDaXWmW5zbcRxJdv/zxQ/ZtfsVdNUfQwiT3a3CqnxBHIXbLWALyDeRVy8?=
 =?us-ascii?Q?alnLmFrSOc5+rTppvZXyHBqYQnErh7ZbTnMF2vMzMEcQU3KkTYaRH9CZHQqU?=
 =?us-ascii?Q?nP6IBTcKXkm8KSoAf5nKz1OXccDnNKg4ktZIZAkDucygMfPpgoPobPSxDIFL?=
 =?us-ascii?Q?z9TfvkOCddqitXvNTcIP2D1pNoIvCVePHKrYbpM5SlGsfvF/12V4CMb8vwiG?=
 =?us-ascii?Q?qq4swGvitpOU8c3zkNthBfew9vz1Hr95kSR5hBlB7pnJnUS5InNKKbrjSAWD?=
 =?us-ascii?Q?dm8xWUfDFGXRBnhHw8YAO74+viPoN9y4JRpw9HN6t9yaaltBJJ9I2PWBNfwJ?=
 =?us-ascii?Q?GwqL2Qq9ngwAtBUpvKMqwofi2KEzu1LJ5hsnZenieVcvqnjlm8tJiYJa+8ec?=
 =?us-ascii?Q?1O7Gp6eV2ywWr5exvgHhaEJ8inRN6ett1/J6i33Su8GQD276mHv19qoDDyD9?=
 =?us-ascii?Q?Lg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2979.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7c356f-7523-4559-3982-08dca4970c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 06:26:23.1945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0HTGnlM15L3WOoizZz55cc00+gB4xcRC3TG/YZm1VrvxFu5V8YJQj9jSIfEjecshMSDWQy+6W8U9kAZ4d/DJ5gcq/FCZsFjDzFRvg4MB3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2669
X-OriginatorOrg: iml.fraunhofer.de
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=iml.fraunhofer.de; i=@iml.fraunhofer.de; q=dns/txt;
 s=emailbd1; t=1721025252; x=1752561252;
 h=from:to:subject:date:message-id:mime-version;
 bh=IcgFPHHBvTY9WVUJbq/SOEKChwjLe7tx7SP/uiDc5JA=;
 b=VO7IqDqbcdX01QLTmZ9kaHW2xwDaNuVgGD20W4jhzviTjnte7RdMDWt8
 /pLYRijU6khzX9y7WgSSsr+NeIuXCrB62cTLqdLpdKiGtFUaN2NOfWtR7
 Nt6+l3l6q3CAnwS5HSEVDJMOiZ6pP0v/BCVAwliY6w4qkGuUNhD4XC+TW
 /CfLaC7hRyM4smHsT6H4BEvf0lsG1HWwWznqbJEDMti9oxJsqxtiwZ617
 cY7/flkwGNT7FeDR6gDaQo4h9OxKKtRsFi8Tvnrq+ikruwJlZnRovvFN4
 feTLGGFuoL9/0Y34SfsMeMPtJFjYMXD9a0cP6Zo5smM8PtFmBgQ4LNks8
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmRoug8xAm9nBn/q0SZunXSdEks0HJneOdwxbJQhBFk=;
 b=mH42/M7IJO4ry6ZD7/QdxMEHX1AcQKJaDHkzeGo1oMvTk3N0PkO/lsr21uWekiO8WWcK9Q+yAUwWYfT0L8lq1tEb7p6Lac15NNaJSHzSAU2FXi5GMIR0a3HrhNvveusnlh2QjhTJ/+skK9RwC3Z2jwEbowi6RZIajkg5xhmv7m8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=iml.fraunhofer.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=iml.fraunhofer.de
 header.i=@iml.fraunhofer.de header.a=rsa-sha256 header.s=emailbd1
 header.b=VO7IqDqb; 
 dkim=pass (1024-bit key,
 unprotected) header.d=fraunhofer.onmicrosoft.com
 header.i=@fraunhofer.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-fraunhofer-onmicrosoft-com header.b=mH42/M7I
X-Mailman-Original-Authentication-Results: mail-edgeBI124.fraunhofer.de;
 dkim=pass (signature verified)
 header.i=@fraunhofer.onmicrosoft.com
Subject: [Buildroot] Installing host compiler's libbacktrace
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
Content-Type: multipart/mixed; boundary="===============0017411948837764853=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0017411948837764853==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_BEZP281MB29791638EACD79D23FFBFA68B7A12BEZP281MB2979DEUP_"

--_000_BEZP281MB29791638EACD79D23FFBFA68B7A12BEZP281MB2979DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on an integration of cpptrace [1] with a C++ application. We co=
mpile this application using the Buildroot SDK and then add it to a pre-bui=
lt Buildroot-based system (Buildroot 2023.02.9, currently - update pending)=
. For symbol resolution on Linux including line numbers, cpptrace can use l=
ibdwarf, libbacktrace and addr2line (see [2]).

For various reasons, I'm trying to use libbacktrace here, but building cppt=
race / the application fails on a missing header file for "#include <backtr=
ace.h>".

My understanding is that libbacktrace and the header file belong to the com=
piler. (We're using the default for 2023.02.9, i.e. GCC 11.x.) Is there an =
easy way to have libbacktrace and the respective header files installed as =
part of the host compiler / SDK?

Best regards,
Stefan

[1]: https://github.com/jeremy-rifkin/cpptrace
[2]: https://github.com/jeremy-rifkin/cpptrace?tab=3Dreadme-ov-file#library=
-back-ends

--_000_BEZP281MB29791638EACD79D23FFBFA68B7A12BEZP281MB2979DEUP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;m working on an integra=
tion of cpptrace [1] with a C++ application. We compile this application us=
ing the Buildroot SDK and then add it to a pre-built Buildroot-based system=
 (Buildroot 2023.02.9, currently &#8211; update
 pending). For symbol resolution on Linux including line numbers, cpptrace =
can use libdwarf, libbacktrace and addr2line (see [2]).<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For various reasons, I&#8217;m =
trying to use libbacktrace here, but building cpptrace / the application fa=
ils on a missing header file for &#8220;#include &lt;backtrace.h&gt;&#8221;=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My understanding is that libbac=
ktrace and the header file belong to the compiler. (We&#8217;re using the d=
efault for 2023.02.9, i.e. GCC 11.x.) Is there an easy way to have libbackt=
race and the respective header files installed
 as part of the host compiler / SDK?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-ligatures:none;mso=
-fareast-language:DE">Best regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-ligatures:none;mso=
-fareast-language:DE">Stefan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-ligatures:none;mso=
-fareast-language:DE"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none;mso-fareast-langua=
ge:DE">[1]:
<a href=3D"https://github.com/jeremy-rifkin/cpptrace">https://github.com/je=
remy-rifkin/cpptrace</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none;mso-fareast-langua=
ge:DE">[2]:
<a href=3D"https://github.com/jeremy-rifkin/cpptrace?tab=3Dreadme-ov-file#l=
ibrary-back-ends">
https://github.com/jeremy-rifkin/cpptrace?tab=3Dreadme-ov-file#library-back=
-ends</a><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_BEZP281MB29791638EACD79D23FFBFA68B7A12BEZP281MB2979DEUP_--

--===============0017411948837764853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0017411948837764853==--
