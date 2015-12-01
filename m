From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Dec 2015 15:14:38 -0300
Subject: [Buildroot] [PATCH 1/2] zeromq: bump to version 4.1.3
Message-ID: <1448993679-15036-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix build failure of zeromq with latest
libsodium, since sodium_init() has a retval and is now declared to warn
on unused result, with zeromq treating warnings as errors.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...return-code-of-sodium_init-is-not-checked.patch | 73 ++++++++++++++++++++++
 package/zeromq/zeromq.hash                         |  6 +-
 package/zeromq/zeromq.mk                           |  2 +-
 3 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 package/zeromq/0003-Problem-return-code-of-sodium_init-is-not-checked.patch

diff --git a/package/zeromq/0003-Problem-return-code-of-sodium_init-is-not-checked.patch b/package/zeromq/0003-Problem-return-code-of-sodium_init-is-not-checked.patch
new file mode 100644
index 0000000..fcdbc9c
--- /dev/null
+++ b/package/zeromq/0003-Problem-return-code-of-sodium_init-is-not-checked.patch
@@ -0,0 +1,73 @@
+From 479db2113643e459c11db392e0fefd6400657c9e Mon Sep 17 00:00:00 2001
+From: Constantin Rack <constantin@rack.li>
+Date: Sat, 8 Nov 2014 10:50:17 +0100
+Subject: [PATCH] Problem: return code of sodium_init() is not checked.
+
+There are two todo comments in curve_client.cpp and curve_server.cpp that suggest
+checking the return code of sodium_init() call. sodium_init() returns -1 on error,
+0 on success and 1 if it has been called before and is already initalized:
+https://github.com/jedisct1/libsodium/blob/master/src/libsodium/sodium/core.c
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: Upstream
+
+diff --git a/src/curve_client.cpp b/src/curve_client.cpp
+index 6019c54..77fc420 100644
+--- a/src/curve_client.cpp
++++ b/src/curve_client.cpp
+@@ -38,6 +38,7 @@ zmq::curve_client_t::curve_client_t (const options_t &options_) :
+     cn_peer_nonce(1),
+     sync()
+ {
++    int rc;
+     memcpy (public_key, options_.curve_public_key, crypto_box_PUBLICKEYBYTES);
+     memcpy (secret_key, options_.curve_secret_key, crypto_box_SECRETKEYBYTES);
+     memcpy (server_key, options_.curve_server_key, crypto_box_PUBLICKEYBYTES);
+@@ -47,12 +48,12 @@ zmq::curve_client_t::curve_client_t (const options_t &options_) :
+     unsigned char tmpbytes[4];
+     randombytes(tmpbytes, 4);
+ #else
+-    // todo check return code
+-    sodium_init();
++    rc = sodium_init ();
++    zmq_assert (rc != -1);
+ #endif
+ 
+     //  Generate short-term key pair
+-    const int rc = crypto_box_keypair (cn_public, cn_secret);
++    rc = crypto_box_keypair (cn_public, cn_secret);
+     zmq_assert (rc == 0);
+ }
+ 
+diff --git a/src/curve_server.cpp b/src/curve_server.cpp
+index a3c4243..22c32d6 100644
+--- a/src/curve_server.cpp
++++ b/src/curve_server.cpp
+@@ -42,6 +42,7 @@ zmq::curve_server_t::curve_server_t (session_base_t *session_,
+     cn_peer_nonce(1),
+     sync()
+ {
++    int rc;
+     //  Fetch our secret key from socket options
+     memcpy (secret_key, options_.curve_secret_key, crypto_box_SECRETKEYBYTES);
+     scoped_lock_t lock (sync);
+@@ -50,12 +51,12 @@ zmq::curve_server_t::curve_server_t (session_base_t *session_,
+     unsigned char tmpbytes[4];
+     randombytes(tmpbytes, 4);
+ #else
+-    // todo check return code
+-    sodium_init();
++    rc = sodium_init ();
++    zmq_assert (rc != -1);
+ #endif
+ 
+     //  Generate short-term key pair
+-    const int rc = crypto_box_keypair (cn_public, cn_secret);
++    rc = crypto_box_keypair (cn_public, cn_secret);
+     zmq_assert (rc == 0);
+ }
+ 
+-- 
+2.4.10
+
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 6c7916e..b744740 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,4 +1,4 @@
-# Locally calculated from download (no sig, hash)
-sha256	f9162ead6d68521e5154d871bac304f88857308bb02366b81bb588497a345927	zeromq-4.1.2.tar.gz
 # From http://download.zeromq.org/SHA1SUMS:
-sha1	86c17096f7f4bf46cbcd2ad242cf8fec8a7cfb7b	zeromq-4.1.2.tar.gz
+sha1	b7185724f2fd56d0face50047757ac2a04d26ca4	zeromq-4.1.3.tar.gz
+# Calculated based on the hash above
+sha256	61b31c830db377777e417235a24d3660a4bcc3f40d303ee58df082fcd68bf411	zeromq-4.1.3.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index a58a6fe..ab30b78 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.1.2
+ZEROMQ_VERSION = 4.1.3
 ZEROMQ_SITE = http://download.zeromq.org
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
-- 
2.4.10
