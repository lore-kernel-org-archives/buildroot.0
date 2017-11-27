From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:28:42 +0100
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.7.3
Message-ID: <20171201205338.0112F8035D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7f33aa9d12b3c756a9aae9325ffc9a53d06bb5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased 0001-libreplace-disable-libbsd-support.patch.

Added iconv-related entry to samba4-cache.txt to fix configure error:
Cross answers file
 /home/buildroot/test-samba4/armv5-ctng-linux-gnueabi/build/samba4-4.7.3/cache.txt
 is incomplete

with this defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_SAMBA4=y
BR2_PACKAGE_SAMBA4_AD_DC=y
BR2_PACKAGE_SAMBA4_ADS=y
BR2_PACKAGE_SAMBA4_SMBTORTURE=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/0001-libreplace-disable-libbsd-support.patch | 11 +++++++----
 package/samba4/samba4-cache.txt                             |  1 +
 package/samba4/samba4.hash                                  |  2 +-
 package/samba4/samba4.mk                                    |  2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
index 4d0c770..ed6accf 100644
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -9,6 +9,8 @@ This causes redefinition conflicts for link(2) when both standard
 unistd.h and bsd/unistd.h get included.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+(rebased for version 4.7.3)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  lib/replace/wscript | 12 ------------
  1 file changed, 12 deletions(-)
@@ -17,14 +19,15 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
 index 1dfd902..456be9b 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -248,18 +248,6 @@ def configure(conf):
+@@ -253,19 +253,6 @@
  
-     conf.CHECK_FUNCS('prctl dirname basename')
+     strlcpy_in_bsd = False
  
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
--        conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
--                checklibc=True)
+-        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
+-                               checklibc=True):
+-            strlcpy_in_bsd = True
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index 3ba8a75..4a6471d 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -37,3 +37,4 @@ Checking value of NSIG: "65"
 Checking value of _NSIG: "65"
 Checking value of SIGRTMAX: "64"
 Checking value of SIGRTMIN: "34"
+Checking errno of iconv for illegal multibyte sequence: "0"
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7446b1b..49122c6 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c31db4aad82f0b9588ef6c4b4dab5dce3fa1787bd298e62d953c2628bb1af21a  samba-4.6.9.tar.gz
+sha256 06e4152ca1cb803f005e92eb6baedb6cc874998b44ee37c2a7819e77a55bfd2c  samba-4.7.3.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7502fa6..f7dd30c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.9
+SAMBA4_VERSION = 4.7.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
