From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 20:58:45 +0100
Subject: [Buildroot] [git commit] vorbis-tools: add fix for CVE-2015-6749
Message-ID: <20151102195848.B1ED78175E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=157cc80ba607c31fc5fa671b1db6015a66dafef8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-6749 - invalid AIFF file causes alloca() buffer overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...oggenc-Fix-large-alloca-on-bad-AIFF-input.patch |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

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
