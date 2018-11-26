From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 09:06:07 +0100
Subject: [Buildroot] [PATCH] package/msgpack: disable building tests
Message-ID: <20181126080607.31231-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The msgpack tests of msgpack 2.1.5 currently don't build with gcc 8.1
due to new gcc warnings. While this has been fixed in upstream commit
a05d92ae85024d0648f69f95307a1d3e8e51109c ("Fix
-Werror=class-memaccess"), we generally don't build tests in
Buildroot, so let's disable them.

It is worth mentioning that tests are automatically built when zlib,
gtest and thread support is found. msgpack.mk currently doesn't
express any optional dependency on zlib and gtest, but since these are
only used when building tests, and we are now disabling them, there is
no point in adding those packages as optional dependencies.

Fixes:

  http://autobuild.buildroot.net/results/7d7aa9723f02f9bc78dbf6248674be4d402199bf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: our msgpack package uses version 2.1.5, but there is a 3.1.1
version upstream. Perhaps it would be useful to bump this package at
some point.
---
 package/msgpack/msgpack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 38df8f53af..abb6e2e214 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -9,7 +9,7 @@ MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
-MSGPACK_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF
+MSGPACK_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF -DMSGPACK_BUILD_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
 MSGPACK_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
-- 
2.19.1
