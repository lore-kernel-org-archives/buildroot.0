From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 08:23:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: security bump to version
 2.26.3
In-Reply-To: <20200128072323.9204-1-peter@korsgaard.com>
References: <20200128072323.9204-1-peter@korsgaard.com>
Message-ID: <20200128072323.9204-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2019-8835: Multiple memory corruption issues were addressed with
  improved memory handling

- CVE-2019-8844: Multiple memory corruption issues were addressed with
  improved memory handling

- CVE-2019-8846: A use after free issue was addressed with improved memory
  management

For details, see the advisory:
https://webkitgtk.org/security/WSA-2020-0001.html

Drop now upstreamed patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Fix-build-with-icu-65.1.patch        | 76 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 +-
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 81 deletions(-)
 delete mode 100644 package/wpewebkit/0002-Fix-build-with-icu-65.1.patch

diff --git a/package/wpewebkit/0002-Fix-build-with-icu-65.1.patch b/package/wpewebkit/0002-Fix-build-with-icu-65.1.patch
deleted file mode 100644
index 7d4d23d472..0000000000
--- a/package/wpewebkit/0002-Fix-build-with-icu-65.1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 730b80e691a4b9dd0e9727cfcd9806dfa542397b Mon Sep 17 00:00:00 2001
-From: "commit-queue at webkit.org"
- <commit-queue@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Fri, 4 Oct 2019 21:51:37 +0000
-Subject: [PATCH] Fix build with icu 65.1
- https://bugs.webkit.org/show_bug.cgi?id=202600
-
-Patch by Heiko Becker <heirecka@exherbo.org> on 2019-10-04
-Reviewed by Konstantin Tokarev.
-
-Source/WebCore:
-
-* dom/Document.cpp:
-(WebCore::isValidNameNonASCII):
-(WebCore::Document::parseQualifiedName):
-
-Source/WTF:
-
-* wtf/URLHelpers.cpp:
-(WTF::URLHelpers::allCharactersInIDNScriptWhiteList):
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 250747 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-[james.hilliard1 at gmail.com: backport from upstream webkit commit
-730b80e691a4b9dd0e9727cfcd9806dfa542397b]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- Source/WTF/ChangeLog            | 10 ++++++++++
- Source/WTF/wtf/URLHelpers.cpp   |  2 +-
- Source/WebCore/ChangeLog        | 11 +++++++++++
- Source/WebCore/dom/Document.cpp |  6 +++---
- 4 files changed, 25 insertions(+), 4 deletions(-)
-
-diff --git a/Source/WTF/wtf/URLHelpers.cpp b/Source/WTF/wtf/URLHelpers.cpp
-index 18e7f13cd61..c584f1a0cb7 100644
---- a/Source/WTF/wtf/URLHelpers.cpp
-+++ b/Source/WTF/wtf/URLHelpers.cpp
-@@ -301,7 +301,7 @@ static bool allCharactersInIDNScriptWhiteList(const UChar* buffer, int32_t lengt
-     Optional<UChar32> previousCodePoint;
-     while (i < length) {
-         UChar32 c;
--        U16_NEXT(buffer, i, length, c)
-+        U16_NEXT(buffer, i, length, c);
-         UErrorCode error = U_ZERO_ERROR;
-         UScriptCode script = uscript_getScript(c, &error);
-         if (error != U_ZERO_ERROR) {
-diff --git a/Source/WebCore/dom/Document.cpp b/Source/WebCore/dom/Document.cpp
-index 2443e24c9bc..1fbb3a71600 100644
---- a/Source/WebCore/dom/Document.cpp
-+++ b/Source/WebCore/dom/Document.cpp
-@@ -4954,12 +4954,12 @@ static bool isValidNameNonASCII(const UChar* characters, unsigned length)
-     unsigned i = 0;
- 
-     UChar32 c;
--    U16_NEXT(characters, i, length, c)
-+    U16_NEXT(characters, i, length, c);
-     if (!isValidNameStart(c))
-         return false;
- 
-     while (i < length) {
--        U16_NEXT(characters, i, length, c)
-+        U16_NEXT(characters, i, length, c);
-         if (!isValidNamePart(c))
-             return false;
-     }
-@@ -5019,7 +5019,7 @@ ExceptionOr<std::pair<AtomString, AtomString>> Document::parseQualifiedName(cons
- 
-     for (unsigned i = 0; i < length; ) {
-         UChar32 c;
--        U16_NEXT(qualifiedName, i, length, c)
-+        U16_NEXT(qualifiedName, i, length, c);
-         if (c == ':') {
-             if (sawColon)
-                 return Exception { InvalidCharacterError };
--- 
-2.20.1
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 85a3271874..07a06466d0 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.26.2.tar.xz.sums
-md5 057cc2647231e90c8197873df9a9f54c wpewebkit-2.26.2.tar.xz
-sha1 eca4e35af2c2e70bd36a9bdef3bfbbfbd417210c wpewebkit-2.26.2.tar.xz
-sha256 dd4fce390f1721d8d6d017fa712adb990f7230bde84a1b7d27327bd589053fdd wpewebkit-2.26.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.26.3.tar.xz.sums
+md5 735beb5c1f825d5feda2e355aca6bec0 wpewebkit-2.26.3.tar.xz
+sha1 aeda665b3a137ac748ff1d08ce9e4c751f7caf97 wpewebkit-2.26.3.tar.xz
+sha256 2da9fe9c3a8bdfecc4281d848a4eacdd7be8ac5e0fc397020094d68cf32c10b3 wpewebkit-2.26.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index d732938b57..cf45b68943 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.26.2
+WPEWEBKIT_VERSION = 2.26.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.20.1
