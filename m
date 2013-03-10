From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:36:59 +0100
Subject: [Buildroot] [git commit] qt5: add macro to fixup Qt5 .la and .prl
	files
Message-ID: <20130310215506.CAB609AFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1737b5648c9f778149eb7da5897b66a9577d22c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 8b1a7ed..f220508 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1 +1,11 @@
 include package/qt5/*/*.mk
+
+define QT5_LA_PRL_FILES_FIXUP
+	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
+		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
+		$(SED) "/^dependency_libs=/s%-L/usr/lib %%g" $$i ; \
+	done
+	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.prl"); do \
+		$(SED) "s%-L/usr/lib%%" $$i; \
+	done
+endef
