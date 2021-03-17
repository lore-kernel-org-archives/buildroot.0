From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:06:12 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/optee-test: add
 deps on openssl when enabled
Message-ID: <20210317191335.4E7697F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=993777636425f530d1695757eb94a1dd9dc52d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add a dependency on openssl upon BR2_PACKAGE_LIBOPENSSL=y to
enable some for OP-TEE embedded tests.

Building with libressl makes the optee-test test tool fail on a
certificate test; so we explicitly depend on libopenssl.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[yann.morin.1998 at free.fr:
  - match the depenency to libopenssl, since that's is what is used in
    the condition (BR2_PACKAGE_LIBOPENSSL)
  - add a blurb to explain why libopenssl is used, not the virutal
    openssl
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b2821ca786f31066eaab4687607fbcfec268c36f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/optee-test/optee-test.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 1f4f586672..f7e4cb3b99 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -11,6 +11,10 @@ OPTEE_TEST_LICENSE_FILES = LICENSE.md
 
 OPTEE_TEST_DEPENDENCIES = optee-client optee-os
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+OPTEE_TEST_DEPENDENCIES += libopenssl
+endif
+
 OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_OS_SDK)
 
 # Trusted Application are not built from CMake due to ta_dev_kit
