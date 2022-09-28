Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96444C6FA8E
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E42540AD1;
	Wed, 28 Sep 2022 14:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E42540AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJo1Szv_ujs1; Wed, 28 Sep 2022 14:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 260B840ABA;
	Wed, 28 Sep 2022 14:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 260B840ABA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDD021BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A44781414
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A44781414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpgCe5wV7Nby for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:34:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C8E81404
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63C8E81404
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og9kFrlZhuXl01zAgf5pnDe8kFQj7VyDqC/M5DkCw2In0PVnA8sGQ0MU3unnZCLIQTmOhj+a/e00K+x02oZ4sTDWwC317Way1+GP8b6/l3g7+JZtjLLx5xFmyMZTFukIeH1nubA7jixjcs4ECBmnZLB6QXdrJwMUq6BTBbs3wFkZOcNTTWcnE8LpUkOpu96z3JTq0uEZACsmr9vhv8q7tm/9J/Qn+N/8PyH4ANneNeKaRoWkssBVOkem3+K1vIjSENAH+eCCt3M1/rKCYss4SlK+F4vGPRBl3zeVjchuFw6uqKBPMPix+XTSDpWw62Hyd9Q9mVMq1A9xZTII9b7ftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dliq5iudfhYA6niQJ3ZKhJEfwrg6GgmswUoRnACGJJQ=;
 b=S39KD3LYrpquiAC/fQ1RaK0tuZl5rMwItdG2RElvhzhsWzyow9UK6FvRNzmh/FBOSJoDkuQAlZXWU3mceIjLJyA+NiMjMVk8SBfieBKJ0vew7WtTTNsSNCLVMbUNngcVBECQiIQvSdbPtu6vXh9oYD+YOSFbuQNRyy13+a8xzwtdjl5poDsGLZgtehvY5/OVgztTVMnDZHcovMUNDyslUIG4Vv1JstnaJC4b2UbDrNd8NNE99zVRSaz/KhSAFcat1SdBvxZN4gRwM3uTRNMk7dNu8bk87EzGG+yGB1KiKDxD6rFRzCiVURHy0Dv/n+MC5sIFKiAdRQHi6b16OSRoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM0P190MB0673.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:197::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:34:00 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:34:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 10/11] package/libclc: move to llvm-project subfolder and
 bump to 15.0.1
Thread-Index: AQHY00ZZKrDXfjzvTEyrqNbg8Bfv9g==
Date: Wed, 28 Sep 2022 14:33:59 +0000
Message-ID: <DB6P190MB0488F79AB9E24E3D0083148A9F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM0P190MB0673:EE_
x-ms-office365-filtering-correlation-id: d99f577a-b232-4ce2-b90a-08daa15e7ba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6hJbm4a0JEsxBLlBWslmeCuYDLSKR+A+gN9hZw7pIg8HMK4yUMEC6FlsFdDGP63FfRA4F4QZ6xmddjq3tFExGs8djtWo7dZdI1gIfjsfrvVPZ6QOntUpbm074+JoN/9+Vwt1FhnO09im7AxMwAt8qRbGVcCKFgELUCZc4OwI4UxBJuhLpL9BxCjsT9V3wj4XL3UT1I7sqKbw/kw0eD/05Z9QDVsienrhAM/vWojDZLTKNnLe3ZXuKPdTcWH9WGLxbAmpKUCHaf4h4qTSN6jg0rgyBix2RSpouv0x7uyVuuIrLn/6slV+Nom98IDZhwIj801YbJW51OseJCkX32NE3Y839FSm1xfftRhXmVabLiqBpqOEeWsAjDB0JjsSNBp/yXEbEAXpVJ/OfIy7WqgphrsgcIHClBTg51yRY7AkXrxR0UzBSZOaFtYtnxD2sdRrFTX7EiMWNvogDx35iOHeUDJ3aHS7Bhc0GLzMttCg4sHqSyDRVdK8P1ItDoI9gwHg4PMVtaDRBwWh9Uh/SmOtrKDhSwOYvmn7qI0gtuGM27mGJf2HLOoYqRY0BG+tLbDMo18Iad7RfL5PCOHSwIjThHFRLSMobyVODaYj0y30Mi+rrHWCz5WZxtvMNKq/EJ1yNnJBw00/B1tSk8vo7e1jWPE5KVE95Le3wx7dUKbHmrIWhkaDAa30ZkE4FqogY/eCQ4c6P59KllwTz3vZ/eCzKkWvYb5bbm19NTgStgjfUQf2sn1VU8YmOTV9jf+TRFirfVi72HuW7R616THhpPxOGQuouimY6dF5KfPMrjkB/ms=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(33656002)(54906003)(6916009)(86362001)(122000001)(5660300002)(9686003)(38070700005)(38100700002)(186003)(478600001)(83380400001)(91956017)(26005)(52536014)(6506007)(7696005)(66946007)(4326008)(966005)(71200400001)(76116006)(8676002)(55016003)(66446008)(64756008)(66556008)(316002)(8936002)(66476007)(2906002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?imyFgMc6yN+4gpKg2zPRz4ljpZRAbXOZBhMyzq4IyMggvTwDs70reh73VT?=
 =?iso-8859-1?Q?Kg3bncqC4f710/UkJWeVjdH8ntYdDhe8TXT97EjUVyU+vQ1u5g+qHvGIrT?=
 =?iso-8859-1?Q?3J3ksjOa9JMz9QZckmdOCvba5C+/XIi7+q9IbYH1dFoIKnGBgXkSLYU7iD?=
 =?iso-8859-1?Q?9/ipi+rZUKdxmvxjFv6SxrAagHEeP9IXGH4sBRfyzLcpxiXpIGJSBeGDAr?=
 =?iso-8859-1?Q?HFLnGnXwPuLmgwHR9Dz+kRrUh/a5UfdbAK6PFX0KwcbRekbzsh6B5sz9Ey?=
 =?iso-8859-1?Q?cSUsB8e3WSaLh/Hd34P4Abqd7DhzadOw1r1UifRkMXa6gM6uFVAKuUk7Id?=
 =?iso-8859-1?Q?D0/J+Pp/hPs9gJ3ZUCh+CPkq69BCVxW2VglRZfZut2m/WVdpxIw4Lo3ZIx?=
 =?iso-8859-1?Q?5w2xzQT4eunwsfe0rzmTRky3CnwNzskgoa5YL0efm0/oKa9SRRr8yeovIZ?=
 =?iso-8859-1?Q?vss5Y4EglN53roP4S4pojtbAB2WbDnetqHCKVR/DdSP/Rvjrhd1q/F2Cx6?=
 =?iso-8859-1?Q?aGDE+pOVC4qePIWnvQ3fhAZNLUE9cugnNrT6WfIw9AzRnk+Smrul4d/BMT?=
 =?iso-8859-1?Q?oKrqfQfQk9dANZGmfFyFkedDTAOE5wHLT5BdlL6ZLqmVSJxQneCQjobrOg?=
 =?iso-8859-1?Q?BhYAzqgA2lnZz8BndPbDPONlUcIIucNJzbjVHLv6uHgjSMJoV0beTelcWU?=
 =?iso-8859-1?Q?nzYTsZDciTsLdHSte/eY1Avah3C9Ai0bVgdjGz0KQbqOX8r0OFW6dR2lOz?=
 =?iso-8859-1?Q?AYgJHAqO5OCixPXYimhAKwKlqlK2zAfVApKdqmp/cP6OozEHljQj2DPkli?=
 =?iso-8859-1?Q?g03cnsiCeN1J2SLyHA42+JLn4ESkrs6mgr0CqEUa8QMUQ3X7wKgY1q9RTF?=
 =?iso-8859-1?Q?HyPycfigdNmPoQ0GLdH8B/HlM9D0Z6E0QyFytNR2xSRG0uh/ZbDFX9iO8e?=
 =?iso-8859-1?Q?WFx8gFuBYDBzVoZNjt5VUmAPtj3dK9K4MKDmHSZYIm042H6rHhEv52X0nE?=
 =?iso-8859-1?Q?nyFZqzP20yizdcpugX4ZoI4cnw+fM/Jxw7X4ov1nXxBzv3jMc7fmFuzGf4?=
 =?iso-8859-1?Q?tuZQWuU8VarwAp37P5orz3kCO6apcCZeZ7Q1ac7n/GE5ansKKZvVqNseCM?=
 =?iso-8859-1?Q?/5cNQgDlCghYsEIUvf1IbWlCKtNlowHkMCun1RKRiCOS12J0UKEcuwD407?=
 =?iso-8859-1?Q?LjhiA082sUCKRkShQ1iyz7BrPIpIusCrzfDu3TLCOoBvWDE8aZUzmyz5rV?=
 =?iso-8859-1?Q?PN9OxNbt+CNq1EVV3v4f+QkZ0Hj9R5Et7rgjxTqKqULgSkpHig6OwvRyLJ?=
 =?iso-8859-1?Q?r70gbGV14/nXKRmHT+UtuXlVqSimB2Gak3k2KwlQXg8OnoimrUYgLUCxfR?=
 =?iso-8859-1?Q?qxHrLto9hK1apVPja01yhsK3Mdr1QhXt0ZBYLBwyq84Jk/gYspyiaNMSRd?=
 =?iso-8859-1?Q?jcBFGjlR/CnOBDBjJ/GCBv2mpyeCkaJrjgvxtXQAAktw3FYTx7DRPiklvw?=
 =?iso-8859-1?Q?oSvKxcZCuwEhLimFieNzs74oDelW3pBYU4E2AcXCSeFxEg0JfgWQqb+TQf?=
 =?iso-8859-1?Q?OfxevaZUBoOenNiE+h8AIVM9Ng00o55RHAH7f4o7Or26USxT9cq9Ayb+fh?=
 =?iso-8859-1?Q?OWwGCM43UwSq4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d99f577a-b232-4ce2-b90a-08daa15e7ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:33:59.9308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eUlbMHPtZoWHRug0cPdsm8E33G/hM+dfoxJzfdCYewqX56mjJlcvk0k7VPZ9Ad2r/QA1P3ytqHxAv7bnQhfKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dliq5iudfhYA6niQJ3ZKhJEfwrg6GgmswUoRnACGJJQ=;
 b=juLdktAQoRHroo1JIaay5dYmZVhuQRGW0mZganogHBeXD9vvmqkZD38ogGNB/c8s7t6Xu0GQfcs2jlShzYMegfHknFZw+YUsvRGYYF2Z4/1mnZ6rOYlcrTgqvDk8oxnNYnUbBxt/B8r11AgwJIRBYde6ngvKyyGA0Qecxn0O1HE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=juLdktAQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 10/11] package/libclc: move to llvm-project
 subfolder and bump to 15.0.1
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
 DEVELOPERS                                                    | 4 ++--
 .../libclc/0001-support-out-of-tree-build.patch               | 0
 package/{ => llvm-project}/libclc/Config.in                   | 0
 package/{ => llvm-project}/libclc/libclc.hash                 | 2 +-
 package/{ => llvm-project}/libclc/libclc.mk                   | 4 ++--
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (100%)
 rename package/{ => llvm-project}/libclc/libclc.hash (51%)
 rename package/{ => llvm-project}/libclc/libclc.mk (92%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 493c07acd4..facb8ce58b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2535,12 +2535,12 @@ F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libbpf/
-F:	package/libclc/
 F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2948,8 +2948,8 @@ F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clinfo/
-F:	package/libclc/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
similarity index 100%
rename from package/libclc/0001-support-out-of-tree-build.patch
rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patch
diff --git a/package/libclc/Config.in b/package/llvm-project/libclc/Config.in
similarity index 100%
rename from package/libclc/Config.in
rename to package/llvm-project/libclc/Config.in
diff --git a/package/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
similarity index 51%
rename from package/libclc/libclc.hash
rename to package/llvm-project/libclc/libclc.hash
index c496291d81..69c69a4a63 100644
--- a/package/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8f0213e52e2fcaca3dfcc438f05d0e15e9b3c96fd6b0994a802b267dc1047a1d  libclc-13.0.1.src.tar.xz
+sha256  33cf74de04df8c20f4158f808a88b991184fe9f94f7cca93f62931b0548dede1  libclc-15.0.1.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
similarity index 92%
rename from package/libclc/libclc.mk
rename to package/llvm-project/libclc/libclc.mk
index 5d246cf4f8..9f303d6d2f 100644
--- a/package/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCLC_VERSION = 13.0.1
-LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
+LIBCLC_VERSION = $(LLVM_PROJECT_VERSION)
+LIBCLC_SITE = $(LLVM_PROJECT_SITE)
 LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
