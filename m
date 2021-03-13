From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:33:27 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libglib2:
 backport upstream security fix for CVE-2021-27218
Message-ID: <20210313143049.823A78153E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2a5f72cb958ab75af38e2bc36e6d0e06e54b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

CVE-2021-27218: An issue was discovered in GNOME GLib before 2.66.7 and
2.67.x before 2.67.4.  If g_byte_array_new_take() was called
with a buffer of 4GB or more on a 64-bit platform, the length would be
truncated modulo 2**32, causing unintended length truncation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...array-Do-not-accept-too-large-byte-arrays.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/libglib2/0005-gbytearray-Do-not-accept-too-large-byte-arrays.patch b/package/libglib2/0005-gbytearray-Do-not-accept-too-large-byte-arrays.patch
new file mode 100644
index 0000000000..e5ec22369c
--- /dev/null
+++ b/package/libglib2/0005-gbytearray-Do-not-accept-too-large-byte-arrays.patch
@@ -0,0 +1,63 @@
+From acb7b0ec69f26a7df10af3992359890b09f076e8 Mon Sep 17 00:00:00 2001
+From: Krzesimir Nowak <qdlacz@gmail.com>
+Date: Wed, 10 Feb 2021 23:51:07 +0100
+Subject: [PATCH] gbytearray: Do not accept too large byte arrays
+
+GByteArray uses guint for storing the length of the byte array, but it
+also has a constructor (g_byte_array_new_take) that takes length as a
+gsize. gsize may be larger than guint (64 bits for gsize vs 32 bits
+for guint). It is possible to call the function with a value greater
+than G_MAXUINT, which will result in silent length truncation. This
+may happen as a result of unreffing GBytes into GByteArray, so rather
+be loud about it.
+
+(Test case tweaked by Philip Withnall.)
+[Peter: Fixes CVE-2021-27218, drop test case]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ glib/garray.c      |  6 ++++++
+ glib/gbytes.c      |  4 ++++
+ 2 files changed, 10 insertions(+), 0 deletion(-)
+
+diff --git a/glib/garray.c b/glib/garray.c
+index de720210c..2b66f16a6 100644
+--- a/glib/garray.c
++++ b/glib/garray.c
+@@ -2261,6 +2261,10 @@ g_byte_array_steal (GByteArray *array,
+  * Create byte array containing the data. The data will be owned by the array
+  * and will be freed with g_free(), i.e. it could be allocated using g_strdup().
+  *
++ * Do not use it if @len is greater than %G_MAXUINT. #GByteArray
++ * stores the length of its data in #guint, which may be shorter than
++ * #gsize.
++ *
+  * Since: 2.32
+  *
+  * Returns: (transfer full): a new #GByteArray
+@@ -2272,6 +2276,8 @@ g_byte_array_new_take (guint8 *data,
+   GByteArray *array;
+   GRealArray *real;
+ 
++  g_return_val_if_fail (len <= G_MAXUINT, NULL);
++
+   array = g_byte_array_new ();
+   real = (GRealArray *)array;
+   g_assert (real->data == NULL);
+diff --git a/glib/gbytes.c b/glib/gbytes.c
+index 00fd79155..aaadf451b 100644
+--- a/glib/gbytes.c
++++ b/glib/gbytes.c
+@@ -519,6 +519,10 @@ g_bytes_unref_to_data (GBytes *bytes,
+  * g_bytes_new(), g_bytes_new_take() or g_byte_array_free_to_bytes(). In all
+  * other cases the data is copied.
+  *
++ * Do not use it if @bytes contains more than %G_MAXUINT
++ * bytes. #GByteArray stores the length of its data in #guint, which
++ * may be shorter than #gsize, that @bytes is using.
++ *
+  * Returns: (transfer full): a new mutable #GByteArray containing the same byte data
+  *
+  * Since: 2.32
+-- 
+2.20.1
+
