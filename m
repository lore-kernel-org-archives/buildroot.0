From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 23:18:58 +0100
Subject: [Buildroot] [git commit] package/mini-snmpd: bump to version 1.6
Message-ID: <20200309140908.C96F7821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fccdc6bd0b587b1b60565d957fe963fa4396f120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop both patches:

 - 0001-Prepend-zero-byte-before-unsigned-integers.patch is upstream
   as of 949ae648bf7c654b8fae607a0988bfa672607156

 - 0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch is
   upstream as of

Use the systemd unit file provided by the upstream project instead of
our own, just add an /etc/default/ file to add the -a option to
preserve the same behavior.

This new version now needs pkg-config.

v1.6 changelog:

Bug fix release.

- Fix #16: regression in ifTable for point-to-point interfaces
- Fix #17: major memory leak in Linux backend
- Fix #18: consistent timeout handling in .conf file and command line

v1.5 changelog:

Major feature release.  Support for TCP-MIB, UDP-MIB, IP-MIB,
ifXTable with 64-bit counters.

- Majority of new features from [NDM Systems][]
- CVE fixes from [Cisco Talos Intelligence Group][talos]

- Add support for ifXTable (64-bit counters), from NDM Systems
- Add support for TCP-MIB, from NDM Systems
- Add support for UDP-MIB, from NDM Systems
- Add support for IP-MIB, from NDM Systems
- Add support for ifType
- Add support for ifMtu
- Binary and man page renamed: `mini_snmpd` --> `mini-snmpd`
- New command line option `-l LEVEL` replaces `--verbose`
- New command line option `-v` to show program version
- Create PID file when daemon is ready to receive signals
- Add support for systemd unit file on Linux
- Add support for /etc/mini-snmpd.conf, disabled by default

- CVE-2020-6060: Fix stack overflow in client connection handler
- CVE-2020-6059: Fix out-of-bounds read in parsing of SNMP packet
- CVE-2020-6058: Fix out-of-bounds read in parsing of SNMP packet
- Let `-s` flag control use of syslog, when running in foreground
- Removed all (known) GNU:isms; i.e., `__progname` and `%m`

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...repend-zero-byte-before-unsigned-integers.patch | 31 ----------------------
 ...w-unsigned-integers-to-have-an-extra-byte.patch | 28 -------------------
 package/mini-snmpd/mini-snmpd                      |  2 ++
 package/mini-snmpd/mini-snmpd.hash                 |  2 +-
 package/mini-snmpd/mini-snmpd.mk                   | 11 +++++---
 package/mini-snmpd/mini-snmpd.service              | 12 ---------
 6 files changed, 10 insertions(+), 76 deletions(-)

diff --git a/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch b/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
deleted file mode 100644
index 36ddee422f..0000000000
--- a/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 949ae648bf7c654b8fae607a0988bfa672607156 Mon Sep 17 00:00:00 2001
-From: Patrick Rauscher <prauscher@prauscher.de>
-Date: Fri, 18 Aug 2017 17:31:23 +0200
-Subject: [PATCH] Prepend zero-byte before unsigned integers
-
-fixes #8
-
-Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
----
- mib.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/mib.c b/mib.c
-index 7d2e513..a9ffbe2 100644
---- a/mib.c
-+++ b/mib.c
-@@ -207,6 +207,11 @@ static int encode_unsigned(data_t *data, int type, unsigned int ticks_value)
- 	else
- 		length = 1;
- 
-+	/* check if the integer could be interpreted negative during a signed decode and prepend a zero-byte if necessary */
-+	if ((ticks_value >> (8 * (length - 1))) & 0x80) {
-+		length++;
-+	}
-+
- 	*buffer++ = type;
- 	*buffer++ = length;
- 	while (length--)
--- 
-2.13.2
-
diff --git a/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch b/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
deleted file mode 100644
index 045d296913..0000000000
--- a/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 556c8a406c9e08dd9444222e072f7eb9c82a81e8 Mon Sep 17 00:00:00 2001
-From: Patrick Rauscher <prauscher@prauscher.de>
-Date: Fri, 18 Aug 2017 17:44:32 +0200
-Subject: [PATCH] mib.c: allow unsigned integers to have an extra byte
-
-The extra byte can be needed when encoding huge unsigned numbers (i.e. 0x80000000 or higher). In this case, during encoding we need an extra byte to make sure clients decoding as signed int do not get negative numbers. For further details, see commit 949ae648
-
-Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
----
- mib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mib.c b/mib.c
-index a9ffbe2..83cc20d 100644
---- a/mib.c
-+++ b/mib.c
-@@ -372,7 +372,7 @@ static int data_alloc(data_t *data, int type)
- 		case BER_TYPE_COUNTER:
- 		case BER_TYPE_GAUGE:
- 		case BER_TYPE_TIME_TICKS:
--			data->max_length = sizeof(unsigned int) + 2;
-+			data->max_length = sizeof(unsigned int) + 3;
- 			data->encoded_length = 0;
- 			data->buffer = allocate(data->max_length);
- 			break;
--- 
-2.13.2
-
diff --git a/package/mini-snmpd/mini-snmpd b/package/mini-snmpd/mini-snmpd
new file mode 100644
index 0000000000..0ca9901d58
--- /dev/null
+++ b/package/mini-snmpd/mini-snmpd
@@ -0,0 +1,2 @@
+# Require client authentication, thus SNMP version 2c
+EXTRA_PARAMS=-a
diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index de72bb59eb..2d66809291 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 59f84e94ef7c9ff36d243c7974a100903a4a9a0bb529b67cf6f0d3352138a86b mini-snmpd-1.4.tar.gz
+sha256 de00c475a3c70c56f3ee97cd683cb71009d3521d60b1f589c5a91b4671ede9f3 mini-snmpd-1.6.tar.gz
 sha256 8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56 COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 698402bc51..570241c256 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,15 +4,18 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = 1.4
+MINI_SNMPD_VERSION = 1.6
 MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_AUTORECONF = YES
+MINI_SNMPD_DEPENDENCIES = host-pkgconf
 
-define MINI_SNMPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/mini-snmpd.service
+define MINI_SNMPD_INSTALL_ETC_DEFAULT
+	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd \
+		$(TARGET_DIR)/etc/default/mini-snmpd
 endef
 
+MINI_SNMPD_POST_INSTALL_TARGET_HOOKS += MINI_SNMPD_INSTALL_ETC_DEFAULT
+
 $(eval $(autotools-package))
diff --git a/package/mini-snmpd/mini-snmpd.service b/package/mini-snmpd/mini-snmpd.service
deleted file mode 100644
index 8a15585e6e..0000000000
--- a/package/mini-snmpd/mini-snmpd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Mini SNMP Daemon
-StartLimitIntervalSec=0
-
-[Service]
-Environment='COMMUNITY=public'
-ExecStart=/sbin/mini_snmpd -a -n -c ${COMMUNITY} $EXTRA_PARAMS
-Restart=always
-RestartSec=1
-
-[Install]
-WantedBy=multi-user.target
