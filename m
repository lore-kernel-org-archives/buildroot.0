Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EC2C64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142EB41824;
	Fri, 24 Feb 2023 08:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142EB41824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7mDKNJZqnP9; Fri, 24 Feb 2023 08:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE1E541839;
	Fri, 24 Feb 2023 08:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE1E541839
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09A001BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9B1F404D1
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B1F404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORLr-YwOXXut for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6F6400C4
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::616])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B6F6400C4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqTDJCKfdG41vWLDsfSCxn1kyu+RDeJNuRZvm6Xvzf7/Gj5vXJXHy8/h+d9t9Qypw6Y/HZM78hJB1Y/qVTu+urtnIsMyOmh1EDsL+NNEdbc8i5BRfhln9G7YjIXYCy9fjqK/uFAyWlCZMuXDZLknY27XZbRo+6VGXL9+J6XFq5G9AtVBrXVTTMpzwC/V+1hZXokidEafWuRstHwvWruqCdSd/2BMHx+2xRcuEuZgycnXRM3pQLC4iJQfolmHP5RuGYoo4jDHZ+tgO9ii3KqIgqyTfhACXQgn20dBN8UM6UWFkCISEh3zP+mW+MSI0CN4S9hxalZMQHuSoDFBEs8K0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAfENuxY/BRQlxMh4Eay1IDX88ZQJS81sSvcQyHLr2w=;
 b=TVOswP5YhzhXm2kUz6jQoVaqJVnFdJB6FSbD8eN/m/iuosb2LVDJXqXl4vL5KdMaUR4VqWR9+ky+qUH7/Psjw87+26wAQtwfCgKyyYvQNM0/fu55MEp3qa80/Z7SqujRQODSbRbN3LmW1bzZ5JlOOGntGnknzn/qIM/toAqlYI9T3qCiQsPmgRjLDQmABRV2NzPMuvwgufewX3FMCUUxRuaj9GmXSKrw0acqZGte/UNa/J8rzFxvq6zHmtPmsnktkY0m7rU2+4yYmKMz4IXTCD+zm3+e0VtREStOMBr56WMqYrFKFBPaRqwR5bxagBT7c0TAeAaLHakJtzgPpbH7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0690.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:42:34 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:42:34 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/6] package/libsigc2: new package
Thread-Index: AQHZSCqEgI3QWWuRk0iepD9VFBvMLA==
Date: Fri, 24 Feb 2023 08:42:34 +0000
Message-ID: <VI1P190MB04938B61DE7C97FB5AA1DE2D9FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0690:EE_
x-ms-office365-filtering-correlation-id: ffa477b1-020a-4a53-2e97-08db16431365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yY1Rm2HOqfonX87PEL6A6KCsL0mQcQqMsVsqelHRZJgrE9Nhcepw+ilEqvJiW8CznzKqRoDyqekS6o7trm7H9fng1VMxZS+jk1nxNcCp8KjS/q2mfsMx8navbPEnxPxr/99Y1PDXyAvxFViIMDvttmMlQ9CWmCIVBJXubut4b2vnL90jgDri2ZMJeXc9RHUgzuxjJkHe3CdEvfZi19zxxOa34kVPIVj2nVhkua7ROlVJO+iBXe0jdDv15wdNPZP6HQPNLcRSPT+OlRTjZv9b8b7S660l9SHxiFgS0YVsqhbmrnvewYYbRPZsCqkLz1bkasEn/34GdULkOV9+7xhQZz3RwH6wyQHGygozDszkU78hoHyTqJHsFQDXTf1LBhfbebEWpQNKBfkL5zg5EfDLhstWXg5qUqMQcRmXEw12WO1O8lK06VG1Y8wGfh81p03s//YLRIl5pEhRCgNq6HOkJnX0aBtS0hZg95bzrZZF+4Dk/rNwn1gBp3QUMV3YtfVMdajB55XS4LDLo0R4F76ktlMr0q/wW27kpUjZzFmR3N1t7MYswFegJMVhgUXOtY0JFoQnVtuydFedaNp+GCFxwga7OkSnFh5tNQOjosAqwJ7gRte9SdyQQgvoCKXZyRwaZmTIs7166xPh75k4xFBDETXq7/wMYcJSThqLSF2ECAAuTskkNjnJ80eQx6XFY8N0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(451199018)(9686003)(6506007)(186003)(66446008)(38070700005)(2906002)(55016003)(66476007)(8676002)(66556008)(64756008)(6916009)(38100700002)(5660300002)(122000001)(52536014)(8936002)(478600001)(33656002)(76116006)(86362001)(66946007)(83380400001)(316002)(41300700001)(71200400001)(966005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Kvgl0MVjODxvwIXUaJaYEp+l+2itnDd8cTWnfNJlcCQf5/hrkK1OUhOi+x?=
 =?iso-8859-1?Q?GNZKwfBPPlF059ZnJnU156QKdePe7e1fYlHFJNGQAI1KiQvBjsGe3CapPh?=
 =?iso-8859-1?Q?hlWtjE2vdWmq2/zBVTZg5EK7hj6UJ8wIHLz4fS5OyjAG1QY5+bKaeh7xhf?=
 =?iso-8859-1?Q?5DI3PVQ9MkcI+gFtaAdXurb+q096c4vcs6RrcKd7J0eYLjD4FMqEoImB0G?=
 =?iso-8859-1?Q?RA6MMkp5Se/Kr8SI7ZMpDKFvOWYB6htVC9Jqw/AT565GA5mKIttAPs+Of4?=
 =?iso-8859-1?Q?er2rA4rIo8Y1vGzmo+MuWQiqU2wDppzrw4aq3QkYyuoIFFuYTNDP9yU0Qn?=
 =?iso-8859-1?Q?PfsMudu0SBK2+M56vhsT2Ep79rbP/u0LsfN3lZZ69bRghq2xzFV8xL0JdY?=
 =?iso-8859-1?Q?qQLdHppP5LZRpUO4PzRJrhGxp7l7cNeNOUYikRDOhM97Tb1UCqh4vsRpnu?=
 =?iso-8859-1?Q?wN3PA3OG7y8UwZRckEFCyM3kkBdqSuBlsKLb1UgdUf8TPcQ8WSIaYMt3KS?=
 =?iso-8859-1?Q?9OPj7Spl5DaoMLbTV6DECGYVtjyZXkxbmxBUeATvaGM9bvI0j6d5BiOwy6?=
 =?iso-8859-1?Q?XOSyE/itsTZ7KmiAuX3RYwKnweDw8+wb5GDy4quzip5cHj+eUHzaqJ8inK?=
 =?iso-8859-1?Q?aFT8+BZRwwb/0s9PG03vrBFW4cVhBuhlC6te6cxWkO7+UhnzM6ab0JDqBH?=
 =?iso-8859-1?Q?JNRATelGEY/Oy1Qx8+LXuKqqtfhbe3Hkw9eD4lwUS6HwrQDqB+phZQ1VAU?=
 =?iso-8859-1?Q?Ygd4hTweuO7b0h8wT7Nw5SIhIrUL0Hl74augda60GtwSns0hA8eEIct9LU?=
 =?iso-8859-1?Q?Ab6L7zk2AurBT4AyyK7P0ptijObJ8CnY/ZYi7GuMoDY5Z3pHjAwx5ELDKr?=
 =?iso-8859-1?Q?sTo4I6NK3St2sj7+HGGA9MoZTSF2Q1eYPNqTMr4ZxiJ9twahMjBjQ2aXu5?=
 =?iso-8859-1?Q?IMnYQfS0SyLCDDApeJhUQPFXORcfw0NIZnNR4iY6hKOE0PCwGzkVGoeLhn?=
 =?iso-8859-1?Q?iEFRjUdfrsHFt9XS9y9g9zPaxgOLR+icbLnFTt3mJ6cxqPeu/QAuTHtxn/?=
 =?iso-8859-1?Q?jE6wmhNs9QLYvL+KAc9YkP1OGF/N/C75rAr8TkZujKZUeA3x37zBzNQB0V?=
 =?iso-8859-1?Q?hK9YNTr5IJPuUQ7ncIVMVkqNNzmYBu6UQiYXHOpAFRbqBWNdPHMzsa/AGK?=
 =?iso-8859-1?Q?ppT+YrwdNkJmS4Q30OStTDeGtvlGCFBTKKbXHRUksDyj6sJWttXZTst5Oc?=
 =?iso-8859-1?Q?QKCFxTbDX6sEA1Aq36QAW0U1QJsVBUClh1wq5bXXdBmpsXaa3XKjDK+Ukw?=
 =?iso-8859-1?Q?igdeWIhr8fEmE62Jj6+zWAUxhBmGUBc0pvHNE7X3DPHSuDn0wi9395DbQ2?=
 =?iso-8859-1?Q?3B3sD9uHAve1vd4wy6mD3FSES/XXRGcT363MsXu4xntGvUya2rc4XqOtBP?=
 =?iso-8859-1?Q?jTAp58cnTJHzHUyApSZXB4PqEBDUoViKDVd++ZMU594cDkC/zVASfG4Rge?=
 =?iso-8859-1?Q?oZMzs54ESBu6YnMJIIqT6KKZ/T/OlvYS1Rya0whdqbg8jTcfF1OdkyGu0S?=
 =?iso-8859-1?Q?iMMdeuMJi6SrE6vnzZ01dvrNOgO7fot2e2mQVjF4+TO+fnHjxKwXKT+Ik7?=
 =?iso-8859-1?Q?ZC1LjW72NLWpVq70o9u94Firb2i7X43mgEBIhLf2OKc1s/ARIo5P1BmZ6w?=
 =?iso-8859-1?Q?kPuj3MPOOf3eYQ3w8+I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa477b1-020a-4a53-2e97-08db16431365
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:42:34.6918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bnt0JMdEU9RwqjenZVqbX2+hpiBHjmitwppFhLxgJLbRmK/UjR16rdtEWUwio5OzNVNVhfbqShUFclYdUnk8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAfENuxY/BRQlxMh4Eay1IDX88ZQJS81sSvcQyHLr2w=;
 b=5duvuv8NLD1rqG7ok/h3TdTggg8ZWZfG12iopPDRqRlp8E0ku+p601OSzpaUOsiaS1WtHvZ7S9ZH3eXpn0wX0BcR+kifUjPFAzKuMGphDLZplu8PoOpyXCxSv5kr2H6AAc8y6ZZskBYJpK37a4uvtMSt4wsPz0iXDX9kgf0D/g8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=5duvuv8N
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/6] package/libsigc2: new package
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

This is the version of libsigc needed for gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libsigc/Config.in      |  2 +-
 package/libsigc2/Config.in     | 17 +++++++++++++++++
 package/libsigc2/libsigc2.hash |  5 +++++
 package/libsigc2/libsigc2.mk   | 19 +++++++++++++++++++
 6 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 package/libsigc2/Config.in
 create mode 100644 package/libsigc2/libsigc2.hash
 create mode 100644 package/libsigc2/libsigc2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..e6fa139bd5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -642,6 +642,7 @@ F:	package/dacapo/
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/dbus-cxx/
 F:	package/libsigc/
+F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
 
 N:	Damien Lanson <damien@kal-host.com>
diff --git a/package/Config.in b/package/Config.in
index 6c5238a9b0..18327ef3d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2096,6 +2096,7 @@ menu "Other"
 	source "package/libseccomp/Config.in"
 	source "package/libshdata/Config.in"
 	source "package/libsigc/Config.in"
+	source "package/libsigc2/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libsolv/Config.in"
 	source "package/libspatialindex/Config.in"
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index 428774a3ab..4bea596579 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBSIGC
-	bool "libsigc++"
+	bool "libsigc++ (latest)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
diff --git a/package/libsigc2/Config.in b/package/libsigc2/Config.in
new file mode 100644
index 0000000000..e302e27af0
--- /dev/null
+++ b/package/libsigc2/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBSIGC2
+	bool "libsigc++ (2.x.x)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libsigc++ implements a typesafe callback system for standard
+	  C++. It allows you to define signals and to connect those
+	  signals to any callback function, either global or a member
+	  function, regardless of whether it is static or virtual.
+
+	  This is the last version before the API and ABI change
+	  introduced in 3.0.0 which requires C++17.
+
+	  https://libsigcplusplus.github.io/libsigcplusplus/
+
+comment "libsigc++ (2.x.x) needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libsigc2/libsigc2.hash b/package/libsigc2/libsigc2.hash
new file mode 100644
index 0000000000..4811213568
--- /dev/null
+++ b/package/libsigc2/libsigc2.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/libsigc++/2.12/libsigc++-2.12.0.sha256sum
+sha256  1c466d2e64b34f9b118976eb21b138c37ed124d0f61497df2a90ce6c3d9fa3b5  libsigc++-2.12.0.tar.xz
+
+# Locally calculated
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libsigc2/libsigc2.mk b/package/libsigc2/libsigc2.mk
new file mode 100644
index 0000000000..845d03ba85
--- /dev/null
+++ b/package/libsigc2/libsigc2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libsigc2
+#
+################################################################################
+
+LIBSIGC2_VERSION_MAJOR = 2.12
+LIBSIGC2_VERSION = $(LIBSIGC2_VERSION_MAJOR).0
+LIBSIGC2_SOURCE = libsigc++-$(LIBSIGC2_VERSION).tar.xz
+LIBSIGC2_SITE = https://download.gnome.org/sources/libsigc++/$(LIBSIGC2_VERSION_MAJOR)
+LIBSIGC2_INSTALL_STAGING = YES
+LIBSIGC2_LICENSE = LGPL-2.1+
+LIBSIGC2_LICENSE_FILES = COPYING
+LIBSIGC2_CONF_OPTS = \
+	-Dbuild-examples=false \
+	-Dbuild-tests=false \
+	-Dvalidation=false
+
+$(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
