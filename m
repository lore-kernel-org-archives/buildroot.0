Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F4CF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C4CD61B47;
	Tue, 14 Apr 2026 16:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfvB3Gq7lC1f; Tue, 14 Apr 2026 16:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AA161B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776182873;
	bh=1tf8sRsFybMVy5jWFM0ewoQYNe6Okj+4uIyqIBd7VoU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aISCZmNpjp9jhjPFTa2lD/Tlmr9695Y7BPkGUe3ziRAExiVm6lxJLwQSxvnjjGXkG
	 SaHVMyW5zR89JnSvyhHa694mLLLM6wY9KBeEZc8V3gqN/K1kr7JYgU0GVZ+qglLk2m
	 AAMts/bU+HN3zeiWjBlpRNMPA/nMEyQWYpDi83r34n/oCPW46Q3xdXhF5LNeo6Y7Kr
	 lTEs/3wAVTVSFFVNc3qfKFX5nL0z/4RJbw56wPfVMfHJAo+w0yVAednOE478Cfh5z/
	 zLxBU0HBA4Ru+XzilxXht1zlqXjbFE6Sgg73D/JT5LXYIE47CQL3x/tsZtbjf71s0/
	 K9Xq66daJVxbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AA161B7E;
	Tue, 14 Apr 2026 16:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03FD3283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDCEF40088
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K7BB2nXb53m for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAF1D40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAF1D40055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAF1D40055
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 743D1A4C059A;
 Tue, 14 Apr 2026 18:07:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgI8-000000003ZX-2HuN;
 Tue, 14 Apr 2026 16:07:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitar Tomov <dimi@tpm.dev>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 14 Apr 2026 18:07:08 +0200
Message-ID: <20260414160708.2041081-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414160708.2041081-1-bernd@kuhls.net>
References: <20260414160708.2041081-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776182835;
 bh=5NAYi1ZTEPIBo/6grVYO8NATZKQG0mLW0Bt03MHQmjw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=q8im5fJF3+RsTMmtOtOSx3TC+wonUdfGG7zmn9ditlmXIhgHJ3Lkk40enrtFvXqYE
 A6moWv2Y82KKCHhg6u/hdxixP2nsnLyCFc96IiZkMIJwMZu3+rTCoHv4GPlY57OM77
 fg7rCcWWcHi+7LQ+r71dm4kChL05zFQ7fObxDnvMzPoqTx7LfnxbAZEEUpsPSYTv6l
 ml0lLM9hKvhvW1VFT2hSNS7a533wZ66cgWwbV7/axHNhULhRb1kaPdw/sT/zH7BNzm
 6Qhr7rxncZgrMeOe7sNpWHCX2+OdHE0SMHRA1Gkgp4zzfhKBXVzv0RjHznEfvG1bWb
 cl2ydFEB1KcKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=q8im5fJF
Subject: [Buildroot] [PATCH 5/5] package/wolfssl: security bump version to
 5.9.1
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

https://github.com/wolfSSL/wolfssl/blob/v5.9.1-stable/ChangeLog.md

Restored patch 0001 to its original state.

Updated license hashes due to upstream commits:

"updating license from GPLv2 to GPLv3"
https://github.com/wolfSSL/wolfssl/commit/629c5b4cf61ac717d40678b5cd65974b42077af6

"Add GPLv2 exception list to LICENSING"
https://github.com/wolfSSL/wolfssl/commit/e02de78507778128d989febb54086f343307a47d

with various follow-up commits:
https://github.com/wolfSSL/wolfssl/commit/0d49df7735316cdcf9ddb5a145ea6269b11364b6
https://github.com/wolfSSL/wolfssl/commit/32d33f2a53d9a15b49694f12205dee8c0199db9d
https://github.com/wolfSSL/wolfssl/commit/1e9d71af429218f1cd03ec9e21ca89470119462a
https://github.com/wolfSSL/wolfssl/commit/18332faa054b58e4fe4673c041b2fbfd379247a7

Fixes the following CVEs:

* [High] CVE-2026-5264
* [High] CVE-2026-5263
* [High] CVE-2026-5295
* [High] CVE-2026-5466
* [High] CVE-2026-5477
* [High] CVE-2026-5447
* [High] CVE-2026-5500
* [High] CVE-2026-5501
* [High] CVE-2026-5503
* [Low] CVE-2026-5187
* [Low] CVE-2026-5188
* [Low] CVE-2026-5448
* [Low] CVE-2026-5772
* [Low] CVE-2026-5778
* [High] CVE-2026-3548
* [High] CVE-2026-3549
* [High] CVE-2026-3547
* [Low] CVE-2026-0819
* [Low] CVE-2026-1005
* [Low] CVE-2026-2645
* [Low] CVE-2026-3230
* [Low] CVE-2025-12888
* [Med.] CVE-2025-11936
* [Low] CVE-2025-11935
* [Low] CVE-2025-11934
* [Low] CVE-2025-11933
* [Low] CVE-2025-11931
* [Low] CVE-2025-11932
* [Low] CVE-2025-12889
* [Low] CVE-2025-13912
* [High] CVE-2025-7395
* [Med.] CVE-2025-7394
* [Low] CVE-2025-7396

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...E_LIMITS_H-in-options.h-rather-than-config.patch | 13 ++++++-------
 package/wolfssl/wolfssl.hash                        |  6 +++---
 package/wolfssl/wolfssl.mk                          |  4 ++--
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
index 67f9672c2a..0599f9d615 100644
--- a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
+++ b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
@@ -7,7 +7,6 @@ Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
 
 Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
 
-[Bernd: rebased for 5.7.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  cmake/config.in    | 3 ---
@@ -33,7 +32,7 @@ diff --git a/cmake/options.h.in b/cmake/options.h.in
 index 985b54241d6..c46ada8045d 100644
 --- a/cmake/options.h.in
 +++ b/cmake/options.h.in
-@@ -31,6 +31,9 @@ extern "C" {
+@@ -33,6 +33,9 @@ extern "C" {
  #endif
  
  #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
@@ -47,12 +46,12 @@ diff --git a/configure.ac b/configure.ac
 index bce600f2ecc..c5cf9f320c7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -116,7 +116,9 @@
-     AM_CCASFLAGS="$AM_CCASFLAGS -DWOLFSSL_EXPERIMENTAL_SETTINGS"
- fi
+@@ -185,7 +185,9 @@ AC_ARG_ENABLE([freebsdkm-crypto-register],
+     [ENABLED_BSDKM_REGISTER=no]
+     )
  
--AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
-+AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
+-AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
++AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
 +# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
 +AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
  AC_CHECK_LIB([network],[socket])
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 9a1e8bfd4a..e1ecd5f98a 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  0f2ed82e345b833242705bbc4b08a2a2037a33f7bf9c610efae6464f6b10e305  wolfssl-5.7.2.tar.gz
+sha256  d5ca7af48cd2d9a91d539e9baedeba55a0605a28d7ac8b01dc3d5254a13ca341  wolfssl-5.9.1.tar.gz
 
 # Hash for license files:
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  b23c1da1f85d699d3288d73c952b4cd02760d23dc1ddc1b221cbb8be82387189  LICENSING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  84f8096dc7f70cdb6075ccf3722a44654361063eaf3e1ce7885c9875b8465a63  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 91ab7ca08a..44f51e06e6 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.7.2
+WOLFSSL_VERSION = 5.9.1
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-WOLFSSL_LICENSE = GPL-2.0+
+WOLFSSL_LICENSE = GPL-3.0+
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
 WOLFSSL_CPE_ID_VENDOR = wolfssl
 WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
