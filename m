Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D186C04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF2260AE9;
	Tue, 25 Oct 2022 06:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF2260AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id My8UWqCO9LSh; Tue, 25 Oct 2022 06:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05EE60AC2;
	Tue, 25 Oct 2022 06:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05EE60AC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFC21BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC49F401A3
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC49F401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGszXNfpj-BH for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:07:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7858A4019B
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7858A4019B
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEwlk94HzZK8ATwqVAdKvtiCNVnPeyatW6qGpUY/6MpIuGclx/pQYImWUYdmdkhqEJXNBFOSlFhEJpqEFg0CX4aPnUxiBMQsWLOEgfEvnMK0USlH7bBSp9WT34/7iuCRT2uJLnc4Hk3E5mCE3WNdZ3pbbJtvzlllbRgHDdEdUjj0A4bWx7jsfA+ddIDbYkeG91zkdJ6IB5IwxgAszH81f4SReHXgrG8ri4YB1DfAMsObz0YLqgFC2WP3hZNH61vZh0n5hFu2XAe2l8Ln8dCwP5JB3Mg4A431f0MwmHAOKq4Q7SGzfWY7VHdnKpaa8P2XoOjjxQ9U/aZSoLqaBzEHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXx8tax8QyzPzomKhaHxbvO2237z9g2qw/bKDGdIZWU=;
 b=Pk+TRCzGTrqbyH36dinCEwkpatPfRIYaBF9EdeFXLESPgBsV037qT+f9MsW3F3E48CaU+9N3sd+ZrQiLHIJD/ocS34r5f6RyaFIM3Frzi+t3ohS7sYXh7iaup8VTpMFEPJTbvi1r4odh+rHnK/jQ34xsL/fhaaVB1h9AGvJ3NtaC6nOe2gNghxwr45vgtVL7QbqtIawrOmK25dP7hLSV6aUeapcoGuYZeRWtekLFrwXHjZUEjcgBP8bE1SRgWm9BbTpOfxRZXuB/pooKBdfR5P6fmsBBjfi07vn/gVbQrXJgFFI9HLHjsmwVoxiK6kV6+TlSyxh3H7z7NQo9e+63/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1803.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:07:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:07:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 04/11] package/clang: move to llvm-project subfolder
Thread-Index: AQHY6DdnImi9A5YDdk2VyuYy6Zn6Mg==
Date: Tue, 25 Oct 2022 06:07:54 +0000
Message-ID: <VI1P190MB04933E751949AC273E5E7F929F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1803:EE_
x-ms-office365-filtering-correlation-id: ed106bb1-2297-451a-e69e-08dab64f4186
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: paP2dueUxTRRlSCZPF47NShVE5xQ2m6s6giQSicoDnjdtowQk8KCk7qM84w8bgQCbphHLpX7OesNQwAfFI6FcosRTDV1PvUYomMr90sWZsbpxkaEM1Vz32U+UTzUs/lUu9akh9lcxHm44qZCrnrWg2yy3jluGOnnE2YHZCL3TndTMhfbp05BJxjM9UMvN3N2uaNkAz4ofYBacyiK2WyHyDT9ngyLp8tSWjeZGFbOmoF0W3BDkDlYXwX3VpTIJZ+YcsSwZEdMt3Bv/bBRMpMQA/9xNPI3CwSAi0RstVFxj07+gIi1LGsuJsk2b/jl3dMCKzgW1Tay5dnPtqaj86IHRo0q7xoQvbaNgR+w7yVsgKxB/IWacuKQeeETPLg933Rxu6yTs2IUMKBQcMo0hax5F0ZE7rbkdFmL/ZLiGpY8XZyvUmZopY9FEcUbV5h3nxL/LPuZ2scJugudj3FXSNl3YSRGJmA4R5MGzAA2X63PQFieUCnlxgPR6OUo1dmfRNyp385SAi1kAuPJC3SMzXKDvozf5qq6Ylfzi62xNMloAlW+RWHMbqzO9lahBMzJPLqB0rdom7LnZMlRPfK/k414LojmmVmbjxFNHNYD+0iIqRDw6lF08aX5D/eQpTa4O83K3hQHsXxNtuwB4qzBOPiBh/ou5kgKjyg4ua2wSfx/Kfy4cK2jg8aXgHJ27AcCp61qlcavCvVMorBXS9smnSnbyAxvZpBJlqcDXOwTQVmMaffPDDm0pc8cTlOBaW5Nli3JxU2pl8YzqJMVDETgFyHSePoBnaKj98VTS0IEhRmWZ3M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199015)(8936002)(41300700001)(52536014)(5660300002)(9686003)(6916009)(66476007)(26005)(76116006)(66556008)(8676002)(64756008)(66446008)(54906003)(4326008)(6506007)(7696005)(316002)(38070700005)(2906002)(66946007)(33656002)(186003)(55016003)(38100700002)(122000001)(86362001)(83380400001)(478600001)(966005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nCoWPtTFsxIfT+GaS2V+IPVKTuVyHmqi4HDv1/BSyBuy8DFNI4Dp7VVsE3?=
 =?iso-8859-1?Q?KkdXyn65qcHntIi8YAKw9OQaxuGfKoR5Nwesh6EWnKsxgn6Di7UcV1xiU+?=
 =?iso-8859-1?Q?huTc7hjHqpIhNU20gDfpbyo22gW1VtYcPxFZny4vcwCFU/Tea9oCYbSRtv?=
 =?iso-8859-1?Q?gm40v9DaYHAivLSC+tP6yj/i0jwnzE1N7vKqq6+Aztj+xwZAbe7qpBfIug?=
 =?iso-8859-1?Q?igj6vg9o/TmmbsIMtgGY3F9vYcMx5398qWMdGLjoRe4AuIvAp06otPtu4Y?=
 =?iso-8859-1?Q?PxlnxqVJR9X4yEwtx+WAiRPwg0B5In0nPuK79RqJVsU7d2eQARWCT/2ipD?=
 =?iso-8859-1?Q?X2OfvCzla0e/CX8nj5m8xs+bE6aBI8To0MYWTcVOsPTYnp0vJujrBSUtFK?=
 =?iso-8859-1?Q?IWRLWMqRMN6c7pRf6crMj4M4CRrKGV0SiHND4TfVE43ia8kHvbGE/jvy4e?=
 =?iso-8859-1?Q?T3WI39VIEhkTwkBg9P2BYX9VzSmzyMbIhjd/DIRC8hs4RaFTCOP6/6nS4s?=
 =?iso-8859-1?Q?H8YqIijZvcXLLiJCftzciI3yH0aaDRRB0ykTAS4icHBYJuN4aGQfdPTgLS?=
 =?iso-8859-1?Q?FCQfx1gNcgrJEkplqtftGpyg/u5kIosRRU/hkSJx9JWKgt3UMCZefzlsdB?=
 =?iso-8859-1?Q?IyHKvSCJ8JHaxRlkV8lzTvD3K1lzRTyt9Xfo8QofBh4vJ36zcG25WuiKs6?=
 =?iso-8859-1?Q?jwsJKPSN6gVYSM0N+8mf/XNwASooSkRWvsjEuTmU+tTMHBDTpRXnyMkPMv?=
 =?iso-8859-1?Q?PMRqzIaEIT3wSqTEGbTpaxzDvSZhOCZPS6c3x2qtHEAixJT7PP1N2O4NKN?=
 =?iso-8859-1?Q?7cduq+ZK8dlCq8A5xt/8BLuxesbobqVtXXvkwD0B3vJu5zI3jCEDmdoj+Y?=
 =?iso-8859-1?Q?nm++7QsYBmUYAK12571dCd16axAtEzXKHbMy5PVqqKc7NphUcxjHSgzT+u?=
 =?iso-8859-1?Q?p25DG51mBBpMcDZoB+wR7O5Uzzs1au25Cn50TPX3KagTTqsrxcBiUadVNh?=
 =?iso-8859-1?Q?TbK9gi+i4wCdJShmEhIeu7PVNDtEjQYzMBqmp6NmtbT1GKSr9Rp0nNyICM?=
 =?iso-8859-1?Q?zUURMQQFRZKfDSlhJ2aaRuY9UE6AU5/oiBCNhbvVkGZ+ysRBaBK9m4pNIA?=
 =?iso-8859-1?Q?tzbG5rcBYQ7x6bV/xbvkp8HByRKarqKQJAKn27uvfo0wq+UEw12j6JDVxS?=
 =?iso-8859-1?Q?JQBatxxQRPLGR0dulYwV2iKZFbwYpa60B3tDTDq+sIIi9JjMR4HgX0xHO1?=
 =?iso-8859-1?Q?cEEKNgXHE5gnycUOREXBM4XglIcKrNq8SuidmQJ3oTAxHAX0XGFfmnnt79?=
 =?iso-8859-1?Q?j50suE3P3OcbEX9AIrLsXu/r0l8v9F/gPe47Q/Btm3X6cNLyaAckd5Oqzt?=
 =?iso-8859-1?Q?KU8obnTc6LbvIFat+1hY/ntAZ6FlB1Ymfk1t9XkTAlf4DoZ2UVPHxrrha/?=
 =?iso-8859-1?Q?1G//H6KKeBk2oHc/waAw4T6hbqB5yng5UVTzgboUGDYRO9M3rPAAa0Ypsn?=
 =?iso-8859-1?Q?BWl07Si8RqButHbGgsflMBnXHPYa9/Lfw8s/pMXEDqdXnRKkwkz76Tq1YV?=
 =?iso-8859-1?Q?VZp5zPifBOBmHWd8s5niU13wVTdrMa6+x9bkVMwzWaIc0ng1zUeuzIorF6?=
 =?iso-8859-1?Q?J+qnlGQ9hkYcw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed106bb1-2297-451a-e69e-08dab64f4186
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:07:54.3753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4PiB1CtS65Xivs0T/kpCNhlyBLzvyXrULI9qUQlLUQ1JDy4lb89wanAhNs+KYr8H2YTSF1HSS0uhtWZAYPdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXx8tax8QyzPzomKhaHxbvO2237z9g2qw/bKDGdIZWU=;
 b=xWrk5hCh+UzcYX8rWTRV+X+RywyKo3IO7jJZTjrAx9GOSsse1G+1+QvbuUZ9Akiq/SRMYzb6U918Xv9MzsLOweYAF1bsaxPQnCkOu2x0PU9L9ig0YlyaJg7tVJh+gxloYZdfRUi/tWaZmA27t6d7mUqATYyRa9bvcwnxkWvnvr8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=xWrk5hCh
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 04/11] package/clang: move to llvm-project
 subfolder
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- No changes
---
 DEVELOPERS                                                 | 6 +++---
 package/Config.in                                          | 2 +-
 ...-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0
 package/{ => llvm-project}/clang/Config.in                 | 0
 package/{ => llvm-project}/clang/clang.hash                | 0
 package/{ => llvm-project}/clang/clang.mk                  | 7 +++----
 package/llvm-project/llvm-project.mk                       | 3 ++-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (100%)
 rename package/{ => llvm-project}/clang/clang.hash (100%)
 rename package/{ => llvm-project}/clang/clang.mk (96%)

diff --git a/DEVELOPERS b/DEVELOPERS
index d4bab1aa36..d516f585d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1605,10 +1605,10 @@ F:	support/testing/tests/package/test_python_aexpect.py
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
-F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
@@ -2525,7 +2525,6 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
 F:	package/bullet/
-F:	package/clang/
 F:	package/clinfo/
 F:	package/efl/
 F:	package/enet/
@@ -2544,6 +2543,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2953,9 +2953,9 @@ F:	package/gettext-tiny/
 F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
-F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 3b7d4a9448..15dd27796f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1970,7 +1970,7 @@ menu "Other"
 	source "package/capnproto/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
-	source "package/clang/Config.in"
+	source "package/llvm-project/clang/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
similarity index 100%
rename from package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
rename to package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.in
similarity index 100%
rename from package/clang/Config.in
rename to package/llvm-project/clang/Config.in
diff --git a/package/clang/clang.hash b/package/llvm-project/clang/clang.hash
similarity index 100%
rename from package/clang/clang.hash
rename to package/llvm-project/clang/clang.hash
diff --git a/package/clang/clang.mk b/package/llvm-project/clang/clang.mk
similarity index 96%
rename from package/clang/clang.mk
rename to package/llvm-project/clang/clang.mk
index 3c75f8d6b1..0943e21a8c 100644
--- a/package/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-CLANG_VERSION_MAJOR = 11
-CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
-CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_VERSION_MAJOR = $(LLVM_PROJECT_VERSION_MAJOR)
+CLANG_VERSION = $(LLVM_PROJECT_VERSION)
+CLANG_SITE = $(LLVM_PROJECT_SITE)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 7ba89bb605..747a6f5647 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION = 11.1.0
+LLVM_PROJECT_VERSION_MAJOR = 11
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
