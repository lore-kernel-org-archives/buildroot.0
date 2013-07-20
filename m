From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:12 -0300
Subject: [Buildroot] [PATCH 6/9] uclibc/bfin: set the appropiate binfmt in
	the configuration
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

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
-- 
1.8.1.5
