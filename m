From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:00:21 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] wavpack: don't download
 patch from Github
Message-ID: <20180410205257.52DB9882EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b08d5c0fe527f51b196782d1d21d815dfaef03c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a2576d37ebb4175aea1daf3c14c947df39cdcaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-19-new-dependency-on-wchar-t-by-removing.patch | 70 ++++++++++++++++++++++
 package/wavpack/wavpack.hash                       |  1 -
 package/wavpack/wavpack.mk                         |  3 -
 3 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch b/package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch
new file mode 100644
index 0000000000..e5faf91221
--- /dev/null
+++ b/package/wavpack/0001-fix-Github-issue-19-new-dependency-on-wchar-t-by-removing.patch
@@ -0,0 +1,70 @@
+From 876fc3f3907e871d0938ac6c8c5252f5f31abd1f Mon Sep 17 00:00:00 2001
+From: David Bryant <david@wavpack.com>
+Date: Thu, 16 Feb 2017 17:11:12 -0800
+Subject: [PATCH] fix GitHub issue #19 (new dependency on wchar_t) by removing
+ dependency
+
+[Upstream commit: https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ cli/import_id3.c | 10 +++++-----
+ cli/wvtag.c      |  2 ++
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/cli/import_id3.c b/cli/import_id3.c
+index 51e54ee..fc30aeb 100644
+--- a/cli/import_id3.c
++++ b/cli/import_id3.c
+@@ -34,7 +34,7 @@ static struct {
+ 
+ #define NUM_TEXT_TAG_ITEMS (sizeof (text_tag_table) / sizeof (text_tag_table [0]))
+ 
+-static int WideCharToUTF8 (const wchar_t *Wide, unsigned char *pUTF8, int len);
++static int WideCharToUTF8 (const uint16_t *Wide, unsigned char *pUTF8, int len);
+ static void Latin1ToUTF8 (void *string, int len);
+ 
+ // Import specified ID3v2.3 tag. The WavPack context accepts the tag items, and can be
+@@ -163,7 +163,7 @@ int ImportID3v2 (WavpackContext *wpc, unsigned char *tag_data, int tag_size, cha
+             }
+             else if (frame_body [0] == 1 && frame_size > 2 && frame_body [1] == 0xFF && frame_body [2] == 0xFE) {
+                 int nchars = (frame_size - 3) / 2;
+-                wchar_t *wide_string = malloc ((nchars + 1) * sizeof (wchar_t));
++                uint16_t *wide_string = malloc ((nchars + 1) * sizeof (uint16_t));
+                 unsigned char *fp = frame_body + 3;
+ 
+                 utf8_string = malloc ((nchars + 1) * 3);
+@@ -297,9 +297,9 @@ int ImportID3v2 (WavpackContext *wpc, unsigned char *tag_data, int tag_size, cha
+ // may be less than the number of characters in the wide string if the buffer
+ // length is exceeded.
+ 
+-static int WideCharToUTF8 (const wchar_t *Wide, unsigned char *pUTF8, int len)
++static int WideCharToUTF8 (const uint16_t *Wide, unsigned char *pUTF8, int len)
+ {
+-    const wchar_t *pWide = Wide;
++    const uint16_t *pWide = Wide;
+     int outndx = 0;
+ 
+     while (*pWide) {
+@@ -335,7 +335,7 @@ static int WideCharToUTF8 (const wchar_t *Wide, unsigned char *pUTF8, int len)
+ static void Latin1ToUTF8 (void *string, int len)
+ {
+     int max_chars = (int) strlen (string);
+-    wchar_t *temp = (wchar_t *) malloc ((max_chars + 1) * 2);
++    uint16_t *temp = (uint16_t *) malloc ((max_chars + 1) * sizeof (uint16_t));
+ 
+     MultiByteToWideChar (28591, 0, string, -1, temp, max_chars + 1);
+     WideCharToUTF8 (temp, (unsigned char *) string, len);
+diff --git a/cli/wvtag.c b/cli/wvtag.c
+index 6e6512a..45e621e 100644
+--- a/cli/wvtag.c
++++ b/cli/wvtag.c
+@@ -1344,7 +1344,9 @@ static void dump_UTF8_string (char *string, FILE *dst)
+ // resulting string will not fit in the specified buffer size then it is
+ // truncated.
+ 
++#if defined (_WIN32)
+ static int UTF8ToWideChar (const unsigned char *pUTF8, wchar_t *pWide);
++#endif
+ 
+ static void UTF8ToAnsi (char *string, int len)
+ {
diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 16ff08cc6c..56ba7d839c 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,2 @@
 # locally computed hash
 sha256  1939627d5358d1da62bc6158d63f7ed12905552f3a799c799ee90296a7612944  wavpack-5.1.0.tar.bz2
-sha256  3890ab081dc6f8ee02161ace180381327031cc24cc6c3d71668367b7e5f6e4be  876fc3f3907e871d0938ac6c8c5252f5f31abd1f.patch
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index a613506234..daa0888dfb 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -12,9 +12,6 @@ WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3c
 WAVPACK_LICENSE_FILES = COPYING
 
-# Fetch patch from upstream to remove wchar dependency
-WAVPACK_PATCH = https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f.patch
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
