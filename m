Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FAEEA3F13
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 08:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8120D813FE;
	Tue, 10 Feb 2026 08:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEzPrtm-O2HH; Tue, 10 Feb 2026 08:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7437F81545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770710523;
	bh=vNoukGwTdWOcglMn1dPhUxUdYzidXSSfxfE0Wp5jwz4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P0spQH9kJGiHFT3ZuYX9ejAd/Mdg6qBalMYAZH3GFLv7GXx3fy0BNX6lR/Ld9/vXw
	 dGRUWyJkouXHVF1VKqrJtKR2/0Ltr5g3GRoih/htY3m6fLRRzDxyweP6g9ds+VhZC0
	 LAU1ORxRRpAmznsIGwE6sgiB6J6j7WS3yYDOCO00HMRjdUNFLpBuUT/aMoLdlv58iq
	 k2hiDVe8ZHLqCHXveKIYcXXWsOg78woP2wM6kZ4n1ESNLxcElVnPZ7oHSxp81SoJ2h
	 omvGmtZFD/adveG9sphSrR49iAuzszZL4e85LOSs2ghUCV33+bJdf3MkufoBWcCnir
	 IIc7J8EhO8AkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7437F81545;
	Tue, 10 Feb 2026 08:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88FCDF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 791648156A
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pHlFJDuAHWK for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 08:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2410813FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2410813FE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2410813FE
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:01:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1098891293; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Feb 2026 08:01:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vpih0-00000003DlQ-2rdy;
 Tue, 10 Feb 2026 09:01:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 09:01:52 +0100
Message-ID: <20260210080153.767847-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=brlCsBpzQPhCY2xW60G+ukOA9P7TRqJLDiwTNr0kg+LLbnhiGUmH7y8TshKMKa+yxQWLEEPhafyKZ4pg/w2T+aCizl3wPiGqQX+a33OkMDzIr22N65mxlnp5DdO3Wol+RxH24351nUDmVgAPoILLnaIyFRtCSvHvtlsPKV3BDpcxwepDX30x1xh6HEd8qmiZmKvSwEn5a9AYOdcPjbMr2SalCN5Qho4dKh4oRkukALgAt/54VKsZvk0pGeNSuC0wODocLUvidfuanPBGi6Zv+o4IP3EgfkFF+U6w+0G76hwOZBffxJAklPJKKhIu8tVeaqmqoU7bW8Ht39vymfkyww==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=PLz63v8KR+tzX58AvXYKrX/wuZVCJsqaUrFqhB68s3g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=brlCsBpz
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/gnutls: security bump to version 3.8.12
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

Fixes the following security vulnerabilities:

CVE-2026-1584: libgnutls: Fix NULL pointer dereference in PSK binder
verification

A TLS 1.3 resumption attempt with an invalid PSK binder value in ClientHello
could lead to a denial of service attack via crashing the server.
The updated code guards against the problematic dereference.

CVE-2025-14831: libgnutls: Fix name constraint processing performance issue

Verifying certificates with pathological amounts of name constraints
could lead to a denial of service attack via resource exhaustion.
Reworked processing algorithms exhibit better performance characteristics.

For more details, see the release notes:
https://lists.gnupg.org/pipermail/gnutls-help/2026-February/004914.html

Drop now upstreamed 0001-audit-crau-fix-compilation-with-gcc-11.patch:
https://gitlab.com/gnutls/gnutls/-/commit/f5666f8f1f653cfe2bef808a9c9b61534f279ed1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dit-crau-fix-compilation-with-gcc-11.patch | 67 -------------------
 package/gnutls/gnutls.hash                    |  4 +-
 package/gnutls/gnutls.mk                      |  2 +-
 3 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch

diff --git a/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
deleted file mode 100644
index 0551d5c4fd..0000000000
--- a/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sun, 23 Nov 2025 18:17:19 +0100
-Subject: [PATCH] audit: crau: fix compilation with gcc < 11
-
-If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
-automatically detect an appropriate value for it.
-
-This autodetection is using the cpp special operator
-`__has_c_attribute` [1], introduced in gcc 11 [2].
-
-When compiling with a gcc older than version 11, the compilation fails
-with the error:
-
-    In file included from audit.h:22,
-                     from audit.c:26:
-    crau/crau.h:255:23: error: missing binary operator before token "("
-         __has_c_attribute (__maybe_unused__)
-                           ^
-
-This has been observed, for example, in Rocky Linux 8.10, which
-contains a gcc v8.5.0.
-
-The issue happens because the test for the `__has_c_attribute`
-availability and the test for the `__maybe_unused__` attribute
-are in the same directive. Those tests should be separated in
-two different directives, following the same logic described in
-the `__has_builtin` documentation [3].
-
-This issue was found in Buildroot, after updating gnutls to
-version 3.8.11 in [4].
-
-This commit fixes the issue by splitting the test in two.
-
-[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
-[2] https://gcc.gnu.org/gcc-11/changes.html#c
-[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
-[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
-
-Upstream: https://gitlab.com/gnutls/gnutls/-/merge_requests/2045
-Reported-by: Neal Frager <neal.frager@amd.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- lib/crau/crau.h | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/lib/crau/crau.h b/lib/crau/crau.h
-index 0d4f9f13e..53d33555b 100644
---- a/lib/crau/crau.h
-+++ b/lib/crau/crau.h
-@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
- # else
- 
- #  ifndef CRAU_MAYBE_UNUSED
--#   if defined(__has_c_attribute) && \
--    __has_c_attribute (__maybe_unused__)
--#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
-+#   if defined(__has_c_attribute)
-+#    if __has_c_attribute (__maybe_unused__)
-+#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
-+#    endif
- #   elif defined(__GNUC__)
- #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
- #   endif
--- 
-2.51.1
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 03297c3321..209b6aa220 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.11.tar.xz.sig
-sha256  91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20  gnutls-3.8.11.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.12.tar.xz.sig
+sha256  a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51  gnutls-3.8.12.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 9eef594cc9..0844bfe50d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).11
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
