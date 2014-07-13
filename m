From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 13 Jul 2014 20:46:00 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain-external: fix Sourcery Codebench
	symlink
In-Reply-To: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
References: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1405277160-4686-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the Sourcery Codebench standard edition, the sysroot returned
point to a non existant directory if no CFLAGS is specified.

When copying external toolchain sysroot to staging, we need to
create the symbolic link that matches the name of the subdirectory
for the architecture variant in the original sysroot (ie: sgxx-glibc)

To do that, SYSROOT_DIR must be different than ARCH_SYSROOT_DIR.
So, set SYSROOT_DIR deduced from ARCH_SYSROOT_DIR  by removing
arch specific part at the end of the path.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/toolchain-external.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f6e51a1..212fbc9 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -555,6 +555,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 		exit 1 ; \
 	fi ; \
 	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	if test ! -d "$${SYSROOT_DIR}"  ; then \
+		SYSROOT_DIR=$$(echo -n "$${ARCH_SYSROOT_DIR}" | sed -r 's:(/libc/)([^&]*):\1:') ; \
+	fi ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	SUPPORT_LIB_DIR="" ; \
 	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-- 
1.9.3
