From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 28 Nov 2018 21:05:40 -0800
Subject: [Buildroot] [PATCH] xfsprogs: Define PLATFORM to linux
Message-ID: <1543467940-5231-1-git-send-email-f.fainelli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PLATFORM is an environment variable used by xfsprogs' configure script
to determine the platform for which the applications are being built. If
we set some incorrect/unsupported value through e.g: export, this will
be picked up by xfsprogs' configure script and used as-is and assigned
to PKG_PLATFORM, which will lead to build failures.

If PLATFORM was empty/unset, then uname on the host building xfsprogs
gets used to determine the build platform, which again could be
incorrect if we e.g: built xfsprogs on a Darwin system.

Since we are obviously building for Linux, let's just make sure we
define it that way which solves both issues.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/xfsprogs/xfsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index b5975d29e1a1..bbb888707b20 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -12,7 +12,7 @@ XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
 XFSPROGS_DEPENDENCIES = util-linux
 
-XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
+XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
 XFSPROGS_CONF_OPTS = \
 	--enable-lib64=no \
 	--enable-gettext=no \
-- 
2.7.4
