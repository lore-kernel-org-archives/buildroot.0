From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:22:54 +0100
Subject: [Buildroot] [PATCH 12/34] qt5: add macro to fixup Qt5 .la and .prl
	files
In-Reply-To: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362601396-32250-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

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
-- 
1.7.9.5
