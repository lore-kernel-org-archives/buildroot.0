From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 21:05:44 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: Fix build with icu 65.1
Message-ID: <20200121200043.B17DD83467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f8abbeec33ce8dfc0e3b14d2c352210634ce28c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix build issue introduced in buildroot commit
e2a2fab11baf7cdc7e74d4f65ec73c4c79668007 which bumped ICU to
version 65.1.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../wpewebkit/0002-Fix-build-with-icu-65.1.patch   | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/wpewebkit/0002-Fix-build-with-icu-65.1.patch b/package/wpewebkit/0002-Fix-build-with-icu-65.1.patch
new file mode 100644
index 0000000000..7d4d23d472
--- /dev/null
+++ b/package/wpewebkit/0002-Fix-build-with-icu-65.1.patch
@@ -0,0 +1,76 @@
+From 730b80e691a4b9dd0e9727cfcd9806dfa542397b Mon Sep 17 00:00:00 2001
+From: "commit-queue at webkit.org"
+ <commit-queue@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Fri, 4 Oct 2019 21:51:37 +0000
+Subject: [PATCH] Fix build with icu 65.1
+ https://bugs.webkit.org/show_bug.cgi?id=202600
+
+Patch by Heiko Becker <heirecka@exherbo.org> on 2019-10-04
+Reviewed by Konstantin Tokarev.
+
+Source/WebCore:
+
+* dom/Document.cpp:
+(WebCore::isValidNameNonASCII):
+(WebCore::Document::parseQualifiedName):
+
+Source/WTF:
+
+* wtf/URLHelpers.cpp:
+(WTF::URLHelpers::allCharactersInIDNScriptWhiteList):
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 250747 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+[james.hilliard1 at gmail.com: backport from upstream webkit commit
+730b80e691a4b9dd0e9727cfcd9806dfa542397b]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ Source/WTF/ChangeLog            | 10 ++++++++++
+ Source/WTF/wtf/URLHelpers.cpp   |  2 +-
+ Source/WebCore/ChangeLog        | 11 +++++++++++
+ Source/WebCore/dom/Document.cpp |  6 +++---
+ 4 files changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/Source/WTF/wtf/URLHelpers.cpp b/Source/WTF/wtf/URLHelpers.cpp
+index 18e7f13cd61..c584f1a0cb7 100644
+--- a/Source/WTF/wtf/URLHelpers.cpp
++++ b/Source/WTF/wtf/URLHelpers.cpp
+@@ -301,7 +301,7 @@ static bool allCharactersInIDNScriptWhiteList(const UChar* buffer, int32_t lengt
+     Optional<UChar32> previousCodePoint;
+     while (i < length) {
+         UChar32 c;
+-        U16_NEXT(buffer, i, length, c)
++        U16_NEXT(buffer, i, length, c);
+         UErrorCode error = U_ZERO_ERROR;
+         UScriptCode script = uscript_getScript(c, &error);
+         if (error != U_ZERO_ERROR) {
+diff --git a/Source/WebCore/dom/Document.cpp b/Source/WebCore/dom/Document.cpp
+index 2443e24c9bc..1fbb3a71600 100644
+--- a/Source/WebCore/dom/Document.cpp
++++ b/Source/WebCore/dom/Document.cpp
+@@ -4954,12 +4954,12 @@ static bool isValidNameNonASCII(const UChar* characters, unsigned length)
+     unsigned i = 0;
+ 
+     UChar32 c;
+-    U16_NEXT(characters, i, length, c)
++    U16_NEXT(characters, i, length, c);
+     if (!isValidNameStart(c))
+         return false;
+ 
+     while (i < length) {
+-        U16_NEXT(characters, i, length, c)
++        U16_NEXT(characters, i, length, c);
+         if (!isValidNamePart(c))
+             return false;
+     }
+@@ -5019,7 +5019,7 @@ ExceptionOr<std::pair<AtomString, AtomString>> Document::parseQualifiedName(cons
+ 
+     for (unsigned i = 0; i < length; ) {
+         UChar32 c;
+-        U16_NEXT(qualifiedName, i, length, c)
++        U16_NEXT(qualifiedName, i, length, c);
+         if (c == ':') {
+             if (sawColon)
+                 return Exception { InvalidCharacterError };
+-- 
+2.20.1
+
