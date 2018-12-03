From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:00:04 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] xfsprogs: Define PLATFORM
 to linux
Message-ID: <20181203215842.3B2F78A61A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b61ec8029449a523998bf81423489f757f8ee700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 257a2118be2b0664e2b8dbda344a74443f70db86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/xfsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 814e0cf218..79ca521c06 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -12,7 +12,7 @@ XFSPROGS_LICENSE_FILES = doc/COPYING
 
 XFSPROGS_DEPENDENCIES = util-linux
 
-XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
+XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
 XFSPROGS_CONF_OPTS = \
 	--enable-lib64=no \
 	--enable-gettext=no \
