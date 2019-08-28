From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 09:15:50 +0200
Subject: [Buildroot] [PATCH] package/qemu: security bump to version 3.1.1
Message-ID: <20190828071551.3476-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2018-16872: A flaw was found in qemu Media Transfer Protocol (MTP).  The
code opening files in usb_mtp_get_object and usb_mtp_get_partial_object and
directories in usb_mtp_object_readdir doesn't consider that the underlying
filesystem may have changed since the time lstat(2) was called in
usb_mtp_object_alloc, a classical TOCTTOU problem.  An attacker with write
access to the host filesystem shared with a guest can use this property to
navigate the host filesystem in the context of the QEMU process and read any
file the QEMU process has access to.  Access to the filesystem may be local
or via a network share protocol such as CIFS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 41e8e75a80..1155a43935 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,5 +1,5 @@
 # Locally computed, tarball verified with GPG signature
-sha256 6a0508df079a0a33c2487ca936a56c12122f105b8a96a44374704bef6c69abfc  qemu-3.1.0.tar.xz
+sha256 d7c69fef3fb4bfbac99e3f2ac9fb8d6409db4faadf2e37337d544e3fdb4fde3a  qemu-3.1.1.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 48ffe9fc7f1d5462dbd19340bc4dd1d8a9e37c61ed535813e614cbe4a5f0d4df  COPYING.LIB
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d36ec3e655..05d16560f7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@ ifeq ($(BR2_csky),y)
 QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
 QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
 else
-QEMU_VERSION = 3.1.0
+QEMU_VERSION = 3.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 endif
-- 
2.11.0
