From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 17:19:53 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: let recent
 GCC handle SOURCE_DATE_EPOCH
Message-ID: <20200627151737.2839F84BD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=408bc354a9c14b3940938cfb7a3e3eefa81641a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 toolchain/toolchain-wrapper.c  | 10 ++++++++++
 toolchain/toolchain-wrapper.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 39e9f0850f..0fb6064b1c 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -179,6 +179,7 @@ static void check_unsafe_path(const char *arg,
 	}
 }
 
+#ifdef BR_NEED_SOURCE_DATE_EPOCH
 /* Returns false if SOURCE_DATE_EPOCH was not defined in the environment.
  *
  * Returns true if SOURCE_DATE_EPOCH is in the environment and represent
@@ -232,6 +233,15 @@ bool parse_source_date_epoch_from_env(void)
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
