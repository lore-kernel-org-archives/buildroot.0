From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 18:46:51 +0100
Subject: [Buildroot] [git commit] xerces: make sure to use the
	cross-compiled curl
Message-ID: <20141227174706.914068045B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=235c95af8fecdcf1326572f47367d9b6d0d55e76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xerces/xerces.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
