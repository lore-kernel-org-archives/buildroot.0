Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CEC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63CFE40A8F;
	Wed, 28 Sep 2022 14:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CFE40A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q98yDoyEult8; Wed, 28 Sep 2022 14:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCCD405E7;
	Wed, 28 Sep 2022 14:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCCD405E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5D9E1BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E1AC60F53
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E1AC60F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UogP-cJrD_-Q for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:30:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8518460E16
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8518460E16
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuqTqrOhxRb04qR6EAYYtqY6Sjjy4hLzUf8PIi+TmjszfvHNGEypR0BJGY+JwV/056aR0Mpy60jNKURI7jhlkj7Z601JKEEkCKTziZaQnJL3uFbiAUFLWk8CuTEzCcA+KQeVdRtsewLPxcouPqySKIVVS23T4/UXFVvHL8RMg8b/EhLHQPE0CiEkYwGxVGFfB5yk3eE2V0JZLzRIddy6zGQ7x1bfUdX19n0iypclZcM7nHUQ9PkW8NAxwq1lXV0NcdwuZjVRlUirpie75ZWUhOeoLgoAVryLsmgJNhykhPdZUKfkQDHI91cm+a1ax0FxJ2uAunkcoWq0fFiJJmli6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/X2nZEiDwocGxmEOt6gKXlivXpWjZvu6Psutt+AU1k=;
 b=eXmt0iUxUSpwIcpnjJLoMASzrRYxMojajxQ5TRQ09zeufhcZuju2KjF+/rkZcV4Ze8db9I+dimz0v2jarz9nptf5jtHesGDL9noq6JSWnIQaWGauRUnzrUqm4wNZy8Hk4EAMdJaDcoDc31DvBKdCw5t4cE1V1yPWz2bwMhZrx6v6WvMwlxGZZehoGIp+sTtulwYCvvDoLpr0pDq6Zq5L4PO711CPNtMefRiJ3OLrfENW+HwVF24f1B9qPTI6sYFapdXU+F+cuHV7iSFVN9ApVtDMM2dDvlepovomVMPAi0AOILbBVPEadAyEWD+QagidxKSurhii4ODejqlZmGFV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM7P190MB0776.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:119::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:30:32 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:30:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 05/11] package/compiler-rt: move to llvm-project subfolder
Thread-Index: AQHY00Xuq0Bo044DzUyx6qhZ/AesJw==
Date: Wed, 28 Sep 2022 14:30:32 +0000
Message-ID: <DB6P190MB048810AF47C511ED10E1B2C39F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM7P190MB0776:EE_
x-ms-office365-filtering-correlation-id: f9958ae4-229b-4f1e-3c7f-08daa15e0035
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JC7n+/y306tujJQgP7u1X14M4anZFRm9u4udZ83JfRNj3ZGH0vgm10q2pWjr4yksbALrLHdOHvDPLBFWOjCCNCFRD8Lz/ppFt8lBoSoaR2myk2ps1u9HnU8k5TtWLVscwcrf8OK7LlHZVAkuI0LKr+j6TFeYIA0Vf3IfP5ypcPdHhezoJ4Wo5EAdmDwEqgZ3dXSnPzPwmwCoxb5zjWlS2KQBAylGMHtqoAJFTr/x52ygFXoDQf89WypEOzNNVafs4iowheKHfUC8FiYHZ4wXRvoiKaJNL6HCb0DRVDAnEh3I9Q30tbya9+EGTxNSvYy79QBvbBE8ySi1fl1t1z6NVhwHCLMouMKDE9q5L6kWyIcHM0H+PZ0q2l2864CSpANO2eWXViDasKBrKN+iRnGjsbMLeoHoHj+f0PuqxIAKlJxLBpOuCjgzQaDO10RCsbvl/5Ji6YVq5Nrowa/BGmQCaDI1l+nqpDkksqPnnxTE99rJhhwj0s3pTnuGlIEYpGTZHKUGD8wcu19p7uSChvpaEVAJ5Zk9OMG46r21RS4ppNMTqftOtijlaRF39oxfld906oUnyisiD2vO2yqcJEHKczJSz2/iHY1bHL1RJBZGl/SFRywyBjuFYgyhRiCN2qHTCgDwA9A4RRYSX0VYJDdQ9dgacWg/yyCEZiObUmhb3LfqnC1sdz20yvMpYOXKtIOZr4VXP6G8Xc+wCet3FX56bRiH0zm6Blb7JrzCEVPqdGCjkObNjy/iEFEFuYNBh+3sUBQOBHDfjO+8bk4Yhte/WRZiCbzbjDV3i7LOR428b6w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(451199015)(64756008)(4326008)(8676002)(33656002)(2906002)(316002)(66446008)(66476007)(41300700001)(54906003)(6916009)(66556008)(66946007)(76116006)(91956017)(86362001)(7696005)(6506007)(26005)(9686003)(186003)(966005)(83380400001)(71200400001)(55016003)(478600001)(38070700005)(122000001)(38100700002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Zy780mB1HsLOs62B6G2gkp1rfZ2CrqVwZY7WDZ8maHA1u5somT16iapvRJ?=
 =?iso-8859-1?Q?a7uUBhwsUYQUcj3jh+xgS2iwMkIfnajAwUYzdxoZeRIfZEu6YN6nzrt48+?=
 =?iso-8859-1?Q?hiJ/gQmNaJkqvH17JSdSURpRSUKFBWPhqxuBJyOPj/K7pkXlh4p3Grxhav?=
 =?iso-8859-1?Q?Vr2k8iD2uLcDdrGs/LxSBitYyLBfL+VdvRVEdqB+zo7ey7sWnr75hMzhAc?=
 =?iso-8859-1?Q?URyg48BG9hxKeCrS7ZaNs3/ZDPOOPl21oFTwGvAjaar5lzlS/z3og2OyHe?=
 =?iso-8859-1?Q?PHEVidapG8ib8aokC1h52NHT2ES4NMQ3TZdn89ihZR1OQgwiNpXhWDrlxx?=
 =?iso-8859-1?Q?s0hlZeVzhA1K5tyFINO5uRiOJ1z8cIT63xtvPLhgTA6o2ZtQtoJCNUUkC1?=
 =?iso-8859-1?Q?ythOa7L2t6INmwTg1FNICGB+p14JEW3XcQ/rLTrhs7Ho2r74oPrP8oq2Zf?=
 =?iso-8859-1?Q?0jFGTgEJQUaKtlnBrtsMWHJopCuvUwTrJT1OwOriF2wbB2KqFrMww9bkWo?=
 =?iso-8859-1?Q?FluVXlHI4nA3Igo2gUOMdZrt1fyOBPnI6THiIhEk5LNeI2fwF3jfBilQfv?=
 =?iso-8859-1?Q?5Tl9x4+rajBCgRDoWNKf8mpCRsZm8nq49OBtFmrmvm9HcYmHhIu90K+wZU?=
 =?iso-8859-1?Q?BwTuPjcxtyfL62nVOmSSlU8mFxJ9rp2MxOVDcz41b2n9qUPy1u8jh7kxST?=
 =?iso-8859-1?Q?TzLeE56+3O4rOgMN9C6klIgdMkuqhf3PN8bbte3pM55X2e3b4fxwTVE7U2?=
 =?iso-8859-1?Q?crnPGo/kaqvKAMnykjVPHj0x9wrxlEfIkzR4llkBQXUNyxhi34r8V7YOUE?=
 =?iso-8859-1?Q?H5bwJ/JfU2A/UdTkD0DrtnIzVEzRl3I3sdqaHhdACBbjMtXbhOcqYk1mf1?=
 =?iso-8859-1?Q?drjQCxhb2ZmAMF4Yy+IWOfzTPvNkuy5PQ1TI2GwgshCWvVfz1JXAk0r5eu?=
 =?iso-8859-1?Q?MuPrw4zVSojseaWdZC4kfxs2ei6xvX301yyhJ3/5f6ZNB0QiD1hVDlMN8i?=
 =?iso-8859-1?Q?AmwGYXi2baMYCpN0CkXpgvadQ8Sczgfbx77yeHk2IphiSJ62IyI1kMYMvV?=
 =?iso-8859-1?Q?kloofZxA10z/I68dj4XRZUFIzyG4GRv0nwVClMxR/Y/uW+h2amxdWtbKAx?=
 =?iso-8859-1?Q?kRwG3SF7XH2nDA4Hxf8CUTsYNHKhqER867EkHJZfq7aQQXd2L3C4EQLto2?=
 =?iso-8859-1?Q?V8kTITE4oPa4R3E6uD8k418OLRyLttlkZA6GQIobvcTnc5cm3zJUvSBIbY?=
 =?iso-8859-1?Q?mErzSeQEEu1r2E2lN1NNr/WASPQa2mE2cxldkKPPpueQYs/eE5Wdktxupg?=
 =?iso-8859-1?Q?kxuODktKIqPK0f+35GRr1IX2gqbrwkiRrBjzOVAlHQUiKVmMIP/Hjw4arZ?=
 =?iso-8859-1?Q?B1PCbHxh4ClCaLO+8ZSOIjE+3ij6gZDGP8mAIGwWE47pwWn/vGSmmIHU46?=
 =?iso-8859-1?Q?Ssida0ClQ2rZTJ+Y9rUnTlTtAGB5lqlmFBop5xm0FB3RWYsZJNGnBqbnSu?=
 =?iso-8859-1?Q?i9C07dLIZnnM2OkSTiMbvlOr2GdE5LqH219I81NArgQLp5fSIZ72qjlgKs?=
 =?iso-8859-1?Q?7ERLT/vLH01Eq/iVXcmn+5XiZtk1Te0gJ4D1tu4OVp5bS7e5/GGCoAV+FS?=
 =?iso-8859-1?Q?JgOfwwhNTJ77U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9958ae4-229b-4f1e-3c7f-08daa15e0035
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:30:32.8208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mHVU7ywKrCQScn8gjC9JyLhlCwHQVTcYf8ui7i/GFMPz90ZlmooZT9AsB1xKmrd4zOqSS28MJrAL6fpfUplOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0776
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/X2nZEiDwocGxmEOt6gKXlivXpWjZvu6Psutt+AU1k=;
 b=SfUAPjS6wh53R3+GT93kVRQRbzYv9MdjCe4evSNkyAD7ht0ayx7CnZkJIXIqcb9fQgXwp5MTHL8FMYR3b+ULP+K72MRXuUo7/T/xFhQv4HBP9OqnKMETCLqFi0HvmPZNTRZEf3kjSBrPNJ+ydRDK/HVFHVBbVIivbKy/NLsO+Lo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=SfUAPjS6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 05/11] package/compiler-rt: move to llvm-project
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
 DEVELOPERS                                              | 2 +-
 package/Config.in                                       | 2 +-
 package/{ => llvm-project}/compiler-rt/Config.in        | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.hash | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.mk   | 6 ++----
 5 files changed, 4 insertions(+), 6 deletions(-)
 rename package/{ => llvm-project}/compiler-rt/Config.in (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.hash (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.mk (85%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0acc1eef55..493c07acd4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1966,7 +1966,6 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
-F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
@@ -2004,6 +2003,7 @@ F:	package/libssh2/
 F:	package/libtalloc/
 F:	package/libqmi/
 F:	package/lighttpd/
+F:	package/llvm-project/compiler-rt/
 F:	package/logrotate/
 F:	package/makedevs/
 F:	package/memtester/
diff --git a/package/Config.in b/package/Config.in
index 15dd27796f..1d48b1448b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1972,7 +1972,7 @@ menu "Other"
 	source "package/cereal/Config.in"
 	source "package/llvm-project/clang/Config.in"
 	source "package/cmocka/Config.in"
-	source "package/compiler-rt/Config.in"
+	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
similarity index 100%
rename from package/compiler-rt/Config.in
rename to package/llvm-project/compiler-rt/Config.in
diff --git a/package/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
similarity index 100%
rename from package/compiler-rt/compiler-rt.hash
rename to package/llvm-project/compiler-rt/compiler-rt.hash
diff --git a/package/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
similarity index 85%
rename from package/compiler-rt/compiler-rt.mk
rename to package/llvm-project/compiler-rt/compiler-rt.mk
index c8ea86e899..84add60801 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
-# tied to the version of those tools
-COMPILER_RT_VERSION = 11.1.0
+COMPILER_RT_VERSION = $(LLVM_PROJECT_VERSION)
 COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
-COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_DEPENDENCIES = host-clang llvm
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
