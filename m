From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] glog: fix atomic built-in problem
Message-ID: <20160206101652.6A9D980771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8df95843ed1090b7be41b541bbcf111b86cb4c4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glog can optionally use atomic __sync built-ins. However, its
configure script only checks for the availability of the 4-byte
variant, but the code also uses the 1-byte variant. While this works
on most architectures, it does not on architectures that implement
only the 4-byte variant, such as Microblaze. So if the architecture
does not implement the 1-byte variant, we hint the configure script
that atomic built-ins should not be used.

Fixes:

  http://autobuild.buildroot.org/results/bedebd594c283adf39374c9a9f44432e5d6cbff7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/glog/glog.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 8a84094..aa7cacb 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -14,4 +14,15 @@ ifeq ($(BR2_PACKAGE_GFLAGS),y)
 GLOG_DEPENDENCIES = gflags
 endif
 
+# glog can optionally use atomic __sync built-ins. However, its
+# configure script only checks for the availability of the 4 bytes
+# version, but the code also uses the 1 byte version. While this works
+# on most architectures, it does not on architectures that implement
+# only the 4 bytes version, such as Microblaze. So if the architecture
+# does not implement the 1 byte version, we hint the configure script
+# that atomic built-ins should not be used.
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
+GLOG_CONF_ENV += ac_cv___sync_val_compare_and_swap=no
+endif
+
 $(eval $(autotools-package))
