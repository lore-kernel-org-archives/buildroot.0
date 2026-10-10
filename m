Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABF2CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80DF26066C;
	Sat, 10 Oct 2026 08:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCU_2kBSM5Il; Sat, 10 Oct 2026 08:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 609986066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621376;
	b=XzSH4hXNqiOxoUOfOgBrgnN3nekweJDZIMeAZZRNRPW4x8cJjM+oYVwul2hdSZcHneYF
	 3bQRQr9Fe0ichAGlquTl/tBXNVxn/OVbBxJ+lM/4xFFJZHHqyypiDzdVfR4VJyqniDDia
	 nsC+bTBtrWR8xd5w8I8VPxBUZ6DrGFWDWHYUlvzZABTgpDvsH/JIVN5a2aAiA4HY03YCj
	 nLVUkuuXJRYaIU9lg9S5PB59n3Z/D6i5IDUSbcK3gpk4buNojzOJPK4iESPsNXFwwjtfN
	 BMs/pY3Tt7LTrhITgoSbqZ70TGdqpBUTNfm3dh4TxFGFEOodG12V27QR5Uq1jQEwUYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EdRRiRIAqgI467O9W0zH+UHDwWTI3ZiL0bHGSMfgh0Q=;
	b=BqOJGOrLyiLI6K+VWf1f8siDy1EkW7okK1yGMjpySTP83HHr1Hgek5O67BaY5VipRn8l
	 ysSCkAlj7VypOtH+aBcQtQ6ZA6WcdUUhm7fpknoSkbyxF21nUeaB9jv7JmYAilpwchtwN
	 BwbzsLveVh+zeGE7UD78FaFTML6yebQ6IDcAt+tPwNj3cS3pMcbCwIL9qq1xqJjSGVZcd
	 6zS6H6mnGSY3EWsK2LrZP/aYA4Fl3zXPDuraR1/TnT+KT+NUu74o+O/Oqf6Aj+171j/Nb
	 87QrjB3rnxQJ/kdN4z4e0ex8mNrxburS9ZowNX38iFIffzw1qJr/nC+pJOcfKFE50TA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621376;
	bh=EdRRiRIAqgI467O9W0zH+UHDwWTI3ZiL0bHGSMfgh0Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tFElxWSjPdLaVxd8KQZ6z+bHZw8K/WLXx5mFw7sf/y1A7nmGXC4BDgHpBfI06YwAj
	 IeI1EmwQ4+IeYA7DmO4xzdoAPYD9efr26cLpeTqLBWwa1PVbAHpU+U+RyV/t4zBJCN
	 rRKAvXBNIy+CliCfM8jgylvnXPSTpi8Bm5eOptSx0oOG+A9EBfvdt4JEOEKFcB3NL+
	 uHSCMGMxeXfN8IYZGmLjt7x6egaB1kVOuAKnJcsXKGVnu6yqjiGNV/B7krz0yR40tG
	 zjK2myM2zjMCEES0uNT2w5ZLFqcIuk8Jy6H/1BzTajsDtqNcYr+sgViMzUTyVJrJm7
	 3BRj2qzpXe18A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609986066D;
	Sat, 10 Oct 2026 08:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8778111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9BF96066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ2BpLai0dOb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAD426066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621374;
 b=rS0CUR/qG8sQcNRmBcBOrzEdVEC7SeLUGz3rHHVtryzTbXanISr2Fgnrz38ZEapJEqa6
 bJG1PsSdF95OWHK5D8GYJxQp13xuBrZT3T8fgZ9I59RSqutRF0LBMZyxSOJH8UnsWAwb7
 s7P4T5QGI8jh++xiuYst6yBTk8W5wHsW20Zf0r5OI2k8GE7iFoAYyDb5gBx99KOK8AMy8
 +cj2lJmr5/YdzYRUoIb62Cmpn43UpFe1EPk3lLinA1LFeNkjeDGn8d9q+P2PxN4LXVxAE
 c19w5+VNdgOMhxeeMTIpUzPLfYjAtuWCFS1s2i2eIkpSG5rb7aSrUMDdhzIZqo8dF/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621374;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wmS9uiMBbuqj7liepcXxUY2vMCCbz9XcSMi+AJ07Wkc=;
 b=aASQmGOpWMrRLvfgsRq8pJotVkSLsQU4gP+jlRNVa44z50QXDlmvsCYoARmrgC/SI6Pa
 YO/W8tiDu4SSU9+TKvcbg6822O1pEwjztsbNj3HT1lN76R9KYaZSXCKe91uJvJfgGzWb1
 u1WxAGOqiZhkzDBGP9QnLN/k9JUjn0b8V7siE7vyWDfrGlKwyXx0HI4y6wMz2SJxZaZMc
 zHj9Nv6RMqJLOQTVpxHubRWyP9GpVKmOfCBBEFWfVsNGc23uPocROylmQBpv/LdaraLSo
 NC4cl86mmdRE/yIZL8+0DAK7f4oKWUZESBU9nY6DS+OercbcKXBc7fo/gHnYrpt6zgA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAD426066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:36:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C96D88EF96; Sat, 10 Oct 2026 08:34:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:35:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27f84eb8127c12e44e24bb1a6224cd1344db9b19
X-Git-Newrev: 75aba76d9a9c0bec2f1ecedbe7ebc48616cb728b
X-Patchwork-Hint: ignore
Message-Id: <20261010083455.C96D88EF96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: add support for
 OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75aba76d9a9c0bec2f1ecedbe7ebc48616cb728b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....m4-probe-TLS_method-to-detect-libssl-Ope.patch | 38 ++++++++++++
 ...d-System-Fix-build-against-OpenSSL-4-3185.patch | 67 ++++++++++++++++++++++
 package/freeswitch/freeswitch.mk                   |  3 +
 3 files changed, 108 insertions(+)

diff --git a/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch b/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
new file mode 100644
index 0000000000..5805818213
--- /dev/null
+++ b/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
@@ -0,0 +1,38 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Bradley Reid <130598986+bereizy@users.noreply.github.com>
+Date: Fri, 2 Oct 2026 09:43:47 -0400
+Subject: [PATCH] sac-openssl.m4: probe TLS_method to detect libssl (OpenSSL 4)
+
+SAC_OPENSSL decides whether libssl is usable with
+AC_CHECK_LIB(ssl, TLSv1_method). OpenSSL 4.0 removed the fixed-version
+method functions, so the probe fails there, HAVE_TLS is cleared and -lssl
+is not added to LIBS. With #3185 applied configure then succeeds but the
+build stops when linking mod_sofia's test program:
+
+  undefined reference to symbol 'SSL_CTX_check_private_key@@OPENSSL_4.0.0'
+
+TLS_method is available from OpenSSL 1.1.0 on.
+
+Upstream: https://github.com/signalwire/freeswitch/pull/3211
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ build/config/sac-openssl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/config/sac-openssl.m4 b/build/config/sac-openssl.m4
+index 289d3e132e..76ba9f2f22 100644
+--- a/build/config/sac-openssl.m4
++++ b/build/config/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
diff --git a/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch b/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
new file mode 100644
index 0000000000..63e15ff3c0
--- /dev/null
+++ b/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
@@ -0,0 +1,67 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Andrey Volk <andywolk@gmail.com>
+Date: Thu, 24 Sep 2026 00:31:38 +0300
+Subject: [PATCH] [Build-System] Fix build against OpenSSL 4 (#3185)
+
+Upstream: https://github.com/signalwire/freeswitch/commit/fd1cab5117cd4c711293439354885a559ef783bb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac           |  6 +++++-
+ src/switch_core_cert.c | 13 ++++++++++---
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ae42b22f6f..16af18ce2d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1726,7 +1726,11 @@ if test x$HAVE_OPENSSL = x1; then
+ 	openssl_CFLAGS="$openssl_CFLAGS -DHAVE_OPENSSL";
+ 	APR_ADDTO(SWITCH_AM_CFLAGS, -DHAVE_OPENSSL)
+ 	AC_CHECK_LIB(ssl, SSL_CTX_set_tlsext_use_srtp, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS_SRTP, 1, HAVE_OPENSSL_DTLS_SRTP), AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated developement headers required]))
+-	AC_CHECK_LIB(ssl, DTLSv1_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS), AC_MSG_ERROR([OpenSSL >= 1.0.1e and associaed developement headers required]))
++	dnl DTLS_method is what the code calls from OpenSSL 1.1.0 on; DTLSv1_method is
++	dnl the pre 1.1.0 spelling, deprecated since and gone from OpenSSL 4.
++	AC_CHECK_LIB(ssl, DTLS_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS),
++		[AC_CHECK_LIB(ssl, DTLSv1_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS),
++			AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated development headers required]))])
+ 	AC_CHECK_LIB(ssl, DTLSv1_2_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLSv1_2_method, 1, [DTLS version 1.2 is available]))
+ else
+ 	AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated developement headers required])
+diff --git a/src/switch_core_cert.c b/src/switch_core_cert.c
+index 218016e63b..174a2b1809 100644
+--- a/src/switch_core_cert.c
++++ b/src/switch_core_cert.c
+@@ -496,7 +496,12 @@ static int mkcert(X509 **x509p, EVP_PKEY **pkeyp, int bits, int serial, int days
+ 	X509_gmtime_adj(X509_get_notAfter(x), (long)60*60*24*days);
+ 	X509_set_pubkey(x, pk);
+ 
+-	name = X509_get_subject_name(x);
++	/* OpenSSL 4 hands out the certificate's own name as const, so build one
++	 * here and set it instead of filling in the one inside the certificate.
++	 */
++	if ((name = X509_NAME_new()) == NULL) {
++		goto err;
++	}
+ 
+ 	/* This function creates and adds the entry, working out the
+ 	 * correct string type and performing checks on its length.
+@@ -505,11 +510,13 @@ static int mkcert(X509 **x509p, EVP_PKEY **pkeyp, int bits, int serial, int days
+ 	X509_NAME_add_entry_by_txt(name, "C", MBSTRING_ASC, (unsigned char *)"US", -1, -1, 0);
+ 	X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, (unsigned char *)"FreeSWITCH", -1, -1, 0);
+ 
+-
+ 	/* Its self signed so set the issuer name to be the same as the
+- 	 * subject.
++	 * subject. Both calls copy the name, so ours is ours to free.
+ 	 */
++	X509_set_subject_name(x, name);
+ 	X509_set_issuer_name(x, name);
++	X509_NAME_free(name);
++	name = NULL;
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000
+ 	if (!X509_sign(x, pk, EVP_sha256())) {
+-- 
+2.47.3
+
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e27c53650f..6d46cbed23 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -7,6 +7,9 @@
 FREESWITCH_VERSION = 1.11.3
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
+# 0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
+# 0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
+FREESWITCH_AUTORECONF = YES
 # External modules need headers/libs from staging
 FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
