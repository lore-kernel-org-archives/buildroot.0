From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Sep 2015 11:10:03 +0100
Subject: [Buildroot] [PATCH] libselinux: use correct definition of ARCH
Message-ID: <1442398203-46701-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile of libselinux performs the following check:

ARCH := $(patsubst i%86,i386,$(shell uname -m))
ifneq (,$(filter i386,$(ARCH)))
TLSFLAGS += -mno-tls-direct-seg-refs
endif

Which means that if the host machine is an x86, then TLSFLAGS will
contain -mno-tls-direct-seg-refs. That command line option causes
libselinux to fail when building it for target architectures where the
compiler doesn't support that option, i.e. MIPS:

mips-img-linux-gnu-gcc: error: unrecognized command line option
?-mno-tls-direct-seg-refs?

So to fix that problem we can set the ARCH variable to $(KERNEL_ARCH),
and then append it to the LIBSELINUX_MAKE_OPTS.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libselinux/libselinux.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index e6a7c6b..d4b96c4 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -15,7 +15,8 @@ LIBSELINUX_INSTALL_STAGING = YES
 
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"
+	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
+	ARCH=$(KERNEL_ARCH)
 
 define LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
-- 
1.7.1
