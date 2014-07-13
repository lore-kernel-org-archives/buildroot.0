From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 13 Jul 2014 20:45:59 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain-external: handle a special case
	where glibc check needs TOOLCHAIN_EXTERNAL_CFLAGS
In-Reply-To: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
References: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1405277160-4686-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the Sourcery Codebench standard edition, the sysroot returned
point to a non existant directory if no CFLAGS are specified.

Add a test to use ARCH_SYSROOT_DIR for glibc check if SYSROOT_DIR is not a
directory.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/toolchain-external.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8280b84..f6e51a1 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -477,7 +477,11 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
 		$(call check_musl,$${SYSROOT_DIR}) ; \
 	else \
-		$(call check_glibc,$${SYSROOT_DIR}) ; \
+		if test -d "$${SYSROOT_DIR}"  ; then \
+			$(call check_glibc,$${SYSROOT_DIR}) ; \
+		else \
+			$(call check_glibc,$${ARCH_SYSROOT_DIR}) ; \
+		fi \
 	fi
 endef
 
-- 
1.9.3
