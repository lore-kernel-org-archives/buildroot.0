From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:44:22 +0100
Subject: [Buildroot] [git commit] package/mosquitto: bump version to 2.0.0
Message-ID: <20201214143024.DC9727FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2af6d8a875809c512578a59c3cd52d5e51c0c51a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new major version, see the announcement for details:
https://mosquitto.org/blog/2020/12/version-2-0-0-released/

License has now changed to v2.0 of the Eclipse Public License, so update the
license info and hashes to match.

There is now optional cJSON support, so handle that.

Add upstream post-2.0.0 patches fixing build with cJSON and without TLS
support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-apps-mosquitto_ctrl-don-t-hard-set-paths.patch |  32 +++
 .../mosquitto/0002-Fix-cjson-include-paths.patch   | 305 +++++++++++++++++++++
 ...sing-WITH_TLS-no-when-the-openssl-headers.patch |  47 ++++
 .../0004-Drop-hard-coded-linker-flags.patch        |  48 ++++
 package/mosquitto/mosquitto.hash                   |   8 +-
 package/mosquitto/mosquitto.mk                     |  13 +-
 6 files changed, 446 insertions(+), 7 deletions(-)

diff --git a/package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch b/package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch
new file mode 100644
index 0000000000..b69740aff2
--- /dev/null
+++ b/package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch
@@ -0,0 +1,32 @@
+From 58a06f33313ad23d406514a03ab8d8f13e3cc44e Mon Sep 17 00:00:00 2001
+From: Karl Palsson <karlp@etactica.com>
+Date: Fri, 4 Dec 2020 21:33:18 +0000
+Subject: [PATCH] apps: mosquitto_ctrl: don't hard set paths
+
+In a cross compile environment, these paths will be added elsewhere, and
+in a local environment, they should already be covered by the system
+compiler.  Simply drop them.
+
+Signed-off-by: Karl Palsson <karlp@etactica.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ apps/mosquitto_ctrl/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/apps/mosquitto_ctrl/Makefile b/apps/mosquitto_ctrl/Makefile
+index 59b23596..3a4843bf 100644
+--- a/apps/mosquitto_ctrl/Makefile
++++ b/apps/mosquitto_ctrl/Makefile
+@@ -8,8 +8,7 @@ else
+ LIBMOSQ:=../../lib/libmosquitto.a
+ endif
+ 
+-LOCAL_CPPFLAGS:=-I/usr/include/cjson -I/usr/local/include/cjson -I../mosquitto_passwd
+-LOCAL_LDFLAGS:=-L/usr/local/lib
++LOCAL_CPPFLAGS:=-I../mosquitto_passwd
+ 
+ OBJS=	mosquitto_ctrl.o \
+ 		client.o \
+-- 
+2.20.1
+
diff --git a/package/mosquitto/0002-Fix-cjson-include-paths.patch b/package/mosquitto/0002-Fix-cjson-include-paths.patch
new file mode 100644
index 0000000000..1fe7264c9a
--- /dev/null
+++ b/package/mosquitto/0002-Fix-cjson-include-paths.patch
@@ -0,0 +1,305 @@
+From 791c63372b1e0a8818845a22c54a555843e06891 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 4 Dec 2020 22:15:19 +0000
+Subject: [PATCH] Fix cjson include paths.
+
+[Peter: drop cmake/, snap/ changes as those are not in tarball]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ChangeLog.txt                               | 3 +++
+ apps/mosquitto_ctrl/dynsec.c                | 2 +-
+ apps/mosquitto_ctrl/dynsec_client.c         | 2 +-
+ apps/mosquitto_ctrl/dynsec_group.c          | 2 +-
+ apps/mosquitto_ctrl/dynsec_role.c           | 2 +-
+ apps/mosquitto_ctrl/example.c               | 2 +-
+ apps/mosquitto_ctrl/mosquitto_ctrl.h        | 2 +-
+ client/sub_client_output.c                  | 2 +-
+ config.h                                    | 2 +-
+ config.mk                                   | 2 +-
+ plugins/dynamic-security/Makefile           | 2 +-
+ plugins/dynamic-security/clientlist.c       | 2 +-
+ plugins/dynamic-security/clients.c          | 2 +-
+ plugins/dynamic-security/dynamic_security.h | 2 +-
+ plugins/dynamic-security/grouplist.c        | 2 +-
+ plugins/dynamic-security/groups.c           | 2 +-
+ plugins/dynamic-security/json_help.c        | 2 +-
+ plugins/dynamic-security/json_help.h        | 2 +-
+ plugins/dynamic-security/plugin.c           | 2 +-
+ plugins/dynamic-security/rolelist.c         | 2 +-
+ plugins/dynamic-security/roles.c            | 2 +-
+ 21 files changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 240f4a80..030ea8c5 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,6 @@
++- Fix cjson include paths.
++
++
+ 2.0.0 - 2020-12-03
+ ==================
+ 
+diff --git a/apps/mosquitto_ctrl/dynsec.c b/apps/mosquitto_ctrl/dynsec.c
+index 96aae993..35d29e9d 100644
+--- a/apps/mosquitto_ctrl/dynsec.c
++++ b/apps/mosquitto_ctrl/dynsec.c
+@@ -17,7 +17,7 @@ Contributors:
+ */
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/apps/mosquitto_ctrl/dynsec_client.c b/apps/mosquitto_ctrl/dynsec_client.c
+index 1dea7862..45b6d6af 100644
+--- a/apps/mosquitto_ctrl/dynsec_client.c
++++ b/apps/mosquitto_ctrl/dynsec_client.c
+@@ -15,7 +15,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
+ Contributors:
+    Roger Light - initial implementation and documentation.
+ */
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/apps/mosquitto_ctrl/dynsec_group.c b/apps/mosquitto_ctrl/dynsec_group.c
+index b0faf27b..4b5ceca5 100644
+--- a/apps/mosquitto_ctrl/dynsec_group.c
++++ b/apps/mosquitto_ctrl/dynsec_group.c
+@@ -15,7 +15,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
+ Contributors:
+    Roger Light - initial implementation and documentation.
+ */
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/apps/mosquitto_ctrl/dynsec_role.c b/apps/mosquitto_ctrl/dynsec_role.c
+index 10b26efa..2bc5a03d 100644
+--- a/apps/mosquitto_ctrl/dynsec_role.c
++++ b/apps/mosquitto_ctrl/dynsec_role.c
+@@ -17,7 +17,7 @@ Contributors:
+ */
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/apps/mosquitto_ctrl/example.c b/apps/mosquitto_ctrl/example.c
+index 63ba3eb0..1027fb60 100644
+--- a/apps/mosquitto_ctrl/example.c
++++ b/apps/mosquitto_ctrl/example.c
+@@ -15,7 +15,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
+ Contributors:
+    Roger Light - initial implementation and documentation.
+ */
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/apps/mosquitto_ctrl/mosquitto_ctrl.h b/apps/mosquitto_ctrl/mosquitto_ctrl.h
+index 52bbc9a8..0c9c931a 100644
+--- a/apps/mosquitto_ctrl/mosquitto_ctrl.h
++++ b/apps/mosquitto_ctrl/mosquitto_ctrl.h
+@@ -18,7 +18,7 @@ Contributors:
+ #ifndef MOSQUITTO_CTRL_H
+ #define MOSQUITTO_CTRL_H
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdbool.h>
+ 
+ #include "mosquitto.h"
+diff --git a/client/sub_client_output.c b/client/sub_client_output.c
+index 167071f8..a70d59ec 100644
+--- a/client/sub_client_output.c
++++ b/client/sub_client_output.c
+@@ -38,7 +38,7 @@ Contributors:
+ #endif
+ 
+ #ifdef WITH_CJSON
+-#  include <cJSON.h>
++#  include <cjson/cJSON.h>
+ #endif
+ 
+ #ifdef __APPLE__
+diff --git a/config.h b/config.h
+index 77da39df..bdce7469 100644
+--- a/config.h
++++ b/config.h
+@@ -74,7 +74,7 @@
+ #endif
+ 
+ #ifdef WITH_CJSON
+-#  include <cJSON.h>
++#  include <cjson/cJSON.h>
+ #  define CJSON_VERSION_FULL (CJSON_VERSION_MAJOR*1000000+CJSON_VERSION_MINOR*1000+CJSON_VERSION_PATCH)
+ #endif
+ 
+diff --git a/config.mk b/config.mk
+index 3e0c3240..e8be1aa1 100644
+--- a/config.mk
++++ b/config.mk
+@@ -364,7 +364,7 @@ ifeq ($(WITH_COVERAGE),yes)
+ endif
+ 
+ ifeq ($(WITH_CJSON),yes)
+-	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON -I/usr/include/cjson -I/usr/local/include/cjson
++	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON
+ 	CLIENT_LDADD:=$(CLIENT_LDADD) -lcjson
+ 	CLIENT_STATIC_LDADD:=$(CLIENT_STATIC_LDADD) -lcjson
+ 	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS) -L/usr/local/lib
+diff --git a/plugins/dynamic-security/Makefile b/plugins/dynamic-security/Makefile
+index 6fc50edd..559f531e 100644
+--- a/plugins/dynamic-security/Makefile
++++ b/plugins/dynamic-security/Makefile
+@@ -3,7 +3,7 @@ include ../../config.mk
+ .PHONY : all binary check clean reallyclean test install uninstall
+ 
+ PLUGIN_NAME=mosquitto_dynamic_security
+-LOCAL_CPPFLAGS=-I/usr/include/cjson -I/usr/local/include/cjson -I../../src/
++LOCAL_CPPFLAGS=-I../../src/
+ LOCAL_LDFLAGS=-L/usr/local/lib
+ 
+ OBJS=	\
+diff --git a/plugins/dynamic-security/clientlist.c b/plugins/dynamic-security/clientlist.c
+index 97957e07..d362a9b8 100644
+--- a/plugins/dynamic-security/clientlist.c
++++ b/plugins/dynamic-security/clientlist.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <uthash.h>
+ 
+diff --git a/plugins/dynamic-security/clients.c b/plugins/dynamic-security/clients.c
+index 5ae03b47..50a0922e 100644
+--- a/plugins/dynamic-security/clients.c
++++ b/plugins/dynamic-security/clients.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <uthash.h>
+ 
+diff --git a/plugins/dynamic-security/dynamic_security.h b/plugins/dynamic-security/dynamic_security.h
+index fcf39579..57c814b8 100644
+--- a/plugins/dynamic-security/dynamic_security.h
++++ b/plugins/dynamic-security/dynamic_security.h
+@@ -18,7 +18,7 @@ Contributors:
+    Roger Light - initial implementation and documentation.
+ */
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <uthash.h>
+ #include "mosquitto.h"
+ #include "password_mosq.h"
+diff --git a/plugins/dynamic-security/grouplist.c b/plugins/dynamic-security/grouplist.c
+index 85df7199..afdc0186 100644
+--- a/plugins/dynamic-security/grouplist.c
++++ b/plugins/dynamic-security/grouplist.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <uthash.h>
+ 
+diff --git a/plugins/dynamic-security/groups.c b/plugins/dynamic-security/groups.c
+index 5157113a..144b3244 100644
+--- a/plugins/dynamic-security/groups.c
++++ b/plugins/dynamic-security/groups.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <uthash.h>
+ 
+diff --git a/plugins/dynamic-security/json_help.c b/plugins/dynamic-security/json_help.c
+index 04e5b3cf..dd8379c9 100644
+--- a/plugins/dynamic-security/json_help.c
++++ b/plugins/dynamic-security/json_help.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+diff --git a/plugins/dynamic-security/json_help.h b/plugins/dynamic-security/json_help.h
+index f80f1447..b1b6aed0 100644
+--- a/plugins/dynamic-security/json_help.h
++++ b/plugins/dynamic-security/json_help.h
+@@ -17,7 +17,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
+ Contributors:
+    Roger Light - initial implementation and documentation.
+ */
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdbool.h>
+ 
+ /* "optional==false" can also be taken to mean "only return success if the key exists and is valid" */
+diff --git a/plugins/dynamic-security/plugin.c b/plugins/dynamic-security/plugin.c
+index 76aae115..c41e498c 100644
+--- a/plugins/dynamic-security/plugin.c
++++ b/plugins/dynamic-security/plugin.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/plugins/dynamic-security/rolelist.c b/plugins/dynamic-security/rolelist.c
+index f2c4cda2..6df19d21 100644
+--- a/plugins/dynamic-security/rolelist.c
++++ b/plugins/dynamic-security/rolelist.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <uthash.h>
+diff --git a/plugins/dynamic-security/roles.c b/plugins/dynamic-security/roles.c
+index 7b33bdc0..635ddefd 100644
+--- a/plugins/dynamic-security/roles.c
++++ b/plugins/dynamic-security/roles.c
+@@ -18,7 +18,7 @@ Contributors:
+ 
+ #include "config.h"
+ 
+-#include <cJSON.h>
++#include <cjson/cJSON.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <uthash.h>
+-- 
+2.20.1
+
diff --git a/package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch b/package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch
new file mode 100644
index 0000000000..b228538680
--- /dev/null
+++ b/package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch
@@ -0,0 +1,47 @@
+From c25229c13a738af3efeb67724c6ca3dcb91971bd Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 4 Dec 2020 23:44:38 +0000
+Subject: [PATCH] Fix build using WITH_TLS=no when the openssl headers aren't
+ available.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ChangeLog.txt       |  2 ++
+ src/password_mosq.c | 10 ++++++----
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 030ea8c5..868e3e8a 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,4 +1,6 @@
++Build:
+ - Fix cjson include paths.
++- Fix build using WITH_TLS=no when the openssl headers aren't available.
+ 
+ 
+ 2.0.0 - 2020-12-03
+diff --git a/src/password_mosq.c b/src/password_mosq.c
+index 73b81976..62e06925 100644
+--- a/src/password_mosq.c
++++ b/src/password_mosq.c
+@@ -19,10 +19,12 @@ Contributors:
+ #include "config.h"
+ 
+ #include <errno.h>
+-#include <openssl/opensslv.h>
+-#include <openssl/evp.h>
+-#include <openssl/rand.h>
+-#include <openssl/buffer.h>
++#ifdef WITH_TLS
++#  include <openssl/opensslv.h>
++#  include <openssl/evp.h>
++#  include <openssl/rand.h>
++#  include <openssl/buffer.h>
++#endif
+ #include <signal.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.20.1
+
diff --git a/package/mosquitto/0004-Drop-hard-coded-linker-flags.patch b/package/mosquitto/0004-Drop-hard-coded-linker-flags.patch
new file mode 100644
index 0000000000..f91012a02f
--- /dev/null
+++ b/package/mosquitto/0004-Drop-hard-coded-linker-flags.patch
@@ -0,0 +1,48 @@
+From 3047374693a438cac3a43f461cf223ec7a91ea87 Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Sun, 6 Dec 2020 07:43:59 +0000
+Subject: [PATCH] Drop hard coded linker flags.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ config.mk                         | 2 +-
+ plugins/dynamic-security/Makefile | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index e8be1aa1..f2520b3d 100644
+--- a/config.mk
++++ b/config.mk
+@@ -367,7 +367,7 @@ ifeq ($(WITH_CJSON),yes)
+ 	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON
+ 	CLIENT_LDADD:=$(CLIENT_LDADD) -lcjson
+ 	CLIENT_STATIC_LDADD:=$(CLIENT_STATIC_LDADD) -lcjson
+-	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS) -L/usr/local/lib
++	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS)
+ endif
+ 
+ ifeq ($(WITH_XTREPORT),yes)
+diff --git a/plugins/dynamic-security/Makefile b/plugins/dynamic-security/Makefile
+index 559f531e..203fbc3e 100644
+--- a/plugins/dynamic-security/Makefile
++++ b/plugins/dynamic-security/Makefile
+@@ -4,7 +4,6 @@ include ../../config.mk
+ 
+ PLUGIN_NAME=mosquitto_dynamic_security
+ LOCAL_CPPFLAGS=-I../../src/
+-LOCAL_LDFLAGS=-L/usr/local/lib
+ 
+ OBJS=	\
+ 		acl.o \
+@@ -33,7 +32,7 @@ all : ${ALL_DEPS}
+ binary : ${PLUGIN_NAME}.so
+ 
+ ${PLUGIN_NAME}.so : ${OBJS}
+-	${CROSS_COMPILE}${CC} $(PLUGIN_LDFLAGS) $(LOCAL_LDFLAGS) -fPIC -shared $^ -o $@ -lcjson
++	${CROSS_COMPILE}${CC} $(PLUGIN_LDFLAGS) -fPIC -shared $^ -o $@ -lcjson
+ 
+ acl.o : acl.c dynamic_security.h
+ 	${CROSS_COMPILE}${CC} $(LOCAL_CPPFLAGS) $(PLUGIN_CPPFLAGS) $(PLUGIN_CFLAGS) -c $< -o $@
+-- 
+2.20.1
+
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 13f0c8de23..f1b16bfd03 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.12.tar.gz.asc
-sha256  548d73d19fb787dd0530334e398fd256ef3a581181678488a741a995c4f007fb  mosquitto-1.6.12.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.0.tar.gz.asc
+sha256  ca8c21d1b04037df27639de9ea8f82fa73e1cbd24e83e6394ed67b537c4b6d86  mosquitto-2.0.0.tar.gz
 
 # License files
-sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
-sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
+sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
+sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index fcd9cb7de9..2f92b57e27 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.12
+MOSQUITTO_VERSION = 2.0.0
 MOSQUITTO_SITE = https://mosquitto.org/files/source
-MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
-MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
+MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
+MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 MOSQUITTO_INSTALL_STAGING = YES
 
 MOSQUITTO_MAKE_OPTS = \
@@ -57,6 +57,13 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
 endif
 
+ifeq ($(BR2_PACKAGE_CJSON),y)
+MOSQUITTO_DEPENDENCIES += cjson
+MOSQUITTO_MAKE_OPTS += WITH_CJSON=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_CJSON=no
+endif
+
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 MOSQUITTO_DEPENDENCIES += c-ares
 MOSQUITTO_MAKE_OPTS += WITH_SRV=yes
