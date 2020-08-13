From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 18:43:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/nodejs: use
 system-icu for host-nodejs
Message-ID: <20200813163814.3DB0D822B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b620a7962bf996f43c53f116fea7168371a0282d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The nodejs configure.py file orders zlib headers before the bundled ICU
headers. The zlib headers happen to be located in the system include
directory, next to some system ICU headers (not bundled). If these are
built before nodejs is, nodejs will get confused and try to use the
system ICU headers instead of the bundled ones.

Fix this by always using host-icu.

Set CXXFLAGS to -DU_DISABLE_RENAMING=1 when building with
system-icu since host-icu is built with --disable-renaming.

Fixes:
 - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - keep alphabetical order in _DEPENDENCIES
  - don't introduce HOST_NODEJS_CONF_OPTS
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 319f7b0dab761483c7bf60dd933aa8ec485a06e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3f35ac7c33..e384d4c8a0 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -10,7 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
 	libuv zlib nghttp2 \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
+HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
@@ -66,7 +66,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
 		--shared-zlib \
 		--no-cross-compiling \
-		--with-intl=small-icu \
+		--with-intl=system-icu \
 	)
 endef
 
@@ -77,10 +77,13 @@ NODEJS_HOST_TOOLS_V8 = \
 NODEJS_HOST_TOOLS_NODE = mkcodecache
 NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
 
+HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
+
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
 		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
@@ -90,6 +93,7 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
+		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
 		LDFLAGS.host="$(HOST_LDFLAGS)" \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
