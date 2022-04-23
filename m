Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBB9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF8B82A56;
	Sat, 23 Apr 2022 15:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmMz_qaR7-Y3; Sat, 23 Apr 2022 15:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6653B824CB;
	Sat, 23 Apr 2022 15:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1B21BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 663E0419C9
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6kFemJXmDe2 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:24:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CD1E41554
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:24:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E10C6840FE; Sat, 23 Apr 2022 15:14:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:23:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10648db92bc5c4bfd49b58ce4f1c213defdfc7de
X-Git-Newrev: 7d211f67016446b9e843259b1195be04691fecec
X-Patchwork-Hint: ignore
Message-Id: <20220423151445.E10C6840FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: all features needs
 dynamic library
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d211f67016446b9e843259b1195be04691fecec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dynamic library dependency to BR2_PACKAGE_WOLFSSL_ALL to fix the
following static build failure with ibrdtnd, a "wolfssl all"-enabled
libcurl and openssl:

/nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/opt/ext-toolchain/bin/../lib/gcc/sh4aeb-buildroot-linux-musl/11.2.0/../../../../sh4aeb-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/bin/../sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libssl.a(ssl_ciph.o): in function `SSL_COMP_get_compression_methods':
ssl_ciph.c:(.text+0x25ac): multiple definition of `SSL_COMP_get_compression_methods'; /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libwolfssl.a(libwolfssl_la-ssl.o):ssl.c:(.text+0x1ca60): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/be1d327ed4c91a6280a88906a399dfe146f0b64e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcurl/Config.in      | 5 +++++
 package/libuhttpd/Config.in    | 3 ++-
 package/libuhttpd/libuhttpd.mk | 2 +-
 package/wolfssl/Config.in      | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 8c601c3a70..3381decca8 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -68,8 +68,13 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
 config BR2_PACKAGE_LIBCURL_WOLFSSL
 	bool "WolfSSL"
 	depends on BR2_PACKAGE_WOLFSSL
+	depends on !BR2_STATIC_LIBS # wolfssl-all
 	select BR2_PACKAGE_WOLFSSL_ALL
 
+comment "WolfSSL needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_WOLFSSL
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
 
diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 97fc984ea0..a552a88f0c 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBUHTTPD
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBEV
-	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
+		!BR2_STATIC_LIBS
 	help
 	  A lightweight and fully asynchronous HTTP server
 	  library based on libev
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index b8cf935d01..0d5306c6dd 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -18,7 +18,7 @@ LIBUHTTPD_CONF_OPTS += \
 	-DUSE_MBEDTLS=OFF \
 	-DUSE_OPENSSL=ON \
 	-DUSE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBUHTTPD_DEPENDENCIES += wolfssl
 LIBUHTTPD_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 3c6d68f592..3a97125e8d 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -13,9 +13,13 @@ if BR2_PACKAGE_WOLFSSL
 
 config BR2_PACKAGE_WOLFSSL_ALL
 	bool "enable all features, except SSLv3"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable all wolfSSL features, except SSL version 3.0 support.
 
+comment "all features, except SSLv3 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_WOLFSSL_SSLV3
 	bool "enable SSLv3"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
