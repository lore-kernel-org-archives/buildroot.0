From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Dec 2020 16:43:13 +0100
Subject: [Buildroot] [PATCH] package/mosquitto: bump version to 2.0.2
Message-ID: <20201215154313.8788-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bugfix release.  Drop the now upstreamed patches and add 3 new post-2.0.2
patches from the fixes branch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tall-target-when-using-WITH_CJSON-no.patch |  62 ++++
 ...-mosquitto_ctrl-don-t-hard-set-paths.patch |  32 --
 .../0002-Fix-cjson-include-paths.patch        | 305 ------------------
 ..._passwd-b-using-username-as-password.patch |  31 ++
 ...WT-not-being-sent-on-client-takeover.patch | 138 ++++++++
 ...WITH_TLS-no-when-the-openssl-headers.patch |  47 ---
 .../0004-Drop-hard-coded-linker-flags.patch   |  48 ---
 package/mosquitto/mosquitto.hash              |   4 +-
 package/mosquitto/mosquitto.mk                |   2 +-
 9 files changed, 234 insertions(+), 435 deletions(-)
 create mode 100644 package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch
 delete mode 100644 package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch
 delete mode 100644 package/mosquitto/0002-Fix-cjson-include-paths.patch
 create mode 100644 package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch
 create mode 100644 package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch
 delete mode 100644 package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch
 delete mode 100644 package/mosquitto/0004-Drop-hard-coded-linker-flags.patch

diff --git a/package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch b/package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch
new file mode 100644
index 0000000000..0bd3fedaee
--- /dev/null
+++ b/package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch
@@ -0,0 +1,62 @@
+From f7dc138157ca2252d7ed58b61daad19b63fcfe4c Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Fri, 11 Dec 2020 00:02:43 +0000
+Subject: [PATCH] Fix `install` target when using WITH_CJSON=no.
+
+Closes #1938. Thanks to apple3306 and JulianCaruso.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop ChangeLog.txt hunk]
+---
+ apps/mosquitto_ctrl/Makefile      | 6 +++++-
+ plugins/dynamic-security/Makefile | 6 +++++-
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/apps/mosquitto_ctrl/Makefile b/apps/mosquitto_ctrl/Makefile
+index 3a4843bf..d2122abc 100644
+--- a/apps/mosquitto_ctrl/Makefile
++++ b/apps/mosquitto_ctrl/Makefile
+@@ -36,7 +36,7 @@ else
+ TARGET:=
+ endif
+ 
+-all : $(TARGET)
++all : ${TARGET}
+ 
+ mosquitto_ctrl : ${OBJS}
+ 	${CROSS_COMPILE}${CC} ${APP_LDFLAGS} $^ -o $@ $(PASSWD_LDADD) $(LOCAL_LDFLAGS) $(LIBMOSQ) -lcjson -ldl
+@@ -84,8 +84,12 @@ password_mosq.o : ../../src/password_mosq.c ../../src/password_mosq.h
+ 	${CROSS_COMPILE}${CC} $(APP_CPPFLAGS) $(APP_CFLAGS) -c $< -o $@
+ 
+ install : all
++ifeq ($(WITH_TLS),yes)
++ifeq ($(WITH_CJSON),yes)
+ 	$(INSTALL) -d "${DESTDIR}$(prefix)/bin"
+ 	$(INSTALL) ${STRIP_OPTS} mosquitto_ctrl "${DESTDIR}${prefix}/bin/mosquitto_ctrl"
++endif
++endif
+ 
+ uninstall :
+ 	-rm -f "${DESTDIR}${prefix}/bin/mosquitto_ctrl"
+diff --git a/plugins/dynamic-security/Makefile b/plugins/dynamic-security/Makefile
+index 203fbc3e..810a17ba 100644
+--- a/plugins/dynamic-security/Makefile
++++ b/plugins/dynamic-security/Makefile
+@@ -74,9 +74,13 @@ clean:
+ check: test
+ test:
+ 
+-install: ${PLUGIN_NAME}.so
++install: all
++ifeq ($(WITH_CJSON),yes)
++ifeq ($(WITH_TLS),yes)
+ 	$(INSTALL) -d "${DESTDIR}$(prefix)/lib"
+ 	$(INSTALL) ${STRIP_OPTS} ${PLUGIN_NAME}.so "${DESTDIR}${prefix}/lib/${PLUGIN_NAME}.so"
++endif
++endif
+ 
+ uninstall :
+ 	-rm -f "${DESTDIR}${prefix}/lib/${PLUGIN_NAME}.so"
+-- 
+2.20.1
+
diff --git a/package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch b/package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch
deleted file mode 100644
index b69740aff2..0000000000
--- a/package/mosquitto/0001-apps-mosquitto_ctrl-don-t-hard-set-paths.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 58a06f33313ad23d406514a03ab8d8f13e3cc44e Mon Sep 17 00:00:00 2001
-From: Karl Palsson <karlp@etactica.com>
-Date: Fri, 4 Dec 2020 21:33:18 +0000
-Subject: [PATCH] apps: mosquitto_ctrl: don't hard set paths
-
-In a cross compile environment, these paths will be added elsewhere, and
-in a local environment, they should already be covered by the system
-compiler.  Simply drop them.
-
-Signed-off-by: Karl Palsson <karlp@etactica.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- apps/mosquitto_ctrl/Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/apps/mosquitto_ctrl/Makefile b/apps/mosquitto_ctrl/Makefile
-index 59b23596..3a4843bf 100644
---- a/apps/mosquitto_ctrl/Makefile
-+++ b/apps/mosquitto_ctrl/Makefile
-@@ -8,8 +8,7 @@ else
- LIBMOSQ:=../../lib/libmosquitto.a
- endif
- 
--LOCAL_CPPFLAGS:=-I/usr/include/cjson -I/usr/local/include/cjson -I../mosquitto_passwd
--LOCAL_LDFLAGS:=-L/usr/local/lib
-+LOCAL_CPPFLAGS:=-I../mosquitto_passwd
- 
- OBJS=	mosquitto_ctrl.o \
- 		client.o \
--- 
-2.20.1
-
diff --git a/package/mosquitto/0002-Fix-cjson-include-paths.patch b/package/mosquitto/0002-Fix-cjson-include-paths.patch
deleted file mode 100644
index 1fe7264c9a..0000000000
--- a/package/mosquitto/0002-Fix-cjson-include-paths.patch
+++ /dev/null
@@ -1,305 +0,0 @@
-From 791c63372b1e0a8818845a22c54a555843e06891 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 4 Dec 2020 22:15:19 +0000
-Subject: [PATCH] Fix cjson include paths.
-
-[Peter: drop cmake/, snap/ changes as those are not in tarball]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ChangeLog.txt                               | 3 +++
- apps/mosquitto_ctrl/dynsec.c                | 2 +-
- apps/mosquitto_ctrl/dynsec_client.c         | 2 +-
- apps/mosquitto_ctrl/dynsec_group.c          | 2 +-
- apps/mosquitto_ctrl/dynsec_role.c           | 2 +-
- apps/mosquitto_ctrl/example.c               | 2 +-
- apps/mosquitto_ctrl/mosquitto_ctrl.h        | 2 +-
- client/sub_client_output.c                  | 2 +-
- config.h                                    | 2 +-
- config.mk                                   | 2 +-
- plugins/dynamic-security/Makefile           | 2 +-
- plugins/dynamic-security/clientlist.c       | 2 +-
- plugins/dynamic-security/clients.c          | 2 +-
- plugins/dynamic-security/dynamic_security.h | 2 +-
- plugins/dynamic-security/grouplist.c        | 2 +-
- plugins/dynamic-security/groups.c           | 2 +-
- plugins/dynamic-security/json_help.c        | 2 +-
- plugins/dynamic-security/json_help.h        | 2 +-
- plugins/dynamic-security/plugin.c           | 2 +-
- plugins/dynamic-security/rolelist.c         | 2 +-
- plugins/dynamic-security/roles.c            | 2 +-
- 21 files changed, 25 insertions(+), 24 deletions(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 240f4a80..030ea8c5 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,6 @@
-+- Fix cjson include paths.
-+
-+
- 2.0.0 - 2020-12-03
- ==================
- 
-diff --git a/apps/mosquitto_ctrl/dynsec.c b/apps/mosquitto_ctrl/dynsec.c
-index 96aae993..35d29e9d 100644
---- a/apps/mosquitto_ctrl/dynsec.c
-+++ b/apps/mosquitto_ctrl/dynsec.c
-@@ -17,7 +17,7 @@ Contributors:
- */
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/apps/mosquitto_ctrl/dynsec_client.c b/apps/mosquitto_ctrl/dynsec_client.c
-index 1dea7862..45b6d6af 100644
---- a/apps/mosquitto_ctrl/dynsec_client.c
-+++ b/apps/mosquitto_ctrl/dynsec_client.c
-@@ -15,7 +15,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
- Contributors:
-    Roger Light - initial implementation and documentation.
- */
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/apps/mosquitto_ctrl/dynsec_group.c b/apps/mosquitto_ctrl/dynsec_group.c
-index b0faf27b..4b5ceca5 100644
---- a/apps/mosquitto_ctrl/dynsec_group.c
-+++ b/apps/mosquitto_ctrl/dynsec_group.c
-@@ -15,7 +15,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
- Contributors:
-    Roger Light - initial implementation and documentation.
- */
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/apps/mosquitto_ctrl/dynsec_role.c b/apps/mosquitto_ctrl/dynsec_role.c
-index 10b26efa..2bc5a03d 100644
---- a/apps/mosquitto_ctrl/dynsec_role.c
-+++ b/apps/mosquitto_ctrl/dynsec_role.c
-@@ -17,7 +17,7 @@ Contributors:
- */
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/apps/mosquitto_ctrl/example.c b/apps/mosquitto_ctrl/example.c
-index 63ba3eb0..1027fb60 100644
---- a/apps/mosquitto_ctrl/example.c
-+++ b/apps/mosquitto_ctrl/example.c
-@@ -15,7 +15,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
- Contributors:
-    Roger Light - initial implementation and documentation.
- */
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/apps/mosquitto_ctrl/mosquitto_ctrl.h b/apps/mosquitto_ctrl/mosquitto_ctrl.h
-index 52bbc9a8..0c9c931a 100644
---- a/apps/mosquitto_ctrl/mosquitto_ctrl.h
-+++ b/apps/mosquitto_ctrl/mosquitto_ctrl.h
-@@ -18,7 +18,7 @@ Contributors:
- #ifndef MOSQUITTO_CTRL_H
- #define MOSQUITTO_CTRL_H
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdbool.h>
- 
- #include "mosquitto.h"
-diff --git a/client/sub_client_output.c b/client/sub_client_output.c
-index 167071f8..a70d59ec 100644
---- a/client/sub_client_output.c
-+++ b/client/sub_client_output.c
-@@ -38,7 +38,7 @@ Contributors:
- #endif
- 
- #ifdef WITH_CJSON
--#  include <cJSON.h>
-+#  include <cjson/cJSON.h>
- #endif
- 
- #ifdef __APPLE__
-diff --git a/config.h b/config.h
-index 77da39df..bdce7469 100644
---- a/config.h
-+++ b/config.h
-@@ -74,7 +74,7 @@
- #endif
- 
- #ifdef WITH_CJSON
--#  include <cJSON.h>
-+#  include <cjson/cJSON.h>
- #  define CJSON_VERSION_FULL (CJSON_VERSION_MAJOR*1000000+CJSON_VERSION_MINOR*1000+CJSON_VERSION_PATCH)
- #endif
- 
-diff --git a/config.mk b/config.mk
-index 3e0c3240..e8be1aa1 100644
---- a/config.mk
-+++ b/config.mk
-@@ -364,7 +364,7 @@ ifeq ($(WITH_COVERAGE),yes)
- endif
- 
- ifeq ($(WITH_CJSON),yes)
--	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON -I/usr/include/cjson -I/usr/local/include/cjson
-+	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON
- 	CLIENT_LDADD:=$(CLIENT_LDADD) -lcjson
- 	CLIENT_STATIC_LDADD:=$(CLIENT_STATIC_LDADD) -lcjson
- 	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS) -L/usr/local/lib
-diff --git a/plugins/dynamic-security/Makefile b/plugins/dynamic-security/Makefile
-index 6fc50edd..559f531e 100644
---- a/plugins/dynamic-security/Makefile
-+++ b/plugins/dynamic-security/Makefile
-@@ -3,7 +3,7 @@ include ../../config.mk
- .PHONY : all binary check clean reallyclean test install uninstall
- 
- PLUGIN_NAME=mosquitto_dynamic_security
--LOCAL_CPPFLAGS=-I/usr/include/cjson -I/usr/local/include/cjson -I../../src/
-+LOCAL_CPPFLAGS=-I../../src/
- LOCAL_LDFLAGS=-L/usr/local/lib
- 
- OBJS=	\
-diff --git a/plugins/dynamic-security/clientlist.c b/plugins/dynamic-security/clientlist.c
-index 97957e07..d362a9b8 100644
---- a/plugins/dynamic-security/clientlist.c
-+++ b/plugins/dynamic-security/clientlist.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <uthash.h>
- 
-diff --git a/plugins/dynamic-security/clients.c b/plugins/dynamic-security/clients.c
-index 5ae03b47..50a0922e 100644
---- a/plugins/dynamic-security/clients.c
-+++ b/plugins/dynamic-security/clients.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <uthash.h>
- 
-diff --git a/plugins/dynamic-security/dynamic_security.h b/plugins/dynamic-security/dynamic_security.h
-index fcf39579..57c814b8 100644
---- a/plugins/dynamic-security/dynamic_security.h
-+++ b/plugins/dynamic-security/dynamic_security.h
-@@ -18,7 +18,7 @@ Contributors:
-    Roger Light - initial implementation and documentation.
- */
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <uthash.h>
- #include "mosquitto.h"
- #include "password_mosq.h"
-diff --git a/plugins/dynamic-security/grouplist.c b/plugins/dynamic-security/grouplist.c
-index 85df7199..afdc0186 100644
---- a/plugins/dynamic-security/grouplist.c
-+++ b/plugins/dynamic-security/grouplist.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <uthash.h>
- 
-diff --git a/plugins/dynamic-security/groups.c b/plugins/dynamic-security/groups.c
-index 5157113a..144b3244 100644
---- a/plugins/dynamic-security/groups.c
-+++ b/plugins/dynamic-security/groups.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <uthash.h>
- 
-diff --git a/plugins/dynamic-security/json_help.c b/plugins/dynamic-security/json_help.c
-index 04e5b3cf..dd8379c9 100644
---- a/plugins/dynamic-security/json_help.c
-+++ b/plugins/dynamic-security/json_help.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdbool.h>
- #include <stdlib.h>
- #include <stdio.h>
-diff --git a/plugins/dynamic-security/json_help.h b/plugins/dynamic-security/json_help.h
-index f80f1447..b1b6aed0 100644
---- a/plugins/dynamic-security/json_help.h
-+++ b/plugins/dynamic-security/json_help.h
-@@ -17,7 +17,7 @@ SPDX-License-Identifier: EPL-2.0 OR EDL-1.0
- Contributors:
-    Roger Light - initial implementation and documentation.
- */
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdbool.h>
- 
- /* "optional==false" can also be taken to mean "only return success if the key exists and is valid" */
-diff --git a/plugins/dynamic-security/plugin.c b/plugins/dynamic-security/plugin.c
-index 76aae115..c41e498c 100644
---- a/plugins/dynamic-security/plugin.c
-+++ b/plugins/dynamic-security/plugin.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-diff --git a/plugins/dynamic-security/rolelist.c b/plugins/dynamic-security/rolelist.c
-index f2c4cda2..6df19d21 100644
---- a/plugins/dynamic-security/rolelist.c
-+++ b/plugins/dynamic-security/rolelist.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <string.h>
- #include <uthash.h>
-diff --git a/plugins/dynamic-security/roles.c b/plugins/dynamic-security/roles.c
-index 7b33bdc0..635ddefd 100644
---- a/plugins/dynamic-security/roles.c
-+++ b/plugins/dynamic-security/roles.c
-@@ -18,7 +18,7 @@ Contributors:
- 
- #include "config.h"
- 
--#include <cJSON.h>
-+#include <cjson/cJSON.h>
- #include <stdio.h>
- #include <string.h>
- #include <uthash.h>
--- 
-2.20.1
-
diff --git a/package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch b/package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch
new file mode 100644
index 0000000000..8aafc4eb45
--- /dev/null
+++ b/package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch
@@ -0,0 +1,31 @@
+From f63386bf4a8a6e07621a3f4ecae2897b4ea01294 Mon Sep 17 00:00:00 2001
+From: Roger Light <roger@atchoo.org>
+Date: Sun, 13 Dec 2020 20:32:30 +0000
+Subject: [PATCH] Fix `mosquitto_passwd -b` using username as password.
+
+Only applies if if `-c` is not also used.
+
+Closes #1949. Thanks to J. Augusto de Oliveira.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop ChangeLog.txt hunk]
+---
+ apps/mosquitto_passwd/mosquitto_passwd.c | 2 +-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/apps/mosquitto_passwd/mosquitto_passwd.c b/apps/mosquitto_passwd/mosquitto_passwd.c
+index 92613f0f..9495c3c5 100644
+--- a/apps/mosquitto_passwd/mosquitto_passwd.c
++++ b/apps/mosquitto_passwd/mosquitto_passwd.c
+@@ -505,7 +505,7 @@ int main(int argc, char *argv[])
+ 	}else if(batch_mode == true && idx+3 == argc){
+ 		password_file_tmp = argv[idx];
+ 		username = argv[idx+1];
+-		password_cmd = argv[idx+1];
++		password_cmd = argv[idx+2];
+ 	}else if(batch_mode == false && idx+2 == argc){
+ 		password_file_tmp = argv[idx];
+ 		username = argv[idx+1];
+-- 
+2.20.1
+
diff --git a/package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch b/package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch
new file mode 100644
index 0000000000..61972869f4
--- /dev/null
+++ b/package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch
@@ -0,0 +1,138 @@
+From 113603168bb644715395f86b78e0803f1e6b67a0 Mon Sep 17 00:00:00 2001
+From: Roger Light <roger@atchoo.org>
+Date: Sun, 13 Dec 2020 23:11:02 +0000
+Subject: [PATCH] Fix LWT not being sent on client takeover.
+
+This was not happening for the case when the existing session wasn't
+being continued.
+
+Closes #1946. Thanks to Rory Piper.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop ChangeLog.txt hunk]
+---
+ src/handle_connect.c            |  8 +++++
+ test/broker/07-will-takeover.py | 53 ++++++++++++++++++++++++---------
+ 2 files changed, 48 insertions(+), 14 deletions(-)
+
+diff --git a/src/handle_connect.c b/src/handle_connect.c
+index 7be9833a..5a33fdde 100644
+--- a/src/handle_connect.c
++++ b/src/handle_connect.c
+@@ -165,6 +165,14 @@ int connect__on_authorised(struct mosquitto *context, void *auth_data_out, uint1
+ 		if(context->clean_start == true){
+ 			sub__clean_session(found_context);
+ 		}
++		if((found_context->protocol == mosq_p_mqtt5 && found_context->session_expiry_interval == 0)
++				|| (found_context->protocol != mosq_p_mqtt5 && found_context->clean_start == true)
++				|| (context->clean_start == true)
++				){
++
++			context__send_will(found_context);
++		}
++
+ 		session_expiry__remove(found_context);
+ 		will_delay__remove(found_context);
+ 		will__clear(found_context);
+diff --git a/test/broker/07-will-takeover.py b/test/broker/07-will-takeover.py
+index 8e04b423..1024a46a 100755
+--- a/test/broker/07-will-takeover.py
++++ b/test/broker/07-will-takeover.py
+@@ -5,7 +5,7 @@
+ from mosq_test_helper import *
+ 
+ 
+-def do_test(proto_ver, clean_session):
++def do_test(proto_ver, clean_session1, clean_session2):
+     rc = 1
+     keepalive = 60
+ 
+@@ -13,17 +13,34 @@ def do_test(proto_ver, clean_session):
+     connect1_packet = mosq_test.gen_connect("will-helper", keepalive=keepalive, proto_ver=proto_ver)
+     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
+ 
+-    connect2_packet = mosq_test.gen_connect("will-test", keepalive=keepalive, proto_ver=proto_ver, will_topic="will/test", will_payload=b"LWT", clean_session=clean_session)
+-    connack2a_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
+-    if clean_session == False and proto_ver == 4:
+-        connack2b_packet = mosq_test.gen_connack(rc=0, flags=1, proto_ver=proto_ver)
++    if proto_ver == 5:
++        if clean_session1 == False:
++            connect_props1 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 60)
++        else:
++            connect_props1 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 0)
++
++        if clean_session2 == False:
++            connect_props2 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 60)
++        else:
++            connect_props2 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 0)
+     else:
+-        connack2b_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
++        connect_props1 = b""
++        connect_props2 = b""
++
++    connect2_packet = mosq_test.gen_connect("will-test", keepalive=keepalive, proto_ver=proto_ver, will_topic="will/test", will_payload=b"LWT", clean_session=clean_session1, properties=connect_props1)
++    connack2_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
++
++    connect3_packet = mosq_test.gen_connect("will-test", keepalive=keepalive, proto_ver=proto_ver, clean_session=clean_session2, properties=connect_props2)
++    if clean_session1 == False and clean_session2 == False:
++        connack3_packet = mosq_test.gen_connack(rc=0, flags=1, proto_ver=proto_ver)
++    else:
++        connack3_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
+ 
+     subscribe_packet = mosq_test.gen_subscribe(mid, "will/test", 0, proto_ver=proto_ver)
+     suback_packet = mosq_test.gen_suback(mid, 0, proto_ver=proto_ver)
+ 
+     publish_packet = mosq_test.gen_publish(topic="will/test", qos=0, payload="Client ready", proto_ver=proto_ver)
++    publish_lwt_packet = mosq_test.gen_publish(topic="will/test", qos=0, payload="LWT", proto_ver=proto_ver)
+ 
+     port = mosq_test.get_port()
+     broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
+@@ -34,17 +51,21 @@ def do_test(proto_ver, clean_session):
+         mosq_test.do_send_receive(sock1, subscribe_packet, suback_packet, "suback")
+ 
+         # Connect client with will
+-        sock2 = mosq_test.do_client_connect(connect2_packet, connack2a_packet, timeout=5, port=port)
++        sock2 = mosq_test.do_client_connect(connect2_packet, connack2_packet, timeout=5, port=port)
+ 
+         # Send a "ready" message
+         sock2.send(publish_packet)
+         mosq_test.expect_packet(sock1, "publish 1", publish_packet)
+ 
+         # Connect client with will again as a separate connection, this should
+-        # take over from the previous one but not trigger a Will.
+-        sock3 = mosq_test.do_client_connect(connect2_packet, connack2b_packet, timeout=5, port=port)
++        # take over from the previous one but only trigger a Will if we are taking
++        # over a clean session/session-expiry-interval==0 client
++        sock3 = mosq_test.do_client_connect(connect3_packet, connack3_packet, timeout=5, port=port)
+         sock2.close()
+ 
++        if clean_session1 == True or clean_session2 == True:
++            mosq_test.expect_packet(sock1, "publish LWT", publish_lwt_packet)
++
+         # Send the "ready" message again
+         sock3.send(publish_packet)
+         mosq_test.expect_packet(sock1, "publish 2", publish_packet)
+@@ -63,11 +84,15 @@ def do_test(proto_ver, clean_session):
+         (stdo, stde) = broker.communicate()
+         if rc:
+             print(stde.decode('utf-8'))
+-            print("proto_ver=%d clean_session=%d" % (proto_ver, clean_session))
++            print("proto_ver=%d clean_session1=%d clean_session2=%d" % (proto_ver, clean_session1, clean_session2))
+             exit(rc)
+ 
+ 
+-do_test(proto_ver=4, clean_session=True)
+-do_test(proto_ver=4, clean_session=False)
+-do_test(proto_ver=5, clean_session=True)
+-do_test(proto_ver=5, clean_session=False)
++do_test(proto_ver=4, clean_session1=True, clean_session2=True)
++do_test(proto_ver=4, clean_session1=False, clean_session2=True)
++do_test(proto_ver=4, clean_session1=True, clean_session2=False)
++do_test(proto_ver=4, clean_session1=False, clean_session2=False)
++do_test(proto_ver=5, clean_session1=True, clean_session2=True)
++do_test(proto_ver=5, clean_session1=False, clean_session2=True)
++do_test(proto_ver=5, clean_session1=True, clean_session2=False)
++do_test(proto_ver=5, clean_session1=False, clean_session2=False)
+-- 
+2.20.1
+
diff --git a/package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch b/package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch
deleted file mode 100644
index b228538680..0000000000
--- a/package/mosquitto/0003-Fix-build-using-WITH_TLS-no-when-the-openssl-headers.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c25229c13a738af3efeb67724c6ca3dcb91971bd Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Fri, 4 Dec 2020 23:44:38 +0000
-Subject: [PATCH] Fix build using WITH_TLS=no when the openssl headers aren't
- available.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ChangeLog.txt       |  2 ++
- src/password_mosq.c | 10 ++++++----
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 030ea8c5..868e3e8a 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,4 +1,6 @@
-+Build:
- - Fix cjson include paths.
-+- Fix build using WITH_TLS=no when the openssl headers aren't available.
- 
- 
- 2.0.0 - 2020-12-03
-diff --git a/src/password_mosq.c b/src/password_mosq.c
-index 73b81976..62e06925 100644
---- a/src/password_mosq.c
-+++ b/src/password_mosq.c
-@@ -19,10 +19,12 @@ Contributors:
- #include "config.h"
- 
- #include <errno.h>
--#include <openssl/opensslv.h>
--#include <openssl/evp.h>
--#include <openssl/rand.h>
--#include <openssl/buffer.h>
-+#ifdef WITH_TLS
-+#  include <openssl/opensslv.h>
-+#  include <openssl/evp.h>
-+#  include <openssl/rand.h>
-+#  include <openssl/buffer.h>
-+#endif
- #include <signal.h>
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.20.1
-
diff --git a/package/mosquitto/0004-Drop-hard-coded-linker-flags.patch b/package/mosquitto/0004-Drop-hard-coded-linker-flags.patch
deleted file mode 100644
index f91012a02f..0000000000
--- a/package/mosquitto/0004-Drop-hard-coded-linker-flags.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3047374693a438cac3a43f461cf223ec7a91ea87 Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Sun, 6 Dec 2020 07:43:59 +0000
-Subject: [PATCH] Drop hard coded linker flags.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- config.mk                         | 2 +-
- plugins/dynamic-security/Makefile | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index e8be1aa1..f2520b3d 100644
---- a/config.mk
-+++ b/config.mk
-@@ -367,7 +367,7 @@ ifeq ($(WITH_CJSON),yes)
- 	CLIENT_CFLAGS:=$(CLIENT_CFLAGS) -DWITH_CJSON
- 	CLIENT_LDADD:=$(CLIENT_LDADD) -lcjson
- 	CLIENT_STATIC_LDADD:=$(CLIENT_STATIC_LDADD) -lcjson
--	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS) -L/usr/local/lib
-+	CLIENT_LDFLAGS:=$(CLIENT_LDFLAGS)
- endif
- 
- ifeq ($(WITH_XTREPORT),yes)
-diff --git a/plugins/dynamic-security/Makefile b/plugins/dynamic-security/Makefile
-index 559f531e..203fbc3e 100644
---- a/plugins/dynamic-security/Makefile
-+++ b/plugins/dynamic-security/Makefile
-@@ -4,7 +4,6 @@ include ../../config.mk
- 
- PLUGIN_NAME=mosquitto_dynamic_security
- LOCAL_CPPFLAGS=-I../../src/
--LOCAL_LDFLAGS=-L/usr/local/lib
- 
- OBJS=	\
- 		acl.o \
-@@ -33,7 +32,7 @@ all : ${ALL_DEPS}
- binary : ${PLUGIN_NAME}.so
- 
- ${PLUGIN_NAME}.so : ${OBJS}
--	${CROSS_COMPILE}${CC} $(PLUGIN_LDFLAGS) $(LOCAL_LDFLAGS) -fPIC -shared $^ -o $@ -lcjson
-+	${CROSS_COMPILE}${CC} $(PLUGIN_LDFLAGS) -fPIC -shared $^ -o $@ -lcjson
- 
- acl.o : acl.c dynamic_security.h
- 	${CROSS_COMPILE}${CC} $(LOCAL_CPPFLAGS) $(PLUGIN_CPPFLAGS) $(PLUGIN_CFLAGS) -c $< -o $@
--- 
-2.20.1
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index f1b16bfd03..91166a7a4e 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.0.tar.gz.asc
-sha256  ca8c21d1b04037df27639de9ea8f82fa73e1cbd24e83e6394ed67b537c4b6d86  mosquitto-2.0.0.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.2.tar.gz.asc
+sha256  5ea9ebf0a5ed3e95cecd75f30ebcf84f054584eff5617ac0f2e60428d3ad9707  mosquitto-2.0.2.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 2f92b57e27..0db78a384a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.0
+MOSQUITTO_VERSION = 2.0.2
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.20.1
