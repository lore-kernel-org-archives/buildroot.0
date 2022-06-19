Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8013AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E43A410D8;
	Sun, 19 Jun 2022 15:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E43A410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0e1JHIdehPRn; Sun, 19 Jun 2022 15:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7BBA40933;
	Sun, 19 Jun 2022 15:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BBA40933
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64BE71BF990
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB7D4408E6
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7D4408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8zgi6Olvy0v for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65618408EB
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65618408EB
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 30A4D873C0; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22b7fb8a8d86ae5ba9d247e919f94f400bc225f0
X-Git-Newrev: 9fc652a373034118535397fdd4042ab9f8fd7adf
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.30A4D873C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: needs dynamic
 library with libcurl and mbedtls
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fc652a373034118535397fdd4042ab9f8fd7adf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmodsecurity embeds several mbedtls source files since version 3.0.0
and
https://github.com/SpiderLabs/ModSecurity/commit/a3ae686f2555bdacbfc9e1889ad05065711a165d
resulting in the following static build failure if curl is built with
mbedtls support:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_free':
md5.c:(.text+0x16): multiple definition of `mbedtls_md5_free'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x16): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/98472a3a41cdbcb3d02289a437074a267f4b2e8e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libmodsecurity/Config.in    | 5 +++++
 package/nginx-modsecurity/Config.in | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index 87f7a9c103..f65ab3de93 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBMODSECURITY
 	bool "libmodsecurity"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# libmodsecurity embeds several mbedtls source files
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
 	select BR2_PACKAGE_PCRE
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -17,3 +19,6 @@ config BR2_PACKAGE_LIBMODSECURITY
 
 comment "libmodsecurity needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libmodsecurity needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index b1fcbadd7a..5cbe57a866 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
@@ -14,3 +15,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 comment "nginx-modsecurity needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "nginx-modsecurity needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_NGINX_HTTP
+	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
