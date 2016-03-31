From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:49:14 +0200
Subject: [Buildroot] [git commit] libwebsockets: fix build with nothread
	toolchains
Message-ID: <20160331015641.A3F7780789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44dcf3ec02b5127378fc6569cfa69d251c2973e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From upstream changelog:
> If LWS_MAX_SMP=1, then there is no code related to pthreads compiled in the
  library. If more than 1, a small amount of pthread mutex code is built into
  the library.

Set LWS_MAX_SMP=1 for toolchains without thread support, otherwise leave it
unset so upstreams CMakeLists.txt will take care of it.

Fixes:
http://autobuild.buildroot.net/results/dbf/dbf45a52b9aef602fd62ad1ca10957bafe656923/
http://autobuild.buildroot.net/results/26c/26c2ac28f44f8f1b227caa715af60bcd92a5f740/
http://autobuild.buildroot.net/results/d65/d65dcbfb96b249e01b034c01a52884b522c778b3/
http://autobuild.buildroot.net/results/e55/e550ebfdd1e8f459ca7b12f2708a704eaec52474/
.. and more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libwebsockets/libwebsockets.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 395a2ed..8d3663f 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -13,6 +13,15 @@ LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
 LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/9eec5e4470397632af035c429295a41b74bd0585.patch
 
+# If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
+# in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
+# amount of pthread mutex code is built into the library.
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=1
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
