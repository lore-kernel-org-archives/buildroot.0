From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:05:42 +0100
Subject: [Buildroot] [git commit] lttng-libust: bump to version 2.8.1
Message-ID: <20161101142532.02DAB8172B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=006c7ab5c45e3fc42729dbe242a0418fb8133c82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The two current patches are removed because they were merged upstream.

The new patch is needed to build with uClibc. It was also submitted
upstream, but not merged as is yet. Defining NT_GNU_BUILD_ID to 3 when
it's not defined seems like it's something done in other projects. This
definition's value should never change (number of the build ID note
section in ELF objects).

LTTng-UST now has its man pages written in AsciiDoc and they get
converted to troff at build time. This is not needed in a Buildroot
image anyway.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch | 34 ++++++++++++++++++++++
 package/lttng-libust/lttng-libust.hash             | 10 +++----
 package/lttng-libust/lttng-libust.mk               |  8 ++---
 3 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
new file mode 100644
index 0000000..2e0c8b1
--- /dev/null
+++ b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
@@ -0,0 +1,34 @@
+From d400314757a8d5d52bd5722d263bfd5886bb6595 Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Sat, 29 Oct 2016 13:32:57 -0400
+Subject: [PATCH] lttng-ust-elf.c: define NT_GNU_BUILD_ID if not defined
+
+On uClibc, NT_GNU_BUILD_ID is not defined, so we define it
+manually in this case.
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: grabbed from this pull request:
+    https://github.com/lttng/lttng-ust/pull/39
+]
+---
+ liblttng-ust/lttng-ust-elf.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/liblttng-ust/lttng-ust-elf.c b/liblttng-ust/lttng-ust-elf.c
+index 5f27920..beaa7f3 100644
+--- a/liblttng-ust/lttng-ust-elf.c
++++ b/liblttng-ust/lttng-ust-elf.c
+@@ -29,6 +29,10 @@
+
+ #define BUF_LEN	4096
+
++#ifndef NT_GNU_BUILD_ID
++# define NT_GNU_BUILD_ID	3
++#endif
++
+ /*
+  * Retrieve the nth (where n is the `index` argument) phdr (program
+  * header) from the given elf instance.
+--
+2.9.3
+
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 1494acf..a4a2907 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,6 +1,6 @@
-# http://www.lttng.org/files/lttng-ust/lttng-ust-2.7.1.tar.bz2.sha1
-sha1  597ebecb885debb58c263de57f30b1096d4eefc6  lttng-ust-2.7.1.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.8.1.tar.bz2.{md5,sha1}
+md5     be505077245dc05f93370a565eec15f4  lttng-ust-2.8.1.tar.bz2
+sha1    8bebdcbcb453d2643fb226dbe92de61764f1ee3b  lttng-ust-2.8.1.tar.bz2
 
-# Locally computed
-sha1  2e79c98e458b2e052930fb81441e6ca8377a2ed7 787364e8bac9a146f9d65c763633c2b75eb76463.patch
-sha1  cf77ec415111f77573be7917d9b62d8e49dc6304 30307a67b48641875b122d8f832bbfb454e95d92.patch
+# Locally generated
+sha256  6e41349107e83e7b43c69ed358e48788ca2fd095bad61737b850e3f3d2c0508a  lttng-ust-2.8.1.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 61ffed4..feeeb43 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,17 +5,13 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.7.1
+LTTNG_LIBUST_VERSION = 2.8.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-
-LTTNG_LIBUST_PATCH = \
-	https://github.com/lttng/lttng-ust/commit/787364e8bac9a146f9d65c763633c2b75eb76463.patch \
-	https://github.com/lttng/lttng-ust/commit/30307a67b48641875b122d8f832bbfb454e95d92.patch
-
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
+LTTNG_LIBUST_CONF_OPTS += --disable-man-pages
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
