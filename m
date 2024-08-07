Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3D4C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 12:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81636088E;
	Wed,  7 Aug 2024 12:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5E5RG4Q7bPyw; Wed,  7 Aug 2024 12:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9382560754
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9382560754;
	Wed,  7 Aug 2024 12:48:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46E541BF342
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41424404AA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_Lqg1YS3Gyj for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 12:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 822A8404D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822A8404D0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 822A8404D0
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 12:48:50 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 31A64352117F; Wed,  7 Aug 2024 14:48:48 +0200 (CEST)
Date: Wed, 7 Aug 2024 14:48:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrNtL/si1xlTqM46@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723034928; bh=MMJg2bwdfVKVCXMWatT/Ivl8Clm4ZBdecW35bGqBTPA=;
 h=Date:From:To:Subject:From;
 b=EFxLfGUnBP29hBd54Wmi/OYl9tuiwbzRSeFAHDchx6cn7krD3VWWErVl6el+MZlRp
 /POcBWOZUJhOXGcBiGFWfLMtqUWDeN3xjd56mSIY/cp9cCmwYLR4LPqJ0emyF8Fc+8
 5JA1gzu9eL8CbyLVe1dkp+fAWLiKy5rd/+oVw9zB7tLgfplNBRmNCVm2djDqo/zbj5
 WcqhASS5+373HFgssONCO4Toe3cXTc/cDBtJOheV+DGguqyS2ZUxj6CZpIgvOFSiPm
 z3q+I07hTAKjdJVvf81PYons7BBUNz7z848vLudCzSpD6tbT0zhoRj+o4CRu5Q1++X
 f6rUHd0n54fqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=EFxLfGUn
Subject: [Buildroot] [PATCH v2] package/libjcat: fix linking,
 add missing intl library
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For musl/uClibc-ng toolchains we need to explicitely link
libintl. The problem exist since the addition of the package
in commit e52605c092d8eaa926da8720ae498a38eddb5205.

Fixes:
 - http://autobuild.buildroot.net/results/58c/58c7ecbcfab96ebbc7a20291d4712cf64094b9f7/
 - http://autobuild.buildroot.net/results/5d7/5d7c5dea0213f5a24489c397c5703c0601b2f12d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - use $(TARGET_NLS_LIBS) / $(TARGET_NLS_DEPENDENCIES) for more
   correctness (suggested by Thomas P.)

I only tested a minimal musl toolchain this time, but I think it
should work for uClibc-ng, too. 
---
 package/libjcat/libjcat.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
index e13e5dbfb7..c365c1914b 100644
--- a/package/libjcat/libjcat.mk
+++ b/package/libjcat/libjcat.mk
@@ -10,7 +10,9 @@ LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
 LIBJCAT_LICENSE = LGPL-2.1+
 LIBJCAT_LICENSE_FILES = LICENSE
 LIBJCAT_INSTALL_STAGING = YES
-LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2
+LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2 $(TARGET_NLS_DEPENDENCIES)
+
+LIBJCAT_LDFLAGS = $(TARGET_NLS_LIBS)
 
 LIBJCAT_CONF_OPTS = \
 	-Dgtkdoc=false \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
