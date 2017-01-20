From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 13:22:14 +1100
Subject: [Buildroot] [git commit] libsndfile: disable external library
	dependencies
Message-ID: <20170120022221.3FB4C819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64906bd887285e583acc8495df6aa07737e8e9d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes static linking of pifmrds [1]:

host/usr/bin/arm-linux-gcc -static -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lsndfile -lm
.../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsndfile.a(flac.o): In function `sf_flac_error_callback':
 flac.c:(.text+0x44c): undefined reference to `FLAC__StreamDecoderErrorStatusString'

host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsndfile.a(ogg.o): In function `ogg_close':
 ogg.c:(.text+0x10): undefined reference to `ogg_sync_clear'

host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsndfile.a(ogg_vorbis.o): In function `vorbis_read_sample':
ogg_vorbis.c:(.text+0x26c): undefined reference to `vorbis_synthesis_pcmout'

[1] http://autobuild.buildroot.net/results/9b7/9b7638caa8f3e82e38fb68b0321cb649618a0131

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsndfile/libsndfile.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index aaef657..c5cd1de 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -10,4 +10,9 @@ LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPLv2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 
+LIBSNDFILE_CONF_OPTS = \
+	--disable-sqlite \
+	--disable-alsa \
+	--disable-external-libs
+
 $(eval $(autotools-package))
