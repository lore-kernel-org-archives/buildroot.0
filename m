From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 21:00:07 +0100
Subject: [Buildroot] [PATCH 14/16] external-toolchain: adjust check for
	uClibc static toolchains
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <090d486441e6ee1898a6a27f8827076464cf2110.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
1.7.4.1
