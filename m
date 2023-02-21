Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB636C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9381882871;
	Tue, 21 Feb 2023 08:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9381882871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNxBUjYnIs5a; Tue, 21 Feb 2023 08:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3408284B;
	Tue, 21 Feb 2023 08:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA3408284B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 865F91BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6140D611DC
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6140D611DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9RlQ2adPnu9Q for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:30:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EB5460FC1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB5460FC1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EB9E86580; Tue, 21 Feb 2023 08:30:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:30:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cd2e6e090449f9d2f371d24152580c038892f3d
X-Git-Newrev: 97bdc0616c6027fe4b92bfa80dd9e7d43df20505
X-Patchwork-Hint: ignore
Message-Id: <20230221083059.6EB9E86580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: needs dynamic
 library
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97bdc0616c6027fe4b92bfa80dd9e7d43df20505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as
mbedtls can be pulled in libcurl through libssh2 resulting in the
following build failure:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le-buildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_init':
md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b25959a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmodsecurity/Config.in    | 14 +++++++-------
 package/nginx-modsecurity/Config.in | 11 ++++-------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index b15d808759..69bb0494cc 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_LIBMODSECURITY
 	bool "libmodsecurity"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# libmodsecurity embeds several mbedtls source files
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
+	# libmodsecurity embeds several mbedtls source files, causing
+	# various issues when static linking and other dependencies of
+	# libmodsecurity in turn use mbedtls
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -17,8 +19,6 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity
 
-comment "libmodsecurity needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "libmodsecurity needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 5cbe57a866..0bbf05fad9 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
+	depends on !BR2_STATIC_LIBS # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
@@ -12,10 +12,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 
 	  https://github.com/SpiderLabs/ModSecurity-nginx
 
-comment "nginx-modsecurity needs a toolchain w/ C++, threads"
+comment "nginx-modsecurity needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "nginx-modsecurity needs a toolchain w/ dynamic library"
-	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
