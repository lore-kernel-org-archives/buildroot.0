From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:32:17 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 toolchain/toolchain-wrapper: let recent GCC handle SOURCE_DATE_EPOCH
Message-ID: <20200716163657.16BC687083@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c0a81a21b4f7c94fcf54664bb0a360d5f7897e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

When using precompiled headers, changing any macros defined on the
command line will invalidate the precompiled header.  With
toolchain-wrapper adding __DATE__ and __TIME__, any commits to Buildroot
will invalidate incremental builds regardless of whether the precompiled
header actually uses those values (affecting _OVERRIDE_SRCDIR).

GCC-7 and later support SOURCE_DATE_EPOCH and use it to define __DATE__
and __TIME__ internally, avoiding any impact on precompiled headers.

Disable the custom handling in toolchain-wrapper if GCC is version 7 or
newer.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 408bc354a9c14b3940938cfb7a3e3eefa81641a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c  | 10 ++++++++++
 toolchain/toolchain-wrapper.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 8cfc963ccd..aa6d560fe6 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -177,6 +177,7 @@ static void check_unsafe_path(const char *arg,
 	}
 }
 
+#ifdef BR_NEED_SOURCE_DATE_EPOCH
 /* Returns false if SOURCE_DATE_EPOCH was not defined in the environment.
  *
  * Returns true if SOURCE_DATE_EPOCH is in the environment and represent
@@ -230,6 +231,15 @@ bool parse_source_date_epoch_from_env(void)
 	}
 	return true;
 }
+#else
+bool parse_source_date_epoch_from_env(void)
+{
+	/* The compiler is recent enough to handle SOURCE_DATE_EPOCH itself
+	 * so we do not need to do anything here.
+	 */
+	return false;
+}
+#endif
 
 int main(int argc, char **argv)
 {
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 09dda17890..f1312c5c7f 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -28,6 +28,9 @@ TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
 else
 TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"\" -D__BASE_FILE__=\"\" -Wno-builtin-macro-redefined
 endif
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),)
+TOOLCHAIN_WRAPPER_OPTS += -DBR_NEED_SOURCE_DATE_EPOCH
+endif
 endif
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
