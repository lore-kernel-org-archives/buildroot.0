From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sat, 29 Feb 2020 19:03:45 +0100
Subject: [Buildroot] [PATCH] package/mini-snmpd: bump to version 1.5
Message-ID: <20200229180345.1791229-1-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Post-release fixes:

Fix #16: Regression in ifTable for non-Ethernet
Remove developer debug messsages
Fix #17: Missing freeifaddrs() causing major memory leak
Remove a few unnecessary strdup()
Initialize stack variables to zero to not confuse inet_ntop()
Use consistent timeout setting between command line and config file
Fix duplicate DISTCLEANFILES

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 ...n-in-ifTable-for-non-Ethernet-interf.patch | 77 ++++++++++++++++++
 ...d-zero-byte-before-unsigned-integers.patch | 31 -------
 ...002-Remove-developer-debug-messsages.patch | 40 ++++++++++
 ...igned-integers-to-have-an-extra-byte.patch | 28 -------
 ...reeifaddrs-causing-major-memory-leak.patch | 29 +++++++
 ...0004-Remove-a-few-unnecessary-strdup.patch | 80 +++++++++++++++++++
 ...-variables-to-zero-to-not-confuse-in.patch | 58 ++++++++++++++
 ...imeout-setting-between-command-line-.patch | 56 +++++++++++++
 .../0007-Fix-duplicate-DISTCLEANFILES.patch   | 32 ++++++++
 package/mini-snmpd/mini-snmpd                 |  2 +
 package/mini-snmpd/mini-snmpd.hash            |  2 +-
 package/mini-snmpd/mini-snmpd.mk              | 10 ++-
 package/mini-snmpd/mini-snmpd.service         | 12 ---
 13 files changed, 382 insertions(+), 75 deletions(-)
 create mode 100644 package/mini-snmpd/0001-Fix-16-Regression-in-ifTable-for-non-Ethernet-interf.patch
 delete mode 100644 package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
 create mode 100644 package/mini-snmpd/0002-Remove-developer-debug-messsages.patch
 delete mode 100644 package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
 create mode 100644 package/mini-snmpd/0003-Fix-17-Missing-freeifaddrs-causing-major-memory-leak.patch
 create mode 100644 package/mini-snmpd/0004-Remove-a-few-unnecessary-strdup.patch
 create mode 100644 package/mini-snmpd/0005-Initialize-stack-variables-to-zero-to-not-confuse-in.patch
 create mode 100644 package/mini-snmpd/0006-Use-consistent-timeout-setting-between-command-line-.patch
 create mode 100644 package/mini-snmpd/0007-Fix-duplicate-DISTCLEANFILES.patch
 create mode 100644 package/mini-snmpd/mini-snmpd
 delete mode 100644 package/mini-snmpd/mini-snmpd.service

diff --git a/package/mini-snmpd/0001-Fix-16-Regression-in-ifTable-for-non-Ethernet-interf.patch b/package/mini-snmpd/0001-Fix-16-Regression-in-ifTable-for-non-Ethernet-interf.patch
new file mode 100644
index 0000000000..17e65152a0
--- /dev/null
+++ b/package/mini-snmpd/0001-Fix-16-Regression-in-ifTable-for-non-Ethernet-interf.patch
@@ -0,0 +1,77 @@
+From ff78ae0e2ea92adb869ba3c8b9095fc94bf04e52 Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Wed, 5 Feb 2020 05:54:23 +0100
+Subject: [PATCH] Fix #16: Regression in ifTable for non-Ethernet
+ interfaces, Linux
+
+This is an ugly workaround for Linux ppp and tun interfaces.  Ideally we
+should instead factor out the IP address code introduced in 1.5 into the
+get_ipinfo() function instead and maintain get_netinfo() only for iface
+stats used by ifTable and ifXtable.
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ linux.c      | 14 +++++++++-----
+ mini-snmpd.h |  1 +
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/linux.c b/linux.c
+index 8626a6a..c54011f 100644
+--- a/linux.c
++++ b/linux.c
+@@ -220,11 +220,13 @@ void get_netinfo(netinfo_t *netinfo)
+ 		if (i == -1)
+ 			continue;
+ 
++		logit(LOG_ERR, 0, "Interface %s is interesting! :-)", ifa->ifa_name);
+ 		switch (ifa->ifa_addr->sa_family) {
+ 		case AF_INET:
+ 			if (!ifa->ifa_addr || !ifa->ifa_netmask)
+ 				continue;
+ 
++			logit(LOG_ERR, 0, "Interface %s has a addr + netmask ...", ifa->ifa_name);
+ 			addr = (struct sockaddr_in *)ifa->ifa_addr;
+ 			mask = (struct sockaddr_in *)ifa->ifa_netmask;
+ 			if (addr) {
+@@ -243,7 +245,12 @@ void get_netinfo(netinfo_t *netinfo)
+ 			/* XXX: Not supported yet */
+ 			break;
+ 
+-		case AF_PACKET:
++		default:
++			break;
++		}
++
++		if (!netinfo->stats[i]) {
++			logit(LOG_ERR, 0, "Interface %s has an stats ...", ifa->ifa_name);
+ 			if (ifa->ifa_flags & IFF_POINTOPOINT)
+ 				netinfo->if_type[i] = 23; /* ppp(23) */
+ 			else if (ifa->ifa_flags & IFF_LOOPBACK)
+@@ -283,10 +290,7 @@ void get_netinfo(netinfo_t *netinfo)
+ 
+ 			/* XXX: Need better tracking on Linux, c.f. FreeBSD ... */
+ 			netinfo->lastchange[1] = get_process_uptime();
+-			break;
+-
+-		default:
+-			break;
++			netinfo->stats[i] = 1;
+ 		}
+ 	}
+ 
+diff --git a/mini-snmpd.h b/mini-snmpd.h
+index 0f51762..ce8ec00 100644
+--- a/mini-snmpd.h
++++ b/mini-snmpd.h
+@@ -221,6 +221,7 @@ typedef struct netinfo_s {
+ 	unsigned int ifindex[MAX_NR_INTERFACES];
+ 	unsigned int status[MAX_NR_INTERFACES];
+ 	unsigned int lastchange[MAX_NR_INTERFACES];
++	unsigned int stats[MAX_NR_INTERFACES];		/* Sentinel for backends */
+ 	long long rx_bytes[MAX_NR_INTERFACES];
+ 	long long rx_mc_packets[MAX_NR_INTERFACES];
+ 	long long rx_bc_packets[MAX_NR_INTERFACES];
+-- 
+2.23.0
+
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
diff --git a/package/mini-snmpd/0002-Remove-developer-debug-messsages.patch b/package/mini-snmpd/0002-Remove-developer-debug-messsages.patch
new file mode 100644
index 0000000000..780c3ab347
--- /dev/null
+++ b/package/mini-snmpd/0002-Remove-developer-debug-messsages.patch
@@ -0,0 +1,40 @@
+From d91efa44dd607c1a7a6ca4ed83643a3f5d96c53f Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Thu, 6 Feb 2020 05:39:05 +0100
+Subject: [PATCH] Remove developer debug messsages
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ linux.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/linux.c b/linux.c
+index c54011f..ad5714c 100644
+--- a/linux.c
++++ b/linux.c
+@@ -220,13 +220,11 @@ void get_netinfo(netinfo_t *netinfo)
+ 		if (i == -1)
+ 			continue;
+ 
+-		logit(LOG_ERR, 0, "Interface %s is interesting! :-)", ifa->ifa_name);
+ 		switch (ifa->ifa_addr->sa_family) {
+ 		case AF_INET:
+ 			if (!ifa->ifa_addr || !ifa->ifa_netmask)
+ 				continue;
+ 
+-			logit(LOG_ERR, 0, "Interface %s has a addr + netmask ...", ifa->ifa_name);
+ 			addr = (struct sockaddr_in *)ifa->ifa_addr;
+ 			mask = (struct sockaddr_in *)ifa->ifa_netmask;
+ 			if (addr) {
+@@ -250,7 +248,6 @@ void get_netinfo(netinfo_t *netinfo)
+ 		}
+ 
+ 		if (!netinfo->stats[i]) {
+-			logit(LOG_ERR, 0, "Interface %s has an stats ...", ifa->ifa_name);
+ 			if (ifa->ifa_flags & IFF_POINTOPOINT)
+ 				netinfo->if_type[i] = 23; /* ppp(23) */
+ 			else if (ifa->ifa_flags & IFF_LOOPBACK)
+-- 
+2.23.0
+
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
diff --git a/package/mini-snmpd/0003-Fix-17-Missing-freeifaddrs-causing-major-memory-leak.patch b/package/mini-snmpd/0003-Fix-17-Missing-freeifaddrs-causing-major-memory-leak.patch
new file mode 100644
index 0000000000..0384f03701
--- /dev/null
+++ b/package/mini-snmpd/0003-Fix-17-Missing-freeifaddrs-causing-major-memory-leak.patch
@@ -0,0 +1,29 @@
+From f78641245ba1f729f03bca8a9403e835bc96782e Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Thu, 6 Feb 2020 05:50:05 +0100
+Subject: [PATCH] Fix #17: Missing freeifaddrs() causing major memory
+ leak
+
+Only in Linux backend.
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/linux.c b/linux.c
+index ad5714c..a657912 100644
+--- a/linux.c
++++ b/linux.c
+@@ -292,6 +292,7 @@ void get_netinfo(netinfo_t *netinfo)
+ 	}
+ 
+ 	parse_file("/proc/net/dev", fields, NELEMS(fields), 0);
++	freeifaddrs(ifap);
+ }
+ 
+ #endif /* __linux__ */
+-- 
+2.23.0
+
diff --git a/package/mini-snmpd/0004-Remove-a-few-unnecessary-strdup.patch b/package/mini-snmpd/0004-Remove-a-few-unnecessary-strdup.patch
new file mode 100644
index 0000000000..f02650f4c5
--- /dev/null
+++ b/package/mini-snmpd/0004-Remove-a-few-unnecessary-strdup.patch
@@ -0,0 +1,80 @@
+From 8a75131555ac46d0406558716259b8f848103d30 Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Thu, 6 Feb 2020 05:51:25 +0100
+Subject: [PATCH] Remove a few unnecessary strdup()
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ mini-snmpd.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/mini-snmpd.c b/mini-snmpd.c
+index e26aa32..11e7003 100644
+--- a/mini-snmpd.c
++++ b/mini-snmpd.c
+@@ -415,11 +415,11 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'c':
+-			g_community = strdup(optarg);
++			g_community = optarg;
+ 			break;
+ 
+ 		case 'C':
+-			g_contact = strdup(optarg);
++			g_contact = optarg;
+ 			break;
+ 
+ 		case 'd':
+@@ -427,7 +427,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'D':
+-			g_description = strdup(optarg);
++			g_description = optarg;
+ 			break;
+ #ifdef HAVE_LIBCONFUSE
+ 		case 'f':
+@@ -451,7 +451,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 'L':
+-			g_location = strdup(optarg);
++			g_location = optarg;
+ 			break;
+ 
+ 		case 'n':
+@@ -483,7 +483,7 @@ int main(int argc, char *argv[])
+ 			return 0;
+ 
+ 		case 'V':
+-			g_vendor = strdup(optarg);
++			g_vendor = optarg;
+ 			break;
+ 
+ 		default:
+@@ -518,15 +518,15 @@ int main(int argc, char *argv[])
+ #endif
+ 
+ 	if (!g_community)
+-		g_community = strdup("public");
++		g_community = "public";
+ 	if (!g_vendor)
+-		g_vendor = strdup(VENDOR);
++		g_vendor = VENDOR;
+ 	if (!g_description)
+-		g_description = strdup("");
++		g_description = "";
+ 	if (!g_location)
+-		g_location = strdup("");
++		g_location = "";
+ 	if (!g_contact)
+-		g_contact = strdup("");
++		g_contact = "";
+ 
+ 	/* Store the starting time since we need it for MIB updates */
+ 	if (gettimeofday(&tv_last, NULL) == -1) {
+-- 
+2.23.0
+
diff --git a/package/mini-snmpd/0005-Initialize-stack-variables-to-zero-to-not-confuse-in.patch b/package/mini-snmpd/0005-Initialize-stack-variables-to-zero-to-not-confuse-in.patch
new file mode 100644
index 0000000000..e3627739e2
--- /dev/null
+++ b/package/mini-snmpd/0005-Initialize-stack-variables-to-zero-to-not-confuse-in.patch
@@ -0,0 +1,58 @@
+From 658b8e17227498a430183706d843ca6a0c8bc7a0 Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Thu, 6 Feb 2020 05:56:27 +0100
+Subject: [PATCH] Initialize stack variables to zero to not confuse
+ inet_ntop()
+
+Found by Valgrind.
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ mini-snmpd.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/mini-snmpd.c b/mini-snmpd.c
+index 11e7003..10f1877 100644
+--- a/mini-snmpd.c
++++ b/mini-snmpd.c
+@@ -90,10 +90,12 @@ static void handle_udp_client(void)
+ {
+ 	const char *req_msg = "Failed UDP request from";
+ 	const char *snd_msg = "Failed UDP response to";
+-	ssize_t rv;
+-	char straddr[my_inet_addrstrlen] = "";
+-	my_socklen_t socklen;
+ 	struct my_sockaddr_t sockaddr;
++	my_socklen_t socklen;
++	ssize_t rv;
++	char straddr[my_inet_addrstrlen] = { 0 };
++
++	memset(&sockaddr, 0, sizeof(sockaddr));
+ 
+ 	/* Read the whole UDP packet from the socket at once */
+ 	socklen = sizeof(sockaddr);
+@@ -142,13 +144,16 @@ static void handle_udp_client(void)
+ 
+ static void handle_tcp_connect(void)
+ {
+-	int rv;
+ 	const char *msg = "Could not accept TCP connection";
+-	char straddr[my_inet_addrstrlen] = "";
+-	client_t *client;
+-	my_socklen_t socklen;
+ 	struct my_sockaddr_t tmp_sockaddr;
+ 	struct my_sockaddr_t sockaddr;
++	my_socklen_t socklen;
++	client_t *client;
++	char straddr[my_inet_addrstrlen] = "";
++	int rv;
++
++	memset(&tmp_sockaddr, 0, sizeof(tmp_sockaddr));
++	memset(&sockaddr, 0, sizeof(sockaddr));
+ 
+ 	/* Accept the new connection (remember the client's IP address and port) */
+ 	socklen = sizeof(sockaddr);
+-- 
+2.23.0
+
diff --git a/package/mini-snmpd/0006-Use-consistent-timeout-setting-between-command-line-.patch b/package/mini-snmpd/0006-Use-consistent-timeout-setting-between-command-line-.patch
new file mode 100644
index 0000000000..d822205ad0
--- /dev/null
+++ b/package/mini-snmpd/0006-Use-consistent-timeout-setting-between-command-line-.patch
@@ -0,0 +1,56 @@
+From fbd53c1d6ae452b065fe0a2873b8909235987d34 Mon Sep 17 00:00:00 2001
+From: Matt Merhar <mattmerhar@protonmail.com>
+Date: Mon, 10 Feb 2020 23:24:16 -0500
+Subject: [PATCH] Use consistent timeout setting between command line and
+ config file
+
+When specified via -t or --timeout, the timeout is interpreted as being
+in seconds. In the config file, this wound up being interpreted as
+hundredths of seconds, leading to significantly higher resource
+consumption than necessary.
+
+Signed-off-by: Matt Merhar <mattmerhar@protonmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ globals.c    | 2 +-
+ mini-snmpd.c | 4 +++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/globals.c b/globals.c
+index da3ffe1..bc7dd7d 100644
+--- a/globals.c
++++ b/globals.c
+@@ -25,7 +25,7 @@
+ const struct in_addr inaddr_any = { INADDR_ANY };
+ 
+ int       g_family  = AF_INET;
+-int       g_timeout = 100;
++int       g_timeout = 1;
+ int       g_auth    = 0;
+ int       g_daemon  = 1;
+ int       g_syslog  = 0;
+diff --git a/mini-snmpd.c b/mini-snmpd.c
+index 3ea1583..1e59308 100644
+--- a/mini-snmpd.c
++++ b/mini-snmpd.c
+@@ -476,7 +476,7 @@ int main(int argc, char *argv[])
+ 			break;
+ 
+ 		case 't':
+-			g_timeout = atoi(optarg) * 100;
++			g_timeout = atoi(optarg);
+ 			break;
+ 
+ 		case 'u':
+@@ -533,6 +533,8 @@ int main(int argc, char *argv[])
+ 	if (!g_contact)
+ 		g_contact = "";
+ 
++	g_timeout *= 100;
++
+ 	/* Store the starting time since we need it for MIB updates */
+ 	if (gettimeofday(&tv_last, NULL) == -1) {
+ 		memset(&tv_last, 0, sizeof(tv_last));
+-- 
+2.23.0
+
diff --git a/package/mini-snmpd/0007-Fix-duplicate-DISTCLEANFILES.patch b/package/mini-snmpd/0007-Fix-duplicate-DISTCLEANFILES.patch
new file mode 100644
index 0000000000..b307bdf1cc
--- /dev/null
+++ b/package/mini-snmpd/0007-Fix-duplicate-DISTCLEANFILES.patch
@@ -0,0 +1,32 @@
+From 95c4d11d7b6d02c3d8c2509fd01c9a73e1b8bccb Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Wed, 12 Feb 2020 08:20:56 +0100
+Subject: [PATCH] Fix duplicate DISTCLEANFILES
+
+Reported by @tofurky over IRC :)
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d3ef567..e8eecf5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,6 @@
+ EXEC                  = mini-snmpd
+ EXTRA_DIST            = configure README.md COPYING ChangeLog.md TODO
+ doc_DATA              = README.md COPYING
+-DISTCLEANFILES        = *~ *.bak *.map .*.d *.d DEADJOE semantic.cache *.gdb *.elf core core.*
+ dist_man8_MANS        = $(EXEC).8
+ sbin_PROGRAMS         = $(EXEC)
+ AM_CPPFLAGS           = -DSYSCONFDIR=\"@sysconfdir@\" -DRUNSTATEDIR=\"@runstatedir@\"
+@@ -63,4 +62,4 @@ release: distcheck release-hook md5-dist
+ 
+ # Workaround for systemd unit file duing distcheck
+ DISTCHECK_CONFIGURE_FLAGS = --with-systemd=$$dc_install_base/$(systemd)
+-DISTCLEANFILES = lib/.libs/*
++DISTCLEANFILES = lib/.libs/* *~ *.bak *.map .*.d *.d DEADJOE semantic.cache *.gdb *.elf core core.*
+-- 
+2.23.0
+
diff --git a/package/mini-snmpd/mini-snmpd b/package/mini-snmpd/mini-snmpd
new file mode 100644
index 0000000000..0ca9901d58
--- /dev/null
+++ b/package/mini-snmpd/mini-snmpd
@@ -0,0 +1,2 @@
+# Require client authentication, thus SNMP version 2c
+EXTRA_PARAMS=-a
diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index de72bb59eb..bac1c99c71 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 59f84e94ef7c9ff36d243c7974a100903a4a9a0bb529b67cf6f0d3352138a86b mini-snmpd-1.4.tar.gz
+sha256 1535ae192d995856b81289ca9ae51b6542b8e46582fac489d7d2305697217572 mini-snmpd-1.5.tar.gz
 sha256 8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56 COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 698402bc51..92f7d8ab5d 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,15 +4,19 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = 1.4
+MINI_SNMPD_VERSION = 1.5
 MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_AUTORECONF = YES
 
 define MINI_SNMPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/mini-snmpd.service
+	mkdir -p $(TARGET_DIR)/etc/default
+	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd \
+		$(TARGET_DIR)/etc/default/mini-snmpd
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/mini-snmpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mini-snmpd.service
 endef
 
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
-- 
2.25.1
