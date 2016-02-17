From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 17 Feb 2016 17:07:54 +0000
Subject: [Buildroot] [PATCH 2/2] linux/linux.mk: add LD="$(TARGET_LD)" to
	LINUX_MAKE_FLAGS
In-Reply-To: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1455728874-47789-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Linux tools like perf use ld for linking instead of gcc, and that
may cause problems on certain architectures (MIPS, for instance) since
we don't use a wrapper for ld as we do for gcc and the call to the
linker may lack some necessary arguments (which would be included if we
were using a wrapper). The problem is explained in detail below.

perf defines the value of LD on its Makefile by doing this:

$(call allow-override,LD,$(CROSS_COMPILE)ld)

So, if we don't pass an LD variable to override its value it will set
the value using the content of the CROSS_COMPILE variable and the result
will be something like <arch>-linux-gnu-ld.

This works fine for all architectures (because the value will be the
same as the TARGET_LD variable) except for MIPS, because the value of
TARGET_LD when building for MIPS also contains the argument to set the
endianness.

Due to that, perf will fail to build for MIPS little endian because the
linker (ld) will not receive any argument to set the endianness and the
default one (-EB for big endian) will be used instead. The error looks
like this:

 LD    /br/output/build/perf-custom/fd/libapi-in.o
/br/output/host/usr/bin/mips-linux-gnu-ld:
/br/output/build/perf-custom/fd/array.o: compiled for a little endian
system and target is big endian

So in order to make sure that perf will call the linker as we want
(using the value of the TARGET_LD variable), we define an LD variable
which value is the same as TARGET_LD, and we add that variable to the
LINUX_MAKE_FLAGS one. Then, since the linux-tool-perf.mk file uses that
variable, the value of LD in the perf Makefile will be overriden with
ours and the problem will be fixed.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e20255..7f48155 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -79,6 +79,7 @@ LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	LD="$(TARGET_LD)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
-- 
2.4.10
