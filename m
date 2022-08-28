Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D92ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C06860B33;
	Sun, 28 Aug 2022 09:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C06860B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOQ_M2LriE33; Sun, 28 Aug 2022 09:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB2960AF7;
	Sun, 28 Aug 2022 09:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AB2960AF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5031BF97C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CC6409DB
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CC6409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSlaUzptDO6E for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:32:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9D9F409A0
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D9F409A0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2BC5987E66; Sun, 28 Aug 2022 09:17:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 11:26:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c2d07b0b39ebce7f9537fb930ce7b977fe75f4e
X-Git-Newrev: b218ba178dd10b53b9ff676958d43147e5ebfb5a
X-Patchwork-Hint: ignore
Message-Id: <20220828091717.2BC5987E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=b218ba178dd10b53b9ff676958d43147e5ebfb5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../libgpgme/0001-Fix-build-without-threads.patch  | 59 ++++++++++++++++++++++
 package/libgpgme/libgpgme.mk                       |  3 ++
 2 files changed, 62 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
