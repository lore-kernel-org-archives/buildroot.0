From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Mar 2021 00:02:49 +0100
Subject: [Buildroot] [git commit] package/avrdude: Switch to upstream
Message-ID: <20210308224823.D9B67813A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the meanwhile "linuxspi" programmer was merged upstream, therefore
it's possible to switch to latest upstream tree instead of the old fork
without losing any functionality.

The fork we were using did auto-detection of kernel headers to detect
whether spidev.h was present or not, and thus whether to enable or
disable its linuxspi 'driver'. As spidev.h has been present since
linux-2.6.22, we can quite easily conclude that spidev support was
always enabled in the fork.

But upstream went a slightly different route, and added a configure
option (and they do no validity check).

So, to keep backward behaviour, we unconditionally enable it  now that
we switched back to use upstream.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
[yann.morin.1998 at free.fr:
  - clarify why we forcibly use --enable-linuxspi
  - fix the hash to adapt to the new svn tarball format (c043ecb20ce6)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 888668ae44..c7b4bf85bc 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cfa97af7badc713c62306ab85d0e7a288b064bf72e698494f73cb16c5b2c659e  avrdude-f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa.tar.gz
+sha256  a74532a61d07e43fc598ade4202e9a8c8697bce3e6031c5be6f51da651595f99  avrdude-r1450-br1.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index ae378dfbac..b6754684e1 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
-AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
+AVRDUDE_VERSION = r1450
+AVRDUDE_SITE_METHOD = svn
+AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 AVRDUDE_SUBDIR = avrdude
-# Sources coming from git, without generated configure and Makefile.in
+# Sources coming from svn, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
-AVRDUDE_CONF_OPTS = --enable-linuxgpio
+AVRDUDE_CONF_OPTS = --enable-linuxgpio --enable-linuxspi
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
