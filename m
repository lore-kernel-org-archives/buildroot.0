From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Jan 2015 19:16:03 +0100
Subject: [Buildroot] [PATCH v2 1/4] dtc: fix project and download url
Message-ID: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and rename patches to new convention

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dtc/0001-separate-lib-install.patch | 28 +++++++++++++++++++++++++
 package/dtc/0002-extra-cflags.patch         | 32 +++++++++++++++++++++++++++++
 package/dtc/Config.in                       |  2 +-
 package/dtc/dtc-extra_cflags.patch          | 32 -----------------------------
 package/dtc/dtc-separate-lib-install.patch  | 28 -------------------------
 package/dtc/dtc.mk                          |  5 +++--
 6 files changed, 64 insertions(+), 63 deletions(-)
 create mode 100644 package/dtc/0001-separate-lib-install.patch
 create mode 100644 package/dtc/0002-extra-cflags.patch
 delete mode 100644 package/dtc/dtc-extra_cflags.patch
 delete mode 100644 package/dtc/dtc-separate-lib-install.patch

diff --git a/package/dtc/0001-separate-lib-install.patch b/package/dtc/0001-separate-lib-install.patch
new file mode 100644
index 0000000..c86d587
--- /dev/null
+++ b/package/dtc/0001-separate-lib-install.patch
@@ -0,0 +1,28 @@
+Makefile: add a rule to only install libfdt
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch not sent upstream.
+
+It's really specific to buildroot, and is probably not
+good (aka generic) enough to be pushed upstream.
+
+diff --git a/Makefile b/Makefile
+index 1169e6c..39e7190 100644
+--- a/Makefile
++++ b/Makefile
+@@ -160,10 +160,12 @@ endif
+ # intermediate target and building them again "for real"
+ .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
+ 
+-install: all $(SCRIPTS)
++install: all $(SCRIPTS) libfdt_install
+ 	@$(VECHO) INSTALL
+ 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
+ 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
++
++libfdt_install: libfdt
+ 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
+ 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+ 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
diff --git a/package/dtc/0002-extra-cflags.patch b/package/dtc/0002-extra-cflags.patch
new file mode 100644
index 0000000..51b7957
--- /dev/null
+++ b/package/dtc/0002-extra-cflags.patch
@@ -0,0 +1,32 @@
+Makefile: append the CFLAGS to existing ones
+
+Allow the user to pass custom CFLAGS (eg. optimisation flags).
+
+Do not use EXTRA_CFLAGS, append to existing CFLAGS with +=  (Arnout)
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Arnout Vandecappelle <arnout@mind.be>
+
+---
+Patch not sent upstream.
+
+Although not specific to buildroot, I am not sure this is the best
+way to handle user-supplied CFLAGS.
+
+diff --git a/Makefile b/Makefile
+index 962f94eba661..bf6b317158cf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,9 +16,10 @@ LOCAL_VERSION =
+ CONFIG_LOCALVERSION =
+ 
+ CPPFLAGS = -I libfdt -I .
+-WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
++WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
+-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
++CFLAGS ?= -g -Os
++CFLAGS += -fPIC $(WARNINGS)
+ 
+ BISON = bison
+ LEX = flex
diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 7b02dd2..39223f7 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_DTC
 	  Note that only the library is installed.
 	  If you want the programs, say 'y' here, and to "dtc programs", below.
 
-	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
+	  https://git.kernel.org/cgit/utils/dtc/dtc.git
 
 if BR2_PACKAGE_DTC
 
diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/dtc-extra_cflags.patch
deleted file mode 100644
index 51b7957..0000000
--- a/package/dtc/dtc-extra_cflags.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Makefile: append the CFLAGS to existing ones
-
-Allow the user to pass custom CFLAGS (eg. optimisation flags).
-
-Do not use EXTRA_CFLAGS, append to existing CFLAGS with +=  (Arnout)
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Arnout Vandecappelle <arnout@mind.be>
-
----
-Patch not sent upstream.
-
-Although not specific to buildroot, I am not sure this is the best
-way to handle user-supplied CFLAGS.
-
-diff --git a/Makefile b/Makefile
-index 962f94eba661..bf6b317158cf 100644
---- a/Makefile
-+++ b/Makefile
-@@ -16,9 +16,10 @@ LOCAL_VERSION =
- CONFIG_LOCALVERSION =
- 
- CPPFLAGS = -I libfdt -I .
--WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
-+WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
- 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
--CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
-+CFLAGS ?= -g -Os
-+CFLAGS += -fPIC $(WARNINGS)
- 
- BISON = bison
- LEX = flex
diff --git a/package/dtc/dtc-separate-lib-install.patch b/package/dtc/dtc-separate-lib-install.patch
deleted file mode 100644
index c86d587..0000000
--- a/package/dtc/dtc-separate-lib-install.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Makefile: add a rule to only install libfdt
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch not sent upstream.
-
-It's really specific to buildroot, and is probably not
-good (aka generic) enough to be pushed upstream.
-
-diff --git a/Makefile b/Makefile
-index 1169e6c..39e7190 100644
---- a/Makefile
-+++ b/Makefile
-@@ -160,10 +160,12 @@ endif
- # intermediate target and building them again "for real"
- .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
- 
--install: all $(SCRIPTS)
-+install: all $(SCRIPTS) libfdt_install
- 	@$(VECHO) INSTALL
- 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
- 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
-+
-+libfdt_install: libfdt
- 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
- 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
- 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 51b5b4e..6fd5064 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DTC_VERSION = v1.4.0
-DTC_SITE = git://git.jdl.com/software/dtc.git
+DTC_VERSION = 1.4.0
+DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
+DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPLv2+/BSD-2c
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-- 
2.1.2
