From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 4 Aug 2016 19:46:04 +0530
Subject: [Buildroot] [RFC 2/2] new make target <PKG>-find-licenses
In-Reply-To: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1470320164-8241-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a make target to run find-licenses script for given package with
build dir as source package dir.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 Makefile               | 1 +
 package/pkg-generic.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 027f21c..24fec89 100644
--- a/Makefile
+++ b/Makefile
@@ -949,6 +949,7 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	@echo '  <pkg>-find-licenses    - Find licenses of <pkg> from sources'
 	$(foreach p,$(HELP_PACKAGES), \
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68ead3d..c4aa84b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -698,6 +698,9 @@ $(1)-show-version:
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
 
+$(1)-find-licenses:
+			$$(TOPDIR)/support/scripts/find-licenses $(1) $$($(2)_BUILDDIR)
+
 $(1)-graph-depends: graph-depends-requirements
 			@$$(INSTALL) -d $$(GRAPHS_DIR)
 			@cd "$$(CONFIG_DIR)"; \
@@ -922,6 +925,7 @@ endif
 	$(1)-dirclean \
 	$(1)-external-deps \
 	$(1)-extract \
+	$(1)-find-licenses \
 	$(1)-graph-depends \
 	$(1)-install \
 	$(1)-install-host \
-- 
2.6.2
