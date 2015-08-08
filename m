From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 18:08:22 +0200
Subject: [Buildroot] [git commit] zyre: backport fix to build with recent
	versions of ZeroMQ
Message-ID: <20150808160931.BF76F800D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6364c770ed250aa39474be3c2eaa5c1e579cd136
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the recent bump of ZeroMQ, Zyre failed to build, due to the
const qualifier being dropped in a number of functions.

A backport from the upstream Github repository fixes the problem, and
therefore fixes the following build failure:

  http://autobuild.buildroot.org/results/d24/d24d7ccb878151bd81003763ba1a6bcd91d41dc9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...inconsistent-use-of-const-on-some-methods.patch |   84 ++++++++++++++++++++
 1 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/package/zyre/0001-Problem-inconsistent-use-of-const-on-some-methods.patch b/package/zyre/0001-Problem-inconsistent-use-of-const-on-some-methods.patch
new file mode 100644
index 0000000..8e38ad0
--- /dev/null
+++ b/package/zyre/0001-Problem-inconsistent-use-of-const-on-some-methods.patch
@@ -0,0 +1,84 @@
+From f450770ea81682323a3c1704b6eafcb88d44a175 Mon Sep 17 00:00:00 2001
+From: Pieter Hintjens <ph@imatix.com>
+Date: Sat, 2 May 2015 14:54:11 +0200
+Subject: [PATCH] Problem: inconsistent use of 'const' on some methods
+
+Solution: any method that returns a managed string (i.e. not a fresh
+string that the caller must free) should return 'const char *'.
+
+Fixes #319
+
+Backported from:
+https://github.com/zeromq/zyre/commit/463d2a63e5e92f8028577c350a3badfcafc9c2cb
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/zyre_peer.c | 6 +++---
+ src/zyre_peer.h | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/zyre_peer.c b/src/zyre_peer.c
+index 0497424..8b60c86 100644
+--- a/src/zyre_peer.c
++++ b/src/zyre_peer.c
+@@ -190,7 +190,7 @@ zyre_peer_connected (zyre_peer_t *self)
+ //  ---------------------------------------------------------------------
+ //  Return peer identity string
+ 
+-char *
++const char *
+ zyre_peer_identity (zyre_peer_t *self)
+ {
+     assert (self);
+@@ -201,7 +201,7 @@ zyre_peer_identity (zyre_peer_t *self)
+ //  ---------------------------------------------------------------------
+ //  Return peer connection endpoint
+ 
+-char *
++const char *
+ zyre_peer_endpoint (zyre_peer_t *self)
+ {
+     assert (self);
+@@ -295,7 +295,7 @@ zyre_peer_set_ready (zyre_peer_t *self, bool ready)
+ //  ---------------------------------------------------------------------
+ //  Get peer header value
+ 
+-char *
++const char *
+ zyre_peer_header (zyre_peer_t *self, char *key, char *default_value)
+ {
+     assert (self);
+diff --git a/src/zyre_peer.h b/src/zyre_peer.h
+index d5a8060..f6a01b9 100644
+--- a/src/zyre_peer.h
++++ b/src/zyre_peer.h
+@@ -54,7 +54,7 @@ bool
+     zyre_peer_connected (zyre_peer_t *self);
+ 
+ //  Return peer connection endpoint
+-char *
++const char *
+     zyre_peer_endpoint (zyre_peer_t *self);
+ 
+ //  Send message to peer
+@@ -62,7 +62,7 @@ int
+     zyre_peer_send (zyre_peer_t *self, zre_msg_t **msg_p);
+ 
+ //  Return peer identity string
+-char *
++const char *
+     zyre_peer_identity (zyre_peer_t *self);
+     
+ //  Register activity at peer
+@@ -94,7 +94,7 @@ void
+     zyre_peer_set_ready (zyre_peer_t *self, bool ready);
+ 
+ //  Get peer header value
+-char *
++const char *
+     zyre_peer_header (zyre_peer_t *self, char *key, char *default_value);
+ 
+ //  Set peer headers from provided dictionary
+-- 
+2.5.0
+
