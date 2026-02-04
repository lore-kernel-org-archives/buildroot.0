Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F503EA7944
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76E440567;
	Wed,  4 Feb 2026 19:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oevpWx9vosNd; Wed,  4 Feb 2026 19:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3DE2403F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770234996;
	bh=423yFtlJmrJyi7XFHf7iih7RJUEvl+tuq4vK2lJVGAw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qy1aYdJQo05UrxqzkjWqLc0f9hr4juXI2AvgwS8Egb3bAWdxHdZpXv3Ci0nMFv48+
	 Yz1vEAvQU8+HINwIB8NEOjGaw0TqNfCp8/UWMi9Em4lQ8cwUnCjDaK583TMdaNZL2o
	 SfvhK/UjDawOzWUIo0Mi3/r0okrf1iAUrbtQpl/02Lx969m+3IWl6Qj3MJ7KiaIXIw
	 3JWlBlsh+n18wLYtkvX1bOmhZYWYK+AbyfM9BWHguuLG7wkGbvZeZ4z0SCcwUA2DIN
	 NzntJ+G49iQz6Fb+st90J2jSd21n6fJaTNlQJS7XO+9y1JyeWcRBiNPQC1IpitNm+e
	 o7V1KPHbAUIgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3DE2403F5;
	Wed,  4 Feb 2026 19:56:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B300417A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A114340279
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajHBKlSTr94l for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30B9D40275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B9D40275
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30B9D40275
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:56:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBEE1A4C52DF;
 Wed,  4 Feb 2026 20:56:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43190)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnizG-000000006gt-0crp;
 Wed, 04 Feb 2026 19:56:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>
Date: Wed,  4 Feb 2026 20:56:29 +0100
Message-ID: <20260204195629.3725422-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770234991;
 bh=1nlVNYLnvdzBe2lb+IFPYqe6f/hhZAKCautXn8WgvCc=;
 h=From:To:Cc:Subject:Date:From;
 b=ndr7ajiezU22WQhOyU7e/gY7Ongd7K0y4OyRmVm9rLIna0VmpbV06Dtou2LsOmTeO
 59DTpOFy5cFI27+++AY0Hx3zep4LujSNKPgemvAQjNaqMLNL8iUe7lJ1JYa3IFVLig
 60H/8l0/Bs2yjy1E6hX+A6wS2GNzgdqeOE8+xsnGXJepttHZTFc7f90d+L3dM3Yp1k
 w/KVS3vmWaPsgmCbD2IaGILxWzTh7oiAo/zrBAel4lmiQxswwvKubg4KHUYmJGElhy
 JcQoS9AuLuwqCue/Ve4NmHL2opfwT8HSH0n8z58+13ODvkQrphkxEDqwkJBD2F/iJl
 8WvWXntgNcvGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ndr7ajie
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: bump version to 1.0
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

Release notes:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=blob;f=NEWS;h=565fc8ec95e591a810be2cef179acd130ba8f9c4;hb=53bcae93fbd26e0e816f0e8e6dd3524ebdc67618

Updated license hash due to upstream commit
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=f58d3e697ecd8e5d73e9fbc558627870308856aa

Disabled unneeded selinux support for host builds to avoid build errors
on selinux-enabled hosts.

Updated sed filter to include "install-tests" which was added with
upstream commit:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=04f810d72742259c1c198d2505fe03fa330e9d7d

Since upstream version 0.25 installed m4 files were moved from
/usr/share/aclocal/ to /usr/share/gettext/m4/:
https://lists.gnu.org/archive/html/bug-gettext/2025-05/msg00041.html
https://bugzilla.redhat.com/show_bug.cgi?id=2366708#c10
Added corresponding _AUTORECONF_OPTS to dovecot & e2fsprogs.

Added more patches to fix e2fsprogs because of changes which break the
usage of autopoint:
https://github.com/tytso/e2fsprogs/issues/34#issuecomment-770090064

Updated GETTEXT_TINY_EXTRA_GETTEXT_FILES due to various rename commits:

- gettext-tools/misc/gettextize.in:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=21a3caa8011d5bbe595f00451ba3b0264f3cea4b

- gettext-tools/po/Makevars.template:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=8c716a85ec676bbc3eaba21f973d83e846a62f0c

- gettext-runtime/po/insert-header.sin &
  gettext-runtime/po/remove-potcdate.sin :
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=fe3b543701e51c9cfd66b96c0e9100b1a9f36e1a
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=9a4589466bb18cb018ea6588e6836f034ee37a44

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot/dovecot.mk                    |   1 +
 ...akefile.in.in-to-gettext-version-1.0.patch | 602 ++++++++++++++++++
 ...-e2fsprogs-chages-to-po-Makefile.in..patch |  96 +++
 package/e2fsprogs/e2fsprogs.mk                |   3 +-
 package/gettext-gnu/gettext-gnu.hash          |   4 +-
 package/gettext-gnu/gettext-gnu.mk            |   7 +-
 package/gettext-tiny/gettext-tiny.hash        |   2 +-
 package/gettext-tiny/gettext-tiny.mk          |  14 +-
 8 files changed, 715 insertions(+), 14 deletions(-)
 create mode 100644 package/e2fsprogs/0002-Update-po-Makefile.in.in-to-gettext-version-1.0.patch
 create mode 100644 package/e2fsprogs/0003-po-reapply-local-e2fsprogs-chages-to-po-Makefile.in..patch

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a4c799221c..c6ec7cd8c5 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -13,6 +13,7 @@ DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_CPE_ID_VENDOR = dovecot
 DOVECOT_SELINUX_MODULES = dovecot
 DOVECOT_AUTORECONF = YES
+DOVECOT_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/gettext/m4
 
 # add host-gettext for AM_ICONV macro needed for autoreconf
 DOVECOT_DEPENDENCIES = \
diff --git a/package/e2fsprogs/0002-Update-po-Makefile.in.in-to-gettext-version-1.0.patch b/package/e2fsprogs/0002-Update-po-Makefile.in.in-to-gettext-version-1.0.patch
new file mode 100644
index 0000000000..adf0bd88a8
--- /dev/null
+++ b/package/e2fsprogs/0002-Update-po-Makefile.in.in-to-gettext-version-1.0.patch
@@ -0,0 +1,602 @@
+From d6ed2841cfaf5f232ec2984129607f85157d5be0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 1 Feb 2026 19:08:54 +0100
+Subject: [PATCH] Update po/Makefile.in.in to gettext version 1.0
+
+Upstream: https://github.com/tytso/e2fsprogs/pull/267
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ po/Makefile.in.in | 411 +++++++++++++++++++++++++++-------------------
+ 1 file changed, 242 insertions(+), 169 deletions(-)
+
+diff --git a/po/Makefile.in.in b/po/Makefile.in.in
+index 5e19eeb8..cd15eda9 100644
+--- a/po/Makefile.in.in
++++ b/po/Makefile.in.in
+@@ -1,13 +1,28 @@
+ # Makefile for PO directory in any package using GNU gettext.
+-# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
++# Copyright (C) 1995-2000 Ulrich Drepper <drepper@gnu.ai.mit.edu>
++# Copyright (C) 2000-2026 Free Software Foundation, Inc.
+ #
+ # Copying and distribution of this file, with or without modification,
+ # are permitted in any medium without royalty provided the copyright
+ # notice and this notice are preserved.  This file is offered as-is,
+ # without any warranty.
+ #
+-# Origin: gettext-0.19.8
+-GETTEXT_MACRO_VERSION = 0.19
++# Written by Ulrich Drepper, Bruno Haible, and Daiki Ueno.
++#
++# Origin: gettext-1.0
++GETTEXT_MACRO_VERSION = 0.24
++
++# This Makefile makes use of the variable assignment operator != standardized
++# by POSIX:2024
++# <https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html>.
++# It thus requires a 'make' implementation that supports this operator !=.
++# As of 2024, these are: GNU make >= 4.0, FreeBSD make, NetBSD make,
++# OpenBSD make. This means that building on specific platforms requires
++# use of GNU make:
++#   - On macOS, use /opt/homebrew/bin/gmake.
++#   - On Solaris 11 OpenIndiana, use /usr/bin/gmake = /usr/gnu/bin/make.
++#   - On Solaris 11.4, install GNU make yourself.
++#   - On AIX, use /opt/freeware/bin/make.
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+@@ -52,72 +67,183 @@ GMSGFMT_ = @GMSGFMT@
+ GMSGFMT_no = @GMSGFMT@
+ GMSGFMT_yes = @GMSGFMT_015@
+ GMSGFMT = $(GMSGFMT_$(USE_MSGCTXT))
+-MSGFMT_ = @MSGFMT@
+-MSGFMT_no = @MSGFMT@
+-MSGFMT_yes = @MSGFMT_015@
+-MSGFMT_OPTS = --check-header --check-domain
+-MSGFMT = $(MSGFMT_$(USE_MSGCTXT))
+ XGETTEXT_ = @XGETTEXT@
+ XGETTEXT_no = @XGETTEXT@
+ XGETTEXT_yes = @XGETTEXT_015@
+ XGETTEXT = $(XGETTEXT_$(USE_MSGCTXT))
+-MSGMERGE = msgmerge
+-MSGMERGE_UPDATE = @MSGMERGE@ --update
++MSGMERGE = @MSGMERGE@
++MSGMERGE_FOR_MSGFMT_OPTION = @MSGMERGE_FOR_MSGFMT_OPTION@
+ MSGINIT = msginit
+ MSGCONV = msgconv
+ MSGFILTER = msgfilter
+ 
+-POFILES = @POFILES@
+-GMOFILES = @GMOFILES@
+-UPDATEPOFILES = @UPDATEPOFILES@
+-DUMMYPOFILES = @DUMMYPOFILES@
+-DISTFILES.common = Makefile.in.in remove-potcdate.sin \
+-$(DISTFILES.common.extra1) $(DISTFILES.common.extra2) $(DISTFILES.common.extra3)
+-DISTFILES = $(DISTFILES.common) Makevars POTFILES.in \
+-$(POFILES) $(GMOFILES) \
+-$(DISTFILES.extra1) $(DISTFILES.extra2) $(DISTFILES.extra3)
+-
+-POTFILES = \
+-
+-CATALOGS = @CATALOGS@
+-
+-POFILESDEPS_ = $(srcdir)/$(DOMAIN).pot
+-POFILESDEPS_yes = $(POFILESDEPS_)
+-POFILESDEPS_no =
+-POFILESDEPS = $(POFILESDEPS_$(PO_DEPENDS_ON_POT))
++# The list of files which contain translatable strings.
++POTFILES != sed -e '/^\#/d' < $(srcdir)/POTFILES.in
++# This is computed as $(foreach file, $(POTFILES), $(top_srcdir)/$(file))
++POTFILES_DEPS != for file in $(POTFILES); do echo $(top_srcdir)/$$file; done
++
++# The set of available translations.
++ALL_LINGUAS != if test -f $(srcdir)/LINGUAS; then \
++                 sed -e '/^\#/d' < $(srcdir)/LINGUAS; \
++               else \
++                 echo $(LINGUAS); \
++               fi
++# This is computed as $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).po)
++POFILES != for lang in $(ALL_LINGUAS); do echo $(srcdir)/$$lang.po; done
++# This is computed as $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).gmo)
++GMOFILES != for lang in $(ALL_LINGUAS); do echo $(srcdir)/$$lang.gmo; done
++# This is computed as $(foreach lang, $(ALL_LINGUAS), $(lang).nop)
++DUMMYPOFILES != for lang in $(ALL_LINGUAS); do echo $$lang.nop; done
++
++DISTFILES.common = \
++  Makefile.in.in remove-potcdate.sed \
++  $(DISTFILES.common.extra1) $(DISTFILES.common.extra2) \
++  $(DISTFILES.common.extra3) $(DISTFILES.common.extra4) \
++  $(DISTFILES.common.extra5) $(DISTFILES.common.extra6)
++DISTFILES = \
++  $(DISTFILES.common) \
++  Makevars POTFILES.in \
++  $(POFILES) $(GMOFILES) \
++  $(DISTFILES.extra1) $(DISTFILES.extra2) \
++  $(DISTFILES.extra3) $(DISTFILES.extra4) \
++  $(DISTFILES.extra5) $(DISTFILES.extra6)
++
++# The set of desired translations, as specified by the installer or distributor.
++DESIRED_LINGUAS = @DESIRED_LINGUAS@
++# The set of translations to install. This is computed based on $(ALL_LINGUAS)
++# and $(DESIRED_LINGUAS). It is a subset of $(ALL_LINGUAS).
++# We use the presentlang catalog if desiredlang is
++#   a. equal to presentlang, or
++#   b. a variant of presentlang (because in this case, presentlang can be used
++#      as a fallback for messages which are not translated in the desiredlang
++#      catalog).
++INST_LINGUAS != for presentlang in $(ALL_LINGUAS); do \
++                  useit=false; \
++                  for desiredlang in $(DESIRED_LINGUAS); do \
++                    case "$$desiredlang" in \
++                      "$$presentlang" | "$$presentlang"_* | "$$presentlang".* | "$$presentlang"@*) \
++                        useit=true ;; \
++                    esac; \
++                  done; \
++                  if $$useit; then echo $$presentlang; fi; \
++                done
++# This is computed as $(foreach lang, $(INST_LINGUAS), $(lang).gmo)
++CATALOGS != for lang in $(INST_LINGUAS); do echo $$lang.gmo; done
+ 
+ DISTFILESDEPS_ = update-po
+ DISTFILESDEPS_yes = $(DISTFILESDEPS_)
+ DISTFILESDEPS_no =
+ DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
+ 
+-# Makevars gets inserted here. (Don't remove this line!)
++# Include the customization of this po/ directory.
++include $(srcdir)/Makevars
+ 
+-.SUFFIXES:
+-.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update
++all: all-@USE_NLS@
+ 
+-.po.mo:
+-	$(E) "$(MSGFMT) $(MSGFMT_OPTS) -o $@ $<"; \
+-	$(Q) $(MSGFMT) $(MSGFMT_OPTS) -o t-$@ $< && mv t-$@ $@
+ 
++.SUFFIXES:
++.SUFFIXES: .po .gmo .gpo .nop .po-create
++
++# Which files appear in release tarballs?
++#
++# The .gmo files appear in release tarballs, because the GNU Coding Standards
++# say in
++# <https://www.gnu.org/prep/standards/html_node/Utilities-in-Makefiles.html>:
++#   "The configure script and the Makefile rules for building and installation
++#    should not use any utilities directly except these:
++#      awk ... true"
++# and 'msgfmt' is not in this list.  In other words, when a user - who does not
++# have the GNU gettext tools installed - does "make && make install", it should
++# install the .gmo files.  The only way to achieve this is to include them in
++# the release tarballs.
++#
++# The .pot file appears in release tarballs, because it is needed when a
++# translator runs "msginit" to start working on a PO file or when a web-based
++# PO editor prepares the initial PO file for a translator.  Translators and
++# translation projects should not have to run 'xgettext' on some source code;
++# that's not their business, and they would not be in a good position to deal
++# with errors.
++#
++# The .po files appear in release tarballs, because
++#   - They are part of the source code of the .gmo files, and it would be a bad
++#     idea to include the (generated) .gmo files without their corresponding
++#     source code. Even if the .po files can be found on some translation
++#     project's site or in some separate git repository, users and distributors
++#     should not have to go that far, to hunt them down.
++#   - The .po file is needed when a translator runs "msginit" to continue
++#     working on a PO file (in packages that do not use a web-based translation
++#     project).
++# These .po files are those that the translators submitted or committed in
++# version control, or a translation project's daemon committed on behalf of the
++# translators.
++# Up until 2025, we included the *merged* .po files in the release tarballs.
++# These merged .po files, that we now name .gpo files in this Makefile,
++# are neither source code nor entirely generated files: They are a mix of
++# source code (from the translators) and generated parts (from the .pot file).
++# This caused two problems:
++#   * Regarding the tarballs: They are "non-source" files in the sense of
++#     <https://www.gnu.org/prep/standards/html_node/Releases.html>.
++#     Distributors who want to make sure that they rebuild everything from
++#     source had a problem here.
++#     Also, small changes in the package caused massive line number changes
++#     in the .po files.
++#   * Regarding version control:
++#     Packages that put the .po files under version control had changes in
++#     all .po files nearly each time "make dist" was invoked. Leading to
++#       - Lots of modified files shown by "git status",
++#       - Frequent merge conflicts when merging between branches,
++#       - A voluminous version control history.
++#     Whereas packages that do not put the .po files under version control
++#     had to fetch them from somewhere (usually a translation project),
++#     meaning that an 'autopull.sh' step was needed before the 'autogen.sh'
++#     step of the package's build system.
++# Instead, now, we include the original .po files in the release tarballs.
++#
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
++# This target fetches the PO files, produced by translators, from a
++# translations project's site on the internet, and generates the associated
++# LINGUAS file (for packages that use such a translations project and where
++# this translation project does not already commit the PO files and the LINGUAS
++# file into the version control repository of the package automatically).
++.PHONY: fetch-po
++fetch-po:
++	cd $(srcdir) && @SHELL@ ./fetch-po
++
++# This target creates a merged PO file (mostly for debugging purposes).
++.po.gpo:
++	@lang=`echo $* | sed -e 's,.*/,,'`; \
++	echo "rm -f $${lang}.gpo && $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) $(MSGMERGE_OPTIONS) -o $${lang}.gpo $(srcdir)/$${lang}.po $(srcdir)/$(DOMAIN).pot"; \
++	rm -f $${lang}.gpo && \
++	$(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) $(MSGMERGE_OPTIONS) -o $${lang}.gpo $(srcdir)/$${lang}.po $(srcdir)/$(DOMAIN).pot
++
++# During .po -> .gmo conversion, take into account the most recent changes to
++# the .pot file. This eliminates the need to update the .po files when the
++# .pot file has changed (see above).
++$(GMOFILES): $(srcdir)/$(DOMAIN).pot
+ .po.gmo:
+ 	@lang=`echo $* | sed -e 's,.*/,,'`; \
++	if test "$(PACKAGE)" = "gettext-tools" && test "$(CROSS_COMPILING)" != "yes"; then PATH=`pwd`/../src:$$PATH; fi; \
+ 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+-	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) $(MSGFMT_OPTS) --statistics --verbose -o $${lang}.gmo $${lang}.po"; \
+-	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) $(MSGFMT_OPTS) --statistics --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
+-
+-.sin.sed:
+-	sed -e '/^#/d' $< > t-$@
+-	mv t-$@ $@
++	echo "$${cdcmd}rm -f $${lang}.gmo && $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.gpo $${lang}.po $(DOMAIN).pot && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.gpo && rm -f $${lang}.gpo"; \
++	cd $(srcdir) && \
++	rm -f $${lang}.gmo && \
++	$(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.gpo $${lang}.po $(DOMAIN).pot && \
++	$(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.gpo && \
++	mv t-$${lang}.gmo $${lang}.gmo && \
++	rm -f $${lang}.gpo
+ 
+ 
+-all: all-@USE_NLS@
+-
+-all-yes: @MAINTAINER_CMT@stamp-po
++all-yes: $(srcdir)/stamp-po
+ all-no:
+-all-static:
+-depend:
+-coverage.txt:
+ 
+ # Ensure that the gettext macros and this Makefile.in.in are in sync.
+ CHECK_MACRO_VERSION = \
+@@ -130,45 +256,42 @@ CHECK_MACRO_VERSION = \
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
++# touch them; however, the rule for $(DOMAIN).pot-update has been designed to
++# not touch $(srcdir)/$(DOMAIN).pot if it doesn't need to be changed.
++#
++# Note: The name 'stamp-po' is a bit misleading. It does *not* designate a
++# timestamp for the *.po files. Rather it is a timestamp for all generated
++# files in this directory.
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
+-# Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
+-# otherwise packages like GCC can not be built if only parts of the source
+-# have been downloaded.
+-
+ # This target rebuilds $(DOMAIN).pot; it is an expensive operation.
+ # Note that $(DOMAIN).pot is not touched if it doesn't need to be changed.
+ # The determination of whether the package xyz is a GNU one is based on the
+ # heuristic whether some file in the top level directory mentions "GNU xyz".
+ # If GNU 'find' is available, we avoid grepping through monster files.
+-$(DOMAIN).pot-update: $(srcdir)/POTFILES.in remove-potcdate.sed \
+-	$(srcdir)/at-expand.pl
++$(DOMAIN).pot-update: $(POTFILES_DEPS) $(srcdir)/POTFILES.in
+ 	package_gnu="$(PACKAGE_GNU)"; \
+ 	test -n "$$package_gnu" || { \
+ 	  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
+-		 LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f \
+-			       -size -10000000c -exec grep 'GNU @PACKAGE@' \
+-			       /dev/null '{}' ';' 2>/dev/null; \
++	         LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep -i 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
+ 	       else \
+-		 LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
++	         LC_ALL=C grep -i 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+ 	       fi; \
+ 	     } | grep -v 'libtool:' >/dev/null; then \
+ 	     package_gnu=yes; \
+@@ -189,35 +312,33 @@ $(DOMAIN).pot-update: $(srcdir)/POTFILES.in remove-potcdate.sed \
+ 	case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+ 	  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
+ 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+-	      --directory=$(top_builddir) \
+-	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
++	      --add-comments=TRANSLATORS: \
+ 	      --files-from=$(srcdir)/POTFILES.in \
+ 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+ 	      --msgid-bugs-address="$$msgid_bugs_address" \
++	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+ 	    ;; \
+ 	  *) \
+ 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
+-	      --directory=$(top_builddir) \
+-	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
++	      --add-comments=TRANSLATORS: \
+ 	      --files-from=$(srcdir)/POTFILES.in \
+ 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+ 	      --package-name="$${package_prefix}@PACKAGE@" \
+ 	      --package-version='@VERSION@' \
+ 	      --msgid-bugs-address="$$msgid_bugs_address" \
++	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+ 	    ;; \
+ 	esac
+-	perl $(srcdir)/at-expand.pl < $(DOMAIN).po > $(DOMAIN).po.new
+-	mv $(DOMAIN).po $(DOMAIN).po.bak
+-	mv $(DOMAIN).po.new $(DOMAIN).po
+ 	test ! -f $(DOMAIN).po || { \
+ 	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
+ 	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
+-	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po; \
+-	    rm -f $(DOMAIN).1po; \
++	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po && \
++	    rm -f $(DOMAIN).1po \
++	    || exit 1; \
+ 	  fi; \
+ 	  if test -f $(srcdir)/$(DOMAIN).pot; then \
+-	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
+-	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
++	    sed -f $(srcdir)/remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
++	    sed -f $(srcdir)/remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
+ 	    if cmp $(DOMAIN).1po $(DOMAIN).2po >/dev/null 2>&1; then \
+ 	      rm -f $(DOMAIN).1po $(DOMAIN).2po $(DOMAIN).po; \
+ 	    else \
+@@ -235,22 +356,11 @@ $(DOMAIN).pot-update: $(srcdir)/POTFILES.in remove-potcdate.sed \
+ $(srcdir)/$(DOMAIN).pot:
+ 	$(MAKE) $(DOMAIN).pot-update
+ 
+-# This target rebuilds a PO file if $(DOMAIN).pot has changed.
+-# Note that a PO file is not touched if it doesn't need to be changed.
+-$(POFILES): $(POFILESDEPS)
++# This target attempts to build a PO file.
++$(POFILES):
+ 	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
+ 	if test -f "$(srcdir)/$${lang}.po"; then \
+-	  test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot; \
+-	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+-	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
+-	  cd $(srcdir) \
+-	    && { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+-	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+-	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \
+-	           *) \
+-	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot;; \
+-	         esac; \
+-	       }; \
++	  : ; \
+ 	else \
+ 	  $(MAKE) $${lang}.po-create; \
+ 	fi
+@@ -259,18 +369,6 @@ $(POFILES): $(POFILESDEPS)
+ install: install-exec install-data
+ install-exec:
+ install-data: install-data-@USE_NLS@
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+-	  for file in $(DISTFILES.common) Makevars.template; do \
+-	    $(INSTALL_DATA) $(srcdir)/$$file \
+-			    $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	  for file in Makevars; do \
+-	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	else \
+-	  : ; \
+-	fi
+ install-data-no: all
+ install-data-yes: all
+ 	@catalogs='$(CATALOGS)'; \
+@@ -317,11 +415,6 @@ install-strip: install
+ installdirs: installdirs-exec installdirs-data
+ installdirs-exec:
+ installdirs-data: installdirs-data-@USE_NLS@
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
+-	else \
+-	  : ; \
+-	fi
+ installdirs-data-no:
+ installdirs-data-yes:
+ 	@catalogs='$(CATALOGS)'; \
+@@ -361,13 +454,6 @@ installcheck:
+ uninstall: uninstall-exec uninstall-data
+ uninstall-exec:
+ uninstall-data: uninstall-data-@USE_NLS@
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  for file in $(DISTFILES.common) Makevars.template; do \
+-	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	else \
+-	  : ; \
+-	fi
+ uninstall-data-no:
+ uninstall-data-yes:
+ 	catalogs='$(CATALOGS)'; \
+@@ -379,39 +465,41 @@ uninstall-data-yes:
+ 	  done; \
+ 	done
+ 
+-fullcheck check: all
++check: all
+ 
+ info dvi ps pdf html tags TAGS ctags CTAGS ID:
+ 
++install-dvi install-ps install-pdf install-html:
++
+ mostlyclean:
+-	rm -f remove-potcdate.sed
+-	rm -f stamp-poT
+-	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
+-	rm -f $(DOMAIN).po.bak
++	rm -f $(srcdir)/stamp-poT
++	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.gpo *.new.po
+ 	rm -fr *.o
+ 
+ clean: mostlyclean
+ 
+ distclean: clean
+-	rm -f Makefile Makefile.in POTFILES *.mo
++	rm -f Makefile Makefile.in
+ 
+ maintainer-clean: distclean
+ 	@echo "This command is intended for maintainers to use;"
+ 	@echo "it deletes files that may require special tools to rebuild."
+-	rm -f stamp-po $(GMOFILES)
++	rm -f $(srcdir)/$(DOMAIN).pot $(srcdir)/stamp-po $(GMOFILES)
+ 
+ distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
+ dist distdir:
+ 	test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
+ 	@$(MAKE) dist2
+ # This is a separate target because 'update-po' must be executed before.
+-dist2: stamp-po $(DISTFILES)
+-	dists="$(DISTFILES)"; \
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  dists="$$dists Makevars.template"; \
+-	fi; \
++dist2: $(srcdir)/stamp-po $(DISTFILES)
++	@dists="$(DISTFILES) fetch-po"; \
+ 	if test -f $(srcdir)/$(DOMAIN).pot; then \
+ 	  dists="$$dists $(DOMAIN).pot stamp-po"; \
++	else \
++	  case $(XGETTEXT) in \
++	    :) echo "Warning: Creating a tarball without '$(DOMAIN).pot', because a suitable 'xgettext' program was not found in PATH." 1>&2;; \
++	    *) echo "Warning: Creating a tarball without '$(DOMAIN).pot', because 'xgettext' found no strings to extract. Check the contents of the POTFILES.in file and the XGETTEXT_OPTIONS in the Makevars file." 1>&2;; \
++	  esac; \
+ 	fi; \
+ 	if test -f $(srcdir)/ChangeLog; then \
+ 	  dists="$$dists ChangeLog"; \
+@@ -430,9 +518,11 @@ dist2: stamp-po $(DISTFILES)
+ 	  fi; \
+ 	done
+ 
++# This rule updates all generated files in this directory.
++# Note: The name 'update-po' is a bit misleading. It does *not* modify the *.po
++# files. But we can't rename it easily, because it's a documented target.
+ update-po: Makefile
+ 	$(MAKE) $(DOMAIN).pot-update
+-	test -z "$(UPDATEPOFILES)" || $(MAKE) $(UPDATEPOFILES)
+ 	$(MAKE) update-gmo
+ 
+ # General rule for creating PO files.
+@@ -442,53 +532,36 @@ update-po: Makefile
+ 	echo "File $$lang.po does not exist. If you are a translator, you can create it through 'msginit'." 1>&2; \
+ 	exit 1
+ 
+-# General rule for updating PO files.
+-
+-.nop.po-update:
+-	@lang=`echo $@ | sed -e 's/\.po-update$$//'`; \
+-	if test "$(PACKAGE)" = "gettext-tools" && test "$(CROSS_COMPILING)" != "yes"; then PATH=`pwd`/../src:$$PATH; fi; \
+-	tmpdir=`pwd`; \
+-	echo "$$lang:"; \
+-	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
+-	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
+-	cd $(srcdir); \
+-	if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+-	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+-	         $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+-	       *) \
+-	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+-	     esac; \
+-	   }; then \
+-	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
+-	    rm -f $$tmpdir/$$lang.new.po; \
+-	  else \
+-	    if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
+-	      :; \
+-	    else \
+-	      echo "msgmerge for $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
+-	      exit 1; \
+-	    fi; \
+-	  fi; \
+-	else \
+-	  echo "msgmerge for $$lang.po failed!" 1>&2; \
+-	  rm -f $$tmpdir/$$lang.new.po; \
+-	fi
+-
+ $(DUMMYPOFILES):
+ 
+ update-gmo: Makefile $(GMOFILES)
+ 	@:
+ 
++# Include all the Rules-* extensions. Documented in
++# <https://www.gnu.org/software/gettext/manual/html_node/po_002fRules_002d_002a.html>
++RULES_FILES != cd $(srcdir) \
++               && for file in Rules-*; do \
++                    if test -f "$$file"; then \
++                      case "$$file" in \
++                        *.orig | *.bak | *~) ;; \
++                        *) echo $(srcdir)/"$$file" ;; \
++                      esac; \
++                    fi; \
++                  done
++include $(RULES_FILES)
++
+ # Recreate Makefile by invoking config.status. Explicitly invoke the shell,
+ # because execution permission bits may not work on the current file system.
+ # Use @SHELL@, which is the shell determined by autoconf for the use by its
+ # scripts, not $(SHELL) which is hardwired to /bin/sh and may be deficient.
+-Makefile: Makefile.in.in Makevars $(top_builddir)/config.status @POMAKEFILEDEPS@
++Makefile: Makefile.in.in Makevars $(top_builddir)/config.status
+ 	cd $(top_builddir) \
+-	  && CONFIG_FILES=$(subdir)/$@.in @SHELL@ ./config.status po-directories
++	  && @SHELL@ ./config.status $(subdir)/$@.in po-directories
+ 
+ force:
+ 
+-# Tell versions [3.59,3.63) of GNU make not to export all variables.
+-# Otherwise a system limit (for SysV at least) may be exceeded.
+-.NOEXPORT:
++# This Makefile contains rules which don't work with parallel make,
++# namely dist2.
++# See <https://lists.gnu.org/archive/html/bug-gettext/2022-06/msg00022.html>.
++# So, turn off parallel execution in this Makefile.
++.NOTPARALLEL:
+-- 
+2.47.3
+
diff --git a/package/e2fsprogs/0003-po-reapply-local-e2fsprogs-chages-to-po-Makefile.in..patch b/package/e2fsprogs/0003-po-reapply-local-e2fsprogs-chages-to-po-Makefile.in..patch
new file mode 100644
index 0000000000..15e2ddb8df
--- /dev/null
+++ b/package/e2fsprogs/0003-po-reapply-local-e2fsprogs-chages-to-po-Makefile.in..patch
@@ -0,0 +1,96 @@
+From ea3898e7c8f5bd6a2eed8b4fbff196210a730259 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 1 Feb 2026 19:09:57 +0100
+Subject: [PATCH] po: reapply local e2fsprogs chages to po/Makefile.in.in
+
+Ported from
+https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=ba526aae3a8b3eff6bf8b895ef7a45bd557e27ac
+
+Upstream: https://github.com/tytso/e2fsprogs/pull/267
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ po/Makefile.in.in | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/po/Makefile.in.in b/po/Makefile.in.in
+index cd15eda9..44ffd9b0 100644
+--- a/po/Makefile.in.in
++++ b/po/Makefile.in.in
+@@ -242,8 +242,11 @@ $(GMOFILES): $(srcdir)/$(DOMAIN).pot
+ 	rm -f $${lang}.gpo
+ 
+ 
+-all-yes: $(srcdir)/stamp-po
++all-yes: $(srcdir)/@MAINTAINER_CMT@stamp-po
+ all-no:
++all-static:
++depend:
++coverage.txt:
+ 
+ # Ensure that the gettext macros and this Makefile.in.in are in sync.
+ CHECK_MACRO_VERSION = \
+@@ -285,7 +288,7 @@ $(srcdir)/stamp-po: $(srcdir)/$(DOMAIN).pot
+ # The determination of whether the package xyz is a GNU one is based on the
+ # heuristic whether some file in the top level directory mentions "GNU xyz".
+ # If GNU 'find' is available, we avoid grepping through monster files.
+-$(DOMAIN).pot-update: $(POTFILES_DEPS) $(srcdir)/POTFILES.in
++$(DOMAIN).pot-update: $(POTFILES_DEPS) $(srcdir)/POTFILES.in $(srcdir)/at-expand.pl
+ 	package_gnu="$(PACKAGE_GNU)"; \
+ 	test -n "$$package_gnu" || { \
+ 	  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
+@@ -312,6 +315,7 @@ $(DOMAIN).pot-update: $(POTFILES_DEPS) $(srcdir)/POTFILES.in
+ 	case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+ 	  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
+ 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
++	      --directory=$(top_builddir) \
+ 	      --add-comments=TRANSLATORS: \
+ 	      --files-from=$(srcdir)/POTFILES.in \
+ 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+@@ -320,6 +324,7 @@ $(DOMAIN).pot-update: $(POTFILES_DEPS) $(srcdir)/POTFILES.in
+ 	    ;; \
+ 	  *) \
+ 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
++	      --directory=$(top_builddir) \
+ 	      --add-comments=TRANSLATORS: \
+ 	      --files-from=$(srcdir)/POTFILES.in \
+ 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
+@@ -329,6 +334,9 @@ $(DOMAIN).pot-update: $(POTFILES_DEPS) $(srcdir)/POTFILES.in
+ 	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+ 	    ;; \
+ 	esac
++	perl $(srcdir)/at-expand.pl < $(DOMAIN).po > $(DOMAIN).po.new
++	mv $(DOMAIN).po $(DOMAIN).po.bak
++	mv $(DOMAIN).po.new $(DOMAIN).po
+ 	test ! -f $(DOMAIN).po || { \
+ 	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
+ 	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
+@@ -465,7 +473,7 @@ uninstall-data-yes:
+ 	  done; \
+ 	done
+ 
+-check: all
++fullcheck check: all
+ 
+ info dvi ps pdf html tags TAGS ctags CTAGS ID:
+ 
+@@ -474,6 +482,7 @@ install-dvi install-ps install-pdf install-html:
+ mostlyclean:
+ 	rm -f $(srcdir)/stamp-poT
+ 	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.gpo *.new.po
++	rm -f $(DOMAIN).po.bak
+ 	rm -fr *.o
+ 
+ clean: mostlyclean
+@@ -556,7 +565,7 @@ include $(RULES_FILES)
+ # scripts, not $(SHELL) which is hardwired to /bin/sh and may be deficient.
+ Makefile: Makefile.in.in Makevars $(top_builddir)/config.status
+ 	cd $(top_builddir) \
+-	  && @SHELL@ ./config.status $(subdir)/$@.in po-directories
++	  && CONFIG_FILES=$(subdir)/$@.in @SHELL@ ./config.status po-directories
+ 
+ force:
+ 
+-- 
+2.47.3
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ad3d1dbe75..0c5c70e1d7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -20,8 +20,9 @@ HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
 # 0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
 # the additional dependencies are only needed for autoreconf
+E2FSPROGS_AUTOPOINT = YES
 E2FSPROGS_AUTORECONF = YES
-E2FSPROGS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+E2FSPROGS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive --include=$(HOST_DIR)/share/gettext/m4
 E2FSPROGS_DEPENDENCIES += host-gettext host-autoconf-archive
 HOST_E2FSPROGS_DEPENDENCIES += host-gettext host-autoconf-archive
 
diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 7c649843f4..83f5e54dce 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
+sha256  71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7  gettext-1.0.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
-sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index b7d0cf213c..680c1ab7e8 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.4
+GETTEXT_GNU_VERSION = 1.0
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
@@ -40,7 +40,8 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
 	--disable-native-java \
 	--disable-csharp \
 	--disable-relocatable \
-	--without-emacs
+	--without-emacs \
+	--without-selinux
 
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
@@ -62,7 +63,7 @@ HOST_GETTEXT_GNU_SUBDIR = .
 # and the build of documentation and tests of gettext-runtime.
 define HOST_GETTEXT_GNU_DISABLE_UNNEEDED
 	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/examples$$//' $(@D)/gettext-tools/Makefile.in
-	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests$$//' $(@D)/gettext-runtime/Makefile.in
+	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests install-tests$$//' $(@D)/gettext-runtime/Makefile.in
 endef
 
 GETTEXT_GNU_POST_PATCH_HOOKS += HOST_GETTEXT_GNU_DISABLE_UNNEEDED
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f7ed50b49f..fd18b28c22 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
+sha256  71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7  gettext-1.0.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 3fe8a781d9..1a6dd940b2 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,17 +15,17 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.4
+GETTEXT_TINY_ARCHIVE_VERSION = 1.0
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
-	gettext-tools/misc/gettextize.in \
-	gettext-tools/po/Makevars.template \
+	gettext-tools/wizard/gettextize.in \
+	gettext-tools/wizard/po-templates/traditional/Makevars.template \
 	gettext-runtime/po/boldquot.sed \
 	gettext-runtime/po/en@boldquot.header \
 	gettext-runtime/po/en@quot.header \
-	gettext-runtime/po/insert-header.sin \
+	gettext-runtime/po/insert-header.sed \
 	gettext-runtime/po/quot.sed \
-	gettext-runtime/po/remove-potcdate.sin \
+	gettext-runtime/po/remove-potcdate.sed \
 	gettext-runtime/po/Rules-quot \
 	gettext-runtime/po/Makefile.in.in \
 	COPYING
@@ -87,9 +87,9 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext-tiny/po/boldquot.sed
 	$(INSTALL) -m 0644 -D $(@D)/extra/en@boldquot.header $(HOST_DIR)/share/gettext-tiny/po/en@boldquot.header
 	$(INSTALL) -m 0644 -D $(@D)/extra/en@quot.header $(HOST_DIR)/share/gettext-tiny/po/en@quot.header
-	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sin $(HOST_DIR)/share/gettext-tiny/po/insert-header.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sed $(HOST_DIR)/share/gettext-tiny/po/insert-header.sed
 	$(INSTALL) -m 0644 -D $(@D)/extra/quot.sed $(HOST_DIR)/share/gettext-tiny/po/quot.sed
-	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sin $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sed $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sed
 	$(INSTALL) -m 0644 -D $(@D)/extra/Rules-quot $(HOST_DIR)/share/gettext-tiny/po/Rules-quot
 	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
