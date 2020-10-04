From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 21:02:53 +0200
Subject: [Buildroot] [git commit] package/ruby: update to 2.7.1
Message-ID: <20201004190202.E84DC8E1BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4791e230f0f8ef9159fdf5c9e116eede176efc41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add patch to recognize coroutines correctly
- remove unneeded verconf.h removal hack

License files reformatted / converted to markdown.  Update the LEGAL /
COPYING hashes to match.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Peter: fix license hashes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-default-coroutine-selection.patch     | 35 ++++++++++++++++++++++
 package/ruby/ruby.hash                             | 10 +++----
 package/ruby/ruby.mk                               | 15 ++++------
 3 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/package/ruby/0001-fix-default-coroutine-selection.patch b/package/ruby/0001-fix-default-coroutine-selection.patch
new file mode 100644
index 0000000000..79dbd692e5
--- /dev/null
+++ b/package/ruby/0001-fix-default-coroutine-selection.patch
@@ -0,0 +1,35 @@
+fixed default coroutine selection for musl/uclibc
+
+https://github.com/ruby/ruby/pull/3567/commits/b570e7de87aaad8c903176d835e8124127f627b3
+
+Signed-off-by: Waldemar Brodkorb <wbx@opennadk.org>
+
+diff -Nur ruby-2.7.1.orig/configure.ac ruby-2.7.1/configure.ac
+--- ruby-2.7.1.orig/configure.ac	2020-03-31 12:44:55.000000000 +0200
++++ ruby-2.7.1/configure.ac	2020-10-01 00:03:53.130462286 +0200
+@@ -2344,8 +2344,12 @@
+             rb_cv_coroutine=copy
+         ],
+         [*], [
+-            rb_cv_coroutine=ucontext
++            AC_CHECK_FUNCS([getcontext swapcontext makecontext],
++               [rb_cv_coroutine=ucontext],
++               [rb_cv_coroutine=copy; break]
++            )
+         ]
++
+     )
+     AC_MSG_RESULT(${rb_cv_coroutine})
+ ])
+diff -Nur ruby-2.7.1.orig/coroutine/copy/Context.c ruby-2.7.1/coroutine/copy/Context.c
+--- ruby-2.7.1.orig/coroutine/copy/Context.c	2020-03-31 12:44:55.000000000 +0200
++++ ruby-2.7.1/coroutine/copy/Context.c	2020-10-01 00:04:59.414670705 +0200
+@@ -5,6 +5,8 @@
+  *  Copyright, 2019, by Samuel Williams. All rights reserved.
+ */
+ 
++#include <sys/types.h>
++
+ #include "Context.h"
+ 
+ // http://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 89cab3fcd3..45e93b8a70 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-4-10-released/
-sha256 d5668ed11544db034f70aec37d11e157538d639ed0d0a968e2f587191fc530df  ruby-2.4.10.tar.xz
+# https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released/
+sha256  b224f9844646cc92765df8288a46838511c1cec5b550d8874bd4686a904fcee7  ruby-2.7.1.tar.xz
 # License files, Locally calculated
-sha256 609292a6d848ab223073944fc2d844449391a5ba2055a8b5baf1726bc13b39cb  LEGAL
-sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
-sha256 a5e3042dacb53eebda91f3b1caefbfec8307711df8c4ed1ed20e4e97c43307a4  BSDL
+sha256  b09ca195d2de08f0aacfa8793d0af62d7681c304b3ef714b75813721823295a6  LEGAL
+sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
+sha256  a5e3042dacb53eebda91f3b1caefbfec8307711df8c4ed1ed20e4e97c43307a4  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d138aaaa1a..919d032806 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
-RUBY_VERSION_EXT = 2.4.0
+RUBY_VERSION_MAJOR = 2.7
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 2.7.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
@@ -19,6 +19,8 @@ HOST_RUBY_CONF_OPTS = \
 	--without-gmp
 RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
+# 0001-fix-default-coroutine-selection.patch
+RUBY_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # On uClibc, finite, isinf and isnan are not directly implemented as
@@ -70,13 +72,6 @@ else
 RUBY_CONF_OPTS += --without-gmp
 endif
 
-# workaround for amazing build failure, see
-# http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
-define RUBY_REMOVE_VERCONF_H
-	rm -f $(@D)/verconf.h
-endef
-RUBY_POST_CONFIGURE_HOOKS += RUBY_REMOVE_VERCONF_H
-
 # Remove rubygems and friends, as they need extensions that aren't
 # built and a target compiler.
 RUBY_EXTENSIONS_REMOVE = rake* rdoc* rubygems*
