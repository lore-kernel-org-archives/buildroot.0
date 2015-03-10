From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:00:19 +0100
Subject: [Buildroot] [git commit] softether: fix clock_gettime() linking
	issue with older glibcs
Message-ID: <20150310190317.21F0481808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=766366411386f5bba773042ada58e6379a3d0adf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

clock_gettime() is (used to be) provided by librt, so link with it.

Fixes:
http://autobuild.buildroot.net/results/5c1/5c1a1db7c97b5b1cc345daf316d2debde8f0f0b5/
http://autobuild.buildroot.net/results/6a9/6a983bc4ef24358c89474755dcf843a9f01dc1d4/
http://autobuild.buildroot.net/results/f18/f1853ce0f5aafa7ef4b9e3d8ccda50be7ec2c6a7/
http://autobuild.buildroot.net/results/9f8/9f88ab08d07e423fc2f01e6a1bb5e5ae945f02bd/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softether/softether.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 7f2dfb8..3b1ce40 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -16,13 +16,19 @@ SOFTETHER_AUTORECONF = YES
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 SOFTETHER_DEPENDENCIES += libiconv
-SOFTETHER_CONF_ENV = LIBS="-liconv"
+SOFTETHER_CONF_ENV = LIBS+=" -liconv"
 endif
 
 SOFTETHER_CONF_OPTS = \
 	--with-openssl="$(STAGING_DIR)/usr" \
 	--with-zlib="$(STAGING_DIR)/usr"
 
+# softether uses clock_gettime but forgets to link against -lrt
+# breaking the build against older libc's that don't provide this
+# symbol in libc
+SOFTETHER_CONF_ENV += LIBS+=" -lrt"
+HOST_SOFTETHER_CONF_ENV += LIBS+=" -lrt"
+
 # host-libiconv does not exist, therefore we need this extra line
 HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
 
