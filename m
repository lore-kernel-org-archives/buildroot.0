Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFEAD41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08F0A40386;
	Wed, 13 Nov 2024 09:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEA7O2Zse1O3; Wed, 13 Nov 2024 09:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CEC7403C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CEC7403C7;
	Wed, 13 Nov 2024 09:54:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A8321531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7B606000A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_lsNCPZQn6p for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85EEF60008
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85EEF60008
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82AE486229; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:30:35 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 484e0336244f728c50a9259114e83ed1adb0aabc
X-Git-Newrev: a212518a5d24aae0b28acbc95568aed8c9a9545a
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.82AE486229@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ntp: fix md5
 related build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a212518a5d24aae0b28acbc95568aed8c9a9545a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
http://autobuild.buildroot.net/results/fb4/fb4a011f14e87d348a53695868bb5f3b69496fc8/

The build errors occured immediately after bumping ntp to 4.2.8p18 with
buildroot commit 49bd6bb638ff73eae3b486b207201382d46a6c05.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4251fa12ee5aa32a73f77c6c0bb8e1ab7a343563)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/0003-fix-md5update.patch | 209 +++++++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/package/ntp/0003-fix-md5update.patch b/package/ntp/0003-fix-md5update.patch
new file mode 100644
index 0000000000..62bfef0fbb
--- /dev/null
+++ b/package/ntp/0003-fix-md5update.patch
@@ -0,0 +1,209 @@
+Fix build with -Wincompatible-pointer-types -Werror
+
+Upstream: https://people.nwtime.org/hart/ntp-stable-3928-29.tar.gz
+
+Ported fix from updated tarball provided by upstream:
+https://bugs.ntp.org/show_bug.cgi?id=3929#c9
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr ntp-4.2.8p18.orig/include/ntp_md5.h ntp-4.2.8p18/include/ntp_md5.h
+--- ntp-4.2.8p18.orig/include/ntp_md5.h	2024-05-07 13:21:16.000000000 +0200
++++ ntp-4.2.8p18/include/ntp_md5.h	2024-07-24 01:26:46.000000000 +0200
+@@ -1,56 +1,73 @@
+ /*
+  * ntp_md5.h: deal with md5.h headers
+  *
+- * Use the system MD5 if available, otherwise libisc's.
++ * Use the system MD5 if available, otherwise use libisc's.
++ * Yes, MD5 has been deprecated.  Nevertheless, ntpd IPv6 refid
++ * calculation uses MD5 to derive a 32-bit refid from a 128-bit
++ * IPv6 address.  This use is retained to avoid breaking loop
++ * detection that would be triggered by such change, and because
++ * we are not depending on cryptographic strength for such use.
+  */
+ #ifndef NTP_MD5_H
+ #define NTP_MD5_H
+ 
+ /* Use the system MD5 or fall back on libisc's */
+-# if defined HAVE_MD5_H && defined HAVE_MD5INIT
+-#  include <md5.h>
+-# else
+-#  include "isc/md5.h"
+-   typedef isc_md5_t		MD5_CTX;
+-#  define MD5_DIGEST_LENGTH	ISC_MD5_DIGESTLENGTH
+-#  define MD5Init(c)		isc_md5_init(c)
+-#  define MD5Update(c, p, s)	isc_md5_update(c, (const void *)p, s)
+-#  define MD5Final(d, c)	isc_md5_final((c), (d))	/* swapped */
+-# endif
+-
+-# define KEY_TYPE_MD5			NID_md5
++#if defined HAVE_MD5_H && defined HAVE_MD5INIT
++# include <md5.h>
++# define ntp_md5_init(c)		MD5Init(c)
++# define ntp_md5_update(c, p, s)	MD5Update(c, (const void *)(p), s)
++# define ntp_md5_final(d, c)		MD5Final(d, c)
++#else
++# include "isc/md5.h"
++typedef isc_md5_t			MD5_CTX;
++# define MD5_DIGEST_LENGTH		ISC_MD5_DIGESTLENGTH
++# define ntp_md5_init(c)		isc_md5_init(c)
++# define ntp_md5_update(c, p, s)	isc_md5_update(c, (const void *)(p), s)
++# define ntp_md5_final(d, c)		isc_md5_final((c), (d))	/* swapped */
++#endif
+ 
+ #ifdef OPENSSL
+ # include <openssl/evp.h>
+ # include "libssl_compat.h"
+ # ifdef HAVE_OPENSSL_CMAC_H
+ #  include <openssl/cmac.h>
+-#  define CMAC                  "AES128CMAC"
+-#  define AES_128_KEY_SIZE      16
+-# endif /*HAVE_OPENSSL_CMAC_H*/
++#  define CMAC			"AES128CMAC"
++#  define AES_128_KEY_SIZE	16
++# endif
+ #else	/* !OPENSSL follows */
+ /*
+- * Provide OpenSSL-alike MD5 API if we're not using OpenSSL
++ * Provide OpenSSL-alike MD5 API if we're not using OpenSSL.  Most of this
++ * is used only by sntp when building it --without-crypto.
+  */
+ 
+-  typedef MD5_CTX			EVP_MD_CTX;
++typedef MD5_CTX				EVP_MD_CTX;
+ 
+ # define NID_md5			4	/* from openssl/objects.h */
+ # define EVP_MAX_MD_SIZE		MD5_DIGEST_LENGTH
++
++/*
++ * The following is used only by sntp configured --without-crypto as ntpd
++ * now uses explicit MD5 functions for MD5 uses which remain even where MD5
++ * is unavailable in OpenSSL, such as FIPS OpenSSL.  Note that FIPS may be
++ * available in the build environment but not at runtime, as is the case
++ * with packaged NTP binaries.
++ * The remaining uses of MD5 are IPv6 refids and mode 6 nonces.  ntpd does
++ * go through OpenSSL when using MD5 for symmetric authentication.
++ */
+ # define EVP_MD_CTX_free(c)		free(c)
+ # define EVP_MD_CTX_new()		calloc(1, sizeof(MD5_CTX))
+ # define EVP_get_digestbynid(t)		NULL
+ # define EVP_md5()			NULL
+ # define EVP_MD_CTX_init(c)
+ # define EVP_MD_CTX_set_flags(c, f)
+-# define EVP_DigestInit(c, dt)		(MD5Init(c), 1)
+-# define EVP_DigestInit_ex(c, dt, i)	(MD5Init(c), 1)
+-# define EVP_DigestUpdate(c, p, s)	MD5Update(c, (const void *)(p), \
+-						  s)
+-# define EVP_DigestFinal(c, d, pdl)	\
+-	do {				\
+-		MD5Final((d), (c));	\
+-		*(pdl) = MD5_LENGTH;	\
+-	} while (0)
+-# endif	/* !OPENSSL */
++# define EVP_DigestInit(c, dt)		(ntp_md5_init(c), 1)
++# define EVP_DigestUpdate(c, p, s)	ntp_md5_update(c, p, s)
++# define EVP_DigestFinal(c, d, pdl)		\
++	do {					\
++		ntp_md5_final((d), (c));	\
++		*(pdl) = MD5_LENGTH;		\
++	} while (FALSE)
++
++#endif	/* OPENSSL */
++
+ #endif	/* NTP_MD5_H */
+diff -uNr ntp-4.2.8p18.orig/libntp/a_md5encrypt.c ntp-4.2.8p18/libntp/a_md5encrypt.c
+--- ntp-4.2.8p18.orig/libntp/a_md5encrypt.c	2024-05-07 13:21:31.000000000 +0200
++++ ntp-4.2.8p18/libntp/a_md5encrypt.c	2024-07-24 01:26:46.000000000 +0200
+@@ -56,7 +56,7 @@
+ 	static MD5_CTX	md5_ctx;
+ 
+ 	DEBUG_INSIST(NID_md5 == nid);
+-	MD5Init(&md5_ctx);
++	ntp_md5_init(&md5_ctx);
+ 
+ 	return &md5_ctx;
+ #else
+@@ -171,10 +171,10 @@
+ 		if (digest->len < MD5_LENGTH) {
+ 			msyslog(LOG_ERR, "%s", "MAC encrypt: MAC md5 buf too small.");
+ 		} else {
+-			MD5Init(ctx);
+-			MD5Update(ctx, (const void *)key->buf, key->len);
+-			MD5Update(ctx, (const void *)msg->buf, msg->len);
+-			MD5Final(digest->buf, ctx);
++			ntp_md5_init(ctx);
++			ntp_md5_update(ctx, key->buf, key->len);
++			ntp_md5_update(ctx, msg->buf, msg->len);
++			ntp_md5_final(digest->buf, ctx);
+ 			retlen = MD5_LENGTH;
+ 		}
+ 	} else {
+@@ -279,9 +279,9 @@
+ 		return (NSRCADR(addr));
+ 	}
+ 	/* MD5 is not used for authentication here. */
+-	MD5Init(&md5_ctx);
+-	MD5Update(&md5_ctx, (void *)&SOCK_ADDR6(addr), sizeof(SOCK_ADDR6(addr)));
+-	MD5Final(u.digest, &md5_ctx);
++	ntp_md5_init(&md5_ctx);
++	ntp_md5_update(&md5_ctx, &SOCK_ADDR6(addr), sizeof(SOCK_ADDR6(addr)));
++	ntp_md5_final(u.digest, &md5_ctx);
+ #ifdef WORDS_BIGENDIAN
+ 	u.addr_refid = BYTESWAP32(u.addr_refid);
+ #endif
+diff -uNr ntp-4.2.8p18.orig/libntp/authreadkeys.c ntp-4.2.8p18/libntp/authreadkeys.c
+--- ntp-4.2.8p18.orig/libntp/authreadkeys.c	2024-05-07 13:21:20.000000000 +0200
++++ ntp-4.2.8p18/libntp/authreadkeys.c	2024-07-24 01:26:46.000000000 +0200
+@@ -240,7 +240,7 @@
+ 				  keyno);
+ 			keytype = 0;
+ 		} else {
+-			keytype = KEY_TYPE_MD5;
++			keytype = NID_md5;
+ 		}
+ #endif	/* !OPENSSL */
+ 
+diff -uNr ntp-4.2.8p18.orig/ntpd/ntp_control.c ntp-4.2.8p18/ntpd/ntp_control.c
+--- ntp-4.2.8p18.orig/ntpd/ntp_control.c	2024-05-07 13:21:15.000000000 +0200
++++ ntp-4.2.8p18/ntpd/ntp_control.c	2024-07-24 01:26:46.000000000 +0200
+@@ -3663,18 +3663,18 @@
+ 		last_salt_update = current_time;
+ 	}
+ 
+-	MD5Init(&ctx);
+-	MD5Update(&ctx, salt, sizeof(salt));
+-	MD5Update(&ctx, &ts_i, sizeof(ts_i));
+-	MD5Update(&ctx, &ts_f, sizeof(ts_f));
++	ntp_md5_init(&ctx);
++	ntp_md5_update(&ctx, salt, sizeof(salt));
++	ntp_md5_update(&ctx, &ts_i, sizeof(ts_i));
++	ntp_md5_update(&ctx, &ts_f, sizeof(ts_f));
+ 	if (IS_IPV4(addr)) {
+-		MD5Update(&ctx, &SOCK_ADDR4(addr), sizeof(SOCK_ADDR4(addr)));
++		ntp_md5_update(&ctx, &SOCK_ADDR4(addr), sizeof(SOCK_ADDR4(addr)));
+ 	} else {
+-		MD5Update(&ctx, &SOCK_ADDR6(addr), sizeof(SOCK_ADDR6(addr)));
++		ntp_md5_update(&ctx, &SOCK_ADDR6(addr), sizeof(SOCK_ADDR6(addr)));
+ 	}
+-	MD5Update(&ctx, &NSRCPORT(addr), sizeof(NSRCPORT(addr)));
+-	MD5Update(&ctx, salt, sizeof(salt));
+-	MD5Final(d.digest, &ctx);
++	ntp_md5_update(&ctx, &NSRCPORT(addr), sizeof(NSRCPORT(addr)));
++	ntp_md5_update(&ctx, salt, sizeof(salt));
++	ntp_md5_final(d.digest, &ctx);
+ 
+ 	return d.extract;
+ }
+diff -uNr ntp-4.2.8p18.orig/ntpd/ntp_crypto.c ntp-4.2.8p18/ntpd/ntp_crypto.c
+--- ntp-4.2.8p18.orig/ntpd/ntp_crypto.c	2024-05-07 13:21:32.000000000 +0200
++++ ntp-4.2.8p18/ntpd/ntp_crypto.c	2024-07-24 01:26:46.000000000 +0200
+@@ -150,7 +150,7 @@
+  * Global cryptodata in host byte order
+  */
+ u_int32	crypto_flags = 0x0;	/* status word */
+-int	crypto_nid = KEY_TYPE_MD5; /* digest nid */
++int	crypto_nid = NID_md5; /* digest nid */
+ char	*sys_hostname = NULL;
+ char	*sys_groupname = NULL;
+ static char *host_filename = NULL;	/* host file name */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
