Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D23C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0C5418EA;
	Thu, 19 Jan 2023 10:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0C5418EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtMVoJWF2aBk; Thu, 19 Jan 2023 10:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFD6418E9;
	Thu, 19 Jan 2023 10:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEFD6418E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B26461BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A54D8196E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A54D8196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMUwVVJqvKTX for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:08:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D53B81384
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2069.outbound.protection.outlook.com [40.107.241.69])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D53B81384
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWUuvP/cdzsAKa7SPTzVXSoGrG+5w4IY6ZypGpgdFjqQyHnx55WGQ1faoskf74d9bG7U3qvN2sNBd1dXAeMEcJIIhNB5/2Z3jv2uJ6XzPngo+BagbzjoitA5H1JGUb88NvKhvRtDVdwOOxmX5apYixtFpE3rcHN4niCTwoh/sJTnnZHVdDRsb5HemDvRYPIBnwJsMLgSWM1e9vks4XMmU/BT/7+b+z687QeRsQ9AVuFXYVCytoBzlVMdRzuXXj7cISer3+vJQQBBz9OBgnoR0KMWvecIu4wXI6FEgVNMkMqctoYTzuszM4Mmna5c+KHYrEfY3sxukxR3jygZnbeVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkCXCSFwXEX9zuLn1qnS7BRRE1Cd+rSqVVYAgPURoR4=;
 b=gXOP4Q/TngsAQQU4h4Ne/BqYZDnBjvERE1JiMZdIbhO7gad5qLYxMzRYUWm75Nfifa/MvkMB6R5l6jwcaf3B/1NPCp5uyvt6j/kNLJMlWr3pB+9yHEChMQowThkGYUU/wPK+awYhRnPAFD2G03/JzBeWn5iqyLZw1GWIyzqfuLcxF/x8Vep1g4SMuvuDQEBFpnv+2JawZIKHQ2wmduksrMeaymkIGbHbzLC+YmjYuZew27xkSapJyR96ASPZCsRD4bIqzBmRgwGql6CEmBc2ea+J4QOtPQLXKwsyxIUV3aKKbIakHSCzaMAQdAyk9BmR05lS39dQJkFG4LxuRlGILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0826.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:08:52 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:08:52 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 26/45] package/libglade: switch to https download
Thread-Index: AQHZK+ys/f/XyBQBWkGYvXJpF5m0zQ==
Date: Thu, 19 Jan 2023 10:08:51 +0000
Message-ID: <VI1P190MB04932B057F4C6E103FB7D6689FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0826:EE_
x-ms-office365-filtering-correlation-id: 8ab0335a-f69f-4a19-ca35-08dafa052a65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wEw4KEpWWLeqeeWaHyVNjYxxh96cMrZfCaS3j6Ksk6nkm9N7LTGcWVYo5Mg49zJ17Uk5r9zu9uS7UC4MYG/x6xHJW6rsYw+x4roJNXkWbP9jDfIaW0yaX7BapzjgDN7188lMg1ZQN6IdSK6MO6x6obdD1xeEQRy35Yn8DL9L+NO/Ueem4FsYAyvcgKdOPK/kKNKPBZ1zgb4zchb7O0rfUM0oKfw9l70WlGwlu3JQijxLowLIf5oMCe0dDqN7mmtoDZfDVaALUYnbiPTtu3IMpZBkhBcXRf7ov1CvXG8c0Ta0u9Aa38Cho/vaHqGT+zLH5kzDtrJU6x53Q/gloZSOZIRluo21HQphB35LYAr1Bdm2MXoQ/ttvDjRXi6102tVmyPITFV2UjypczTfzW6SsZQYSsp4+soe4alaMNPcXwdFSrO3S1ujVwoy++Huq0yts4zO51og3muZIltImqh0XzMCmx3KzF4kSX85Enk9aq7Sp4/+0FoY1vtb0Dv9vXqQTO+Q/5M2iuHxB3BYb/U2al5jyo5d2fd+Qb6t1EoI8WCHcDKuY0XR9QoWZAv2ORAPlOruesjc9f8CGj6klfd+NbqhPqS2UXE5xgpUMcmHj3bLiYUKpL5MFtK+VSnbJAsDuAJHpsQ2Npje0AEWGj7k/FKZUKVIn0URbkEBPHDwiXXsIfb8RwxA8Sh6UVRBOu2xzi+/T30tPiOHGaqCWRloAAuJ9Soe5778opMcbWPg5WKA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39840400004)(366004)(451199015)(86362001)(6506007)(33656002)(966005)(478600001)(7696005)(71200400001)(8936002)(122000001)(52536014)(5660300002)(316002)(38100700002)(66556008)(66946007)(66446008)(66476007)(6916009)(8676002)(64756008)(76116006)(41300700001)(9686003)(186003)(26005)(2906002)(38070700005)(55016003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vQ5HC0S6x0pEEooVejOBcIVD5kiPWHaoyf9gEd7dKyPc0yq3szfF6r65zf?=
 =?iso-8859-1?Q?ZLe0QrMETIUxJFKZhww7jnLJqChrDv9dR1dmMykxBIUmf1PKtqLj74xe1h?=
 =?iso-8859-1?Q?iOQBqmHb2At9PWU0L2MrbC2Q5LI0q72KWOsTNgX53s7j6T27n9YjAksWEX?=
 =?iso-8859-1?Q?L5C2ZpwcREVpoW9GqyqZxX20Q0zXbcOCNA8nH4ZY4aWAWvxFuhaEYRzaRX?=
 =?iso-8859-1?Q?xJULkECPvUSijkXODvf7fOD58WfvL/39bN4VtST6S1TrWW5XC7dsCXrFIA?=
 =?iso-8859-1?Q?a2wF7k6tmfE0UVHo0nWkgs9WHFyJeNqqjb2tLkMH5OiNJlj4FD47/lchWE?=
 =?iso-8859-1?Q?QjFdTXG3frBAn/cqyQxE/my9Fk0+/HPq9E9r1mWhNF01SMpLbLK6AaSJfR?=
 =?iso-8859-1?Q?rhTX/llDjPTesvlGhaoG2r4wayEhf7Y00sPjPiWzvuceJK8b/8/Tbp8+4/?=
 =?iso-8859-1?Q?50e2ZhYTbtUi+PDcns5IfXnEaQsoamYbB7q3SEYUN5x6RHBFLHCLl6Tg3O?=
 =?iso-8859-1?Q?x24Y9Ruj98Sji4ZGMQdY+A2PUb7DOhrT9fF44/9jke5b+e4NUBmc8THBo6?=
 =?iso-8859-1?Q?onjmevS90MBexfMJsoRBNugjImafBofjtB8T8lvbMd1yPumVHA72Jpx/NV?=
 =?iso-8859-1?Q?pEX4eOExevCtIlokldnNeelHbRgbUgs8m/ddahdifecVDN6ypslqGSsG1f?=
 =?iso-8859-1?Q?1pIERZPwheOSkmC8EdVhIlxmHvMwiqvox7h+a6x5E9rQzKdgeQuHpYfpM4?=
 =?iso-8859-1?Q?Nfk66EqoBSPYbgTKGc54AA28ntndcnbvMuMw//SWZo0vFTyGLxC53FYGzq?=
 =?iso-8859-1?Q?WtgftB9RqX7v7Y4LS2WXUy8HFsV5auIGE1s+IB4BGQsL7Abc50gl60o8RC?=
 =?iso-8859-1?Q?Yhw4Kqu/WOGWmIBDUUFk4G85x5TWV57sqLO2kgamHBmXVVL2hYlT4obmh8?=
 =?iso-8859-1?Q?Gb7EGAuv+Rc09FWKrpO1/cqZV/uOBC9hq+BPSZr96DhBtczDQsJqrOSUIp?=
 =?iso-8859-1?Q?9cc9g2NHjP1Z7AQ9jAYqGgy8y5sDOvntFSrAysZ7QEuOo2E1OgWGZZGWs8?=
 =?iso-8859-1?Q?FJJX4y9dYOtZkpOxTdP9TduEM1ZMJ+EMid2D3Rg3b68QngPR4eGeQ/5cwG?=
 =?iso-8859-1?Q?jP39c+52pEveTz00TMttXlSWXXDhO0XrwSOSrrthVbS0yZ7uOthnSPm62r?=
 =?iso-8859-1?Q?/7kTQhxxiZ2Y9eyegGVkZfjPPx1rON5CtJbaWig7fzYYhwmUQ/+TNa7Ucy?=
 =?iso-8859-1?Q?RfiuIQTmONRBjuZK9NtJ4v930rt06CVB6gf81v74akVZ9/6g30CM0eQE+Q?=
 =?iso-8859-1?Q?u5mfE94Svddlf5aDJxg7YaFKURfqo0Y+hitpY5U4DFbL0F16UJU/9pEljo?=
 =?iso-8859-1?Q?AhksfBMTec4mx6fSjKEx2rvmeTAnwomZDtTOwz7ybnsAA0wJvqefSmmSNX?=
 =?iso-8859-1?Q?8yqST1odwEwJ79G+KprUBpPbZ8Fw1Jue3hfVD34qyzFc6wDv3zqXYqZ2Ji?=
 =?iso-8859-1?Q?KGy68eHEH7DFj6L5od3Lgz3+MDxML/407nIcphEUNFSvEc7guZSmRmPdyK?=
 =?iso-8859-1?Q?Z9w73LPi49SFUUtAs6Iq76sE0lrmANBpQl0Hiurzyo1ay3NDT0d5T1rOoo?=
 =?iso-8859-1?Q?MmhGHvKd+HsGM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab0335a-f69f-4a19-ca35-08dafa052a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:08:51.9284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CylXvqrNUKCYUGbdSNTczprMN6QLV2mBTZzplrQ7WGaLIenc36YoiHqU3F+ovPqLG7ZGbds4ilpfSkQUe5Ldcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0826
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkCXCSFwXEX9zuLn1qnS7BRRE1Cd+rSqVVYAgPURoR4=;
 b=ruHY+Dk4ui9cN23V9wIJOpzgSTc6tCq0ybU0v8fErNHBcPEzlSanCuEPNFnkDYq6k1QIAHBfblIJ0l4GW76He2IqkHqKXZYfrRuwCJRw/dR0zc48SkrhIBvXhI0naWNAD8heR9lp6EZF2IuZ24ItXq+K1FapIqFFueoMabBdVbU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=ruHY+Dk4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 26/45] package/libglade: switch to https download
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

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libglade/Config.in     | 2 +-
 package/libglade/libglade.hash | 2 +-
 package/libglade/libglade.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index e269a07548..c97c9becd2 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBGLADE
 	  at runtime. It doesn't require GLADE to be used, but GLADE is
 	  by far the easiest way to create the interface files.
 
-	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
+	  https://download.gnome.org/sources/libglade/
 
 comment "libglade needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
index d01c83be25..b04087e286 100644
--- a/package/libglade/libglade.hash
+++ b/package/libglade/libglade.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.sha256sum
+# From https://download.gnome.org/sources/libglade/2.6/libglade-2.6.4.sha256sum
 sha256  64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec  libglade-2.6.4.tar.bz2
 
 # Hash for license file:
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 32fa595f5a..21aed60605 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -7,7 +7,7 @@
 LIBGLADE_VERSION_MAJOR = 2.6
 LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
-LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
+LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
 LIBGLADE_LICENSE = LGPL-2.0+
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
