Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB001FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E8A80B5D;
	Tue, 25 Oct 2022 06:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E8A80B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS0Riz74HFba; Tue, 25 Oct 2022 06:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8063580B28;
	Tue, 25 Oct 2022 06:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8063580B28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6E471BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8438580B0D
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8438580B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqCr2tVgxbno for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:08:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D9D80AE8
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D9D80AE8
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:08:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLQaNq/tRhxhk8zreo/EZnodpmYAyhXgumcJAYvGy36b0/bPYV/6nBXlNkElGMXkH63L1GkSt2RBIOGGBJI1iXWQ4WgrcSW1FMntFbqmvFCCF0aD/4yzbpiy/Nzt9qA/51PvA/0F/mP9wgzWqcrByUPkwBmQXPMT/3TTEFHTB2Rlvz2DdDN4mQHhJMW9e7qfFnt6MzD7dbVHKiCfEaCH2ghX50+23JIdVf7BudalPtXpt0tY4/+W5ws+XBu2TUs+oIIhmQQG8Ggpn+V1qIks5DZKXx030PtoQ6r2cd9+hsiWmBAotNJB7EMkbUaZtzsSn3nK8S3VDmHw1nF/JSyffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p3T/WrL8kzOvVLrNumn7Wl5rqZo0+L/HuLQ7qYZ9qA=;
 b=UYY6HqBSy3iz7jj2RWKrdCVUk3ybZ7+KhkV1Ml6NVhr4q8SKPYRWi4bzXtAiRshkAdYLduGNjbT3xmaRGckJ7OIY60k5odQEx004Atqw6qobJknSG+fVC9MgY2PVXqByPWDBsB2qjhPb0flf38G4hbtO5RhdK1se3vPBYSc4C0unxtx4nKXJbPj+YzanfEi+hwKDR93xfSK2jAk6W0lEVli3bVKWlgOaCqMKzJS+8pYLFqR4C4eJPs/Pow0LIWCkNl9CsD3Kz4eEdTAZGcgBmbT2sfu0xsRZADEUy08I7hQPzTnxbFM/MCNfkeAwE0gb3V1nSk0UbsXFomarTKGjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1803.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:08:34 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:08:34 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 05/11] package/compiler-rt: move to llvm-project
 subfolder
Thread-Index: AQHY6DeCQcbF9woyW0Sb/EN30gvRuw==
Date: Tue, 25 Oct 2022 06:08:34 +0000
Message-ID: <VI1P190MB0493D5D425B65A666B08D6C99F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1803:EE_
x-ms-office365-filtering-correlation-id: 4abd9c9f-8e5c-441a-cfdb-08dab64f5956
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RKbDXV19qSwoMgosxjytMdWSxX+S8LDPOoCj5WnyjEfTgRkyucuCpZCatYyqJROuGZ4RqVfNPMJHVFqBMScbKsNF74GEZ6UWXGj+rUP9RO/18aTfwF8wADweEhQlUQ2WBQMak9yUvWUeTY6YT8EC01NrB8ucHSfNdvtN7CXwH3yc8yQ1OiHeFwBLTaPZbrPNBfSKLHsw9/TzloyxrhvzcWJp2jbnVdAACSNQ3rhWA7xv4r1+PXsVTR0t1+pgPINy9N0kbD/NTR3WHM615vXD8TyntsiO/PsFW/Q+qbXW0H2sRXk+nhKbX/tBtdZslov7dx2SWcEjpPe/UJ4LnRVF6K3Yf8rW9yuQoxGbhqtTTwwWf245kszUn1zgQ6wjCxwfr/ZMOsgae/uwS8HmOZBPx9vW1FsbowzT08aNbArqWwtkyzXaYo7ZxTi/69Ku7SMJ1blrGKMYiupDSpPY5T85+mN/RGVYFY2Us62v1953x6hQ/ph8stC23TX9vlpGOEJFjpEoEBUfPHdPlILUqxhH6ghTOJ6EsvNVy91PLDq23/15czGrwEJvLIagmrtflBzWVPj2A5mzAMusYujuaU4Up6s5zPAcNuYZMiFBc8tZGm2ggFDXPErQuHzBDQCPYgtCvrGy/qCY3OsIxa7RbQype5Qn1Je9ArnGbFinuOuaQFTP4J6idSu0cGULlDhSzO3Q9vgbDUFO70eflnM1OgNgLHlrat0hUA9oDYUZ4bueHY3ED99AmvUfV4jREr392YQTn+LCNkS1w5/0p1MvBKZdHd2I22AoIeDLRwLYYXGmCag=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199015)(8936002)(41300700001)(52536014)(5660300002)(9686003)(6916009)(66476007)(26005)(76116006)(66556008)(8676002)(64756008)(66446008)(54906003)(4326008)(6506007)(7696005)(316002)(38070700005)(2906002)(66946007)(33656002)(186003)(55016003)(38100700002)(122000001)(86362001)(83380400001)(478600001)(966005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tF5Azw8Xz/8In8ioPe17WxY8/H4hckJLmtb1TvBM2EdOdXPl5lPz25klii?=
 =?iso-8859-1?Q?Om838LwIdJCzfkSJstzKRxvXX6dp1EooQYpLqq944ktZOM6vsyR0l1qe9G?=
 =?iso-8859-1?Q?1miedZrdIlH8Tu4xwqSw5KVvyPnWY8rXenPh6CM8kSuq/RLs5XUfyMOotR?=
 =?iso-8859-1?Q?GZDXK9YqW8Iv4w7ttQsImqaQpzpCfqwrF56PCLkREdxSBdq0udaNNSNTtk?=
 =?iso-8859-1?Q?exZKtZO3E8wJ76psnWQIu222jch3AWhWBRLKXM9T7/+RVGWhZSKGxX8eWN?=
 =?iso-8859-1?Q?9GZR3RpbAhVxTgnLq6sbfD/aNsWiGRcY9bZb++HPPWe2GUEb6a5Izwiveu?=
 =?iso-8859-1?Q?2S5/9No46VQ6qVCTGu++3PZVmCksIVypdJijBgWi5J/ZLzblLIubN3vJFY?=
 =?iso-8859-1?Q?qASSJIXPcVoLR3fltWDneqfMdEXglOAC1CPCy3nWCtswThcMHirh+utyo0?=
 =?iso-8859-1?Q?7jZQS0g625ok4LdcKsdT2wwmmP9eWH4+jJxK9GWvZwIh4sbStOrSJa7TnX?=
 =?iso-8859-1?Q?At4V970sbvJt+YZUj3es3b8PsUveii784gqDd6Zskz/kmEK25imKDmlNzF?=
 =?iso-8859-1?Q?+FNO7V8IfVgyxNq7ATVltkAtrpofNmfA80r+a/ur6rNiv3aJUg55TfYTb1?=
 =?iso-8859-1?Q?qvTyoiIjzsKwT1duLuQQ0vwlPLXMXPcQWSov28cTRXx5Rlrkt/Uyw5HldM?=
 =?iso-8859-1?Q?Z1DHUJyoRQ/yZGG1E10xzHLemPqEUDrd4mhYqcEH8YnJigj23ReEqRF7kw?=
 =?iso-8859-1?Q?12iFl/UKOvztUSuHEUGE8H+bolLNZ1wLbE7gfO0TCwfghb9ALovUWvwiGV?=
 =?iso-8859-1?Q?VAd91w5a72t1uNP1AmyVlIJH9NgtbNgIteM9LGsaFb8zYzW/ouSrVsbtLN?=
 =?iso-8859-1?Q?VjA8LIlE2WGiTD498jIoj7RyM2FAXfSfWd49+ZfQOhmnLOyv8AZLQCnl8G?=
 =?iso-8859-1?Q?AiDR5j+LXaVWN4OdEm7uEbZDMsTcptIYtMblb3dpCg0DbZZHOKyHCXsE9g?=
 =?iso-8859-1?Q?Zkn+JPj9Fm4KDF66ucl3dN602aS/CgTTDaeSfujlb0Kh7Nl826BJiaQZ50?=
 =?iso-8859-1?Q?YUG6GriGOPnUilxIf6QwC5M9mLC/wxrvxyC41jyXxdthbEb3MN9JwwUGlX?=
 =?iso-8859-1?Q?cZQ3Sdbh/LDcagw5bppv5GzXuAWN9ripyFATkvWxqMsppE/tD/ZVD+32NM?=
 =?iso-8859-1?Q?bSJZ7BtLOs2+par4ucHhoCZqXpIlIceWVq1OlJH3cPxw63DyN/RmWnkGdB?=
 =?iso-8859-1?Q?ttnA6KcoUvvXTHBamKvxU4sTJMUgAJ3IxgFLIrj/Y2hsfYYRXk7gjjOTst?=
 =?iso-8859-1?Q?kyiYMO141sY9GnSlDWiI/DHAel4Rx8iWA7GjZXL8+I59H7UdYK+R9uOGCt?=
 =?iso-8859-1?Q?kCNzyn3FeEywT0SL9VqTFKCVblzz3/79qxkDTANFWWFSZPbiNlmd3Nmr3I?=
 =?iso-8859-1?Q?NMn9G23wlEgF3domDG/BpLCd321ssAbBmn2qu2A1gnMXXTGt4OdDY+J5O2?=
 =?iso-8859-1?Q?rcLFAPiLxi+L0Z4a3aeJ2VZ3uw7LydmJXo8WlbloCWRoXZsZ7+EyvDp6I9?=
 =?iso-8859-1?Q?uPwezJRQr7AkJHboLuo1pDetBIieO5IQoBaxkLv0C8HZgtpVpW3aDggF+N?=
 =?iso-8859-1?Q?01MEkbwFnrPKs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abd9c9f-8e5c-441a-cfdb-08dab64f5956
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:08:34.3723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5wfF0P/dSl8kqPbxeqCmNKPKWozRbpy7mqLyledXjxA6DQGZQTj89QrFgeHQN8H+FSb7SFY9bAjK9eK/z/e4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p3T/WrL8kzOvVLrNumn7Wl5rqZo0+L/HuLQ7qYZ9qA=;
 b=LpC/BuyNy8KpM9eusteaNJUq0YOEqV7jtcgJeyg9m9mUi35t3XF3qNt6j1eH56+s5po29NQKNbzb/rRasZ4Gd4RzSEt4eCf49xHPZiGCqECIIbujDL73eOZsr0bp6cSX0aeF1wYhB3aVsxbHL6PAQgRB2CJ0Gr0TJtPZOX47wvM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=LpC/BuyN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 05/11] package/compiler-rt: move to
 llvm-project subfolder
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
index d516f585d8..e6606408c0 100644
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
