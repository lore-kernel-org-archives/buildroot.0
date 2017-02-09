From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Feb 2017 21:50:18 +0200
Subject: [Buildroot] [PATCH 7/7] ddrescue: fix target build
In-Reply-To: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
Message-ID: <99cad486180867002ec348364cf9ac9028b74d0e.1486669818.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ddrescue is not an autotools package. Covert to generic package to make it
build correctly for target architecture.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ddrescue/ddrescue.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 4c87e4dac8fa..4e244e6bdaef 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -10,4 +10,20 @@ DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPLv2+
 DDRESCUE_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+define DDRESCUE_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) ./configure \
+		--prefix=/usr \
+		$(TARGET_CONFIGURE_OPTS) \
+	)
+endef
+
+define DDRESCUE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define DDRESCUE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
