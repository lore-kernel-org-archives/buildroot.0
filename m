From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:45:38 +0200
Subject: [Buildroot] [git commit] infra: add to luarocks support for
	top-level parallel make
Message-ID: <20140404214801.7FF8B9C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=207d2acf6b2ec6845514184c69dd7a9395f8d35f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-luarock dependency is not always satisfied for the extract
phase because the %-extract target is not anymore in the dependency
chain.
To be sure that the dependency is satisfied add the dependency to the
stamp file $(%_TARGET_EXTRACT) instead of the %-extract target.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-luarocks.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index bdda022..7010381 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -43,10 +43,6 @@ $(2)_SITE		?= $(call qstrip,$(BR2_LUAROCKS_MIRROR))
 # a target package, and can just add the required dependencies
 $(2)_DEPENDENCIES	+= host-luarocks luainterpreter
 
-# $(2)_DEPENDENCIES are handled for configure step (too late)
-# but host-luarocks is required to do the extract
-$(1)-extract: host-luarocks
-
 #
 # Extract step
 #
@@ -71,6 +67,10 @@ endif
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
+# $(2)_DEPENDENCIES are handled for configure step (too late)
+# but host-luarocks is required to do the extract
+$$($(2)_TARGET_EXTRACT): | host-luarocks
+
 endef
 
 ################################################################################
