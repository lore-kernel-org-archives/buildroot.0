From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 14:54:00 +0200
Subject: [Buildroot] [git commit] Revert "package/python-sip: bump to
 version 4.19.13"
Message-ID: <20190921124956.4A9148ED5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79bf5cb65917e38c6b7e50dd37282dca42f54a12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9135ab7a7c76b38b50dadbc381c55e77c86e9e0d. This
version bump causes a major issue: the entire root filesystem of the
build machine is being copied into $(STAGING_DIR)/usr/lib/python2.7/,
causing the build to consume the entire disk space of the machine.

>>> python-sip 4.19.13 Installing to target
[...]
make[2]: Leaving directory `/home/test/buildroot/output/build/python-sip-4.19.13/siplib'
Traceback (most recent call last):
  File "/home/test/buildroot/output/build/python-sip-4.19.13/mk_distinfo.py", line 108, in <module>
    fn_f = open(fn, 'rb')
FileNotFoundError: [Errno 2] No such file or directory: '/home/test/buildroot/output/target/usr/lib/python3.7/site-packages/sip.pyi'
make[1]: *** [install_distinfo] Error 1
make[1]: *** Waiting for unfinished jobs....
cp: cannot open `/proc/fs/aufs/plink_maint' for reading: Permission denied
cp: cannot open `/proc/sys/fs/protected_fifos' for reading: Permission denied
cp: cannot open `/proc/sys/fs/protected_hardlinks' for reading: Permission denied
cp: cannot open `/proc/sys/fs/protected_regular' for reading: Permission denied
cp: cannot open `/proc/sys/fs/protected_symlinks' for reading: Permission denied
cp: cannot open `/proc/sys/kernel/cad_pid' for reading: Permission denied
cp: cannot open `/proc/sys/kernel/unprivileged_userns_apparmor_policy' for reading: Permission denied
cp: cannot open `/proc/sys/kernel/usermodehelper/bset' for reading: Permission denied
...

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sip/python-sip.hash | 7 +++----
 package/python-sip/python-sip.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
index 3a4bd53677..6adf44d410 100644
--- a/package/python-sip/python-sip.hash
+++ b/package/python-sip/python-sip.hash
@@ -1,8 +1,7 @@
-# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.13/
-md5  9124cb8978742685747a5415179a9890		sip-4.19.13.tar.gz
-sha1 acb826ca1a49742d17686cef246cceabcc87e3b9	sip-4.19.13.tar.gz
+# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.18/
+md5 78724bf2a79878201c3bc81a1d8248ea	sip-4.18.tar.gz
 # Locally calculated:
-sha256 e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e  sip-4.19.13.tar.gz
+sha256 f1dc5c81c07a9ad97edcd4a0af964a41e420024ba7ca165afd2b351efd249cb6	 sip-4.18.tar.gz
 sha256 accecbfda71ad4497bce0d451796706e734e405e5ecf3b3f9ee0cc68300a3d9c  LICENSE
 sha256 7ebb61006e46b9e9340dd135d5f4afbbcb1d1d6c6709f74473b35929007b9aeb  LICENSE-GPL2
 sha256 63cb5f5c1ea39b732c495f354f971e40f6db84c567ca5573a68bb65af07741f8  LICENSE-GPL3
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 15c025142a..69019f5f19 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SIP_VERSION = 4.19.13
+PYTHON_SIP_VERSION = 4.18
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
