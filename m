From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 12:28:11 +0200
Subject: [Buildroot] [git commit] uclibc-ng: fix parallel build issue for
	arm/xtensa when LOCALE support is enabled
Message-ID: <20150630102816.80FD5807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6b339dc8db6418de12e2eb437ba21c1679cb8ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch should fix any parallel build issues found
by autobuilder lately, f.e.:
http://autobuild.buildroot.net/results/43dd5c5da0d003b654fd252c989d49c2e5872827/
http://autobuild.buildroot.net/results/cfb438f933ff7385d612d65798b0b8ed833a6476/
and many more.
Will be committed upstream, if autobuilders are working.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/1.0.3/0002-fix-parallel-build.patch |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/1.0.3/0002-fix-parallel-build.patch b/package/uclibc/1.0.3/0002-fix-parallel-build.patch
new file mode 100644
index 0000000..d7c3091
--- /dev/null
+++ b/package/uclibc/1.0.3/0002-fix-parallel-build.patch
@@ -0,0 +1,21 @@
+fix parallel build if UCLIBC_HAS_LOCALE is enabled for arm/xtensa
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
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
