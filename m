From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 20:53:09 +0100
Subject: [Buildroot] [PATCH v2 4/5] package/rpm: use external xz library
In-Reply-To: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
References: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421610790-18508-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
v2: rebase on top of the 3/5 patch

 package/rpm/rpm.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
1.9.3
