From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:50 +0200
Subject: [Buildroot] [PATCH 16/53] pkg-rebar: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-17-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

$(PKG)_ERLANG_LIBDIR is problematic because it is used both for host
and staging/target. Therefore, the usr/ part is removed from it, and
added the the callers instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/pkg-rebar.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index ab41d3bb34..e196ba5b26 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -25,14 +25,14 @@
 # infrastructure tells rebar to NOT download dependencies during
 # the build stage.
 #
-REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
+REBAR_HOST_DEPS_DIR = $(HOST_DIR)/share/rebar/deps
 REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
 
 # Tell rebar where to find the dependencies
 #
 REBAR_HOST_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_HOST_DEPS_DIR)"}' \
-	ERL_EI_LIBDIR=$(HOST_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
+	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
 REBAR_TARGET_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_TARGET_DEPS_DIR)"}' \
 	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
@@ -119,10 +119,10 @@ define inner-rebar-package
 $(2)_ERLANG_APP = $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))))
 
 # Path where to store the package's libs, relative to either $(HOST_DIR)
-# for host packages, or $(STAGING_DIR) for target packages.
+# for host packages, or $(STAGING_DIR)/usr for target packages.
 #
 $(2)_ERLANG_LIBDIR = \
-	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
+	/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
 
 # If a host package, inherit <pkg>_USE_BUNDLED_REBAR from the target
 # package, if not explicitly defined. Otherwise, default to NO.
@@ -173,8 +173,8 @@ endif
 # package-related variables
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(call install-erlang-directories,$$(STAGING_DIR),include)
-	$$(call install-rebar-deps,$$(STAGING_DIR),TARGET)
+	$$(call install-erlang-directories,$$(STAGING_DIR)/usr,include)
+	$$(call install-rebar-deps,$$(STAGING_DIR)/usr,TARGET)
 endef
 endif
 
@@ -182,7 +182,7 @@ endif
 # package-related variables
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(call install-erlang-directories,$$(TARGET_DIR))
+	$$(call install-erlang-directories,$$(TARGET_DIR)/usr)
 endef
 endif
 
-- 
2.11.0
