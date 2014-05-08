From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  9 May 2014 01:24:27 +0200
Subject: [Buildroot] [PATCH] zeromq: explicitly add -lstdc++ for static build
Message-ID: <1399591467-2219-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/7c552e514f8c13ba8cdd420dc5bbf5edac915a83

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zeromq/zeromq.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 7802916..c1eee3e 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -12,9 +12,15 @@ ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 ZEROMQ_AUTORECONF = YES
 
+# Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
+# for the rest of the build as well (which automatically includes stdc++).
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	ZEROMQ_CONF_OPT += LIBS=-lstdc++
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 	ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
-	ZEROMQ_CONF_OPT = --with-system-pgm
+	ZEROMQ_CONF_OPT += --with-system-pgm
 endif
 
 $(eval $(autotools-package))
-- 
2.0.0.rc2
