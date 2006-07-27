From: Johannes Winkelmann <winkj@ife.ee.ethz.ch>
Date: Thu Jul 27 04:58:25 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
In-Reply-To: <20060726191137.1053948B0E@busybox.net>
References: <20060726191137.1053948B0E@busybox.net>
Message-ID: <44C89B64.6010401@ife.ee.ethz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This commit breaks compilation of tinyx due to using spaces for 
indentation; fix attached.

andersen@uclibc.org wrote:
> Author: andersen
> Date: 2006-07-26 12:11:36 -0700 (Wed, 26 Jul 2006)
> New Revision: 15747
[...]
> Changeset:
> Modified: trunk/buildroot/package/tinyx/tinyx.mk
> ===================================================================
> --- trunk/buildroot/package/tinyx/tinyx.mk	2006-07-26 17:25:08 UTC (rev 15746)
> +++ trunk/buildroot/package/tinyx/tinyx.mk	2006-07-26 19:11:36 UTC (rev 15747)
> @@ -100,8 +100,17 @@
>  	( cd $(TINYX_DIR) ; $(MAKE) World )
>  
>  #
> +# Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
> +# and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
> +$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_XFBDEV)
> +       mkdir -p $(STAGING_DIR)/usr/X11R6/lib
> +       mkdir -p $(STAGING_DIR)/usr/X11R6/include
> +       cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
> +       cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
> +       ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
    ^^^^^^^
Best regards, Johannes
-- 
Johannes Winkelmann
http://www.ife.ee.ethz.ch

-------------- next part --------------
Index: package/tinyx/tinyx.mk
===================================================================
--- package/tinyx/tinyx.mk	(revision 15749)
+++ package/tinyx/tinyx.mk	(working copy)
@@ -103,11 +103,11 @@
 # Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
 # and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
 $(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_XFBDEV)
-       mkdir -p $(STAGING_DIR)/usr/X11R6/lib
-       mkdir -p $(STAGING_DIR)/usr/X11R6/include
-       cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
-       cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
-       ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
+	mkdir -p $(STAGING_DIR)/usr/X11R6/lib
+	mkdir -p $(STAGING_DIR)/usr/X11R6/include
+	cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
+	cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
+	ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
 
 #
 # Once Frame Buffer is built, we install executables.
