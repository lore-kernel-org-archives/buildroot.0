Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE06CC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570BC81B25;
	Wed, 28 Sep 2022 14:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570BC81B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ur8NY07x-MNf; Wed, 28 Sep 2022 14:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7194781326;
	Wed, 28 Sep 2022 14:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7194781326
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 731CE1BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A7CD40932
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7CD40932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EKnbkJQ3Pke for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:29:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8E6540880
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8E6540880
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F44po7Vhf2PtgSEqYKet8jqydchkI+9kWiOTwjmkw2cDhYqcPgmI79cVNd8/7hxdgrK0mrIHabAWZ7KgN3hoAlQYsBH+6zNxJ+XI62x+GbXQ/uXYoQiG42IheQO+Ph1NWZZH//e3bK9pLjk+5e1GJ27Gq8HK/hDLGQIT+XHSYlF8/qObV/jt3adkgP4Tyotjlvy4Sp68PP/Zp2uKYVNF7MaoDPSPS6hbtH7aBa6+j3+2zAs0W9KUzAHvHLW7Nn1gfxQ3gnTtAPJbM+Ej/NetVVq5UkuzUf9+ZSbOocFGA+24p1GzlFEMqykG52miB+rlZdQD6qJxbQjA/iyX/vaDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P/phTPdZ3EnrUADOJRR9GUCNPF8LkzK2SyWCeMNcmk=;
 b=Rf4nT30MX+BHXWCZo//8mzfy7h2a1wT1/xtzBMxmP4IGEAEbCl8xURDJubLWque2jXAuK2whO0erU5e6UceycBxJn4Ere3Nysl8sy0sibiJ3QgSrnNbvrZeFu9iZ2AlvGoRBj6mpM/vQvwWsSQ+GLXbHWtgPbK1Vrxe2X+36WkB7RtE7qYDLb0eLsVQxiYKIEWmJnhlEhtLIcXlAhTEeetoJpZluYZeImlLGkVzi0K1zelVUrhBwCYpNp1mKOqbZHhzRSfieScUkXYdAdLhtXtAv4t7tC8gaYfPaoUGJ4wQ7/IhSIJ3R2n0xp2hAWaX58TeIXfGAWFLTiT72xV958A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM7P190MB0776.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:119::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:29:37 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:29:37 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 03/11] package/lld: move to llvm-project subfolder
Thread-Index: AQHY00W/V2lwkIXHDUKvL8ZPyYvN4Q==
Date: Wed, 28 Sep 2022 14:29:37 +0000
Message-ID: <DB6P190MB0488D334CF11B61D08A7F91A9F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM7P190MB0776:EE_
x-ms-office365-filtering-correlation-id: 6166d2a1-0679-430c-87e0-08daa15ddf10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3KEHnUDffsat0rrzw5DyIVeI5T9BWao+cfiuB7xakLbn8fxwvWOB16MbMRDfZd1GwjK17O7XFaBHobJwjGozTfHde07gIRe+Fkt3gInNmfmTfz4jVQYTPkimj4T9KSgmAjstZ9HaqwKY6lMQLpKWr0/WZqjF0+VG184AqmGxOGFWhyKbAXAmNzMCnQV8jOQ6IqPIZgcTYKNR2uBTPT4AOW7T1q0wL/EnUghO3Q2fPnMttNsZ56BufTR/SAWB0yrNALuwtHPK1sY4D3DtreP1WpC/IhKog+ui71+wDoRUFlusGnEepafYTMFgAZV5xoTl22UkLVuzFLtOmp3RGz90aPJb54u0eGhl28RRmOcHIFaBA4Vr5UiYNFJ236pEWDOE67AHkO3PKBdDuIg8QXl9QD+eUogIA1J+tHm/kBLkNVr64H+O/q/M1aWvtRDMWnvy2+oKdyjpG7lwaV8ZP0WIKANALrPQDVoJUNlYQH7IRWvQkdALDEBZt9UzJkALlFC/JpsEW/JZDvmpa0Ty0bWzXMLGDwgOqzZHbadyub+s/l0Mi0SAEQadVPXPD1ovzO0HxW1XuK7aVk+IJwWISLmBe9h0wW1LApmcZ/1rKWaTLdvoLRT8ucTr4/XPnIajK1sEbdBXYIkXZRuvNzGrlb6kVSIHL1RQD90TjNxDc8HfOWBv1R6LDl2rDtRbYzquaBkbh+dze59Q3wtM56s2eRgu7lFV/pk3Y77RnSXFEry4ViDkRrbIR/FgPfERhf096iQyi4W6YoEG+/rGBMEbY+XG9GoUbi3lcdX59Yu8u7G5JaA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(451199015)(64756008)(4326008)(8676002)(33656002)(2906002)(316002)(66446008)(66476007)(41300700001)(54906003)(6916009)(66556008)(66946007)(76116006)(91956017)(86362001)(7696005)(6506007)(26005)(9686003)(186003)(966005)(83380400001)(71200400001)(55016003)(478600001)(38070700005)(122000001)(38100700002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WPN2NwiW+Ffzj86bzAMT2fHq5IW2/gdqaGTXJTn3R7T65SlSwaoAsvehFc?=
 =?iso-8859-1?Q?47u+JXrSuKXKKuUeGeUfko2suxeqKN3DpBXy1iufXrG2J7AjvaaE5hBAM2?=
 =?iso-8859-1?Q?4j6AkysRBWSHl18oc7dBDsbUs5u2k5eC9z+ZSqyJ9DnzoM6UVwjWkHEN+H?=
 =?iso-8859-1?Q?mrkzovrCTKhwps8U01gH6+M4d4w658BCZ8JlmzFHPZk5IZPdo/ALvF5NAU?=
 =?iso-8859-1?Q?j1U8MdWXgiMmjhxM2VaBr/gQieuc1ZnkVN3FKxWvjQtYOb3dAuheZD22Tq?=
 =?iso-8859-1?Q?5l3KeJfWgvYclvzCqt8YejCWYNyYwdNunD3hRY8uQZYU2Hm04eOlHf0q68?=
 =?iso-8859-1?Q?WU8MDL796y7nHMnhpXmQrqkoetIex62eAg9jFBGORVys0IJgyLd+o52eWX?=
 =?iso-8859-1?Q?H3LbAKV10zTh8sorHIv/8CreU/7/dwNyqKLnWa1x/ygzdUynRtD/u/5TGY?=
 =?iso-8859-1?Q?5bCrxPAtLJ00peSSdOBHlQkhCWcNwNt1BtfL4ZsyeBkZjvEpVU3i3/krFA?=
 =?iso-8859-1?Q?mOJcohLscSnOX21CkfSYYUIpkDhj1QDoYBJi47cMH56kcAJpMZcFW+gc5D?=
 =?iso-8859-1?Q?toyHcPDmvmEibROekW41mICqEIRt0jZLtwmr/LjnYgXx22o+mF/CSM7Qz0?=
 =?iso-8859-1?Q?w99NShPx5M3/5f0hcJByEqBJE3DrqsuKMWO4+h9FYMxfBW/mYhXzFKytU4?=
 =?iso-8859-1?Q?QBRs0XCzImg7exY2R+3ILuNpw4PuyWt78PD4mmkb0tdooBFiNjLOQ3Pbuw?=
 =?iso-8859-1?Q?/+oNN7CEe06I5actQUzwFJ70VhSAgoWabdnc7XzCNjx22I+UAGe9zKwUiz?=
 =?iso-8859-1?Q?40hJ3TQh06xtp6wKqemAOe9hDTLIMJn7giVUqZv6ZE+Vstl4GM9tQMn4Cy?=
 =?iso-8859-1?Q?0kR4qW0jB1pe35ZiOHcwfdlOJchEs9W9peMKtlCmVi5oRSTX+PqKxMNwmH?=
 =?iso-8859-1?Q?lGpJqpZpcfvzI+a5YTamK40pX9FoygxbFhkSC7aHLrQHRc1YE9JSdIPQbn?=
 =?iso-8859-1?Q?AZMYcE/YMAV/dRHTo8j4pmI3CAKuuEn9OEmGD0dhJ6hPGR1H3fYG4/NAlk?=
 =?iso-8859-1?Q?DIZgH00k5A+WrdtvJ6qVtTu6LUKL2tE/VmRJV7es1SOZXm3d/Q8c4MeTrA?=
 =?iso-8859-1?Q?YenX0WwBA7MOrl3velNhCYB2dosPIAxBlDZtl9oskwMhbi1isjfaGkpp4m?=
 =?iso-8859-1?Q?KWPhOWMLFRRS229fMctsi74+V1b3PuJkGjl7OPBZhhV5ZBMefmQJ41WxJL?=
 =?iso-8859-1?Q?Cx2+sw0sULaIOB4jeYn3qSK9ltzPd78q8LCyBBV4Sr+05pF3IPmOgzRNVw?=
 =?iso-8859-1?Q?e+U2wjGapeqYgsojpbAlPHTuMTKMiEUDSWhtScF3JdTf3aCxhXE6loHdVG?=
 =?iso-8859-1?Q?enSCt9vf84T6M71TtZzCMJcJXVNTdvr+647hsHzvCCNFXrsz8weBlvGDIi?=
 =?iso-8859-1?Q?KHfoIQr3uq/oDmARZmeNgSY2HTwP6s7QhV0yvoaf+e/Q4hfoijCcOr8uSf?=
 =?iso-8859-1?Q?Ekp5oU5TeaAbtoEpGlbbUK38bvkVUgPgp9zMxNQpOIncYIHbrtXi6iaO0C?=
 =?iso-8859-1?Q?V3YJ9niA5T/ph/cja4ZKpyKE5RkiwzztHKdiB//cy00yZ1P6xvLTRGrHYK?=
 =?iso-8859-1?Q?Vu3qn+mu17smA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6166d2a1-0679-430c-87e0-08daa15ddf10
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:29:37.2310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQpBFa6Cce5UL/VjzfEjaDaPKNyhfe1aPwv+kguS7yB4VIXWC/snqQ/W//34XatkoYxfvV1W+qYObOjJEznrLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0776
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P/phTPdZ3EnrUADOJRR9GUCNPF8LkzK2SyWCeMNcmk=;
 b=D3M0moGOO2zV4PAvIZEdqxw7Ghs2yYI2PSIiSjVAORa9mWcryWmVaxBfk94juZswvc7ID5UGjALh/CtCNufIMmlUa8qeIKyQ+1urWFbiBUSITvKb4I21/VNoaHYvrOazOAx3Ax3IQ2WlcOQYMYsFG5XvW1pO7nJD6PamIEL9nlo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=D3M0moGO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 03/11] package/lld: move to llvm-project
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
 DEVELOPERS                                    | 2 +-
 package/Config.in.host                        | 2 +-
 package/{ => llvm-project}/lld/Config.in.host | 0
 package/{ => llvm-project}/lld/lld.hash       | 0
 package/{ => llvm-project}/lld/lld.mk         | 5 ++---
 5 files changed, 4 insertions(+), 5 deletions(-)
 rename package/{ => llvm-project}/lld/Config.in.host (100%)
 rename package/{ => llvm-project}/lld/lld.hash (100%)
 rename package/{ => llvm-project}/lld/lld.mk (87%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8fe8ca6997..fd88cd929d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1609,7 +1609,7 @@ F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
-F:	package/lld/
+F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
diff --git a/package/Config.in.host b/package/Config.in.host
index f437ef680c..cae1367a77 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -48,7 +48,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
-	source "package/lld/Config.in.host"
+	source "package/llvm-project/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/lzma-alone/Config.in.host"
diff --git a/package/lld/Config.in.host b/package/llvm-project/lld/Config.in.host
similarity index 100%
rename from package/lld/Config.in.host
rename to package/llvm-project/lld/Config.in.host
diff --git a/package/lld/lld.hash b/package/llvm-project/lld/lld.hash
similarity index 100%
rename from package/lld/lld.hash
rename to package/llvm-project/lld/lld.hash
diff --git a/package/lld/lld.mk b/package/llvm-project/lld/lld.mk
similarity index 87%
rename from package/lld/lld.mk
rename to package/llvm-project/lld/lld.mk
index 4bf903cda0..46ec3b13ff 100644
--- a/package/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 11.1.0
-LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
+LLD_VERSION = $(LLVM_PROJECT_VERSION)
+LLD_SITE = $(LLVM_PROJECT_SITE)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
