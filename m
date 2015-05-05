From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 May 2015 17:25:09 +0200
Subject: [Buildroot] [git commit] ipmiutil: force md2 off
Message-ID: <20150505152638.83F137FAE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec45eb1619da40ea97fa39dfe60cee2a9b8e78c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure test runs against LIB_DIR (which is --libdir in configure
parlay) hence it's against the distro openssl version.
On newish openssl versions md2 is disabled by default, and buildroot
doesn't try to enable it (it's obsolete), but if the distro
libcrypto/openssl has it enabled then ipmiutil tries to use it.

Force it off to avoid build breakage. Fixes:
http://autobuild.buildroot.net/results/cd2/cd2e617f8e2b00581ab5936029f85e62ed3259ba/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/ipmiutil.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 8e281d4..c3d791c 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -10,7 +10,9 @@ IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac
 IPMIUTIL_AUTORECONF = YES
-
+# tests against distro libcrypto so it might get a false positive when
+# the openssl version is old, so force it off
+IPMIUTIL_CONF_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS) -DSKIP_MD2"
 IPMIUTIL_DEPENDENCIES = openssl
 
 $(eval $(autotools-package))
