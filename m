From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Jan 2017 19:40:08 +0100
Subject: [Buildroot] [PATCH] package/espeak: fix build issue with gcc6
Message-ID: <20170115184008.7261-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architecture, "char" is signed (x86_64, nios2...) so the
compiler try to convert int 0xc2 and 0xba to a signed char.
This is an error since gcc6 (Wnarrowing).

cast string_ordinal init values.

Fixes:
http://autobuild.buildroot.net/results/bae/baef9888b1979d18171668a675985e3f3b45fda6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...languages-cast-string_ordinal-init-values.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch

diff --git a/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch b/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch
new file mode 100644
index 0000000..d37e64c
--- /dev/null
+++ b/package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch
@@ -0,0 +1,33 @@
+From 451330d09a6a3500b40bc4f5896ba790ab46cd6c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 15 Jan 2017 19:37:31 +0100
+Subject: [PATCH 2/2] tr_languages: cast string_ordinal init values
+
+On some architecture, "char" is signed (x86_64, nios2...) so the
+compiler try to convert int 0xc2 and 0xba to a signed char.
+This is an error since gcc6 (Wnarrowing).
+
+Fixes:
+http://autobuild.buildroot.net/results/bae/baef9888b1979d18171668a675985e3f3b45fda6
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/tr_languages.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tr_languages.cpp b/src/tr_languages.cpp
+index 5c80286..dbc6e36 100644
+--- a/src/tr_languages.cpp
++++ b/src/tr_languages.cpp
+@@ -200,7 +200,7 @@ static const unsigned short chars_ignore_zwnj_hyphen[] = {
+ 	0x200d,  1, // zero width joiner
+ 	0, 0 };
+ 
+-const char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
++const char string_ordinal[] = {(char)0xc2,(char)0xba,0};  // masculine ordinal character, UTF-8
+ 
+ 
+ static Translator* NewTranslator(void)
+-- 
+2.9.3
+
-- 
2.9.3
