From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:27:37 +0100
Subject: [Buildroot] [git commit] package/libmicrohttpd: defining _REENTRANT
 on ARC is no longer needed
Message-ID: <20181124104553.BCBF8880BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e095fc98bf21b7562942b8781d339f246d5cdcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARC gcc compiler now defines _REENTRANT when -pthread is
passed. This issue was fixed upstream in gcc commit
de4c7f60f2891193bf3f5da823b17fa0d7fd4830, which is part of gcc
7.x. Therefore, both the gcc 7.x and 8.x versions, which can be
selected for the ARC architecture, are fixed, making the libmicrohttpd
work around useless.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 1cda434819..d5c6366d8d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -11,13 +11,6 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-# gcc on arc doesn't define _REENTRANT when -pthread is passed while
-# it should. Compensate this deficiency here otherwise libmicrohttpd
-# configure script doesn't find that thread support is enabled.
-ifeq ($(BR2_arc),y)
-LIBMICROHTTPD_CFLAGS += -D_REENTRANT
-endif
-
 LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
