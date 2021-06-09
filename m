From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Jun 2021 22:14:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: disable -Werror
Message-ID: <20210609201419.625739-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable -Werror to avoid the following build failure with -DNDEBUG
raised since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

/srv/storage/autobuild/run/instance-2/output-1/build/openswan-3.0.0/programs/rsasigkey/rsasigkey.c:524:6: error: variable 'success' set but not used [-Werror=unused-but-set-variable]
  524 |  int success;
      |      ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/327a0f2b8f0c51bcbb3edb1c3671870d593e93b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 7f083f695d..bb56e4516c 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -15,7 +15,7 @@ OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
 	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false \
-	USE_NOMANINSTALL=true
+	USE_NOMANINSTALL=true WERROR=""
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 OPENSWAN_DEPENDENCIES += libcurl
-- 
2.30.2
