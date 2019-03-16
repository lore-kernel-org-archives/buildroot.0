From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 16 Mar 2019 18:40:36 +0100
Subject: [Buildroot] [PATCH 1/1] network-manager: Bump to version 1.14.6
Message-ID: <20190316174036.30822-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch (included in this release).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
NOTE: I wasn't able to build latest stable release 1.16.0
due to various errors (see below).
I might find correct configure option for building from git via
local.mk, but for now 1.14.6 is better than nothing (as 1.10 is in
maintanance mode, "Users are advised to update to 1.14.x series" [1])

Kind regards,
Petr

[1] https://wiki.gnome.org/Projects/NetworkManager

src/nm-connectivity.c: In function ?do_curl_request?:
src/nm-connectivity.c:679:2: error: unknown type name ?CURLM?
  CURLM *mhandle;
  ^~~~~
src/nm-connectivity.c:680:2: error: unknown type name ?CURL?; did you mean ?NULL??
  CURL *ehandle;
  ^~~~
  NULL

src/nm-connectivity.c:696:9: error: ?NMConnectivityCheckHandle {aka struct _NMConnectivityCheckHandle}? has no member named ?concheck?
  cb_data->concheck.curl_mhandle = mhandle;

...
src/nm-connectivity.c:699:51: error: ?_timeout_cb? undeclared (first use in this function); did you mean ?g_timeout_add??
  cb_data->timeout_id = g_timeout_add_seconds (20, _timeout_cb, cb_data);
                                                   ^~~~~~~~~~~
src/nm-connectivity.c:701:30: error: ?CURLMOPT_SOCKETFUNCTION? undeclared (first use in this function); did you mean ?G_TYPE_SOCKET_CONNECTION??
  curl_multi_setopt (mhandle, CURLMOPT_SOCKETFUNCTION, multi_socket_cb);
                              ^~~~~~~~~~~~~~~~~~~~~~~
                              G_TYPE_SOCKET_CONNECTION
---
 ...we-have-enough-space-for-the-DHCP6-o.patch | 38 -------------------
 package/network-manager/network-manager.hash  |  4 +-
 package/network-manager/network-manager.mk    |  4 +-
 3 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

diff --git a/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
deleted file mode 100644
index c6066abe28..0000000000
--- a/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 01ca2053bbea09f35b958c8cc7631e15469acb79 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Fri, 19 Oct 2018 12:12:33 +0200
-Subject: dhcp6: make sure we have enough space for the DHCP6 option header
-
-Fixes a vulnerability originally discovered by Felix Wilhelm from
-Google.
-
-CVE-2018-15688
-LP: #1795921
-https://bugzilla.redhat.com/show_bug.cgi?id=1639067
-
-(cherry picked from commit 4dac5eaba4e419b29c97da38a8b1f82336c2c892)
-
-Patch downloaded from upstream commit:
-https://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=01ca2053bbea09f35b958c8cc7631e15469acb79
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/systemd/src/libsystemd-network/dhcp6-option.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/systemd/src/libsystemd-network/dhcp6-option.c b/src/systemd/src/libsystemd-network/dhcp6-option.c
-index d178fe2..9027c14 100644
---- a/src/systemd/src/libsystemd-network/dhcp6-option.c
-+++ b/src/systemd/src/libsystemd-network/dhcp6-option.c
-@@ -108,7 +108,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, const DHCP6IA *ia) {
-                 return -EINVAL;
-         }
- 
--        if (*buflen < len)
-+        if (*buflen < offsetof(DHCP6Option, data) + len)
-                 return -ENOBUFS;
- 
-         ia_hdr = *buf;
--- 
-cgit v1.1
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 3439439175..7c64e6505e 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.10/NetworkManager-1.10.8.sha256sum
-sha256 eb4ac8ce75fed5ec804f409caec7b54342d4e01512baf7d7fc119fd40ac8a938  NetworkManager-1.10.8.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.14/NetworkManager-1.14.6.sha256sum
+sha256 693bcdad15eec7f07a06cbc6e43ddb3b1c13b2d2d23ec165fbb5adf4c3323a5d  NetworkManager-1.14.6.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 2b9f68a030..721533038c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.10
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8
+NETWORK_MANAGER_VERSION_MAJOR = 1.14
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.21.0
