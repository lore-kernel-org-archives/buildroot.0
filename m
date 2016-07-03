From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:45 +0200
Subject: [Buildroot] [PATCH v3 09/14] toolchain/toolchain-external: enable
	fortran check when it is selected
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-10-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none

changes v2->v3:
- remove CFLAGS in the check call (Thomas P.)
---
 toolchain/toolchain-external/toolchain-external.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 342bc84..4240a9b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -160,6 +160,7 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
@@ -521,6 +522,9 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
+	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
+		$(call check_fortran,$(TOOLCHAIN_EXTERNAL_FC)) ; \
+	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
 	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
@@ -796,4 +800,3 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
-- 
2.9.0
