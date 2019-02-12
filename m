From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:03:46 +0100
Subject: [Buildroot] [git commit] support/testing: build a glibc toolchain
 for docker / docker-compose tests
Message-ID: <20190212190320.1823588F2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11c55c94da9a51f0448a1ae869065736993e1787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

runc (which is a reverse dependency of docker-engine) is about to gain a
!uclibc dependency, so move to a glibc toolchain instead.

There are currently no prebuilt x86_64 / core2 / glibc toolchains available,
so instead use the internal toolchain backend to build one.

While we are at it, drop the infra.basetest.BASIC_TOOLCHAIN_CONFIG
reference, as that ARM toolchain configuration doesn't make any sense for
this x86-64 based test.

add docker / docker-compose tests

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_docker_compose.py | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 8bf3ae00b5..de53a3da14 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -4,19 +4,12 @@ import infra.basetest
 
 
 class TestDockerCompose(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+    config = \
         """
         BR2_x86_64=y
         BR2_x86_core2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.05.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
-        BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-        # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+        BR2_KERNEL_HEADERS_4_19=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
