From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 10:01:05 +0200
Subject: [Buildroot] [PATCH 2/3] core/pkg-utils: check hashes of license
	files
In-Reply-To: <cover.1497772831.git.yann.morin.1998@free.fr>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
Message-ID: <83d3e74a28e9d619d19dd2201dd4fbf9bebed743.1497772831.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will help catch a change of license even if the filename does
not change.

For now, a missing hash for the license files is not a fatal error, to
let people catch up and add them. When we switch to make it mandatory,
we can simplify the code by just removing the case statement.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e9ac56276f..accf48c464 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -85,5 +85,10 @@ endef
 
 define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
+	{ \
+		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
+		ret=$${?}; \
+		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
+	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
-- 
2.11.0
