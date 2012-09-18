From: Ryan Mallon <rmallon@gmail.com>
Date: Tue, 18 Sep 2012 15:09:19 +1000
Subject: [Buildroot] [PATCH] libsndfile: Add dependency on BR2_LARGEFILE
Message-ID: <505801FF.20207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a
typedef alias for off_t. This is not true by default for all
tool-chains, which leads to a runtime assert failure in binaries
compiled against libsndfile. See:
    
  http://permalink.gmane.org/gmane.comp.audio.libsndfile.devel/229
    
Add a dependency on BR2_LARGEFILE for libsndfile, and a comment if
BR2_LARGEFILE is not selected.
    
Signed-off-by: Ryan Mallon <rmallon@gmail.com>
---

diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 9afe496..21e1591 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBSNDFILE
        bool "libsndfile"
+       depends on BR2_LARGEFILE
        help
          Libsndfile is a C library for reading and writing files containing
          sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
          through one standard library interface.
 
          http://www.mega-nerd.com/libsndfile/
+
+comment "libsndfile requires a toolchain with LARGEFILE support"
+       depends on !BR2_LARGEFILE
