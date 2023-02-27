Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372DCC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 08:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB53C80E36;
	Mon, 27 Feb 2023 08:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB53C80E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9DYPMuQsVX8; Mon, 27 Feb 2023 08:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03DEC80C06;
	Mon, 27 Feb 2023 08:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03DEC80C06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43A8A1BF36C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5794049A
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A5794049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOOzaliQsiBY for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 08:46:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB80040150
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::61e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB80040150
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 08:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUnfgULpdY4pIIY7KVZf1Jjyrnh+7l1V4P7cBHk8ckdNIMfKODSYrRSWUv93nnjKgicld3sS5BPvHFqNflWPDHs/Ycl/NVcqaQySBJkA3qa8NvXdUcH/Dke2O69Q606jf57NjGiydDcCg4g0PZ+tTTIbC/WNaLtwuqBhA6jIILKvne4t+lzwLhJj7koR2fqElAbwxh6WGRcs0priZtdHNca+m8Yt+C3ltp6n1jrDw7JaNOIsXVqtiVi0vf3p387AfCAuebX7yDUIp4fpqofXhsbI8nswnvmA0X5MrzZG4MP0BSY9MKb+2dEVD79rozNiQUhCz6JuyqrkJ5AriZvqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To35XxY9mXHxJMoOukB7Nvt4xvDihFM6pPBSzbNhI+s=;
 b=SIVBKLFIhBrKM118xkYBS85zGg3aFAWhHRsASpV3Hg5yM+U5sfuMsCDRddNVi5nqtBr0jgRlEJ3WuGhLHScdRiq1LMtuYO5PLN+F2CLDi3dKSa2N0LRSu+3ltUUwVpnqMTW1qclA5GvaPhYiiO4zfzthhKX9uvZXoT0rhq6trGN/ZtHFoYOmcRKodPQXX2h4IEshJX2CCPZN6fcFNriPeHS89Oid3vRC7CMY3tjFlSc6QlbcSynDDQtKLfC/MI25KVDLIUmyEJ/IpAmibgUSGsA21RUUNA3noruW7yzatcQ9pf5aWI6RE015HJptolSh1a5+sMaE02T//uzmm6MSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0778.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:125::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 08:46:19 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 08:46:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/3] {toolchain,linux-headers}: add support for 6.2
 headers
Thread-Index: AQHZSody/DSXh40E40u+sAuIPFHTzA==
Date: Mon, 27 Feb 2023 08:46:19 +0000
Message-ID: <VI1P190MB04930D7A0115CB0A9E63F3D09FAF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0778:EE_
x-ms-office365-filtering-correlation-id: eb717b41-abb0-4f1b-003b-08db189f18b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /wJ7WVSwb7u8Y5WY3CCf6SwLXjz6l3PNDT/OtT1HdCyOvmkzwbBkceoBNwQcDrNgVJothYIt+CMI+FMjU20nunVIJgMsTwT1NASxjGCQEE3up8PA6dLf1X7waKCFPSFG3vOQohRtgGEpG1SPoCrtfcDVx7p7BcdtXN8qlivpdh55DnYjqfTqSiMvu5EW52EDJKfkpVyksMsUqcrJnZ4lGkdVraAnUvMfR9ScomZTyznCiwwC3LNtfQKvJa/yTr0ei5TZIC26RL7pWcYFB2p0lUqb1Lgs9Ya3sMOeAK7ewX200KYAMt5XYonAycZlDtoPTwf3zRP+d1KbUXw6jNgErI00UVsSUcUacL4O0xQU84um//qY/RrJoN1na9ih/od5r2Ws6vMT6MteKdH/SbZsVzG7KMUa47B1FfvEUFpv1CasQ3VsYaqBlTvqjJVZ71hCcnYsvyWFDbUZUyZp6L+Di8oRJsFjFFMTSMf6Qa1su9Wg1tt/X5fWjcwuiSmtlN/0Bnlw7vO3HTsnLMgrBlKgGbjqG9wjkrEnIzmlKYF5iEDvNHIKBLSa6fsSdEKdXiZaSCUtuWu4j+7xKJ66whnMiw/OdA6ejFMEQQODy4uXnBvhBgkjYzN4JqtrnNMuC31KiHD8kOH0oVG3WjamL5R4aE6GJ+IWhRf+TzJMidNGjUITimlb+B8gxy/uNyDjYwzn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(346002)(136003)(39840400004)(451199018)(33656002)(316002)(54906003)(966005)(478600001)(71200400001)(5660300002)(52536014)(2906002)(8936002)(7696005)(66476007)(66446008)(64756008)(66946007)(66556008)(76116006)(8676002)(6916009)(4326008)(41300700001)(122000001)(55016003)(86362001)(38100700002)(9686003)(186003)(26005)(6506007)(83380400001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PoEvUDHxI//7BvVH6vgecZZVs/V4PREpCWy+seelBayV8gQyEvE109tWdZ?=
 =?iso-8859-1?Q?wPhjm1YxIjXjXI/s08KGHgwmsNib3VpmgSswvVTg6ATpCsgRoIRCu+DXXc?=
 =?iso-8859-1?Q?DfL1m3CYbaAb0CqQllKsIJRaaFofFl793NUlk9fVu2ERNB+v3PpgF3whsY?=
 =?iso-8859-1?Q?pgjEgsU/2DcFGfUHgipdho0c0wdq63lxYMbgGqAkvtBrC8+35KqSGBIfDw?=
 =?iso-8859-1?Q?EWV+I39/QhWE/RbzqiRsQBTZ7p/hYquz2vUJG2KTUV2FJ14V7iyWGdpJ0j?=
 =?iso-8859-1?Q?yq7iNyGkuWxLiwis2xi8R0ZFWf9gFl1/USxlhbLIf2nKfJzZMTQQZYwZW9?=
 =?iso-8859-1?Q?jbRh59ivyYkNTPmuNnmUpptM/s1lsbcL7tU7M/hQxherVYCKRmiQ/OAMVi?=
 =?iso-8859-1?Q?rlf0M+IdU8xe3j7gZSkFT3yzdi60rvCkBSa7yRkVE72DD96ma+k8IwjPtn?=
 =?iso-8859-1?Q?WW3AJQF31T/QUmmfCOHNUMZuwvQwEbLMGZHK/HUIEHxrcm9t9vl5QcU7E6?=
 =?iso-8859-1?Q?wygENvwzgIB8huXQWhz3iA2ggPhyvsuOLtkh61uNDe2tiF3q//2cveQDZm?=
 =?iso-8859-1?Q?lH73tsD35yj854yDoKUhY0EpQSc8UPmRXGVe4eBTbADqR2nDIrfsAlrS8f?=
 =?iso-8859-1?Q?lewX0qlHCO755jbKlRpnuMulR1jeYfnIc/eiyZ3P8NH63koUsk2C9g7FkJ?=
 =?iso-8859-1?Q?ULjfGThfa1+Vn0G44SgK/l80frG34Ssr8fWtwVjtko0a10t+yQyyGO2uKh?=
 =?iso-8859-1?Q?4TMwOeFCtUT9DUnyxccxHKERSYcmG1jI+npTKBvOvFjxBTuGcuv/08DGsN?=
 =?iso-8859-1?Q?9UNuWfPo3yW4QC5oVpbjDBm13yZmy9yqy8VXt7VPuwC3ObULznJ25orgcS?=
 =?iso-8859-1?Q?HE4SmSVFKE7waP4HI5ROMQhtMt1XgOF2+79QHz+2Kmmwod171Nt93s+eu2?=
 =?iso-8859-1?Q?A2wSFuJpkDZC3J5HAwb7Yc2CGXraifIpmwc+uYWHPHST4TUpvj8Q3tgzvS?=
 =?iso-8859-1?Q?s9uwNBgKR+r/xceSVF5Z8ij025g+g/Ecgt6q5EwfqbMDvoNahh1nYj07ML?=
 =?iso-8859-1?Q?ddMEntbrlufBqe19X7lVveV5Ln/j3FqQtXO9X9WJFqFvdOLJafK87lZ3Xd?=
 =?iso-8859-1?Q?g3QmxqACrg5esGvtWOiqoz3qvJ3T/eRykXrlx9WbEQ6uAayfOlCgvECBgw?=
 =?iso-8859-1?Q?eRsQDTE1nA9hEKqj0R3QDksNfAaNbJ023VGnVFTogFCfrGIbuY2hWv0ZTk?=
 =?iso-8859-1?Q?4zXOqOZgJGeCp+AYVOIu/tZVDOYLycsXmVbEN5OqFWT5Fe6qvMBBlKuXp+?=
 =?iso-8859-1?Q?7b0845+WqklikNUtplQYRgZua/THo0o9eCdjHEhYDYX3OYZJsXSRIHvkiJ?=
 =?iso-8859-1?Q?MVnGPRbJtRu3UlujepOpEBjc+pN0IQnuDAuaZ8J36VE+STj6boVPfGNlZG?=
 =?iso-8859-1?Q?3x7qYrZht1WNHQUzAh6+rLBTdaF0q8B3dSZsKNF3BJXJhmobYU906Z3BmQ?=
 =?iso-8859-1?Q?2BJY3pThyCOOHiwtqnOWUOhhN2GPOuf1RlkrQdkSUlupKI28PxWy8o7x1u?=
 =?iso-8859-1?Q?gn2z56w6Zzx6Oz5IHwjeLEhojqsncsQquuiIZlDjWl+cogcvFZLhLuRbYe?=
 =?iso-8859-1?Q?aPhSVvG6naTks=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb717b41-abb0-4f1b-003b-08db189f18b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 08:46:19.6076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUK7G1I/fWLBBOWDlu5jpXbXFXHBkTWgMCu5iV+Wh0mOBiRCv3qZbqNfUbasjE/ItQQ2grd50XOTSlx453a1nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0778
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To35XxY9mXHxJMoOukB7Nvt4xvDihFM6pPBSzbNhI+s=;
 b=LnzKbTJP6h2ayS83heE6W0pyiP9o0X+K9+N8sf4Gr2eRxT7+wOxksrumW/4rLDfxEcqYqFmKbfKVIDyW/6hsKE1RgAwmMoNGacnHs4iS0sG6UZAAolylpvf0KcAiRtlStGlkDP8rNpkHvdRlMPADmQmjdUAZFIhVjBZJMeNFwKc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=LnzKbTJP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.2 headers
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "thomas.de_schampheleire@nokia.com" <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index f45b244e6b..75f1342313 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  2fcc07e1c90ea4ce148f50f9beeb0dca0b6e4b379a768de8abc7a4a26f252534  linux-6.2.1.tar.xz
 sha256  a27076011efec7ad11e9ed0644f512c34cab4c5ed5ba42cfe71c83fabebe810d  linux-6.1.14.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  348d974c143fdef8517ec703fdaa24bade12a49047848be92cb9e3253b19ef98  linux-5.15.96.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae40520c51..9b4fa2bb12 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_1
+	default BR2_KERNEL_HEADERS_6_2
 	help
 	  Select the kernel version to get headers from.
 
@@ -48,6 +48,10 @@ config BR2_KERNEL_HEADERS_5_15
 config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
+config BR2_KERNEL_HEADERS_6_2
+	bool "Linux 6.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -125,8 +129,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2
+	bool "6.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1
-	bool "6.1.x or later"
+	bool "6.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0
@@ -390,6 +398,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.170"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.96"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.14"	if BR2_KERNEL_HEADERS_6_1
+	default "6.2.1"		if BR2_KERNEL_HEADERS_6_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 08e4ccad9e..80b2dbde4d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -600,6 +600,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -613,6 +617,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	default "6.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	default "5.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1c39334ddd..8f3905b8d7 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_2
+	bool "6.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_1
-	bool "6.1.x or later"
+	bool "6.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_0
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
