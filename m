Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE6C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 08:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 172B581B60;
	Mon, 27 Feb 2023 08:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 172B581B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Rvoo-nmbqAl; Mon, 27 Feb 2023 08:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2358881B01;
	Mon, 27 Feb 2023 08:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2358881B01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9113B1BF36C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F17CB415E7
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17CB415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rF9spz4nJMjq for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 08:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59465415E5
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59465415E5
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 08:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COaUil6bfragYi7cAHrH/nQFFVERiPCK1y3lk56FlZiWkNzPOsBWA560/UNvnF+ROvqbUdJXnyzg2OXTA7Opa0QSUhcV/wzfta+z2rs+3gwmHmdv6pOASrh2Ej/haHXfv4b7cTRGV6Q8+ytIK5Jy4DPqhr+MKpBKGaJ+9Og8SHM8hMquYtdFpbZxBagNMsErVDZSdroE15iZNJBHtw4TUGxOwZEu1DPmFqAyUQKUuewmXn93rqUuKjnuk/ERFaMSacP9xfCu5ptiNyz3BmnQ6fhQL02g8Yo+ioQGCHcJMSXeXbr9LGGc+xLsRkKLq4sH8y8tPJYMIJOlSfMePwYG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or4LBOLW6XAaF0KUtvZ9R2It6vUSli4EzKMTQi88UFM=;
 b=n4Fx9F3Af8Jjy7S2bqqp+1OkKINK1/G7MVgefpAkE2K9Bp67UHo/DCGMMCs3F6N38RljTZAjNyJSNNBFdluAcS1ruRDzIs5+5Id4t+KjiP6cqR3U2HJob7KYzNkukmRCjG2ilTl1xAezGhmcH2LZweNJ1IXHMr9w+yAejIKD23Rrk33DCgHtOxZ56P8UmU0Crflr63TUWWfPtm1GU0M6PeJbH4OPjdE7gi33bXdTpe4L7J/1vHBSLZxqM5FZyTHH4303sLG4BRgiwUtlFUQ1TxTvh0ZlEOyKqp+ArCnr38hDrBauA8D9hugApR01I89YICNS7qPARkTNwsXVj19w5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0778.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:125::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 08:46:13 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 08:46:13 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/3] {linux,linux-headers}: bump 4.{14,19}.x /
 5.{4,10,15}.x / 6.1.x series
Thread-Index: AQHZSodQCkLqT13Y8Uy/UO+AYiBJ6Q==
Date: Mon, 27 Feb 2023 08:46:13 +0000
Message-ID: <VI1P190MB0493E6540596F3382739D57F9FAF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0778:EE_
x-ms-office365-filtering-correlation-id: 1d5244f5-6cf1-4bc0-656f-08db189f14ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: isC1pJI8akHUcqu6Kpwh0jqaZOyLPH2xUJzDK6hCAjwkxPaCjvWbfFexuQO4qwdofOoe4nFRi3qlAMMJ8ojz4qFqVj6fjrtpxtbFDDBzG1PkD7HU42PW66s1BwVdeOS1s4DKSq4XgwwoUA0/+aIIE6booJSJkkKz0IqNrWHFzKnBgNDxXuIpY96Y8V5i0E/fjCQY6793v8yfPdn4iGH7Mx8yAfEFX1eXCLWvmneSFvsW4Kkj4z3Z18JQv/6OmPx7TFDWfarkjnsbGQTWoRsmZ5+6JZNIPonp8Q6XM1GYFBi+q4rwYfatD6+YHYjOqKRh5g8jqPJn6iBE8Guwqe6xarUcRlOlIRxzyJRGUpx1TG7cz+zVCCWTZgasRZ/2bRq5RFviUjIp/wdHQoO0OcJIcvkHr8kbSJ8x093Of7XMisVTAlYQ7NdyQX/3mBYJxUr+GUygOucaT8+PTUFRAimTUuuAAjVoBpVOQadCWTvXZT9lfjRDkc6ghEwzwZ/seSSI4lf0iFGjh7czeHyWfd6X15SLaXzM/KRoqGWtHJX2t72V1aQiuxg0CIhxnF4XmjUCLrEAiBB9xvVfNcshJO3AhSvGpL+GAiVjwEwg1mT6QF0aSy3B8TKaubhkaplGmvQl5ZYSZkQDPhpB+COit2vEsdMXOmMMFy2McqY9HNaJmj8Hv2cF1hd+4wR6zC2hOCip
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(346002)(136003)(39840400004)(451199018)(33656002)(316002)(966005)(478600001)(71200400001)(5660300002)(52536014)(2906002)(8936002)(7696005)(66476007)(66446008)(64756008)(66946007)(66556008)(76116006)(8676002)(6916009)(41300700001)(122000001)(55016003)(86362001)(38100700002)(9686003)(186003)(26005)(6506007)(83380400001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?34HPkEOCqCpkmD2FxBAJSh5m46NcBAUZUCmdY1UnT/nInDavxsdpKnU240?=
 =?iso-8859-1?Q?5/4Gh2ZsCvoSxr3kCl9718gZUDnAdUBnJ2HRDHbCZ8RUWG4+StZxnuM1qD?=
 =?iso-8859-1?Q?o1s4FFLFgnor8JO7GdR5+rJaiFq8nmrOcZfWScMiOD5WOyGTFIOpmjG3cg?=
 =?iso-8859-1?Q?59JHcGe1DExAKg6zJaJVsMHWhXkzygzVF82m2rj2fYUwhrExStDmnoDgse?=
 =?iso-8859-1?Q?7fkiJzU/oPoEmnqbFsUN2o/TqmC7jgjzfAHaFT6Cf0LL5nhPLoXPRbTZ0o?=
 =?iso-8859-1?Q?jzUvJFxK4hCeFfys2pgWQ8Ts54UXaxLU5eaacFoWUkj7mD0RWnNKURBnvV?=
 =?iso-8859-1?Q?0c2pHyZQ+cNeYGcpxxMVkLzZTfczi47/s3u4nxclSRdjTzEmIvQeHYKJVN?=
 =?iso-8859-1?Q?WqDx6A95HJErO/THtYWUvlS8bv8+djHEo9ZAAj6LbXJsUOnEWT/FDl4M5p?=
 =?iso-8859-1?Q?DiHlgl2HqP8VlIvih4sxOJEiCcrBe3LyhcO8lGKjhM2WOhCYlybt2lHxR6?=
 =?iso-8859-1?Q?eB5jRXMvNPnjehDLWarQM1Z+0FwpuVpQtCPu5UrDyqCFMChf0t1dCPkD2+?=
 =?iso-8859-1?Q?KZze4jcZ7HR712F+F35ieqx2Y8Jl5gS2hntlIldriFutXtmX4Eg0Jl7F8S?=
 =?iso-8859-1?Q?ZUxnpGv52Kf0ISDwbH/fPE3IthzPV/TK44ShifEmFbUuNEvG2QvqtBCL11?=
 =?iso-8859-1?Q?YCFf4btKv3XIuVLVDqsdLOlDMgbVRCFLDKLkIVdkUrzl29tNUnXBB+SVUq?=
 =?iso-8859-1?Q?K0g6LQw/oNGDf1Fqgvwp8JMYs3nIzk138D/XujPH7f3bYdRIIPm6XdEUUE?=
 =?iso-8859-1?Q?ia+2UIl2HZnOf9ocSSuocrfjhE9GlSMbCWdnkoTCj2NswoqsabW5rbzFjC?=
 =?iso-8859-1?Q?DcyqkziXbddsRxhu1JnCH7LqbWG+om3rd1jLjFawHgikF8UGpP9K668XyL?=
 =?iso-8859-1?Q?Cz++5RS1UBqmqv0slRnO0bM1udOHNBNKVxNH3ICozFwrEmzdimEzCe9eX8?=
 =?iso-8859-1?Q?aOQlgHzGF6J6VZ7UmM9n/biJp/bCwIypqhqCu79nXF6HLjGqXEiiHC5PdD?=
 =?iso-8859-1?Q?KT30RnG0Us3DHSir50RjgKMy+TdtW3vL5zZFCZlrSSKJX0a6m0CRX4ouwx?=
 =?iso-8859-1?Q?5q3gYY8D+P9ssx4I6Y9SSsUjV/IDJaucD68OAMlgtMaezpTRNRfEdNbpql?=
 =?iso-8859-1?Q?P2r9LFjDiKz2mP+mWoINlsXt5mjYJ1ZE0hT/0Ow97igjyh1PmLAL7wWaxP?=
 =?iso-8859-1?Q?WlZeRbnMla6/voehcu6onLovl1/2vsnlUWFEDhJ0fG/kNnRpb+7p2biHAk?=
 =?iso-8859-1?Q?tfxYg9gexW1Wf9eWEgDVpeyr0FFIM6DmvHXE1uvOS+A/iaqec/XtWSAFMq?=
 =?iso-8859-1?Q?OFtsI9GmVYBWW154ScmIYplbd3seEhtT/PSBJvCMUKWF1f8naEwg3kqSs1?=
 =?iso-8859-1?Q?MK+n9tI8KT1M4h9Xqv1LGs2pgMlnsdXyuiR8YCnvfiSmx8LMciPbUhwqWW?=
 =?iso-8859-1?Q?EulctFWjjDiFlAU7/0eA3DMFHdZXNGRsLjP3TKzcYjY5JkFL1F1dIxsceI?=
 =?iso-8859-1?Q?LtLJMaDGGm6PkVThd1YN0ItHZQK6J+Pwot4Y8KIK7IPtww+FviOpuqrUup?=
 =?iso-8859-1?Q?z+RRhb3qG1nto=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5244f5-6cf1-4bc0-656f-08db189f14ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 08:46:13.3580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sXDgT26Z8Z2R86fBk0l/8+RcbrilUMqRp4lq0a2jVPVJY6Px9IKAc2ZPLqNNvAnO2DBs7bh68BMIG45a59z38g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0778
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or4LBOLW6XAaF0KUtvZ9R2It6vUSli4EzKMTQi88UFM=;
 b=kOzHC6T9exoLu2MnwWS98x+k2z9iLy/X3iiOAQSAPOxhc2nlYHVFFw39kBUVm8c7tRbFvInf1w1qmH2jorwAwRz6Ev43lW2e2bUvboL/2J9ncD6T21Tz/+CH/h6ySN/JxziQ+67NagCpm5rLmbSD9z1I4Vsd+wmiJJlgmRb/cys=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=kOzHC6T9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.1.x series
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
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 11dc5cce07..5cbef197ab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 52eb534b40..f45b244e6b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  581b0560077863c5116512c0b5fd93b97814092c80e6ebebabe88101949af7a1  linux-6.1.11.tar.xz
+sha256  a27076011efec7ad11e9ed0644f512c34cab4c5ed5ba42cfe71c83fabebe810d  linux-6.1.14.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-5.15.93.tar.xz
-sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
-sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
+sha256  348d974c143fdef8517ec703fdaa24bade12a49047848be92cb9e3253b19ef98  linux-5.15.96.tar.xz
+sha256  a2b51876befb8cc35724ed62820845f2b387d471a6cf46e8eedd0b6cb595825f  linux-5.10.170.tar.xz
+sha256  5a1e5754b4f2a4fe73b119d810ecda2ce07ecfb6f6cbbd16547c9ecd30b97627  linux-5.4.233.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
-sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
+sha256  4e1c1555c306874e0477d1af282d04a4efb285121456ab3f79519c92e406b701  linux-4.14.307.tar.xz
+sha256  64a265a193c9e3e14d1397278e2348386ef6d6043af76d693c0fbbafed345ca8  linux-4.19.274.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 18c179ec8d..ae40520c51 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.305"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.272"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.167"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.93"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.11"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.307"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.274"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.233"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.170"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.96"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.14"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
