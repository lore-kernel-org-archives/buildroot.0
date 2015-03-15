From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 16:58:17 +0100
Subject: [Buildroot] [git commit] binutils: fix target binutils on ARC
Message-ID: <20150315155841.201DF800EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43e9d51d61c493bf1fcfe30541171b373f1658ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When an external toolchain is used on ARC, BR2_BINUTILS_VERSION is
undefined, so we use binutils 2.22, which doesn't support ARC and
anyway isn't available from the ARC download location.

So, let's defined a default ARC binutils version in binutils.mk.

Fixes:

  http://autobuild.buildroot.org/results/52a/52abadacd7aab2d5c11d094937f28198bf220662/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ac62f1f..4111583 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,8 +8,12 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
+ifeq ($(BR2_arc),y)
+BINUTILS_VERSION = arc-2014.12
+else
 BINUTILS_VERSION = 2.22
 endif
+endif # BINUTILS_VERSION
 
 ifeq ($(BR2_arc),y)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
