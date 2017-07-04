From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:35:09 +0200
Subject: [Buildroot] [git commit] pkg-rebar: remove redundant / in front of
	$($(PKG)_ERLANG_LIBDIR)
Message-ID: <20170704063159.E105181F9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=417ade5f2bbd6941d717d40af309f638abc108d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes $(1)/$($(PKG)_ERLANG_LIBDIR) is used, sometimes
$(1)$($(PKG)_ERLANG_LIBDIR). Make this consistent, with /. Therefore,
remove the leading / from $($(PKG)_ERLANG_LIBDIR).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-rebar.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 7605a64..cc6b775 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -44,7 +44,7 @@ REBAR_TARGET_DEPS_ENV = \
 # Install an Erlang application from $(@D).
 #
 # i.e., define a recipe that installs the "bin ebin priv $(2)" directories
-# from $(@D) to $(1)$($(PKG)_ERLANG_LIBDIR).
+# from $(@D) to $(1)/$($(PKG)_ERLANG_LIBDIR).
 #
 #  argument 1 should typically be $(HOST_DIR), $(TARGET_DIR),
 #	      or $(STAGING_DIR).
@@ -59,7 +59,7 @@ define install-erlang-directories
 	$(INSTALL) -d $(1)/$($(PKG)_ERLANG_LIBDIR)
 	for dir in bin ebin priv $(2); do                               \
 		if test -d $(@D)/$$dir; then                            \
-			cp -r $(@D)/$$dir $(1)$($(PKG)_ERLANG_LIBDIR);  \
+			cp -r $(@D)/$$dir $(1)/$($(PKG)_ERLANG_LIBDIR); \
 		fi;                                                     \
 	done
 endef
@@ -122,7 +122,7 @@ $(2)_ERLANG_APP = $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))))
 # for host packages, or $(STAGING_DIR) for target packages.
 #
 $(2)_ERLANG_LIBDIR = \
-	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
+	usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
 
 # If a host package, inherit <pkg>_USE_BUNDLED_REBAR from the target
 # package, if not explicitly defined. Otherwise, default to NO.
