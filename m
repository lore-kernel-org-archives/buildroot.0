From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 22:30:33 +0200
Subject: [Buildroot] [git commit] bison: fix docs build breakage
Message-ID: <20131002214311.909909B85F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1535cb520525bb4d2c4d188d4e99809fef17df64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building docs running the binary itself to see if docs need to be
changed is somewhat skippy. Disable it. Fixes:
http://autobuild.buildroot.net/results/e8a/e8a960f38e66f31355af733e510002d45052b541/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison-01-no-docs-regen.patch |   53 ++++++++++++++++++++++++++++
 package/bison/bison.mk                     |    1 +
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/bison/bison-01-no-docs-regen.patch b/package/bison/bison-01-no-docs-regen.patch
new file mode 100644
index 0000000..7c375d6
--- /dev/null
+++ b/package/bison/bison-01-no-docs-regen.patch
@@ -0,0 +1,53 @@
+bison regenerates the docs to see if they changed which requires running
+the recently built bison. This obviously doesn't work for cross compiles
+hence breaks for many target bison builds.
+Just disable it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura bison-3.0.orig/doc/local.mk bison-3.0/doc/local.mk
+--- bison-3.0.orig/doc/local.mk	2013-10-02 16:52:48.711890121 -0300
++++ bison-3.0/doc/local.mk	2013-10-02 17:14:59.329341143 -0300
+@@ -37,15 +37,6 @@
+ CROSS_OPTIONS_PL = $(top_srcdir)/build-aux/cross-options.pl
+ CROSS_OPTIONS_TEXI = $(top_srcdir)/doc/cross-options.texi
+ $(CROSS_OPTIONS_TEXI): doc/bison.help $(CROSS_OPTIONS_PL)
+-# Create $@~ which is the previous contents.  Don't use 'mv' here so
+-# that even if we are interrupted, the file is still available for
+-# diff in the next run.  Note that $@ might not exist yet.
+-	$(AM_V_GEN){ test ! -f $@ || cat $@; } >$@~
+-	$(AM_V_at)test ! -f $@.tmp || rm -f $@.tmp
+-	$(AM_V_at)src/bison$(EXEEXT) --help |				 \
+-	  $(PERL) $(CROSS_OPTIONS_PL) $(top_srcdir)/src/scan-gram.l >$@.tmp
+-	$(AM_V_at)diff -u $@~ $@.tmp || true
+-	$(AM_V_at)mv $@.tmp $@
+ MAINTAINERCLEANFILES = $(CROSS_OPTIONS_TEXI)
+ 
+ ## ---------- ##
+@@ -86,9 +77,6 @@
+ EXTRA_DIST += $(top_srcdir)/doc/bison.help
+ MAINTAINERCLEANFILES += $(top_srcdir)/doc/bison.help
+ $(top_srcdir)/doc/bison.help: src/bison$(EXEEXT)
+-	$(AM_V_GEN)src/bison$(EXEEXT) --version >doc/bison.help.tmp
+-	$(AM_V_at) src/bison$(EXEEXT) --help   >>doc/bison.help.tmp
+-	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change doc/bison.help.tmp $@
+ 
+ 
+ ## ----------- ##
+@@ -106,16 +94,6 @@
+ 
+ # Depend on configure to get version number changes.
+ $(top_srcdir)/doc/bison.1: doc/bison.help doc/bison.x $(top_srcdir)/configure
+-	$(AM_V_GEN)$(HELP2MAN)			\
+-	    --include=$(top_srcdir)/doc/bison.x	\
+-	    --output=$@.t src/bison$(EXEEXT)
+-	$(AM_V_at)if $(remove_time_stamp) $@ >$@a.t 2>/dev/null &&	 \
+-	   $(remove_time_stamp) $@.t | cmp $@a.t - >/dev/null 2>&1; then \
+-	  touch $@;							 \
+-	else								 \
+-	  mv $@.t $@;							 \
+-	fi
+-	$(AM_V_at)rm -f $@*.t
+ 
+ nodist_man_MANS = doc/yacc.1
+ 
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 47a7560..1bead39 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -11,6 +11,7 @@ BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
 BISON_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
 BISON_DEPENDENCIES = m4
+BISON_AUTORECONF = YES
 
 define BISON_DISABLE_EXAMPLES
 	echo 'all install:' > $(@D)/examples/Makefile
