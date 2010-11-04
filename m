From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] ruby: bump to version 1.9.2-p0
	to fix openssl issues, fix dependency issues too
Message-ID: <20101104230332.5BAF78DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=38a611c269f90c3c9dc392d6738c63085123b49c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: autoreconf needed for host as well]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby-configure.patch |    9 +++++----
 package/ruby/ruby.mk              |   29 +++++++++++++++++++++++------
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/package/ruby/ruby-configure.patch b/package/ruby/ruby-configure.patch
index 2b58c70..0077a67 100644
--- a/package/ruby/ruby-configure.patch
+++ b/package/ruby/ruby-configure.patch
@@ -1,10 +1,11 @@
---- a/configure.in.orig	2009-07-08 15:23:44.000000000 +0200
-+++ b/configure.in	2009-07-08 15:24:52.000000000 +0200
-@@ -997,7 +997,25 @@
+diff -Nura ruby-1.9.2-p0.orig/configure.in ruby-1.9.2-p0/configure.in
+--- ruby-1.9.2-p0.orig/configure.in	2010-08-14 05:11:59.000000000 -0300
++++ ruby-1.9.2-p0/configure.in	2010-11-04 15:46:22.478191926 -0300
+@@ -1410,7 +1410,25 @@
  fi
  
  AC_FUNC_GETPGRP
--AC_FUNC_SETPGRP  
+-AC_FUNC_SETPGRP
 +
 +dnl AC_FUNC_SETPGRP does not work if cross compiling
 +dnl Instead, assume we will have a prototype for setpgrp if cross compiling.
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 309a69d..adb1862 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -3,14 +3,31 @@
 # ruby
 #
 #############################################################
-RUBY_VERSION:=1.9.1-p129
-RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
-RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.9
-RUBY_AUTORECONF=YES
-RUBY_DEPENDENCIES=host-ruby
-RUBY_MAKE_ENV=$(TARGET_MAKE_ENV)
 
+RUBY_VERSION = 1.9.2-p0
+RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
+RUBY_AUTORECONF = YES
+HOST_RUBY_AUTORECONF = YES
+RUBY_DEPENDENCIES = host-ruby
+RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc
 
+# Force optionals to build before we do
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+	RUBY_DEPENDENCIES += berkeleydb
+endif
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	RUBY_DEPENDENCIES += ncurses
+endif
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	RUBY_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	RUBY_DEPENDENCIES += readline
+endif
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	RUBY_DEPENDENCIES += zlib
+endif
+
 $(eval $(call AUTOTARGETS,package,ruby))
 $(eval $(call AUTOTARGETS,package,ruby,host))
-- 
1.7.1
