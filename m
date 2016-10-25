From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 Oct 2016 20:25:35 +0200
Subject: [Buildroot] [PATCH 2/2] soletta: new package
In-Reply-To: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1477419935-86355-2-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Soletta Project is a framework for making IoT devices. With Soletta
Project's libraries developers can easily write software for devices
that control actuators/sensors and communicate using standard
technologies. It enables adding smartness even on the smallest edge
devices.

http://solettaproject.org

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in                                  |   1 +
 .../0001-Check-availability-of-RB_SW_SUSPEND.patch |  37 ++++++
 ...Check-availability-of-nonstandard-locales.patch |  64 ++++++++++
 .../0003-Use-tinydtls-from-buildsystem.patch       | 102 +++++++++++++++
 .../0004-Use-tinycbor-from-buildsystem.patch       | 139 +++++++++++++++++++++
 package/soletta/0005-Fix-tinycbor-API-calls.patch  | 130 +++++++++++++++++++
 .../0006-Remove-warning-when-building-OIC.patch    |  32 +++++
 package/soletta/Config.in                          |  30 +++++
 package/soletta/soletta.hash                       |   3 +
 package/soletta/soletta.mk                         | 116 +++++++++++++++++
 10 files changed, 654 insertions(+)
 create mode 100644 package/soletta/0001-Check-availability-of-RB_SW_SUSPEND.patch
 create mode 100644 package/soletta/0002-Check-availability-of-nonstandard-locales.patch
 create mode 100644 package/soletta/0003-Use-tinydtls-from-buildsystem.patch
 create mode 100644 package/soletta/0004-Use-tinycbor-from-buildsystem.patch
 create mode 100644 package/soletta/0005-Fix-tinycbor-API-calls.patch
 create mode 100644 package/soletta/0006-Remove-warning-when-building-OIC.patch
 create mode 100644 package/soletta/Config.in
 create mode 100644 package/soletta/soletta.hash
 create mode 100644 package/soletta/soletta.mk

diff --git a/package/Config.in b/package/Config.in
index c10b577..82d22f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1353,6 +1353,7 @@ endif
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/shapelib/Config.in"
+	source "package/soletta/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
diff --git a/package/soletta/0001-Check-availability-of-RB_SW_SUSPEND.patch b/package/soletta/0001-Check-availability-of-RB_SW_SUSPEND.patch
new file mode 100644
index 0000000..a1970f3
--- /dev/null
+++ b/package/soletta/0001-Check-availability-of-RB_SW_SUSPEND.patch
@@ -0,0 +1,37 @@
+From 00f6a6a6edf9153571a517aa1d27c70c0bf45fd2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 25 Oct 2016 16:46:12 +0200
+Subject: [PATCH] Check availability of RB_SW_SUSPEND
+
+RB_SW_SUSPEND is not always available (for example on uclibc) so check its
+availability before using it
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ src/lib/common/sol-platform-impl-linux-micro.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/common/sol-platform-impl-linux-micro.c b/src/lib/common/sol-platform-impl-linux-micro.c
+index aeae8db..aabbb2b 100644
+--- a/src/lib/common/sol-platform-impl-linux-micro.c
++++ b/src/lib/common/sol-platform-impl-linux-micro.c
+@@ -927,9 +927,14 @@ sol_platform_impl_set_target(const char *target)
+         reboot_cmd = RB_POWER_OFF;
+     else if (streq(target, SOL_PLATFORM_TARGET_REBOOT))
+         reboot_cmd = RB_AUTOBOOT;
+-    else if (streq(target, SOL_PLATFORM_TARGET_SUSPEND))
++    else if (streq(target, SOL_PLATFORM_TARGET_SUSPEND)) {
++#ifdef RB_SW_SUSPEND
+         reboot_cmd = RB_SW_SUSPEND;
+-    else if (streq(target, SOL_PLATFORM_TARGET_DEFAULT))
++#else
++        SOL_WRN("Unsupported target: %s", target);
++        return -ENOTSUP;
++#endif
++    } else if (streq(target, SOL_PLATFORM_TARGET_DEFAULT))
+         reboot_exec = "/sbin/init";
+     else if (streq(target, SOL_PLATFORM_TARGET_RESCUE))
+         reboot_exec = "/sbin/rescue";
+-- 
+2.5.0
+
diff --git a/package/soletta/0002-Check-availability-of-nonstandard-locales.patch b/package/soletta/0002-Check-availability-of-nonstandard-locales.patch
new file mode 100644
index 0000000..7759f30
--- /dev/null
+++ b/package/soletta/0002-Check-availability-of-nonstandard-locales.patch
@@ -0,0 +1,64 @@
+From 63db25cc467f64356dd592c892cd64b10fbf6e19 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Mon, 24 Oct 2016 23:47:03 +0200
+Subject: [PATCH] Check availability of nonstandard locales
+
+Check that LC_ADDRESS, LC_IDENTIFICATION ... are defined before using them as
+these nonstandard locales are not always available (for example on uclibc)
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ src/lib/common/sol-platform-linux-common.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/src/lib/common/sol-platform-linux-common.c b/src/lib/common/sol-platform-linux-common.c
+index 5a0d49b..0fbdd22 100644
+--- a/src/lib/common/sol-platform-linux-common.c
++++ b/src/lib/common/sol-platform-linux-common.c
+@@ -1017,19 +1017,43 @@ sol_platform_impl_locale_to_c_category(enum sol_platform_locale_category categor
+ {
+     switch (category) {
+     case SOL_PLATFORM_LOCALE_ADDRESS:
++#ifdef LC_ADDRESS
+         return LC_ADDRESS;
++#else
++	return -EINVAL;
++#endif
+     case SOL_PLATFORM_LOCALE_IDENTIFICATION:
++#ifdef LC_IDENTIFICATION
+         return LC_IDENTIFICATION;
++#else
++	return -EINVAL;
++#endif
+     case SOL_PLATFORM_LOCALE_MESSAGES:
+         return LC_MESSAGES;
+     case SOL_PLATFORM_LOCALE_PAPER:
++#ifdef LC_PAPER
+         return LC_PAPER;
++#else
++	return -EINVAL;
++#endif
+     case SOL_PLATFORM_LOCALE_NAME:
++#ifdef LC_NAME
+         return LC_NAME;
++#else
++	return -EINVAL;
++#endif
+     case SOL_PLATFORM_LOCALE_TELEPHONE:
++#ifdef LC_TELEPHONE
+         return LC_TELEPHONE;
++#else
++	return -EINVAL;
++#endif
+     case SOL_PLATFORM_LOCALE_MEASUREMENT:
++#ifdef LC_MEASUREMENT
+         return LC_MEASUREMENT;
++#else
++	return -EINVAL;
++#endif
+     default:
+         return -EINVAL;
+     }
+-- 
+2.5.0
+
diff --git a/package/soletta/0003-Use-tinydtls-from-buildsystem.patch b/package/soletta/0003-Use-tinydtls-from-buildsystem.patch
new file mode 100644
index 0000000..5ff8345
--- /dev/null
+++ b/package/soletta/0003-Use-tinydtls-from-buildsystem.patch
@@ -0,0 +1,102 @@
+From a8672315d68fba42ee87e83f77c341beacdef1d9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Mon, 24 Oct 2016 23:57:15 +0200
+Subject: [PATCH] Use tinydtls from buildsystem
+
+Currently tinydtls is found in source tree, instead use the package from the
+buildsystem like the other ones (libcurl ...)
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ data/jsons/dependencies.json                  | 13 ++++++-------
+ src/lib/comms/Kconfig                         |  2 +-
+ src/lib/comms/Makefile                        | 19 +++++--------------
+ src/lib/comms/sol-socket-dtls-impl-tinydtls.c |  2 +-
+ 4 files changed, 13 insertions(+), 23 deletions(-)
+
+diff --git a/data/jsons/dependencies.json b/data/jsons/dependencies.json
+index 2445407..11cd221 100644
+--- a/data/jsons/dependencies.json
++++ b/data/jsons/dependencies.json
+@@ -661,14 +661,13 @@
+       "pkgname": "openssl"
+     },
+     {
+-      "dependency": "tinydtls_src",
+-      "type": "filesystem",
+-      "files": [
+-        "dtls.h"
++      "dependency": "tinydtls",
++      "type": "ccode",
++      "headers": [
++        "<tinydtls/dtls.h>"
+       ],
+-      "path": {
+-        "in-tree": "{TOP_SRCDIR}/src/thirdparty/tinydtls",
+-        "out-of-tree": "{TINYDTLS_SRC}"
++      "ldflags": {
++        "value": "-ltinydtls"
+       }
+     },
+     {
+diff --git a/src/lib/comms/Kconfig b/src/lib/comms/Kconfig
+index 13d6ff9..b6324b0 100644
+--- a/src/lib/comms/Kconfig
++++ b/src/lib/comms/Kconfig
+@@ -9,7 +9,7 @@ config NETWORK
+ config DTLS
+ 	bool "Enable DTLS (Datagram Transport Layer Security) support"
+ 	default n
+-	depends on HAVE_TINYDTLS_SRC
++	depends on HAVE_TINYDTLS
+ 	help
+ 	    This enables support for DTLS (a derivation from the SSL protocol)
+ 	    support in the socket abstraction layer.
+diff --git a/src/lib/comms/Makefile b/src/lib/comms/Makefile
+index 83f5004..e7c2cbd 100644
+--- a/src/lib/comms/Makefile
++++ b/src/lib/comms/Makefile
+@@ -14,22 +14,13 @@ obj-networking-$(NETCTL)-extra-cflags += $(SYSTEMD_CFLAGS)
+ obj-networking-$(NETCTL)-extra-ldflags += $(SYSTEMD_LDFLAGS)
+ 
+ obj-dtls-$(DTLS) += \
+-    sol-socket-dtls-impl-tinydtls.o \
+-    $(TINYDTLS_SRC_PATH)/aes/rijndael.o \
+-    $(TINYDTLS_SRC_PATH)/ccm.o \
+-    $(TINYDTLS_SRC_PATH)/crypto.o \
+-    $(TINYDTLS_SRC_PATH)/dtls.o \
+-    $(TINYDTLS_SRC_PATH)/dtls_time.o \
+-    $(TINYDTLS_SRC_PATH)/ecc/ecc.o \
+-    $(TINYDTLS_SRC_PATH)/hmac.o \
+-    $(TINYDTLS_SRC_PATH)/netq.o \
+-    $(TINYDTLS_SRC_PATH)/peer.o \
+-    $(TINYDTLS_SRC_PATH)/session.o \
+-    $(TINYDTLS_SRC_PATH)/sha2/sha2.o
++    sol-socket-dtls-impl-tinydtls.o
+ 
+ obj-dtls-$(DTLS)-extra-cflags += \
+-    -I$(TINYDTLS_SRC_PATH) \
+-    -w
++    $(TINYDTLS_CFLAGS)
++
++obj-dtls-$(DTLS)-extra-ldflags += \
++    $(TINYDTLS_LDFLAGS)
+ 
+ obj-networking-$(PLATFORM_RIOTOS) += \
+     sol-network-impl-riot.o \
+diff --git a/src/lib/comms/sol-socket-dtls-impl-tinydtls.c b/src/lib/comms/sol-socket-dtls-impl-tinydtls.c
+index 485c2a5..84b01f2 100644
+--- a/src/lib/comms/sol-socket-dtls-impl-tinydtls.c
++++ b/src/lib/comms/sol-socket-dtls-impl-tinydtls.c
+@@ -31,7 +31,7 @@
+ #include "sol-socket-dtls.h"
+ #include "sol-socket-impl.h"
+ 
+-#include "dtls.h"
++#include <tinydtls/dtls.h>
+ 
+ static const uint32_t dtls_magic = 'D' << 24 | 't' << 16 | 'L' << 8 | 's';
+ 
+-- 
+2.5.0
+
diff --git a/package/soletta/0004-Use-tinycbor-from-buildsystem.patch b/package/soletta/0004-Use-tinycbor-from-buildsystem.patch
new file mode 100644
index 0000000..75eebfd
--- /dev/null
+++ b/package/soletta/0004-Use-tinycbor-from-buildsystem.patch
@@ -0,0 +1,139 @@
+From b11cc5e2bea5d9b25bb4ce397f8a5acda09442be Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 25 Oct 2016 00:32:47 +0200
+Subject: [PATCH] Use tinycbor from buildsystem
+
+Currently tinycbor is found in source tree, instead use the package from the
+buildsystem like the other ones (libcurl ...)
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ data/jsons/dependencies.json   | 13 ++++++-------
+ src/lib/comms/Kconfig          |  2 +-
+ src/lib/comms/Makefile         | 23 +++++------------------
+ src/lib/comms/sol-oic-cbor.h   |  2 +-
+ src/lib/comms/sol-oic-client.c |  2 +-
+ src/lib/comms/sol-oic-server.c |  2 +-
+ 6 files changed, 15 insertions(+), 29 deletions(-)
+
+diff --git a/data/jsons/dependencies.json b/data/jsons/dependencies.json
+index 11cd221..0882f2f 100644
+--- a/data/jsons/dependencies.json
++++ b/data/jsons/dependencies.json
+@@ -645,14 +645,13 @@
+       "atleast-version": "0.9.47"
+     },
+     {
+-      "dependency": "tinycbor_src",
+-      "type": "filesystem",
+-      "files": [
+-        "cbor.h"
++      "dependency": "tinycbor",
++      "type": "ccode",
++      "headers": [
++        "<tinycbor/cbor.h>"
+       ],
+-      "path": {
+-        "in-tree": "{TOP_SRCDIR}/src/thirdparty/tinycbor/src",
+-        "out-of-tree": "{TINYCBOR_SRC}"
++      "ldflags": {
++        "value": "-ltinycbor"
+       }
+     },
+     {
+diff --git a/src/lib/comms/Kconfig b/src/lib/comms/Kconfig
+index b6324b0..bf0f8e2 100644
+--- a/src/lib/comms/Kconfig
++++ b/src/lib/comms/Kconfig
+@@ -95,7 +95,7 @@ config COAP
+ config OIC
+ 	bool "OIC"
+ 	default y
+-	depends on COAP && FEATURE_OIC && HAVE_TINYCBOR_SRC
++	depends on COAP && FEATURE_OIC && HAVE_TINYCBOR
+ 	help
+             Implementation of protocol defined by Open Interconnect Consortium
+             (OIC - http://openinterconnect.org/)
+diff --git a/src/lib/comms/Makefile b/src/lib/comms/Makefile
+index e7c2cbd..fbbb555 100644
+--- a/src/lib/comms/Makefile
++++ b/src/lib/comms/Makefile
+@@ -49,23 +49,6 @@ obj-networking-$(COAP) += \
+     coap.o \
+     sol-coap.o
+ 
+-obj-$(OIC) += tinycbor.mod
+-
+-obj-tinycbor-y = \
+-    $(TINYCBOR_SRC_PATH)/cborencoder.o \
+-    $(TINYCBOR_SRC_PATH)/cborerrorstrings.o \
+-    $(TINYCBOR_SRC_PATH)/cborparser.o \
+-    $(TINYCBOR_SRC_PATH)/cborpretty.o
+-
+-obj-tinycbor-private-headers += \
+-    $(TINYCBOR_SRC_PATH)/cbor.h
+-
+-obj-tinycbor-y-extra-cflags += \
+-    -Wno-cpp \
+-    -Wno-declaration-after-statement \
+-    -Wno-float-equal \
+-    -Wno-undef
+-
+ obj-networking-$(OIC) += \
+     sol-oic-cbor.o \
+     sol-oic-client.o \
+@@ -86,7 +69,11 @@ obj-networking-$(OIC)-extra-cflags += \
+     -DOIC_HARDWARE_VERSION=$(OIC_SERVER_HARDWARE_VERSION) \
+     -DOIC_FIRMWARE_VERSION=$(OIC_SERVER_FIRMWARE_VERSION) \
+     -DOIC_SUPPORT_URL=$(OIC_SERVER_SUPPORT_URL) \
+-    -DOIC_DEVICE_NAME=$(OIC_SERVER_DEVICE_NAME)
++    -DOIC_DEVICE_NAME=$(OIC_SERVER_DEVICE_NAME) \
++    $(TINYCBOR_CFLAGS)
++
++obj-networking-$(OIC)-extra-ldflags += \
++    $(TINYCBOR_LDFLAGS)
+ 
+ obj-networking-$(HTTP) += \
+     sol-http-common.o
+diff --git a/src/lib/comms/sol-oic-cbor.h b/src/lib/comms/sol-oic-cbor.h
+index 94a77de..1da14e6 100644
+--- a/src/lib/comms/sol-oic-cbor.h
++++ b/src/lib/comms/sol-oic-cbor.h
+@@ -18,7 +18,7 @@
+ 
+ #pragma once
+ 
+-#include "tinycbor/cbor.h"
++#include <tinycbor/cbor.h>
+ #include "sol-coap.h"
+ #include "sol-oic.h"
+ #include "sol-vector.h"
+diff --git a/src/lib/comms/sol-oic-client.c b/src/lib/comms/sol-oic-client.c
+index 89196ab..011b720 100644
+--- a/src/lib/comms/sol-oic-client.c
++++ b/src/lib/comms/sol-oic-client.c
+@@ -22,7 +22,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-#include "tinycbor/cbor.h"
++#include <tinycbor/cbor.h>
+ #include "sol-coap.h"
+ #include "sol-log-internal.h"
+ #include "sol-macros.h"
+diff --git a/src/lib/comms/sol-oic-server.c b/src/lib/comms/sol-oic-server.c
+index a6521b7..b2e4699 100644
+--- a/src/lib/comms/sol-oic-server.c
++++ b/src/lib/comms/sol-oic-server.c
+@@ -23,7 +23,7 @@
+ 
+ #define SOL_LOG_DOMAIN &_sol_oic_server_log_domain
+ 
+-#include "tinycbor/cbor.h"
++#include <tinycbor/cbor.h>
+ #include "sol-coap.h"
+ #include "sol-json.h"
+ #include "sol-log-internal.h"
+-- 
+2.5.0
+
diff --git a/package/soletta/0005-Fix-tinycbor-API-calls.patch b/package/soletta/0005-Fix-tinycbor-API-calls.patch
new file mode 100644
index 0000000..8bf08cb
--- /dev/null
+++ b/package/soletta/0005-Fix-tinycbor-API-calls.patch
@@ -0,0 +1,130 @@
+From 9bcdc25f433f80d6a5e9c08a335780a7a056b00a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 25 Oct 2016 10:15:29 +0200
+Subject: [PATCH] Fix tinycbor API calls
+
+Since tinycbor 0.3.2, ptr and bytes_needed of CborEncoder structure are not
+accessible through an unnamed union so add the data structure when needed
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ src/lib/comms/sol-oic-cbor.c   | 16 ++++++++--------
+ src/lib/comms/sol-oic-server.c | 10 +++++-----
+ 2 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/lib/comms/sol-oic-cbor.c b/src/lib/comms/sol-oic-cbor.c
+index b4715e2..3820797 100644
+--- a/src/lib/comms/sol-oic-cbor.c
++++ b/src/lib/comms/sol-oic-cbor.c
+@@ -63,7 +63,7 @@ initialize_cbor_payload(struct sol_oic_map_writer *encoder)
+ 
+     cbor_encoder_init(&encoder->encoder, encoder->payload,
+         buf->capacity - offset, 0);
+-    old_ptr = encoder->encoder.ptr;
++    old_ptr = encoder->encoder.data.ptr;
+ 
+     encoder->type = SOL_OIC_MAP_CONTENT;
+ 
+@@ -72,7 +72,7 @@ initialize_cbor_payload(struct sol_oic_map_writer *encoder)
+     err = cbor_encoder_create_map(&encoder->encoder, &encoder->rep_map,
+         CborIndefiniteLength);
+     if (err == CborNoError) {
+-        new_ptr = encoder->rep_map.ptr;
++        new_ptr = encoder->rep_map.data.ptr;
+         r = buffer_used_bump(encoder, new_ptr - old_ptr);
+         if (r < 0)
+             err = CborErrorUnknownType;
+@@ -113,12 +113,12 @@ enlarge_buffer(struct sol_oic_map_writer *writer,
+     writer->rep_map = orig_map;
+ 
+     /* update all encoder states */
+-    writer->payload = writer->encoder.ptr = sol_buffer_at(buf, offset);
++    writer->payload = writer->encoder.data.ptr = sol_buffer_at(buf, offset);
+     /* sol_buffer_at() directly to somewhere past the used portion fails*/
+     writer->encoder.end = (uint8_t *)sol_buffer_at(buf, 0) + buf->capacity;
+ 
+     /* new offset + how much it had progressed so far */
+-    writer->rep_map.ptr = writer->payload + (orig_map.ptr - old_payload);
++    writer->rep_map.data.ptr = writer->payload + (orig_map.data.ptr - old_payload);
+     writer->rep_map.end = writer->encoder.end;
+ 
+     return 0;
+@@ -146,13 +146,13 @@ sol_oic_packet_cbor_close(struct sol_coap_packet *pkt,
+         /* When you close an encoder, it will get its ptr set to the
+          * topmost container's. Also, this would append one byte to the
+          * payload, thus '1' below */
+-        old_ptr = writer->rep_map.ptr;
++        old_ptr = writer->rep_map.data.ptr;
+         err = cbor_encoder_close_container(&writer->encoder, &writer->rep_map);
+         if (err & CborErrorOutOfMemory) {
+             r = enlarge_buffer(writer, orig_encoder, orig_map, 1);
+             SOL_INT_CHECK_GOTO(r, < 0, end);
+         } else if (err == CborNoError) {
+-            r = buffer_used_bump(writer, writer->encoder.ptr - old_ptr);
++            r = buffer_used_bump(writer, writer->encoder.data.ptr - old_ptr);
+             if (r < 0) {
+                 err = CborErrorUnknownType;
+                 goto end;
+@@ -195,7 +195,7 @@ sol_oic_packet_cbor_append(struct sol_oic_map_writer *writer,
+             r = enlarge_buffer(writer, orig_encoder, orig_map, next_buf_sz);
+             SOL_INT_CHECK_GOTO(r, < 0, end);
+         } else if (err == CborNoError) {
+-            r = buffer_used_bump(writer, writer->rep_map.ptr - orig_map.ptr);
++            r = buffer_used_bump(writer, writer->rep_map.data.ptr - orig_map.data.ptr);
+             if (r < 0) {
+                 err = CborErrorUnknownType;
+                 goto end;
+@@ -262,7 +262,7 @@ sol_oic_packet_cbor_append(struct sol_oic_map_writer *writer,
+             r = enlarge_buffer(writer, orig_encoder, orig_map, next_buf_sz);
+             SOL_INT_CHECK_GOTO(r, < 0, end);
+         } else if (err == CborNoError) {
+-            r = buffer_used_bump(writer, writer->rep_map.ptr - orig_map.ptr);
++            r = buffer_used_bump(writer, writer->rep_map.data.ptr - orig_map.data.ptr);
+             if (r < 0) {
+                 err = CborErrorUnknownType;
+                 goto end;
+diff --git a/src/lib/comms/sol-oic-server.c b/src/lib/comms/sol-oic-server.c
+index b2e4699..bdd93d4 100644
+--- a/src/lib/comms/sol-oic-server.c
++++ b/src/lib/comms/sol-oic-server.c
+@@ -309,7 +309,7 @@ res_payload_do(CborEncoder *encoder,
+     uint16_t idx;
+ 
+     cbor_encoder_init(encoder, buf, buflen, 0);
+-    *encoder_start = encoder->ptr;
++    *encoder_start = encoder->data.ptr;
+ 
+     err = cbor_encoder_create_array(encoder, &array, 1);
+     err |= cbor_encoder_create_map(&array, &device_map, 2);
+@@ -471,8 +471,8 @@ _sol_oic_server_res(void *data, struct sol_coap_server *server,
+     if (err != CborErrorOutOfMemory)
+         goto err;
+ 
+-    SOL_DBG("Ensuring OIC (cbor) payload of size %td", encoder.bytes_needed);
+-    r = sol_buffer_ensure(buf, encoder.bytes_needed + offset);
++    SOL_DBG("Ensuring OIC (cbor) payload of size %td", encoder.data.bytes_needed);
++    r = sol_buffer_ensure(buf, encoder.data.bytes_needed + offset);
+     if (r < 0) {
+         sol_coap_packet_unref(resp);
+         return r;
+@@ -480,7 +480,7 @@ _sol_oic_server_res(void *data, struct sol_coap_server *server,
+ 
+     /* now encode for sure */
+     err = res_payload_do(&encoder, sol_buffer_at(buf, offset),
+-        encoder.bytes_needed, query_rt, query_if, &dev_id, &encoder_start);
++        encoder.data.bytes_needed, query_rt, query_if, &dev_id, &encoder_start);
+ 
+ err:
+     if (err != CborNoError) {
+@@ -496,7 +496,7 @@ err:
+         sol_coap_header_set_code(resp, SOL_COAP_RESPONSE_CODE_CONTENT);
+         /* Ugly, but since tinycbor operates on memory slices
+          * directly, we have to resort to that */
+-        buf->used += encoder.ptr - encoder_start;
++        buf->used += encoder.data.ptr - encoder_start;
+     }
+ 
+     return sol_coap_send_packet(get_server_for_response(server), resp, cliaddr);
+-- 
+2.5.0
+
diff --git a/package/soletta/0006-Remove-warning-when-building-OIC.patch b/package/soletta/0006-Remove-warning-when-building-OIC.patch
new file mode 100644
index 0000000..ca7ae76
--- /dev/null
+++ b/package/soletta/0006-Remove-warning-when-building-OIC.patch
@@ -0,0 +1,32 @@
+From a0df0c1486811e30d90a624503e99c09964b00dc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 25 Oct 2016 12:51:24 +0200
+Subject: [PATCH] Remove warning when building OIC
+
+If tinydtls and tinycbor are retrieved from buildsystem, a warning is raised
+as we continue to include build/stage/include which is not created anymore so
+remove this inclusion
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ tools/build/Makefile.vars | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/tools/build/Makefile.vars b/tools/build/Makefile.vars
+index 7a963f9..bafd222 100644
+--- a/tools/build/Makefile.vars
++++ b/tools/build/Makefile.vars
+@@ -198,10 +198,6 @@ HEADERDIRS += $(addprefix $(top_srcdir),$(KCONFIG_INCLUDE)generated/)
+ HEADERDIRS += $(addprefix $(build_stagedir),lib/common lib/flow)
+ HEADERDIRS += $(build_includedir)
+ 
+-ifeq (y,$(OIC))
+-HEADERDIRS += $(addprefix $(build_stagedir),include/)
+-endif
+-
+ LIB_OUTPUTDIR := $(build_libdir)
+ 
+ SOL_LIB_AR := $(LIB_OUTPUTDIR)libsoletta.a
+-- 
+2.5.0
+
diff --git a/package/soletta/Config.in b/package/soletta/Config.in
new file mode 100644
index 0000000..a9891c0
--- /dev/null
+++ b/package/soletta/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_SOLETTA
+	bool "soletta"
+	depends on BR2_USE_MMU # fork
+	# python3 is not really needed except for 4 development scripts, however
+	# if we don't enable it, host-python-jsonschema will be installed for
+	# the default python interpreter which is host-python2. As a result
+	# host-python3 will not find the module in its site-packages directory.
+	depends on !BR2_PACKAGE_PYTHON # python3
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3
+	help
+	  Soletta Project is a framework for making IoT devices. With Soletta
+	  Project's libraries developers can easily write software for devices
+	  that control actuators/sensors and communicate using standard
+	  technologies. It enables adding smartness even on the smallest edge
+	  devices.
+
+	  http://solettaproject.org
+
+comment "soletta needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_PYTHON
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
+comment "soletta is not compatible with python"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PYTHON
diff --git a/package/soletta/soletta.hash b/package/soletta/soletta.hash
new file mode 100644
index 0000000..8a7ac94
--- /dev/null
+++ b/package/soletta/soletta.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	4080d12fde3006216316e954b5e4a001d783f93c5b4d554da5f58c98182270fd	soletta-v1.tar.gz
+sha256	c4d3018933980634333fca5c997736abb207dce76ad1f4cc16a4fdb3e7acb5a6	9af119285a521423646195f04fa4f6f51d0ab644.patch
diff --git a/package/soletta/soletta.mk b/package/soletta/soletta.mk
new file mode 100644
index 0000000..eb03b4a
--- /dev/null
+++ b/package/soletta/soletta.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# soletta
+#
+################################################################################
+
+SOLETTA_VERSION = v1
+SOLETTA_SITE = $(call github,solettaproject,soletta,$(SOLETTA_VERSION))
+SOLETTA_LICENSE = Apache-2.0
+SOLETTA_LICENSE_FILES = LICENSE
+
+SOLETTA_DEPENDENCIES = \
+	host-pkgconf \
+	host-python3 \
+	host-python-jsonschema
+
+SOLETTA_INSTALL_STAGING = YES
+
+# This patch only enables TinyDTLS extra features if needed
+SOLETTA_PATCH = \
+	https://github.com/solettaproject/soletta/commit/9af119285a521423646195f04fa4f6f51d0ab644.patch
+
+SOLETTA_CONF_FILE = $(@D)/soletta_conf
+
+SOLETTA_MAKE_OPTS = \
+	TARGETAR="$(TARGET_AR)" \
+	TARGETCC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	SOLETTA_CONF="$(SOLETTA_CONF_FILE)"
+
+ifeq ($(BR2_PACKAGE_FILE),y)
+SOLETTA_DEPENDENCIES += file # libmagic
+endif
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+SOLETTA_DEPENDENCIES += icu
+endif
+
+ifeq ($(BR2_PACKAGE_KMOD),y)
+SOLETTA_DEPENDENCIES += kmod
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+SOLETTA_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+SOLETTA_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+SOLETTA_DEPENDENCIES += libgtk3
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMICROHTTPD),y)
+SOLETTA_DEPENDENCIES += libmicrohttpd
+endif
+
+ifeq ($(BR2_PACKAGE_MOSQUITTO),y)
+SOLETTA_DEPENDENCIES += mosquitto
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SOLETTA_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+SOLETTA_DEPENDENCIES += pcre
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SOLETTA_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_TINYCBOR),y)
+SOLETTA_DEPENDENCIES += tinycbor
+endif
+
+ifeq ($(BR2_PACKAGE_TINYDTLS),y)
+SOLETTA_DEPENDENCIES += tinydtls
+
+# Enable DTLS as it is disable in default soletta configuration
+define SOLETTA_ENABLE_DTLS
+	echo "DTLS=y" > $(SOLETTA_CONF_FILE)
+endef
+
+SOLETTA_POST_CONFIGURE_HOOKS = SOLETTA_ENABLE_DTLS
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+SOLETTA_DEPENDENCIES += udev
+endif
+
+SOLETTA_BUILD_DIR = $(@D)/build/soletta_sysroot/usr
+
+define SOLETTA_CONFIGURE_CMDS
+	touch $(SOLETTA_CONF_FILE)
+endef
+
+define SOLETTA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(SOLETTA_MAKE_OPTS) -C $(@D) \
+		-f Makefile.smallos
+endef
+
+define SOLETTA_INSTALL_STAGING_CMDS
+	cp -a $(SOLETTA_BUILD_DIR)/include/* $(STAGING_DIR)/usr/include/
+	cp -a $(SOLETTA_BUILD_DIR)/lib/* $(STAGING_DIR)/usr/lib/
+endef
+
+define SOLETTA_INSTALL_TARGET_CMDS
+	cp -a $(SOLETTA_BUILD_DIR)/bin/* $(TARGET_DIR)/usr/bin/
+	cp -a $(SOLETTA_BUILD_DIR)/lib/* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
