From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:17 +0100
Subject: [Buildroot] [PATCH 2/7] Makefile: always scan packages' .mk files,
	even with no .config
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <49e9473fe789b56b975f8b3d3064b2a07b691fb7.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we avoid scanning packages' .mk files when we have no
.config file. This is an optimisation made to speed up bringing up
the configurator on the first run.

In an up coming patch, we'll need to generate a Kconfig snippet from
package-defined values, so they can define the "services" (aka daemons)
they may install; we'll use that information to present this list of
sercices to the user, so we need to scan all packages' .mk files, even
on first run.

Narrow down the the conditional "all:" rule to the strictly required
minimum.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index e816b26..8c82b53 100644
--- a/Makefile
+++ b/Makefile
@@ -279,8 +279,6 @@ unexport RUBYOPT
 include package/pkg-utils.mk
 include package/doc-asciidoc.mk
 
-ifeq ($(BR2_HAVE_DOT_CONFIG),y)
-
 ################################################################################
 #
 # Hide troublesome environment variables from sub processes
@@ -364,8 +362,6 @@ export BASE_DIR
 #
 ################################################################################
 
-all: world
-
 # Include legacy before the other things, because package .mk files
 # may rely on it.
 ifneq ($(BR2_DEPRECATED),y)
@@ -685,10 +681,10 @@ graph-depends: graph-depends-requirements
 	|tee $(BASE_DIR)/graphs/$(@).dot \
 	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
 
+ifeq ($(BR2_HAVE_DOT_CONFIG),y)
+all: world
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
-
 all: menuconfig
-
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # configuration
-- 
1.9.1
