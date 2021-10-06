Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CADC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:59:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F7661130
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8F7661130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D1340862;
	Wed,  6 Oct 2021 16:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcxAhRIs7lr0; Wed,  6 Oct 2021 16:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D37D6405C6;
	Wed,  6 Oct 2021 16:59:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97B381BF309
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86DF6405C6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHXkPBiicYB9 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:59:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA05E40406
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:59:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s15so10843861wrv.11
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JX9BiYK4fNjTapMKSxceH8og4AuLWBTyDWxrkUQh6Ls=;
 b=Me3tMe1E5fsjn8W7dYvnRA5jjRZNc3OK4Z9I4YK7nrYVuxhxHHNhpeoTiarzUeoOFb
 uvI3fKzoCO+G+0CFyWZec/OgVMgfPHnnBMZWe4x0/lOQMKB5StnqdzQCG7SuAQnw7wG0
 fi6VdzFlCfibEwmyGl4XKZNihqmYYhR3Z81MbDj33zF5hiA+YwBOmUXsNFycZ3pE/cbw
 HvJkz6I5wOIHrzmBOJ+FDDD4A9QCMfEoy2mzDXL0upuB7V0XexVlwY5T2/QBTb+u/Y+s
 HvU342fB4ziFP8dFhbACN4grEmTnmPytJZPwuKGVYWdrxhk/8otAaACVF1qgDM7UH8tF
 TpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JX9BiYK4fNjTapMKSxceH8og4AuLWBTyDWxrkUQh6Ls=;
 b=fGYZjmF+TDBuhXC8R5eHJSbnrFzqCkG/4BZxh/aqobKwM/kRyTUi9up1qTKAY1++nm
 usep43wn4tSFq7T8RWIOhKP7sFc4MdUI61L8r+zTFbWT2yrCD1KldQV8YOBhVEoV++vK
 BokDMmjeAfOXxBzmBJv9Jr6fSsKgXCIt953gijTXQQLpMGDePVnO+hZCJ+fx4tWiFLqo
 9aGSDIRNPWIvC6EU4TLC3UY3jOZH6rgCtBwYn6eMIMPT1i5Vq8+jz0NOun7Nq44eTMcM
 e5Or8Yg/UJO6TqSqxvGS89JATD2D9q86oEaEOv7rHPrnAsJHMkUDqUprWUm3/4FEaKO7
 C8Dg==
X-Gm-Message-State: AOAM530IM6K7ISojq88hMffmOf17yvNUUdxVNoR9G8khlmEIFngeZGS+
 9+gTjXd1+C7CZhH0rUbS+uV58UvwKHQ=
X-Google-Smtp-Source: ABdhPJxBezQ0dsij44y+g1IfF1Q3H3/rh09tS8UlEu2hIQcST4O3K6zzbqiPBHiKwzL9Vs+taTsE5w==
X-Received: by 2002:adf:a411:: with SMTP id d17mr26523956wra.393.1633539589746; 
 Wed, 06 Oct 2021 09:59:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id k23sm2578092wrh.93.2021.10.06.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:59:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 18:58:55 +0200
Message-Id: <20211006165855.2952918-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/asterisk: fix build with autoconf
 >= 2.70
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

configure: error: *** ANSI C header files not found.

Fixes:
 - http://autobuild.buildroot.org/results/e7dc47da7863a5dc492154f620c4fcebafccf6ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...a-compile-failure-with-autoconf-2-70.patch | 171 ++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch

diff --git a/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
new file mode 100644
index 0000000000..cced0bbae7
--- /dev/null
+++ b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
@@ -0,0 +1,171 @@
+From 060ce10163e46a740c15036fc56214468abc710b Mon Sep 17 00:00:00 2001
+From: Jaco Kroon <jaco@uls.co.za>
+Date: Fri, 8 Jan 2021 18:02:47 +0200
+Subject: [PATCH] AC_HEADER_STDC causes a compile failure with autoconf 2.70
+
+From https://www.mail-archive.com/bug-autoconf@gnu.org/msg04408.html
+
+> ... the long-obsolete AC_HEADER_STDC, previously used internally by
+> AC_INCLUDES_DEFAULT, used AC_EGREP_HEADER.  The AC_HEADER_STDC macro
+> is now a no-op (and is not used at all within Autoconf anymore), so
+> that change is likely what made the first use of AC_EGREP_HEADER the
+> one inside the if condition, causing the observed results.
+
+The implication is that the test does nothing anyway, and due to it
+being a no-op from 2.70 onwards, results in the required not being set
+to yes, resulting in ./configure to fail.
+
+Change-Id: Ic1ff38d87f791fbf1f2a80512f81bb7110392460
+Signed-off-by: Jaco Kroon <jaco@uls.co.za>
+
+[Retrieved from:
+https://github.com/asterisk/asterisk/commit/060ce10163e46a740c15036fc56214468abc710b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure    | 116 ---------------------------------------------------
+ configure.ac |   5 ---
+ 2 files changed, 121 deletions(-)
+
+diff --git a/configure b/configure
+index 3594ac62f0c..735a8e98c7f 100755
+--- a/configure
++++ b/configure
+@@ -13129,122 +13129,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
+   as_fn_error $? "*** Could not find dirent header that defines 'DIR'." "$LINENO" 5
+ fi
+ 
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ANSI C header files" >&5
+-$as_echo_n "checking for ANSI C header files... " >&6; }
+-if ${ac_cv_header_stdc+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <stdlib.h>
+-#include <stdarg.h>
+-#include <string.h>
+-#include <float.h>
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-  ac_cv_header_stdc=yes
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-
+-if test $ac_cv_header_stdc = yes; then
+-  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <string.h>
+-
+-_ACEOF
+-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "memchr" >/dev/null 2>&1; then :
+-
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f conftest*
+-
+-fi
+-
+-if test $ac_cv_header_stdc = yes; then
+-  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <stdlib.h>
+-
+-_ACEOF
+-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "free" >/dev/null 2>&1; then :
+-
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f conftest*
+-
+-fi
+-
+-if test $ac_cv_header_stdc = yes; then
+-  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
+-  if test "$cross_compiling" = yes; then :
+-  :
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <ctype.h>
+-#include <stdlib.h>
+-#if ((' ' & 0x0FF) == 0x020)
+-# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+-# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+-#else
+-# define ISLOWER(c) \
+-		   (('a' <= (c) && (c) <= 'i') \
+-		     || ('j' <= (c) && (c) <= 'r') \
+-		     || ('s' <= (c) && (c) <= 'z'))
+-# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
+-#endif
+-
+-#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+-int
+-main ()
+-{
+-  int i;
+-  for (i = 0; i < 256; i++)
+-    if (XOR (islower (i), ISLOWER (i))
+-	|| toupper (i) != TOUPPER (i))
+-      return 2;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_run "$LINENO"; then :
+-
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+-  conftest.$ac_objext conftest.beam conftest.$ac_ext
+-fi
+-
+-fi
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_header_stdc" >&5
+-$as_echo "$ac_cv_header_stdc" >&6; }
+-if test $ac_cv_header_stdc = yes; then
+-
+-$as_echo "#define STDC_HEADERS 1" >>confdefs.h
+-
+-fi
+-
+-if test "$ac_cv_header_stdc" != "yes"; then
+-  as_fn_error $? "*** ANSI C header files not found." "$LINENO" 5
+-fi
+-
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sys/wait.h that is POSIX.1 compatible" >&5
+ $as_echo_n "checking for sys/wait.h that is POSIX.1 compatible... " >&6; }
+ if ${ac_cv_header_sys_wait_h+:} false; then :
+diff --git a/configure.ac b/configure.ac
+index 9ae3769d02e..2260fe63268 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -616,11 +616,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
+   AC_MSG_ERROR([*** Could not find dirent header that defines 'DIR'.])
+ fi
+ 
+-AC_HEADER_STDC
+-if test "$ac_cv_header_stdc" != "yes"; then
+-  AC_MSG_ERROR([*** ANSI C header files not found.])
+-fi
+-
+ AC_HEADER_SYS_WAIT
+ if test "$ac_cv_header_sys_wait_h" != "yes"; then
+   AC_MSG_ERROR([*** POSIX.1 compatible sys/wait.h is required.])
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
