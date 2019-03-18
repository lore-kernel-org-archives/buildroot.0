From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:55:38 +0100
Subject: [Buildroot] [git commit] package/libpcap: fix bluez circular
 dependency
Message-ID: <20190318205230.26E4D8F3FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c46afc37dc877f1e94ffde0d77585290711b27ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optional bluez_utils dependency of libpcap creates a circular
dependency:

$ make dbus-show-recursive-depends

Recursion detected for  : systemd
which is a dependency of: dbus
which is a dependency of: bluez_utils
which is a dependency of: libpcap
which is a dependency of: iptables
which is a dependency of: systemd
make: *** [package/dbus/dbus.mk:121: dbus-show-recursive-depends] Error 1

Drop support for bluez_utils. For bluez5_utils, which also depends on
dbus, we only need the headers in the bluez5_utils-headers package. Use
that to break the circular dependency.

Fixes:
http://autobuild.buildroot.net/results/9c3/9c3ee798fa6bb501a20a7892c0b085d2b279b664/

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpcap/libpcap.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 83188c8c48..2f46426d37 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -26,10 +26,8 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
 endef
 LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-LIBPCAP_DEPENDENCIES += bluez_utils
-else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
-LIBPCAP_DEPENDENCIES += bluez5_utils
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+LIBPCAP_DEPENDENCIES += bluez5_utils-headers
 else
 LIBPCAP_CONF_OPTS += --disable-bluetooth
 endif
