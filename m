From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 30 Oct 2020 16:31:45 +0100
Subject: [Buildroot] [PATCH] package/uhd: fix build with riscV
Message-ID: <20201030153145.1198183-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

UHD with riscV CPU fails to build with error like:
/xxx/output-1/build/uhd-3.15.0.0/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:190:2: error: #error msgpack-c supports only big endian and little endian
  190 | #error msgpack-c supports only big endian and little endian
      |  ^~~~~

msgpack, required by MPMD, support many architecture but not riscV, and,
consequently is unable to determine the endianess.

This patch add a depends on !(BR2_RISCV_64 || BR2_RISCV_32) to disable MPMD
for riscV target.
Since E300 and E320 needs MPMD, the select is replaced by depends on

Fixes:
- http://autobuild.buildroot.net/results/b501a8bf90f2eb10c3f98f26a52539392d320088/
- http://autobuild.buildroot.net/results/f7ae898c6ecdfa568eb97f7cae6447e97ce306a0/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/uhd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 32cb4cf89d..cf4f470629 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -45,13 +45,13 @@ config BR2_PACKAGE_UHD_B200
 
 config BR2_PACKAGE_UHD_E300
 	bool "E300 support"
-	select BR2_PACKAGE_UHD_MPMD
+	depends on BR2_PACKAGE_UHD_MPMD
 	help
 	  enable E300 support
 
 config BR2_PACKAGE_UHD_E320
 	bool "E320 support"
-	select BR2_PACKAGE_UHD_MPMD
+	depends on BR2_PACKAGE_UHD_MPMD
 	help
 	  enable E320 support
 
@@ -62,6 +62,7 @@ config BR2_PACKAGE_UHD_EXAMPLES
 
 config BR2_PACKAGE_UHD_MPMD
 	bool "MPMD support"
+	depends on !(BR2_RISCV_64 || BR2_RISCV_32)
 	help
 	  enable MPMD support
 
-- 
2.20.1
