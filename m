From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Fri, 14 Aug 2020 16:38:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
Message-ID: <1597415885-30801-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

IPTraf-ng is a console-based network monitoring program for Linux that
displays information about IP traffic. It returns such information as:

- Current TCP connections
- UDP, ICMP, OSPF, and other types of IP packets
- Packet and byte counts on TCP connections
- IP, TCP, UDP, ICMP, non-IP, and other packet and byte counts
- TCP/UDP counts by ports
- Packet counts by packet sizes
- Packet and byte counts by IP address
- Interface activity
- Flag statuses on TCP packets
- LAN station statistics

Version 1.1.4 is deprecated (2013) which must be updated by current version.

Note : old download link (https://fedorahosted.org/)
       has been stopped from being maintained as the project moved to
       https://fedorahosted.org/releases/i/p/iptraf-ng.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 ...-not-found-issue-during-cross-compilation.patch | 102 +++++++++++++++++++++
 package/iptraf-ng/Config.in                        |   7 +-
 package/iptraf-ng/iptraf-ng.hash                   |   3 +-
 package/iptraf-ng/iptraf-ng.mk                     |  19 +++-
 4 files changed, 120 insertions(+), 11 deletions(-)
 create mode 100644 package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch

diff --git a/package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch b/package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch
new file mode 100644
index 0000000..609403e
--- /dev/null
+++ b/package/iptraf-ng/0001-Fix-file-not-found-issue-during-cross-compilation.patch
@@ -0,0 +1,102 @@
+From e4fde25079ac22bd26e4583bf696bc11cca038f8 Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Fri, 14 Aug 2020 15:54:18 +0200
+Subject: [PATCH 1/1] Fix file not found issue during cross compilation
+
+Files in src/tui include iptraf-ng-compat.h as if it was in
+the same folder. Header's relative location must be explicitly
+defined otherwise compilation throws error : NO SUCH FILE.
+
+PR : https://github.com/iptraf-ng/iptraf-ng/pull/30.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+---
+ src/tui/input.c    | 2 +-
+ src/tui/labels.c   | 2 +-
+ src/tui/listbox.c  | 2 +-
+ src/tui/menurt.c   | 2 +-
+ src/tui/msgboxes.c | 2 +-
+ src/tui/winops.c   | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/tui/input.c b/src/tui/input.c
+index 8ed6081..a5f63ea 100644
+--- a/src/tui/input.c
++++ b/src/tui/input.c
+@@ -7,7 +7,7 @@ input.c - a custom keyboard input module
+ 
+ ***/
+ 
+-#include "iptraf-ng-compat.h"
++#include "../iptraf-ng-compat.h"
+ 
+ #include "input.h"
+ 
+diff --git a/src/tui/labels.c b/src/tui/labels.c
+index e4e11fb..4dd8991 100644
+--- a/src/tui/labels.c
++++ b/src/tui/labels.c
+@@ -6,7 +6,7 @@
+  * user interface library
+  */
+ 
+-#include "iptraf-ng-compat.h"
++#include "../iptraf-ng-compat.h"
+ 
+ #include "winops.h"
+ 
+diff --git a/src/tui/listbox.c b/src/tui/listbox.c
+index daecf66..31c394c 100644
+--- a/src/tui/listbox.c
++++ b/src/tui/listbox.c
+@@ -5,7 +5,7 @@
+  * listbox.c - scrollable listbox management module
+  */
+ 
+-#include "iptraf-ng-compat.h"
++#include "../iptraf-ng-compat.h"
+ 
+ #include "winops.h"
+ #include "labels.h"
+diff --git a/src/tui/menurt.c b/src/tui/menurt.c
+index fb3f002..49e6754 100644
+--- a/src/tui/menurt.c
++++ b/src/tui/menurt.c
+@@ -7,7 +7,7 @@ menurt.c - ncurses-based menu definition module
+ 
+ ***/
+ 
+-#include "iptraf-ng-compat.h"
++#include "../iptraf-ng-compat.h"
+ 
+ #include "menurt.h"
+ #include "winops.h"
+diff --git a/src/tui/msgboxes.c b/src/tui/msgboxes.c
+index 76ae4fa..3e29282 100644
+--- a/src/tui/msgboxes.c
++++ b/src/tui/msgboxes.c
+@@ -5,7 +5,7 @@
+  * msgboxes.c - message and error box display functions
+  */
+ 
+-#include "iptraf-ng-compat.h"
++#include "../iptraf-ng-compat.h"
+ 
+ #include "winops.h"
+ 
+diff --git a/src/tui/winops.c b/src/tui/winops.c
+index d866281..36ac663 100644
+--- a/src/tui/winops.c
++++ b/src/tui/winops.c
+@@ -7,7 +7,7 @@ winops.c - screen configuration and setup functions
+ 
+ ***/
+ 
+-#include "iptraf-ng-compat.h"
++#include "../iptraf-ng-compat.h"
+ 
+ void tx_stdwinset(WINDOW * win)
+ {
+-- 
+2.7.4
+
diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index 5c3b484..f240daf 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -3,11 +3,10 @@ config BR2_PACKAGE_IPTRAF_NG
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
-	  IPTraf-ng is a ncurses-based network monitoring utility. It
-	  gathers data like TCP connection packet and byte counts,
-	  interface statistics and activity indicators.
+	  IPTraf-ng is a console-based network monitoring program for
+	  Linux that gathers displays information about IP traffic.
 
-	  https://fedorahosted.org/iptraf-ng/
+	  https://github.com/iptraf-ng/iptraf-ng
 
 	  IPTraf-ng is a fork of original IPTraf v3.0.0
 	  (http://iptraf.seul.org).
diff --git a/package/iptraf-ng/iptraf-ng.hash b/package/iptraf-ng/iptraf-ng.hash
index 0a257ec..67f0ee2 100644
--- a/package/iptraf-ng/iptraf-ng.hash
+++ b/package/iptraf-ng/iptraf-ng.hash
@@ -1,4 +1,3 @@
-# From https://fedorahosted.org/releases/i/p/iptraf-ng/iptraf-ng-1.1.4.tar.gz.sum
-sha1	a2e51b0dd6b8c80583fc25d055850c96b3d2f544	iptraf-ng-1.1.4.tar.gz
 # Locally computed
+sha256	a53fa7bd5472e7103c5922e067912432c2a2f2a549a49334d2d1727f2e98e1ec  iptraf-ng-v1.2.1.tar.gz
 sha256  4e49bef38f621aac4a870da4b30011c7b7abc7256b218daec1c425b08448ae1e  LICENSE
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index ac572b9..1138b7a 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -4,16 +4,25 @@
 #
 ################################################################################
 
-IPTRAF_NG_VERSION = 1.1.4
-IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng
+IPTRAF_NG_VERSION = v1.2.1
+IPTRAF_NG_SITE = https://github.com/iptraf-ng/iptraf-ng.git
+IPTRAF_NG_SITE_METHOD = git
 IPTRAF_NG_LICENSE = GPL-2.0+
 IPTRAF_NG_LICENSE_FILES = LICENSE
+IPTRAF_NG_INSTALL_TARGET = YES
 IPTRAF_NG_DEPENDENCIES = ncurses
 
+
 IPTRAF_NG_MAKE_ENV = \
 	NCURSES_LDFLAGS="-lpanel -lncurses"
 
-IPTRAF_NG_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-$(eval $(autotools-package))
+define IPTRAF_NG_BUILD_CMDS
+	$(MAKE) HOME=$(HOST_DIR)/usr/ $(TARGET_CONFIGURE_OPTS) \
+	$(IPTRAF_NG_MAKE_ENV) -C $(@D) all
+endef
+define IPTRAF_NG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/iptraf-ng $(TARGET_DIR)/usr/bin/iptraf-ng
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
