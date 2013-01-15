From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 09:44:30 +0100
Subject: [Buildroot] [git commit] Makefile: rename cross target -> toolchain
Message-ID: <20130115093359.7FC6F998CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a78641583aa396dce64c00e1a3009796295d23c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use a more descriptive name, the same of the "toolchain" directory.
- Add missing dependencies to be able to successfully use the target
  right after the configuration.
- Move to a better position.
- Documentation it in the help target.
- Use toolchain target in the world target

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 1fc51e9..6f8ed0e 100644
--- a/Makefile
+++ b/Makefile
@@ -392,9 +392,11 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
+toolchain: prepare dirs dependencies $(BASE_TARGETS)
 
-.PHONY: all world dirs clean distclean source outputmakefile \
+world: toolchain $(TARGETS_ALL)
+
+.PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
@@ -715,8 +717,6 @@ ifeq ($(O),output)
 endif
 	rm -rf $(BUILDROOT_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
-cross: $(BASE_TARGETS)
-
 help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
@@ -724,6 +724,7 @@ help:
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
+	@echo '  toolchain              - build toolchain'
 	@echo '  <package>-rebuild      - force recompile <package>'
 	@echo '  <package>-reconfigure  - force reconfigure <package>'
 	@echo
