From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:52 +0200
Subject: [Buildroot] [PATCH 02/10] libcurl: fix up prefix in curl-config
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9f69097a418b6d560a5b36463bdf6f02dd8c9c90.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While most packages that rely on libcurl use pkg-config, a few
packages (such as libxmlrpc) still use curl-config. So we need to fix
up the prefix locations in the curl-config script installed in
STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e8f13bb..e43ff0f 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -30,6 +30,12 @@ endef
 
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
+define LIBCURL_STAGING_FIXUP_CURL_CONFIG
+	$(SED) "s,prefix=,prefix=$(STAGING_DIR)," $(STAGING_DIR)/usr/bin/curl-config
+endef
+
+LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
+
 $(eval $(call AUTOTARGETS))
 
 curl: libcurl
-- 
1.7.9.5
