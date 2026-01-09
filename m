Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF78D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70E3583870;
	Tue, 13 Jan 2026 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R69ipEJ0IbjX; Tue, 13 Jan 2026 19:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31FFF83705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333019;
	bh=sSojxITBkK70c9zaJWDLdv/n8y9ZT4Yj6hy1zAU5FOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PoZ4TWqFrz5T4UuR6g2mQkeeXQdNEft32JsL6FBUUGp5v8dYWfi3NgGNMG3hbzp0r
	 c7zKPh0HuTSwGJ+5W8Z557cf6P85IPvXJJUDWikK1KBnfrggODXu3xXDBJ/j0jfE9Z
	 I6ZLdGvUuYx5AtzlA/c2vxUIia4/nG1jxyJ4eJW0GwNBgCjsaqInrRkR+ZHHC1ALSi
	 4JtsnPyOc6Otr0qQfxPaL9sxAyaJibOKi82dsuJM7rqH1ERjGg9Z5ecKDFOFS6ApQD
	 Jc0Lh1b7WO4sFTS5mO9bpxtuuxNrY4z4KN62t08qbHdpySKBfB8F3DQQ0S5xhhQiGS
	 geB1ufPRmQ84Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31FFF83705;
	Tue, 13 Jan 2026 19:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 179D72CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62B0D404C7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sGMUEhc4u9y for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116F840516
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 116F840516
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10866873D9; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:33:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eb03d1724a0a23f0565034fcdaf13239910aaf79
X-Git-Newrev: a804a6975ce316ebbc6d23a3523e06fe299c00f9
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.10866873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xinetd: fix build
 w/ gcc-14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a804a6975ce316ebbc6d23a3523e06fe299c00f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Building xinetd with gcc-14 raises the following error:

cvt.c: In function 'fcvt_r':
cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
  113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
      |

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0006-libs-src-portable-fix-build-w-gcc-14.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch b/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
new file mode 100644
index 0000000000..8bfbcd6d8d
--- /dev/null
+++ b/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
@@ -0,0 +1,46 @@
+From 499087df7c0aaa01f0f64aa7aa355d2e543665bc Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 24 Dec 2025 11:36:20 +0100
+Subject: [PATCH] libs/src/portable: fix build w/ gcc-14
+
+Building xinetd with gcc-14 in Buildroot raises the following error:
+
+cvt.c: In function 'fcvt_r':
+cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
+  113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
+      |         ^~~~~~~~~~~
+
+Including "str.h" header to fix the compiler error would add a
+build-time dependency of libportable on libstr, creating a circular
+dependency chhain:
+
+  libportable -> libstr -> libsio -> libportable
+
+which results in GNU make dropping dependency edges and therefore not
+fixing the original build error.
+
+The commit keeps the existing library layering unchanged while restoring
+successful builds with modern compilers.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/xinetd-org/xinetd/pull/39
+---
+ libs/src/portable/cvt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libs/src/portable/cvt.c b/libs/src/portable/cvt.c
+index 4bd99fc80c26..4badab1cbd42 100644
+--- a/libs/src/portable/cvt.c
++++ b/libs/src/portable/cvt.c
+@@ -64,6 +64,8 @@
+ #endif
+ 
+ #ifndef HAVE_FCVT
++int strx_nprint ( char *buf, int len, const char *fmt, ... );
++
+ int
+ APPEND (FUNC_PREFIX, fcvt_r) (FLOAT_TYPE value, 
+                               int ndigit, 
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
