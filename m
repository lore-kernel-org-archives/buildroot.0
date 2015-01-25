From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 00:16:03 +0100
Subject: [Buildroot] [git commit] bison: bump to version 3.0.3
Message-ID: <20150125233550.9ED977FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dafe024764a9e7b4a1c89a0ecc8047f6d4c2f2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file and remove patch since it's no longer necessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison-01-no-docs-regen.patch |   53 ----------------------------
 package/bison/bison.hash                   |    2 +
 package/bison/bison.mk                     |    3 +-
 3 files changed, 3 insertions(+), 55 deletions(-)

diff --git a/package/bison/bison-01-no-docs-regen.patch b/package/bison/bison-01-no-docs-regen.patch
deleted file mode 100644
index 7c375d6..0000000
--- a/package/bison/bison-01-no-docs-regen.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-bison regenerates the docs to see if they changed which requires running
-the recently built bison. This obviously doesn't work for cross compiles
-hence breaks for many target bison builds.
-Just disable it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura bison-3.0.orig/doc/local.mk bison-3.0/doc/local.mk
---- bison-3.0.orig/doc/local.mk	2013-10-02 16:52:48.711890121 -0300
-+++ bison-3.0/doc/local.mk	2013-10-02 17:14:59.329341143 -0300
-@@ -37,15 +37,6 @@
- CROSS_OPTIONS_PL = $(top_srcdir)/build-aux/cross-options.pl
- CROSS_OPTIONS_TEXI = $(top_srcdir)/doc/cross-options.texi
- $(CROSS_OPTIONS_TEXI): doc/bison.help $(CROSS_OPTIONS_PL)
--# Create $@~ which is the previous contents.  Don't use 'mv' here so
--# that even if we are interrupted, the file is still available for
--# diff in the next run.  Note that $@ might not exist yet.
--	$(AM_V_GEN){ test ! -f $@ || cat $@; } >$@~
--	$(AM_V_at)test ! -f $@.tmp || rm -f $@.tmp
--	$(AM_V_at)src/bison$(EXEEXT) --help |				 \
--	  $(PERL) $(CROSS_OPTIONS_PL) $(top_srcdir)/src/scan-gram.l >$@.tmp
--	$(AM_V_at)diff -u $@~ $@.tmp || true
--	$(AM_V_at)mv $@.tmp $@
- MAINTAINERCLEANFILES = $(CROSS_OPTIONS_TEXI)
- 
- ## ---------- ##
-@@ -86,9 +77,6 @@
- EXTRA_DIST += $(top_srcdir)/doc/bison.help
- MAINTAINERCLEANFILES += $(top_srcdir)/doc/bison.help
- $(top_srcdir)/doc/bison.help: src/bison$(EXEEXT)
--	$(AM_V_GEN)src/bison$(EXEEXT) --version >doc/bison.help.tmp
--	$(AM_V_at) src/bison$(EXEEXT) --help   >>doc/bison.help.tmp
--	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change doc/bison.help.tmp $@
- 
- 
- ## ----------- ##
-@@ -106,16 +94,6 @@
- 
- # Depend on configure to get version number changes.
- $(top_srcdir)/doc/bison.1: doc/bison.help doc/bison.x $(top_srcdir)/configure
--	$(AM_V_GEN)$(HELP2MAN)			\
--	    --include=$(top_srcdir)/doc/bison.x	\
--	    --output=$@.t src/bison$(EXEEXT)
--	$(AM_V_at)if $(remove_time_stamp) $@ >$@a.t 2>/dev/null &&	 \
--	   $(remove_time_stamp) $@.t | cmp $@a.t - >/dev/null 2>&1; then \
--	  touch $@;							 \
--	else								 \
--	  mv $@.t $@;							 \
--	fi
--	$(AM_V_at)rm -f $@*.t
- 
- nodist_man_MANS = doc/yacc.1
- 
diff --git a/package/bison/bison.hash b/package/bison/bison.hash
new file mode 100644
index 0000000..dd10086
--- /dev/null
+++ b/package/bison/bison.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5940efbdd6b5d80e55ec16a01d2322e2892da21863391049b9b692570649177c	bison-3.0.3.tar.xz
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index c092b78..45f785e 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.0.2
+BISON_VERSION = 3.0.3
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
-BISON_AUTORECONF = YES
 
 $(eval $(host-autotools-package))
