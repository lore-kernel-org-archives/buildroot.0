From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 24 Sep 2014 12:20:58 +0530
Subject: [Buildroot] [PATCH] gnuplot: link with pthread to avoid build
	failure
Message-ID: <1411541458-2567-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link this package with pthread option.

Fixes:
http://autobuild.buildroot.net/results/65e/65ec96dab6762d1ffc005de2b4f7f6b3b37245b3//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/gnuplot/gnuplot.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index d5fe01c..6d73014 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -40,6 +40,12 @@ else
 GNUPLOT_CONF_OPT += --without-readline
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+GNUPLOT_CONF_ENV += LIBS='-pthread'
+else
+GNUPLOT_CONF_OPT += --disable-thread-safety
+endif
+
 # Remove Javascript scripts, lua scripts, PostScript files
 define GNUPLOT_REMOVE_UNNEEDED_FILES
 	$(RM) -rf $(TARGET_DIR)/usr/share/gnuplot
-- 
1.7.9.5
