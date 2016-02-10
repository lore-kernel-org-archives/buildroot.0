From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:03:11 +0100
Subject: [Buildroot] [PATCH 3/4] vpnc: bump to newer upstream version
In-Reply-To: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1455145392-2355-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While the official upstream has not published any new tarball, they
have continued to update their Subversion repository with additional
changes. This commit therefore updates the vpnc package to a newer
version, using the Github repository that replicates the original
Subversion repository.

Since the update required some updates to the patches, we took this
opportunity to split them in more fine-grained changes, and document
them more properly. Consequently:

 - The patch 0001 that fixes the Makefile gets split into 3 patches,
   0001, 0002 and 0003, each for one specific issue.

 - Patch 0002 to disable building the manpages gets changed into a
   solution that is potentially upstreamable, and is now patch 0004.

 - A new patch 0005 is added to specify a custom libgcrypt-config
   path, since this tool is now used to know how to link with
   libgcrypt.

 - The SUSv3 function removal patch is now patch 0006, and gains a
   better commit log.

Also, this vpnc version now depends on gnutls, which basically is a
better replacement for OpenSSL, whose support was not enabled by
default due to licensing issues (vpnc is under the GPL, which isn't
compatible with the OpenSSL license).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ile-allow-to-override-the-PREFIX-variable.patch | 32 ++++++++++++
 ...ile-cleanup-and-fix-the-VERSION-definitio.patch | 59 ----------------------
 package/vpnc/0002-Don-t-build-manpages.patch       | 31 ------------
 ...02-Makefile-allow-to-override-the-version.patch | 42 +++++++++++++++
 ...file-allow-passing-custom-CFLAGS-CPPFLAGS.patch | 46 +++++++++++++++++
 ...e-provide-an-option-to-not-build-manpages.patch | 58 +++++++++++++++++++++
 ...low-passing-a-custom-path-to-libgcrypt-co.patch | 41 +++++++++++++++
 ...lace-deprecated-SUSv3-functions-with-POS.patch} | 21 +++++---
 package/vpnc/Config.in                             |  6 +++
 package/vpnc/vpnc.hash                             |  2 +-
 package/vpnc/vpnc.mk                               | 17 +++----
 11 files changed, 247 insertions(+), 108 deletions(-)
 create mode 100644 package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch
 delete mode 100644 package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
 delete mode 100644 package/vpnc/0002-Don-t-build-manpages.patch
 create mode 100644 package/vpnc/0002-Makefile-allow-to-override-the-version.patch
 create mode 100644 package/vpnc/0003-Makefile-allow-passing-custom-CFLAGS-CPPFLAGS.patch
 create mode 100644 package/vpnc/0004-Makefile-provide-an-option-to-not-build-manpages.patch
 create mode 100644 package/vpnc/0005-Makefile-allow-passing-a-custom-path-to-libgcrypt-co.patch
 rename package/vpnc/{0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch => 0006-config.c-Replace-deprecated-SUSv3-functions-with-POS.patch} (53%)

diff --git a/package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch b/package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch
new file mode 100644
index 0000000..5b6df68
--- /dev/null
+++ b/package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch
@@ -0,0 +1,32 @@
+From 7314d232f8e85879d8f4c311ced44ee5b21fb239 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 10 Feb 2016 23:26:27 +0100
+Subject: [PATCH] Makefile: allow to override the PREFIX variable
+
+Some people may not want to install in /usr/local, so this commit
+makes it possible to override the PREFIX variable from the make
+command line.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 69f5aca..f9a6781 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,7 @@
+ # $Id$
+ 
+ DESTDIR=
+-PREFIX=/usr/local
++PREFIX?=/usr/local
+ ETCDIR=/etc/vpnc
+ BINDIR=$(PREFIX)/bin
+ SBINDIR=$(PREFIX)/sbin
+-- 
+2.6.4
+
diff --git a/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch b/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
deleted file mode 100644
index cad3e1a..0000000
--- a/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 40b35a82ea581f5dfb1b0b20c4ba3e9f01f35107 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Mon, 8 Feb 2016 23:02:45 +0100
-Subject: [PATCH] Misc. Makefile cleanup and fix the VERSION definition.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9b96d83..62742d0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,7 +20,7 @@
- # $Id$
- 
- DESTDIR=
--PREFIX=/usr/local
-+PREFIX?=/usr/local
- ETCDIR=/etc/vpnc
- BINDIR=$(PREFIX)/bin
- SBINDIR=$(PREFIX)/sbin
-@@ -32,8 +32,6 @@ BINS = vpnc cisco-decrypt
- OBJS = $(addsuffix .o,$(basename $(SRCS)))
- BINOBJS = $(addsuffix .o,$(BINS))
- BINSRCS = $(addsuffix .c,$(BINS))
--VERSION := $(shell sh mk-version)
--RELEASE_VERSION := $(shell cat VERSION)
- 
- # The license of vpnc (Gpl >= 2) is quite likely incompatible with the
- # openssl license. Openssl is currently used to provide certificate
-@@ -50,11 +48,11 @@ RELEASE_VERSION := $(shell cat VERSION)
- #OPENSSL_GPL_VIOLATION = -DOPENSSL_GPL_VIOLATION
- #OPENSSLLIBS = -lcrypto
- 
--CC=gcc
-+CC ?= gcc
- CFLAGS ?= -O3 -g
- CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
- CFLAGS +=  $(shell libgcrypt-config --cflags)
--CPPFLAGS += -DVERSION=\"$(VERSION)\" $(OPENSSL_GPL_VIOLATION)
-+CPPFLAGS += $(OPENSSL_GPL_VIOLATION)
- LDFLAGS ?= -g
- LDFLAGS += $(shell libgcrypt-config --libs) $(OPENSSLLIBS)
- 
-@@ -81,7 +79,7 @@ cisco-decrypt : cisco-decrypt.o decrypt-utils.o
- 	$(CC) -o $@ $^ $(LDFLAGS)
- 
- .depend: $(SRCS) $(BINSRCS)
--	$(CC) -MM $(SRCS) $(BINSRCS) $(CFLAGS) $(CPPFLAGS) > $@
-+	$(CC) -MM $(SRCS) $(BINSRCS) $(CPPFLAGS) $(CFLAGS) > $@
- 
- vpnc-debug.c vpnc-debug.h : isakmp.h enum2debug.pl
- 	LC_ALL=C perl -w ./enum2debug.pl isakmp.h >vpnc-debug.c 2>vpnc-debug.h
--- 
-2.6.4
-
diff --git a/package/vpnc/0002-Don-t-build-manpages.patch b/package/vpnc/0002-Don-t-build-manpages.patch
deleted file mode 100644
index be4414e..0000000
--- a/package/vpnc/0002-Don-t-build-manpages.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6bbd03ec8928fd2a3056fc55ee48900fc88d3061 Mon Sep 17 00:00:00 2001
-From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
-Date: Mon, 8 Feb 2016 23:03:48 +0100
-Subject: [PATCH] Don't build manpages
-
-Patch originally from Ulf Samuelsson <ulf.samuelsson@atmel.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 1ca6459..857bf8d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -70,7 +70,10 @@ vpnc : $(OBJS) vpnc.o
- 	$(CC) -o $@ $^ $(LDFLAGS)
- 
- vpnc.8 : vpnc.8.template makeman.pl vpnc
--	./makeman.pl
-+	@echo "Cannot make manual when cross compiling"
-+	touch $@
-+
-+#	./makeman.pl
- 
- vpnc-script : vpnc-script.in
- 	sed -e 's,@''PREFIX''@,$(PREFIX),g' $< > $@ && chmod 755 $@
--- 
-2.6.4
-
diff --git a/package/vpnc/0002-Makefile-allow-to-override-the-version.patch b/package/vpnc/0002-Makefile-allow-to-override-the-version.patch
new file mode 100644
index 0000000..8be8847
--- /dev/null
+++ b/package/vpnc/0002-Makefile-allow-to-override-the-version.patch
@@ -0,0 +1,42 @@
+From 8b035de4867db4fb8da41298224d92bf5b18e86f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 10 Feb 2016 23:27:30 +0100
+Subject: [PATCH] Makefile: allow to override the version
+
+The mk-version script makes the assumption that the build process runs
+from a SVN checkout or a Git clone of the vpnc source code. However,
+this is not always the case, for example when you are building from a
+tarball, but inside a larger project that is versioned with Git.
+
+This is typically the case when building vpnc under a tool like
+Buildroot, or potentially other embedded Linux build system: the build
+system tool itself is versioned in Git, downloads tarballs of software
+components and builds them.
+
+In order to support such situations, this commit adjusts the Makefile
+to allow the VERSION variable to be overriden from the make command
+line.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f9a6781..e80ef17 100644
+--- a/Makefile
++++ b/Makefile
+@@ -57,7 +57,7 @@ OBJS = $(addsuffix .o,$(basename $(SRCS)))
+ CRYPTO_OBJS = $(addsuffix .o,$(basename $(CRYPTO_SRCS)))
+ BINOBJS = $(addsuffix .o,$(BINS))
+ BINSRCS = $(addsuffix .c,$(BINS))
+-VERSION := $(shell sh mk-version)
++VERSION ?= $(shell sh mk-version)
+ RELEASE_VERSION := $(shell cat VERSION)
+ 
+ CC ?= gcc
+-- 
+2.6.4
+
diff --git a/package/vpnc/0003-Makefile-allow-passing-custom-CFLAGS-CPPFLAGS.patch b/package/vpnc/0003-Makefile-allow-passing-custom-CFLAGS-CPPFLAGS.patch
new file mode 100644
index 0000000..f688f70
--- /dev/null
+++ b/package/vpnc/0003-Makefile-allow-passing-custom-CFLAGS-CPPFLAGS.patch
@@ -0,0 +1,46 @@
+From 014a8e04a0fa775b2ade78e5f7655a1453375884 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 10 Feb 2016 23:31:12 +0100
+Subject: [PATCH] Makefile: allow passing custom CFLAGS/CPPFLAGS
+
+vpnc's Makefile specifies some CFLAGS and CPPFLAGS value, but it may
+be needed to pass additional custom flags on the make command line. To
+make this possible, we switch from a plain += operator to the
+"override ... +=" operator.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e80ef17..7ac225a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -62,9 +62,9 @@ RELEASE_VERSION := $(shell cat VERSION)
+ 
+ CC ?= gcc
+ CFLAGS ?= -O3 -g
+-CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
+-CFLAGS +=  $(shell libgcrypt-config --cflags) $(CRYPTO_CFLAGS)
+-CPPFLAGS += -DVERSION=\"$(VERSION)\"
++override CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
++override CFLAGS +=  $(shell libgcrypt-config --cflags) $(CRYPTO_CFLAGS)
++override CPPFLAGS += -DVERSION=\"$(VERSION)\"
+ LDFLAGS ?= -g
+ LIBS += $(shell libgcrypt-config --libs) $(CRYPTO_LDADD)
+ 
+@@ -73,7 +73,7 @@ LIBS += -lnsl -lresolv -lsocket
+ endif
+ ifneq (,$(findstring Apple,$(shell $(CC) --version)))
+ # enabled in FSF GCC, disabled by default in Apple GCC
+-CFLAGS += -fstrict-aliasing -freorder-blocks -fsched-interblock
++override CFLAGS += -fstrict-aliasing -freorder-blocks -fsched-interblock
+ endif
+ 
+ all : $(BINS) vpnc.8
+-- 
+2.6.4
+
diff --git a/package/vpnc/0004-Makefile-provide-an-option-to-not-build-manpages.patch b/package/vpnc/0004-Makefile-provide-an-option-to-not-build-manpages.patch
new file mode 100644
index 0000000..7f71cdd
--- /dev/null
+++ b/package/vpnc/0004-Makefile-provide-an-option-to-not-build-manpages.patch
@@ -0,0 +1,58 @@
+From 3c16d0b7bf809a56affd6e1a4c0998027968b91a Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Mon, 8 Feb 2016 23:03:48 +0100
+Subject: [PATCH] Makefile: provide an option to not build manpages
+
+The process of generating the vpnc.8 man page consists in running the
+vpnc tool itself, and parse its --long-help output. While this is
+perfectly fine when building natively, it fails completely when
+cross-compiling: the vpnc binary that was built cannot be executed on
+the build machine.
+
+In order to support such situations with minimal changes, this patch
+adjusts the Makefile to make it understand a MANS variable. By
+default, it's defined to "vpnc.8", which means the manpage continues
+to be built as usual. However, if it's overriden to be empty, then no
+manpage is built.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7ac225a..ea2cd41 100644
+--- a/Makefile
++++ b/Makefile
+@@ -54,6 +54,7 @@ endif
+ SRCS = sysdep.c vpnc-debug.c isakmp-pkt.c tunip.c config.c dh.c math_group.c supp.c decrypt-utils.c crypto.c $(CRYPTO_SRCS)
+ BINS = vpnc cisco-decrypt test-crypto
+ OBJS = $(addsuffix .o,$(basename $(SRCS)))
++MANS ?= vpnc.8
+ CRYPTO_OBJS = $(addsuffix .o,$(basename $(CRYPTO_SRCS)))
+ BINOBJS = $(addsuffix .o,$(BINS))
+ BINSRCS = $(addsuffix .c,$(BINS))
+@@ -76,7 +77,7 @@ ifneq (,$(findstring Apple,$(shell $(CC) --version)))
+ override CFLAGS += -fstrict-aliasing -freorder-blocks -fsched-interblock
+ endif
+ 
+-all : $(BINS) vpnc.8
++all : $(BINS) $(MANS)
+ 
+ vpnc : $(OBJS) vpnc.o
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+@@ -136,7 +137,9 @@ install-common: all
+ 	install -m600 vpnc.conf $(DESTDIR)$(ETCDIR)/default.conf
+ 	install -m755 vpnc-disconnect $(DESTDIR)$(SBINDIR)
+ 	install -m755 pcf2vpnc $(DESTDIR)$(BINDIR)
++ifneq ($(MANS),)
+ 	install -m644 vpnc.8 $(DESTDIR)$(MANDIR)/man8
++endif
+ 	install -m644 pcf2vpnc.1 $(DESTDIR)$(MANDIR)/man1
+ 	install -m644 cisco-decrypt.1 $(DESTDIR)$(MANDIR)/man1
+ 	install -m644 COPYING $(DESTDIR)$(DOCDIR)
+-- 
+2.6.4
+
diff --git a/package/vpnc/0005-Makefile-allow-passing-a-custom-path-to-libgcrypt-co.patch b/package/vpnc/0005-Makefile-allow-passing-a-custom-path-to-libgcrypt-co.patch
new file mode 100644
index 0000000..3148980
--- /dev/null
+++ b/package/vpnc/0005-Makefile-allow-passing-a-custom-path-to-libgcrypt-co.patch
@@ -0,0 +1,41 @@
+From 6180ca780e3a792bd632d8899c2b35991822c93d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 8 Feb 2016 23:32:57 +0100
+Subject: [PATCH] Makefile: allow passing a custom path to libgcrypt-config
+
+The libgcrypt-config program may not be in the PATH, so this patch
+adjusts the Makefile so that it understands a LIBGCRYPT_CONFIG
+variable. By default, its value is libgcrypt-config so that the
+behavior is unchanged.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ea2cd41..649ddfb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -61,13 +61,14 @@ BINSRCS = $(addsuffix .c,$(BINS))
+ VERSION ?= $(shell sh mk-version)
+ RELEASE_VERSION := $(shell cat VERSION)
+ 
++LIBGCRYPT_CONFIG ?= libgcrypt-config
+ CC ?= gcc
+ CFLAGS ?= -O3 -g
+ override CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
+-override CFLAGS +=  $(shell libgcrypt-config --cflags) $(CRYPTO_CFLAGS)
++override CFLAGS +=  $(shell $(LIBGCRYPT_CONFIG) --cflags) $(CRYPTO_CFLAGS)
+ override CPPFLAGS += -DVERSION=\"$(VERSION)\"
+ LDFLAGS ?= -g
+-LIBS += $(shell libgcrypt-config --libs) $(CRYPTO_LDADD)
++LIBS += $(shell $(LIBGCRYPT_CONFIG) --libs) $(CRYPTO_LDADD)
+ 
+ ifeq ($(shell uname -s), SunOS)
+ LIBS += -lnsl -lresolv -lsocket
+-- 
+2.6.4
+
diff --git a/package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch b/package/vpnc/0006-config.c-Replace-deprecated-SUSv3-functions-with-POS.patch
similarity index 53%
rename from package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch
rename to package/vpnc/0006-config.c-Replace-deprecated-SUSv3-functions-with-POS.patch
index 4b8446f..bad8118 100644
--- a/package/vpnc/0003-Replace-deprecated-SUSv3-functions-with-POSIX-equiva.patch
+++ b/package/vpnc/0006-config.c-Replace-deprecated-SUSv3-functions-with-POS.patch
@@ -1,27 +1,32 @@
-From ca1a9ad59ae07345720e315b928bb014a8aeea4c Mon Sep 17 00:00:00 2001
+From 627a45d88acf236cb36326919e4a2fa975c688bd Mon Sep 17 00:00:00 2001
 From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
 Date: Mon, 8 Feb 2016 23:05:23 +0100
-Subject: [PATCH] Replace deprecated SUSv3 functions with POSIX equivalents
+Subject: [PATCH] config.c: Replace deprecated SUSv3 functions with POSIX
+ equivalents
 
 Replace the deprecated SUSv3 function index() by its POSIX equivalent
-strchr().
+strchr(). This is necessary to successfully build vpnc with uClibc,
+when SUSv3 compatibility functions are not compiled in.
 
 Patch originally from Bernhard Reutner-Fischer
 <rep.dot.nop@gmail.com>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- config.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ config.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/config.c b/config.c
-index bdd0833..d1750ca 100644
+index 57778e3..11b363b 100644
 --- a/config.c
 +++ b/config.c
-@@ -456,7 +456,7 @@ static char *get_config_filename(const char *name, int add_dot_conf)
+@@ -657,8 +657,7 @@ static const struct config_names_s {
+ static char *get_config_filename(const char *name, int add_dot_conf)
  {
  	char *realname;
- 	
+-
 -	asprintf(&realname, "%s%s%s", index(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
 +	asprintf(&realname, "%s%s%s", strchr(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
  	return realname;
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index bc27331..caf8c20 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_GNUTLS
 	help
 	  Client for Cisco VPN concentrator
 	  3000 Series VPN Concentrator
@@ -11,3 +13,7 @@ config BR2_PACKAGE_VPNC
 	  Juniper/Netscreen
 
 	  http://www.unix-ag.uni-kl.de/~massar/vpnc
+
+commit "vpnc needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
index 3474057..c35f0d5 100644
--- a/package/vpnc/vpnc.hash
+++ b/package/vpnc/vpnc.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 925c8e879f78f1d575b69ee3868b886a0139926ea84c2138a89b9b7d8696f50a vpnc-70f1211f6f26e87e374d66f9a986e855215b8e3e.tar.gz
+sha256 d71ae6a6c2801c6c21490227d29896ea75deade05fc38153de9ae07b25a6a60d  vpnc-024aa17a0a86716cac0db185b44bf07ba4f8c135.tar.gz
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 5dfc2ba..62dedc6 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,24 +4,23 @@
 #
 ################################################################################
 
-VPNC_VERSION = 70f1211f6f26e87e374d66f9a986e855215b8e3e
+VPNC_VERSION = 024aa17a0a86716cac0db185b44bf07ba4f8c135
 VPNC_SITE = $(call github,ndpgroup,vpnc,$(VPNC_VERSION))
 VPNC_LICENSE = GPLv2+
 VPNC_LICENSE_FILES = COPYING
 
-VPNC_DEPENDENCIES = libgcrypt libgpg-error
-
-VPNC_LDFLAGS = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
-VPNC_CPPFLAGS = -DVERSION=\\\"$(VPNC_VERSION)\\\"
+VPNC_DEPENDENCIES = libgcrypt libgpg-error gnutls host-pkgconf
 
 define VPNC_BUILD_CMDS
-	$(MAKE)	-C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		CPPFLAGS="$(VPNC_CPPFLAGS)" LDFLAGS="$(VPNC_LDFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
+		VERSION=$(VPNC_VERSION) MANS=
 endef
 
 define VPNC_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) \
-		CPPFLAGS="$(VPNC_CPPFLAGS)" LDFLAGS="$(VPNC_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) \
+		VERSION=$(VPNC_VERSION) MANS= \
 		DESTDIR="$(TARGET_DIR)" PREFIX=/usr
 endef
 
-- 
2.6.4
