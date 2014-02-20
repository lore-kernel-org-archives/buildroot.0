From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 14:32:50 +0100
Subject: [Buildroot] [PATCH] libsepol: fix static-only library build
Message-ID: <1392903170-8912-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that improves the libsepol build system to support
static-only library build.

Fixes:

  http://autobuild.buildroot.org/results/30c/30cb919d2bbf51bfdf0a83c618124d927d046a61/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libsepol/libsepol-01-support-static-only.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libsepol/libsepol-01-support-static-only.patch

diff --git a/package/libsepol/libsepol-01-support-static-only.patch b/package/libsepol/libsepol-01-support-static-only.patch
new file mode 100644
index 0000000..b974680
--- /dev/null
+++ b/package/libsepol/libsepol-01-support-static-only.patch
@@ -0,0 +1,44 @@
+Add support for static-only build
+
+Instead of unconditionally building shared libraries, this patch
+improves the libsepol build system with a "STATIC" variable, which
+when defined to some non-empty value, will disable the build of shared
+libraries. It allows to support cases where the target architecture
+does not have support for shared libraries.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile
+===================================================================
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -17,7 +17,12 @@
+ CFLAGS ?= -Werror -Wall -W -Wundef -Wshadow -Wmissing-noreturn -Wmissing-format-attribute
+ override CFLAGS += -I. -I../include -D_GNU_SOURCE
+ 
+-all: $(LIBA) $(LIBSO) $(LIBPC)
++ALL_TARGETS = $(LIBA) $(LIBPC)
++ifeq ($(STATIC),)
++ALL_TARGETS += $(LIBSO)
++endif
++
++all: $(ALL_TARGETS)
+ 
+ $(LIBA):  $(OBJS)
+ 	$(AR) rcs $@ $^
+@@ -39,11 +44,13 @@
+ install: all
+ 	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
+ 	install -m 644 $(LIBA) $(LIBDIR)
+-	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
+-	install -m 755 $(LIBSO) $(SHLIBDIR)
+ 	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
+ 	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
++ifeq ($(STATIC),)
++	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
++	install -m 755 $(LIBSO) $(SHLIBDIR)
+ 	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
++endif
+ 
+ relabel:
+ 	/sbin/restorecon $(SHLIBDIR)/$(LIBSO)
-- 
1.8.3.2
