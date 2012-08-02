From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:16 -0000
Subject: [Buildroot] [git commit branch/next] libcurl: fix up prefix in
	curl-config
Message-ID: <20120802195238.AE89D96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f83cd598907c5b8ac3a2b1bbb70c071d1ae929d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

While most packages that rely on libcurl use pkg-config, a few
packages (such as libxmlrpc) still use curl-config. So we need to fix
up the prefix locations in the curl-config script installed in
STAGING_DIR.

[Peter: only fixup if prefix=/usr]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e8f13bb..50a55b4 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -30,6 +30,12 @@ endef
 
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
+define LIBCURL_STAGING_FIXUP_CURL_CONFIG
+	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/curl-config
+endef
+
+LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
+
 $(eval $(call AUTOTARGETS))
 
 curl: libcurl
