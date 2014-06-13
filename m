From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 22:01:51 +0200
Subject: [Buildroot] [git commit] haserl: bump 0.9.x version
Message-ID: <20140613200236.78B559CFBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f86ec0b67f147d23928091f27529c5fd47ef5f02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of security issues and adds support for PUT/DELETE. From the
release mail:

<snip>
Stephen R??ttger reported a number of security bugs, the most serious of
which is a potential heap overflow in sliding_buffer.c (file uploads).
There is a potential for remote code execution.

At the same time, I've made an *experimental* change to allow RESTful
API's possible:

* PUT and DELETE methods are handled by the POST and GET handlers.
* For mostly historical reasons, data on the URI is still called
GET.<var>, and data in the body is named POST.<var>
* If the Content-Type is not "application/x-www-form-urlencoded", Haserl
won't try to urldecode the POST contents - it will just put the body in
POST.body verbatim.
</snip>

The lua handling now uses pkg-config, so adjust the code to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haserl/Config.in |    2 +-
 package/haserl/haserl.mk |   12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index bfe1df8..680e280 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -41,4 +41,4 @@ endif
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.30"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.33"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 56240c7..4b46f04 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -12,13 +12,21 @@ HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
 endif
 HASERL_LICENSE = GPLv2
 HASERL_LICENSE_FILES = COPYING
+HASERL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
-	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
-		--with-lua-headers=$(STAGING_DIR)
+	HASERL_CONF_OPT += --with-lua
 	HASERL_DEPENDENCIES += lua host-lua
+
+# liblua uses dlopen when dynamically linked
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+	HASERL_CONF_ENV += LIBS="-ldl"
+endif
+
 	# lua2c is built for host, so needs to find host libs/headers
 	HASERL_MAKE_OPT += lua2c_LDFLAGS='$(HOST_CFLAGS) $(HOST_LDFLAGS)'
+else
+	HASERL_CONF_OPT += --without-lua
 endif
 
 define HASERL_REMOVE_EXAMPLES
