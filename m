From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 3 Jul 2015 22:42:14 +0200
Subject: [Buildroot] [PATCH] pkg-kconfig: .config target needs to take into
	account package dependencies
Message-ID: <1435956134-9543-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is possible that the package's kconfig system needs one of its
dependencies to be built before. This is for example the case for the
linux-backports project, which needs a reference to the linux kernel
configuration.

Therefore, the dependencies of $$($(2)_TARGET_CONFIGURE) should be
copied as $(2)_DIR/.config's dependencies. The dependency on _PATCH was
already there (implicitly, through $$($(2)_KCONFIG_FILE)), only the
dependency on $$($(2)_DEPENDENCIES) should be added.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Petr Vorel <petr.vorel@gmail.com>
---
 package/pkg-kconfig.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index c86c340..6018b25 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -57,6 +57,11 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 		fi; \
 	done
 
+# Generating the .config file is part of the configure step of the package
+# infrastructure, so it should be ordered like it. IOW, it should take over
+# its dependencies.
+$$($(2)_DIR)/.config: | $$($(2)_FINAL_DEPENDENCIES)
+
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
-- 
2.1.4
