From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 20:18:21 +0200
Subject: [Buildroot] [PATCH 2/2] libv4l: decode-tm6000 requires libv4l2util
In-Reply-To: <1350238701-30441-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1350238701-30441-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1350238701-30441-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The decode-tm6000 utility cannot build without the libv4l2util. If
this library is not available, the build breaks with:

decode_tm6000.o: In function `read_stream':
decode_tm6000.c:(.text+0x220): undefined reference to `v4l2_rcvbuf'
decode_tm6000.o: In function `main':
decode_tm6000.c:(.text+0x37c): undefined reference to `v4l2_open'
decode_tm6000.c:(.text+0x3cc): undefined reference to `v4l2_gettryset_fmt_cap'
decode_tm6000.c:(.text+0x424): undefined reference to `v4l2_getset_freq'
decode_tm6000.c:(.text+0x47c): undefined reference to `v4l2_mmap_bufs'
decode_tm6000.c:(.text+0x4a0): undefined reference to `v4l2_start_streaming'

See

 http://autobuild.buildroot.org/results/207ed74d5e816309ef0dc82ecc8112b51788fdf6/build-end.log

We fix this by adding util/libv4l2util to the list of directories to
build when decode-tm6000 is enabled. The only other user of
libv4l2util is another utility called qv4l2, for which Buildroot has
no Config.in option, so we only handle the case of decode-tm6000 at
the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 15e48ed..0639505 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -11,7 +11,7 @@ LIBV4L_MAKE_OPTS = PREFIX=/usr
 LIBV4L_DEPENDENCIES = jpeg
 
 LIBV4L_DIRS_y += lib
-LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/decode_tm6000
+LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/libv4l2util utils/decode_tm6000
 LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_IR_KEYTABLE)	+= utils/keytable
 LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE) += utils/v4l2-compliance
 LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_CTL)	+= utils/v4l2-ctl
-- 
1.7.9.5
