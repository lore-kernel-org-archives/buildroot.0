From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:42 +0100
Subject: [Buildroot] [PATCH 04/38] libxslt: enable compilation on host
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <73c937229bff334c9e4b88b7cc094ff4e576cdf4.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling libxcb (from the X.org stack) requires xsltproc on the host,
which is part of libxslt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/libxslt.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 03c1131..4bf61b5 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -25,7 +25,15 @@ LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
 
 LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
 
+HOST_LIBXSLT_CONF_OPT = --enable-shared \
+			--without-debugging \
+			--without-python \
+			--without-threads
+
+HOST_LIBXSLT_DEPENDENCIES = host-libxml2
+
 $(eval $(call AUTOTARGETS,package,libxslt))
+$(eval $(call AUTOTARGETS,package,libxslt,host))
 
 $(LIBXSLT_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
-- 
1.6.3.3
