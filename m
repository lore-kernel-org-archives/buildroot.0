From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:15 +0200
Subject: [Buildroot] [PATCH v2 10/15] toolchain/toolchain-external: enable
	fortran check when it is selected
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-11-s.martin49@gmail.com>
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
---
 toolchain/toolchain-external/toolchain-external.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7f46234..53a7c7a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -160,6 +160,7 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
@@ -529,6 +530,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
+	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
+		$(call check_fortran,\
+			"$(TOOLCHAIN_EXTERNAL_FC) $(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
+	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
 	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
-- 
2.9.0
