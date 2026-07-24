Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA466C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 17:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7530D40B53;
	Fri, 24 Jul 2026 17:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZl_4Ca2AlWf; Fri, 24 Jul 2026 17:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA8140B54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784915003;
	bh=aylQF7tsBWhmeKjXDwHJIGYW+Q0x8oBsqLlwTW6lvRc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SNaUl88rWLHIBKM0MXb5r0zbk3zeaj4CExGsK/ey+JsZEY4NnXqR6Ac+0lpOP9x3x
	 hSqczZAf1In96TFc76irhwJjq5u0QpCRpSqOY9N+cZrLyzfyHSeeWDVXfxoAblmue0
	 92XQqcGRsZ+GARWII6kS5v9McPCNRB9LRCo8tW+brpRKqQuWaPV0cdEAnXi5STSr0K
	 RRYv31J0/B1NAY6QyUg6KELgIECo/Q3XfYOQp0zJB/XARDY4B86DVBkhz1O5DYEewc
	 yNH2cBhwmXayS25UJae1rnhosMm1dJShiCFdhJojABGLswCVtC3mz9ensGbEyZC31g
	 Ck69UgXOVWpDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA8140B54;
	Fri, 24 Jul 2026 17:43:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 603CDEB
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EAAE400BD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZO8c-hoXTWW for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 17:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E26C40083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E26C40083
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E26C40083
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:43:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FF21A4C3E5E
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 19:43:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50870)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJvb-000000006Fl-0xXd
 for buildroot@buildroot.org; Fri, 24 Jul 2026 17:43:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 19:43:18 +0200
Message-ID: <20260724174318.324344-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784914999;
 bh=6Ls6Cqt/2oQTu6VJhV3yjIn2tELt/OEpFvjR66XD5pc=;
 h=From:To:Subject:Date:From;
 b=Lep13l7ZHSF7Op+XIiSDbTRDfEMZoQfTxIfjKtAdRT3sp22vrHMNNu+tscjhZqaqT
 csI98hJ34mimb2t6FsirdkVQGxlh41VMRgW0s5Q5DaUe7tb8l9n9ZzESRCcYNi/U/K
 mqEjBnlxpT2Vrt9Hu1A2IQU/3gkop6O2U8caitfzJpXRRkvVc7OUibLWCKGVhnm8y9
 R+j82mlwB3n2tpbZxl/+Az2kQGkT969CXIYsuvSTjjbW8puhMoMYl/of784wV0ag75
 QqgA3PsrMmyzd7vKzqZqnSUgtQ61vm9CSBw8s6XvlTM4+SDUII52q9Ld+TGwoiPPuz
 u8EpsyM44xvog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lep13l7Z
Subject: [Buildroot] [PATCH 1/1] package/openconnect: bump version to 9.21
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

https://lists.infradead.org/pipermail/openconnect-devel/2026-June/005539.html
https://lists.infradead.org/pipermail/openconnect-devel/2026-June/005540.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/cfdb8a9ef706c172ea8e1a45ec6d1c631bd2288c

 ...licit-declaration-of-function-malloc.patch | 40 -------------------
 package/openconnect/openconnect.hash          |  2 +-
 package/openconnect/openconnect.mk            |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch

diff --git a/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch b/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch
deleted file mode 100644
index 4732c4fb5e..0000000000
--- a/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5185f640045df2b4f8ee7f028fc59e6f02fdf367 Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Mon, 29 Jan 2024 23:28:53 +0530
-Subject: [PATCH] Fix implicit declaration of function 'malloc'
-
-First observed on Gentoo Linux with GCC 14. This is due to GCC 14
-enabling -Werror=implicit-function-declaration by default.
-Thus resulting in errors such as:
-
-openconnect-internal.h: In function 'alloc_pkt':
-openconnect-internal.h:911:27: error: implicit declaration of function 'malloc' [-Werror=implicit-function-declaration]
-  911 |         struct pkt *pkt = malloc(alloc_len);
-      |                           ^~~~~~
-
-Plese refer gentoo bug: https://bugs.gentoo.org/923173
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-
-Upstream: https://gitlab.com/openconnect/openconnect/-/commit/5185f640045df2b4f8ee7f028fc59e6f02fdf367
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 9.12]
----
- openconnect-internal.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/openconnect-internal.h b/openconnect-internal.h
-index 21460adf6..2830d693f 100644
---- a/openconnect-internal.h
-+++ b/openconnect-internal.h
-@@ -87,6 +87,7 @@
- 
- #include <libxml/tree.h>
- #include <zlib.h>
-+#include <stdlib.h>
- 
- #ifdef _WIN32
- #ifndef _Out_cap_c_
--- 
-GitLab
-
diff --git a/package/openconnect/openconnect.hash b/package/openconnect/openconnect.hash
index 86bdaa5d4e..e18485327f 100644
--- a/package/openconnect/openconnect.hash
+++ b/package/openconnect/openconnect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2bedce3aa4dfe75e36e407e48e8e8bc91d46def5335ac9564fbf91bd4b2413e  openconnect-9.12.tar.gz
+sha256  5b32369467db6e5f317aa1ed12cfcbb81ed00bdbc765450b6bfcbdc300944a58  openconnect-9.21.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index 73716d708e..e9a3257edb 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCONNECT_VERSION = 9.12
+OPENCONNECT_VERSION = 9.21
 OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
 OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
 OPENCONNECT_LICENSE = LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
