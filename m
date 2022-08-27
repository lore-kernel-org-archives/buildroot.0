Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05594ECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 21:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627ED40929;
	Sat, 27 Aug 2022 21:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627ED40929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rj7hEB-0lR3s; Sat, 27 Aug 2022 21:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DA5408EA;
	Sat, 27 Aug 2022 21:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1DA5408EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD491BF479
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3737582662
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3737582662
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXWzIFrjHU8P for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 21:36:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC1A81D70
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCC1A81D70
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 21:36:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e20so5693776wri.13
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 14:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=s4HSvvjI9YHb+Z6NHr8jUqVxy21lc2Js01nRh1sDIRI=;
 b=QlZYFCh6guAaiUn1VHuAvXQj17ggdUTZ2vGih1b7uDbQqYCiYad15ci5f1S0g5jgSt
 P4/ofBcu/ZFAvYt5ONTwu/chW5vvBBHP+KL8l1bxNyyhhw+2knlYuDXsh4Y24/IWh+8J
 C+RbpqYAmLMW0VFWYb9rCm8IIW28uVIyUcTlqR4RU7Rhpb+6vh+mwbjf24/IN8Q0okuV
 pi0FFq3vxGfRWTToOoijSSBMXMjQZ00g2Xu6YIYFCFLQsDn8gJNuv7w4eGTRAVT78Gms
 JQvV8j+OgrQV+CRqrJJ0bQq7MnlAJ2oNBrYPG/ywQMYLV5PrBSmzLMG8hoioVaOy2ZH7
 4PRg==
X-Gm-Message-State: ACgBeo2SrKnrOJyTzwaDIwDCZkJ5dgf+3fP3a0P1G4mehIad/Tk19rL2
 AH32PZOEI7SBqJaenRao5krm255wsL0=
X-Google-Smtp-Source: AA6agR6KSlDtMFYxt78cegXaA0yru2pCMt+Sia567AcJBWX2qITLFVh/x3bJhgf7pGh2T+gRqz3F/g==
X-Received: by 2002:a5d:6d8a:0:b0:225:2e6c:8a1b with SMTP id
 l10-20020a5d6d8a000000b002252e6c8a1bmr2884636wrs.647.1661636164226; 
 Sat, 27 Aug 2022 14:36:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003a682354f63sm4276103wms.11.2022.08.27.14.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 14:36:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 23:35:58 +0200
Message-Id: <20220827213558.476660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=s4HSvvjI9YHb+Z6NHr8jUqVxy21lc2Js01nRh1sDIRI=;
 b=myUsKIJdUukqir3Dxiog9sgjv2bkWpkXZ+tcuZ3fRcyKIy1rfDFetrT15pmUECcOKY
 25uEJbchSBSXpNm8EQLiwDQ+m6e4vZ9ooWpLDCzI7sGALYGTeKP75qWDQNN2E3h1wESf
 iLT/x0FV99h3HjbHTYgecXwApFA6W938ztGamhkIAfPbMTv6liX7yqWtcKeAvHrbj1qJ
 40O/oy+3BI46mGSyvyHpEkXm+a0jTNeoB0zYdFFqnGAP1FNVvHFA9r6HKA90wp8OG3Hc
 IthNV9x4641ssO9F/UXl2qY40TtZML0Pi2ONN8jTT7oZLUn+9eDBUXBTbtWdOK87PzxD
 W33Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=myUsKIJd
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: fix build without threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 1.17.1 in commit 3f121357ae225be9ac2fbf4505027c2cc690626b and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=f3177d3ee0a1d30e15f33ff226b5e4c96b7610db:

run-wkdlookup.cpp: In function 'int main(int, char**)':
run-wkdlookup.cpp:130:18: error: 'std::this_thread' has not been declared
  130 |             std::this_thread::sleep_for(std::chrono::milliseconds{250 * cnt});
      |                  ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2915f6105bae595274fabaa12de7cc53926d22d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-build-without-threads.patch      | 59 +++++++++++++++++++
 package/libgpgme/libgpgme.mk                  |  3 +
 2 files changed, 62 insertions(+)
 create mode 100644 package/libgpgme/0001-Fix-build-without-threads.patch

diff --git a/package/libgpgme/0001-Fix-build-without-threads.patch b/package/libgpgme/0001-Fix-build-without-threads.patch
new file mode 100644
index 0000000000..caa4ed7d78
--- /dev/null
+++ b/package/libgpgme/0001-Fix-build-without-threads.patch
@@ -0,0 +1,59 @@
+From fc1b821c80c78f4ae635639c7fce5bad754edda7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 27 Aug 2022 23:24:44 +0200
+Subject: [PATCH] Fix build without threads
+
+Allow the user to disable cpp tests to avoid the following build failure
+without threads raised since version 1.17.1 and
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=f3177d3ee0a1d30e15f33ff226b5e4c96b7610db
+
+run-wkdlookup.cpp: In function 'int main(int, char**)':
+run-wkdlookup.cpp:130:18: error: 'std::this_thread' has not been declared
+  130 |             std::this_thread::sleep_for(std::chrono::milliseconds{250 * cnt});
+      |                  ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2915f6105bae595274fabaa12de7cc53926d22d0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://dev.gnupg.org/T6165]
+---
+ configure.ac         | 5 +++++
+ lang/cpp/Makefile.am | 6 +++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e7fe04a7..d1c87486 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -553,6 +553,11 @@ AC_ARG_ENABLE(g13-test,
+          run_g13_test=$enableval)
+ AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
+ 
++run_cpp_test="yes"
++AC_ARG_ENABLE(cpp-test,
++  AS_HELP_STRING([--disable-cpp-test],[disable CPP regression test]),
++         run_cpp_test=$enableval)
++AM_CONDITIONAL(RUN_CPP_TESTS, test "$run_cpp_test" = "yes")
+ 
+ # Checks for header files.
+ AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h stdint.h
+diff --git a/lang/cpp/Makefile.am b/lang/cpp/Makefile.am
+index 724da6ca..243c463d 100644
+--- a/lang/cpp/Makefile.am
++++ b/lang/cpp/Makefile.am
+@@ -18,6 +18,10 @@
+ # License along with this program; if not, see <https://gnu.org/licenses/>.
+ # SPDX-License-Identifier: LGPL-2.1-or-later
+ 
+-SUBDIRS = src tests
++SUBDIRS = src
++
++if RUN_CPP_TESTS
++SUBDIRS += tests
++endif
+ 
+ EXTRA_DIST = README
+-- 
+2.35.1
+
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 1b57b18872..2120ee8e3c 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -14,6 +14,8 @@ LIBGPGME_CPE_ID_PRODUCT = gpgme
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_CONFIG_SCRIPTS = gpgme-config
+# We're patching configure.ac
+LIBGPGME_AUTORECONF = YES
 
 LIBGPGME_LANGUAGE_BINDINGS = cl
 # C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
@@ -28,6 +30,7 @@ LIBGPGME_CONF_OPTS = \
 	--disable-gpgconf-test \
 	--disable-g13-test \
 	--disable-gpg-test \
+	--disable-cpp-test \
 	--enable-languages=$(subst $(space),$(comma),$(LIBGPGME_LANGUAGE_BINDINGS))
 
 # Handle argp-standalone or it errors out during build
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
