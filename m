From: Ryan Mallon <rmallon@gmail.com>
Date: Mon, 17 Sep 2012 16:48:14 +1000
Subject: [Buildroot] [PATCH] libsndfile: Add -D_FILE_OFFSET_BITS=64 to
	configuration
Message-ID: <5056C7AE.9000401@gmail.com>
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
   
Add -D_FILE_OFFSET_BITS=64 to the configuration for libsndfile to
ensure that off_t is the correct size.
    
Signed-off-by: Ryan Mallon <rmallon@gmail.com>
---

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.m
index e5fbb5e..5e39aca 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -7,5 +7,7 @@
 LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
+LIBSNDFILE_CFLAGS = $(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64
+LIBSNDFILE_CONF_ENV += CFLAGS="$(LIBSNDFILE_CFLAGS)"
 
 $(eval $(autotools-package))
