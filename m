From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Nov 2017 08:24:03 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] Fix makefile include
 order by using sort/wildcard.
Message-ID: <20171130071900.4E2648157F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1deeaefe37146ae05df9affe1921fd6ff80631ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The 'include' directive in GNU make supports wildcards, but their
expansion has no defined sort order (GLOB_NOSORT is passed to glob()).
Usually this doesn't matter. However, there is at least one case where
it does make a difference: toolchain/*/*.mk includes both the
definitions of the external toolchain packages and
pkg-toolchain-external.mk, but pkg-toolchain-external.mk must be
included first.

For predictability, use ordered 'include $(sort $(wildcard ...))'
instead of unordered direct 'include */*.mk' everywhere.

Fixes [1] reported by Petr Vorel:

  make: *** No rule to make target 'toolchain-external-custom', needed by '.../build/toolchain-external/.stamp_configured'.  Stop.

[1] http://lists.busybox.net/pipermail/buildroot/2017-November/206969.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
[Arnout: also sort the one remaining include, of the external docs]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit b9d2d4cb4ebc7a2290c4683dd9667b8f0a9e3cdf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                           | 6 +++---
 package/gstreamer/gstreamer.mk                     | 2 +-
 package/gstreamer1/gstreamer1.mk                   | 2 +-
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 6136593..b3cfa54 100644
--- a/Makefile
+++ b/Makefile
@@ -483,8 +483,8 @@ include support/dependencies/dependencies.mk
 
 PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
 
-include toolchain/*.mk
-include toolchain/*/*.mk
+include $(sort $(wildcard toolchain/*.mk))
+include $(sort $(wildcard toolchain/*/*.mk))
 
 # Include the package override file if one has been provided in the
 # configuration.
@@ -1071,7 +1071,7 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
--include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)
+-include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
 
 .PHONY: $(noconfig_targets)
 
diff --git a/package/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer.mk
index bc886c7..22240bc 100644
--- a/package/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer.mk
@@ -1 +1 @@
-include package/gstreamer/*/*.mk
+include $(sort $(wildcard package/gstreamer/*/*.mk))
diff --git a/package/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1.mk
index 5b748e3..8530ff0 100644
--- a/package/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1.mk
@@ -1 +1 @@
-include package/gstreamer1/*/*.mk
+include $(sort $(wildcard package/gstreamer1/*/*.mk))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 48de1e7..dd07884 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -25,4 +25,4 @@ $(error No prefix selected for external toolchain package $(BR2_PACKAGE_PROVIDES
 endif
 endif
 
-include toolchain/toolchain-external/*/*.mk
+include $(sort $(wildcard toolchain/toolchain-external/*/*.mk))
