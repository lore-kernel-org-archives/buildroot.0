From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Feb 2020 11:46:46 +0100
Subject: [Buildroot] [git commit] linux: license files hashes are only valid
 for latest known version
Message-ID: <20200206111838.7FD318D3F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af33b1c29388b6fb6c6fc68c578b6c2315f1aaf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The content of COPYING changed between v4.16 and v4.17. Since kernels
before and after the change are supported, storing the hash for this
file will cause an error during "make legal-info" when a kernel with the
respective other hash is being used.

So, for the kernel, we do like we did for ATF: the license file is only
listed for the latest version.

In the process, add the missing license files referenced from COPYING
and align the fields to the new spacing convention.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[yann.morin.1998 at free.fr:
  - only list the licenses files for the latest version
  - restore the hash for COPYING
  - introduce hashes for the two new license files
  - expand commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash | 20 ++++++++++++--------
 linux/linux.mk   |  7 ++++++-
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 510f69cf19..8082a8cfba 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,15 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 945f2bf6af69eed0ac81ef75b571f37ae1e16a9bb8a2ae698a365ee3ec2c74b9  linux-5.4.17.tar.xz
+sha256  945f2bf6af69eed0ac81ef75b571f37ae1e16a9bb8a2ae698a365ee3ec2c74b9  linux-5.4.17.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
-sha256 ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
-sha256 d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
-sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
+sha256  47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
+sha256  ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
+sha256  d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
+sha256  be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
 # Locally computed
-sha256 18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
-sha256 7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
-sha256 ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
+sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
+sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
+
+# Licenses hashes
+sha256  ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/linux/linux.mk b/linux/linux.mk
index 9a2f63d4df..bf308b807a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,7 +6,12 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
-LINUX_LICENSE_FILES = COPYING
+ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
+LINUX_LICENSE_FILES = \
+	COPYING \
+	LICENSES/preferred/GPL-2.0 \
+	LICENSES/exceptions/Linux-syscall-note
+endif
 
 define LINUX_HELP_CMDS
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
