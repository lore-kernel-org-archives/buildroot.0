From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 11 Nov 2018 16:06:49 +0100
Subject: [Buildroot] [PATCH] Add mini-snmpd package
In-Reply-To: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
Message-ID: <20181111150652.17459-4-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mini SNMPd is a minimal implementation targeted at small or embedded UNIX
systems with limited resources.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---

Note:
check-package issues "Signed-off-by" warnings on the .patch files, but
that's how they present in the original repository.

 package/Config.in                             |  1 +
 ...d-zero-byte-before-unsigned-integers.patch | 29 +++++++++++++++++++
 ...igned-integers-to-have-an-extra-byte.patch | 26 +++++++++++++++++
 package/mini-snmpd/Config.in                  |  7 +++++
 package/mini-snmpd/mini-snmpd.mk              | 21 ++++++++++++++
 package/mini-snmpd/mini-snmpd.service         | 12 ++++++++
 6 files changed, 96 insertions(+)
 create mode 100644 package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
 create mode 100644 package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
 create mode 100644 package/mini-snmpd/Config.in
 create mode 100644 package/mini-snmpd/mini-snmpd.mk
 create mode 100644 package/mini-snmpd/mini-snmpd.service

diff --git a/package/Config.in b/package/Config.in
index d136ab1f15..c9450cd033 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1886,6 +1886,7 @@ menu "Networking applications"
 	source "package/macchanger/Config.in"
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
+	source "package/mini-snmpd/Config.in"
 	source "package/minidlna/Config.in"
 	source "package/minissdpd/Config.in"
 	source "package/mjpg-streamer/Config.in"
diff --git a/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch b/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
new file mode 100644
index 0000000000..990d5bb9b7
--- /dev/null
+++ b/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
@@ -0,0 +1,29 @@
+From 949ae648bf7c654b8fae607a0988bfa672607156 Mon Sep 17 00:00:00 2001
+From: Patrick Rauscher <prauscher@prauscher.de>
+Date: Fri, 18 Aug 2017 17:31:23 +0200
+Subject: [PATCH] Prepend zero-byte before unsigned integers
+
+fixes #8
+---
+ mib.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/mib.c b/mib.c
+index 7d2e513..a9ffbe2 100644
+--- a/mib.c
++++ b/mib.c
+@@ -207,6 +207,11 @@ static int encode_unsigned(data_t *data, int type, unsigned int ticks_value)
+ 	else
+ 		length = 1;
+ 
++	/* check if the integer could be interpreted negative during a signed decode and prepend a zero-byte if necessary */
++	if ((ticks_value >> (8 * (length - 1))) & 0x80) {
++		length++;
++	}
++
+ 	*buffer++ = type;
+ 	*buffer++ = length;
+ 	while (length--)
+-- 
+2.13.2
+
diff --git a/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch b/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
new file mode 100644
index 0000000000..d1b18050a5
--- /dev/null
+++ b/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
@@ -0,0 +1,26 @@
+From 556c8a406c9e08dd9444222e072f7eb9c82a81e8 Mon Sep 17 00:00:00 2001
+From: Patrick Rauscher <prauscher@prauscher.de>
+Date: Fri, 18 Aug 2017 17:44:32 +0200
+Subject: [PATCH] mib.c: allow unsigned integers to have an extra byte
+
+The extra byte can be needed when encoding huge unsigned numbers (i.e. 0x80000000 or higher). In this case, during encoding we need an extra byte to make sure clients decoding as signed int do not get negative numbers. For further details, see commit 949ae648
+---
+ mib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mib.c b/mib.c
+index a9ffbe2..83cc20d 100644
+--- a/mib.c
++++ b/mib.c
+@@ -372,7 +372,7 @@ static int data_alloc(data_t *data, int type)
+ 		case BER_TYPE_COUNTER:
+ 		case BER_TYPE_GAUGE:
+ 		case BER_TYPE_TIME_TICKS:
+-			data->max_length = sizeof(unsigned int) + 2;
++			data->max_length = sizeof(unsigned int) + 3;
+ 			data->encoded_length = 0;
+ 			data->buffer = allocate(data->max_length);
+ 			break;
+-- 
+2.13.2
+
diff --git a/package/mini-snmpd/Config.in b/package/mini-snmpd/Config.in
new file mode 100644
index 0000000000..1f61cddbcf
--- /dev/null
+++ b/package/mini-snmpd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MINI_SNMPD
+	bool "mini-snmpd"
+	help
+	  Mini SNMPd is a minimal implementation targeted at small or
+	  embedded UNIX systems with limited resources
+
+	  http://troglobit.com/mini-snmpd.html
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
new file mode 100644
index 0000000000..ebcbcce1ce
--- /dev/null
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mini-snmpd
+#
+################################################################################
+
+MINI_SNMPD_VERSION = v1.4
+MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,$(MINI_SNMPD_VERSION))
+MINI_SNMPD_LICENSE = GPL-2.0
+MINI_SNMPD_LICENSE_FILES = COPYING
+MINI_SNMPD_AUTORECONF = YES
+
+define MINI_SNMPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mini-snmpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/mini-snmpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mini-snmpd.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/mini-snmpd/mini-snmpd.service b/package/mini-snmpd/mini-snmpd.service
new file mode 100644
index 0000000000..8a15585e6e
--- /dev/null
+++ b/package/mini-snmpd/mini-snmpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Mini SNMP Daemon
+StartLimitIntervalSec=0
+
+[Service]
+Environment='COMMUNITY=public'
+ExecStart=/sbin/mini_snmpd -a -n -c ${COMMUNITY} $EXTRA_PARAMS
+Restart=always
+RestartSec=1
+
+[Install]
+WantedBy=multi-user.target
-- 
2.19.1
