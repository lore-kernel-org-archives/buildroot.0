From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2017 18:33:01 +0200
Subject: [Buildroot] [PATCH] package/asterisk: fix host build
Message-ID: <20170924163301.10853-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host menuselect tool is linked to our host libxml2 library, but it
is missing an RPATH to the host directory.

This is because menuselect does not use automake, so does not inherit
the LDFLAGS from the configure run.

We fix that by simply passing $(HOST_CONFIGURE_OPTS) in the make
environment.

At the same time, we also install the tool in the host directory, even
if not used from there, so that the sanity checks we run are properly
passed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index a6801a006d..50512c0b3a 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -294,12 +294,23 @@ HOST_ASTERISK_CONF_OPTS = \
 	--without-curses \
 	--with-ncurses=$(HOST_DIR)/usr
 
-# Even though menuselect is an autotools package, it is *not* installed,
-# as asterisk does expect it to be in a sub-directory of its source tree,
-# which do by copying the full menuselect build tree as a pre-configure
-# hook in the target variant.
+# Not an automake package, so does not inherit LDFLAGS et al. from
+# the configure run.
+HOST_ASTERISK_MAKE_ENV = $(HOST_CONFIGURE_OPTS)
+
+# Even though menuselect is an autotools package, it is not an automake
+# package and does not have an 'install' rule, as asterisk does expect
+# it to be in a sub-directory of its source tree. We do so by copying
+# the full menuselect build tree as a pre-configure hook in the target
+# variant.
+# However, the sanity checks on host packages are not run on menuselect.
+# But we still want to catch that menuselect has the proper rpath set,
+# for example, as it uses host libraries that we do build, like
+# host-libxml2.
+# So we do manually install the menuselect tool.
 define HOST_ASTERISK_INSTALL_CMDS
-	@:
+	$(INSTALL) -D -m 0755 $(@D)/menuselect/menuselect \
+		$(HOST_DIR)/bin/asterisk-menuselect
 endef
 
 $(eval $(host-autotools-package))
-- 
2.11.0
