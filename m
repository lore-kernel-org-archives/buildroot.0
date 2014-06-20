From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Jun 2014 21:11:05 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] qt5: support buildroot being located
	in /usr
In-Reply-To: <patchbomb.1403291463@localhost>
References: <patchbomb.1403291463@localhost>
Message-ID: <6e90b5d192055fdb9550.1403291465@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
v2: no changes

 package/qt5/qt5.mk |  7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff -r 2969a1777632 -r 6e90b5d19205 package/qt5/qt5.mk
--- a/package/qt5/qt5.mk	Fri Jun 20 21:09:35 2014 +0200
+++ b/package/qt5/qt5.mk	Thu Jun 19 21:16:12 2014 +0200
@@ -5,7 +5,12 @@
 
 define QT5_LA_PRL_FILES_FIXUP
 	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
-		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
+		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
+			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
+			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
+			$$i ; \
 		$(SED) "/^dependency_libs=/s%-L/usr/lib %%g" $$i ; \
 	done
 	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.prl"); do \
