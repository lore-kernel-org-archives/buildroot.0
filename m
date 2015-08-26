From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 08:48:54 +0200
Subject: [Buildroot] [git commit] zyre: bump version to fix static linking
	problem
Message-ID: <20150826071214.4ABA1803C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6c13b337870470ad7aaf69c7d6a95adba951faf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last tagged release of zyre, v1.0.0, was made in May 2014. Since
then, they have switched to pkg-config to detect zmq and czmq, which
fixes static linking problems. However, they made a number of changes
to configure.ac, which make it difficult to backport just the relevant
changes.

Since we already had another backported fix, let's simply bump the
version of zyre to the latest available commit, which builds fine with
no change for shared and static scenarios, thanks to the use of
pkg-config.

An issue was opened upstream to ask them to tag a new release:
https://github.com/zeromq/zyre/issues/324.

Fixes:

  http://autobuild.buildroot.net/results/0ab/0ab4c6a4bb4942d51e7712073d4731d81ecb5251/

Thanks to Vincente Olivert Riera for the initial investigation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...inconsistent-use-of-const-on-some-methods.patch |   84 --------------------
 package/zyre/zyre.mk                               |    4 +-
 2 files changed, 2 insertions(+), 86 deletions(-)

diff --git a/package/zyre/0001-Problem-inconsistent-use-of-const-on-some-methods.patch b/package/zyre/0001-Problem-inconsistent-use-of-const-on-some-methods.patch
deleted file mode 100644
index 8e38ad0..0000000
--- a/package/zyre/0001-Problem-inconsistent-use-of-const-on-some-methods.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From f450770ea81682323a3c1704b6eafcb88d44a175 Mon Sep 17 00:00:00 2001
-From: Pieter Hintjens <ph@imatix.com>
-Date: Sat, 2 May 2015 14:54:11 +0200
-Subject: [PATCH] Problem: inconsistent use of 'const' on some methods
-
-Solution: any method that returns a managed string (i.e. not a fresh
-string that the caller must free) should return 'const char *'.
-
-Fixes #319
-
-Backported from:
-https://github.com/zeromq/zyre/commit/463d2a63e5e92f8028577c350a3badfcafc9c2cb
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/zyre_peer.c | 6 +++---
- src/zyre_peer.h | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/zyre_peer.c b/src/zyre_peer.c
-index 0497424..8b60c86 100644
---- a/src/zyre_peer.c
-+++ b/src/zyre_peer.c
-@@ -190,7 +190,7 @@ zyre_peer_connected (zyre_peer_t *self)
- //  ---------------------------------------------------------------------
- //  Return peer identity string
- 
--char *
-+const char *
- zyre_peer_identity (zyre_peer_t *self)
- {
-     assert (self);
-@@ -201,7 +201,7 @@ zyre_peer_identity (zyre_peer_t *self)
- //  ---------------------------------------------------------------------
- //  Return peer connection endpoint
- 
--char *
-+const char *
- zyre_peer_endpoint (zyre_peer_t *self)
- {
-     assert (self);
-@@ -295,7 +295,7 @@ zyre_peer_set_ready (zyre_peer_t *self, bool ready)
- //  ---------------------------------------------------------------------
- //  Get peer header value
- 
--char *
-+const char *
- zyre_peer_header (zyre_peer_t *self, char *key, char *default_value)
- {
-     assert (self);
-diff --git a/src/zyre_peer.h b/src/zyre_peer.h
-index d5a8060..f6a01b9 100644
---- a/src/zyre_peer.h
-+++ b/src/zyre_peer.h
-@@ -54,7 +54,7 @@ bool
-     zyre_peer_connected (zyre_peer_t *self);
- 
- //  Return peer connection endpoint
--char *
-+const char *
-     zyre_peer_endpoint (zyre_peer_t *self);
- 
- //  Send message to peer
-@@ -62,7 +62,7 @@ int
-     zyre_peer_send (zyre_peer_t *self, zre_msg_t **msg_p);
- 
- //  Return peer identity string
--char *
-+const char *
-     zyre_peer_identity (zyre_peer_t *self);
-     
- //  Register activity at peer
-@@ -94,7 +94,7 @@ void
-     zyre_peer_set_ready (zyre_peer_t *self, bool ready);
- 
- //  Get peer header value
--char *
-+const char *
-     zyre_peer_header (zyre_peer_t *self, char *key, char *default_value);
- 
- //  Set peer headers from provided dictionary
--- 
-2.5.0
-
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 661dddc..b17dfd0 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-ZYRE_VERSION = v1.0.0
+ZYRE_VERSION = a351468b7d313fc90c446668122365851a9c60e4
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
-ZYRE_DEPENDENCIES = czmq zeromq
+ZYRE_DEPENDENCIES = czmq zeromq host-pkgconf
 ZYRE_AUTORECONF = YES
 
 define ZYRE_CREATE_CONFIG_DIR
