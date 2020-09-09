From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2020 12:50:20 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/linux-headers:
 the latest headers are 5.6
Message-ID: <20200909104219.869518875D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d18b83a52435f8ee995ffd1b5b3ac75ac50fc44f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

In commit c2009e9f757fe759c74406f1025967b7b8e77f0a
("package/linux-headers: license files hashes only valid for latest
version"), we introduced BR2_KERNEL_HEADERS_LATEST, which should only
be set for the most recent kernel headers versions.

Indeed, the COPYING file of Linux has changed before/after Linux 5.6,
causing its hash file to be different. Since linux-headers uses
linux/linux.hash as the hash file, and this hash file contains the
COPYING hash of Linux >= 5.6, we cannot use that hash for Linux
versions older than 5.6.

When newer versions of the headers than 5.4 were added, this
BR2_KERNEL_HEADERS_LATEST was not moved as it should have been. We fix
this, which fixes a legal-info failure happening when Linux kernel
headers 5.4 are used:

>>> linux-headers 5.4.61 Patching
>>> linux-headers 5.4.61 Collecting legal info
ERROR: COPYING has wrong sha256 hash:
ERROR: expected: fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0
ERROR: got     : ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/linux-headers/linux-headers.mk:158: linux-headers-legal-info] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 407a6b4518..5c4b7c28f4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -53,7 +53,6 @@ config BR2_KERNEL_HEADERS_4_19
 config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
-	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_5_5
 	bool "Linux 5.5.x kernel headers"
@@ -62,6 +61,7 @@ config BR2_KERNEL_HEADERS_5_5
 config BR2_KERNEL_HEADERS_5_6
 	bool "Linux 5.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
+	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
