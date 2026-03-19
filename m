Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DEC1090223
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 13:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2573841D9;
	Thu, 19 Mar 2026 13:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3luBCpPY4Pk; Thu, 19 Mar 2026 13:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D944841DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773925488;
	bh=20PPxPNQseq54PTVyNJaNvMexBinIGAgQxydZyAAw/o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kR59lTnEtXHZcprXCskT+hgG6a/zwKnCc5tGW6OAAUcAML81YLWdedtl/KmJt2zZh
	 R+bJTpI/Zo2xA8Ktsh+NIDF6xh65PwEWRDl5b2jH5DoHOw5BdDuKVqI3uo/D+I74AQ
	 6lpfD2v9md6JCkOQnE1B7qs5EQwf03bDy2bEz3OuVWIYZSQ58meMGwzFW2971M2uxp
	 sXlKVe/yCEN+AO3o/DcuWeg9Id1mCkL0kiwTVnI3Ro8mrRyS/5aUUxZ0TqICjyW1Zs
	 gd3gmD6n4FrwUXDUPppTdTRArExtl9GQy/gMZl0avklXUfrD2jnfl2LLxlcMWsy0d4
	 keUHS4PUWX9LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D944841DA;
	Thu, 19 Mar 2026 13:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 400201B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C63340F8A
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5buwAEqXuVA for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 13:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84CF340F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CF340F89
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84CF340F89
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:04:42 +0000 (UTC)
X-CSE-ConnectionGUID: Vri3pudvTBOb2EbxwNHfCg==
X-CSE-MsgGUID: 2jvKgy54S3qxIfUaGgX11Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 15:04:40 +0200
X-CSE-ConnectionGUID: ITKRcS+pSJGda78R7IJqQQ==
X-CSE-MsgGUID: X3ccBcdrSDOXhlCk2eryTw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces02_data.me-corp.lan with SMTP; 19 Mar 2026 15:07:52 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 19 Mar 2026 15:04:38 +0200
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Thu, 19 Mar 2026 15:04:30 +0200
Message-ID: <20260319130431.53092-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773925482; x=1805461482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TnygM85UZYZCjEGovoC7k1dU1Wao0cXcmmG7Rd1VwX8=;
 b=f8IRSnu5+PgrjT2k9DlkOTxm8I2vLME/nNLXIeOzkB4XWELWPZF4uAlK
 Zi27LutWTfSmkK64jc2jFu8q7iFqPZEvlxxWbw3ZBLTZdbjsmAYZBJo3a
 vi6cninnA7C+GL14r0t9akloagNA99iv8UheG/ELV25I3kgyQ6qfYYs8/
 HOoEaTk79XTpYn50t32EX98ubwE967imrAoXFnVaJNdY/a3uoca3PinWL
 5dzigSvz3FcfwiIEnhHDtPeg3r2rC8OzpzGF1vm3SrJv1xMrvMDATp1lo
 X5P+jVr17zRy2Gr2h/Xdxeeu83DMpUdFxr7vtA0PkM53iw/BfBWhnMLoX
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH] package/autoconf: add patch to avoid building
 doc, man, and tests
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the patch
0002-Makefile.am-remove-doc-man-and-tests-local.mk.patch that removes the
inclusing of the doc, man, and tests local.mk.

As indicated in the patch:
There is a dependency error in the test wrapper template, fixed by
autofconf upstream commit a10ce78ead55 "tests/local.mk: fix dependencies
for generating the wrapper template".

While this patch would fix the issue, this causes issues on build
environments that do not have automake 16. Since Buildroot automake
package depends on autoconf, we have a chicken-and-egg problem. However,
since we do not need the documentation, the tests, or the manpages, we
can simply drop them from autoconf, and avoiding the dependency issue
completely.

This patch removes from Makefile.am the inclusion of the doc, man, and
tests local.mk. The other files have been regenerated with "autoreconf"
version 2.7.1, using automake 1.16.5.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 ...am-remove-doc-man-and-tests-local.mk.patch | 2555 +++++++++++++++++
 1 file changed, 2555 insertions(+)
 create mode 100644 package/autoconf/0002-Makefile.am-remove-doc-man-and-tests-local.mk.patch

diff --git a/package/autoconf/0002-Makefile.am-remove-doc-man-and-tests-local.mk.patch b/package/autoconf/0002-Makefile.am-remove-doc-man-and-tests-local.mk.patch
new file mode 100644
index 0000000000..731454d74f
--- /dev/null
+++ b/package/autoconf/0002-Makefile.am-remove-doc-man-and-tests-local.mk.patch
@@ -0,0 +1,2555 @@
+From 33a99bf3eaba64e593b3266bdc3799ea0c9d8a0b Mon Sep 17 00:00:00 2001
+From: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
+Date: Thu, 19 Mar 2026 13:56:44 +0200
+Subject: [PATCH] Makefile.am: remove doc, man, and tests local.mk
+
+There is a dependency error in the test wrapper template, fixed by
+autofconf upstream commit a10ce78ead55 "tests/local.mk: fix dependencies
+for generating the wrapper template".
+
+While this patch would fix the issue, this causes issues on build
+environments that do not have automake 16. Since Buildroot automake
+package depends on autoconf, we have a chicken-and-egg problem. However,
+since we do not need the documentation, the tests, or the manpages, we
+can simply drop them from autoconf, and avoiding the dependency issue
+completely.
+
+This patch removes from Makefile.am the inclusion of the doc, man, and
+tests local.mk. The other files have been regenerated with "autoreconf"
+version 2.7.1, using automake 1.16.5.
+
+Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
+---
+ Makefile.am |   3 -
+ Makefile.in | 893 +++++-----------------------------------------------
+ aclocal.m4  |   4 +-
+ configure   | 470 +++++++++++++--------------
+ 4 files changed, 296 insertions(+), 1074 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1db714b..185e4a4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -134,10 +134,7 @@ distclean-local:
+ 	then rm -f ChangeLog; fi
+ 
+ include $(srcdir)/bin/local.mk
+-include $(srcdir)/doc/local.mk
+ include $(srcdir)/lib/local.mk
+-include $(srcdir)/man/local.mk
+-include $(srcdir)/tests/local.mk
+ 
+ # Perl coverage statistics.
+ PERL_COVERAGE_DB = `pwd`/cover_db
+diff --git a/Makefile.in b/Makefile.in
+index c8d6425..1dea64b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -68,24 +68,6 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ 
+-# Make Autoconf documentation.
+-
+-# Copyright (C) 2000-2003, 2007-2017, 2020-2023 Free Software
+-# Foundation, Inc.
+-
+-# This program is free software: you can redistribute it and/or modify
+-# it under the terms of the GNU General Public License as published by
+-# the Free Software Foundation, either version 3 of the License, or
+-# (at your option) any later version.
+-
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-# GNU General Public License for more details.
+-
+-# You should have received a copy of the GNU General Public License
+-# along with this program.  If not, see <https://www.gnu.org/licenses/>.
+-
+ # Make Autoconf-related libraries.
+ 
+ # Copyright (C) 2001-2005, 2009-2017, 2020-2023 Free Software
+@@ -104,39 +86,6 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ 
+-# Make Autoconf man pages.
+-
+-# Copyright (C) 2001, 2004-2017, 2020-2023 Free Software Foundation,
+-# Inc.
+-
+-# This program is free software: you can redistribute it and/or modify
+-# it under the terms of the GNU General Public License as published by
+-# the Free Software Foundation, either version 3 of the License, or
+-# (at your option) any later version.
+-
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-# GNU General Public License for more details.
+-
+-# You should have received a copy of the GNU General Public License
+-# along with this program.  If not, see <https://www.gnu.org/licenses/>.
+-
+-# Copyright (C) 2000-2017, 2020-2023 Free Software Foundation, Inc.
+-
+-# This program is free software: you can redistribute it and/or modify
+-# it under the terms of the GNU General Public License as published by
+-# the Free Software Foundation, either version 3 of the License, or
+-# (at your option) any later version.
+-
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-# GNU General Public License for more details.
+-
+-# You should have received a copy of the GNU General Public License
+-# along with this program.  If not, see <https://www.gnu.org/licenses/>.
+-
+ 
+ 
+ VPATH = @srcdir@
+@@ -222,8 +171,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/autobuild.m4 \
+ am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
+ 	$(ACLOCAL_M4)
+ DIST_COMMON = $(srcdir)/Makefile.am $(top_srcdir)/configure \
+-	$(am__configure_deps) $(srcdir)/doc/version.texi \
+-	$(srcdir)/doc/stamp-vti $(dist_lisp_LISP) \
++	$(am__configure_deps) $(dist_lisp_LISP) \
+ 	$(dist_autoconflib_DATA) $(dist_autotestlib_DATA) \
+ 	$(dist_buildaux_DATA) $(dist_m4sugarlib_DATA) \
+ 	$(dist_perllib_DATA) $(am__DIST_COMMON)
+@@ -259,15 +207,14 @@ am__uninstall_files_from_dir = { \
+     || { echo " ( cd '$$dir' && rm -f" $$files ")"; \
+          $(am__cd) "$$dir" && rm -f $$files; }; \
+   }
+-am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(infodir)" \
+-	"$(DESTDIR)$(lispdir)" "$(DESTDIR)$(man1dir)" \
++am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(lispdir)" \
+ 	"$(DESTDIR)$(autoconflibdir)" "$(DESTDIR)$(autotestlibdir)" \
+ 	"$(DESTDIR)$(buildauxdir)" "$(DESTDIR)$(m4sugarlibdir)" \
+ 	"$(DESTDIR)$(perllibdir)" "$(DESTDIR)$(autoconflibdir)" \
+ 	"$(DESTDIR)$(autoscanlibdir)" "$(DESTDIR)$(autotestlibdir)" \
+ 	"$(DESTDIR)$(m4sugarlibdir)" "$(DESTDIR)$(pkgdatadir)" \
+ 	"$(DESTDIR)$(pkgdatadir)"
+-SCRIPTS = $(bin_SCRIPTS) $(noinst_SCRIPTS)
++SCRIPTS = $(bin_SCRIPTS)
+ AM_V_P = $(am__v_P_@AM_V@)
+ am__v_P_ = $(am__v_P_@AM_DEFAULT_V@)
+ am__v_P_0 = false
+@@ -282,47 +229,6 @@ am__v_at_0 = @
+ am__v_at_1 = 
+ SOURCES =
+ DIST_SOURCES =
+-AM_V_DVIPS = $(am__v_DVIPS_@AM_V@)
+-am__v_DVIPS_ = $(am__v_DVIPS_@AM_DEFAULT_V@)
+-am__v_DVIPS_0 = @echo "  DVIPS   " $@;
+-am__v_DVIPS_1 = 
+-AM_V_MAKEINFO = $(am__v_MAKEINFO_@AM_V@)
+-am__v_MAKEINFO_ = $(am__v_MAKEINFO_@AM_DEFAULT_V@)
+-am__v_MAKEINFO_0 = @echo "  MAKEINFO" $@;
+-am__v_MAKEINFO_1 = 
+-AM_V_INFOHTML = $(am__v_INFOHTML_@AM_V@)
+-am__v_INFOHTML_ = $(am__v_INFOHTML_@AM_DEFAULT_V@)
+-am__v_INFOHTML_0 = @echo "  INFOHTML" $@;
+-am__v_INFOHTML_1 = 
+-AM_V_TEXI2DVI = $(am__v_TEXI2DVI_@AM_V@)
+-am__v_TEXI2DVI_ = $(am__v_TEXI2DVI_@AM_DEFAULT_V@)
+-am__v_TEXI2DVI_0 = @echo "  TEXI2DVI" $@;
+-am__v_TEXI2DVI_1 = 
+-AM_V_TEXI2PDF = $(am__v_TEXI2PDF_@AM_V@)
+-am__v_TEXI2PDF_ = $(am__v_TEXI2PDF_@AM_DEFAULT_V@)
+-am__v_TEXI2PDF_0 = @echo "  TEXI2PDF" $@;
+-am__v_TEXI2PDF_1 = 
+-AM_V_texinfo = $(am__v_texinfo_@AM_V@)
+-am__v_texinfo_ = $(am__v_texinfo_@AM_DEFAULT_V@)
+-am__v_texinfo_0 = -q
+-am__v_texinfo_1 = 
+-AM_V_texidevnull = $(am__v_texidevnull_@AM_V@)
+-am__v_texidevnull_ = $(am__v_texidevnull_@AM_DEFAULT_V@)
+-am__v_texidevnull_0 = > /dev/null
+-am__v_texidevnull_1 = 
+-am__dirstamp = $(am__leading_dot)dirstamp
+-INFO_DEPS = $(srcdir)/doc/autoconf.info $(srcdir)/doc/standards.info
+-am__TEXINFO_TEX_DIR = $(srcdir)/build-aux
+-DVIS = doc/autoconf.dvi doc/standards.dvi
+-PDFS = doc/autoconf.pdf doc/standards.pdf
+-PSS = doc/autoconf.ps doc/standards.ps
+-HTMLS = doc/autoconf.html doc/standards.html
+-TEXINFOS = doc/autoconf.texi doc/standards.texi
+-TEXI2DVI = texi2dvi
+-TEXI2PDF = $(TEXI2DVI) --pdf --batch
+-MAKEINFOHTML = $(MAKEINFO) --html
+-AM_MAKEINFOHTMLFLAGS = $(AM_MAKEINFOFLAGS)
+-DVIPS = dvips
+ am__can_run_installinfo = \
+   case $$AM_UPDATE_INFO_DIR in \
+     n|no|NO) false;; \
+@@ -338,9 +244,6 @@ LISP = $(dist_lisp_LISP)
+ am__ELFILES = lib/emacs/autoconf-mode.el lib/emacs/autotest-mode.el
+ am__ELCFILES = $(am__ELFILES:.el=.elc)
+ ELCFILES = $(LISP:.el=.elc)
+-man1dir = $(mandir)/man1
+-NROFF = nroff
+-MANS = $(dist_man_MANS)
+ DATA = $(dist_autoconflib_DATA) $(dist_autotestlib_DATA) \
+ 	$(dist_buildaux_DATA) $(dist_m4sugarlib_DATA) \
+ 	$(dist_perllib_DATA) $(nodist_autoconflib_DATA) \
+@@ -365,15 +268,11 @@ am__define_uniq_tagged_files = \
+     if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
+   done | $(am__uniquify_input)`
+ AM_RECURSIVE_TARGETS = cscope
+-am__DIST_COMMON = $(dist_man_MANS) $(doc_autoconf_TEXINFOS) \
+-	$(doc_standards_TEXINFOS) $(srcdir)/GNUmakefile \
+-	$(srcdir)/Makefile.in $(srcdir)/bin/local.mk \
+-	$(srcdir)/doc/local.mk $(srcdir)/lib/freeze.mk \
+-	$(srcdir)/lib/local.mk $(srcdir)/man/local.mk \
+-	$(srcdir)/tests/local.mk $(top_srcdir)/build-aux/config.guess \
++am__DIST_COMMON = $(srcdir)/GNUmakefile $(srcdir)/Makefile.in \
++	$(srcdir)/bin/local.mk $(srcdir)/lib/freeze.mk \
++	$(srcdir)/lib/local.mk $(top_srcdir)/build-aux/config.guess \
+ 	$(top_srcdir)/build-aux/config.sub \
+ 	$(top_srcdir)/build-aux/install-sh \
+-	$(top_srcdir)/build-aux/mdate-sh \
+ 	$(top_srcdir)/build-aux/missing $(top_srcdir)/lib/version.in \
+ 	$(top_srcdir)/tests/atlocal.in AUTHORS COPYING ChangeLog \
+ 	INSTALL NEWS README THANKS TODO build-aux/config.guess \
+@@ -505,11 +404,7 @@ ACLOCAL_AMFLAGS = -I m4
+ ETAGS_ARGS = $(ETAGS_PERL) $(ETAGS_FOR_AUTOCONF)
+ 
+ # Files that should be removed, but which Automake does not know.
+-MOSTLYCLEANFILES = $(bin_SCRIPTS) bin/*.tmp $(dist_man_MANS:=.t) \
+-	$(dist_man_MANS:=a.t)
+-
+-# Files from texi2dvi that should be removed, but which Automake does
+-# not know.
++MOSTLYCLEANFILES = $(bin_SCRIPTS) bin/*.tmp
+ 
+ # All the files below depend on Makefile so that they are rebuilt
+ # when the prefix, etc. changes. Unfortunately, suffix rules
+@@ -517,26 +412,13 @@ MOSTLYCLEANFILES = $(bin_SCRIPTS) bin/*.tmp $(dist_man_MANS:=.t) \
+ 
+ # TODO: This is required to work around a limitation in older
+ #	Automake.  Remove once we can assume Automake 1.13 or later.
+-
+-# The hairy heredoc is more robust than using echo.
+-CLEANFILES = autoconf.ACs autoconf.cvs autoconf.MSs autoconf.prs \
+-	autoconf.ATs autoconf.evs autoconf.fns autoconf.ovs \
+-	autoconf.ca autoconf.CA autoconf.cas autoconf.CAs autoconf.tmp \
+-	lib/autom4te.cfg autoconf-mode.elc autotest-mode.elc \
++CLEANFILES = lib/autom4te.cfg autoconf-mode.elc autotest-mode.elc \
+ 	$(nodist_autoconflib_DATA) lib/autoscan/autoscan.list \
+ 	$(nodist_m4sugarlib_DATA) $(nodist_pkgdata_DATA) \
+-	$(nodist_autotestlib_DATA) tests/package.m4 tests/wrapper.in \
+-	$(wrappers) $(TESTSUITE_GENERATED_AT) tests/mktests.tmp \
+-	tests/mktests.stamp expr
+-DISTCLEANFILES = tests/atconfig tests/atlocal $(TESTSUITE)
+-MAINTAINERCLEANFILES = $(am__append_1) $(dist_man_MANS) \
+-	$(TESTSUITE_GENERATED_AT)
+-SUFFIXES = .m4 .m4f .w .1
+-
+-# We don't actually distribute the built testsuite or package.m4, since one
+-# only needs m4 to build them, and m4 is required to install Autoconf.
+-# But if you are borrowing from this file for setting up autotest in your
+-# project, remember to distribute both testsuite and package.m4.
++	$(nodist_autotestlib_DATA)
++DISTCLEANFILES = 
++MAINTAINERCLEANFILES = $(am__append_1)
++SUFFIXES = .m4 .m4f
+ EXTRA_DIST = ChangeLog.0 ChangeLog.1 ChangeLog.2 ChangeLog.3 BUGS \
+ 	COPYINGv3 COPYING.EXCEPTION GNUmakefile maint.mk cfg.mk \
+ 	build-aux/gendocs.sh build-aux/git-version-gen \
+@@ -544,12 +426,8 @@ EXTRA_DIST = ChangeLog.0 ChangeLog.1 ChangeLog.2 ChangeLog.3 BUGS \
+ 	build-aux/gitlog-to-changelog build-aux/help-extract.pl \
+ 	.prev-version .version bin/autoconf.in bin/autoheader.in \
+ 	bin/autom4te.in bin/autoreconf.in bin/autoscan.in \
+-	bin/autoupdate.in bin/ifnames.in doc/gendocs_template \
+-	lib/autom4te.in lib/autoscan/autoscan.pre \
+-	$(dist_man_MANS:.1=.w) $(dist_man_MANS:.1=.x) man/common.x \
+-	tests/local.at tests/mktests.pl tests/atlocal.in \
+-	tests/wrapper.as tests/statesave.m4 $(TESTSUITE_HAND_AT) \
+-	$(TESTSUITE_EXTRA)
++	bin/autoupdate.in bin/ifnames.in lib/autom4te.in \
++	lib/autoscan/autoscan.pre
+ edit = sed \
+ 	-e 's|@SHELL[@]|$(SHELL)|g' \
+ 	-e 's|@PERL[@]|$(PERL)|g' \
+@@ -684,12 +562,6 @@ ETAGS_PERL = --lang=perl \
+   bin/autoupdate.in \
+   bin/ifnames.in
+ 
+-AM_MAKEINFOFLAGS = --no-split
+-TEXI2HTML_FLAGS = -split_chapter
+-TEXINFO_TEX = build-aux/texinfo.tex
+-info_TEXINFOS = doc/autoconf.texi doc/standards.texi
+-doc_autoconf_TEXINFOS = doc/fdl.texi doc/install.texi
+-doc_standards_TEXINFOS = doc/fdl.texi doc/gnu-oids.texi doc/make-stds.texi
+ TAGS_FILES = $(dist_perllib_DATA) $(dist_autoconflib_DATA) \
+ 	$(dist_m4sugarlib_DATA) $(dist_autotestlib_DATA)
+ forbidden_patterns = -e '^_*EOF' -e ' cmp '
+@@ -771,149 +643,6 @@ buildauxdir = $(pkgdatadir)/build-aux
+ dist_buildaux_DATA = \
+   $(AUXSCRIPTS)
+ 
+-dist_man_MANS = \
+-  man/autoconf.1 \
+-  man/autoheader.1 \
+-  man/autom4te.1 \
+-  man/autoreconf.1 \
+-  man/autoscan.1 \
+-  man/autoupdate.1 \
+-  man/ifnames.1
+-
+-
+-# Each manpage depends on:
+-# - its .w and .x files and its source script in bin/
+-# - common.x for the SEE ALSO list
+-# - lib/Autom4te/ChannelDefs.pm which contains additional --help text
+-#   (not included in _all_ the manpages, but it's easier to have them
+-#   all depend on it)
+-# - .version and configure.ac for version information
+-#
+-# We ship the manpages in tarball releases so people can build from
+-# them without having help2man installed.  For this to work correctly,
+-# the manpages cannot have declared dependencies on any file that is
+-# not also shipped in the tarball.  To avoid concurrency bugs, those
+-# files plus the Makefile must in fact be sufficient to generate the
+-# manpages.  See the automake manual, section 'Errors with distclean',
+-# for further discussion.
+-binsrcdir = $(top_srcdir)/bin
+-channeldefs_pm = lib/Autom4te/ChannelDefs.pm
+-man_common_dep = $(top_srcdir)/man/common.x \
+-		 $(top_srcdir)/$(channeldefs_pm) \
+-		 $(top_srcdir)/.version \
+-		 $(top_srcdir)/configure.ac
+-
+-
+-# To generate the manpages, we use help2man, but we don't have it run
+-# the built script that corresponds to the manpage.  Instead it runs
+-# the .w file listed above, which is a wrapper around
+-# build-aux/help-extract.pl, which parses the *source* of the script
+-# and extracts the help and version text.  This means that the built
+-# script doesn't need to exist to create the manpage.  If it did,
+-# we would have a concurrency bug, since we can't declare a dependency
+-# on the built script, as discussed above.
+-# We use a suffix rule describing the manpage as built from its .w file
+-# so that we can use $(<F) to name the executable to be run, which avoids
+-# an extra subshell and sed invocation.
+-remove_time_stamp = 's/^\(\.TH[^"]*"[^"]*"[^"]*\)"[^"]*"/\1/'
+-
+-# Running the uninstalled scripts.  Build them upon 'all', for the manpages.
+-noinst_SCRIPTS = $(wrappers)
+-wrappers = \
+-  tests/autoconf \
+-  tests/autoheader \
+-  tests/autom4te \
+-  tests/autoreconf \
+-  tests/autoscan \
+-  tests/autoupdate \
+-  tests/ifnames
+-
+-edit_wrapper = sed \
+-	-e 's|@wrap_program[@]|$(@F)|g' \
+-	-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
+-	-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
+-	-e "s|@configure_input[@]|Generated from $$input.|g"
+-
+-TESTSUITE_GENERATED_AT = \
+-  tests/aclang.at \
+-  tests/acc.at \
+-  tests/acerlang.at \
+-  tests/acfortran.at \
+-  tests/acgo.at \
+-  tests/acgeneral.at \
+-  tests/acstatus.at \
+-  tests/acautoheader.at \
+-  tests/acautoupdate.at \
+-  tests/acspecific.at \
+-  tests/acfunctions.at \
+-  tests/acheaders.at \
+-  tests/actypes.at \
+-  tests/aclibs.at \
+-  tests/acprograms.at
+-
+-TESTSUITE_HAND_AT = \
+-  tests/suite.at \
+-  tests/m4sugar.at \
+-  tests/m4sh.at \
+-  tests/autotest.at \
+-  tests/base.at \
+-  tests/tools.at \
+-  tests/torture.at \
+-  tests/compile.at \
+-  tests/c.at \
+-  tests/erlang.at \
+-  tests/fortran.at \
+-  tests/go.at \
+-  tests/semantics.at \
+-  tests/autoscan.at \
+-  tests/foreign.at
+-
+-TESTSUITE_EXTRA = \
+-  tests/data/ax_prog_cc_for_build_v18.m4 \
+-  tests/data/ax_prog_cxx_for_build_v3.m4 \
+-  tests/data/gnulib_std_gnu11_2020_08_17.m4
+-
+-TESTSUITE_AT = $(TESTSUITE_GENERATED_AT) $(TESTSUITE_HAND_AT)
+-TESTSUITE = tests/testsuite
+-
+-# Run the non installed autom4te.
+-# Don't use AUTOM4TE since 'make alpha' makes it unavailable although
+-# we are allowed to use it (since we ship it).
+-AUTOTESTFLAGS = -I tests -I $(srcdir)/tests
+-AUTOTEST = $(MY_AUTOM4TE) --language=autotest
+-
+-# Factor out invocation of the testsuite script.
+-run_testsuite = $(SHELL) $(TESTSUITE) -C tests MAKE=$(MAKE)
+-
+-# Avoid a race condition that would make parallel "distclean" fail.
+-# The rule in clean-local tests for existence of $(TESTSUITE), and
+-# if found, attempts to run it.  But the distclean-generic rule may
+-# be running in parallel, and it removes $(DISTCLEANFILES) which
+-# includes $(TESTSUITE).  This is the Automake rule, plus our
+-# dependency, and we silence the warning from 'automake -Wall' by
+-# hiding the dependency behind a variable.
+-# TODO - fix this if newer automake accommodates the dependency.
+-distclean_generic = distclean-generic
+-
+-# The files which contain macros we check for syntax.  Use $(srcdir)
+-# for the benefit of non-GNU make.
+-autoconfdir = $(srcdir)/lib/autoconf
+-AUTOCONF_FILES = $(autoconfdir)/general.m4 \
+-		 $(autoconfdir)/status.m4 \
+-		 $(autoconfdir)/autoheader.m4 \
+-		 $(autoconfdir)/autoupdate.m4 \
+-		 $(autoconfdir)/specific.m4 \
+-		 $(autoconfdir)/functions.m4 \
+-		 $(autoconfdir)/lang.m4 \
+-		 $(autoconfdir)/c.m4 \
+-		 $(autoconfdir)/erlang.m4 \
+-		 $(autoconfdir)/fortran.m4 \
+-		 $(autoconfdir)/go.m4 \
+-		 $(autoconfdir)/headers.m4 \
+-		 $(autoconfdir)/libs.m4 \
+-		 $(autoconfdir)/types.m4 \
+-		 $(autoconfdir)/programs.m4
+-
+ 
+ # Perl coverage statistics.
+ PERL_COVERAGE_DB = `pwd`/cover_db
+@@ -923,10 +652,10 @@ all: $(BUILT_SOURCES)
+ 	$(MAKE) $(AM_MAKEFLAGS) all-am
+ 
+ .SUFFIXES:
+-.SUFFIXES: .m4 .m4f .w .1 .dvi .el .elc .ps
++.SUFFIXES: .m4 .m4f .el .elc
+ am--refresh: Makefile
+ 	@:
+-$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am $(srcdir)/lib/freeze.mk $(srcdir)/bin/local.mk $(srcdir)/doc/local.mk $(srcdir)/lib/local.mk $(srcdir)/man/local.mk $(srcdir)/tests/local.mk $(am__configure_deps)
++$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am $(srcdir)/lib/freeze.mk $(srcdir)/bin/local.mk $(srcdir)/lib/local.mk $(am__configure_deps)
+ 	@for dep in $?; do \
+ 	  case '$(am__configure_deps)' in \
+ 	    *$$dep*) \
+@@ -948,7 +677,7 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
+ 	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe_remake_depfiles)'; \
+ 	    cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe_remake_depfiles);; \
+ 	esac;
+-$(srcdir)/lib/freeze.mk $(srcdir)/bin/local.mk $(srcdir)/doc/local.mk $(srcdir)/lib/local.mk $(srcdir)/man/local.mk $(srcdir)/tests/local.mk $(am__empty):
++$(srcdir)/lib/freeze.mk $(srcdir)/bin/local.mk $(srcdir)/lib/local.mk $(am__empty):
+ 
+ $(top_builddir)/config.status: $(top_srcdir)/configure $(CONFIG_STATUS_DEPENDENCIES)
+ 	$(SHELL) ./config.status --recheck
+@@ -1012,216 +741,6 @@ installcheck-binSCRIPTS: $(bin_SCRIPTS)
+ 	    else echo "$$f does not support $$opt" 1>&2; bad=1; fi; \
+ 	  done; \
+ 	done; rm -f c$${pid}_.???; exit $$bad
+-doc/$(am__dirstamp):
+-	@$(MKDIR_P) doc
+-	@: > doc/$(am__dirstamp)
+-
+-$(srcdir)/doc/autoconf.info: doc/autoconf.texi $(srcdir)/doc/version.texi $(doc_autoconf_TEXINFOS)
+-	$(AM_V_MAKEINFO)restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+-	am__cwd=`pwd` && $(am__cd) $(srcdir) && \
+-	rm -rf $$backupdir && mkdir $$backupdir && \
+-	if ($(MAKEINFO) --version) >/dev/null 2>&1; then \
+-	  for f in $@ $@-[0-9] $@-[0-9][0-9] $(@:.info=).i[0-9] $(@:.info=).i[0-9][0-9]; do \
+-	    if test -f $$f; then mv $$f $$backupdir; restore=mv; else :; fi; \
+-	  done; \
+-	else :; fi && \
+-	cd "$$am__cwd"; \
+-	if $(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc \
+-	 -o $@ $(srcdir)/doc/autoconf.texi; \
+-	then \
+-	  rc=0; \
+-	  $(am__cd) $(srcdir); \
+-	else \
+-	  rc=$$?; \
+-	  $(am__cd) $(srcdir) && \
+-	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+-	fi; \
+-	rm -rf $$backupdir; exit $$rc
+-
+-doc/autoconf.dvi: doc/autoconf.texi $(srcdir)/doc/version.texi $(doc_autoconf_TEXINFOS) doc/$(am__dirstamp)
+-	$(AM_V_TEXI2DVI)TEXINPUTS="$(am__TEXINFO_TEX_DIR)$(PATH_SEPARATOR)$$TEXINPUTS" \
+-	MAKEINFO='$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc' \
+-	$(TEXI2DVI) $(AM_V_texinfo) --build-dir=$(@:.dvi=.t2d) -o $@ $(AM_V_texidevnull) \
+-	`test -f 'doc/autoconf.texi' || echo '$(srcdir)/'`doc/autoconf.texi
+-
+-doc/autoconf.pdf: doc/autoconf.texi $(srcdir)/doc/version.texi $(doc_autoconf_TEXINFOS) doc/$(am__dirstamp)
+-	$(AM_V_TEXI2PDF)TEXINPUTS="$(am__TEXINFO_TEX_DIR)$(PATH_SEPARATOR)$$TEXINPUTS" \
+-	MAKEINFO='$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc' \
+-	$(TEXI2PDF) $(AM_V_texinfo) --build-dir=$(@:.pdf=.t2p) -o $@ $(AM_V_texidevnull) \
+-	`test -f 'doc/autoconf.texi' || echo '$(srcdir)/'`doc/autoconf.texi
+-
+-doc/autoconf.html: doc/autoconf.texi $(srcdir)/doc/version.texi $(doc_autoconf_TEXINFOS) doc/$(am__dirstamp)
+-	$(AM_V_MAKEINFO)rm -rf $(@:.html=.htp)
+-	$(AM_V_at)if $(MAKEINFOHTML) $(AM_MAKEINFOHTMLFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc \
+-	 -o $(@:.html=.htp) `test -f 'doc/autoconf.texi' || echo '$(srcdir)/'`doc/autoconf.texi; \
+-	then \
+-	  rm -rf $@ && mv $(@:.html=.htp) $@; \
+-	else \
+-	  rm -rf $(@:.html=.htp); exit 1; \
+-	fi
+-$(srcdir)/doc/version.texi:  $(srcdir)/doc/stamp-vti
+-$(srcdir)/doc/stamp-vti: doc/autoconf.texi $(top_srcdir)/configure
+-	@test -f doc/$(am__dirstamp) || $(MAKE) $(AM_MAKEFLAGS) doc/$(am__dirstamp)
+-	@(dir=.; test -f ./doc/autoconf.texi || dir=$(srcdir); \
+-	set `$(SHELL) $(top_srcdir)/build-aux/mdate-sh $$dir/doc/autoconf.texi`; \
+-	echo "@set UPDATED $$1 $$2 $$3"; \
+-	echo "@set UPDATED-MONTH $$2 $$3"; \
+-	echo "@set EDITION $(VERSION)"; \
+-	echo "@set VERSION $(VERSION)") > vti.tmp$$$$ && \
+-	(cmp -s vti.tmp$$$$ $(srcdir)/doc/version.texi \
+-	  || (echo "Updating $(srcdir)/doc/version.texi" && \
+-	      cp vti.tmp$$$$ $(srcdir)/doc/version.texi.tmp$$$$ && \
+-	      mv $(srcdir)/doc/version.texi.tmp$$$$ $(srcdir)/doc/version.texi)) && \
+-	rm -f vti.tmp$$$$ $(srcdir)/doc/version.texi.$$$$
+-	@cp $(srcdir)/doc/version.texi $@
+-
+-mostlyclean-vti:
+-	-rm -f vti.tmp* $(srcdir)/doc/version.texi.tmp*
+-
+-maintainer-clean-vti:
+-	-rm -f $(srcdir)/doc/stamp-vti $(srcdir)/doc/version.texi
+-
+-$(srcdir)/doc/standards.info: doc/standards.texi $(doc_standards_TEXINFOS)
+-	$(AM_V_MAKEINFO)restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+-	am__cwd=`pwd` && $(am__cd) $(srcdir) && \
+-	rm -rf $$backupdir && mkdir $$backupdir && \
+-	if ($(MAKEINFO) --version) >/dev/null 2>&1; then \
+-	  for f in $@ $@-[0-9] $@-[0-9][0-9] $(@:.info=).i[0-9] $(@:.info=).i[0-9][0-9]; do \
+-	    if test -f $$f; then mv $$f $$backupdir; restore=mv; else :; fi; \
+-	  done; \
+-	else :; fi && \
+-	cd "$$am__cwd"; \
+-	if $(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc \
+-	 -o $@ $(srcdir)/doc/standards.texi; \
+-	then \
+-	  rc=0; \
+-	  $(am__cd) $(srcdir); \
+-	else \
+-	  rc=$$?; \
+-	  $(am__cd) $(srcdir) && \
+-	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+-	fi; \
+-	rm -rf $$backupdir; exit $$rc
+-
+-doc/standards.dvi: doc/standards.texi $(doc_standards_TEXINFOS) doc/$(am__dirstamp)
+-	$(AM_V_TEXI2DVI)TEXINPUTS="$(am__TEXINFO_TEX_DIR)$(PATH_SEPARATOR)$$TEXINPUTS" \
+-	MAKEINFO='$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc' \
+-	$(TEXI2DVI) $(AM_V_texinfo) --build-dir=$(@:.dvi=.t2d) -o $@ $(AM_V_texidevnull) \
+-	`test -f 'doc/standards.texi' || echo '$(srcdir)/'`doc/standards.texi
+-
+-doc/standards.pdf: doc/standards.texi $(doc_standards_TEXINFOS) doc/$(am__dirstamp)
+-	$(AM_V_TEXI2PDF)TEXINPUTS="$(am__TEXINFO_TEX_DIR)$(PATH_SEPARATOR)$$TEXINPUTS" \
+-	MAKEINFO='$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc' \
+-	$(TEXI2PDF) $(AM_V_texinfo) --build-dir=$(@:.pdf=.t2p) -o $@ $(AM_V_texidevnull) \
+-	`test -f 'doc/standards.texi' || echo '$(srcdir)/'`doc/standards.texi
+-
+-doc/standards.html: doc/standards.texi $(doc_standards_TEXINFOS) doc/$(am__dirstamp)
+-	$(AM_V_MAKEINFO)rm -rf $(@:.html=.htp)
+-	$(AM_V_at)if $(MAKEINFOHTML) $(AM_MAKEINFOHTMLFLAGS) $(MAKEINFOFLAGS) -I doc -I $(srcdir)/doc \
+-	 -o $(@:.html=.htp) `test -f 'doc/standards.texi' || echo '$(srcdir)/'`doc/standards.texi; \
+-	then \
+-	  rm -rf $@ && mv $(@:.html=.htp) $@; \
+-	else \
+-	  rm -rf $(@:.html=.htp); exit 1; \
+-	fi
+-.dvi.ps:
+-	$(AM_V_DVIPS)TEXINPUTS="$(am__TEXINFO_TEX_DIR)$(PATH_SEPARATOR)$$TEXINPUTS" \
+-	$(DVIPS) $(AM_V_texinfo) -o $@ $<
+-
+-uninstall-dvi-am:
+-	@$(NORMAL_UNINSTALL)
+-	@list='$(DVIS)'; test -n "$(dvidir)" || list=; \
+-	for p in $$list; do \
+-	  $(am__strip_dir) \
+-	  echo " rm -f '$(DESTDIR)$(dvidir)/$$f'"; \
+-	  rm -f "$(DESTDIR)$(dvidir)/$$f"; \
+-	done
+-
+-uninstall-html-am:
+-	@$(NORMAL_UNINSTALL)
+-	@list='$(HTMLS)'; test -n "$(htmldir)" || list=; \
+-	for p in $$list; do \
+-	  $(am__strip_dir) \
+-	  echo " rm -rf '$(DESTDIR)$(htmldir)/$$f'"; \
+-	  rm -rf "$(DESTDIR)$(htmldir)/$$f"; \
+-	done
+-
+-uninstall-info-am:
+-	@$(PRE_UNINSTALL)
+-	@if test -d '$(DESTDIR)$(infodir)' && $(am__can_run_installinfo); then \
+-	  list='$(INFO_DEPS)'; \
+-	  for file in $$list; do \
+-	    relfile=`echo "$$file" | sed 's|^.*/||'`; \
+-	    echo " install-info --info-dir='$(DESTDIR)$(infodir)' --remove '$(DESTDIR)$(infodir)/$$relfile'"; \
+-	    if install-info --info-dir="$(DESTDIR)$(infodir)" --remove "$(DESTDIR)$(infodir)/$$relfile"; \
+-	    then :; else test ! -f "$(DESTDIR)$(infodir)/$$relfile" || exit 1; fi; \
+-	  done; \
+-	else :; fi
+-	@$(NORMAL_UNINSTALL)
+-	@list='$(INFO_DEPS)'; \
+-	for file in $$list; do \
+-	  relfile=`echo "$$file" | sed 's|^.*/||'`; \
+-	  relfile_i=`echo "$$relfile" | sed 's|\.info$$||;s|$$|.i|'`; \
+-	  (if test -d "$(DESTDIR)$(infodir)" && cd "$(DESTDIR)$(infodir)"; then \
+-	     echo " cd '$(DESTDIR)$(infodir)' && rm -f $$relfile $$relfile-[0-9] $$relfile-[0-9][0-9] $$relfile_i[0-9] $$relfile_i[0-9][0-9]"; \
+-	     rm -f $$relfile $$relfile-[0-9] $$relfile-[0-9][0-9] $$relfile_i[0-9] $$relfile_i[0-9][0-9]; \
+-	   else :; fi); \
+-	done
+-
+-uninstall-pdf-am:
+-	@$(NORMAL_UNINSTALL)
+-	@list='$(PDFS)'; test -n "$(pdfdir)" || list=; \
+-	for p in $$list; do \
+-	  $(am__strip_dir) \
+-	  echo " rm -f '$(DESTDIR)$(pdfdir)/$$f'"; \
+-	  rm -f "$(DESTDIR)$(pdfdir)/$$f"; \
+-	done
+-
+-uninstall-ps-am:
+-	@$(NORMAL_UNINSTALL)
+-	@list='$(PSS)'; test -n "$(psdir)" || list=; \
+-	for p in $$list; do \
+-	  $(am__strip_dir) \
+-	  echo " rm -f '$(DESTDIR)$(psdir)/$$f'"; \
+-	  rm -f "$(DESTDIR)$(psdir)/$$f"; \
+-	done
+-
+-dist-info: $(INFO_DEPS)
+-	@srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`; \
+-	list='$(INFO_DEPS)'; \
+-	for base in $$list; do \
+-	  case $$base in \
+-	    $(srcdir)/*) base=`echo "$$base" | sed "s|^$$srcdirstrip/||"`;; \
+-	  esac; \
+-	  if test -f $$base; then d=.; else d=$(srcdir); fi; \
+-	  base_i=`echo "$$base" | sed 's|\.info$$||;s|$$|.i|'`; \
+-	  for file in $$d/$$base $$d/$$base-[0-9] $$d/$$base-[0-9][0-9] $$d/$$base_i[0-9] $$d/$$base_i[0-9][0-9]; do \
+-	    if test -f $$file; then \
+-	      relfile=`expr "$$file" : "$$d/\(.*\)"`; \
+-	      test -f "$(distdir)/$$relfile" || \
+-		cp -p $$file "$(distdir)/$$relfile"; \
+-	    else :; fi; \
+-	  done; \
+-	done
+-
+-mostlyclean-aminfo:
+-	-rm -rf doc/autoconf.t2d doc/autoconf.t2p doc/standards.t2d \
+-	  doc/standards.t2p
+-
+-clean-aminfo:
+-	-test -z "doc/autoconf.dvi doc/autoconf.pdf doc/autoconf.ps doc/autoconf.html \
+-	  doc/standards.dvi doc/standards.pdf doc/standards.ps \
+-	  doc/standards.html" \
+-	|| rm -rf doc/autoconf.dvi doc/autoconf.pdf doc/autoconf.ps doc/autoconf.html \
+-	  doc/standards.dvi doc/standards.pdf doc/standards.ps \
+-	  doc/standards.html
+-
+-maintainer-clean-aminfo:
+-	@list='$(INFO_DEPS)'; for i in $$list; do \
+-	  i_i=`echo "$$i" | sed 's|\.info$$||;s|$$|.i|'`; \
+-	  echo " rm -f $$i $$i-[0-9] $$i-[0-9][0-9] $$i_i[0-9] $$i_i[0-9][0-9]"; \
+-	  rm -f $$i $$i-[0-9] $$i-[0-9][0-9] $$i_i[0-9] $$i_i[0-9][0-9]; \
+-	done
+ 
+ .el.elc:
+ 	if test '$(EMACS)' != no; then \
+@@ -1268,49 +787,6 @@ uninstall-dist_lispLISP:
+ 
+ clean-lisp:
+ 	-rm -f $(ELCFILES)
+-install-man1: $(dist_man_MANS)
+-	@$(NORMAL_INSTALL)
+-	@list1=''; \
+-	list2='$(dist_man_MANS)'; \
+-	test -n "$(man1dir)" \
+-	  && test -n "`echo $$list1$$list2`" \
+-	  || exit 0; \
+-	echo " $(MKDIR_P) '$(DESTDIR)$(man1dir)'"; \
+-	$(MKDIR_P) "$(DESTDIR)$(man1dir)" || exit 1; \
+-	{ for i in $$list1; do echo "$$i"; done;  \
+-	if test -n "$$list2"; then \
+-	  for i in $$list2; do echo "$$i"; done \
+-	    | sed -n '/\.1[a-z]*$$/p'; \
+-	fi; \
+-	} | while read p; do \
+-	  if test -f $$p; then d=; else d="$(srcdir)/"; fi; \
+-	  echo "$$d$$p"; echo "$$p"; \
+-	done | \
+-	sed -e 'n;s,.*/,,;p;h;s,.*\.,,;s,^[^1][0-9a-z]*$$,1,;x' \
+-	      -e 's,\.[0-9a-z]*$$,,;$(transform);G;s,\n,.,' | \
+-	sed 'N;N;s,\n, ,g' | { \
+-	list=; while read file base inst; do \
+-	  if test "$$base" = "$$inst"; then list="$$list $$file"; else \
+-	    echo " $(INSTALL_DATA) '$$file' '$(DESTDIR)$(man1dir)/$$inst'"; \
+-	    $(INSTALL_DATA) "$$file" "$(DESTDIR)$(man1dir)/$$inst" || exit $$?; \
+-	  fi; \
+-	done; \
+-	for i in $$list; do echo "$$i"; done | $(am__base_list) | \
+-	while read files; do \
+-	  test -z "$$files" || { \
+-	    echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(man1dir)'"; \
+-	    $(INSTALL_DATA) $$files "$(DESTDIR)$(man1dir)" || exit $$?; }; \
+-	done; }
+-
+-uninstall-man1:
+-	@$(NORMAL_UNINSTALL)
+-	@list=''; test -n "$(man1dir)" || exit 0; \
+-	files=`{ for i in $$list; do echo "$$i"; done; \
+-	l2='$(dist_man_MANS)'; for i in $$l2; do echo "$$i"; done | \
+-	  sed -n '/\.1[a-z]*$$/p'; \
+-	} | sed -e 's,.*/,,;h;s,.*\.,,;s,^[^1][0-9a-z]*$$,1,;x' \
+-	      -e 's,\.[0-9a-z]*$$,,;$(transform);G;s,\n,.,'`; \
+-	dir='$(DESTDIR)$(man1dir)'; $(am__uninstall_files_from_dir)
+ install-dist_autoconflibDATA: $(dist_autoconflib_DATA)
+ 	@$(NORMAL_INSTALL)
+ 	@list='$(dist_autoconflib_DATA)'; test -n "$(autoconflibdir)" || list=; \
+@@ -1638,7 +1114,7 @@ distdir-am: $(DISTFILES)
+ 	done
+ 	$(MAKE) $(AM_MAKEFLAGS) \
+ 	  top_distdir="$(top_distdir)" distdir="$(distdir)" \
+-	  dist-info dist-hook
++	  dist-hook
+ 	-test -n "$(am__skip_mode_fix)" \
+ 	|| find "$(distdir)" -type d ! -perm -755 \
+ 		-exec chmod u+rwx,go+rx {} \; -o \
+@@ -1779,10 +1255,9 @@ check-am: all-am
+ 	$(MAKE) $(AM_MAKEFLAGS) check-local
+ check: $(BUILT_SOURCES)
+ 	$(MAKE) $(AM_MAKEFLAGS) check-am
+-all-am: Makefile $(INFO_DEPS) $(SCRIPTS) $(LISP) $(ELCFILES) $(MANS) \
+-		$(DATA)
++all-am: Makefile $(SCRIPTS) $(LISP) $(ELCFILES) $(DATA)
+ installdirs:
+-	for dir in "$(DESTDIR)$(bindir)" "$(DESTDIR)$(infodir)" "$(DESTDIR)$(lispdir)" "$(DESTDIR)$(man1dir)" "$(DESTDIR)$(autoconflibdir)" "$(DESTDIR)$(autotestlibdir)" "$(DESTDIR)$(buildauxdir)" "$(DESTDIR)$(m4sugarlibdir)" "$(DESTDIR)$(perllibdir)" "$(DESTDIR)$(autoconflibdir)" "$(DESTDIR)$(autoscanlibdir)" "$(DESTDIR)$(autotestlibdir)" "$(DESTDIR)$(m4sugarlibdir)" "$(DESTDIR)$(pkgdatadir)" "$(DESTDIR)$(pkgdatadir)"; do \
++	for dir in "$(DESTDIR)$(bindir)" "$(DESTDIR)$(lispdir)" "$(DESTDIR)$(autoconflibdir)" "$(DESTDIR)$(autotestlibdir)" "$(DESTDIR)$(buildauxdir)" "$(DESTDIR)$(m4sugarlibdir)" "$(DESTDIR)$(perllibdir)" "$(DESTDIR)$(autoconflibdir)" "$(DESTDIR)$(autoscanlibdir)" "$(DESTDIR)$(autotestlibdir)" "$(DESTDIR)$(m4sugarlibdir)" "$(DESTDIR)$(pkgdatadir)" "$(DESTDIR)$(pkgdatadir)"; do \
+ 	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
+ 	done
+ install: $(BUILT_SOURCES)
+@@ -1815,7 +1290,6 @@ clean-generic:
+ distclean-generic:
+ 	-test -z "$(CONFIG_CLEAN_FILES)" || rm -f $(CONFIG_CLEAN_FILES)
+ 	-test . = "$(srcdir)" || test -z "$(CONFIG_CLEAN_VPATH_FILES)" || rm -f $(CONFIG_CLEAN_VPATH_FILES)
+-	-rm -f doc/$(am__dirstamp)
+ 	-test -z "$(DISTCLEANFILES)" || rm -f $(DISTCLEANFILES)
+ 
+ maintainer-clean-generic:
+@@ -1825,8 +1299,7 @@ maintainer-clean-generic:
+ 	-test -z "$(MAINTAINERCLEANFILES)" || rm -f $(MAINTAINERCLEANFILES)
+ clean: clean-am
+ 
+-clean-am: clean-aminfo clean-generic clean-lisp clean-local \
+-	mostlyclean-am
++clean-am: clean-generic clean-lisp clean-local mostlyclean-am
+ 
+ distclean: distclean-am
+ 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
+@@ -1836,211 +1309,111 @@ distclean-am: clean-am distclean-generic distclean-local \
+ 
+ dvi: dvi-am
+ 
+-dvi-am: $(DVIS)
++dvi-am:
+ 
+ html: html-am
+ 
+-html-am: $(HTMLS)
++html-am:
+ 
+ info: info-am
+ 
+-info-am: $(INFO_DEPS)
++info-am:
+ 
+ install-data-am: install-dist_autoconflibDATA \
+ 	install-dist_autotestlibDATA install-dist_buildauxDATA \
+ 	install-dist_lispLISP install-dist_m4sugarlibDATA \
+-	install-dist_perllibDATA install-info-am install-man \
+-	install-nodist_autoconflibDATA install-nodist_autoscanlibDATA \
+-	install-nodist_autotestlibDATA install-nodist_m4sugarlibDATA \
+-	install-nodist_pkgdataDATA install-pkgdataDATA
++	install-dist_perllibDATA install-nodist_autoconflibDATA \
++	install-nodist_autoscanlibDATA install-nodist_autotestlibDATA \
++	install-nodist_m4sugarlibDATA install-nodist_pkgdataDATA \
++	install-pkgdataDATA
+ 	@$(NORMAL_INSTALL)
+ 	$(MAKE) $(AM_MAKEFLAGS) install-data-hook
+ install-dvi: install-dvi-am
+ 
+-install-dvi-am: $(DVIS)
+-	@$(NORMAL_INSTALL)
+-	@list='$(DVIS)'; test -n "$(dvidir)" || list=; \
+-	if test -n "$$list"; then \
+-	  echo " $(MKDIR_P) '$(DESTDIR)$(dvidir)'"; \
+-	  $(MKDIR_P) "$(DESTDIR)$(dvidir)" || exit 1; \
+-	fi; \
+-	for p in $$list; do \
+-	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
+-	  echo "$$d$$p"; \
+-	done | $(am__base_list) | \
+-	while read files; do \
+-	  echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(dvidir)'"; \
+-	  $(INSTALL_DATA) $$files "$(DESTDIR)$(dvidir)" || exit $$?; \
+-	done
++install-dvi-am:
++
+ install-exec-am: install-binSCRIPTS
+ 
+ install-html: install-html-am
+ 
+-install-html-am: $(HTMLS)
+-	@$(NORMAL_INSTALL)
+-	@list='$(HTMLS)'; list2=; test -n "$(htmldir)" || list=; \
+-	if test -n "$$list"; then \
+-	  echo " $(MKDIR_P) '$(DESTDIR)$(htmldir)'"; \
+-	  $(MKDIR_P) "$(DESTDIR)$(htmldir)" || exit 1; \
+-	fi; \
+-	for p in $$list; do \
+-	  if test -f "$$p" || test -d "$$p"; then d=; else d="$(srcdir)/"; fi; \
+-	  $(am__strip_dir) \
+-	  d2=$$d$$p; \
+-	  if test -d "$$d2"; then \
+-	    echo " $(MKDIR_P) '$(DESTDIR)$(htmldir)/$$f'"; \
+-	    $(MKDIR_P) "$(DESTDIR)$(htmldir)/$$f" || exit 1; \
+-	    echo " $(INSTALL_DATA) '$$d2'/* '$(DESTDIR)$(htmldir)/$$f'"; \
+-	    $(INSTALL_DATA) "$$d2"/* "$(DESTDIR)$(htmldir)/$$f" || exit $$?; \
+-	  else \
+-	    list2="$$list2 $$d2"; \
+-	  fi; \
+-	done; \
+-	test -z "$$list2" || { echo "$$list2" | $(am__base_list) | \
+-	while read files; do \
+-	  echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(htmldir)'"; \
+-	  $(INSTALL_DATA) $$files "$(DESTDIR)$(htmldir)" || exit $$?; \
+-	done; }
++install-html-am:
++
+ install-info: install-info-am
+ 
+-install-info-am: $(INFO_DEPS)
+-	@$(NORMAL_INSTALL)
+-	@srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`; \
+-	list='$(INFO_DEPS)'; test -n "$(infodir)" || list=; \
+-	if test -n "$$list"; then \
+-	  echo " $(MKDIR_P) '$(DESTDIR)$(infodir)'"; \
+-	  $(MKDIR_P) "$(DESTDIR)$(infodir)" || exit 1; \
+-	fi; \
+-	for file in $$list; do \
+-	  case $$file in \
+-	    $(srcdir)/*) file=`echo "$$file" | sed "s|^$$srcdirstrip/||"`;; \
+-	  esac; \
+-	  if test -f $$file; then d=.; else d=$(srcdir); fi; \
+-	  file_i=`echo "$$file" | sed 's|\.info$$||;s|$$|.i|'`; \
+-	  for ifile in $$d/$$file $$d/$$file-[0-9] $$d/$$file-[0-9][0-9] \
+-	               $$d/$$file_i[0-9] $$d/$$file_i[0-9][0-9] ; do \
+-	    if test -f $$ifile; then \
+-	      echo "$$ifile"; \
+-	    else : ; fi; \
+-	  done; \
+-	done | $(am__base_list) | \
+-	while read files; do \
+-	  echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(infodir)'"; \
+-	  $(INSTALL_DATA) $$files "$(DESTDIR)$(infodir)" || exit $$?; done
+-	@$(POST_INSTALL)
+-	@if $(am__can_run_installinfo); then \
+-	  list='$(INFO_DEPS)'; test -n "$(infodir)" || list=; \
+-	  for file in $$list; do \
+-	    relfile=`echo "$$file" | sed 's|^.*/||'`; \
+-	    echo " install-info --info-dir='$(DESTDIR)$(infodir)' '$(DESTDIR)$(infodir)/$$relfile'";\
+-	    install-info --info-dir="$(DESTDIR)$(infodir)" "$(DESTDIR)$(infodir)/$$relfile" || :;\
+-	  done; \
+-	else : ; fi
+-install-man: install-man1
++install-info-am:
++
++install-man:
+ 
+ install-pdf: install-pdf-am
+ 
+-install-pdf-am: $(PDFS)
+-	@$(NORMAL_INSTALL)
+-	@list='$(PDFS)'; test -n "$(pdfdir)" || list=; \
+-	if test -n "$$list"; then \
+-	  echo " $(MKDIR_P) '$(DESTDIR)$(pdfdir)'"; \
+-	  $(MKDIR_P) "$(DESTDIR)$(pdfdir)" || exit 1; \
+-	fi; \
+-	for p in $$list; do \
+-	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
+-	  echo "$$d$$p"; \
+-	done | $(am__base_list) | \
+-	while read files; do \
+-	  echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(pdfdir)'"; \
+-	  $(INSTALL_DATA) $$files "$(DESTDIR)$(pdfdir)" || exit $$?; done
++install-pdf-am:
++
+ install-ps: install-ps-am
+ 
+-install-ps-am: $(PSS)
+-	@$(NORMAL_INSTALL)
+-	@list='$(PSS)'; test -n "$(psdir)" || list=; \
+-	if test -n "$$list"; then \
+-	  echo " $(MKDIR_P) '$(DESTDIR)$(psdir)'"; \
+-	  $(MKDIR_P) "$(DESTDIR)$(psdir)" || exit 1; \
+-	fi; \
+-	for p in $$list; do \
+-	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
+-	  echo "$$d$$p"; \
+-	done | $(am__base_list) | \
+-	while read files; do \
+-	  echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(psdir)'"; \
+-	  $(INSTALL_DATA) $$files "$(DESTDIR)$(psdir)" || exit $$?; done
+-installcheck-am: installcheck-binSCRIPTS installcheck-local
++install-ps-am:
++
++installcheck-am: installcheck-binSCRIPTS
+ 
+ maintainer-clean: maintainer-clean-am
+ 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
+ 	-rm -rf $(top_srcdir)/autom4te.cache
+ 	-rm -f Makefile
+-maintainer-clean-am: distclean-am maintainer-clean-aminfo \
+-	maintainer-clean-generic maintainer-clean-vti
++maintainer-clean-am: distclean-am maintainer-clean-generic
+ 
+ mostlyclean: mostlyclean-am
+ 
+-mostlyclean-am: mostlyclean-aminfo mostlyclean-generic mostlyclean-vti
++mostlyclean-am: mostlyclean-generic
+ 
+ pdf: pdf-am
+ 
+-pdf-am: $(PDFS)
++pdf-am:
+ 
+ ps: ps-am
+ 
+-ps-am: $(PSS)
++ps-am:
+ 
+ uninstall-am: uninstall-binSCRIPTS uninstall-dist_autoconflibDATA \
+ 	uninstall-dist_autotestlibDATA uninstall-dist_buildauxDATA \
+ 	uninstall-dist_lispLISP uninstall-dist_m4sugarlibDATA \
+-	uninstall-dist_perllibDATA uninstall-dvi-am uninstall-html-am \
+-	uninstall-info-am uninstall-man \
+-	uninstall-nodist_autoconflibDATA \
++	uninstall-dist_perllibDATA uninstall-nodist_autoconflibDATA \
+ 	uninstall-nodist_autoscanlibDATA \
+ 	uninstall-nodist_autotestlibDATA \
+ 	uninstall-nodist_m4sugarlibDATA uninstall-nodist_pkgdataDATA \
+-	uninstall-pdf-am uninstall-pkgdataDATA uninstall-ps-am
+-
+-uninstall-man: uninstall-man1
++	uninstall-pkgdataDATA
+ 
+ .MAKE: all check check-am install install-am install-data-am \
+ 	install-exec install-strip
+ 
+ .PHONY: CTAGS GTAGS TAGS all all-am am--refresh check check-am \
+-	check-local clean clean-aminfo clean-cscope clean-generic \
+-	clean-lisp clean-local cscope cscopelist-am ctags ctags-am \
+-	dist dist-all dist-bzip2 dist-gzip dist-hook dist-info \
+-	dist-lzip dist-shar dist-tarZ dist-xz dist-zip dist-zstd \
+-	distcheck distclean distclean-generic distclean-local \
+-	distclean-tags distcleancheck distdir distuninstallcheck dvi \
+-	dvi-am html html-am info info-am install install-am \
+-	install-binSCRIPTS install-data install-data-am \
+-	install-data-hook install-dist_autoconflibDATA \
+-	install-dist_autotestlibDATA install-dist_buildauxDATA \
+-	install-dist_lispLISP install-dist_m4sugarlibDATA \
+-	install-dist_perllibDATA install-dvi install-dvi-am \
+-	install-exec install-exec-am install-html install-html-am \
+-	install-info install-info-am install-man install-man1 \
+-	install-nodist_autoconflibDATA install-nodist_autoscanlibDATA \
+-	install-nodist_autotestlibDATA install-nodist_m4sugarlibDATA \
+-	install-nodist_pkgdataDATA install-pdf install-pdf-am \
+-	install-pkgdataDATA install-ps install-ps-am install-strip \
+-	installcheck installcheck-am installcheck-binSCRIPTS \
+-	installcheck-local installdirs maintainer-clean \
+-	maintainer-clean-aminfo maintainer-clean-generic \
+-	maintainer-clean-vti mostlyclean mostlyclean-aminfo \
+-	mostlyclean-generic mostlyclean-vti pdf pdf-am ps ps-am tags \
+-	tags-am uninstall uninstall-am uninstall-binSCRIPTS \
+-	uninstall-dist_autoconflibDATA uninstall-dist_autotestlibDATA \
+-	uninstall-dist_buildauxDATA uninstall-dist_lispLISP \
+-	uninstall-dist_m4sugarlibDATA uninstall-dist_perllibDATA \
+-	uninstall-dvi-am uninstall-html-am uninstall-info-am \
+-	uninstall-man uninstall-man1 uninstall-nodist_autoconflibDATA \
++	check-local clean clean-cscope clean-generic clean-lisp \
++	clean-local cscope cscopelist-am ctags ctags-am dist dist-all \
++	dist-bzip2 dist-gzip dist-hook dist-lzip dist-shar dist-tarZ \
++	dist-xz dist-zip dist-zstd distcheck distclean \
++	distclean-generic distclean-local distclean-tags \
++	distcleancheck distdir distuninstallcheck dvi dvi-am html \
++	html-am info info-am install install-am install-binSCRIPTS \
++	install-data install-data-am install-data-hook \
++	install-dist_autoconflibDATA install-dist_autotestlibDATA \
++	install-dist_buildauxDATA install-dist_lispLISP \
++	install-dist_m4sugarlibDATA install-dist_perllibDATA \
++	install-dvi install-dvi-am install-exec install-exec-am \
++	install-html install-html-am install-info install-info-am \
++	install-man install-nodist_autoconflibDATA \
++	install-nodist_autoscanlibDATA install-nodist_autotestlibDATA \
++	install-nodist_m4sugarlibDATA install-nodist_pkgdataDATA \
++	install-pdf install-pdf-am install-pkgdataDATA install-ps \
++	install-ps-am install-strip installcheck installcheck-am \
++	installcheck-binSCRIPTS installdirs maintainer-clean \
++	maintainer-clean-generic mostlyclean mostlyclean-generic pdf \
++	pdf-am ps ps-am tags tags-am uninstall uninstall-am \
++	uninstall-binSCRIPTS uninstall-dist_autoconflibDATA \
++	uninstall-dist_autotestlibDATA uninstall-dist_buildauxDATA \
++	uninstall-dist_lispLISP uninstall-dist_m4sugarlibDATA \
++	uninstall-dist_perllibDATA uninstall-nodist_autoconflibDATA \
+ 	uninstall-nodist_autoscanlibDATA \
+ 	uninstall-nodist_autotestlibDATA \
+ 	uninstall-nodist_m4sugarlibDATA uninstall-nodist_pkgdataDATA \
+-	uninstall-pdf-am uninstall-pkgdataDATA uninstall-ps-am
++	uninstall-pkgdataDATA
+ 
+ .PRECIOUS: Makefile
+ 
+@@ -2170,128 +1543,6 @@ install-data-hook-make-aux-scripts-executable:
+ 
+ .PHONY: install-data-hook install-data-hook-make-aux-scripts-executable
+ 
+-man/autoconf.1:   $(common_dep) man/autoconf.w   man/autoconf.x   $(binsrcdir)/autoconf.in
+-man/autoheader.1: $(common_dep) man/autoheader.w man/autoheader.x $(binsrcdir)/autoheader.in
+-man/autom4te.1:   $(common_dep) man/autom4te.w   man/autom4te.x   $(binsrcdir)/autom4te.in
+-man/autoreconf.1: $(common_dep) man/autoreconf.w man/autoreconf.x $(binsrcdir)/autoreconf.in
+-man/autoscan.1:   $(common_dep) man/autoscan.w   man/autoscan.x   $(binsrcdir)/autoscan.in
+-man/autoupdate.1: $(common_dep) man/autoupdate.w man/autoupdate.x $(binsrcdir)/autoupdate.in
+-man/ifnames.1:    $(common_dep) man/ifnames.w    man/ifnames.x    $(binsrcdir)/ifnames.in
+-
+-.w.1:
+-	@echo "Updating man page $@"
+-	$(MKDIR_P) $(@D)
+-	PATH="$(top_srcdir)/man$(PATH_SEPARATOR)$$PATH"; \
+-	PERL="$(PERL)"; \
+-	PACKAGE_NAME="$(PACKAGE_NAME)"; \
+-	VERSION="$(VERSION)"; \
+-	RELEASE_YEAR="$(RELEASE_YEAR)"; \
+-	top_srcdir="$(top_srcdir)"; \
+-	channeldefs_pm="$(channeldefs_pm)"; \
+-	export PATH PERL PACKAGE_NAME VERSION RELEASE_YEAR; \
+-	export top_srcdir channeldefs_pm; \
+-	$(HELP2MAN) \
+-	    --include=$(srcdir)/$*.x \
+-	    --include=$(srcdir)/man/common.x \
+-	    --source='$(PACKAGE_STRING)' \
+-	    --output=$@.t $(<F)
+-	if $(SED) $(remove_time_stamp) $@ >$@a.t 2>/dev/null && \
+-	   $(SED) $(remove_time_stamp) $@.t | cmp $@a.t - >/dev/null 2>&1; then \
+-		touch $@; \
+-	else \
+-		mv $@.t $@; \
+-	fi
+-	rm -f $@.t $@a.t
+-
+-# To satisfy 'distcleancheck', we need to delete built manpages in
+-# 'distclean' when the build and source directories are not the same.
+-# We know we are in this case when 'man/common.x' doesn't exist.
+-distclean-local: distclean-local-man
+-distclean-local-man:
+-	test -f man/common.x || rm -f $(dist_man_MANS)
+-
+-# The ':;' works around a redirected compound command bash exit status bug.
+-tests/package.m4: Makefile
+-	:;{ \
+-	  echo '# Signature of the current package.' && \
+-	  echo 'm4_define([AT_PACKAGE_NAME],      [$(PACKAGE_NAME)])' && \
+-	  echo 'm4_define([AT_PACKAGE_TARNAME],   [$(PACKAGE_TARNAME)])' && \
+-	  echo 'm4_define([AT_PACKAGE_VERSION],   [$(PACKAGE_VERSION)])' && \
+-	  echo 'm4_define([AT_PACKAGE_STRING],    [$(PACKAGE_STRING)])' && \
+-	  echo 'm4_define([AT_PACKAGE_BUGREPORT], [$(PACKAGE_BUGREPORT)])' && \
+-	  echo 'm4_define([AT_PACKAGE_URL],       [$(PACKAGE_URL)])'; \
+-	} > $@-t
+-	mv $@-t $@
+-
+-tests/wrapper.in: $(srcdir)/tests/wrapper.as $(m4sh_m4f_dependencies)
+-	$(MY_AUTOM4TE) --language=M4sh $(srcdir)/tests/wrapper.as -o $@
+-
+-$(wrappers): tests/wrapper.in
+-	rm -f $@ $@.tmp
+-	input=tests/wrapper.in \
+-	  && $(edit_wrapper) tests/wrapper.in >$@.tmp
+-	chmod +x $@.tmp
+-	chmod a-w $@.tmp
+-	mv -f $@.tmp $@
+-$(TESTSUITE): tests/package.m4 \
+-	      tests/local.at \
+-	      $(TESTSUITE_AT) \
+-	      lib/autotest/autotest.m4f
+-	$(AUTOTEST) $(AUTOTESTFLAGS) suite.at -o $@.tmp
+-	mv $@.tmp $@
+-$(distclean_generic): clean-local
+-
+-clean-local:
+-	test ! -f $(TESTSUITE) || $(run_testsuite)  --clean
+-	rm -f *.tmp
+-	rm -f -r autom4te.cache
+-
+-check-local: tests/atconfig tests/atlocal $(TESTSUITE)
+-	+$(run_testsuite) $(TESTSUITEFLAGS)
+-
+-# Automake doesn't know how to regenerate this file because
+-# it's created via AC_CONFIG_COMMANDS.
+-tests/atconfig: $(top_builddir)/config.status
+-	cd $(top_builddir) && $(SHELL) ./config.status $@
+-
+-# Run the test suite on the *installed* tree.
+-installcheck-local: tests/atconfig tests/atlocal $(TESTSUITE)
+-	+$(run_testsuite) AUTOTEST_PATH="$(bindir)" $(TESTSUITEFLAGS)
+-
+-$(TESTSUITE_GENERATED_AT): tests/mktests.stamp
+-	@if test -f $@; then :; else \
+-	  rm -f tests/mktests.stamp; \
+-	  $(MAKE) $(AM_MAKEFLAGS) tests/mktests.stamp; \
+-	fi
+-
+-tests/mktests.stamp : tests/mktests.pl $(AUTOCONF_FILES)
+-	@rm -f tests/mktests.tmp
+-	@touch tests/mktests.tmp
+-	$(PERL) $(srcdir)/tests/mktests.pl tests $(AUTOCONF_FILES)
+-	@mv -f tests/mktests.tmp $@
+-
+-# The test suite cannot be run in parallel with itself.
+-maintainer-check:
+-	$(MAKE) $(AM_MAKEFLAGS) check
+-	$(MAKE) $(AM_MAKEFLAGS) maintainer-check-posix
+-expr:
+-	:;{					\
+-	  echo '#! $(SHELL)';			\
+-	  echo 'result=`$(EXPR) "$$@"`';	\
+-	  echo 'estatus=$$?';			\
+-	  echo 'cat <<EOF';			\
+-	  echo '$${result:-0}';			\
+-	  echo 'EOF';				\
+-	  echo 'exit $$estatus';		\
+-	} > $@-t
+-	chmod +x $@-t
+-	mv $@-t $@
+-
+-# Try the test suite with more severe environments.
+-maintainer-check-posix: expr
+-	POSIXLY_CORRECT=yes $(MAKE) $(AM_MAKEFLAGS) check
+-	rm expr
+-
+ check-coverage-run: all
+ 	$(MKDIR_P) $(PERL_COVERAGE_DB)
+ 	PERL5OPT="$(PERL_COVERAGE_FLAGS)"; export PERL5OPT; \
+diff --git a/aclocal.m4 b/aclocal.m4
+index 16c5ad9..8aea46d 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -14,8 +14,8 @@
+ m4_ifndef([AC_CONFIG_MACRO_DIRS], [m4_defun([_AM_CONFIG_MACRO_DIRS], [])m4_defun([AC_CONFIG_MACRO_DIRS], [_AM_CONFIG_MACRO_DIRS($@)])])
+ m4_ifndef([AC_AUTOCONF_VERSION],
+   [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
+-m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.72],,
+-[m4_warning([this file was generated for autoconf 2.72.
++m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.71],,
++[m4_warning([this file was generated for autoconf 2.71.
+ You have another version of autoconf.  It may work, but is not guaranteed to.
+ If you have problems, you may need to regenerate the build system entirely.
+ To do so, use the procedure documented by the package, typically 'autoreconf'.])])
+diff --git a/configure b/configure
+index 796d1e4..a0d852c 100755
+--- a/configure
++++ b/configure
+@@ -1,11 +1,11 @@
+ #! /bin/sh
+ # Guess values for system-dependent variables and create Makefiles.
+-# Generated by GNU Autoconf 2.72 for GNU Autoconf 2.72.
++# Generated by GNU Autoconf 2.71 for GNU Autoconf 2.72.
+ #
+ # Report bugs to <bug-autoconf@gnu.org>.
+ #
+ #
+-# Copyright (C) 1992-1996, 1998-2017, 2020-2023 Free Software Foundation,
++# Copyright (C) 1992-1996, 1998-2017, 2020-2021 Free Software Foundation,
+ # Inc.
+ #
+ #
+@@ -17,6 +17,7 @@
+ 
+ # Be more Bourne compatible
+ DUALCASE=1; export DUALCASE # for MKS sh
++as_nop=:
+ if test ${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
+ then :
+   emulate sh
+@@ -25,13 +26,12 @@ then :
+   # is contrary to our usage.  Disable this feature.
+   alias -g '${1+"$@"}'='"$@"'
+   setopt NO_GLOB_SUBST
+-else case e in #(
+-  e) case `(set -o) 2>/dev/null` in #(
++else $as_nop
++  case `(set -o) 2>/dev/null` in #(
+   *posix*) :
+     set -o posix ;; #(
+   *) :
+      ;;
+-esac ;;
+ esac
+ fi
+ 
+@@ -103,7 +103,7 @@ IFS=$as_save_IFS
+ 
+      ;;
+ esac
+-# We did not find ourselves, most probably we were run as 'sh COMMAND'
++# We did not find ourselves, most probably we were run as `sh COMMAND'
+ # in which case we are not to be found in the path.
+ if test "x$as_myself" = x; then
+   as_myself=$0
+@@ -133,14 +133,15 @@ case $- in # ((((
+ esac
+ exec $CONFIG_SHELL $as_opts "$as_myself" ${1+"$@"}
+ # Admittedly, this is quite paranoid, since all the known shells bail
+-# out after a failed 'exec'.
++# out after a failed `exec'.
+ printf "%s\n" "$0: could not re-execute with $CONFIG_SHELL" >&2
+ exit 255
+   fi
+   # We don't want this to propagate to other subprocesses.
+           { _as_can_reexec=; unset _as_can_reexec;}
+ if test "x$CONFIG_SHELL" = x; then
+-  as_bourne_compatible="if test \${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
++  as_bourne_compatible="as_nop=:
++if test \${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
+ then :
+   emulate sh
+   NULLCMD=:
+@@ -148,13 +149,12 @@ then :
+   # is contrary to our usage.  Disable this feature.
+   alias -g '\${1+\"\$@\"}'='\"\$@\"'
+   setopt NO_GLOB_SUBST
+-else case e in #(
+-  e) case \`(set -o) 2>/dev/null\` in #(
++else \$as_nop
++  case \`(set -o) 2>/dev/null\` in #(
+   *posix*) :
+     set -o posix ;; #(
+   *) :
+      ;;
+-esac ;;
+ esac
+ fi
+ "
+@@ -172,9 +172,8 @@ as_fn_ret_failure && { exitcode=1; echo as_fn_ret_failure succeeded.; }
+ if ( set x; as_fn_ret_success y && test x = \"\$1\" )
+ then :
+ 
+-else case e in #(
+-  e) exitcode=1; echo positional parameters were not saved. ;;
+-esac
++else \$as_nop
++  exitcode=1; echo positional parameters were not saved.
+ fi
+ test x\$exitcode = x0 || exit 1
+ blah=\$(echo \$(echo blah))
+@@ -188,15 +187,14 @@ test \$(( 1 + 1 )) = 2 || exit 1"
+   if (eval "$as_required") 2>/dev/null
+ then :
+   as_have_required=yes
+-else case e in #(
+-  e) as_have_required=no ;;
+-esac
++else $as_nop
++  as_have_required=no
+ fi
+   if test x$as_have_required = xyes && (eval "$as_suggested") 2>/dev/null
+ then :
+ 
+-else case e in #(
+-  e) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++else $as_nop
++  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+ as_found=false
+ for as_dir in /bin$PATH_SEPARATOR/usr/bin$PATH_SEPARATOR$PATH
+ do
+@@ -229,13 +227,12 @@ IFS=$as_save_IFS
+ if $as_found
+ then :
+ 
+-else case e in #(
+-  e) if { test -f "$SHELL" || test -f "$SHELL.exe"; } &&
++else $as_nop
++  if { test -f "$SHELL" || test -f "$SHELL.exe"; } &&
+ 	      as_run=a "$SHELL" -c "$as_bourne_compatible""$as_required" 2>/dev/null
+ then :
+   CONFIG_SHELL=$SHELL as_have_required=yes
+-fi ;;
+-esac
++fi
+ fi
+ 
+ 
+@@ -257,7 +254,7 @@ case $- in # ((((
+ esac
+ exec $CONFIG_SHELL $as_opts "$as_myself" ${1+"$@"}
+ # Admittedly, this is quite paranoid, since all the known shells bail
+-# out after a failed 'exec'.
++# out after a failed `exec'.
+ printf "%s\n" "$0: could not re-execute with $CONFIG_SHELL" >&2
+ exit 255
+ fi
+@@ -276,8 +273,7 @@ $0: message. Then install a modern shell, or manually run
+ $0: the script under such a shell if you do have one."
+   fi
+   exit 1
+-fi ;;
+-esac
++fi
+ fi
+ fi
+ SHELL=${CONFIG_SHELL-/bin/sh}
+@@ -316,6 +312,14 @@ as_fn_exit ()
+   as_fn_set_status $1
+   exit $1
+ } # as_fn_exit
++# as_fn_nop
++# ---------
++# Do nothing but, unlike ":", preserve the value of $?.
++as_fn_nop ()
++{
++  return $?
++}
++as_nop=as_fn_nop
+ 
+ # as_fn_mkdir_p
+ # -------------
+@@ -384,12 +388,11 @@ then :
+   {
+     eval $1+=\$2
+   }'
+-else case e in #(
+-  e) as_fn_append ()
++else $as_nop
++  as_fn_append ()
+   {
+     eval $1=\$$1\$2
+-  } ;;
+-esac
++  }
+ fi # as_fn_append
+ 
+ # as_fn_arith ARG...
+@@ -403,14 +406,21 @@ then :
+   {
+     as_val=$(( $* ))
+   }'
+-else case e in #(
+-  e) as_fn_arith ()
++else $as_nop
++  as_fn_arith ()
+   {
+     as_val=`expr "$@" || test $? -eq 1`
+-  } ;;
+-esac
++  }
+ fi # as_fn_arith
+ 
++# as_fn_nop
++# ---------
++# Do nothing but, unlike ":", preserve the value of $?.
++as_fn_nop ()
++{
++  return $?
++}
++as_nop=as_fn_nop
+ 
+ # as_fn_error STATUS ERROR [LINENO LOG_FD]
+ # ----------------------------------------
+@@ -484,8 +494,6 @@ as_cr_alnum=$as_cr_Letters$as_cr_digits
+     /[$]LINENO/=
+   ' <$as_myself |
+     sed '
+-      t clear
+-      :clear
+       s/[$]LINENO.*/&-/
+       t lineno
+       b
+@@ -534,6 +542,7 @@ esac
+ as_echo='printf %s\n'
+ as_echo_n='printf %s'
+ 
++
+ rm -f conf$$ conf$$.exe conf$$.file
+ if test -d conf$$.dir; then
+   rm -f conf$$.dir/conf$$.file
+@@ -545,9 +554,9 @@ if (echo >conf$$.file) 2>/dev/null; then
+   if ln -s conf$$.file conf$$ 2>/dev/null; then
+     as_ln_s='ln -s'
+     # ... but there are two gotchas:
+-    # 1) On MSYS, both 'ln -s file dir' and 'ln file dir' fail.
+-    # 2) DJGPP < 2.04 has no symlinks; 'ln -s' creates a wrapper executable.
+-    # In both cases, we have to default to 'cp -pR'.
++    # 1) On MSYS, both `ln -s file dir' and `ln file dir' fail.
++    # 2) DJGPP < 2.04 has no symlinks; `ln -s' creates a wrapper executable.
++    # In both cases, we have to default to `cp -pR'.
+     ln -s conf$$.file conf$$.dir 2>/dev/null && test ! -f conf$$.exe ||
+       as_ln_s='cp -pR'
+   elif ln conf$$.file conf$$ 2>/dev/null; then
+@@ -572,12 +581,10 @@ as_test_x='test -x'
+ as_executable_p=as_fn_executable_p
+ 
+ # Sed expression to map a string onto a valid CPP name.
+-as_sed_cpp="y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g"
+-as_tr_cpp="eval sed '$as_sed_cpp'" # deprecated
++as_tr_cpp="eval sed 'y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g'"
+ 
+ # Sed expression to map a string onto a valid variable name.
+-as_sed_sh="y%*+%pp%;s%[^_$as_cr_alnum]%_%g"
+-as_tr_sh="eval sed '$as_sed_sh'" # deprecated
++as_tr_sh="eval sed 'y%*+%pp%;s%[^_$as_cr_alnum]%_%g'"
+ 
+ 
+ test -n "$DJDIR" || exec 7<&0 </dev/null
+@@ -828,7 +835,7 @@ do
+     ac_useropt=`expr "x$ac_option" : 'x-*disable-\(.*\)'`
+     # Reject names that are not valid shell variable names.
+     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+-      as_fn_error $? "invalid feature name: '$ac_useropt'"
++      as_fn_error $? "invalid feature name: \`$ac_useropt'"
+     ac_useropt_orig=$ac_useropt
+     ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
+     case $ac_user_opts in
+@@ -854,7 +861,7 @@ do
+     ac_useropt=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
+     # Reject names that are not valid shell variable names.
+     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+-      as_fn_error $? "invalid feature name: '$ac_useropt'"
++      as_fn_error $? "invalid feature name: \`$ac_useropt'"
+     ac_useropt_orig=$ac_useropt
+     ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
+     case $ac_user_opts in
+@@ -1067,7 +1074,7 @@ do
+     ac_useropt=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
+     # Reject names that are not valid shell variable names.
+     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+-      as_fn_error $? "invalid package name: '$ac_useropt'"
++      as_fn_error $? "invalid package name: \`$ac_useropt'"
+     ac_useropt_orig=$ac_useropt
+     ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
+     case $ac_user_opts in
+@@ -1083,7 +1090,7 @@ do
+     ac_useropt=`expr "x$ac_option" : 'x-*without-\(.*\)'`
+     # Reject names that are not valid shell variable names.
+     expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+-      as_fn_error $? "invalid package name: '$ac_useropt'"
++      as_fn_error $? "invalid package name: \`$ac_useropt'"
+     ac_useropt_orig=$ac_useropt
+     ac_useropt=`printf "%s\n" "$ac_useropt" | sed 's/[-+.]/_/g'`
+     case $ac_user_opts in
+@@ -1113,8 +1120,8 @@ do
+   | --x-librar=* | --x-libra=* | --x-libr=* | --x-lib=* | --x-li=* | --x-l=*)
+     x_libraries=$ac_optarg ;;
+ 
+-  -*) as_fn_error $? "unrecognized option: '$ac_option'
+-Try '$0 --help' for more information"
++  -*) as_fn_error $? "unrecognized option: \`$ac_option'
++Try \`$0 --help' for more information"
+     ;;
+ 
+   *=*)
+@@ -1122,7 +1129,7 @@ Try '$0 --help' for more information"
+     # Reject names that are not valid shell variable names.
+     case $ac_envvar in #(
+       '' | [0-9]* | *[!_$as_cr_alnum]* )
+-      as_fn_error $? "invalid variable name: '$ac_envvar'" ;;
++      as_fn_error $? "invalid variable name: \`$ac_envvar'" ;;
+     esac
+     eval $ac_envvar=\$ac_optarg
+     export $ac_envvar ;;
+@@ -1172,7 +1179,7 @@ do
+   as_fn_error $? "expected an absolute directory name for --$ac_var: $ac_val"
+ done
+ 
+-# There might be people who depend on the old broken behavior: '$host'
++# There might be people who depend on the old broken behavior: `$host'
+ # used to hold the argument of --host etc.
+ # FIXME: To remove some day.
+ build=$build_alias
+@@ -1240,7 +1247,7 @@ if test ! -r "$srcdir/$ac_unique_file"; then
+   test "$ac_srcdir_defaulted" = yes && srcdir="$ac_confdir or .."
+   as_fn_error $? "cannot find sources ($ac_unique_file) in $srcdir"
+ fi
+-ac_msg="sources are in $srcdir, but 'cd $srcdir' does not work"
++ac_msg="sources are in $srcdir, but \`cd $srcdir' does not work"
+ ac_abs_confdir=`(
+ 	cd "$srcdir" && test -r "./$ac_unique_file" || as_fn_error $? "$ac_msg"
+ 	pwd)`
+@@ -1268,7 +1275,7 @@ if test "$ac_init_help" = "long"; then
+   # Omit some internal or obsolete options to make the list less imposing.
+   # This message is too long to be a string in the A/UX 3.1 sh.
+   cat <<_ACEOF
+-'configure' configures GNU Autoconf 2.72 to adapt to many kinds of systems.
++\`configure' configures GNU Autoconf 2.72 to adapt to many kinds of systems.
+ 
+ Usage: $0 [OPTION]... [VAR=VALUE]...
+ 
+@@ -1282,11 +1289,11 @@ Configuration:
+       --help=short        display options specific to this package
+       --help=recursive    display the short help of all the included packages
+   -V, --version           display version information and exit
+-  -q, --quiet, --silent   do not print 'checking ...' messages
++  -q, --quiet, --silent   do not print \`checking ...' messages
+       --cache-file=FILE   cache test results in FILE [disabled]
+-  -C, --config-cache      alias for '--cache-file=config.cache'
++  -C, --config-cache      alias for \`--cache-file=config.cache'
+   -n, --no-create         do not create output files
+-      --srcdir=DIR        find the sources in DIR [configure dir or '..']
++      --srcdir=DIR        find the sources in DIR [configure dir or \`..']
+ 
+ Installation directories:
+   --prefix=PREFIX         install architecture-independent files in PREFIX
+@@ -1294,10 +1301,10 @@ Installation directories:
+   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
+                           [PREFIX]
+ 
+-By default, 'make install' will install all the files in
+-'$ac_default_prefix/bin', '$ac_default_prefix/lib' etc.  You can specify
+-an installation prefix other than '$ac_default_prefix' using '--prefix',
+-for instance '--prefix=\$HOME'.
++By default, \`make install' will install all the files in
++\`$ac_default_prefix/bin', \`$ac_default_prefix/lib' etc.  You can specify
++an installation prefix other than \`$ac_default_prefix' using \`--prefix',
++for instance \`--prefix=\$HOME'.
+ 
+ For better control, use the options below.
+ 
+@@ -1362,7 +1369,7 @@ Some influential environment variables:
+   EMACSLOADPATH
+               the Emacs library search path
+ 
+-Use these variables to override the choices made by 'configure' or to help
++Use these variables to override the choices made by `configure' or to help
+ it to find libraries and programs with nonstandard names/locations.
+ 
+ Report bugs to <bug-autoconf@gnu.org>.
+@@ -1432,9 +1439,9 @@ test -n "$ac_init_help" && exit $ac_status
+ if $ac_init_version; then
+   cat <<\_ACEOF
+ GNU Autoconf configure 2.72
+-generated by GNU Autoconf 2.72
++generated by GNU Autoconf 2.71
+ 
+-Copyright (C) 2023 Free Software Foundation, Inc.
++Copyright (C) 2021 Free Software Foundation, Inc.
+ This configure script is free software; the Free Software Foundation
+ gives unlimited permission to copy, distribute and modify it.
+ _ACEOF
+@@ -1469,7 +1476,7 @@ This file contains any messages produced by compilers while
+ running configure, to aid debugging if configure makes a mistake.
+ 
+ It was created by GNU Autoconf $as_me 2.72, which was
+-generated by GNU Autoconf 2.72.  Invocation command line was
++generated by GNU Autoconf 2.71.  Invocation command line was
+ 
+   $ $0$ac_configure_args_raw
+ 
+@@ -1715,10 +1722,10 @@ esac
+ printf "%s\n" "$as_me: loading site script $ac_site_file" >&6;}
+     sed 's/^/| /' "$ac_site_file" >&5
+     . "$ac_site_file" \
+-      || { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in '$ac_pwd':" >&5
+-printf "%s\n" "$as_me: error: in '$ac_pwd':" >&2;}
++      || { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
++printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
+ as_fn_error $? "failed to load site script $ac_site_file
+-See 'config.log' for more details" "$LINENO" 5; }
++See \`config.log' for more details" "$LINENO" 5; }
+   fi
+ done
+ 
+@@ -1818,9 +1825,8 @@ IFS=$as_save_IFS
+ if $as_found
+ then :
+ 
+-else case e in #(
+-  e) as_fn_error $? "cannot find required auxiliary files:$ac_missing_aux_files" "$LINENO" 5 ;;
+-esac
++else $as_nop
++  as_fn_error $? "cannot find required auxiliary files:$ac_missing_aux_files" "$LINENO" 5
+ fi
+ 
+ 
+@@ -1848,12 +1854,12 @@ for ac_var in $ac_precious_vars; do
+   eval ac_new_val=\$ac_env_${ac_var}_value
+   case $ac_old_set,$ac_new_set in
+     set,)
+-      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: '$ac_var' was set to '$ac_old_val' in the previous run" >&5
+-printf "%s\n" "$as_me: error: '$ac_var' was set to '$ac_old_val' in the previous run" >&2;}
++      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&5
++printf "%s\n" "$as_me: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&2;}
+       ac_cache_corrupted=: ;;
+     ,set)
+-      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: '$ac_var' was not set in the previous run" >&5
+-printf "%s\n" "$as_me: error: '$ac_var' was not set in the previous run" >&2;}
++      { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' was not set in the previous run" >&5
++printf "%s\n" "$as_me: error: \`$ac_var' was not set in the previous run" >&2;}
+       ac_cache_corrupted=: ;;
+     ,);;
+     *)
+@@ -1862,18 +1868,18 @@ printf "%s\n" "$as_me: error: '$ac_var' was not set in the previous run" >&2;}
+ 	ac_old_val_w=`echo x $ac_old_val`
+ 	ac_new_val_w=`echo x $ac_new_val`
+ 	if test "$ac_old_val_w" != "$ac_new_val_w"; then
+-	  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: '$ac_var' has changed since the previous run:" >&5
+-printf "%s\n" "$as_me: error: '$ac_var' has changed since the previous run:" >&2;}
++	  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: \`$ac_var' has changed since the previous run:" >&5
++printf "%s\n" "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+ 	  ac_cache_corrupted=:
+ 	else
+-	  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: warning: ignoring whitespace changes in '$ac_var' since the previous run:" >&5
+-printf "%s\n" "$as_me: warning: ignoring whitespace changes in '$ac_var' since the previous run:" >&2;}
++	  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&5
++printf "%s\n" "$as_me: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&2;}
+ 	  eval $ac_var=\$ac_old_val
+ 	fi
+-	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}:   former value:  '$ac_old_val'" >&5
+-printf "%s\n" "$as_me:   former value:  '$ac_old_val'" >&2;}
+-	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}:   current value: '$ac_new_val'" >&5
+-printf "%s\n" "$as_me:   current value: '$ac_new_val'" >&2;}
++	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}:   former value:  \`$ac_old_val'" >&5
++printf "%s\n" "$as_me:   former value:  \`$ac_old_val'" >&2;}
++	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}:   current value: \`$ac_new_val'" >&5
++printf "%s\n" "$as_me:   current value: \`$ac_new_val'" >&2;}
+       fi;;
+   esac
+   # Pass precious variables to config.status.
+@@ -1889,11 +1895,11 @@ printf "%s\n" "$as_me:   current value: '$ac_new_val'" >&2;}
+   fi
+ done
+ if $ac_cache_corrupted; then
+-  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in '$ac_pwd':" >&5
+-printf "%s\n" "$as_me: error: in '$ac_pwd':" >&2;}
++  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
++printf "%s\n" "$as_me: error: in \`$ac_pwd':" >&2;}
+   { printf "%s\n" "$as_me:${as_lineno-$LINENO}: error: changes in the environment can compromise the build" >&5
+ printf "%s\n" "$as_me: error: changes in the environment can compromise the build" >&2;}
+-  as_fn_error $? "run '${MAKE-make} distclean' and/or 'rm $cache_file'
++  as_fn_error $? "run \`${MAKE-make} distclean' and/or \`rm $cache_file'
+ 	    and start over" "$LINENO" 5
+ fi
+ ## -------------------- ##
+@@ -1935,8 +1941,8 @@ if test -z "$INSTALL"; then
+ if test ${ac_cv_path_install+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++else $as_nop
++  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+ for as_dir in $PATH
+ do
+   IFS=$as_save_IFS
+@@ -1990,8 +1996,7 @@ esac
+ IFS=$as_save_IFS
+ 
+ rm -rf conftest.one conftest.two conftest.dir
+- ;;
+-esac
++
+ fi
+   if test ${ac_cv_path_install+y}; then
+     INSTALL=$ac_cv_path_install
+@@ -2087,7 +2092,7 @@ test "$program_prefix" != NONE &&
+ test "$program_suffix" != NONE &&
+   program_transform_name="s&\$&$program_suffix&;$program_transform_name"
+ # Double any \ or $.
+-# By default was 's,x,x', remove it if useless.
++# By default was `s,x,x', remove it if useless.
+ ac_script='s/[\\$]/&&/g;s/;s,x,x,$//'
+ program_transform_name=`printf "%s\n" "$program_transform_name" | sed "$ac_script"`
+ 
+@@ -2130,8 +2135,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_prog_STRIP+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test -n "$STRIP"; then
++else $as_nop
++  if test -n "$STRIP"; then
+   ac_cv_prog_STRIP="$STRIP" # Let the user override the test.
+ else
+ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+@@ -2153,8 +2158,7 @@ done
+   done
+ IFS=$as_save_IFS
+ 
+-fi ;;
+-esac
++fi
+ fi
+ STRIP=$ac_cv_prog_STRIP
+ if test -n "$STRIP"; then
+@@ -2176,8 +2180,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_prog_ac_ct_STRIP+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test -n "$ac_ct_STRIP"; then
++else $as_nop
++  if test -n "$ac_ct_STRIP"; then
+   ac_cv_prog_ac_ct_STRIP="$ac_ct_STRIP" # Let the user override the test.
+ else
+ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+@@ -2199,8 +2203,7 @@ done
+   done
+ IFS=$as_save_IFS
+ 
+-fi ;;
+-esac
++fi
+ fi
+ ac_ct_STRIP=$ac_cv_prog_ac_ct_STRIP
+ if test -n "$ac_ct_STRIP"; then
+@@ -2236,8 +2239,8 @@ if test -z "$MKDIR_P"; then
+   if test ${ac_cv_path_mkdir+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++else $as_nop
++  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+ for as_dir in $PATH$PATH_SEPARATOR/opt/sfw/bin
+ do
+   IFS=$as_save_IFS
+@@ -2251,7 +2254,7 @@ do
+ 	   as_fn_executable_p "$as_dir$ac_prog$ac_exec_ext" || continue
+ 	   case `"$as_dir$ac_prog$ac_exec_ext" --version 2>&1` in #(
+ 	     'mkdir ('*'coreutils) '* | \
+-	     *'BusyBox '* | \
++	     'BusyBox '* | \
+ 	     'mkdir (fileutils) '4.1*)
+ 	       ac_cv_path_mkdir=$as_dir$ac_prog$ac_exec_ext
+ 	       break 3;;
+@@ -2260,17 +2263,18 @@ do
+        done
+   done
+ IFS=$as_save_IFS
+- ;;
+-esac
++
+ fi
+ 
+   test -d ./--version && rmdir ./--version
+   if test ${ac_cv_path_mkdir+y}; then
+     MKDIR_P="$ac_cv_path_mkdir -p"
+   else
+-    # As a last resort, use plain mkdir -p,
+-    # in the hope it doesn't have the bugs of ancient mkdir.
+-    MKDIR_P='mkdir -p'
++    # As a last resort, use the slow shell script.  Don't cache a
++    # value for MKDIR_P within a source directory, because that will
++    # break other packages using the cache if that directory is
++    # removed, or if the value is a relative name.
++    MKDIR_P="$ac_install_sh -d"
+   fi
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $MKDIR_P" >&5
+@@ -2285,8 +2289,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_prog_AWK+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test -n "$AWK"; then
++else $as_nop
++  if test -n "$AWK"; then
+   ac_cv_prog_AWK="$AWK" # Let the user override the test.
+ else
+ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+@@ -2308,8 +2312,7 @@ done
+   done
+ IFS=$as_save_IFS
+ 
+-fi ;;
+-esac
++fi
+ fi
+ AWK=$ac_cv_prog_AWK
+ if test -n "$AWK"; then
+@@ -2331,8 +2334,8 @@ ac_make=`printf "%s\n" "$2" | sed 's/+/p/g; s/[^a-zA-Z0-9_]/_/g'`
+ if eval test \${ac_cv_prog_make_${ac_make}_set+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) cat >conftest.make <<\_ACEOF
++else $as_nop
++  cat >conftest.make <<\_ACEOF
+ SHELL = /bin/sh
+ all:
+ 	@echo '@@@%%%=$(MAKE)=@@@%%%'
+@@ -2344,8 +2347,7 @@ case `${MAKE-make} -f conftest.make 2>/dev/null` in
+   *)
+     eval ac_cv_prog_make_${ac_make}_set=no;;
+ esac
+-rm -f conftest.make ;;
+-esac
++rm -f conftest.make
+ fi
+ if eval test \$ac_cv_prog_make_${ac_make}_set = yes; then
+   { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+@@ -2383,8 +2385,8 @@ printf %s "checking whether $am_make supports nested variables... " >&6; }
+ if test ${am_cv_make_support_nested_variables+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if printf "%s\n" 'TRUE=$(BAR$(V))
++else $as_nop
++  if printf "%s\n" 'TRUE=$(BAR$(V))
+ BAR0=false
+ BAR1=true
+ V=1
+@@ -2394,8 +2396,7 @@ am__doit:
+   am_cv_make_support_nested_variables=yes
+ else
+   am_cv_make_support_nested_variables=no
+-fi ;;
+-esac
++fi
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $am_cv_make_support_nested_variables" >&5
+ printf "%s\n" "$am_cv_make_support_nested_variables" >&6; }
+@@ -2550,16 +2551,15 @@ printf %s "checking build system type... " >&6; }
+ if test ${ac_cv_build+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) ac_build_alias=$build_alias
++else $as_nop
++  ac_build_alias=$build_alias
+ test "x$ac_build_alias" = x &&
+   ac_build_alias=`$SHELL "${ac_aux_dir}config.guess"`
+ test "x$ac_build_alias" = x &&
+   as_fn_error $? "cannot guess build type; you must specify one" "$LINENO" 5
+ ac_cv_build=`$SHELL "${ac_aux_dir}config.sub" $ac_build_alias` ||
+   as_fn_error $? "$SHELL ${ac_aux_dir}config.sub $ac_build_alias failed" "$LINENO" 5
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_build" >&5
+ printf "%s\n" "$ac_cv_build" >&6; }
+@@ -2586,15 +2586,14 @@ printf %s "checking host system type... " >&6; }
+ if test ${ac_cv_host+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test "x$host_alias" = x; then
++else $as_nop
++  if test "x$host_alias" = x; then
+   ac_cv_host=$ac_cv_build
+ else
+   ac_cv_host=`$SHELL "${ac_aux_dir}config.sub" $host_alias` ||
+     as_fn_error $? "$SHELL ${ac_aux_dir}config.sub $host_alias failed" "$LINENO" 5
+ fi
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_host" >&5
+ printf "%s\n" "$ac_cv_host" >&6; }
+@@ -2677,8 +2676,8 @@ printf %s "checking for a shell whose -n mode is known to work... " >&6; }
+ if test ${ac_cv_sh_working_n+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) ac_cv_sh_working_n=none
++else $as_nop
++  ac_cv_sh_working_n=none
+ # Start by trying the shell that autoconf decided to use for this script,
+ # follow with a hardwired list of shells that are known to work and can
+ # be identified as such, starting with the ones with the fewest
+@@ -2702,8 +2701,7 @@ do
+     break
+   fi
+ done
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_sh_working_n" >&5
+ printf "%s\n" "$ac_cv_sh_working_n" >&6; }
+@@ -2715,8 +2713,8 @@ printf %s "checking for characters that cannot appear in file names... " >&6; }
+ if test ${ac_cv_unsupported_fs_chars+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) ac_cv_unsupported_fs_chars=
++else $as_nop
++  ac_cv_unsupported_fs_chars=
+ for c in '\\' \" '<' '>' '*' '?' '|'
+ do
+   touch "conftest.t${c}t" 2>/dev/null
+@@ -2724,8 +2722,7 @@ do
+   # $c cannot be used in a file name.
+   ac_cv_unsupported_fs_chars=$ac_cv_unsupported_fs_chars$c
+ done
+- ;;
+-esac
++
+ fi
+ 
+ if test -n "$ac_cv_unsupported_fs_chars"; then
+@@ -2743,16 +2740,15 @@ printf %s "checking whether directories can have trailing spaces... " >&6; }
+ if test ${ac_cv_dir_trailing_space+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) rm -rf 'conftest.d ' && mkdir 'conftest.d ' && touch 'conftest.d /tfile' 2>/dev/null
++else $as_nop
++  rm -rf 'conftest.d ' && mkdir 'conftest.d ' && touch 'conftest.d /tfile' 2>/dev/null
+ stat=$?
+ rm -rf 'conftest.d '
+ case $stat$? in #(
+    00) ac_cv_dir_trailing_space=yes ;; #(
+    *) ac_cv_dir_trailing_space=no ;;
+ esac
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_dir_trailing_space" >&5
+ printf "%s\n" "$ac_cv_dir_trailing_space" >&6; }
+@@ -2770,8 +2766,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_path_EXPR+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) case $EXPR in
++else $as_nop
++  case $EXPR in
+   [\\/]* | ?:[\\/]*)
+   ac_cv_path_EXPR="$EXPR" # Let the user override the test with a path.
+   ;;
+@@ -2796,7 +2792,6 @@ done
+ IFS=$as_save_IFS
+ 
+   ;;
+-esac ;;
+ esac
+ fi
+ EXPR=$ac_cv_path_EXPR
+@@ -2825,8 +2820,8 @@ printf %s "checking for GNU M4 that supports accurate traces... " >&6; }
+ if test ${ac_cv_path_M4+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) rm -f conftest.m4f
++else $as_nop
++  rm -f conftest.m4f
+ ac_had_posixly_correct=${POSIXLY_CORRECT:+yes}
+ { POSIXLY_CORRECT=; unset POSIXLY_CORRECT;}
+ if test -z "$M4"; then
+@@ -2883,8 +2878,7 @@ Glibc 2.9 - 2.12 and GNU M4 1.4.11 - 1.4.15 have another strstr bug." "$LINENO"
+ else
+   ac_cv_path_M4=$M4
+ fi
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_M4" >&5
+ printf "%s\n" "$ac_cv_path_M4" >&6; }
+@@ -2894,12 +2888,11 @@ printf %s "checking whether $ac_cv_path_M4 accepts --gnu... " >&6; }
+ if test ${ac_cv_prog_gnu_m4_gnu+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) case `$M4 --help < /dev/null 2>&1` in
++else $as_nop
++  case `$M4 --help < /dev/null 2>&1` in
+       *--gnu*) ac_cv_prog_gnu_m4_gnu=yes ;;
+       *) ac_cv_prog_gnu_m4_gnu=no ;;
+-    esac ;;
+-esac
++    esac
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_gnu_m4_gnu" >&5
+ printf "%s\n" "$ac_cv_prog_gnu_m4_gnu" >&6; }
+@@ -2923,12 +2916,11 @@ printf %s "checking how m4 supports trace files... " >&6; }
+ if test ${ac_cv_prog_gnu_m4_debugfile+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) case `$M4 --help < /dev/null 2>&1` in
++else $as_nop
++  case `$M4 --help < /dev/null 2>&1` in
+       *debugfile*) ac_cv_prog_gnu_m4_debugfile=--debugfile ;;
+       *) ac_cv_prog_gnu_m4_debugfile=--error-output ;;
+-    esac ;;
+-esac
++    esac
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_gnu_m4_debugfile" >&5
+ printf "%s\n" "$ac_cv_prog_gnu_m4_debugfile" >&6; }
+@@ -2957,8 +2949,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_path_PERL+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) case $PERL in
++else $as_nop
++  case $PERL in
+   [\\/]* | ?:[\\/]*)
+   ac_cv_path_PERL="$PERL" # Let the user override the test with a path.
+   ;;
+@@ -2984,7 +2976,6 @@ IFS=$as_save_IFS
+ 
+   test -z "$ac_cv_path_PERL" && ac_cv_path_PERL="no"
+   ;;
+-esac ;;
+ esac
+ fi
+ PERL=$ac_cv_path_PERL
+@@ -3013,16 +3004,15 @@ printf %s "checking whether $PERL Fcntl::flock is implemented... " >&6; }
+ if test ${ac_cv_perl_flock_implemented+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) echo lock me > conftest.fil
++else $as_nop
++  echo lock me > conftest.fil
+    if $PERL -e 'use Fcntl ":flock"; flock("conftest.fil", LOCK_EX); 1;'; then
+      ac_cv_perl_flock_implemented=yes
+    else
+      ac_cv_perl_flock_implemented=no
+    fi
+    rm -f conftest.fil
+-   ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_perl_flock_implemented" >&5
+ printf "%s\n" "$ac_cv_perl_flock_implemented" >&6; }
+@@ -3045,8 +3035,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_prog_TEST_EMACS+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test -n "$TEST_EMACS"; then
++else $as_nop
++  if test -n "$TEST_EMACS"; then
+   ac_cv_prog_TEST_EMACS="$TEST_EMACS" # Let the user override the test.
+ else
+ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+@@ -3068,8 +3058,7 @@ done
+   done
+ IFS=$as_save_IFS
+ 
+-fi ;;
+-esac
++fi
+ fi
+ TEST_EMACS=$ac_cv_prog_TEST_EMACS
+ if test -n "$TEST_EMACS"; then
+@@ -3097,8 +3086,8 @@ printf %s "checking whether $TEST_EMACS is sufficiently recent... " >&6; }
+ if test ${ac_cv_prog_emacs_ok+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) # Note: The quoted "EOF" is intentional.  It protects the ` in the text.
++else $as_nop
++  # Note: The quoted "EOF" is intentional.  It protects the ` in the text.
+     cat >conftest.el << "EOF"
+       (defvar broken)
+       (defun broken-mode () (setq broken-defaults `(broken nil)))
+@@ -3110,12 +3099,10 @@ EOF
+   test $ac_status = 0; }
+ then :
+   ac_cv_prog_emacs_ok=yes
+-else case e in #(
+-  e) ac_cv_prog_emacs_ok=no ;;
+-esac
++else $as_nop
++  ac_cv_prog_emacs_ok=no
+ fi
+-    rm -f conftest.el conftest.elc ;;
+-esac
++    rm -f conftest.el conftest.elc
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_prog_emacs_ok" >&5
+ printf "%s\n" "$ac_cv_prog_emacs_ok" >&6; }
+@@ -3140,8 +3127,8 @@ printf %s "checking for $ac_word... " >&6; }
+ if test ${ac_cv_prog_EMACS+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test -n "$EMACS"; then
++else $as_nop
++  if test -n "$EMACS"; then
+   ac_cv_prog_EMACS="$EMACS" # Let the user override the test.
+ else
+ as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+@@ -3163,8 +3150,7 @@ done
+   done
+ IFS=$as_save_IFS
+ 
+-fi ;;
+-esac
++fi
+ fi
+ EMACS=$ac_cv_prog_EMACS
+ if test -n "$EMACS"; then
+@@ -3191,15 +3177,15 @@ then :
+ printf %s "checking where .elc files should go... " >&6; }
+    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $lispdir" >&5
+ printf "%s\n" "$lispdir" >&6; }
+-else case e in #(
+-  e)
++else $as_nop
++
+  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking where .elc files should go" >&5
+ printf %s "checking where .elc files should go... " >&6; }
+ if test ${am_cv_lispdir+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e)
++else $as_nop
++
+    if test $EMACS != "no"; then
+      if test x${lispdir+set} != xset; then
+   # If $EMACS isn't GNU Emacs or XEmacs, this can blow up pretty badly
+@@ -3221,14 +3207,12 @@ else case e in #(
+      fi
+    fi
+    test -z "$am_cv_lispdir" && am_cv_lispdir='${datadir}/emacs/site-lisp'
+-   ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $am_cv_lispdir" >&5
+ printf "%s\n" "$am_cv_lispdir" >&6; }
+   lispdir="$am_cv_lispdir"
+- ;;
+-esac
++
+ fi
+ 
+ 
+@@ -3243,8 +3227,8 @@ printf %s "checking for grep that handles long lines and -e... " >&6; }
+ if test ${ac_cv_path_GREP+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if test -z "$GREP"; then
++else $as_nop
++  if test -z "$GREP"; then
+   ac_path_GREP_found=false
+   # Loop through the user's path and test for each of PROGNAME-LIST
+   as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+@@ -3263,10 +3247,9 @@ do
+       as_fn_executable_p "$ac_path_GREP" || continue
+ # Check for GNU ac_path_GREP and select it if it is found.
+   # Check for GNU $ac_path_GREP
+-case `"$ac_path_GREP" --version 2>&1` in #(
++case `"$ac_path_GREP" --version 2>&1` in
+ *GNU*)
+   ac_cv_path_GREP="$ac_path_GREP" ac_path_GREP_found=:;;
+-#(
+ *)
+   ac_count=0
+   printf %s 0123456789 >"conftest.in"
+@@ -3301,8 +3284,7 @@ IFS=$as_save_IFS
+ else
+   ac_cv_path_GREP=$GREP
+ fi
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_GREP" >&5
+ printf "%s\n" "$ac_cv_path_GREP" >&6; }
+@@ -3314,8 +3296,8 @@ printf %s "checking for egrep... " >&6; }
+ if test ${ac_cv_path_EGREP+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
++else $as_nop
++  if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
+    then ac_cv_path_EGREP="$GREP -E"
+    else
+      if test -z "$EGREP"; then
+@@ -3337,10 +3319,9 @@ do
+       as_fn_executable_p "$ac_path_EGREP" || continue
+ # Check for GNU ac_path_EGREP and select it if it is found.
+   # Check for GNU $ac_path_EGREP
+-case `"$ac_path_EGREP" --version 2>&1` in #(
++case `"$ac_path_EGREP" --version 2>&1` in
+ *GNU*)
+   ac_cv_path_EGREP="$ac_path_EGREP" ac_path_EGREP_found=:;;
+-#(
+ *)
+   ac_count=0
+   printf %s 0123456789 >"conftest.in"
+@@ -3376,23 +3357,20 @@ else
+   ac_cv_path_EGREP=$EGREP
+ fi
+ 
+-   fi ;;
+-esac
++   fi
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_EGREP" >&5
+ printf "%s\n" "$ac_cv_path_EGREP" >&6; }
+  EGREP="$ac_cv_path_EGREP"
+ 
+-         EGREP_TRADITIONAL=$EGREP
+- ac_cv_path_EGREP_TRADITIONAL=$EGREP
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for a sed that does not truncate output" >&5
+ printf %s "checking for a sed that does not truncate output... " >&6; }
+ if test ${ac_cv_path_SED+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e)           ac_script=s/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/
++else $as_nop
++            ac_script=s/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/
+      for ac_i in 1 2 3 4 5 6 7; do
+        ac_script="$ac_script$as_nl$ac_script"
+      done
+@@ -3417,10 +3395,9 @@ do
+       as_fn_executable_p "$ac_path_SED" || continue
+ # Check for GNU ac_path_SED and select it if it is found.
+   # Check for GNU $ac_path_SED
+-case `"$ac_path_SED" --version 2>&1` in #(
++case `"$ac_path_SED" --version 2>&1` in
+ *GNU*)
+   ac_cv_path_SED="$ac_path_SED" ac_path_SED_found=:;;
+-#(
+ *)
+   ac_count=0
+   printf %s 0123456789 >"conftest.in"
+@@ -3455,8 +3432,7 @@ IFS=$as_save_IFS
+ else
+   ac_cv_path_SED=$SED
+ fi
+- ;;
+-esac
++
+ fi
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_SED" >&5
+ printf "%s\n" "$ac_cv_path_SED" >&6; }
+@@ -3476,16 +3452,15 @@ printf %s "checking whether ${MAKE-make} is case sensitive... " >&6; }
+ if eval test \${ac_cv_prog_make_${ac_make}_case+y}
+ then :
+   printf %s "(cached) " >&6
+-else case e in #(
+-  e) echo all: >conftest.make
++else $as_nop
++  echo all: >conftest.make
+ if ${MAKE-make} -f conftest.make ALL >/dev/null 2>&1; then
+   ac_res=no
+ else
+   ac_res=yes
+ fi
+ eval ac_cv_prog_make_${ac_make}_case=$ac_res
+-rm -f conftest.make ;;
+-esac
++rm -f conftest.make
+ fi
+ eval ac_res=\$ac_cv_prog_make_${ac_make}_case
+ 	       { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
+@@ -3523,8 +3498,8 @@ cat >confcache <<\_ACEOF
+ # config.status only pays attention to the cache file if you give it
+ # the --recheck option to rerun configure.
+ #
+-# 'ac_cv_env_foo' variables (set or unset) will be overridden when
+-# loading this file, other *unset* 'ac_cv_foo' will be assigned the
++# `ac_cv_env_foo' variables (set or unset) will be overridden when
++# loading this file, other *unset* `ac_cv_foo' will be assigned the
+ # following values.
+ 
+ _ACEOF
+@@ -3554,14 +3529,14 @@ printf "%s\n" "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;}
+   (set) 2>&1 |
+     case $as_nl`(ac_space=' '; set) 2>&1` in #(
+     *${as_nl}ac_space=\ *)
+-      # 'set' does not quote correctly, so add quotes: double-quote
++      # `set' does not quote correctly, so add quotes: double-quote
+       # substitution turns \\\\ into \\, and sed turns \\ into \.
+       sed -n \
+ 	"s/'/'\\\\''/g;
+ 	  s/^\\([_$as_cr_alnum]*_cv_[_$as_cr_alnum]*\\)=\\(.*\\)/\\1='\\2'/p"
+       ;; #(
+     *)
+-      # 'set' quotes correctly as required by POSIX, so do not add quotes.
++      # `set' quotes correctly as required by POSIX, so do not add quotes.
+       sed -n "/^[_$as_cr_alnum]*_cv_[_$as_cr_alnum]*=/p"
+       ;;
+     esac |
+@@ -3625,7 +3600,9 @@ s/^[	 ]*#[	 ]*define[	 ][	 ]*\([^	 ][^	 ]*\)[	 ]*\(.*\)/-D\1=\2/g
+ t quote
+ b any
+ :quote
+-s/[][	 `~#$^&*(){}\\|;'\''"<>?]/\\&/g
++s/[	 `~#$^&*(){}\\|;'\''"<>?]/\\&/g
++s/\[/\\&/g
++s/\]/\\&/g
+ s/\$/$$/g
+ H
+ :any
+@@ -3698,6 +3675,7 @@ cat >>$CONFIG_STATUS <<\_ASEOF || as_write_fail=1
+ 
+ # Be more Bourne compatible
+ DUALCASE=1; export DUALCASE # for MKS sh
++as_nop=:
+ if test ${ZSH_VERSION+y} && (emulate sh) >/dev/null 2>&1
+ then :
+   emulate sh
+@@ -3706,13 +3684,12 @@ then :
+   # is contrary to our usage.  Disable this feature.
+   alias -g '${1+"$@"}'='"$@"'
+   setopt NO_GLOB_SUBST
+-else case e in #(
+-  e) case `(set -o) 2>/dev/null` in #(
++else $as_nop
++  case `(set -o) 2>/dev/null` in #(
+   *posix*) :
+     set -o posix ;; #(
+   *) :
+      ;;
+-esac ;;
+ esac
+ fi
+ 
+@@ -3784,7 +3761,7 @@ IFS=$as_save_IFS
+ 
+      ;;
+ esac
+-# We did not find ourselves, most probably we were run as 'sh COMMAND'
++# We did not find ourselves, most probably we were run as `sh COMMAND'
+ # in which case we are not to be found in the path.
+ if test "x$as_myself" = x; then
+   as_myself=$0
+@@ -3813,6 +3790,7 @@ as_fn_error ()
+ } # as_fn_error
+ 
+ 
++
+ # as_fn_set_status STATUS
+ # -----------------------
+ # Set $? to STATUS, without forking.
+@@ -3852,12 +3830,11 @@ then :
+   {
+     eval $1+=\$2
+   }'
+-else case e in #(
+-  e) as_fn_append ()
++else $as_nop
++  as_fn_append ()
+   {
+     eval $1=\$$1\$2
+-  } ;;
+-esac
++  }
+ fi # as_fn_append
+ 
+ # as_fn_arith ARG...
+@@ -3871,12 +3848,11 @@ then :
+   {
+     as_val=$(( $* ))
+   }'
+-else case e in #(
+-  e) as_fn_arith ()
++else $as_nop
++  as_fn_arith ()
+   {
+     as_val=`expr "$@" || test $? -eq 1`
+-  } ;;
+-esac
++  }
+ fi # as_fn_arith
+ 
+ 
+@@ -3959,9 +3935,9 @@ if (echo >conf$$.file) 2>/dev/null; then
+   if ln -s conf$$.file conf$$ 2>/dev/null; then
+     as_ln_s='ln -s'
+     # ... but there are two gotchas:
+-    # 1) On MSYS, both 'ln -s file dir' and 'ln file dir' fail.
+-    # 2) DJGPP < 2.04 has no symlinks; 'ln -s' creates a wrapper executable.
+-    # In both cases, we have to default to 'cp -pR'.
++    # 1) On MSYS, both `ln -s file dir' and `ln file dir' fail.
++    # 2) DJGPP < 2.04 has no symlinks; `ln -s' creates a wrapper executable.
++    # In both cases, we have to default to `cp -pR'.
+     ln -s conf$$.file conf$$.dir 2>/dev/null && test ! -f conf$$.exe ||
+       as_ln_s='cp -pR'
+   elif ln conf$$.file conf$$ 2>/dev/null; then
+@@ -4042,12 +4018,10 @@ as_test_x='test -x'
+ as_executable_p=as_fn_executable_p
+ 
+ # Sed expression to map a string onto a valid CPP name.
+-as_sed_cpp="y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g"
+-as_tr_cpp="eval sed '$as_sed_cpp'" # deprecated
++as_tr_cpp="eval sed 'y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g'"
+ 
+ # Sed expression to map a string onto a valid variable name.
+-as_sed_sh="y%*+%pp%;s%[^_$as_cr_alnum]%_%g"
+-as_tr_sh="eval sed '$as_sed_sh'" # deprecated
++as_tr_sh="eval sed 'y%*+%pp%;s%[^_$as_cr_alnum]%_%g'"
+ 
+ 
+ exec 6>&1
+@@ -4063,7 +4037,7 @@ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+ # values after options handling.
+ ac_log="
+ This file was extended by GNU Autoconf $as_me 2.72, which was
+-generated by GNU Autoconf 2.72.  Invocation command line was
++generated by GNU Autoconf 2.71.  Invocation command line was
+ 
+   CONFIG_FILES    = $CONFIG_FILES
+   CONFIG_HEADERS  = $CONFIG_HEADERS
+@@ -4092,7 +4066,7 @@ _ACEOF
+ 
+ cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+ ac_cs_usage="\
+-'$as_me' instantiates files and other configuration actions
++\`$as_me' instantiates files and other configuration actions
+ from templates according to the current configuration.  Unless the files
+ and actions are specified as TAGs, all are instantiated by default.
+ 
+@@ -4128,10 +4102,10 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+ ac_cs_config='$ac_cs_config_escaped'
+ ac_cs_version="\\
+ GNU Autoconf config.status 2.72
+-configured by $0, generated by GNU Autoconf 2.72,
++configured by $0, generated by GNU Autoconf 2.71,
+   with options \\"\$ac_cs_config\\"
+ 
+-Copyright (C) 2023 Free Software Foundation, Inc.
++Copyright (C) 2021 Free Software Foundation, Inc.
+ This config.status script is free software; the Free Software Foundation
+ gives unlimited permission to copy, distribute and modify it."
+ 
+@@ -4191,8 +4165,8 @@ do
+     ac_cs_silent=: ;;
+ 
+   # This is an error.
+-  -*) as_fn_error $? "unrecognized option: '$1'
+-Try '$0 --help' for more information." ;;
++  -*) as_fn_error $? "unrecognized option: \`$1'
++Try \`$0 --help' for more information." ;;
+ 
+   *) as_fn_append ac_config_targets " $1"
+      ac_need_defaults=false ;;
+@@ -4251,7 +4225,7 @@ do
+     "Makefile") CONFIG_FILES="$CONFIG_FILES Makefile" ;;
+     "lib/version.m4") CONFIG_FILES="$CONFIG_FILES lib/version.m4:lib/version.in" ;;
+ 
+-  *) as_fn_error $? "invalid argument: '$ac_config_target'" "$LINENO" 5;;
++  *) as_fn_error $? "invalid argument: \`$ac_config_target'" "$LINENO" 5;;
+   esac
+ done
+ 
+@@ -4271,7 +4245,7 @@ fi
+ # creating and moving files from /tmp can sometimes cause problems.
+ # Hook for its removal unless debugging.
+ # Note that there is a small window in which the directory will not be cleaned:
+-# after its creation but before its name has been assigned to '$tmp'.
++# after its creation but before its name has been assigned to `$tmp'.
+ $debug ||
+ {
+   tmp= ac_tmp=
+@@ -4295,7 +4269,7 @@ ac_tmp=$tmp
+ 
+ # Set up the scripts for CONFIG_FILES section.
+ # No need to generate them if there are no CONFIG_FILES.
+-# This happens for instance with './config.status config.h'.
++# This happens for instance with `./config.status config.h'.
+ if test -n "$CONFIG_FILES"; then
+ 
+ 
+@@ -4461,7 +4435,7 @@ do
+   esac
+   case $ac_mode$ac_tag in
+   :[FHL]*:*);;
+-  :L* | :C*:*) as_fn_error $? "invalid tag '$ac_tag'" "$LINENO" 5;;
++  :L* | :C*:*) as_fn_error $? "invalid tag \`$ac_tag'" "$LINENO" 5;;
+   :[FH]-) ac_tag=-:-;;
+   :[FH]*) ac_tag=$ac_tag:$ac_tag.in;;
+   esac
+@@ -4483,19 +4457,19 @@ do
+       -) ac_f="$ac_tmp/stdin";;
+       *) # Look for the file first in the build tree, then in the source tree
+ 	 # (if the path is not absolute).  The absolute path cannot be DOS-style,
+-	 # because $ac_f cannot contain ':'.
++	 # because $ac_f cannot contain `:'.
+ 	 test -f "$ac_f" ||
+ 	   case $ac_f in
+ 	   [\\/$]*) false;;
+ 	   *) test -f "$srcdir/$ac_f" && ac_f="$srcdir/$ac_f";;
+ 	   esac ||
+-	   as_fn_error 1 "cannot find input file: '$ac_f'" "$LINENO" 5;;
++	   as_fn_error 1 "cannot find input file: \`$ac_f'" "$LINENO" 5;;
+       esac
+       case $ac_f in *\'*) ac_f=`printf "%s\n" "$ac_f" | sed "s/'/'\\\\\\\\''/g"`;; esac
+       as_fn_append ac_file_inputs " '$ac_f'"
+     done
+ 
+-    # Let's still pretend it is 'configure' which instantiates (i.e., don't
++    # Let's still pretend it is `configure' which instantiates (i.e., don't
+     # use $as_me), people would be surprised to read:
+     #    /* config.h.  Generated by config.status.  */
+     configure_input='Generated from '`
+@@ -4628,7 +4602,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+ esac
+ _ACEOF
+ 
+-# Neutralize VPATH when '$srcdir' = '.'.
++# Neutralize VPATH when `$srcdir' = `.'.
+ # Shell code in configure.ac might set extrasub.
+ # FIXME: do we really want to maintain this feature?
+ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+@@ -4659,9 +4633,9 @@ test -z "$ac_datarootdir_hack$ac_datarootdir_seen" &&
+   { ac_out=`sed -n '/\${datarootdir}/p' "$ac_tmp/out"`; test -n "$ac_out"; } &&
+   { ac_out=`sed -n '/^[	 ]*datarootdir[	 ]*:*=/p' \
+       "$ac_tmp/out"`; test -z "$ac_out"; } &&
+-  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: $ac_file contains a reference to the variable 'datarootdir'
++  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: $ac_file contains a reference to the variable \`datarootdir'
+ which seems to be undefined.  Please make sure it is defined" >&5
+-printf "%s\n" "$as_me: WARNING: $ac_file contains a reference to the variable 'datarootdir'
++printf "%s\n" "$as_me: WARNING: $ac_file contains a reference to the variable \`datarootdir'
+ which seems to be undefined.  Please make sure it is defined" >&2;}
+ 
+   rm -f "$ac_tmp/stdin"
+@@ -4714,7 +4688,7 @@ printf "%s\n" "$as_me: executing $ac_file commands" >&6;}
+     "tests/atconfig":C) cat >tests/atconfig <<ATEOF
+ # Configurable variable values for building test suites.
+ # Generated by $0.
+-# Copyright (C) 2023 Free Software Foundation, Inc.
++# Copyright (C) 2021 Free Software Foundation, Inc.
+ 
+ # The test suite will define top_srcdir=$at_top_srcdir/../.. etc.
+ at_testdir='tests'
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
