From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 19:47:15 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/zeromq: security
 bump to version 4.3.3
Message-ID: <20200915175205.12C0987660@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=941efc499f43d87c4e3388c8d6c50f3c77968194
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2020-15166: Denial-of-Service on CURVE/ZAP-protected servers by
  unauthenticated clients.
  If a raw TCP socket is opened and connected to an endpoint that is fully
  configured with CURVE/ZAP, legitimate clients will not be able to exchange
  any message.  Handshakes complete successfully, and messages are delivered
  to the library, but the server application never receives them.  For more
  information see the security advisory:
  https://github.com/zeromq/libzmq/security/advisories/GHSA-25wp-cf8g-938m

- Stack overflow on server running PUB/XPUB socket (CURVE disabled).
  The PUB/XPUB subscription store (mtrie) is traversed using recursive
  function calls.  In the remove (unsubscription) case, the recursive calls
  are NOT tail calls, so even with optimizations the stack grows linearly
  with the length of a subscription topic.  Topics are under the control of
  remote clients - they can send a subscription to arbitrary length topics.
  An attacker can thus cause a server to create an mtrie sufficiently large
  such that, when unsubscribing, traversal will cause a stack overflow.  For
  more information see the security advisory:
  https://github.com/zeromq/libzmq/security/advisories/GHSA-qq65-x72m-9wr8

- Memory leak in PUB server induced by malicious client(s) without CURVE/ZAP.
  Messages with metadata are never processed by PUB sockets, but the
  metadata is kept referenced in the PUB object and never freed.  For more
  information see the security advisory:
  https://github.com/zeromq/libzmq/security/advisories/GHSA-4p5v-h92w-6wxw

- Memory leak in client induced by malicious server(s) without CURVE/ZAP.
  When a pipe processes a delimiter and is already not in active state but
  still has an unfinished message, the message is leaked.
  For more information see the security advisory:
  https://github.com/zeromq/libzmq/security/advisories/GHSA-wfr2-29gj-5w87

- Heap overflow when receiving malformed ZMTP v1 packets (CURVE disabled).
  By crafting a packet which is not valid ZMTP v2/v3, and which has two
  messages larger than 8192 bytes, the decoder can be tricked into changing
  the recorded size of the 8192 bytes static buffer, which then gets
  overflown by the next message.  The content that gets written in the
  overflown memory is entirely decided by the sender.
  For more information see the security advisory:
  https://github.com/zeromq/libzmq/security/advisories/GHSA-fc3w-qxf5-7hp6

Drop now upstreamed patches, autoreconf and reformat hash file with 2 space
delimiters.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fd1ac2e762cf6b32146881a540134f274c35ceb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch | 36 ----------------------
 package/zeromq/zeromq.hash                         | 10 +++---
 package/zeromq/zeromq.mk                           |  4 +--
 3 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch b/package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch
deleted file mode 100644
index 49f753b27f..0000000000
--- a/package/zeromq/0001-acinclude.m4-add-latomic-to-PKGCFG_LIBS_PRIVATE.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d59dcbcaebd91ca30a0f866403c383177a4843f8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Jan 2020 10:10:15 +0100
-Subject: [PATCH] acinclude.m4: add -latomic to PKGCFG_LIBS_PRIVATE
-
-Add -latomic to PKGCFG_LIBS_PRIVATE so applications linking statically
-with libzmq (such czmq) will know that they have to link with -latomic
-and the following build failure will be avoided:
-
-  CCLD     src/czmq_selftest
-/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libzmq.a(src_libzmq_la-ctx.o): in function `zmq::ctx_t::create_socket(int)':
-ctx.cpp:(.text+0x1710): undefined reference to `__atomic_fetch_add_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/4a12f1ede260cd956a0b5ccb4eec6ca8b44cb04f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/zeromq/libzmq/commit/d59dcbcaebd91ca30a0f866403c383177a4843f8]
----
- acinclude.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 8c042ca50..387a3d2a1 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -691,7 +691,7 @@ int main (int, char **)
-             return t;
-         }
-         ])],
--        [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
-+        [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" PKGCFG_LIBS_PRIVATE="$PKGCFG_LIBS_PRIVATE -latomic" ; $1],
-         [AC_MSG_RESULT(no) ; libzmq_cv_has_atomic_instrisics="no" LIBS=$save_LIBS ; $2])
-     fi
- }])
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 689d960b28..17ffff8762 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,7 +1,7 @@
 # From https://github.com/zeromq/libzmq/releases
-md5  2047e917c2cc93505e2579bcba67a573 zeromq-4.3.2.tar.gz
-sha1 e5253bff214f77621b3d29443f1aa6e5a106ffe5  zeromq-4.3.2.tar.gz
+md5  78acc277d95e10812d71b2b3c3c3c9a9  zeromq-4.3.3.tar.gz
+sha1  d78bc504194d6908df40a2b9e41849b181b02491  zeromq-4.3.3.tar.gz
 # Locally computed
-sha256 ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763  zeromq-4.3.2.tar.gz
-sha256 4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
-sha256 83f32abe61ee58ffb1b007412c08415168c052501dbf56d7a47aaaac52b03ef6  COPYING.LESSER
+sha256  9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2  zeromq-4.3.3.tar.gz
+sha256  4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
+sha256  83f32abe61ee58ffb1b007412c08415168c052501dbf56d7a47aaaac52b03ef6  COPYING.LESSER
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 04f7e7d3f2..7840d03624 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.3.2
+ZEROMQ_VERSION = 4.3.3
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
-# We're patching acinclude.m4
-ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
