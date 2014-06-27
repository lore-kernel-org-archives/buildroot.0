From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 13:09:22 +0200
Subject: [Buildroot] [git commit] radvd: fix build against older glibc
Message-ID: <20140627111029.8C6739D0E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e92fb1f90f1b51cd111105d86c058fdca6f3434a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

clock_gettime() requires -lrt when linking against glibc older than 2.17.

Fixes:
http://autobuild.buildroot.net/results/e07/e07dd9a82ae4c8778b6901b9bd777f5affb9293a/

[Peter: add comment in .mk as well]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 5958d91..a42d858 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -8,6 +8,8 @@ RADVD_VERSION = 1.13
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
+# clock_gettime() requires -lrt when linking against glibc older than 2.17
+RADVD_CONF_ENV = LIBS=-lrt
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
