From: blunderer at blunderer.org <blunderer@blunderer.org>
Date: Sat,  1 Feb 2014 15:07:43 -0800
Subject: [Buildroot] [PATCH v2] libroxml: bump version to 2.3.0
In-Reply-To: <1391189802-5284-1-git-send-email-blunderer@blunderer.org>
References: <1391189802-5284-1-git-send-email-blunderer@blunderer.org>
Message-ID: <1391296063-10950-1-git-send-email-blunderer@blunderer.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tristan Lelong <tristan.lelong@blunderer.org>

Starting with version 2.3.0, libroxml is now using autotools.
With autotools, the -Werror flag was dropped
	-> no need for the patch libroxml-0001-werror.patch
With autotools, the availability of -Wno-*-unused is auto detected
	-> no need for the patch libroxml-0002-wno-unused-result.patch

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
---
 package/libroxml/libroxml-0001-werror.patch        | 22 --------------------
 .../libroxml/libroxml-0002-wno-unused-result.patch | 21 -------------------
 package/libroxml/libroxml.mk                       | 24 +++++-----------------
 3 files changed, 5 insertions(+), 62 deletions(-)
 delete mode 100644 package/libroxml/libroxml-0001-werror.patch
 delete mode 100644 package/libroxml/libroxml-0002-wno-unused-result.patch

diff --git a/package/libroxml/libroxml-0001-werror.patch b/package/libroxml/libroxml-0001-werror.patch
deleted file mode 100644
index 91f322c..0000000
--- a/package/libroxml/libroxml-0001-werror.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] remove -Werror from CFLAGS
-
--Werror should only be used during development, not in released SW.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: a/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -46,7 +46,7 @@
- 
- # options
- override CPPFLAGS += -Iinc/
--override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Werror -Iinc/ $(DEFINES)
-+override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Iinc/ $(DEFINES)
- override LDFLAGS += 
- 
- ifeq ("$(OS)", "Darwin")
diff --git a/package/libroxml/libroxml-0002-wno-unused-result.patch b/package/libroxml/libroxml-0002-wno-unused-result.patch
deleted file mode 100644
index 406bf3c..0000000
--- a/package/libroxml/libroxml-0002-wno-unused-result.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-The -Wno-unused-result option is not understood by the version of gcc used by the
-avr32 toolchain. Remove the option from the compilation flags.
-
-Fixes build failures such as the following.
-
-  http://autobuild.buildroot.net/results/e22/e22d94fca3eabb4e54d82af04319f17ad8e10c20/
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/Makefile b/Makefile
---- a/Makefile	2013-11-21 17:13:17.679388374 +0000
-+++ b/Makefile	2013-11-21 17:13:35.219299157 +0000
-@@ -46,7 +46,7 @@ DEFINES = -DIGNORE_EMPTY_TEXT_NODES
- 
- # options
- override CPPFLAGS += -Iinc/
--override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Iinc/ $(DEFINES)
-+override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Iinc/ $(DEFINES)
- override LDFLAGS += 
- 
- ifeq ("$(OS)", "Darwin")
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index ca32bf9..f1b2486 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -4,26 +4,12 @@
 #
 ################################################################################
 
-LIBROXML_VERSION = 2.2.3
+LIBROXML_VERSION = 2.3.0
 LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
 LIBROXML_INSTALL_STAGING = YES
+LIBROXML_LICENSE = LGPLv2.1+ with static link exception
+LIBROXML_LICENSE_FILES = License.txt
 
-define LIBROXML_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIM= -C $(@D) V=1 all
-endef
+LIBROXML_CONF_OPT = --disable-silent-rules
 
-define LIBROXML_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr/ -C $(@D) install
-endef
-
-define LIBROXML_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR)/usr/ -C $(@D) install
-endef
-
-define LIBROXML_DISABLE_DOXYGEN
-	$(SED) 's:) doxy:):' $(@D)/Makefile
-endef
-
-LIBROXML_POST_PATCH_HOOKS += LIBROXML_DISABLE_DOXYGEN
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
618FE3EF
