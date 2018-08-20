From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:56:14 +0200
Subject: [Buildroot] [git commit branch/next] libssh: fix download location
Message-ID: <20180820215044.9A4788E0EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38c29b54380e68e8fb237c6132c014a5721d4e06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The current download location fails, and Buildroot falls back to
sources.b.o:

--2018-08-20 23:41:39--  https://red.libssh.org/attachments/download/218/libssh-0.7.5.tar.xz
Resolving red.libssh.org (red.libssh.org)... 78.46.80.163
Connecting to red.libssh.org (red.libssh.org)|78.46.80.163|:443... connected.
The certificate's owner does not match hostname ???red.libssh.org???
--2018-08-20 23:41:39--  http://sources.buildroot.net/libssh/libssh-0.7.5.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.25.211.19, 104.25.210.19, 2400:cb00:2048:1::6819:d313, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.25.211.19|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 351632 (343K) [application/x-xz]

This commit fixes the download location:

--2018-08-20 23:43:04--  https://www.libssh.org/files/0.7/libssh-0.7.5.tar.xz
Resolving www.libssh.org (www.libssh.org)... 87.98.168.187, 2001:41d0:2:f80c::4
Connecting to www.libssh.org (www.libssh.org)|87.98.168.187|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 351632 (343K) [application/x-tar]

This patch is extracted from a contribution from Bernd Kuhls who was
also bumping the package at the same time
(http://patchwork.ozlabs.org/patch/959192/).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/libssh.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 34716c502a..902865d73b 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBSSH_VERSION = 0.7.5
+LIBSSH_VERSION_MAJOR = 0.7
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
-LIBSSH_SITE = https://red.libssh.org/attachments/download/218
+LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
 LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
