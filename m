From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Jan 2017 16:27:34 +0100
Subject: [Buildroot] [PATCH] clamav: break configure breakage after zlib
	1.2.10 version bump
Message-ID: <20170104152734.29384-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b6b/b6ba2dfb42ee41ed0b8304aa8c78645245f3b341/
http://autobuild.buildroot.net/results/eef/eef9a2dda2c172cd600dc74c1e5e60476d92280d/
http://autobuild.buildroot.net/results/827/82798118795aa6334b4dd6eac06777682131da7f/

The clamav configure script by default checks for old zlib versions with
known vulnerabilities and errors out if found:

configure: error: The installed zlib version may contain a security bug.
Please upgrade to 1.2.2 or later: http://www.zlib.net.  You can omit this
check with --disable-zlib-vcheck but DO NOT REPORT any stability issues
then!

The check is unfortunately not very robust as it simply checks for a version
string matching '1.2.1' (which 1.2.10 does):

vuln=`grep "ZLIB_VERSION \"1.2.1" $ZLIB_HOME/include/zlib.h`

As a workaround, pass --disable-zlib-vcheck to skip this check.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 6a82d66..36ab8be 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -26,6 +26,7 @@ CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
 	--with-openssl=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
+	--disable-zlib-vcheck \
 	--disable-rpath \
 	--disable-clamav \
 	--disable-fanotify \
-- 
2.10.2
