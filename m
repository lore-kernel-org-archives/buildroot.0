From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 30 Jun 2015 05:39:18 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: fix parallel build issue for
 arm/xtensa when LOCALE support is enabled
Message-ID: <20150630033918.GA7376@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch should fix any parallel build issues found
by autobuilder lately, f.e.:
http://autobuild.buildroot.net/results/43dd5c5da0d003b654fd252c989d49c2e5872827/
http://autobuild.buildroot.net/results/cfb438f933ff7385d612d65798b0b8ed833a6476/
and many more.
Will be committed upstream, if autobuilders are working.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Locale/iconv support will be reworked in uClibc-ng 1.1.x.
---
 package/uclibc/1.0.3/0002-fix-parallel-build.patch |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/uclibc/1.0.3/0002-fix-parallel-build.patch

diff --git a/package/uclibc/1.0.3/0002-fix-parallel-build.patch b/package/uclibc/1.0.3/0002-fix-parallel-build.patch
new file mode 100644
index 0000000..f99a1e4
--- /dev/null
+++ b/package/uclibc/1.0.3/0002-fix-parallel-build.patch
@@ -0,0 +1,19 @@
+fix parallel build if UCLIBC_HAS_LOCALE is enabled for arm/xtensa
+ 
+diff -Nur uClibc-ng-1.0.3.orig/Makefile.in uClibc-ng-1.0.3/Makefile.in
+--- uClibc-ng-1.0.3.orig/Makefile.in	2015-06-13 20:26:56.000000000 +0200
++++ uClibc-ng-1.0.3/Makefile.in	2015-06-29 20:23:26.000000000 +0200
+@@ -183,11 +183,12 @@
+ headers-y += $(target-headers-sysdep)
+ 
+ headers: $(top_builddir)include/bits/uClibc_config.h | subdirs
++	$(Q)$(if $(UCLIBC_HAS_LOCALE),$(MAKE) -C extra/locale locale_headers)
++
+ subdirs: $(addprefix $(top_builddir),$(subdirs))
+ 
+ $(pregen-headers-y): $(headers_dep)
+ pregen: headers $(pregen-headers-y) $(headers_dep)
+-	$(Q)$(if $(UCLIBC_HAS_LOCALE),$(MAKE) -C extra/locale locale_headers)
+ 
+ $(top_builddir)include/bits/sysnum.h: $(top_srcdir)extra/scripts/gen_bits_syscall_h.sh | $(top_builddir)include/bits
+ 	@$(disp_gen)
-- 
1.7.10.4
