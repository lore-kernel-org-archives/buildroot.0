From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 08:23:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to version
 2.26.3
Message-ID: <20200128072323.9204-1-peter@korsgaard.com>
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
 .../0001-Fix-build-with-icu-65.1.patch        | 76 -------------------
 package/webkitgtk/webkitgtk.hash              |  8 +-
 package/webkitgtk/webkitgtk.mk                |  2 +-
 3 files changed, 5 insertions(+), 81 deletions(-)
 delete mode 100644 package/webkitgtk/0001-Fix-build-with-icu-65.1.patch

diff --git a/package/webkitgtk/0001-Fix-build-with-icu-65.1.patch b/package/webkitgtk/0001-Fix-build-with-icu-65.1.patch
deleted file mode 100644
index 207e10491a..0000000000
--- a/package/webkitgtk/0001-Fix-build-with-icu-65.1.patch
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
-[aperez at igalia.com: backport from upstream webkit commit
-730b80e691a4b9dd0e9727cfcd9806dfa542397b]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 71642ad144..13d8742b7f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.26.2.tar.xz.sums
-md5 65e06fe73ee166447894aaea95038e3b webkitgtk-2.26.2.tar.xz
-sha1 5bd1ccb436c76fd1edb83afd5bec377de5655d45 webkitgtk-2.26.2.tar.xz
-sha256 6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512 webkitgtk-2.26.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.26.3.tar.xz.sums
+md5 4c27d59a032710dae3cffa5990bb6aea webkitgtk-2.26.3.tar.xz
+sha1 8d5a7b4f330788847f85e1b2cb6191435dcf9f28 webkitgtk-2.26.3.tar.xz
+sha256 add51153943cc11d90a7038d0ea5f6332281e6c0be0640f802a211b035f0e611 webkitgtk-2.26.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 27ae8c1e5a..389c16de4a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.26.2
+WEBKITGTK_VERSION = 2.26.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.20.1
