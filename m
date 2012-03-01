From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 20:26:38 +0100
Subject: [Buildroot] [git commit] external-toolchain: adjust check for
	uClibc static toolchains
Message-ID: <20120306223952.2930190D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=090d486441e6ee1898a6a27f8827076464cf2110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current check for uClibc toolchain was verifying that a
ld-uClibc.so dynamic loader was present. However, with static-only
uClibc toolchains, this does not work. Instead, we check for an
uClibc-specific header file in the sysroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3f4818f..6e7f1f4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -196,7 +196,7 @@ check_uclibc_feature = \
 #
 check_uclibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld*-uClibc.so.* ; then \
+	if ! test -f $${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
