From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 May 2015 10:43:54 -0300
Subject: [Buildroot] [PATCH] ipmiutil: force md2 off
Message-ID: <1430833434-717-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure test runs against LIB_DIR (which is --libdir in configure
parlay) hence it's against the distro openssl version.
On newish openssl versions md2 is disabled by default, and buildroot
doesn't try to enable it (it's obsolete), but if the distro
libcrypto/openssl has it enabled then ipmiutil tries to use it.

Force it off to avoid build breakage. Fixes:
http://autobuild.buildroot.net/results/cd2/cd2e617f8e2b00581ab5936029f85e62ed3259ba/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipmiutil/ipmiutil.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
2.0.5
