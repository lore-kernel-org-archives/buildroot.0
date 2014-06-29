From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:39:57 +0200
Subject: [Buildroot] [git commit] qt5: support buildroot being located in
	/usr
Message-ID: <20140629104106.73A679D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9580c178e55b90c456096bb553f0cd0e26eff6a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5 performs sed replacements of /usr to $(STAGING_DIR)/usr in .la files.
However, if buildroot itself is located in /usr, then STAGING_DIR also
starts with /usr, and naive replacements of '/usr' can result in paths of
the form:
    /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...

This patch makes the replacements more careful, by first replacing the known
paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
replacement, and finally replacing the tokens with the corresponding paths.

Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 44e5af0..5f90eb5 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,11 @@ include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
 	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
-		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
+		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
+			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
+			$$i ; \
 		$(SED) "/^dependency_libs=/s%-L/usr/lib %%g" $$i ; \
 	done
 	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.prl"); do \
