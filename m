From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Oct 2015 22:04:05 -0300
Subject: [Buildroot] [PATCH] vorbis-tools: add fix for CVE-2015-6749
Message-ID: <1445994245-17963-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-6749 - invalid AIFF file causes alloca() buffer overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...oggenc-Fix-large-alloca-on-bad-AIFF-input.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch

diff --git a/package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch b/package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
new file mode 100644
index 0000000..6df6786
--- /dev/null
+++ b/package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
@@ -0,0 +1,37 @@
+Fix CVE-2015-6749 - invalid AIFF file causes alloca() buffer overflow.
+See https://trac.xiph.org/ticket/2212
+Status: upstream
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/oggenc/audio.c b/oggenc/audio.c
+index 477da8c..4921fb9 100644
+--- a/oggenc/audio.c
++++ b/oggenc/audio.c
+@@ -245,8 +245,8 @@ static int aiff_permute_matrix[6][6] =
+ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
+ {
+     int aifc; /* AIFC or AIFF? */
+-    unsigned int len;
+-    unsigned char *buffer;
++    unsigned int len, readlen;
++    unsigned char buffer[22];
+     unsigned char buf2[8];
+     aiff_fmt format;
+     aifffile *aiff = malloc(sizeof(aifffile));
+@@ -269,9 +269,9 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
+         return 0; /* Weird common chunk */
+     }
+ 
+-    buffer = alloca(len);
+-
+-    if(fread(buffer,1,len,in) < len)
++    readlen = len < sizeof(buffer) ? len : sizeof(buffer);
++    if(fread(buffer,1,readlen,in) < readlen ||
++       (len > readlen && !seek_forward(in, len-readlen)))
+     {
+         fprintf(stderr, _("Warning: Unexpected EOF in reading AIFF header\n"));
+         return 0;
+-- 
+2.5.0
+
-- 
2.4.10
