Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CC7CD98CE
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 12:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB16404EB;
	Thu, 11 Jun 2026 12:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsQKMuwMgNk8; Thu, 11 Jun 2026 12:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEACA404F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781181089;
	bh=eoR9QE65QvbQVA4f8c7wJWRu6nrpe7O4NvyYmt/5G4M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UkfhjuQPfZRlBN+Xbh/CbVEuHlozAHxSXhefomIxbKhH+KHD2qofooCPlJ6N8Tq8B
	 RJ1J9BHiXZgk3OGP/qGfT6tvCk0a86x4tRBcjQ0yPS5tDVz+DrMZuQn7bXqrTLpb79
	 SmlkhU4Z78ARLPEJ4Xs/sWYmGW/h6QyKpid/ITCaTjPkialuqjOkuLFmFVgbXKAhEj
	 Uhs+rqktelx/EI+nviHKht+Cc9NI80PFDVXiO9prRkffYaz7F46AG4OKpmxS5MMNcy
	 VJUPS0V59VmkRnG1yHogaOEBbhfRL2BqSxR9Fhubqmn9XP4bPIeQNnW4P/njLGehTM
	 Ll5r2sqGzA1XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEACA404F5;
	Thu, 11 Jun 2026 12:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6912012F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A7A64016F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeQMyp-Fmta0 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 12:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::4;
 helo=pr0p264cu014.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3428440092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3428440092
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3428440092
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKATzTt1nBx+fdA6jqDpj1f7B5HREn/DJdrLLfQvJ+q6WCtZQfLs0rXORJf390eo42fvRSTrBR1WE5ta6YZkQ/ekmmsZ3rioniFFlpj55Cw3qtVzAndnttjVwU9BKkBsOIwTw90zXMb41kaTOe4FOYInZ8Alj7sX3yQLRv/578h/woJhy2IYy4l0IHoROac/idGh7QeWaUz8upV8H+vs4E3u5A5wpFKKLZeJ6nNysEKudu5LZ/+EmKy6US6GWb2hYeSL7uCxc2K/3leSepcu5tILjfBH7JvRJioaeBrpS8TvOmnaWvq+dJwxq9dppB40w/3q5DKXWXgbqd0qCgaSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UJij/32g+59EZ2YcadLSfPDfRqPxcggyec8rbqh7F4=;
 b=jTAzdVAkeHI8ogWQDzNQ4bWCbyY5x3sWIBgKzJj0NpY2/wTsqgAxaMcmPD2zch4Wa25t0KKNRzL+ovAX4GjMHdEDWBeSXAXADaPnSHm9g7AnZZrLifhO9sAuw8ZQd+J79x8k/xtCQyIn0gamnRUdx8/Y0jQKsOxReazk9RaCwQ9ZC1ZWpqECFvD4rNGcKz8pEqDAok8TCX5x4PltxFeHesRSxLZ6abajlO+4BsJhT88Rfqqgm8vh4pNXCFFxg/CIpRamumREWnGfgSfX55aN00dIVR0DVKYpQakC2r9Ztv87tiRMQnshIeE6zx0GGrt65A5yxa5Zk7rrCVOUpnlvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by PARP264MB5104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 12:31:13 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0092.017; Thu, 11 Jun 2026
 12:31:13 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 2025.02.x]
 package/{gawk, gcc-initial, htop, kbd, m4, nano, qt6declarative, qt6svg,
 xkeyboard-config}: add CPE identifiers
Thread-Index: Adz5ni6lh+GncRecR/q9TP723Qqwog==
Date: Thu, 11 Jun 2026 12:31:13 +0000
Message-ID: <PAZP264MB30550823C1A042C1D597FC57F51B2@PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|PARP264MB5104:EE_
x-ms-office365-filtering-correlation-id: 8b2a5961-3403-4fca-23ce-08dec7b55383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|38070700021|56012099006|6133799003;
x-microsoft-antispam-message-info: bRF3IZUvw3GAOLE1zUYUo7QzAqFn1BskwvJKMdjspme3lPk1B4XqqCIE4mwGgmDDodVwsVeNtGetoZA6FeHWh/E/xD6gzxRcHwPXg9BfUSVuXgXbuLdT1qz3luFuVmQUgL0kEFrV42yq2589Qdvn4xxaw+6LoNocPPsw4ba3FJBFWNiExRpa5eZI4HJnPgsZj9CLDEPF0oUQO71s2vpOK2x9wFbLAGKNCds423zlxahw96yP1Sh8lZHiyPASpPtpjXJhJhcnZtLLWKycwUxODtVzR0ZUgK4fhw9YbtNVNBsQj/PExTfQnnuW/nd1TAqbGAKoImregXVIZ5JPm0kQt8E70/YvFV8GEZuiYecWomw5dlN4IrkYDeNKEorGTmUh+rTcB076a6gMgHWPjq+Ou5knZoi/a7c4eb7mMAdxb+hnHu4kCw/lqfUwDPoMPh1j0Zsr5SnZ0XoqGoO56KksUG1nRmFd9XIq07OVsrPTsRIhrgggDERGeXkgWphpgKjXJBgf8XJN4ZNZtLyM75Q5nhRQBNIK+BYp821mUaIN1yXgakhuZsf0RRmVOlakzGTPrERq2d9p7AQCu0BOZI1/fnTIMFv7YnktThkc86NV7vzAywL6Ch9bMNn9wWpf9EgBVxWXAmLzOJNzEOQaHOL+RkloxrUA24ONIFhnw5X4B0k0XQwgXz/TaWEQ4RpEDPARjnTTCauFoSWGmXy2Wg12Bvy8B/xmXDSEA1WpOnrA2PHDuLPb4iVdSFtZBZ+e1+df
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(38070700021)(56012099006)(6133799003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NaZgBdDeHtMgAuHO8HG49M6Sy0lMc6MwpDqVksAEbNmCQd8w2r4ELwQgWR?=
 =?iso-8859-1?Q?d5IljPp2IsLwviUJEDxHepZ8AyJk7OhW7G7217+uttjzfHRt6nP+a9auWL?=
 =?iso-8859-1?Q?DLbTIMzjgaVDFTjTu3+SrdL3WZeRL6f267VnK/S3b/JKhbB0DCwIj+EAiT?=
 =?iso-8859-1?Q?SerA6TpyDvf9j+/iA7ALKbyFK5XGAzfP+iqEtcObTnij6EyV+Ukiwbr7qd?=
 =?iso-8859-1?Q?4bTsLPEHfW5Ogn8eDDshNURwEFNIMetjkxQ9bf96B53fpWGgpUKOYx3QkO?=
 =?iso-8859-1?Q?OPERYrlAzY7VC7swFJ1q0JRlYs0vJNROHgin77DTfzLGqqkIxTYu2t5A6X?=
 =?iso-8859-1?Q?CE0LNf/I0CU9PyMFwYHWHbX8pDnSoprn1gyoVe4kdbsdaN5ltk1PH18d/a?=
 =?iso-8859-1?Q?2trBbiCBXTS10xJ68eJQFcQdbve4u56bESYqbH81hCrL8NwzbvD9aq1W2W?=
 =?iso-8859-1?Q?6Hm1PGcDn+Th7ED2UjMhIx1Qe0zLne2qaE+Os3XsbRw5GqQo4x2ENdrWvD?=
 =?iso-8859-1?Q?0GNarYLEvnJKBvy+LINRBeSFr2LZ8GFR/xFxqSLLWMqry9FmlVWEJ+7YNC?=
 =?iso-8859-1?Q?Ffru7hjJpTLQo4l3Oal7nMsRGYyIQlROG5rqWRz6Z28hKDg/5AVEbrNSdX?=
 =?iso-8859-1?Q?FYfxFPhQzx2nkVA3JZgUGL4j9AYPNd4KpmWD9Y8IBUVpiuko/d/UjCEHjg?=
 =?iso-8859-1?Q?nt2HFQl9FrtL7+2/sKvbMMtQYQgLj7xb4dkVztC98cgY+N5BQBgaqJrska?=
 =?iso-8859-1?Q?op+R336eQUvXLrke8AbHvhrx8U9rGZZ2EYrY4qJa9ob+fZCJbvKr4OiUA3?=
 =?iso-8859-1?Q?Q4nupcTyO2BHi8tstaqbF4arf+A3zpy4TTNRGj/BDRwYJWlABtwzsNgFMd?=
 =?iso-8859-1?Q?w63oFh7ZwZpv8wTByQN8faCMbkycKUhdzRyDgYA+hROie6p2CY1QOJK1fb?=
 =?iso-8859-1?Q?vHRSmzHAmeiyDUuh11O5WOpwQ3YUCJc64ND2GhAvwa/jpzoUlEqKQNloiP?=
 =?iso-8859-1?Q?4nXMBNATTKexBmFLHJHDbU+0RnzkQkugTvp9078w4CFKTahrJ+F2IwNALD?=
 =?iso-8859-1?Q?Dqj3Qtz4EEr71Ptk1ea3ECzYMebif3Zosw0Zi8UtgH+nY+b+u8DNVFbnFz?=
 =?iso-8859-1?Q?Olsao4c+ys63b1sMelgg4HgY97URNPBSASl/sJxIaP8d2DnvirUTw9yEYH?=
 =?iso-8859-1?Q?jGWCp5pFR14srkKm4B+rzPREpnKIjLebp4Lvefwq4eGKRE74ydkMFTR+1b?=
 =?iso-8859-1?Q?UlwkDKVAre4cEoir6+1Xf/obRxtV6mp2NiY4G2njshtPEBcMFgltG/DMGy?=
 =?iso-8859-1?Q?k3aeQt7MueWTnUnztYxu9pQT34OTSTJKjIkc86bOKKbCPwe4nbSSW4A9dt?=
 =?iso-8859-1?Q?ITUeLoJDRy49VjAbD/JaO58kAx3o0g9FbdsQ0gqndbsJfm63sTwymRTaKZ?=
 =?iso-8859-1?Q?1u9+2LrSXYCV7S5nf0Me2RzaUQ45XJgtC0+aPcV93K8tDDsh7cgq94T5yM?=
 =?iso-8859-1?Q?1siU+6f/nFvCZnOAB48yuLFjMZvt/Ug1ectaztrFZvFumNnLdleg/NezAJ?=
 =?iso-8859-1?Q?2H7MxmatlaT68sSsT9n7TREkI+BA/MeGSJrph3IYzYGnrO/UtEFywPNvSp?=
 =?iso-8859-1?Q?txhKA5Lgh8+qFL6dDAj4Ih5/JMsrGaqXtidiSBacJH1Z9Xu7DclPBRQV6v?=
 =?iso-8859-1?Q?1AFHBGNPdj8u4G089rJJWbdU/MeDfODE28mtzNb1RLw04cJ0yFYONZfDNZ?=
 =?iso-8859-1?Q?NsgBSTKdSGEWMYBgawvCiebvIpmoMD6dTIl1Ymqo1GR0H4w4fWnknsAQgA?=
 =?iso-8859-1?Q?B7f1xamFzhc8N1yLcicVNE6r4b7gfJw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2a5961-3403-4fca-23ce-08dec7b55383
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 12:31:13.6769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mflREMpSTHppGh9L71Xb0RzUCoQiyeftRgvHgZNWnqh8yBAq1FEH/udFRPc2/DevWC60nJlu5QDsdgfcp98NGhE4iZAa+lTJpBi8nSvMBQbZVO8s5ABlTRYUIQTNU2zg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB5104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UJij/32g+59EZ2YcadLSfPDfRqPxcggyec8rbqh7F4=;
 b=H062xR4VUs1TgDHcunBjOb7h1khc4heQjXxow0Em2qNl7XSQ7zk/mPebD95J3sJEvnHLSfpqFglE5b97ZZCtEe3UQ1AkNAn8oIn6f/yobxJInaqsYnidZQGGp9cTNnyxPx4L27sWpOKI7gFMk8UVmpFaUJDA69IWPDMIKqQ88ag=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=H062xR4V
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH 2025.02.x]  package/{gawk, gcc-initial, htop, kbd,
 m4, nano, qt6declarative, qt6svg, xkeyboard-config}: add CPE identifiers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

pkg-stats reports that several packages are missing CPE identifiers,
which prevents proper CVE matching.

Add the missing CPE vendor/product information for the following packages:

- gawk
- gcc-initial
- htop
- kbd
- m4
- nano
- qt6declarative
- qt6svg
- xkeyboard-config

This improves pkg-stats accuracy and allows better CVE tracking.

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
---
 package/gawk/gawk.mk                               | 1 +
 package/gcc/gcc-initial/gcc-initial.mk             | 3 +++
 package/htop/htop.mk                               | 2 +-
 package/kbd/kbd.mk                                 | 2 +-
 package/m4/m4.mk                                   | 1 +
 package/nano/nano.mk                               | 2 ++
 package/qt6/qt6declarative/qt6declarative.mk       | 3 ++-
 package/qt6/qt6svg/qt6svg.mk                       | 3 +++
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 2 ++
 9 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index fbb620be7d..c7be63a661 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -10,6 +10,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
+GAWK_CPE_ID_VENDOR = gnu

 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..5ddded0a42 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,9 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)

+GCC_INITIAL_CPE_ID_VENDOR = gnu
+GCC_INITIAL_CPE_ID_PRODUCT = gcc
+
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 4fa8e4fb5f..72d9755ef9 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,7 +12,7 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
-
+HTOP_CPE_ID_VENDOR = htop
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
 HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 953adccd0b..24516a8dbd 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -15,7 +15,7 @@ KBD_DEPENDENCIES = \
        host-pkgconf
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
-
+KBD_CPE_ID_VENDOR = kbd-project
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install

 $(eval $(autotools-package))
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 396c2bbee2..89a9989268 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,5 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
+M4_CPE_ID_VENDOR = gnu

 $(eval $(host-autotools-package))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a1b94c90d8..4fca0db80e 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -12,6 +12,8 @@ NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
 NANO_DEPENDENCIES = ncurses

+NANO_CPE_ID_VENDOR = gnu
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index edec67649f..a21aaa62f6 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -8,7 +8,8 @@ QT6DECLARATIVE_VERSION = $(QT6_VERSION)
 QT6DECLARATIVE_SITE = $(QT6_SITE)
 QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
 QT6DECLARATIVE_INSTALL_STAGING = YES
-
+QT6DECLARATIVE_CPE_ID_VENDOR = qt
+QT6DECLARATIVE_CPE_ID_PRODUCT = qtdeclarative
 QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO

 QT6DECLARATIVE_CMAKE_BACKEND = ninja
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 08570c7f9c..db0b11735a 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -12,6 +12,9 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO

 QT6SVG_CMAKE_BACKEND = ninja

+QT6SVG_CPE_ID_VENDOR = qt
+QT6SVG_CPE_ID_PRODUCT = qtsvg
+
 QT6SVG_LICENSE = \
        GPL-2.0+ or LGPL-3.0, \
        GPL-3.0 with exception (tools), \
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7c9c814d95..9c8461b23e 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,8 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING

+XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project
+
 XKEYBOARD_CONFIG_DEPENDENCIES = \
        $(BR2_PYTHON3_HOST_DEPENDENCY) \
        host-gettext \
--
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
