From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 30 Oct 2015 11:27:47 -0400
Subject: [Buildroot] [PATCH 1/1] openssl: remove patch's git-hash to support
	fat/ntfs systems
Message-ID: <1446218867-6128-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Altering the OpenSSL parallel build patch's source location; the change
removes the Git hash reference from the URL. This is to support storing
cache data on file systems which have a more restrictive character set.
For this case, the downloaded patch will have the complete filename in
the 'dl' directory:

 openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d

For FAT/NTFS systems, it cannot handle the '?' character. By only using
the patch's filename, the file can be safely stored on FAT/NTFS systems
with the name:

 openssl-1.0.2d-parallel-build.patch

Removing the Git reference should not be a major issue since this
repository (which we are pulling the patch from), appears to be maintain
a series of patches for multiple versions of OpenSSL. The patch we are
fetching explicitly defines the OpenSSL version we are trying to patch.
In the worst case, if the patch is changed on or removed off its head,
Buildroot's hash-check will catch this.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/openssl/openssl.hash | 2 +-
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 9eaa363..118f532 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,4 @@
 # From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
 sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
 # Locally computed
-sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
+sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index cad8d0c..f2f181b 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -14,7 +14,7 @@ HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 OPENSSL_PATCH = \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch
 
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
-- 
1.9.5.msysgit.1
