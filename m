From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 14:47:17 +0100
Subject: [Buildroot] [PATCH 4/5] xerces: make sure to use the cross-compiled
	curl
In-Reply-To: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419688038-15640-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When curl support is enabled in xerces, and a host curl is available
on the system, it might try to use it, so this patch adds --with-curl=
to the configure options to explicitly indicate where is the curl
library to use.

Should fix:

  http://autobuild.buildroot.org/results/c3c/c3c6be45d0f764fb931a46dbf1509ccf2916ecbf/

  (We were not able to reproduce specifically this problem, but
  another similar problem, where curl was detected, but considered as
  non-working because of the compilation failure of a test program.)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/xerces.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 36955e3..9b2bb81 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -20,7 +20,7 @@ XERCES_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-XERCES_CONF_OPTS += --enable-netaccessor-curl
+XERCES_CONF_OPTS += --enable-netaccessor-curl --with-curl=$(STAGING_DIR)/usr/lib
 XERCES_DEPENDENCIES += libcurl
 else
 XERCES_CONF_OPTS += --disable-network
-- 
2.1.0
