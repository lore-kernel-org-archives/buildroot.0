From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 08:54:26 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: add support for
 extensions
Message-ID: <20200727064957.EEA9686E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b0d79ea5e10f485fcd38c4224257ccda3907806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libwebsockets currently depends on zlib, however, as of commit
13ba5bbc633ea962d46d9f2bfb2e87c9f7e83b62 (from 2013!) zlib is not actually a
requirement if extensions are not enabled.

By default, libwebsockets sets the "LWS_WITHOUT_EXTENSIONS" option to "ON,"
which removes the need for zlib as a dependency. Because of this default
setting, there are two options:

1) Remove the dependency on zlib, create a new option under Config.in to allow
a user to enable extensions, add zlib as a dependency, and set
LWS_WITHOUT_EXTENSIONS to "OFF" if that option is selected.

2) Keep the dependency and explicitly set LWS_WITHOUT_EXTENSIONS to "OFF."

Below are the size differences in bytes:
  - Without zlib and extensions: 44636
  - With zlib and without extensions: 44720
  - With zlib and with extensions: 44732

Considering the size difference between all 3 is an incredible 96 bytes, and
the difference between what we have now, and enabling extensions is an
insurmountable 12 bytes, it is safe to keep the dependency on zlib and always
enable extensions.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/libwebsockets.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 3af34a61ab..6716d52796 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -13,7 +13,8 @@ LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
-	-DLWS_UNIX_SOCK=ON
+	-DLWS_UNIX_SOCK=ON \
+	-DLWS_WITHOUT_EXTENSIONS=OFF
 
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
