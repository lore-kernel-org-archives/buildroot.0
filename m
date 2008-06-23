From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Mon, 23 Jun 2008 05:13:20 -0700 (PDT)
Subject: [Buildroot] [buildroot 0003834]: cairo build broken when
 directfb support is required
In-Reply-To: <bb1ae9751e255807f2b801d4f8fa6ab3@busybox.net>
References: <bb1ae9751e255807f2b801d4f8fa6ab3@busybox.net>
Message-ID: <18067079.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I too found this:
A patch was posted:
DirectFB is needed before cairo builds to get directfb support:

Dan Laird

--- buildroot/package/cairo/cairo.mk
+++ buildroot.new/package/cairo/cairo.mk
@@ -43,9 +43,11 @@
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
  CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
+ CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
 
-CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png
fontconfig $(XSERVER)
+CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png
fontconfig $(CAIRO_DEPENDENCIES_EXTRA) $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,cairo))
 
+ 
And a bug was raised:
0003584: Cairo does not build directfb if directfb support required
(dependencies missing) 

It does not appear to have made the mainline SVN.  I hope this helps
Daniel Laird

-- 
View this message in context: http://www.nabble.com/-buildroot-0003834-%3A-cairo-build-broken-when-directfb-support-is-required-tp18040307p18067079.html
Sent from the BuildRoot mailing list archive at Nabble.com.
