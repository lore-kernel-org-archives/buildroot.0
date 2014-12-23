From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 22 Dec 2014 19:53:01 -0500
Subject: [Buildroot] [PATCH v2] erlang: selectively enable libatomic_ops
Message-ID: <1419295981-30100-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erlang can use either the system libatomic_ops or its own version.
However, if using the system version, it must find implementations for
AO_compare_and_swap() and other calls.  Since these are not available on
ARM versions before armv6+, selectively enable the use of the system
libatomic_ops.

Fixes:
  http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/
  http://autobuild.buildroot.net/results/c74/c743cfca629fb332bbb1327cf4ea360f0a4e4bfe/
  http://autobuild.buildroot.net/results/095/095348d4d309c2a408a3b297b4325348ed1dd7e8/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Use system libatomic_ops on all platforms except those before armv6
    per investigation by Yann
  - Integrate Yann's other suggestions including comments on
    --without-libatomic-ops and cleaning up the logic in the Config.in

 package/erlang/Config.in | 12 ++++++++++++
 package/erlang/erlang.mk |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 56830da..cebfa2a 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -26,6 +26,18 @@ config BR2_PACKAGE_ERLANG_SMP
 	  If you do not need SMP support, turning this option off reduces
 	  compile time and the size of the Erlang installation.

+config BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS
+	bool
+	default y
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	# On ARM, only armv6+ has the necessary AO_compare_and_swap()
+	depends on BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A || !(BR2_arm || BR2_armeb)
+	help
+	  Use the system libatomic_ops on platforms that provide
+	  implementations for AO_store(), AO_load(), and AO_compare_and_swap().
+	  Platforms without support for those functions must still use the
+	  Erlang-provided implementation.
+
 config BR2_PACKAGE_ERLANG_MEGACO
 	bool "install megaco application"
 	help
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 0b8619e..c107745 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -22,9 +22,13 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)

 ERLANG_CONF_OPTS = --without-javac

-ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+ifeq ($(BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS),y)
 ERLANG_DEPENDENCIES += libatomic_ops
 ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
+else
+# --without-libatomic_ops means: do not use an external libatomic_ops;
+# atomic operations use an internal implementation instead.
+ERLANG_CONF_OPTS += --without-libatomic_ops
 endif

 # erlang uses openssl for all things crypto. Since the host tools (such as
--
1.9.1
