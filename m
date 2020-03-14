From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:58:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/exiv2: fix
 CVE-2019-17402
Message-ID: <20200314174632.5E03581251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec89416cecb3526823be145ce21bd496d96857ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Exiv2 0.27.2 allows attackers to trigger a crash in Exiv2::getULong in
types.cpp when called from Exiv2::Internal::CiffDirectory::readDirectory
in crwimage_int.cpp, because there is no validation of the relationship
of the total size to the offset and size.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d383b46ac1efc987e7dad9b35380bf7ee154bfcc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Check-offset-and-size-against-total-size.patch | 32 ++++++++++++++++++++++
 package/exiv2/exiv2.mk                             |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch b/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
new file mode 100644
index 0000000000..f26006e3a5
--- /dev/null
+++ b/package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
@@ -0,0 +1,32 @@
+From b7890776c62398ca1005e8edc32786859d60fcf7 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sun, 6 Oct 2019 15:05:20 +0200
+Subject: [PATCH] crwimage: Check offset and size against total size
+
+Corrupted or specially crafted CRW images might exceed the overall
+buffersize.
+
+Fixes #1019
+
+(cherry picked from commit 683451567284005cd24e1ccb0a76ca401000968b)
+[Retrieved (and slightly updated to keep only the fix) from:
+https://github.com/Exiv2/exiv2/commit/50e9dd964a439da357798344ed1dd86edcadf0ec]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/crwimage_int.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 29311fdb7..c0d955350 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -268,6 +268,9 @@ namespace Exiv2 {
+ #ifdef EXIV2_DEBUG_MESSAGES
+         std::cout << "Reading directory 0x" << std::hex << tag() << "\n";
+ #endif
++        if (this->offset() + this->size() > size)
++            throw Error(kerOffsetOutOfRange);
++
+         readDirectory(pData + offset(), this->size(), byteOrder);
+ #ifdef EXIV2_DEBUG_MESSAGES
+         std::cout << "<---- 0x" << std::hex << tag() << "\n";
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 228b3a980e..7ef42fd9bc 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -10,6 +10,9 @@ EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
 EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 
+# 0001-crwimage-Check-offset-and-size-against-total-size.patch
+EXIV2_IGNORE_CVES += CVE-2019-17402
+
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
