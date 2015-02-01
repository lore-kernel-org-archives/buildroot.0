From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:13:24 +0100
Subject: [Buildroot] [git commit] package/rpm: use external xz library
Message-ID: <20150201221432.11C30805EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61c3fbd10bee7784d871b84412aa9d488040a4f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Internal xz backend is statically linked and need a static
libintl library when BR2_NEEDS_GETTEXT_IF_LOCALE is set.
But for a shared only build, there is no static libintl available
in the sysroot.

Use the external xz library provided by Buildroot instead of
using the internal xz backend.

Fixes:
http://autobuild.buildroot.net/results/2c6/2c61562008418ff58fa3085a3342b0e304923073/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/rpm.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 68d964a..fda10f2 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -46,7 +46,10 @@ endif
 
 # xz payload support needs a toolchain w/ C++
 ifeq ($(BR2_PACKAGE_XZ)$(BR2_INSTALL_LIBSTDCPP),yy)
-RPM_CONF_OPTS += --with-xz
+RPM_DEPENDENCIES += xz
+RPM_CONF_OPTS += --with-xz=external
+else
+RPM_CONF_OPTS += --with-xz=none
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
