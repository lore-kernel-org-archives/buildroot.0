From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 May 2017 17:18:59 +0200
Subject: [Buildroot] [git commit] dtc: bump version to 1.4.4
Message-ID: <20170503152613.4B104821A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40a5d253787039774992334050577363c09a7d94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds overlay support.

Drop the non-upstreamed 0002-extra-cflags.patch and instead simply pass the
needed CFLAGS as make arguments.  Passing the full upstream warning flags
are not important in the Buildroot context, so this is simpler than
maintaining a patch.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/0002-extra-cflags.patch | 32 --------------------------------
 package/dtc/dtc.hash                |  2 +-
 package/dtc/dtc.mk                  |  6 +++---
 3 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/package/dtc/0002-extra-cflags.patch b/package/dtc/0002-extra-cflags.patch
deleted file mode 100644
index f070692..0000000
--- a/package/dtc/0002-extra-cflags.patch
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
- 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
--CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
-+CFLAGS ?= -g -Os
-+CFLAGS += -fPIC $(WARNINGS)
- 
- BISON = bison
- LEX = flex
diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 8b3af33..75c2e40 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,2 +1,2 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256 77992ad8eac7b68f553d0ba58e5b51604ac803d126196c99e3ae38aaae28bb94  dtc-1.4.1.tar.xz
+sha256 470731d5c015b160d26a96645dbb1c7337d6e7b8c98244612002b66bedf6cffb  dtc-1.4.4.tar.xz
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 5bb2ca2..9d50e35 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.4.1
+DTC_VERSION = 1.4.4
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
@@ -32,7 +32,7 @@ DTC_INSTALL_GOAL = install-lib
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 define DTC_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) PREFIX=/usr
 endef
 
 # For staging, only the library is needed
@@ -47,7 +47,7 @@ endef
 
 # host build
 define HOST_DTC_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+	$(HOST_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(HOST_CFLAGS) -fPIC" -C $(@D) PREFIX=$(HOST_DIR)/usr
 endef
 
 define HOST_DTC_INSTALL_CMDS
