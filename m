Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1CCC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21899606CC;
	Fri,  3 Jul 2026 19:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWf0hpCLYqWD; Fri,  3 Jul 2026 19:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F285A6070B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783106256;
	bh=JRShl+Qq7qld6An1tEfeSTMeqBHxuyvNRiazRx764RE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZqV2sZKr6ga/HxM2/kaRJ10ysdYHB54CeNtLXThVfVuzq76JNS+u6G+9XrTK9izop
	 nXiz6FdKtSQYeQQIwU5BYJ8KhT6ALBugbrlcHUzn0oRekYSLE9dlixPnzD3Bebw8JZ
	 t36h6KB7poWM7cq4JIfnnzEkxwrIufhY2fcO+7N7AEutTmNNnhAEoJt66wbf7G+uP6
	 q8/gMi4u2UKqgdSvq+PJhqDexhRyfZXyvNmS5hd8E1U0HdWcyf4AcrHgWYaScsiZBu
	 0z6OUPvkWtn6/9Ml9/NqnV5vu8az3DvxJc9ZtuY5/ug+F5QIYJXznU3WZYzJk9oD+6
	 7LexcYrMDzf2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F285A6070B;
	Fri,  3 Jul 2026 19:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3989014F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A3C040056
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1Ykmei53ycX for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84EE640042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84EE640042
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84EE640042
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:17:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A17BFA4C04F0;
 Fri,  3 Jul 2026 21:17:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46028)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjOF-000000008Aq-0nNb;
 Fri, 03 Jul 2026 19:17:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  3 Jul 2026 21:17:31 +0200
Message-ID: <20260703191731.3691858-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783106251;
 bh=pV4Rl8ASSGvoayFb7/CZA/716ZAMSgG2/uzAKLu679c=;
 h=From:To:Cc:Subject:Date:From;
 b=pw1lrp0ZdULr96lKT+hFI1Wp/hTfO5Yga8EV6VqoduoSKSYwSBHvTvzFvpRGGE8qf
 Lkdv2OVlnN+hqx/sLGM9UoI7eEhJliWpa4/apuk27mGCcML9X1OAXS1K81DBtN9ixu
 6j97v9zaPvW+98Hg0wuZp8p9v7LAPaz3F4IYEr5rXgaQK0/5APv98tXQFJjyfAV9c0
 kor8z7hsKj0bsc0P76ttIbc97Hkmlevfng3bw0moN7c2m7N9sLxmc9jiYUiNcyLyU7
 3ofvMDIuCnsXYpALOrxYtpyUP63bFoKjTwa85L8e30LWR+kVeocDLP62W3PFGOA735
 CYvlAU6rHbaBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pw1lrp0Z
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version
 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
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

Removed patch which is included in this bump.

Fixes CVE-2026-5435, CVE-2026-6238 & CVE-2026-6791.

git shortlog  4070d808bea1c077eb7e7d52b52b91cae98205d5..

Adhemerval Zanella (3):
      math: Fix fma alignment when exponent difference is exactly 64 (BZ 34183)
      arm: Save/restore VFP registers in PLT trampolines (BZ 34144, BZ 15792)
      posix: Fix stack overflow in wordexp tilde expansion (BZ 34091, CVE-2026-6791)

Florian Weimer (8):
      iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
      resolv: Declare __p_class_syms, __p_type_syms for internal use
      resolv: Fix ns_sprintrrf formatting of class, type values (bug 34289)
      resolv: Improve formatting of unknown records in ns_sprintrrf
      resolv: Check for inet_ntop failure in ns_sprintrrf
      resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
      resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
      resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)

Jakub Jelinek (1):
      Rename __unused fields to __glibc_reserved.

John David Anglin (1):
      hppa: Fix missing call to __feraiseexcept (BZ 34306)

Pino Toscano (1):
      Hurd: comment PF_LINK/AF_LINK defines

Sam James (1):
      elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cache [BZ #34210]

Samuel Thibault (3):
      Hurd: comment PF_ROUTE/AF_ROUTE defines
      Hurd: comment ioctls which cannot currently compile
      Hurd: restore some SIOC ioctls

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3698cca2a91b570cbf9e038c708670b0c2860734

 ...-__unused-fields-to-__glibc_reserved.patch | 85 -------------------
 package/glibc/glibc.hash                      |  2 +-
 package/glibc/glibc.mk                        | 11 ++-
 package/localedef/localedef.mk                |  2 +-
 4 files changed, 12 insertions(+), 88 deletions(-)
 delete mode 100644 package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch

diff --git a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
deleted file mode 100644
index ae832a6035..0000000000
--- a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Tue, 17 Feb 2026 17:06:48 +0100
-Subject: [PATCH] Rename __unused fields to __glibc_reserved.
-
-__unused is often defined to __attribute__((unused)) in BSD
-sources and furthermore libstdc++ testsuite uses it as a macro
-to verify libstdc++ headers don't use __unused identifiers.
-In ~2012 glibc headers have been cleaned up, but some new
-uses of __unused have reappeared (s390 fenv.h already many
-years ago, the rest last November).
-
-Reviewed-by: Florian Weimer <fweimer@redhat.com>
-
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=18b97b03b7442d8ba0860e43145f8724c9e77b17
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- sysdeps/powerpc/nptl/bits/struct_mutex.h | 2 +-
- sysdeps/s390/fpu/bits/fenv.h             | 8 ++++----
- sysdeps/s390/nptl/bits/struct_mutex.h    | 2 +-
- sysdeps/x86/nptl/bits/struct_mutex.h     | 2 +-
- 4 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/sysdeps/powerpc/nptl/bits/struct_mutex.h b/sysdeps/powerpc/nptl/bits/struct_mutex.h
-index 1472af21f7..ebf2d50922 100644
---- a/sysdeps/powerpc/nptl/bits/struct_mutex.h
-+++ b/sysdeps/powerpc/nptl/bits/struct_mutex.h
-@@ -32,7 +32,7 @@ struct __pthread_mutex_s
-   int __kind;
- #if __WORDSIZE == 64
-   short __spins;
--  short __unused;
-+  short __glibc_reserved;
-   __pthread_list_t __list;
- # define __PTHREAD_MUTEX_HAVE_PREV      1
- #else
-diff --git a/sysdeps/s390/fpu/bits/fenv.h b/sysdeps/s390/fpu/bits/fenv.h
-index b9e844e393..33e88fbe9d 100644
---- a/sysdeps/s390/fpu/bits/fenv.h
-+++ b/sysdeps/s390/fpu/bits/fenv.h
-@@ -76,10 +76,10 @@ typedef unsigned int fexcept_t; /* size of fpc */
- typedef struct
- {
-   fexcept_t __fpc;
--  void *__unused;
--  /* The field __unused (formerly __ieee_instruction_pointer) is a relict from
--     commit "Remove PTRACE_PEEKUSER" (87b9b50f0d4b92248905e95a06a13c513dc45e59)
--     and isn't used anymore.  */
-+  void *__glibc_reserved;
-+  /* The field __glibc_reserved (formerly __ieee_instruction_pointer) is a
-+     relict from commit "Remove PTRACE_PEEKUSER"
-+     (87b9b50f0d4b92248905e95a06a13c513dc45e59) and isn't used anymore.  */
- } fenv_t;
- 
- /* If the default argument is used we use this value.  */
-diff --git a/sysdeps/s390/nptl/bits/struct_mutex.h b/sysdeps/s390/nptl/bits/struct_mutex.h
-index d069b485d1..571265267c 100644
---- a/sysdeps/s390/nptl/bits/struct_mutex.h
-+++ b/sysdeps/s390/nptl/bits/struct_mutex.h
-@@ -32,7 +32,7 @@ struct __pthread_mutex_s
-   int __kind;
- #if __WORDSIZE == 64
-   short __spins;
--  short __unused;
-+  short __glibc_reserved;
-   __pthread_list_t __list;
- # define __PTHREAD_MUTEX_HAVE_PREV      1
- #else
-diff --git a/sysdeps/x86/nptl/bits/struct_mutex.h b/sysdeps/x86/nptl/bits/struct_mutex.h
-index 9c19dff660..13c9894ad4 100644
---- a/sysdeps/x86/nptl/bits/struct_mutex.h
-+++ b/sysdeps/x86/nptl/bits/struct_mutex.h
-@@ -32,7 +32,7 @@ struct __pthread_mutex_s
-   int __kind;
- #ifdef __x86_64__
-   short __spins;
--  short __unused;
-+  short __glibc_reserved;
-   __pthread_list_t __list;
- # define __PTHREAD_MUTEX_HAVE_PREV      1
- #else
--- 
-2.47.3
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index a6e6874e1f..97862aef14 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  668f890b45fd8d32bb73783ad3b75fe1f396c5c3aa3c3832e616b4c3f0c6066b  glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5-git4.tar.gz
+sha256  647325cc2e9f2c6260f3c48d0385ac5e30cb60d2ec2e5afd649555c518c9bf60  glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4a6bc94634..5aa2ef5f99 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
+GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -46,6 +46,15 @@ GLIBC_IGNORE_CVES += CVE-2026-5928
 # Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 GLIBC_IGNORE_CVES += CVE-2026-5450
 
+# Fixed by glibc-2.43-42-ge64ae5a591f0604b7504df4df631857bb11cc78b
+GLIBC_IGNORE_CVES += CVE-2026-5435
+
+# Fixed by glibc-2.43-43-g3a418da6a3938756763980541e440dbdd46900fb
+GLIBC_IGNORE_CVES += CVE-2026-6238
+
+# Fixed by glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
+GLIBC_IGNORE_CVES += CVE-2026-6791
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4890e095e3..732ed6d4ad 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
+LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
