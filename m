From: Ryan Mallon <rmallon@gmail.com>
Date: Tue, 18 Sep 2012 08:41:26 +1000
Subject: [Buildroot] [PATCH] libsndfile: select BR2_LARGEFILE
Message-ID: <5057A716.4070702@gmail.com>
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
   
Select BR2_LARGEFILE for libsndfile so that sizeof(off_t) == 8.
    
Signed-off-by: Ryan Mallon <rmallon@gmail.com>
---

diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 9afe496..4897ed1 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSNDFILE
        bool "libsndfile"
+       select BR2_LARGEFILE
        help
          Libsndfile is a C library for reading and writing files containing
          sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
