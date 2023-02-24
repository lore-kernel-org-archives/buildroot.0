Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4757C677F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F33D417C5;
	Fri, 24 Feb 2023 08:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F33D417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4M8FjQo2QHa4; Fri, 24 Feb 2023 08:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22DB441809;
	Fri, 24 Feb 2023 08:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22DB441809
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72C501BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 490B2405A2
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 490B2405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hrxmh1Xll_Ah for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:42:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA3A84059C
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA3A84059C
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceMWe4+6Crde5FmfjCFXdpVd8F1Tjbhrj+L9B0lTxtTcFw10FrSBaW90AaBmMh1f7+p1iHWm3az4odRHJTYwxfA2uwkapwuFuyh2nD0tOSoCVTybBAMc9CUEzAz7rcad8QuWW331eOiBc6yXMvQAhBpPPjNGASy0Y2GrQH++1Ls3jACnRhLpxABNjTWAbHC8/eWUBknSzONKPRdWVGdUvQGMTTkoY/lUFsYBMCb0R3jH7NhCxu2MksBw9HlDGxBC+/8wA2g5COAbei6gFpGmQQDVhgIioQvvhWvwpBgcqToaIXhtqPqTOusEYqDM0fA/pTZ7djs92FF92bzuf3AutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjY0CRBLSxiH3aQJOK11ZGcWhYtoav5k9o+MOief11c=;
 b=kP9L86Rrlak7McD3HS8xuWNaE23lI7TbHehYtCFCPwUq2fSiYrc0WY3tfMWgsZS87YxnESyoMMvimnnXK51MZ2+h66v2Bq7+94Kb1u4FcTRJyVX8LASirq2JYrsIdFUUen3JASGgKRlAg5PzaF2nEavUInFwcePx9TPsP6ZXc5MPagGla0esghWZA8rvV95m5IdNnII+uYaN8ZOSo0gzFdXhSOPCeSSuUcSF+wG1fBsplS+dVutczPtJRHFHNBx8QNX1cAb0WYIcPZR31qc/S5kSp8XiGtZ3pKxFM0dG+ckC2dYHMlBNBZ56DYlROIgEcMGP8KRW6n8pv/ICMegdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0690.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:42:18 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:42:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 0/6] package/gtkmm3: duplicate needed packages
Thread-Index: AQHZSCpm4qc9s1kih0u249F6pk1hOA==
Date: Fri, 24 Feb 2023 08:42:18 +0000
Message-ID: <VI1P190MB04939E8E4F73C4D9027F26809FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0690:EE_
x-ms-office365-filtering-correlation-id: 2b5c919e-7648-4753-81fd-08db164309a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PzE422X0sulspTobnt+yyGzZXXFw+ifM9kbN8tJRp2UnXBc9l6bytdlUbe9SlE781P+t3A47cZPNxHAh8hmEzANdoquPybxeK+xfHCPOIf7yy4/nTmSSm0Ch6cfvU82rvJ/2zLtNkDnnYXo1qZU0MOFAlrTZONIAI8eDvObv58b7aB+ULeZM5X9UOMovNt1GcU6zPaIfYtfgaWNRdfrCldP3JO3S5dFCGaa+A5hJliD+LEyvhxvuMTI8WoZWqwL0UPra41159ggxem6c3XTCJ99jGGJG1KoiosL6X7GXLe3Ww+thjWNW9el/T9XxGiqc6QozRnqu2f95c47fC1IFC1wjsrguvIKwVR+PUGONx25un02ssXWKykljjQDJwbdc24AL/lPULdKbMnLKKuKK/HVVwEMKwPS+M7ZDyT2cBvPhiPQ+eFYN3spBJov96Nvt+0SbSywhB0bwo4skCtMVtzCOkXEH7MpXt+p4B6JjLqXc11ksxKbsaC5MtHr8h53RloaFC40e/Ip3B488OSFYMrCbYaMxqbRt17dbux/HtfKe8U6jh3eNr9YQeAEPMETJPhJJ6SHUv/KSZ0Pb7JQ92cMDOxHsHd/vY+NT0w65kVlRlZ6O7kTiXl2VPpHZLNkcyfO8AF2NqJt+lpbm0te2yLdlpwte9f/bbj3L1DvnDSu+kQ2C1oF7rZzbdbcDtiRW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(451199018)(9686003)(6506007)(186003)(66446008)(38070700005)(2906002)(55016003)(66476007)(8676002)(66556008)(64756008)(6916009)(38100700002)(5660300002)(122000001)(52536014)(8936002)(478600001)(33656002)(76116006)(86362001)(66946007)(83380400001)(316002)(41300700001)(71200400001)(966005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kwygQ4ZvszA2AagH03XqJruZADh/7w+nSqWkvqp+TtX7hH6Enx9rA+r8rI?=
 =?iso-8859-1?Q?vGuOejzOqFP0b81eg3jN5YZ1q5K47GfH9HEeoUc7YLYp/Sm2zPzB8v+A5e?=
 =?iso-8859-1?Q?vDBatabR8iEkmOY9dwTj4oXOibqcBDTanOMVX/2d+1ZgpKM3ioDxsA5gCN?=
 =?iso-8859-1?Q?Qcq1oWRWUg5nQVZLuYzN2zuJej3r/O6gnVSGLyq3ehN/EmkhfjFrB5onG0?=
 =?iso-8859-1?Q?cMTelX7D6aO90XB8haGngB0gOpqNC5C88XYTEZNGDEtE2U68Z7h8XpmAqA?=
 =?iso-8859-1?Q?SEfSFGmOAtZfSoCcE9hDw//1XmrMblNRA3IeMGobucb4lvOXiNZEZoIGQa?=
 =?iso-8859-1?Q?Bx3/YZt4/GEjwPH7jAhwUK51gx8AHCh10TpLv5s/BhA0Z+Qzkw8vQMwLp0?=
 =?iso-8859-1?Q?4U4924i4L6WCstLi9hm9im+XsMqRt+jZ1twyu4+NHQsPHIfm2q8baH9tDi?=
 =?iso-8859-1?Q?DZGeyx84zgBfKedvHUOqGjnO0RCI9wpg3g1CqEZ2vJma87QDe73q6HBfE4?=
 =?iso-8859-1?Q?+XcGKrLQvTRuu2jf7OU1E/z9LDwjXxYjhbp3eexs0sDnlXjMi5Jl3bA5vV?=
 =?iso-8859-1?Q?bjzZ4mr56lMgV343vZp2bfCpiAu0bglI6/e9SIshOTilTbin+wDnbhX4BM?=
 =?iso-8859-1?Q?uRR4VMgk9HFVm/Q0xaf+D6JHjeaL/yrkIGAI5r0y1ZHqIRojtMBFrRJ4YI?=
 =?iso-8859-1?Q?AiNy2qLHaXQIobj5U7MuFEdPfdOyCJOfuHHCX+d99O7bnC9t6vEerurvPb?=
 =?iso-8859-1?Q?dRENCMunUQ/1NdussG1HWQ2o10RHWnQbzkxCWeFeSJKoYkbFitY88NYQMN?=
 =?iso-8859-1?Q?wQRUJgquCOZ/+wqABiMBbTb57SE78ttGAWQcEpbGynLGbQDMcc1xae+c27?=
 =?iso-8859-1?Q?NXizQpPtof1yoS9FmGTMImqKerRf27YYXNtBKIexE3rj0XxEV+ny92b280?=
 =?iso-8859-1?Q?Z3pmLKQhYz60p6CeaVINZRrgsVsd2f+21nMequnuw9mdTu+nPqjd/z++Qb?=
 =?iso-8859-1?Q?27vHJhGdf2a34x2oqiq3QBUHkHefFCHwtmsXAEMJt28epxTf48CvMcs5OV?=
 =?iso-8859-1?Q?ztgEvPTlr8/OG0ILCDkuhYTrPTibVJfMmQq0Yp3vyo03fkj8/UBHqzWRqA?=
 =?iso-8859-1?Q?xdtFQs0ZCx1eDoES9PZ3MLtxa5THKxAxcgvhyEWYt79ptdmv5fJL0dpBXZ?=
 =?iso-8859-1?Q?+fvyUdKMlwJMEl18FYqvX+RdupDMmsUC7idmmUEghYs6VUMbVXE7sT3RTW?=
 =?iso-8859-1?Q?9W1ahycm3kU8hZ2GvKQ2+fFLvUKaGplJxu6v2MX09tPFUuUSYZVaiNMNs1?=
 =?iso-8859-1?Q?BL/r4fFtck0RrbwbhMjCtK0iJLoOheYPHtFvBgbHicBXFx2qnUd5zzHlf3?=
 =?iso-8859-1?Q?QcQ29NpMFfkbw6Zr2P61da0GDfoYWilyUX5Yy1BEFdTbERG9SNybj6Xo9p?=
 =?iso-8859-1?Q?xUke8YkkgmkB7dqEWu8fDChQJiy3BRMZ5hMarbVoaTeeIYPGXAwhHUs1t6?=
 =?iso-8859-1?Q?sO+RmMc4n9AW0NGPd3HACalmZTJGeDyeOLccTRuU+l9/wTKKWF/QMgc8MN?=
 =?iso-8859-1?Q?hEyY62uNMK8wLG5EEKz/eWkmBlGYRnm0Bt/d/xsh0GIXTW3QoRkPbkr6w9?=
 =?iso-8859-1?Q?VswqdI6enMAg82W+nZLd3YWuFlcKhLphdoPklZ11MIRq351+Tx2CZIB/3y?=
 =?iso-8859-1?Q?VsKYw7Rrl7zpC0PbpH8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5c919e-7648-4753-81fd-08db164309a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:42:18.3493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eerw0eM0w8Z/2RwGPjJBcE/s5fHgpIwR7r7UGM7xcy9+HpzjqyvMB9B21+gYWUK3r9bxX+FRfd8GUhF+1/vhpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjY0CRBLSxiH3aQJOK11ZGcWhYtoav5k9o+MOief11c=;
 b=5uTf5l2FPG0ytQItFBWa+hqFN1GzofPZDTaQ+7q3L9BXmh2yI155V3K1lody5rHgpDQHAPQ6J470S6sfJZ3tX8TsC67v13HT05pDnvFJ9gx/VqAJTJXC8sTuMlZ5IiPkqqsn3oXO/y50emfN9wDIMZxZurBKeUe037Ty+X8gyVM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=5uTf5l2F
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 0/6] package/gtkmm3: duplicate needed packages
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

As discussed some time ago [0], gtkmm3 doesn't support newer versions of the
other C++ binding packages. According to the gtkmm mailing list [1] there were
no plans to every support them, back then the API change was introduced in all
the other packages. gtkmm4, which targets libgtk4 supports them.

Recent interest in gtkmm3 let me to try and put together a series that would
duplicate the needed packages. The alternative to this series would be to drop
gtkmm3.

All of them support installing and using both versions side-by-side.

[0]: https://lists.buildroot.org/pipermail/buildroot/2021-October/625850.html
[1]: https://mail.gnome.org/archives/gtkmm-list/2021-May/msg00000.html
[2]: https://lists.buildroot.org/pipermail/buildroot/2023-February/661803.html

Daniel Lang (6):
  package/libsigc2: new package
  package/glibmm2_66: new package
  package/atkmm2_28: new package
  package/cairomm1_14: new package
  package/pangomm2_46: new package
  package/gtkmm3: use correct versions of mm packages

 DEVELOPERS                           | 10 ++++++++++
 package/Config.in                    |  5 +++++
 package/atkmm/Config.in              |  2 +-
 package/atkmm2_28/Config.in          | 23 +++++++++++++++++++++++
 package/atkmm2_28/atkmm2_28.hash     |  5 +++++
 package/atkmm2_28/atkmm2_28.mk       | 16 ++++++++++++++++
 package/cairomm/Config.in            |  2 +-
 package/cairomm1_14/Config.in        | 22 ++++++++++++++++++++++
 package/cairomm1_14/cairomm1_14.hash |  3 +++
 package/cairomm1_14/cairomm1_14.mk   | 16 ++++++++++++++++
 package/glibmm/Config.in             |  2 +-
 package/glibmm2_66/Config.in         | 21 +++++++++++++++++++++
 package/glibmm2_66/glibmm2_66.hash   |  5 +++++
 package/glibmm2_66/glibmm2_66.mk     | 23 +++++++++++++++++++++++
 package/gtkmm3/Config.in             | 16 ++++++++--------
 package/gtkmm3/gtkmm3.mk             |  2 +-
 package/libsigc/Config.in            |  2 +-
 package/libsigc2/Config.in           | 17 +++++++++++++++++
 package/libsigc2/libsigc2.hash       |  5 +++++
 package/libsigc2/libsigc2.mk         | 19 +++++++++++++++++++
 package/pangomm/Config.in            |  2 +-
 package/pangomm2_46/Config.in        | 25 +++++++++++++++++++++++++
 package/pangomm2_46/pangomm2_46.hash |  5 +++++
 package/pangomm2_46/pangomm2_46.mk   | 16 ++++++++++++++++
 24 files changed, 250 insertions(+), 14 deletions(-)
 create mode 100644 package/atkmm2_28/Config.in
 create mode 100644 package/atkmm2_28/atkmm2_28.hash
 create mode 100644 package/atkmm2_28/atkmm2_28.mk
 create mode 100644 package/cairomm1_14/Config.in
 create mode 100644 package/cairomm1_14/cairomm1_14.hash
 create mode 100644 package/cairomm1_14/cairomm1_14.mk
 create mode 100644 package/glibmm2_66/Config.in
 create mode 100644 package/glibmm2_66/glibmm2_66.hash
 create mode 100644 package/glibmm2_66/glibmm2_66.mk
 create mode 100644 package/libsigc2/Config.in
 create mode 100644 package/libsigc2/libsigc2.hash
 create mode 100644 package/libsigc2/libsigc2.mk
 create mode 100644 package/pangomm2_46/Config.in
 create mode 100644 package/pangomm2_46/pangomm2_46.hash
 create mode 100644 package/pangomm2_46/pangomm2_46.mk

-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
