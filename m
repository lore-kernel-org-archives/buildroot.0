From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Oct 2020 17:34:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/fastd: fix CVE-2020-27638
Message-ID: <20201031163420.289481-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

receive.c in fastd before v21 allows denial of service (assertion
failure) when receiving packets with an invalid type code.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-leak-when-receiving-invalid-packets.patch | 45 +++++++++++++++++++
 package/fastd/fastd.mk                        |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch

diff --git a/package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch b/package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
new file mode 100644
index 0000000000..f4a44fea6d
--- /dev/null
+++ b/package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
@@ -0,0 +1,45 @@
+From 737925113363b6130879729cdff9ccc46c33eaea Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <mschiffer@universe-factory.net>
+Date: Mon, 19 Oct 2020 21:08:16 +0200
+Subject: [PATCH] receive: fix buffer leak when receiving invalid packets
+
+For fastd versions before v20, this was just a memory leak (which could
+still be used for DoS, as it's remotely triggerable). With the new
+buffer management of fastd v20, this will trigger an assertion failure
+instead as soon as the buffer pool is empty.
+
+[Retrieved from:
+https://github.com/NeoRaider/fastd/commit/737925113363b6130879729cdff9ccc46c33eaea]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/receive.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/receive.c b/src/receive.c
+index 043c9f2..6bca9f4 100644
+--- a/src/receive.c
++++ b/src/receive.c
+@@ -169,6 +169,11 @@ static inline void handle_socket_receive_known(
+ 
+ 	case PACKET_HANDSHAKE:
+ 		fastd_handshake_handle(sock, local_addr, remote_addr, peer, buffer);
++		break;
++
++	default:
++		fastd_buffer_free(buffer);
++		pr_debug("received packet with invalid type from %P[%I]", peer, remote_addr);
+ 	}
+ }
+ 
+@@ -195,6 +200,11 @@ static inline void handle_socket_receive_unknown(
+ 
+ 	case PACKET_HANDSHAKE:
+ 		fastd_handshake_handle(sock, local_addr, remote_addr, NULL, buffer);
++		break;
++
++	default:
++		fastd_buffer_free(buffer);
++		pr_debug("received packet with invalid type from unknown address %I", remote_addr);
+ 	}
+ }
+ 
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index b1261f0fa5..d556e2fbb1 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -12,6 +12,9 @@ FASTD_LICENSE_FILES = COPYRIGHT
 FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
 FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium libcap
 
+# 0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
+FASTD_IGNORE_CVES += CVE-2020-27638
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON
 FASTD_DEPENDENCIES += openssl
-- 
2.28.0
