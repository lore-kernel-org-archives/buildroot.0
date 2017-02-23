From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:38 +0100
Subject: [Buildroot] [PATCH 16/25] luarocks-package: rework extraction
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-17-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luarocks package infra extracts the package directly under
$(BUILD_DIR), because the contents are always in a subdirectory name
<pkg>-<version>. However, this only works when the upstream package name
is the same as the Buildroot package name.

Instead, we can rely on the fixed structure of a .src.rock: it always
contains the source subdirectory in a directory called foo, where foo
is the basename of the .src.rock file. Therefore, we can extract into
a subdirectory of $($(PKG)_DIR), then move its contents up two
directory levels.

Note, we can't extract directly into $($(PKG)_DIR) because it's
possible that $($(PKG)_SUBDIR) == <pkg>-<version>. In that case, we
would try to move the directory unto itself and get "Directory not
empty". This is the case e.g. for the lpty package.

Two alternatives were considered but are more complicated:
- instead of using wildcards for the move, we could have used
  <.src.rock basename>/$($(PKG)_SUBDIR);
- instead of extracting with luarocks, we could use unzip to extract
  (the .src.rock is a ZIP file), but then we also have to move the
  .rockspec into the subdir. In addition, sometimes the ZIP file
  contains a tarball instead of the extracted source.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-luarocks.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index aa83e74a0e..08ea9b801a 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -44,12 +44,15 @@ $(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 $(2)_DEPENDENCIES	+= host-luarocks luainterpreter
 
 #
-# Extract step
+# Extract step. Extract into a temporary dir and move the relevant part to the
+# source dir.
 #
 ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
-	cd $$($(2)_DIR)/.. && \
+	mkdir -p $$($(2)_DIR)/luarocks-extract
+	cd $$($(2)_DIR)/luarocks-extract && \
 		$$(LUAROCKS_RUN_ENV) $$(LUAROCKS_RUN_CMD) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
+	mv $$($(2)_DIR)/luarocks-extract/*/* $$($(2)_DIR)
 endef
 endif
 
-- 
2.11.0
