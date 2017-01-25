From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 11:26:01 -0500
Subject: [Buildroot] [PATCH 1/1] python-mutagen: new package
Message-ID: <20170125162601.24034-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mutagen is a Python module to handle audio metadata.
It supports ASF, FLAC, MP4, Monkey?s Audio, MP3, Musepack, Ogg Opus,
Ogg FLAC, Ogg Speex, Ogg Theora, Ogg Vorbis, True Audio, WavPack,
OptimFROG, and AIFF audio files. All versions of ID3v2 are supported,
and all standard ID3v2.4 frames are parsed.

It can read Xing headers to accurately calculate the bitrate and
length of MP3s. ID3 and APEv2 tags can be edited regardless of
audio format. It can also manipulate Ogg streams on an individual
packet/page level.

Mutagen works with Python 2.7, 3.3+ (CPython and PyPy) on Linux,
Windows and macOS, and has no dedependencies outside the
Python standard library.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
v3 - v4:
  - Fixed licensing information.
  
v2 - v3: 
  - Readded longer help explination.
  - Added check for python2 or python3 zlib.

v1 - v2:
  - Added BR2_PACKAGE_PYTHON_ZLIB as a requirement.  Without
   this dependency, programs using python-mutagen will
   fail to load with a import error complaining about not
   being able to find zlib in python.
   
   
 package/Config.in                          |  1 +
 package/python-mutagen/Config.in           | 18 ++++++++++++++++++
 package/python-mutagen/python-mutagen.hash |  3 +++
 package/python-mutagen/python-mutagen.mk   | 14 ++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/python-mutagen/Config.in
 create mode 100644 package/python-mutagen/python-mutagen.hash
 create mode 100644 package/python-mutagen/python-mutagen.mk

diff --git a/package/Config.in b/package/Config.in
index c7b6862..0023e7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
 	source "package/python-mwscrape2slob/Config.in"
diff --git a/package/python-mutagen/Config.in b/package/python-mutagen/Config.in
new file mode 100644
index 0000000..faaff39
--- /dev/null
+++ b/package/python-mutagen/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PYTHON_MUTAGEN
+	bool "python-mutagen"
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Mutagen is a Python module to handle audio metadata. 
+	  It supports ASF, FLAC, MP4, Monkey?s Audio, MP3, Musepack, Ogg Opus, 
+	  Ogg FLAC, Ogg Speex, Ogg Theora, Ogg Vorbis, True Audio, WavPack, 
+	  OptimFROG, and AIFF audio files. All versions of ID3v2 are supported, 
+	  and all standard ID3v2.4 frames are parsed. 
+	  
+	  It can read Xing headers to accurately calculate the bitrate and length 
+	  of MP3s. ID3 and APEv2 tags can be edited regardless of audio format. 
+	  It can also manipulate Ogg streams on an individual packet/page level.
+
+	  https://mutagen.readthedocs.io/en/latest/#
diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
new file mode 100644
index 0000000..8970a23
--- /dev/null
+++ b/package/python-mutagen/python-mutagen.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/mutagen, sha256 locally computed
+md5	2bd50519d64411626fa22d405afbf078  mutagen-1.36.tar.gz
+sha256	d7ee37e33b8c5893c3ebf66edac31241eb9d48e1dc7ec647bbfbc180565a4bcd  mutagen-1.36.tar.gz
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
new file mode 100644
index 0000000..fa7b34d
--- /dev/null
+++ b/package/python-mutagen/python-mutagen.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mutagen
+#
+################################################################################
+
+PYTHON_MUTAGEN_VERSION = 1.36
+PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
+PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/69/14/4a5c8360a727563291a7159de935ffff2b99ee783928169f0fea7445370f
+PYTHON_MUTAGEN_LICENSE = LGPLv2+
+PYTHON_MUTAGEN_LICENSE_FILES = COPYING
+PYTHON_MUTAGEN_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.9.3
