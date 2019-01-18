From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 18 Jan 2019 21:10:39 +0100
Subject: [Buildroot] [PATCH 0/6] *** Add Intel QuickSync support to ffmpeg
 ***
Message-ID: <20190118201045.13947-1-lpdev@cordier.org>
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

Louis-Paul Cordier (6):
  intel-gmmlib: new package.
  intel-mediadriver: new package.
  intel-mediasdk: new package.
  ffmpeg: bump to version 4.1. ffserver is not supported anymore.
  ffmpeg: enable Intel QuickSync support.
  Update DEVELOPERS.

 DEVELOPERS                                    |  5 ++
 package/Config.in                             |  3 ++
 package/ffmpeg/0001-ffmpeg-pthreads.patch     | 34 -------------
 package/ffmpeg/Config.in                      |  6 ---
 package/ffmpeg/ffmpeg.hash                    |  2 +-
 package/ffmpeg/ffmpeg.mk                      | 15 +++---
 package/intel-gmmlib/Config.in                |  8 ++++
 package/intel-gmmlib/intel-gmmlib.hash        |  2 +
 package/intel-gmmlib/intel-gmmlib.mk          | 21 ++++++++
 package/intel-mediadriver/Config.in           | 15 ++++++
 .../intel-mediadriver/intel-mediadriver.hash  |  2 +
 .../intel-mediadriver/intel-mediadriver.mk    | 34 +++++++++++++
 package/intel-mediasdk/Config.in              | 15 ++++++
 package/intel-mediasdk/intel-mediasdk.hash    |  2 +
 package/intel-mediasdk/intel-mediasdk.mk      | 48 +++++++++++++++++++
 package/intel-mediasdk/intel-mediasdk.sh      |  4 ++
 package/intel-mediasdk/libmfx.pc              |  9 ++++
 17 files changed, 177 insertions(+), 48 deletions(-)
 delete mode 100644 package/ffmpeg/0001-ffmpeg-pthreads.patch
 create mode 100644 package/intel-gmmlib/Config.in
 create mode 100644 package/intel-gmmlib/intel-gmmlib.hash
 create mode 100644 package/intel-gmmlib/intel-gmmlib.mk
 create mode 100644 package/intel-mediadriver/Config.in
 create mode 100644 package/intel-mediadriver/intel-mediadriver.hash
 create mode 100644 package/intel-mediadriver/intel-mediadriver.mk
 create mode 100644 package/intel-mediasdk/Config.in
 create mode 100644 package/intel-mediasdk/intel-mediasdk.hash
 create mode 100644 package/intel-mediasdk/intel-mediasdk.mk
 create mode 100755 package/intel-mediasdk/intel-mediasdk.sh
 create mode 100644 package/intel-mediasdk/libmfx.pc

-- 
2.20.1
