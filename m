From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Tue,  5 Feb 2019 19:19:42 +0100
Subject: [Buildroot] [PATCH v3 0/4] *** Add Intel QuickSync support to
 ffmpeg ***
Message-ID: <20190205181946.14496-1-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition of the existing VAAPI for hardware encoding, Intel provides
the libmfx API embeded in its Intel MediaSDK. Intel MediaSDK improves
encoding quality, is faster, and makes use of all encoding capabilities
on Intel platforms.

MFX test procedure (h264):

1. Retrieve sample data (https://github.com/Intel-Media-SDK/samples)
2. Run ./sample_multi_transcode -i::h264 test_stream.264 -o::h264 out.264.
3. Test should pass.

FFMpeg QuickSync test procedure (h264):

1. Download test video: https://peach.blender.org/trailer-page/
2. Run ffmpeg -y -hwaccel qsv -qsv_device /dev/dri/renderD128 -c:v 
h264_qsv -i /trailer_1080p.mov -c:v h264_qsv -framerate 60 -acodec 
copy out.mp4

Louis-Paul Cordier (4):
  package/intel-mediadriver: new package
  package/intel-mediasdk: new package
  package/ffmpeg: bump to version 4.1
  package/ffmpeg: enable Intel QuickSync support.

 Config.in.legacy                              |   6 ++
 DEVELOPERS                                    |   2 +
 package/Config.in                             |   2 +
 package/ffmpeg/0001-ffmpeg-pthreads.patch     |  34 ------
 ...cenc-Fix-building-with-libfdk-aac-v2.patch | 100 ------------------
 ...stently-use-a-proper-version-check-m.patch |  99 -----------------
 ...dk-aac-Don-t-use-defined-in-a-define.patch |  72 -------------
 package/ffmpeg/Config.in                      |   6 --
 package/ffmpeg/ffmpeg.hash                    |   2 +-
 package/ffmpeg/ffmpeg.mk                      |  15 +--
 package/intel-mediadriver/Config.in           |  21 ++++
 .../intel-mediadriver/intel-mediadriver.hash  |   3 +
 .../intel-mediadriver/intel-mediadriver.mk    |  30 ++++++
 package/intel-mediasdk/Config.in              |  15 +++
 package/intel-mediasdk/intel-mediasdk.hash    |   3 +
 package/intel-mediasdk/intel-mediasdk.mk      |  17 +++
 16 files changed, 108 insertions(+), 319 deletions(-)
 delete mode 100644 package/ffmpeg/0001-ffmpeg-pthreads.patch
 delete mode 100644 package/ffmpeg/0002-libfdk-aacenc-Fix-building-with-libfdk-aac-v2.patch
 delete mode 100644 package/ffmpeg/0003-libfdk-aac-Consistently-use-a-proper-version-check-m.patch
 delete mode 100644 package/ffmpeg/0004-libfdk-aac-Don-t-use-defined-in-a-define.patch
 create mode 100644 package/intel-mediadriver/Config.in
 create mode 100644 package/intel-mediadriver/intel-mediadriver.hash
 create mode 100644 package/intel-mediadriver/intel-mediadriver.mk
 create mode 100644 package/intel-mediasdk/Config.in
 create mode 100644 package/intel-mediasdk/intel-mediasdk.hash
 create mode 100644 package/intel-mediasdk/intel-mediasdk.mk

-- 
2.20.1
