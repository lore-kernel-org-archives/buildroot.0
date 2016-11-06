From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Nov 2016 21:23:51 +0100
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: needs a host with an
	UTF8 locale
In-Reply-To: <cover.1478463815.git.yann.morin.1998@free.fr>
References: <cover.1478463815.git.yann.morin.1998@free.fr>
Message-ID: <6f09b8c02099896660df1f6cfe177c92d946f01c.1478463815.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mkbundle python script requires an UTF8 locale to encode non-ASCII
characters.

Force the locale on the configure, build and install command lines.

Fixes:
    http://autobuild.buildroot.org/results/6fe/6fe3331f1f1d54cb977bb61a09d7707f19f7eafa/
    http://autobuild.buildroot.org/results/d1d/d1dda2c1d5af8fbaa09ecbf4a87f3892369b9e53/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
There is still a corner case, where the user has a build machine that
has no UTF-8 locale. This is deemed a corner case which we do not want
to address yet for master. Changes in how we handle the UTF8 locale will
come in the -next branch.
---
 package/tvheadend/tvheadend.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a3afec8..d5b58b4 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -70,6 +70,7 @@ TVHEADEND_PRE_CONFIGURE_HOOKS += TVHEADEND_INSTALL_DTV_SCAN_TABLES
 
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);						\
+		LC_ALL=$(UTF8_LOCALE)					\
 		$(TARGET_CONFIGURE_OPTS)			\
 		$(TARGET_CONFIGURE_ARGS)			\
 		CFLAGS="$(TVHEADEND_CFLAGS)"			\
@@ -88,11 +89,11 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 define TVHEADEND_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) LC_ALL=$(UTF8_LOCALE) $(MAKE) -C $(@D)
 endef
 
 define TVHEADEND_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) LC_ALL=$(UTF8_LOCALE) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 # Remove documentation and source files that are not needed because we
-- 
2.7.4
