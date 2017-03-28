From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:43:35 +0200
Subject: [Buildroot] [git commit] samba4: security bump to version 4.5.7
Message-ID: <20170328194340.DE8C881810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=493cedf3af061b90a899826e0c184c2f484414f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-2619:

   All versions of Samba prior to 4.6.1, 4.5.7, 4.4.11 are vulnerable to
   a malicious client using a symlink race to allow access to areas of
   the server file system not exported under the share definition.

   Samba uses the realpath() system call to ensure when a client requests
   access to a pathname that it is under the exported share path on the
   server file system.

   Clients that have write access to the exported part of the file system
   via SMB1 unix extensions or NFS to create symlinks can race the server
   by renaming a realpath() checked path and then creating a symlink. If
   the client wins the race it can cause the server to access the new
   symlink target after the exported share path check has been done. This
   new symlink target can point to anywhere on the server file system.

   This is a difficult race to win, but theoretically possible. Note that
   the proof of concept code supplied wins the race reliably only when
   the server is slowed down using the strace utility running on the
   server. Exploitation of this bug has not been seen in the wild.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 4fec55d..71d24f7 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	bff02762b3e4ee030f02266c6e24a0b888248b387246219b7fbe3e1758ef2184	samba-4.5.5.tar.gz
+sha256	ac70f09af80639d8189e1b9bc0a554841ee44df2b1ef58e7e682ad5400fd9400	samba-4.5.7.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f64b684..aa7cb57 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.5
+SAMBA4_VERSION = 4.5.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
