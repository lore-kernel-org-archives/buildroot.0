Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6A1CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 10:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA6B608C8;
	Sun, 26 Oct 2025 10:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGxcD1j0Woag; Sun, 26 Oct 2025 10:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C3B60A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22C3B60A83;
	Sun, 26 Oct 2025 10:22:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E94215F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 903244027F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoJ_ANbx7qTw for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 10:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E27540248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E27540248
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E27540248
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:22:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E292A4C20BA
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:22:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54866)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCxtO-000000003hK-0b5Q
 for buildroot@buildroot.org; Sun, 26 Oct 2025 10:22:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 11:22:28 +0100
Message-ID: <20251026102229.1323577-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761474150;
 bh=vHSuvWrm4egOVG8dCssTVrL82RJgAxy0vMuRywhIRLw=;
 h=From:To:Subject:Date:From;
 b=H0f0USEzULX+WQBsRTy5MAxcPZh3+BMqQBhVBGvTwbdu5X8sacdLi6iMLEvfQng/r
 crpG743narQ/VxgFkI1WAC4BFBNoH9hZHiv5eVqkOqJ3TU8sM8bmxaBquJglmHX9N/
 Y1jrpsYWVni5Vrx7znYbZBTxy8WVnufJOT4CE+MSZwFenUSTDZ++6lfdtat6g7PsgH
 9A+k48X86WmdVWhyUL4Wwbu2tbcXba+c0hNdLZN9cU8pQhhUgsk9BV5n7teKqs/m+W
 vsgKYgxSVnz+jJPNBivHEZvmDCm5gQauXyTWjYGiSWAu4QjmAY2KOGqz8JZUkG0lb9
 rB0XRL9yRpgbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=H0f0USEz
Subject: [Buildroot] [PATCH 1/2] package/libiconv: fix build with gcc 15.x
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

Fixes:
https://autobuild.buildroot.net/results/387/3875466a80e57dfd96911a2166e496cf7d41bb69/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...tion-declaration-without-a-prototype.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch

diff --git a/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
new file mode 100644
index 0000000000..f859f7e014
--- /dev/null
+++ b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
@@ -0,0 +1,34 @@
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 29 Jan 2023 19:07:21 +0000 (+0100)
+Subject: Fix a clang warning "a function declaration without a prototype...".
+X-Git-Tag: v1.18~57
+X-Git-Url: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff_plain;h=e46dee2f581c1167137bcd045e114e96a9f00483
+
+Fix a clang warning "a function declaration without a prototype...".
+
+* lib/loop_wchar.h (mbrtowc): Don't declare. Drop portability to BeOS.
+
+Upstream: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff;h=e46dee2f581c1167137bcd045e114e96a9f00483
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+diff --git a/lib/loop_wchar.h b/lib/loop_wchar.h
+index b3edc29..9eb508e 100644
+--- a/lib/loop_wchar.h
++++ b/lib/loop_wchar.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011 Free Software Foundation, Inc.
++ * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011, 2023 Free Software Foundation, Inc.
+  * This file is part of the GNU LIBICONV Library.
+  *
+  * The GNU LIBICONV Library is free software; you can redistribute it
+@@ -36,7 +36,6 @@
+ # include <wchar.h>
+ # define BUF_SIZE 64  /* assume MB_LEN_MAX <= 64 */
+   /* Some systems, like BeOS, have multibyte encodings but lack mbstate_t.  */
+-  extern size_t mbrtowc ();
+ # ifdef mbstate_t
+ #  define mbrtowc(pwc, s, n, ps) (mbrtowc)(pwc, s, n, 0)
+ #  define mbsinit(ps) 1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
