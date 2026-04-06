Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4505EF4EC2
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 10:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5999B40829;
	Mon,  6 Apr 2026 10:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlW0uZXsWEFO; Mon,  6 Apr 2026 10:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D4B24083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775471086;
	bh=4axnmOw8b9dob+aK3wfJHgEARBQcuRRZWVZKNkKxbhg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WLHcxRX0Famlwzb/usLzuNfL8s/6d+O5fYfaXueblMuIFvxtcV6/mKeY2C/iX5Y3i
	 nJ7ndDRJgzvYknfycW0LVAMMqB7fLWDcS25y/la/yGLLRtMGhaCEzkDze4wMerJ51C
	 7gxB7kzCb1qT01XQaLKQlBpTv7ydGSy83Blb9wdSus00QgHaFNrY07gvJJwBDn0kav
	 CfM14x0eboi5dqj3YwRa5pxj/RXlMRYMb0e08N43Ey9V5JSpMuR8FDX5Vx1u/YoCDQ
	 xRPh9Jya8J7+qh8ZIgb4z/nu7ElUfe0Hwmcur4fCn64uuL6zs/fkkyaRiuK1tJ6Utm
	 PC9FgzfFj+ibw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4B24083D;
	Mon,  6 Apr 2026 10:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8080D1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 10:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DEA440126
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 10:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyv69UYk69tb for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 10:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C7FA40084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C7FA40084
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C7FA40084
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 10:24:41 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 06F41440867;
 Mon,  6 Apr 2026 13:24:06 +0300 (IDT)
To: buildroot@buildroot.org
Date: Mon,  6 Apr 2026 13:24:31 +0300
Message-ID: <ec612e55099118043d351762107b9c1a18387130.1775471071.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1775471046;
 bh=a28JonN/NHU0PU+HhTCRKFgATQCrUJ8M3LQ8WEKIwIs=;
 h=From:To:Cc:Subject:Date:From;
 b=ObaVzZMT2aADfiml7j5dSyEsIPL/c8d2ugojOQeQ6vru8A6eoyVHkCWbZCvLZ4ZBo
 FfhCPdf7SRs2IanQDQTMX+elN03zeWSCU/IL2leXVDkP9TrC2109Yfp5m9CgFIrQbB
 1/SKsE5FQ0OZZFNh2T/B9Iv/vYpjjmkxd1DUGlRpCUDAXKzXHPlEljWMw8XieDFo42
 QslKLNgBzHAYWP5JerMCcxrEUIFJBj2tnMhBcJM/kmxsdyCsTLv6xqiRP1ynN+w+Lh
 4lDiZHJfs2lBS78mILWwscydu1cWxwUqOPwIFALYfissW8kP67gqAqkJe1UWZQEs6W
 rnGKDCn/cebkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=ObaVzZMT
Subject: [Buildroot] [PATCH] package/libcurl: fix build with wolfssl
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wolfssl requires definition of SIZEOF_LONG_LONG. Commit 3a5e071e4f9
("package/libcurl: security bump to version 8.19.0") removed
SIZEOF_LONG_LONG definitions from libcurl autotools build system,
breaking build with wolfssl.

Add a patch to restore SIZEOF_LONG_LONG.

Fixes:
https://autobuild.buildroot.org/results/54140f8139f40a708afd25cd0264b52c7a9bf332
https://autobuild.buildroot.org/results/07fa4932fe247e8e472f0f134db6ec36421303e4
https://autobuild.buildroot.org/results/c0c64b348b5fbaa77ecc117078cbad8ecb9c4941

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...fssl.m4-fix-build-with-older-wolfSSL.patch | 45 +++++++++++++++++++
 package/libcurl/libcurl.mk                    |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/libcurl/0001-m4-curl-wolfssl.m4-fix-build-with-older-wolfSSL.patch

diff --git a/package/libcurl/0001-m4-curl-wolfssl.m4-fix-build-with-older-wolfSSL.patch b/package/libcurl/0001-m4-curl-wolfssl.m4-fix-build-with-older-wolfSSL.patch
new file mode 100644
index 000000000000..02867bbe6c9f
--- /dev/null
+++ b/package/libcurl/0001-m4-curl-wolfssl.m4-fix-build-with-older-wolfSSL.patch
@@ -0,0 +1,45 @@
+From ca1c09164b20fad9dd01e670b78d2ecb32a24893 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 30 Mar 2026 17:52:23 +0300
+Subject: [PATCH] m4/curl-wolfssl.m4: fix build with older wolfSSL
+
+Commit 0159100f4f78 ("lib: use (u)int64_t instead of long long") removed
+definition of SIZEOF_LONG_LONG for wolfSSL. This breaks autotools build
+for wolfSSL version 5.7.2 at least:
+
+In file included from .../arm-buildroot-linux-gnueabi/sysroot/usr/include/wolfssl/wolfcrypt/hash.h:29,
+                 from .../arm-buildroot-linux-gnueabi/sysroot/usr/include/wolfssl/openssl/md5.h:32,
+                 from md5.c:76:
+.../arm-buildroot-linux-gnueabi/sysroot/usr/include/wolfssl/wolfcrypt/types.h:1289:10: error: #error "bad math long / long long settings"
+ 1289 |         #error "bad math long / long long settings"
+      |          ^~~~~
+.../arm-buildroot-linux-gnueabi/sysroot/usr/include/wolfssl/wolfcrypt/types.h:1291:5: error: empty enum is invalid
+ 1291 |     };
+      |     ^
+make[3]: *** [Makefile:2966: libcurl_la-md5.lo] Error 1
+
+Restore SIZEOF_LONG_LONG macro definition to fix the build.
+
+Upstream: https://github.com/curl/curl/pull/21162/
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ m4/curl-wolfssl.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/m4/curl-wolfssl.m4 b/m4/curl-wolfssl.m4
+index 48812e724d7f..19a6deaa3e19 100644
+--- a/m4/curl-wolfssl.m4
++++ b/m4/curl-wolfssl.m4
+@@ -127,6 +127,9 @@ if test "$OPT_WOLFSSL" != "no"; then
+       AC_MSG_NOTICE([detected wolfSSL])
+       check_for_ca_bundle=1
+ 
++      dnl wolfssl/wolfcrypt/types.h needs SIZEOF_LONG_LONG defined!
++      CURL_SIZEOF(long long)
++
+       LIBS="$addlib $LIBS"
+ 
+       dnl is this wolfSSL providing the original QUIC API?
+-- 
+2.53.0
+
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3d00a4a33a8e..9ba13ba63f19 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -15,6 +15,9 @@ LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
 
+# 0001-m4-curl-wolfssl.m4-fix-build-with-older-wolfSSL.patch
+LIBCURL_AUTORECONF = YES
+
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
