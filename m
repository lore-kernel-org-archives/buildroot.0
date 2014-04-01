From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Apr 2014 11:12:50 +0200
Subject: [Buildroot] [PATCH v2 2/4] infra: add to luarocks support for
	top-level parallel make
In-Reply-To: <1396343572-13551-1-git-send-email-fabio.porcedda@gmail.com>
References: <1396343572-13551-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1396343572-13551-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-luarock dependency is not always satisfied for the extract
phase because the %-extract target is not anymore in the dependency
chain.
To be sure that the dependency is satisfied add the dependency to the
stamp file $(%_TARGET_EXTRACT) instead of the %-extract target.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/pkg-luarocks.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
1.9.1
