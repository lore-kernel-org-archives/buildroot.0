From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:33:59 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: disable tirpc tests using
	authdes_create
Message-ID: <20151211203817.8A59082524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1d735a1480f0f37a5996cb57c5a35ca2c3c3d90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In buildroot, libtirpc is patched to remove authdes_create functions.
As a result, compilation of tests that use these functions, fails.

A previous fix was implemented in commit
8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d, but simply disabled linking with
libtirpc entirely. This broke usage of ltp-testsuite on targets where the
toolchain does not have RPC support and libtirpc is mandatory.

Instead, disable only the problematic tests, leaving ltp-testsuite usable
with libtirpc.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...isable-tirpc_auth_authdes_seccreate-tests.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch b/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
new file mode 100644
index 0000000..6ab9d13
--- /dev/null
+++ b/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
@@ -0,0 +1,30 @@
+rpc-tirpc: disable tirpc_auth_authdes_seccreate tests
+
+Due to Buildroot patch 0007-Disable-DES-authentification-support.patch on
+libtirpc, this library is built without method authdes_create. Any code
+that uses this library, like the rpc-tirpc testsuite, thus fails to link.
+
+In the context of Buildroot, instead of disabling ltp-testsuite entirely,
+just disable the problematic tests.
+
+Upstream-status: not applicable
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+---
+ testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
+index 45bc8a6..6c4089e 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
+@@ -19,4 +19,7 @@
+ top_srcdir		?= ../../../../../../..
+ 
+ include	$(top_srcdir)/include/mk/env_pre.mk
++
++FILTER_OUT_DIRS += tirpc_auth_authdes_seccreate
++
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+-- 
+1.9.5
+
