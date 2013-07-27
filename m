From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:41 +0200
Subject: [Buildroot] [git commit] uclibc/bfin: set the appropiate binfmt in
	the configuration
Message-ID: <20130727141206.701D19AC10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=806714a5d1701edf4040cb218ff82cd7d61b4b64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |   40 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index efe00a6..cbc2e56 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -148,6 +148,45 @@ endef
 endif # powerpc
 
 #
+# Blackfin definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),bfin)
+ifeq ($(BR2_BINFMT_FDPIC),y)
+define UCLIBC_BFIN_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FLAT,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_SHARED_FLAT,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_FORMAT_FDPIC_ELF,y,$(@D))
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+define UCLIBC_BFIN_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_FORMAT_FLAT,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_SHARED_FLAT,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FDPIC_ELF,$(@D))
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
+define UCLIBC_BFIN_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FLAT,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_FORMAT_FLAT_SEP_DATA,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_SHARED_FLAT,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FDPIC_ELF,$(@D))
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
+define UCLIBC_BFIN_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FLAT,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_FORMAT_SHARED_FLAT,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_FORMAT_FDPIC_ELF,$(@D))
+endef
+endif
+endif # bfin
+
+#
 # AVR32 definitions
 #
 
@@ -380,6 +419,7 @@ define UCLIBC_SETUP_DOT_CONFIG
 	$(UCLIBC_SPARC_TYPE_CONFIG)
 	$(UCLIBC_POWERPC_TYPE_CONFIG)
 	$(UCLIBC_AVR32_CONFIG)
+	$(UCLIBC_BFIN_CONFIG)
 	$(UCLIBC_X86_TYPE_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
 	$(UCLIBC_LARGEFILE_CONFIG)
