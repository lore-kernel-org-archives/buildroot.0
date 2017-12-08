From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 17:48:13 +0100
Subject: [Buildroot] [git commit] kvmtool: bump to f77d646ba0
Message-ID: <20171208164101.5D3168293C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f20615b53e83d6263346cb038d59df8e8d6b2b74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream Commit:
2017-11-03 16:19:58 +0000
irq.h: fix compilation error due to missing bool type

The following patches were updated/removed.

- 0001-avoid-redefining-PAGE_SIZE.patch is removed, as
  it has been merged upstream as of commit 4095fac8

- 0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch is
  removed, as it has been merged upstream as of commit
  1cc05b24

- 0003-use-poll.h-instead-of-sys-poll.h.patch is removed,
  as it has been merged upstream as of commit 52c22e6e

- 0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
  is removed, as it has been merged upstream as of commit
  8f22adc4

- 0005-Fix-call-to-connect.patch is removed, as it has been
  merged upstream as of commit d77bd4f4

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 .../kvmtool/0001-avoid-redefining-PAGE_SIZE.patch  | 42 ----------
 ...6-kvm-cpu.c-don-t-include-asm-msr-index.h.patch | 58 --------------
 .../0003-use-poll.h-instead-of-sys-poll.h.patch    | 33 --------
 ...nd-use-C-library-provided-strlcpy-and-str.patch | 90 ----------------------
 package/kvmtool/0005-Fix-call-to-connect.patch     | 34 --------
 package/kvmtool/kvmtool.hash                       |  2 +-
 package/kvmtool/kvmtool.mk                         | 19 +----
 8 files changed, 3 insertions(+), 276 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e9c8a6b..2782627 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1093,6 +1093,7 @@ F:	package/iperf3/
 F:	package/iputils/
 F:	package/iw/
 F:	package/kvm-unit-tests/
+F:	package/kvmtool/
 F:	package/libcsv/
 F:	package/libcurl/
 F:	package/libfcgi/
diff --git a/package/kvmtool/0001-avoid-redefining-PAGE_SIZE.patch b/package/kvmtool/0001-avoid-redefining-PAGE_SIZE.patch
deleted file mode 100644
index ed3370c..0000000
--- a/package/kvmtool/0001-avoid-redefining-PAGE_SIZE.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bec1b0ced72dc0d49825d6b69d09296d13fd0af3 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Tue, 21 Jul 2015 10:58:46 +0100
-Subject: [PATCH] avoid redefining PAGE_SIZE
-
-PAGE_SIZE may have been defined by the C libary (musl-libc does that).
-So avoid redefining it here unconditionally, instead only use our
-definition if none has been provided by the libc.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Signed-off-by: Will Deacon <will.deacon@arm.com>
-[backport from upstream commit 4095fac878f618ae5e7384a1dc65ee34b6e05217.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/kvm/kvm.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/kvm/kvm.h b/include/kvm/kvm.h
-index 754e029..37155db 100644
---- a/include/kvm/kvm.h
-+++ b/include/kvm/kvm.h
-@@ -11,6 +11,7 @@
- #include <time.h>
- #include <signal.h>
- #include <sys/prctl.h>
-+#include <limits.h>
- 
- #define SIGKVMEXIT		(SIGRTMIN + 0)
- #define SIGKVMPAUSE		(SIGRTMIN + 1)
-@@ -19,7 +20,9 @@
- #define HOME_DIR		getenv("HOME")
- #define KVM_BINARY_NAME		"lkvm"
- 
-+#ifndef PAGE_SIZE
- #define PAGE_SIZE (sysconf(_SC_PAGE_SIZE))
-+#endif
- 
- #define DEFINE_KVM_EXT(ext)		\
- 	.name = #ext,			\
--- 
-2.9.4
-
diff --git a/package/kvmtool/0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch b/package/kvmtool/0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch
deleted file mode 100644
index 842c131..0000000
--- a/package/kvmtool/0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From ce9abb649165aca728e4645ce09e7bb77e684b06 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 19 Aug 2017 16:35:59 +0200
-Subject: [PATCH] x86/kvm-cpu.c: don't include <asm/msr-index.h>
-
-Since kernel commit 25dc1d6cc3082aab293e5dad47623b550f7ddd2a ("x86:
-stop exporting msr-index.h to userland"), <asm/msr-index.h> is no
-longer exported to userspace. Therefore, any toolchain built with
-kernel headers >= 4.12 will no longer have this header file, causing a
-build failure in kvmtool.
-
-As a replacement, this patch includes inside x86/kvm-cpu.c the
-necessary MSR_* definitions.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://patchwork.kernel.org/patch/9910687/
----
- x86/kvm-cpu.c | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/x86/kvm-cpu.c b/x86/kvm-cpu.c
-index 5cc4e1e..b02ff65 100644
---- a/x86/kvm-cpu.c
-+++ b/x86/kvm-cpu.c
-@@ -4,7 +4,6 @@
- #include "kvm/util.h"
- #include "kvm/kvm.h"
- 
--#include <asm/msr-index.h>
- #include <asm/apicdef.h>
- #include <linux/err.h>
- #include <sys/ioctl.h>
-@@ -136,6 +135,22 @@ static struct kvm_msrs *kvm_msrs__new(size_t nmsrs)
- 	return vcpu;
- }
- 
-+#define MSR_IA32_SYSENTER_CS            0x00000174
-+#define MSR_IA32_SYSENTER_ESP           0x00000175
-+#define MSR_IA32_SYSENTER_EIP           0x00000176
-+
-+#define MSR_STAR                0xc0000081 /* legacy mode SYSCALL target */
-+#define MSR_LSTAR               0xc0000082 /* long mode SYSCALL target */
-+#define MSR_CSTAR               0xc0000083 /* compat mode SYSCALL target */
-+#define MSR_SYSCALL_MASK        0xc0000084 /* EFLAGS mask for syscall */
-+#define MSR_KERNEL_GS_BASE      0xc0000102 /* SwapGS GS shadow */
-+
-+#define MSR_IA32_TSC                    0x00000010
-+#define MSR_IA32_MISC_ENABLE            0x000001a0
-+
-+#define MSR_IA32_MISC_ENABLE_FAST_STRING_BIT            0
-+#define MSR_IA32_MISC_ENABLE_FAST_STRING                (1ULL << MSR_IA32_MISC_ENABLE_FAST_STRING_BIT)
-+
- #define KVM_MSR_ENTRY(_index, _data)	\
- 	(struct kvm_msr_entry) { .index = _index, .data = _data }
- 
--- 
-2.9.4
-
diff --git a/package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch b/package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index a358569..0000000
--- a/package/kvmtool/0003-use-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 19490e24895df95253e43a7aacf3ef408b830bd5 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Fri, 17 Jul 2015 17:02:15 +0100
-Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
-
-The manpage of poll(2) states that the prototype of poll is defined
-in <poll.h>. Use that header file instead of <sys/poll.h> to allow
-compilation against musl-libc.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Signed-off-by: Will Deacon <will.deacon@arm.com>
-[backport from upstream commit 52c22e6e64a94cc701d86587d32cd3822ac5c293.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- disk/core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/disk/core.c b/disk/core.c
-index 309e16c..dd2f258 100644
---- a/disk/core.c
-+++ b/disk/core.c
-@@ -5,7 +5,7 @@
- 
- #include <linux/err.h>
- #include <sys/eventfd.h>
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #define AIO_MAX 256
- 
--- 
-2.9.4
-
diff --git a/package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch b/package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
deleted file mode 100644
index d0591b9..0000000
--- a/package/kvmtool/0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 7a9c16dcf58ff4c8154f3a9dfa1f02ec3daa1662 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Fri, 17 Jul 2015 17:02:16 +0100
-Subject: [PATCH] check for and use C library provided strlcpy and strlcat
-
-The musl-libc library provides implementations of strlcpy and strlcat,
-so introduce a feature check for it and only use the kvmtool
-implementation if there is no library support for it.
-This avoids clashes with the public definition.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Signed-off-by: Will Deacon <will.deacon@arm.com>
-[backport from upstream commit 8f22adc4230f07980a318ad1662fba5af0c131c1.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile                 |  5 +++++
- config/feature-tests.mak | 10 ++++++++++
- include/kvm/strbuf.h     |  2 ++
- util/strbuf.c            |  2 ++
- 4 files changed, 19 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 151fa9d..bf71db4 100644
---- a/Makefile
-+++ b/Makefile
-@@ -199,6 +199,11 @@ endif
- # On a given system, some libs may link statically, some may not; so, check
- # both and only build those that link!
- 
-+ifeq ($(call try-build,$(SOURCE_STRLCPY),$(CFLAGS),),y)
-+	CFLAGS_DYNOPT	+= -DHAVE_STRLCPY
-+	CFLAGS_STATOPT	+= -DHAVE_STRLCPY
-+endif
-+
- ifeq ($(call try-build,$(SOURCE_BFD),$(CFLAGS),-lbfd -static),y)
- 	CFLAGS_STATOPT	+= -DCONFIG_HAS_BFD
- 	OBJS_STATOPT	+= symbol.o
-diff --git a/config/feature-tests.mak b/config/feature-tests.mak
-index 6bee6c2..03cdb42 100644
---- a/config/feature-tests.mak
-+++ b/config/feature-tests.mak
-@@ -196,3 +196,13 @@ int main(void)
- 	return 0;
- }
- endef
-+
-+define SOURCE_STRLCPY
-+#include <string.h>
-+
-+int main(void)
-+{
-+	strlcpy(NULL, NULL, 0);
-+	return 0;
-+}
-+endef
-diff --git a/include/kvm/strbuf.h b/include/kvm/strbuf.h
-index 2beefbc..7657339 100644
---- a/include/kvm/strbuf.h
-+++ b/include/kvm/strbuf.h
-@@ -6,8 +6,10 @@
- 
- int prefixcmp(const char *str, const char *prefix);
- 
-+#ifndef HAVE_STRLCPY
- extern size_t strlcat(char *dest, const char *src, size_t count);
- extern size_t strlcpy(char *dest, const char *src, size_t size);
-+#endif
- 
- /* some inline functions */
- 
-diff --git a/util/strbuf.c b/util/strbuf.c
-index 99d6b0c..2c6e8ad 100644
---- a/util/strbuf.c
-+++ b/util/strbuf.c
-@@ -13,6 +13,7 @@ int prefixcmp(const char *str, const char *prefix)
- 	}
- }
- 
-+#ifndef HAVE_STRLCPY
- /**
-  * strlcat - Append a length-limited, %NUL-terminated string to another
-  * @dest: The string to be appended to
-@@ -60,3 +61,4 @@ size_t strlcpy(char *dest, const char *src, size_t size)
- 	}
- 	return ret;
- }
-+#endif
--- 
-2.9.4
-
diff --git a/package/kvmtool/0005-Fix-call-to-connect.patch b/package/kvmtool/0005-Fix-call-to-connect.patch
deleted file mode 100644
index 434ca34..0000000
--- a/package/kvmtool/0005-Fix-call-to-connect.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d375235f49184371026791ae8f6f9dc307de8a61 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Fri, 17 Jul 2015 17:02:14 +0100
-Subject: [PATCH] Fix call to connect()
-
-According to the manpage and the prototype the second argument to
-connect(2) is a "const struct sockaddr*", so cast our protocol
-specific type back to the super type.
-This fixes compilation on musl-libc.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Signed-off-by: Will Deacon <will.deacon@arm.com>
-[backport from upstream commit d77bd4f466f341d4b35fe8b91176ef8a37160e19.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- kvm-ipc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/kvm-ipc.c b/kvm-ipc.c
-index b1c43dd..5a0b6e0 100644
---- a/kvm-ipc.c
-+++ b/kvm-ipc.c
-@@ -99,7 +99,7 @@ int kvm__get_sock_by_instance(const char *name)
- 	strlcpy(local.sun_path, sock_file, sizeof(local.sun_path));
- 	len = strlen(local.sun_path) + sizeof(local.sun_family);
- 
--	r = connect(s, &local, len);
-+	r = connect(s, (struct sockaddr *)&local, len);
- 	if (r < 0 && errno == ECONNREFUSED) {
- 		/* Tell the user clean ghost socket file */
- 		pr_err("\"%s\" could be a ghost socket file, please remove it",
--- 
-2.9.4
-
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index 657fdb3..4282773 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5633d8dd1542996108bf9b75c9f2cf6bf13fb27bfd453ec250b3e5405e85f6ac  kvmtool-bed2bd9e1fbef5819090feeada7b86eed97ca5e2.tar.gz
+sha256 2d55e4521ac040b870db015e1f075d69b89f940242d7ce5708f7d7060d62c0cc  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e.tar.gz
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 2789a6e..5894e47 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVMTOOL_VERSION = bed2bd9e1fbef5819090feeada7b86eed97ca5e2
+KVMTOOL_VERSION = f77d646ba01d04be5aad9449ac00719c043fe36e
 KVMTOOL_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/will/kvmtool.git
 KVMTOOL_SITE_METHOD = git
 KVMTOOL_DEPENDENCIES = \
@@ -18,23 +18,6 @@ KVMTOOL_DEPENDENCIES = \
 KVMTOOL_LICENSE = GPL-2.0
 KVMTOOL_LICENSE_FILES = COPYING
 
-# This is required to convert a static binary (init helper) back into
-# object-file format, and in multilib toolchains like CS 2012.09 for x86
-# the default is i386, hence when building for x86_64 things break since
-# LD doesn't autodetect the input file format.
-# GCC-as-linker can't accomplish this feat easily either since it's mixing
-# static content (guest_init.o) with dynamic one (lkvm) making
-# a relocatable output file.
-# The purpose of this trick is to embed the init helper into the main
-# binary to help users in guest system startup, which would otherwise
-# require more complex guest images.
-# This needs revisiting if/when X32 ABI support is added.
-#
-# If more packages need this (unlikely) an ld wrapper might be a better
-# solution, using gcc -dumpspecs information.
-KVMTOOL_EXTRA_LDFLAGS = \
-	$(if $(BR2_x86_64),-m elf_x86_64)
-
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
