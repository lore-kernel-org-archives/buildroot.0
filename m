Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15709C636CC
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 20:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B61EE405A7;
	Sun, 19 Feb 2023 20:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B61EE405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNtrGx1dpR6x; Sun, 19 Feb 2023 20:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9193405A4;
	Sun, 19 Feb 2023 20:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9193405A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1F781BF2B6
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BA0181BB4
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA0181BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCizk7RZxmjY for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 20:55:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9D4681BC0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 20:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D4681BC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A93F0860C8; Sun, 19 Feb 2023 20:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 21:55:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8797f3fb272e9c1a5fe6a1953cacf6e5065a133a
X-Git-Newrev: 99d5f1f7d3cd4b1f2041edbddd5d09caacf4848d
X-Patchwork-Hint: ignore
Message-Id: <20230219205533.A93F0860C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: fix build without makeinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d5f1f7d3cd4b1f2041edbddd5d09caacf4848d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without makeinfo raised since the
addition of the package in commit
9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found

Fixes:
 - http://autobuild.buildroot.org/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/speechd/0001-add-disable-doc.patch | 78 ++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/package/speechd/0001-add-disable-doc.patch b/package/speechd/0001-add-disable-doc.patch
new file mode 100644
index 0000000000..dd17b10e4f
--- /dev/null
+++ b/package/speechd/0001-add-disable-doc.patch
@@ -0,0 +1,78 @@
+From d88557d3c29c33f76af20cb7a6eb798f6f598c23 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Feb 2023 15:18:35 +0100
+Subject: [PATCH] add --disable-doc
+
+Allow the user to disable documentation through --disable-doc to avoid
+the following build failure without makeinfo:
+
+make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/doc'
+  MAKEINFO ssip.info
+  MAKEINFO spd-say.info
+/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
+/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <https://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <https://www.gnu.org/software/make/>
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <https://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <https://www.gnu.org/software/make/>
+make[3]: *** [Makefile:492: ssip.info] Error 127
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/brailcom/speechd/pull/810]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 4 ++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 26617c78..480eb50e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -22,7 +22,11 @@ pkgconfig_DATA = speech-dispatcher.pc
+ 
+ BUILT_SOURCES = $(top_srcdir)/.version
+ 
+-SUBDIRS= include locale src config doc po
++SUBDIRS= include locale src config po
++
++if ENABLE_DOC
++SUBDIRS += doc
++endif
+ 
+ EXTRA_DIST= config.rpath COPYING.LGPL COPYING.GPL-2 COPYING.GPL-3 ANNOUNCE BUGS FAQ README.md README.packagers README.translators README.overview.md README.style.md build.sh speech-dispatcherd.service.in speech-dispatcher.socket speech-dispatcher.service.in po/Makevars.in po/README
+ 
+diff --git a/configure.ac b/configure.ac
+index faaa8629..4f2af908 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -168,6 +168,10 @@ AC_SUBST([EXTRA_SOCKET_LIBS])
+ AC_SUBST([ERROR_CFLAGS])
+ AC_SUBST([RDYNAMIC])
+ 
++AC_ARG_ENABLE([doc],
++              [AC_HELP_STRING([--disable-doc], [turn off documentation])])
++AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
++
+ # Check for python support.
+ # Python 3 or greater required
+ AC_ARG_ENABLE([python],
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
