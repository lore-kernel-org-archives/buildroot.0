From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:39:15 +0100
Subject: [Buildroot] [git commit] ddrescue: fix target build
Message-ID: <20170209203947.E195C821EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc8c12345cf2ff6e154845f89d1ba65ea2bd3f49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ddrescue is not an autotools package. Convert to generic package to make
it build correctly for target architecture.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ddrescue/ddrescue.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 23f0343..145d052 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -16,4 +16,20 @@ define DDRESCUE_EXTRACT_CMDS
 		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 
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
