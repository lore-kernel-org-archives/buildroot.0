From: Biucchi Gabriele <biucchi@tiscali.de>
Date: Mon Jul 24 04:25:11 2006
Subject: [Buildroot] problems and solutions for tinyx
Message-ID: <44C4AD92.7000205@tiscali.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want only to point out some problems I had with tinyx and the 
solutions that work with me: I hope, this can help somebody.

1) change in tinyx-config.patch

tinyx-config.patch starts with:

--- xc/config/cf/host.def~ 2005-04-02 14:51:31.000000000 -0700
+++ xc/config/cf/host.def 2005-04-26 01:22:00.000000000 -0600

but I think it should be:

--- xc-011010/config/cf/host.def~ 2005-04-02 14:51:31.000000000 -0700
+++ xc-011010/config/cf/host.def 2005-04-26 01:22:00.000000000 -0600

2) change in tinyx.mk

Some programs (like rxvt) need x-includes and x-libraries in 
$(STAGING_DIR)/usr/X11R6/ , but tinyx.mk does not install anything there.

A naif solution consists to copy everything from $(TINYX_DIR)/exports/ 
into $(STAGING_DIR)/usr/X11R6/, substituting the line

tinyx: zlib $(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev

with the following lines (please note the "-L" option used with cp):

$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_LIBX)/libX11.so.6.2
    mkdir -p $(STAGING_DIR)/usr/X11R6/lib
    mkdir -p $(STAGING_DIR)/usr/X11R6/include
    cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
    cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/

tinyx: zlib $(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev 
$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2

3) another change in tinyx.mk

The $PATH variable includes "/usr/bin/X11", but there is nothing there. 
A solution is to create a symbolic link between "/usr/bin/X11" and 
"/usr/X11R6/bin", putting in the tinyx.mk the line

ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11


Best regards,
Gabriele


	

	
		
___________________________________________________________ 
Der fr?he Vogel f?ngt den Wurm. Hier gelangen Sie zum neuen Yahoo! Mail: http://mail.yahoo.de
