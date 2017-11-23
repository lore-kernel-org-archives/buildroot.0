From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 24 Nov 2017 00:08:23 +0100
Subject: [Buildroot] [git commit] Fix makefile include order by using
 sort/wildcard.
Message-ID: <20171123231323.EC403814D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9d2d4cb4ebc7a2290c4683dd9667b8f0a9e3cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Makefile                                           | 8 ++++----
 package/gstreamer/gstreamer.mk                     | 2 +-
 package/gstreamer1/gstreamer1.mk                   | 2 +-
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 55409b9..3ee6abe 100644
--- a/Makefile
+++ b/Makefile
@@ -483,13 +483,13 @@ include system/system.mk
 include package/Makefile.in
 # arch/arch.mk.* must be after package/Makefile.in because it may need to
 # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
--include $(wildcard arch/arch.mk.*)
+-include $(sort $(wildcard arch/arch.mk.*))
 include support/dependencies/dependencies.mk
 
 PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
 
-include toolchain/*.mk
-include toolchain/*/*.mk
+include $(sort $(wildcard toolchain/*.mk))
+include $(sort $(wildcard toolchain/*/*.mk))
 
 # Include the package override file if one has been provided in the
 # configuration.
@@ -1109,7 +1109,7 @@ print-version:
 	./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
 
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
