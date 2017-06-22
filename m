From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Jun 2017 15:39:29 +0300
Subject: [Buildroot] [PATCH 1/2] psmisc: bump to version 23.1
Message-ID: <f47611d9867fd591625d0d90a9134c0221c3ce38.1498135170.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forward port 0001-link-against-libintl.patch. Since now autoreconf works, move
the patch from Makefile.in to Makefile.am. Also, convert to git format.

Remove 0002-no-__progname.patch. Buildroot default uClibc and musl now provide
__progname.

Add a patch that adds the git-version-gen script to fix autoreconf.

Remove upstream patch.

Upstream switched to .xz tarballs.

Add upstream provided hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/psmisc/0001-link-against-libintl.patch |  44 +++---
 package/psmisc/0002-add-git-version-get.patch  | 198 +++++++++++++++++++++++++
 package/psmisc/0002-no-__progname.patch        |  47 ------
 package/psmisc/psmisc.hash                     |   6 +-
 package/psmisc/psmisc.mk                       |  12 +-
 5 files changed, 235 insertions(+), 72 deletions(-)
 create mode 100644 package/psmisc/0002-add-git-version-get.patch
 delete mode 100644 package/psmisc/0002-no-__progname.patch

diff --git a/package/psmisc/0001-link-against-libintl.patch b/package/psmisc/0001-link-against-libintl.patch
index 907e7e75bd2d..bf6b97175fcd 100644
--- a/package/psmisc/0001-link-against-libintl.patch
+++ b/package/psmisc/0001-link-against-libintl.patch
@@ -1,4 +1,7 @@
-Link against libintl if needed
+From f2b6f342325824399da3525df182031475b5c4dd Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 22 Jun 2017 13:56:03 +0300
+Subject: [PATCH] Link against libintl if needed
 
 When built against a C library that has locale support, but for which
 intl support is provided by an external libintl library, psmisc
@@ -8,26 +11,27 @@ properly checks that.
 This patch therefore ensure that we link against libintl when needed,
 thanks to the @INTLLIBS@ variable provided by the configure script.
 
-We do not modify the Makefile.am file, because autoreconfiguring this
-package doesn't work: because of its usage of gettext, it wants to run
-the "autopoint" program, which itself depends on CVS being installed,
-for some strange reasons. That's the reason why we fall back to the
-hacky solution of modifying the Makefile.in file.
-
 Forward-ported Thomas's patch to psmisc 22.16
 from commit f066ed70cd6939838d4057f66798cbc1d972cc73
-
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[baruch: move from Makefile.in to Makefile.am for 23.1]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9f61ab4f2f70..8ce284e65124 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -65,6 +65,7 @@ src_fuser_LDADD = @LIBINTL@
+ src_killall_SOURCES = src/killall.c src/comm.h src/signals.c src/signals.h src/i18n.h
+ src_killall_LDADD = @LIBINTL@ @SELINUX_LIB@
+ src_peekfd_SOURCES = src/peekfd.c
++src_peekfd_LDADD = @LIBINTL@
+ src_pslog_SOURCES = src/pslog.c
+ src_pstree_SOURCES = src/pstree.c src/comm.h src/i18n.h
+ src_pstree_LDADD = @LIBINTL@ @TERMCAP_LIB@ @SELINUX_LIB@
+-- 
+2.11.0
 
-diff -Nura psmisc-22.16.orig/src/Makefile.in psmisc-22.16/src/Makefile.in
---- psmisc-22.16.orig/src/Makefile.in	2012-03-28 22:27:33.106660358 -0300
-+++ psmisc-22.16/src/Makefile.in	2012-03-28 22:28:55.752219349 -0300
-@@ -76,7 +76,7 @@
- killall_DEPENDENCIES =
- am_peekfd_OBJECTS = peekfd.$(OBJEXT)
- peekfd_OBJECTS = $(am_peekfd_OBJECTS)
--peekfd_LDADD = $(LDADD)
-+peekfd_LDADD = $(LDADD) @LIBINTL@
- am_prtstat_OBJECTS = prtstat.$(OBJEXT)
- prtstat_OBJECTS = $(am_prtstat_OBJECTS)
- prtstat_DEPENDENCIES =
diff --git a/package/psmisc/0002-add-git-version-get.patch b/package/psmisc/0002-add-git-version-get.patch
new file mode 100644
index 000000000000..e75fb1d3ce80
--- /dev/null
+++ b/package/psmisc/0002-add-git-version-get.patch
@@ -0,0 +1,198 @@
+Makefile: ship also git-version-gen
+
+Without git-version-gen, the tarball autogen.sh fails.
+
+This patch is equivalent to upstream pending merge request:
+
+  https://gitlab.com/psmisc/psmisc/merge_requests/13
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff --git psmisc-23.1/misc/git-version-gen psmisc-23.1/misc/git-version-gen
+new file mode 100755
+index 000000000000..171767f0d7a3
+--- /dev/null
++++ psmisc-23.1/misc/git-version-gen
+@@ -0,0 +1,181 @@
++#!/bin/sh
++# Print a version string.
++scriptversion=2011-02-19.19; # UTC
++
++# Copyright (C) 2007-2011 Free Software Foundation, Inc.
++#
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# This script is derived from GIT-VERSION-GEN from GIT: http://git.or.cz/.
++# It may be run two ways:
++# - from a git repository in which the "git describe" command below
++#   produces useful output (thus requiring at least one signed tag)
++# - from a non-git-repo directory containing a .tarball-version file, which
++#   presumes this script is invoked like "./git-version-gen .tarball-version".
++
++# In order to use intra-version strings in your project, you will need two
++# separate generated version string files:
++#
++# .tarball-version - present only in a distribution tarball, and not in
++#   a checked-out repository.  Created with contents that were learned at
++#   the last time autoconf was run, and used by git-version-gen.  Must not
++#   be present in either $(srcdir) or $(builddir) for git-version-gen to
++#   give accurate answers during normal development with a checked out tree,
++#   but must be present in a tarball when there is no version control system.
++#   Therefore, it cannot be used in any dependencies.  GNUmakefile has
++#   hooks to force a reconfigure at distribution time to get the value
++#   correct, without penalizing normal development with extra reconfigures.
++#
++# .version - present in a checked-out repository and in a distribution
++#   tarball.  Usable in dependencies, particularly for files that don't
++#   want to depend on config.h but do want to track version changes.
++#   Delete this file prior to any autoconf run where you want to rebuild
++#   files to pick up a version string change; and leave it stale to
++#   minimize rebuild time after unrelated changes to configure sources.
++#
++# It is probably wise to add these two files to .gitignore, so that you
++# don't accidentally commit either generated file.
++#
++# Use the following line in your configure.ac, so that $(VERSION) will
++# automatically be up-to-date each time configure is run (and note that
++# since configure.ac no longer includes a version string, Makefile rules
++# should not depend on configure.ac for version updates).
++#
++# AC_INIT([GNU project],
++#         m4_esyscmd([build-aux/git-version-gen .tarball-version]),
++#         [bug-project at example])
++#
++# Then use the following lines in your Makefile.am, so that .version
++# will be present for dependencies, and so that .tarball-version will
++# exist in distribution tarballs.
++#
++# BUILT_SOURCES = $(top_srcdir)/.version
++# $(top_srcdir)/.version:
++#	echo $(VERSION) > $@-t && mv $@-t $@
++# dist-hook:
++#	echo $(VERSION) > $(distdir)/.tarball-version
++
++case $# in
++    1|2) ;;
++    *) echo 1>&2 "Usage: $0 \$srcdir/.tarball-version" \
++         '[TAG-NORMALIZATION-SED-SCRIPT]'
++       exit 1;;
++esac
++
++tarball_version_file=$1
++tag_sed_script="${2:-s/x/x/}"
++nl='
++'
++
++# Avoid meddling by environment variable of the same name.
++v=
++v_from_git=
++
++# First see if there is a tarball-only version file.
++# then try "git describe", then default.
++if test -f $tarball_version_file
++then
++    v=`cat $tarball_version_file` || v=
++    case $v in
++        *$nl*) v= ;; # reject multi-line output
++        [0-9]*) ;;
++        *) v= ;;
++    esac
++    test -z "$v" \
++        && echo "$0: WARNING: $tarball_version_file is missing or damaged" 1>&2
++fi
++
++if test -n "$v"
++then
++    : # use $v
++# Otherwise, if there is at least one git commit involving the working
++# directory, and "git describe" output looks sensible, use that to
++# derive a version string.
++elif test "`git log -1 --pretty=format:x . 2>&1`" = x \
++    && v=`git describe --abbrev=4 --match='v*' HEAD 2>/dev/null \
++          || git describe --abbrev=4 HEAD 2>/dev/null` \
++    && v=`printf '%s\n' "$v" | sed "$tag_sed_script"` \
++    && case $v in
++         v[0-9]*) ;;
++         *) (exit 1) ;;
++       esac
++then
++    # Is this a new git that lists number of commits since the last
++    # tag or the previous older version that did not?
++    #   Newer: v6.10-77-g0f8faeb
++    #   Older: v6.10-g0f8faeb
++    case $v in
++        *-rc[0-9]) ;; # release candidate
++        *-*-*) : git describe is okay three part flavor ;;
++        *-*)
++            : git describe is older two part flavor
++            # Recreate the number of commits and rewrite such that the
++            # result is the same as if we were using the newer version
++            # of git describe.
++            vtag=`echo "$v" | sed 's/-.*//'`
++            commit_list=`git rev-list "$vtag"..HEAD 2>/dev/null` \
++                || { commit_list=failed;
++                     echo "$0: WARNING: git rev-list failed" 1>&2; }
++            numcommits=`echo "$commit_list" | wc -l`
++            v=`echo "$v" | sed "s/\(.*\)-\(.*\)/\1-$numcommits-\2/"`;
++            test "$commit_list" = failed && v=UNKNOWN
++            ;;
++    esac
++
++    case $v in
++        *-rc[0-9])
++	    # Remove the "g" in git describe's output string, to save a byte.
++            v=`echo "$v" | sed 's/\(.*\)-g/\1-/'`;
++	    ;;
++        *)
++	    # Change the first '-' to a '.', so version-comparing tools work properly.
++	    # Remove the "g" in git describe's output string, to save a byte.
++	    v=`echo "$v" | sed 's/-/./;s/\(.*\)-g/\1-/'`;
++	    ;;
++    esac
++    v_from_git=1
++else
++    v=UNKNOWN
++fi
++
++v=`echo "$v" |sed 's/^v//'`
++
++# Test whether to append the "-dirty" suffix only if the version
++# string we're using came from git.  I.e., skip the test if it's "UNKNOWN"
++# or if it came from .tarball-version.
++if test -n "$v_from_git"; then
++  # Don't declare a version "dirty" merely because a time stamp has changed.
++  git update-index --refresh > /dev/null 2>&1
++
++  dirty=`exec 2>/dev/null;git diff-index --name-only HEAD` || dirty=
++  case "$dirty" in
++      '') ;;
++      *) # Append the suffix only if there isn't one already.
++          case $v in
++            *-dirty) ;;
++            *) v="$v-dirty" ;;
++          esac ;;
++  esac
++fi
++
++# Omit the trailing newline, so that m4_esyscmd can use the result directly.
++echo "$v" | tr -d "$nl"
++
++# Local variables:
++# eval: (add-hook 'write-file-hooks 'time-stamp)
++# time-stamp-start: "scriptversion="
++# time-stamp-format: "%:y-%02m-%02d.%02H"
++# time-stamp-time-zone: "UTC"
++# time-stamp-end: "; # UTC"
++# End:
diff --git a/package/psmisc/0002-no-__progname.patch b/package/psmisc/0002-no-__progname.patch
deleted file mode 100644
index 51096571cb62..000000000000
--- a/package/psmisc/0002-no-__progname.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-[PATCH]: pstree: don't use glibc-specific __progname
-
-uclibc (per default) doesn't implement __progname, and the pstree.x11
-stuff isn't that critical, so just disable it.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: psmisc-22.13/src/pstree.c
-===================================================================
---- psmisc-22.13.orig/src/pstree.c	2010-07-12 13:10:03.000000000 +0200
-+++ psmisc-22.13/src/pstree.c	2011-05-21 16:33:37.456530775 +0200
-@@ -49,8 +49,6 @@
- #include <selinux/selinux.h>
- #endif                                /*WITH_SELINUX */
- 
--extern const char *__progname;
--
- #define PROC_BASE    "/proc"
- 
- /* UTF-8 defines by Johan Myreen, updated by Ben Winslow */
-@@ -854,9 +852,6 @@
-     textdomain(PACKAGE);
- #endif
- 
--    if (!strcmp(__progname, "pstree.x11"))
--        wait_end = 1;
--
-     /*
-      * Attempt to figure out a good default symbol set.  Will be overriden by
-      * command-line options, if given.
-Index: psmisc-22.13/src/Makefile.in
-===================================================================
---- psmisc-22.13.orig/src/Makefile.in	2011-05-21 16:33:42.748530777 +0200
-+++ psmisc-22.13/src/Makefile.in	2011-05-21 16:33:47.360530782 +0200
-@@ -557,10 +557,6 @@
- 		grep '^{ 1,"HUP" },$$' signames.h >/dev/null || \
- 		  { rm -f signames.h; exit 1; }
- 
--install-exec-hook:
--		cd $(DESTDIR)$(bindir) && \
--			( [ -h pstree.x11 ]  || $(LN_S) pstree pstree.x11)
--
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
- .NOEXPORT:
diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index 5e489ed34c10..8ce8e00d35c9 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,3 +1,5 @@
+# From https://sourceforge.net/projects/psmisc/files/psmisc/
+md5 bbba1f701c02fb50d59540d1ff90d8d1 psmisc-23.1.tar.xz
+sha1 d19031a5ba18a530aa0bb768cb74593f9af74b08 psmisc-23.1.tar.xz
 # Locally computed:
-sha256  97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a  psmisc-22.21.tar.gz
-sha256  4f1cb11c7182ad96e682ec50a2d9a6a22079a2b11dffde3bb3cb67823b679422  e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
+sha256  2e84d474cf75dfbe3ecdacfb797bbfab71a35c7c2639d1b9f6d5f18b2149ba30  psmisc-23.1.tar.xz
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 70caf5e653fe..408c047edea8 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,13 +4,19 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 22.21
+PSMISC_VERSION = 23.1
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
-PSMISC_PATCH = \
-	https://gitlab.com/psmisc/psmisc/commit/e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
+PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0
 PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+# Patching Makefile.am
+PSMISC_AUTORECONF = YES
+
+define PSMISC_GIT_VERSION_EXEC
+	chmod +x $(@D)/misc/git-version-gen
+endef
+PSMISC_POST_PATCH_HOOKS += PSMISC_GIT_VERSION_EXEC
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 # Don't force -fstack-protector when SSP is not available in toolchain
-- 
2.11.0
