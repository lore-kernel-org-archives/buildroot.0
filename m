From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 10 May 2019 00:45:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] iputils: Bump to version s20190324
Message-ID: <20190509224508.14526-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changed build system to Meson, these extra changes were
required:

* remove custom commands of previous build system
(IPUTILS_INSTALL_TARGET_CMDS, IPUTILS_PERMISSIONS).

* backport commits
  - f65b38b ("ping6_common.c: include stddef.h"): build error fix
  - 784a67c ("build-sys: make setcap-setuid.sh respect ${DESTDIR}":
    fix setcap-setuid.sh for cross compilation

Removed patch included in this release.

Build ninfod if possible (when use any crypto).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
NOTE: there are other valuable upstream fixes for users, but I used only
these needed to fix build (1) I guess that's a buildroot policy 2) I
hope bugfix upstream release happens in reasonable time.

Kind regards,
Petr

 ...ix-AI_CANONIDN-usage-on-some-systems.patch | 57 ------------------
 ...0001-ping6_common.c-include-stddef.h.patch | 25 ++++++++
 ...ake-setcap-setuid.sh-respect-DESTDIR.patch | 28 +++++++++
 package/iputils/iputils.hash                  |  2 +-
 package/iputils/iputils.mk                    | 58 +++++--------------
 5 files changed, 70 insertions(+), 100 deletions(-)
 delete mode 100644 package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
 create mode 100644 package/iputils/0001-ping6_common.c-include-stddef.h.patch
 create mode 100644 package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch

diff --git a/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch b/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
deleted file mode 100644
index 556d3786fb..0000000000
--- a/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 25899e849aa3abc1ad29ebf0b830262a859eaed5 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sat, 21 Jul 2018 17:46:14 +0200
-Subject: [PATCH] ping: Fix AI_CANONIDN usage on some systems
-
-Commit 99f67db used AI_CANONIDN in a way, which broke compilation on
-systems where AI_CANONIDN is not defined in netdb.h (e.g. glibc < 2.3.4,
-alternative libcs that don't support IDN: e.g. current musl 1.1.19 and
-uClibc-ng 1.0.30) when not using the system libidn2.
-
-Fixes: 99f67db ping: Fix ping name encoded using ACE on C locale
-
-Reported-by: Nicholas Fish
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- ping.c | 2 +-
- ping.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ping.c b/ping.c
-index 733477f..b241815 100644
---- a/ping.c
-+++ b/ping.c
-@@ -207,9 +207,9 @@ main(int argc, char **argv)
- 
- #ifdef USE_IDN
- 	setlocale(LC_ALL, "");
--#endif
- 	if (!strcmp(setlocale(LC_ALL, NULL), "C"))
- 		hints.ai_flags &= ~ AI_CANONIDN;
-+#endif
- 
- 	/* Support being called using `ping4` or `ping6` symlinks */
- 	if (argv[0][strlen(argv[0])-1] == '4')
-diff --git a/ping.h b/ping.h
-index 3e09685..8a0c4ef 100644
---- a/ping.h
-+++ b/ping.h
-@@ -28,7 +28,6 @@
- #include <netinet/icmp6.h>
- #include <linux/filter.h>
- #include <resolv.h>
--#include <locale.h>
- 
- #ifdef CAPABILITIES
- #include <sys/prctl.h>
-@@ -36,6 +35,7 @@
- #endif
- 
- #ifdef USE_IDN
-+#include <locale.h>
- #include <idn2.h>
- #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
- #define getnameinfo_flags NI_IDN
--- 
-2.19.0.rc2
-
diff --git a/package/iputils/0001-ping6_common.c-include-stddef.h.patch b/package/iputils/0001-ping6_common.c-include-stddef.h.patch
new file mode 100644
index 0000000000..edc8866c31
--- /dev/null
+++ b/package/iputils/0001-ping6_common.c-include-stddef.h.patch
@@ -0,0 +1,25 @@
+From f65b38b9317e1298cfc5877b0eed7c7badbe597a Mon Sep 17 00:00:00 2001
+From: Mikhail Efremov <sem@altlinux.org>
+Date: Mon, 25 Mar 2019 21:41:36 +0300
+Subject: [PATCH] ping6_common.c: include stddef.h
+
+Requird by offsetof().
+---
+ ping6_common.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ping6_common.c b/ping6_common.c
+index 4989e00..8115106 100644
+--- a/ping6_common.c
++++ b/ping6_common.c
+@@ -57,6 +57,7 @@
+  *	if -N option is used, this program has to run SUID to ROOT or
+  *	with net_cap_raw enabled.
+  */
++#include <stddef.h>
+ #include "iputils_common.h"
+ #include "iputils_ni.h"
+ #include "ping.h"
+-- 
+2.21.0
+
diff --git a/package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch b/package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch
new file mode 100644
index 0000000000..5f2104ce27
--- /dev/null
+++ b/package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch
@@ -0,0 +1,28 @@
+From 784a67cb339cc43db86a676de00b51cb4101d1d6 Mon Sep 17 00:00:00 2001
+From: Arfrever Frehtes Taifersar Arahesis <Arfrever@Apache.Org>
+Date: Mon, 1 Apr 2019 00:30:20 +0000
+Subject: [PATCH] build-sys: make setcap-setuid.sh respect ${DESTDIR}
+
+Reference: https://github.com/iputils/iputils/issues/175
+---
+ build-aux/setcap-setuid.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/build-aux/setcap-setuid.sh b/build-aux/setcap-setuid.sh
+index f317a22..f832978 100755
+--- a/build-aux/setcap-setuid.sh
++++ b/build-aux/setcap-setuid.sh
+@@ -6,6 +6,10 @@ exec_path="$1/$2"
+ perm_type="$3"
+ setcap="$4"
+ 
++if [ -n "${DESTDIR}" ]; then
++	exec_path="${DESTDIR%/}/${exec_path}"
++fi
++
+ case "$perm_type" in
+ 	'caps')
+ 		echo "$0: calling: $setcap cap_net_raw+ep $exec_path"
+-- 
+2.21.0
+
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 14e2c67134..d74d3c7d76 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 da14105291dd491f28ea91ade854ed10aee8ba019641c80eed233de3908be7c5  iputils-s20180629.tar.gz
+sha256 b1d4b6e6dc7f011b1463722e6ac4c676d2e6146f49e784ac607fa3106fd277d3  iputils-s20190324.tar.gz
 sha256 966075293e45785230c19415bcda15bd07c75bead4fe73332d1a4b9c45bb321f  ninfod/COPYING
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8371971231..2718e1a9fe 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,61 +11,35 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = s20180629
+IPUTILS_VERSION = s20190324
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 
-IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-IPUTILS_MAKE_OPTS += USE_CAP=yes
+IPUTILS_CONF_OPTS += -DUSE_CAP=true
 IPUTILS_DEPENDENCIES += libcap
 else
-IPUTILS_MAKE_OPTS += USE_CAP=no
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-IPUTILS_MAKE_OPTS += USE_GCRYPT=yes
-IPUTILS_DEPENDENCIES += libgcrypt
-else
-IPUTILS_MAKE_OPTS += USE_GCRYPT=no
+IPUTILS_CONF_OPTS += -DUSE_CAP=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETTLE),y)
-IPUTILS_MAKE_OPTS += USE_NETTLE=yes
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
 IPUTILS_DEPENDENCIES += nettle
-else
-IPUTILS_MAKE_OPTS += USE_NETTLE=no
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-IPUTILS_MAKE_OPTS += USE_CRYPTO=yes
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=gcrypt
+IPUTILS_DEPENDENCIES += libgcrypt
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=openssl
 IPUTILS_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LINUX_HEADERS),y)
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
+IPUTILS_DEPENDENCIES += linux-headers
 else
-IPUTILS_MAKE_OPTS += USE_CRYPTO=no
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
+# BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
-define IPUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
-endef
-
-define IPUTILS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/arping      $(TARGET_DIR)/sbin/arping
-	$(INSTALL) -D -m 755 $(@D)/clockdiff   $(TARGET_DIR)/bin/clockdiff
-	$(INSTALL) -D -m 755 $(@D)/ping        $(TARGET_DIR)/bin/ping
-	$(INSTALL) -D -m 755 $(@D)/rarpd       $(TARGET_DIR)/sbin/rarpd
-	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
-	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
-	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
-	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
-endef
-
-define IPUTILS_PERMISSIONS
-	/bin/ping        f 4755 0 0 - - - - -
-	/bin/traceroute6 f 4755 0 0 - - - - -
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.21.0
