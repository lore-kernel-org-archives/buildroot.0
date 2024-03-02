Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ADEC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 10:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7478F606A5;
	Sat,  2 Mar 2024 10:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siqkRvQV2F6Z; Sat,  2 Mar 2024 10:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA99608C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA99608C1;
	Sat,  2 Mar 2024 10:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8A581BF47E
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 10:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A25D5839DC
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 10:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6y7f7ytwtI6 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 10:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 907CD839E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 907CD839E5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 907CD839E5
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 10:03:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412dabe26easo455395e9.2
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 02:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709373786; x=1709978586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xJHShdAjIxLQqJjWDq8LQ6IabLP9LtOPQBkAwbAR0l4=;
 b=J5XpaM1BpH0HVsQ/zV3+CBWzdYCOfRscVtqkEhVhk3eLQOhRiQsU0EEQIENbJJvTk/
 ME5Hll7l7aaNXaZm2g06G0vsiSX7x+H8vZLurLghREQKE2k4kJjAwNZLLF8kljchLI/6
 ZuEHZoWJ6/f4k2rN1o3jFh4IZFw+ELfQG/7uRDv5bFyu846motnNdElNvDhTTZUeoH+w
 Eg/C4gSJM0lm71rf7arLyB2dcNc2vfVuIvPYa1bXnSVfsgYi3rxnROao4yKeM7ecXh/+
 lzehhht7GXB2StjqX3t8rfiIsZ3PQiIqjZ85T7NkMwAtjzwjASBQu7h4DcAawjQ41Zp9
 WDyg==
X-Gm-Message-State: AOJu0YxkrRqg+FE5uurb5+LNL2pVBCyzZbuzVrs1FGsQ1gujR4ZIbm18
 Gohl67ESSgeKrOaGvSMg2pRWc5IOKEXPXNW5NMN3ri/t+sV0yF0Zo/sw+d88
X-Google-Smtp-Source: AGHT+IFqKRz67cf6GBM3wbKHCKtIFtgAAIh/+df5BOOvW3zsTdsji48Vzi3rWphhU1c0UIdqXIc8IQ==
X-Received: by 2002:a05:600c:a39c:b0:412:bd3a:fb8a with SMTP id
 hn28-20020a05600ca39c00b00412bd3afb8amr2992677wmb.22.1709373785183; 
 Sat, 02 Mar 2024 02:03:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b004129a1097e7sm10956518wmc.12.2024.03.02.02.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 02:03:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 11:02:59 +0100
Message-ID: <20240302100259.251307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709373786; x=1709978586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xJHShdAjIxLQqJjWDq8LQ6IabLP9LtOPQBkAwbAR0l4=;
 b=Cy7YpwfI+a06wLLkfDK5t3vCv6D/cVf38uhAcqhPcp50Ds+A17yohEtVoXaaSkFbvo
 3RyoIBeCRBvS14qXkVPFQONNto7HsfeFb4apGnSqsnh9pklgQoxj7HxF5jTBn/mPGpyQ
 JPOviUpQCO4+n6GhfUKEbOjDFh+hPIKt35uJCssjig+4urjrnzFFyr/ZfYfOYC72GK3P
 PgiDur+uB0hKb4eSkplHL6/RnnRE7GYp0NHrDSukZO3U0ejbGqst24teZDXukXuk+CKU
 1rHx3clBxlHxKCkI1Yql1rt5YNaYyq673VytRHsD6jJaLA/EyhWZaNs6oqndMMRaL1BY
 e6Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cy7YpwfI
Subject: [Buildroot] [PATCH 1/1] package/powertop: fix gettext build
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
Cc: Steven Noonan <steven@uplinklabs.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix gettext build raised since bump to version 2.15 in commit
d65b960859046be486ced6c490d3671bd1392661:

*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.20

Fixes: d65b960859046be486ced6c490d3671bd1392661
 - http://autobuild.buildroot.org/results/bb80a7842d18651e5069f3a91f06a9c23218d260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-gettext-update-to-0-20-2.patch       | 393 ++++++++++++++++++
 1 file changed, 393 insertions(+)
 create mode 100644 package/powertop/0002-gettext-update-to-0-20-2.patch

diff --git a/package/powertop/0002-gettext-update-to-0-20-2.patch b/package/powertop/0002-gettext-update-to-0-20-2.patch
new file mode 100644
index 0000000000..9c26b4044f
--- /dev/null
+++ b/package/powertop/0002-gettext-update-to-0-20-2.patch
@@ -0,0 +1,393 @@
+From 08c34b1384c8493d72e8b48914d3e696d3ac8a44 Mon Sep 17 00:00:00 2001
+From: Joe Konno <joe.konno@intel.com>
+Date: Thu, 28 May 2020 11:43:58 -0700
+Subject: [PATCH] gettext: update to 0.20.2
+
+Also remove the ChangeLog files-- let git take care of history.
+
+Touch a file in the m4/ directory to silence autotools warnings.
+
+Signed-off-by: Joe Konno <joe.konno@intel.com>
+
+Upstream: https://github.com/fenrus75/powertop/commit/08c34b1384c8493d72e8b48914d3e696d3ac8a44
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac      |   2 +-
+ m4/.keep          |   0
+ m4/ChangeLog      |  11 ---
+ po/ChangeLog      |  11 ---
+ po/Makefile.in.in | 176 ++++++++++++++++++++++++++++++----------------
+ 5 files changed, 115 insertions(+), 85 deletions(-)
+ create mode 100644 m4/.keep
+ delete mode 100644 m4/ChangeLog
+ delete mode 100644 po/ChangeLog
+
+diff --git a/configure.ac b/configure.ac
+index c7059979..1e32bcc9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,7 +26,7 @@ GETTEXT_PACKAGE=powertop
+ AC_SUBST([GETTEXT_PACKAGE])
+ AM_SILENT_RULES([yes])
+ AM_GNU_GETTEXT([external])
+-AM_GNU_GETTEXT_VERSION([0.18.2])
++AM_GNU_GETTEXT_VERSION([0.20.2])
+ 
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ # Checks for programs.
+diff --git a/m4/.keep b/m4/.keep
+new file mode 100644
+index 00000000..e69de29b
+diff --git a/m4/ChangeLog b/m4/ChangeLog
+deleted file mode 100644
+index f415dc03..00000000
+--- a/m4/ChangeLog
++++ /dev/null
+@@ -1,11 +0,0 @@
+-2016-08-03  gettextize  <bug-gnu-gettext@gnu.org>
+-
+-	* gettext.m4: New file, from gettext-0.18.2.
+-	* iconv.m4: New file, from gettext-0.18.2.
+-	* lib-ld.m4: New file, from gettext-0.18.2.
+-	* lib-link.m4: New file, from gettext-0.18.2.
+-	* lib-prefix.m4: New file, from gettext-0.18.2.
+-	* nls.m4: New file, from gettext-0.18.2.
+-	* po.m4: New file, from gettext-0.18.2.
+-	* progtest.m4: New file, from gettext-0.18.2.
+-
+diff --git a/po/ChangeLog b/po/ChangeLog
+deleted file mode 100644
+index 11de90cb..00000000
+--- a/po/ChangeLog
++++ /dev/null
+@@ -1,11 +0,0 @@
+-2016-08-03  gettextize  <bug-gnu-gettext@gnu.org>
+-
+-	* Makefile.in.in: Upgrade to gettext-0.18.2.
+-	* boldquot.sed: New file, from gettext-0.18.2.
+-	* en@boldquot.header: New file, from gettext-0.18.2.
+-	* en@quot.header: New file, from gettext-0.18.2.
+-	* insert-header.sin: New file, from gettext-0.18.2.
+-	* quot.sed: New file, from gettext-0.18.2.
+-	* remove-potcdate.sin: New file, from gettext-0.18.2.
+-	* Rules-quot: New file, from gettext-0.18.2.
+-
+diff --git a/po/Makefile.in.in b/po/Makefile.in.in
+index fce63a6e..de980e04 100644
+--- a/po/Makefile.in.in
++++ b/po/Makefile.in.in
+@@ -1,20 +1,20 @@
+ # Makefile for PO directory in any package using GNU gettext.
+-# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
++# Copyright (C) 1995-2000 Ulrich Drepper <drepper@gnu.ai.mit.edu>
++# Copyright (C) 2000-2020 Free Software Foundation, Inc.
+ #
+-# This file can be copied and used freely without restrictions.  It can
+-# be used in projects which are not available under the GNU General Public
+-# License but which still want to provide support for the GNU gettext
+-# functionality.
+-# Please note that the actual code of GNU gettext is covered by the GNU
+-# General Public License and is *not* in the public domain.
++# Copying and distribution of this file, with or without modification,
++# are permitted in any medium without royalty provided the copyright
++# notice and this notice are preserved.  This file is offered as-is,
++# without any warranty.
+ #
+-# Origin: gettext-0.18.2
+-GETTEXT_MACRO_VERSION = 0.18
++# Origin: gettext-0.20.2
++GETTEXT_MACRO_VERSION = 0.20
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+ PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
+ 
++SED = @SED@
+ SHELL = /bin/sh
+ @SET_MAKE@
+ 
+@@ -44,20 +44,22 @@ install_sh = $(SHELL) @install_sh@
+ MKDIR_P = @MKDIR_P@
+ mkdir_p = @mkdir_p@
+ 
++# When building gettext-tools, we prefer to use the built programs
++# rather than installed programs.  However, we can't do that when we
++# are cross compiling.
++CROSS_COMPILING = @CROSS_COMPILING@
++
+ GMSGFMT_ = @GMSGFMT@
+ GMSGFMT_no = @GMSGFMT@
+ GMSGFMT_yes = @GMSGFMT_015@
+ GMSGFMT = $(GMSGFMT_$(USE_MSGCTXT))
+-MSGFMT_ = @MSGFMT@
+-MSGFMT_no = @MSGFMT@
+-MSGFMT_yes = @MSGFMT_015@
+-MSGFMT = $(MSGFMT_$(USE_MSGCTXT))
+ XGETTEXT_ = @XGETTEXT@
+ XGETTEXT_no = @XGETTEXT@
+ XGETTEXT_yes = @XGETTEXT_015@
+ XGETTEXT = $(XGETTEXT_$(USE_MSGCTXT))
+-MSGMERGE = msgmerge
++MSGMERGE = @MSGMERGE@
+ MSGMERGE_UPDATE = @MSGMERGE@ --update
++MSGMERGE_FOR_MSGFMT_OPTION = @MSGMERGE_FOR_MSGFMT_OPTION@
+ MSGINIT = msginit
+ MSGCONV = msgconv
+ MSGFILTER = msgfilter
+@@ -76,29 +78,56 @@ POTFILES = \
+ 
+ CATALOGS = @CATALOGS@
+ 
++POFILESDEPS_ = $(srcdir)/$(DOMAIN).pot
++POFILESDEPS_yes = $(POFILESDEPS_)
++POFILESDEPS_no =
++POFILESDEPS = $(POFILESDEPS_$(PO_DEPENDS_ON_POT))
++
++DISTFILESDEPS_ = update-po
++DISTFILESDEPS_yes = $(DISTFILESDEPS_)
++DISTFILESDEPS_no =
++DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
++
+ # Makevars gets inserted here. (Don't remove this line!)
+ 
+-.SUFFIXES:
+-.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update
++all: all-@USE_NLS@
+ 
+-.po.mo:
+-	@echo "$(MSGFMT) -c -o $@ $<"; \
+-	$(MSGFMT) -c -o t-$@ $< && mv t-$@ $@
+ 
++.SUFFIXES:
++.SUFFIXES: .po .gmo .sed .sin .nop .po-create .po-update
++
++# The .pot file, stamp-po, .po files, and .gmo files appear in release tarballs.
++# The GNU Coding Standards say in
++# <https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html>:
++#   "GNU distributions usually contain some files which are not source files
++#    ... . Since these files normally appear in the source directory, they
++#    should always appear in the source directory, not in the build directory.
++#    So Makefile rules to update them should put the updated files in the
++#    source directory."
++# Therefore we put these files in the source directory, not the build directory.
++
++# During .po -> .gmo conversion, take into account the most recent changes to
++# the .pot file. This eliminates the need to update the .po files when the
++# .pot file has changed, which would be troublesome if the .po files are put
++# under version control.
++$(GMOFILES): $(srcdir)/$(DOMAIN).pot
+ .po.gmo:
+ 	@lang=`echo $* | sed -e 's,.*/,,'`; \
+ 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+-	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.po"; \
+-	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
++	echo "$${cdcmd}rm -f $${lang}.gmo && $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DOMAIN).pot && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.1po && rm -f $${lang}.1po"; \
++	cd $(srcdir) && \
++	rm -f $${lang}.gmo && \
++	$(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DOMAIN).pot && \
++	$(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.1po && \
++	mv t-$${lang}.gmo $${lang}.gmo && \
++	rm -f $${lang}.1po
+ 
+ .sin.sed:
+ 	sed -e '/^#/d' $< > t-$@
+ 	mv t-$@ $@
+ 
+ 
+-all: all-@USE_NLS@
+-
+-all-yes: stamp-po
++all-yes: $(srcdir)/stamp-po
+ all-no:
+ 
+ # Ensure that the gettext macros and this Makefile.in.in are in sync.
+@@ -112,24 +141,24 @@ CHECK_MACRO_VERSION = \
+ # internationalized messages, no $(srcdir)/$(DOMAIN).pot is created (because
+ # we don't want to bother translators with empty POT files). We assume that
+ # LINGUAS is empty in this case, i.e. $(POFILES) and $(GMOFILES) are empty.
+-# In this case, stamp-po is a nop (i.e. a phony target).
+-
+-# stamp-po is a timestamp denoting the last time at which the CATALOGS have
+-# been loosely updated. Its purpose is that when a developer or translator
+-# checks out the package via CVS, and the $(DOMAIN).pot file is not in CVS,
+-# "make" will update the $(DOMAIN).pot and the $(CATALOGS), but subsequent
+-# invocations of "make" will do nothing. This timestamp would not be necessary
+-# if updating the $(CATALOGS) would always touch them; however, the rule for
+-# $(POFILES) has been designed to not touch files that don't need to be
+-# changed.
+-stamp-po: $(srcdir)/$(DOMAIN).pot
++# In this case, $(srcdir)/stamp-po is a nop (i.e. a phony target).
++
++# $(srcdir)/stamp-po is a timestamp denoting the last time at which the CATALOGS
++# have been loosely updated. Its purpose is that when a developer or translator
++# checks out the package from a version control system, and the $(DOMAIN).pot
++# file is not under version control, "make" will update the $(DOMAIN).pot and
++# the $(CATALOGS), but subsequent invocations of "make" will do nothing. This
++# timestamp would not be necessary if updating the $(CATALOGS) would always
++# touch them; however, the rule for $(POFILES) has been designed to not touch
++# files that don't need to be changed.
++$(srcdir)/stamp-po: $(srcdir)/$(DOMAIN).pot
+ 	@$(CHECK_MACRO_VERSION)
+ 	test ! -f $(srcdir)/$(DOMAIN).pot || \
+ 	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
+ 	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
+-	  echo "touch stamp-po" && \
+-	  echo timestamp > stamp-poT && \
+-	  mv stamp-poT stamp-po; \
++	  echo "touch $(srcdir)/stamp-po" && \
++	  echo timestamp > $(srcdir)/stamp-poT && \
++	  mv $(srcdir)/stamp-poT $(srcdir)/stamp-po; \
+ 	}
+ 
+ # Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
+@@ -142,15 +171,23 @@ stamp-po: $(srcdir)/$(DOMAIN).pot
+ # heuristic whether some file in the top level directory mentions "GNU xyz".
+ # If GNU 'find' is available, we avoid grepping through monster files.
+ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
+-	if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
+-	       LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
+-	     else \
+-	       LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+-	     fi; \
+-	   } | grep -v 'libtool:' >/dev/null; then \
+-	  package_gnu='GNU '; \
++	package_gnu="$(PACKAGE_GNU)"; \
++	test -n "$$package_gnu" || { \
++	  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
++	         LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep -i 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
++	       else \
++	         LC_ALL=C grep -i 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
++	       fi; \
++	     } | grep -v 'libtool:' >/dev/null; then \
++	     package_gnu=yes; \
++	   else \
++	     package_gnu=no; \
++	   fi; \
++	}; \
++	if test "$$package_gnu" = "yes"; then \
++	  package_prefix='GNU '; \
+ 	else \
+-	  package_gnu=''; \
++	  package_prefix=''; \
+ 	fi; \
+ 	if test -n '$(MSGID_BUGS_ADDRESS)' || test '$(PACKAGE_BUGREPORT)' = '@'PACKAGE_BUGREPORT'@'; then \
+ 	  msgid_bugs_address='$(MSGID_BUGS_ADDRESS)'; \
+@@ -160,22 +197,30 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
+ 	case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+ 	  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
+ 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+-	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
++	      --add-comments=TRANSLATORS: \
+ 	      --files-from=$(srcdir)/POTFILES.in \
+ 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+ 	      --msgid-bugs-address="$$msgid_bugs_address" \
++	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+ 	    ;; \
+ 	  *) \
+ 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+-	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
++	      --add-comments=TRANSLATORS: \
+ 	      --files-from=$(srcdir)/POTFILES.in \
+ 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+-	      --package-name="$${package_gnu}@PACKAGE@" \
++	      --package-name="$${package_prefix}@PACKAGE@" \
+ 	      --package-version='@VERSION@' \
+ 	      --msgid-bugs-address="$$msgid_bugs_address" \
++	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+ 	    ;; \
+ 	esac
+ 	test ! -f $(DOMAIN).po || { \
++	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
++	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
++	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po && \
++	    rm -f $(DOMAIN).1po \
++	    || exit 1; \
++	  fi; \
+ 	  if test -f $(srcdir)/$(DOMAIN).pot; then \
+ 	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
+ 	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
+@@ -198,17 +243,20 @@ $(srcdir)/$(DOMAIN).pot:
+ 
+ # This target rebuilds a PO file if $(DOMAIN).pot has changed.
+ # Note that a PO file is not touched if it doesn't need to be changed.
+-$(POFILES): $(srcdir)/$(DOMAIN).pot
++$(POFILES): $(POFILESDEPS)
++	@test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot
+ 	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
+ 	if test -f "$(srcdir)/$${lang}.po"; then \
+ 	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+-	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
++	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} --previous $${lang}.po $(DOMAIN).pot"; \
+ 	  cd $(srcdir) \
+ 	    && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+-	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
++	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \
+ 	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \
++	           0.1[6-7] | 0.1[6-7].*) \
++	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --previous $${lang}.po $(DOMAIN).pot;; \
+ 	           *) \
+-	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot;; \
++	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} --previous $${lang}.po $(DOMAIN).pot;; \
+ 	         esac; \
+ 	       }; \
+ 	else \
+@@ -343,28 +391,30 @@ check: all
+ 
+ info dvi ps pdf html tags TAGS ctags CTAGS ID:
+ 
++install-dvi install-ps install-pdf install-html:
++
+ mostlyclean:
+ 	rm -f remove-potcdate.sed
+-	rm -f stamp-poT
++	rm -f $(srcdir)/stamp-poT
+ 	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
+ 	rm -fr *.o
+ 
+ clean: mostlyclean
+ 
+ distclean: clean
+-	rm -f Makefile Makefile.in POTFILES *.mo
++	rm -f Makefile Makefile.in POTFILES
+ 
+ maintainer-clean: distclean
+ 	@echo "This command is intended for maintainers to use;"
+ 	@echo "it deletes files that may require special tools to rebuild."
+-	rm -f stamp-po $(GMOFILES)
++	rm -f $(srcdir)/$(DOMAIN).pot $(srcdir)/stamp-po $(GMOFILES)
+ 
+ distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
+ dist distdir:
+-	$(MAKE) update-po
++	test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
+ 	@$(MAKE) dist2
+ # This is a separate target because 'update-po' must be executed before.
+-dist2: stamp-po $(DISTFILES)
++dist2: $(srcdir)/stamp-po $(DISTFILES)
+ 	dists="$(DISTFILES)"; \
+ 	if test "$(PACKAGE)" = "gettext-tools"; then \
+ 	  dists="$$dists Makevars.template"; \
+@@ -405,17 +455,19 @@ update-po: Makefile
+ 
+ .nop.po-update:
+ 	@lang=`echo $@ | sed -e 's/\.po-update$$//'`; \
+-	if test "$(PACKAGE)" = "gettext-tools"; then PATH=`pwd`/../src:$$PATH; fi; \
++	if test "$(PACKAGE)" = "gettext-tools" && test "$(CROSS_COMPILING)" != "yes"; then PATH=`pwd`/../src:$$PATH; fi; \
+ 	tmpdir=`pwd`; \
+ 	echo "$$lang:"; \
+ 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+-	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
++	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang --previous $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
+ 	cd $(srcdir); \
+ 	if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+-	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
++	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \
+ 	         $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
++	       0.1[6-7] | 0.1[6-7].*) \
++	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --previous -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+ 	       *) \
+-	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
++	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang --previous -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+ 	     esac; \
+ 	   }; then \
+ 	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
