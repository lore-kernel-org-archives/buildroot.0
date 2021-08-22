Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1308AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 09:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB5061261
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 09:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACB5061261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C03640295;
	Sun, 22 Aug 2021 09:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caVJ27Yf5jQM; Sun, 22 Aug 2021 09:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B494D40299;
	Sun, 22 Aug 2021 09:34:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 918991BF2C1
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 09:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 809696069D
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 09:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krjm5swZr4w3 for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 09:34:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4EC660673
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 09:34:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q11so21301796wrr.9
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQ9BXqu7WRcg5w1+g+gK1Li35nus1oet5BMrRpIScis=;
 b=PVmooTyUFJu3P/Yw88X+jajfB+b/SM7q4u2ZuV7aShvegNCDSyMgw6Ig2X6wWh6r+P
 HqnTuRYwqMidvYVeGWpRf8uXMwbwtT3/TvA0TY+pOUA40Zp1LYrciM9fnam1q0cEkG/p
 EZlMDRSg0Bizqh5c7FSxVsJTSq/mSdJuoG71I1BqPA2L9ZhLt7FynDqZ8nfaiEJR6ZTn
 k8uw8SJpwjRpsa+SyK0zvZzgtiG4Yy7iJeQNtSwqaPR+01pqrLWa+Cfx0WybJeARgKAj
 ihqt6L1MLbbXARAS5B1fK7p95w8NTGx8ftvd3j/9Ya2DVV0mSsv+crfLgrPMHIb6vukU
 Q6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQ9BXqu7WRcg5w1+g+gK1Li35nus1oet5BMrRpIScis=;
 b=JykCL400glvvZIyzs+9Bruh/vlsZSe16r9ZE+pQYR6Eg2II+Z85RZmVFQeGoi0wqoK
 kb9fiyzVnGOyZqNmU5rFTeqVDVqWrjPpOJdF11M6nHmMIHoYFRWaGWFupH/6pwJbqsbB
 M9amIGUVmBrIdfef5ZrJKFFnvDW2PxPahPJObgssQsIZ4vxPx7Wn00DZN3Z615UUUnIa
 HsS8Y59/ArWLzpJxSsLXJAM59ZnaFtHPX/7p4KyVwr7SnYnFvq5cgufQGS/k90avXQIr
 ZiLEFxanNpxutdLCojNdtwYC8+k5IelcaExbKDJyzdqS8fbsVydk9NZ8hCj0XVvoPJVl
 d6ZQ==
X-Gm-Message-State: AOAM530nQKhnUjs4tNjgWr4R1Nlo7tAdLs9idmYk1o1A+Od7ZK4w4Shg
 Jv0F2jmsGzASURbLsMOMhVWSZ4PEPcGx/g==
X-Google-Smtp-Source: ABdhPJwPqg7Jjqt9miLma8JlVHZhF0A22goGwFjzWORuF1gWJjKHRQaNFn7H7IG1EkqY3FnGnLHjKg==
X-Received: by 2002:a5d:5550:: with SMTP id g16mr8023334wrw.336.1629624889592; 
 Sun, 22 Aug 2021 02:34:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id n10sm11285056wrw.76.2021.08.22.02.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 02:34:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 11:34:28 +0200
Message-Id: <20210822093428.2018189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: add libxcrypt optional
 dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add libxcrypt optional dependency and fix the following build failure
with libxcrypt and uclibc-ng raised since the addition of libxcrypt in
commit 464bbe26ff5fb9e5bfe26a26ea65c700b90598f5:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: unix_chkpwd-passverify.o: in function `verify_pwd_hash':
passverify.c:(.text+0xab4): undefined reference to `crypt_checksalt'

Fixes:
 - http://autobuild.buildroot.org/results/65d68b7c9c7de1c7cb0f941ff9982f93a49a56f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-configure-test-a-o-is-not-POSIX.patch |  75 +++++++++
 ...002-Remove-support-for-legacy-xcrypt.patch | 149 ++++++++++++++++++
 ...x-build-with-libxcrypt-and-uclibc-ng.patch |  47 ++++++
 package/linux-pam/linux-pam.mk                |   3 +
 4 files changed, 274 insertions(+)
 create mode 100644 package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
 create mode 100644 package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
 create mode 100644 package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch

diff --git a/package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch b/package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
new file mode 100644
index 0000000000..ac16455956
--- /dev/null
+++ b/package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
@@ -0,0 +1,75 @@
+From 7c54428db5b639f05093459b1ba3b77456c5a548 Mon Sep 17 00:00:00 2001
+From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
+Date: Wed, 16 Dec 2020 18:48:28 -0500
+Subject: [PATCH] configure: test -a|o is not POSIX
+
+Fixes `test: too many arguments` when building Linux-PAM using sbase.
+This is due to a non-POSIX syntax test ... -a ... and test ... -o ....
+
+> The XSI extensions specifying the -a and -o binary primaries and the
+> '(' and ')' operators have been marked obsolescent.
+
+See https://pubs.opengroup.org/onlinepubs/9699919799/utilities/test.html
+
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/7c54428db5b639f05093459b1ba3b77456c5a548]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5eade7cd3..e325bdd3c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -346,7 +346,7 @@ if test x"$WITH_LIBAUDIT" != xno ; then
+ 			     [HAVE_AUDIT_TTY_STATUS=""],
+ 			     [#include <libaudit.h>])]
+         )
+-        if test -n "$LIBAUDIT" -a "$ac_cv_header_libaudit_h" != "no" ; then
++        if test -n "$LIBAUDIT" && test "$ac_cv_header_libaudit_h" != "no" ; then
+             AC_DEFINE([HAVE_LIBAUDIT], 1, [Define to 1 if audit support should be compiled in.])
+         fi
+         if test -n "$HAVE_AUDIT_TTY_STATUS" ; then
+@@ -373,12 +373,12 @@ esac
+ AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
+-if test "$LIBCRYPT" = "-lxcrypt" -a "$ac_cv_header_xcrypt_h" = "yes" ; then
++if test "$LIBCRYPT" = "-lxcrypt" && test "$ac_cv_header_xcrypt_h" = "yes" ; then
+ 	AC_DEFINE([HAVE_LIBXCRYPT], 1, [Define to 1 if xcrypt support should be compiled in.])
+ fi
+ 
+ AC_ARG_WITH([randomdev], AS_HELP_STRING([--with-randomdev=(<path>|yes|no)],[use specified random device instead of /dev/urandom or 'no' to disable]), opt_randomdev=$withval)
+-if test "$opt_randomdev" = yes -o -z "$opt_randomdev"; then
++if test "$opt_randomdev" = yes || test -z "$opt_randomdev"; then
+        opt_randomdev="/dev/urandom"
+ elif test "$opt_randomdev" = no; then
+        opt_randomdev=
+@@ -395,7 +395,7 @@ AC_ARG_ENABLE([db],
+ AC_ARG_WITH([db-uniquename],
+ 	AS_HELP_STRING([--with-db-uniquename=extension],[Unique name for db libraries and functions.]))
+ if test x"$WITH_DB" != xno ; then
+-        if test x"$WITH_DB" = xyes -o x"$WITH_DB" = xdb ; then
++        if test x"$WITH_DB" = xyes || test x"$WITH_DB" = xdb ; then
+               old_libs=$LIBS
+               LIBS="$LIBS -ldb$with_db_uniquename"
+               AC_CHECK_FUNCS([db_create$with_db_uniquename db_create dbm_store$with_db_uniquename dbm_store],
+@@ -572,7 +572,7 @@ fi
+ 
+ AC_PATH_PROG([FO2PDF], [fop])
+ 
+-AM_CONDITIONAL(ENABLE_REGENERATE_MAN, test x$enable_docu != xno -a x$enable_doc != xno)
++AM_CONDITIONAL(ENABLE_REGENERATE_MAN, test x$enable_docu != xno && test x$enable_doc != xno)
+ AM_CONDITIONAL(ENABLE_GENERATE_PDF, test -n "$FO2PDF")
+ 
+ 
+@@ -625,7 +625,7 @@ esac
+ AM_CONDITIONAL([COND_BUILD_PAM_KEYINIT], [test "$have_key_syscalls" = 1])
+ AM_CONDITIONAL([COND_BUILD_PAM_LASTLOG], [test "$ac_cv_func_logwtmp" = yes])
+ AM_CONDITIONAL([COND_BUILD_PAM_NAMESPACE], [test "$ac_cv_func_unshare" = yes])
+-AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes -o "$ac_cv_func_ruserok" = yes])
++AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes || test "$ac_cv_func_ruserok" = yes])
+ AM_CONDITIONAL([COND_BUILD_PAM_SELINUX], [test -n "$LIBSELINUX"])
+ AM_CONDITIONAL([COND_BUILD_PAM_SEPERMIT], [test -n "$LIBSELINUX"])
+ AM_CONDITIONAL([COND_BUILD_PAM_SETQUOTA], [test "$ac_cv_func_quotactl" = yes])
diff --git a/package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch b/package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
new file mode 100644
index 0000000000..9f4e8bcde0
--- /dev/null
+++ b/package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
@@ -0,0 +1,149 @@
+From 530c9f9e2d746e1d168c6b17863debda7664ac7c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Fri, 28 Feb 2020 15:47:52 +0100
+Subject: [PATCH] Remove support for legacy xcrypt
+
+Since many distributions are shipping a version of libxcrypt >= 4.0.0
+as a replacement for glibc's libcrypt now, older versions of xcrypt,
+which could be installed in parallel, are not relevant anymore.
+
+* configure.ac (AC_CHECK_HEADERS): Remove xcrypt.h.
+(AC_SEARCH_LIBS): Remove xcrypt.
+(AC_CHECK_FUNCS): Remove crypt_gensalt_r.
+(AC_DEFINE): Remove HAVE_LIBXCRYPT.
+* modules/pam_pwhistory/opasswd.c [HAVE_LIBXCRYPT]: Remove.
+* modules/pam_unix/bigcrypt.c [HAVE_LIBXCRYPT]: Likewise.
+* modules/pam_userdb/pam_userdb.c [HAVE_LIBXCRYPT]: Likewise.
+* modules/pam_unix/passverify.c [HAVE_LIBXCRYPT]: Likewise.
+(create_password_hash) [HAVE_LIBXCRYPT]: Likewise.
+
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/530c9f9e2d746e1d168c6b17863debda7664ac7c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac                    | 12 +++---------
+ modules/pam_pwhistory/opasswd.c |  4 +---
+ modules/pam_unix/bigcrypt.c     |  4 +---
+ modules/pam_unix/passverify.c   | 24 +++++-------------------
+ modules/pam_userdb/pam_userdb.c |  4 +---
+ 5 files changed, 11 insertions(+), 37 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8e5d0ff7c..100565552 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -359,23 +359,17 @@ else
+ fi
+ AC_SUBST(LIBAUDIT)
+ 
+-AC_CHECK_HEADERS(xcrypt.h crypt.h)
+-AS_IF([test "x$ac_cv_header_xcrypt_h" = "xyes"],
+-  [crypt_libs="xcrypt crypt"],
+-  [crypt_libs="crypt"])
++AC_CHECK_HEADERS(crypt.h)
+ 
+ BACKUP_LIBS=$LIBS
+-AC_SEARCH_LIBS([crypt],[$crypt_libs])
++AC_SEARCH_LIBS([crypt],[crypt])
+ case "$ac_cv_search_crypt" in
+ 	-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
+ 	*) LIBCRYPT="" ;;
+ esac
+-AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
++AC_CHECK_FUNCS([crypt_r])
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
+-if test "$LIBCRYPT" = "-lxcrypt" && test "$ac_cv_header_xcrypt_h" = "yes" ; then
+-	AC_DEFINE([HAVE_LIBXCRYPT], 1, [Define to 1 if xcrypt support should be compiled in.])
+-fi
+ 
+ AC_ARG_WITH([randomdev], AS_HELP_STRING([--with-randomdev=(<path>|yes|no)],[use specified random device instead of /dev/urandom or 'no' to disable]), opt_randomdev=$withval)
+ if test "$opt_randomdev" = yes || test -z "$opt_randomdev"; then
+diff --git a/modules/pam_pwhistory/opasswd.c b/modules/pam_pwhistory/opasswd.c
+index 40296d590..a6cd3d2a3 100644
+--- a/modules/pam_pwhistory/opasswd.c
++++ b/modules/pam_pwhistory/opasswd.c
+@@ -54,9 +54,7 @@
+ #endif
+ #include <sys/stat.h>
+ 
+-#if defined HAVE_LIBXCRYPT
+-#include <xcrypt.h>
+-#elif defined (HAVE_CRYPT_H)
++#ifdef HAVE_CRYPT_H
+ #include <crypt.h>
+ #endif
+ 
+diff --git a/modules/pam_unix/bigcrypt.c b/modules/pam_unix/bigcrypt.c
+index 31be2f7b0..d8d61a4b0 100644
+--- a/modules/pam_unix/bigcrypt.c
++++ b/modules/pam_unix/bigcrypt.c
+@@ -29,9 +29,7 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <security/_pam_macros.h>
+-#ifdef HAVE_LIBXCRYPT
+-#include <xcrypt.h>
+-#elif defined(HAVE_CRYPT_H)
++#ifdef HAVE_CRYPT_H
+ #include <crypt.h>
+ #endif
+ 
+diff --git a/modules/pam_unix/passverify.c b/modules/pam_unix/passverify.c
+index 5a19ed856..e833402c1 100644
+--- a/modules/pam_unix/passverify.c
++++ b/modules/pam_unix/passverify.c
+@@ -19,9 +19,7 @@
+ #include <sys/time.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#ifdef HAVE_LIBXCRYPT
+-#include <xcrypt.h>
+-#elif defined(HAVE_CRYPT_H)
++#ifdef HAVE_CRYPT_H
+ #include <crypt.h>
+ #endif
+ 
+@@ -467,23 +465,11 @@ PAMH_ARG_DECL(char * create_password_hash,
+ 	 */
+ 	sp = crypt_gensalt_rn(algoid, rounds, NULL, 0, salt, sizeof(salt));
+ #else
+-#ifdef HAVE_CRYPT_GENSALT_R
+-	if (on(UNIX_BLOWFISH_PASS, ctrl)) {
+-		char entropy[17];
+-		crypt_make_salt(entropy, sizeof(entropy) - 1);
+-		sp = crypt_gensalt_r (algoid, rounds,
+-				      entropy, sizeof(entropy),
+-				      salt, sizeof(salt));
+-	} else {
+-#endif
+-		sp = stpcpy(salt, algoid);
+-		if (on(UNIX_ALGO_ROUNDS, ctrl)) {
+-			sp += snprintf(sp, sizeof(salt) - (16 + 1 + (sp - salt)), "rounds=%u$", rounds);
+-		}
+-		crypt_make_salt(sp, 16);
+-#ifdef HAVE_CRYPT_GENSALT_R
++	sp = stpcpy(salt, algoid);
++	if (on(UNIX_ALGO_ROUNDS, ctrl)) {
++		sp += snprintf(sp, sizeof(salt) - (16 + 1 + (sp - salt)), "rounds=%u$", rounds);
+ 	}
+-#endif
++	crypt_make_salt(sp, 16);
+ #endif /* CRYPT_GENSALT_IMPLEMENTS_AUTO_ENTROPY */
+ #ifdef HAVE_CRYPT_R
+ 	sp = NULL;
+diff --git a/modules/pam_userdb/pam_userdb.c b/modules/pam_userdb/pam_userdb.c
+index d59801bfd..f467ea4c8 100644
+--- a/modules/pam_userdb/pam_userdb.c
++++ b/modules/pam_userdb/pam_userdb.c
+@@ -17,9 +17,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <errno.h>
+-#ifdef HAVE_LIBXCRYPT
+-#include <xcrypt.h>
+-#elif defined(HAVE_CRYPT_H)
++#ifdef HAVE_CRYPT_H
+ #include <crypt.h>
+ #endif
+ 
diff --git a/package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch b/package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch
new file mode 100644
index 0000000000..d452aed34d
--- /dev/null
+++ b/package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch
@@ -0,0 +1,47 @@
+From fe1307512fb8892b5ceb3d884c793af8dbd4c16a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 15 Jun 2021 07:13:56 +0200
+Subject: [PATCH] configure.ac: fix build with libxcrypt and uclibc-ng
+
+Fix the following build failure with libxcrypt and uclibc-ng:
+
+ld: unix_chkpwd-passverify.o: in function `verify_pwd_hash':
+passverify.c:(.text+0xab4): undefined reference to `crypt_checksalt'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/65d68b7c9c7de1c7cb0f941ff9982f93a49a56f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/fe1307512fb8892b5ceb3d884c793af8dbd4c16a]
+---
+ configure.ac | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a4b2e86..e9c57345 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -362,10 +362,18 @@ AC_SUBST(LIBAUDIT)
+ AC_CHECK_HEADERS(crypt.h)
+ 
+ BACKUP_LIBS=$LIBS
+-AC_SEARCH_LIBS([crypt],[crypt])
+-case "$ac_cv_search_crypt" in
+-	-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
+-	*) LIBCRYPT="" ;;
++LIBCRYPT=""
++AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
++case "$ac_cv_search_crypt_gensalt_rn" in
++	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
++	no) AC_SEARCH_LIBS([crypt_r],[crypt])
++		case "$ac_cv_search_crypt_r" in
++		-l*) LIBCRYPT="$ac_cv_search_crypt_r" ;;
++		no ) AC_SEARCH_LIBS([crypt],[crypt])
++		case "$ac_cv_search_crypt" in
++			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
++		esac ;;
++	esac ;;
+ esac
+ AC_CHECK_FUNCS([crypt_r])
+ LIBS=$BACKUP_LIBS
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 9c0815db24..389d32a9a8 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -17,11 +17,14 @@ LINUX_PAM_CONF_OPTS = \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
 LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
+# We're patching configure.ac
+LINUX_PAM_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
