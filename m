From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:16:19 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix definition of
	TOOLCHAIN_EXTERNAL_READELF
Message-ID: <20170326132405.535BF825B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9397bd643d2f64bd61843addd238ccee9ce66b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TOOLCHAIN_EXTERNAL_READELF is defined to
$(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX), where
TOOLCHAIN_EXTERNAL_SUFFIX is .br_real for Buildroot
toolchains. However, this is bogus, because readelf is not wrapped by
the Buildroot toolchain wrapper, so "<arch>-readelf.br_real" never
exists.

Therefore, it should simply be defined as
$(TOOLCHAIN_EXTERNAL_CROSS)readelf. Currently,
TOOLCHAIN_EXTERNAL_READELF is not used anywhere, so it wasn't visible,
but a follow-up commit will make use of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 77b7bbb..1d12290 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -91,7 +91,7 @@ TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX
 TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
 
 # Normal handling of downloaded toolchain tarball extraction.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
