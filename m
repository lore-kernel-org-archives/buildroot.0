Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8131FCFC518
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D58B383B67;
	Sun, 23 Nov 2025 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbSlqW3U5eAb; Sun, 23 Nov 2025 17:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2E380ED0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2E380ED0;
	Sun, 23 Nov 2025 17:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F037534E
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D67EB402B0
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCzZjM1b2_bM for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A95540028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A95540028
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A95540028
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:40:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BDE705FFAA;
 Sun, 23 Nov 2025 18:40:10 +0100 (CET)
To: buildroot@buildroot.org
Cc: Neal Frager <neal.frager@amd.com>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 23 Nov 2025 18:39:52 +0100
Message-ID: <20251123173952.837145-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763919613;
 bh=g0V7vvzTN9y5amRI2O2BkzcU645NRPvQTzDRBP72/fM=;
 h=From:To:Cc:Subject:Date:From;
 b=VrVTa2czy9aOYSM7hixOWmcL63rxgA+th5+WAhiJFGdFlt2NVneQH0e0JvJTSROEH
 vIAewmIdR9ZjY08sDJm//K+eijEm6qnsuvlHsxUrGCVt/cRXG6gN5CWjNL6a5tCxO7
 5WuIUjvBdERL78pNWPRoET+dEo+el1+vjXC4Sy7duxMhIsL5FG4w1px7S3DGTaxZda
 tty64VSERcSASXKwVm45n9Aooc/HS4i+7V01NPMbiuVNmprvgM2PujZ3Kugl2mk4qP
 JyHD3VxE8w5iZzGddcyQjSymfkJKar6cSLWL5sOF2xePWEdHp1xWoolWUNdDs2OPoV
 jpMt5oXIwwgYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VrVTa2cz
Subject: [Buildroot] [PATCH 1/1] package/gnutls: add patch to fix build with
 gcc < 11
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] (package/gnutls: security bump to
version 3.8.11), gnutls fails to build with gcc or host-gcc
version < 11, with error:

    In file included from audit.h:22,
                     from audit.c:26:
    crau/crau.h:255:23: error: missing binary operator before token "("
         __has_c_attribute (__maybe_unused__)

This commit adds a patch fixing the issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548

Reported-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Neal,

Could you test on your side if this patch fixes your issue?
---
 ...dit-crau-fix-compilation-with-gcc-11.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch

diff --git a/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
new file mode 100644
index 0000000000..0551d5c4fd
--- /dev/null
+++ b/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
@@ -0,0 +1,67 @@
+From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 23 Nov 2025 18:17:19 +0100
+Subject: [PATCH] audit: crau: fix compilation with gcc < 11
+
+If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
+automatically detect an appropriate value for it.
+
+This autodetection is using the cpp special operator
+`__has_c_attribute` [1], introduced in gcc 11 [2].
+
+When compiling with a gcc older than version 11, the compilation fails
+with the error:
+
+    In file included from audit.h:22,
+                     from audit.c:26:
+    crau/crau.h:255:23: error: missing binary operator before token "("
+         __has_c_attribute (__maybe_unused__)
+                           ^
+
+This has been observed, for example, in Rocky Linux 8.10, which
+contains a gcc v8.5.0.
+
+The issue happens because the test for the `__has_c_attribute`
+availability and the test for the `__maybe_unused__` attribute
+are in the same directive. Those tests should be separated in
+two different directives, following the same logic described in
+the `__has_builtin` documentation [3].
+
+This issue was found in Buildroot, after updating gnutls to
+version 3.8.11 in [4].
+
+This commit fixes the issue by splitting the test in two.
+
+[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
+[2] https://gcc.gnu.org/gcc-11/changes.html#c
+[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
+[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
+
+Upstream: https://gitlab.com/gnutls/gnutls/-/merge_requests/2045
+Reported-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ lib/crau/crau.h | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/crau/crau.h b/lib/crau/crau.h
+index 0d4f9f13e..53d33555b 100644
+--- a/lib/crau/crau.h
++++ b/lib/crau/crau.h
+@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
+ # else
+ 
+ #  ifndef CRAU_MAYBE_UNUSED
+-#   if defined(__has_c_attribute) && \
+-    __has_c_attribute (__maybe_unused__)
+-#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#   if defined(__has_c_attribute)
++#    if __has_c_attribute (__maybe_unused__)
++#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#    endif
+ #   elif defined(__GNUC__)
+ #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
+ #   endif
+-- 
+2.51.1
+
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
