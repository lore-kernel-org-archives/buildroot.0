From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 10 Aug 2016 18:35:46 -0400
Subject: [Buildroot] [PATCH 2/2] fwup: link in pthreads for static builds
In-Reply-To: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
References: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both libconfuse (via libintl) and libarchive have references to pthreads
but do not specify pthreads in their pkg-config descriptions. This
change adds pthreads to the fwup linker options so that the link step
succeeds.

Fixes autobuilder failures:

http://autobuild.buildroot.net/results/ce3793c79d5dc4e296d645c75f22e121f35030d3/
http://autobuild.buildroot.net/results/0c5ffec5438f766dade951a64ebfa1b734a3c0aa/
http://autobuild.buildroot.net/results/802/802b6d77e1b77b7c8fcb8f3b394cdabfd406de7a/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/fwup/fwup.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 3d3e3be..c5accc6 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -13,5 +13,13 @@ HOST_FWUP_DEPENDENCIES = host-libconfuse host-libarchive host-libsodium
 FWUP_AUTORECONF = YES
 FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
+# The following is needed to fix link errors in static configurations
+# due to libconfuse requiring pthreads via libintl and libarchive
+# using pthread_mutex_*. Neither list pthreads in their pkg-config
+# description.
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+FWUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.7.4
