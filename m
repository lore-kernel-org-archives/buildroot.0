From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 12 Feb 2008 16:56:10 -0200
Subject: [Buildroot] [PATCH] John Voltz changes part 2 (blackbox,
	cairo and cups)
In-Reply-To: <20080212182250.GA15951@aon.at>
References: <d6cda7730802120946x4fb51bebn979dd8991c778e68@mail.gmail.com>
	<d6cda7730802120947s73dce9a4ub19c84b6f2022518@mail.gmail.com>
	<20080212182250.GA15951@aon.at>
Message-ID: <d6cda7730802121056u180f6d42m5aa2aa0915e0005@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmmm ok. I agree to some of your comments :)
I wasn't really looking at that, was more interested in sorting out
the 527k lines of diff, making sure it applies and causes no revert on
recent commits *smile*

Then, drop that package and I will check out again on a second pass
That's the beauty in spliting it up.



On Feb 12, 2008 4:22 PM, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>
> On Tue, Feb 12, 2008 at 03:47:55PM -0200, Thiago A. Corr?a wrote:
> >This is more of his changes:
> >
> >adds blackbox to the window managers list
> >
> >Please don't forget to do svn add svn add package/blackbox/
> >
> >-----
> >
> >cairo fixes and version bump
> >
> >Please don't forget to do svn add package/cairo/cairo-1.4.14-libdir-la.patch
> >
> >-----
> >
> >add cups
> >
> >Please don't forget to do svn add package/cups
>
> >Index: package/Config.in
> >===================================================================
> >--- package/Config.in  (revision 20993)
> >+++ package/Config.in  (working copy)
> >@@ -380,6 +380,7 @@
> > comment "X Window managers"
> > source "package/matchbox/Config.in"
> > source "package/metacity/Config.in"
> >+source "package/blackbox/Config.in"
> > comment "X applications"
> > source "package/dillo/Config.in"
> > source "package/rdesktop/Config.in"
> >Index: package/blackbox/blackbox-0.70.1-configure.patch
> >===================================================================
> >--- package/blackbox/blackbox-0.70.1-configure.patch   (revision 0)
> >+++ package/blackbox/blackbox-0.70.1-configure.patch   (revision 0)
> >@@ -0,0 +1,15 @@
> >+--- a/configure       2005-11-03 03:27:16.000000000 -0500
> >++++ b/configure       2008-02-02 23:25:25.000000000 -0500
> >+@@ -1980,12 +1980,6 @@ am__tar='${AMTAR} chof - "$$tardir"'; am
> >+
> >+ test "x$prefix" = "xNONE" && prefix="$ac_default_prefix"
> >+
> >+-CPPFLAGS="$CPPFLAGS -I$prefix/include"
> >+-LDFLAGS="$LDFLAGS -L$prefix/lib"
> >+-if test "x$prefix" != "x/usr/local"; then
> >+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
> >+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
> >+-fi
> >+
> >+ ac_ext=c
> >+ ac_cpp='$CPP $CPPFLAGS'
>
> I'll just comment on this single package, vicarious for the rest. Of
> course these are only my personal POV.
>
> >Index: package/blackbox/Config.in
> >===================================================================
> >--- package/blackbox/Config.in (revision 0)
> >+++ package/blackbox/Config.in (revision 0)
> >@@ -0,0 +1,11 @@
> >+config BR2_PACKAGE_BLACKBOX
> >+      bool "blackbox"
> >+      default n
> >+      depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
> >+      help
> >+        Blackbox is a fast, lightweight window manager for the X Window System.
> >+
> >+        http://blackboxwm.sourceforge.net/
> >+
> >+comment "blackbox             - disabled (requires Xorg(7))"
> >+      depends !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
>
> Why would this not work with non-Xorg based X11-servers? That's wrong.
> Putting such stuff into comments is just ugly, imo.
> Of course you do not need a CXX cross-compiler to build it, or do you
> and the deps are just wrong once more?
>
> >Index: package/blackbox/blackbox.mk
> >===================================================================
> >--- package/blackbox/blackbox.mk       (revision 0)
> >+++ package/blackbox/blackbox.mk       (revision 0)
> >@@ -0,0 +1,62 @@
> >+#############################################################
> >+#
> >+# blackbox
> >+#
> >+#############################################################
> >+
> >+BLACKBOX_VERSION=0.70.1
> >+BLACKBOX_SOURCE=blackbox-$(BLACKBOX_VERSION).tar.bz2
> >+BLACKBOX_SITE=http://superb-west.dl.sourceforge.net/sourceforge/blackboxwm/
> >+BLACKBOX_DIR=$(BUILD_DIR)/blackbox-$(BLACKBOX_VERSION)
> >+BLACKBOX_CAT:=$(BZCAT)
> >+
> >+$(DL_DIR)/$(BLACKBOX_SOURCE):
> >+      $(WGET) -P $(DL_DIR) $(BLACKBOX_SITE)/$(BLACKBOX_SOURCE)
> >+
> >+$(BLACKBOX_DIR)/.unpacked: $(DL_DIR)/$(BLACKBOX_SOURCE)
> >+      $(BLACKBOX_CAT) $(DL_DIR)/$(BLACKBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> >+      toolchain/patch-kernel.sh $(BLACKBOX_DIR) package/blackbox/ \*.patch
> >+      $(CONFIG_UPDATE) $(BLACKBOX_DIR)
> >+      touch $(BLACKBOX_DIR)/.unpacked
>
> brittle, bloated and big. touch $@ would have been a sensible thing to
> do.
>
> >+
> >+$(BLACKBOX_DIR)/.configured: $(BLACKBOX_DIR)/.unpacked
> >+      (cd $(BLACKBOX_DIR); rm -rf config.cache; \
> >+              $(TARGET_CONFIGURE_OPTS) \
> >+              $(TARGET_CONFIGURE_ARGS) \
> >+              ./configure \
> >+              --target=$(GNU_TARGET_NAME) \
> >+              --host=$(GNU_TARGET_NAME) \
> >+              --build=$(GNU_HOST_NAME) \
> >+              --prefix=/usr \
> >+              --sysconfdir=/etc \
> >+              --x-includes=$(STAGING_DIR)/usr/include/X11 \
> >+              --x-libraries=$(STAGING_DIR)/usr/lib \
> >+      )
> >+      touch $(BLACKBOX_DIR)/.configured
> >+
> >+$(BLACKBOX_DIR)/src/blackbox: $(BLACKBOX_DIR)/.configured
> >+      $(MAKE) CC=$(TARGET_CC) -C $(BLACKBOX_DIR)
>
> wrong.
>
> >+
> >+$(BLACKBOX_DIR)/.installed: $(BLACKBOX_DIR)/src/blackbox
> >+      $(MAKE) -C $(BLACKBOX_DIR) DESTDIR=$(TARGET_DIR) install
> >+      touch $(BLACKBOX_DIR)/.installed
>
> ugly. $@. and additionally wrong since it doesn't strip
>
> >+
> >+blackbox: uclibc $(XSERVER) $(BLACKBOX_DIR)/.installed
> >+
> >+blackbox-source: $(DL_DIR)/$(BLACKBOX_SOURCE)
> >+
> >+blackbox-clean:
> >+      @if [ -d $(BLACKBOX_DIR)/Makefile ]; then \
> >+              $(MAKE) -C $(BLACKBOX_DIR) clean; \
> >+      fi
>
> Lines like those 3 above are just sad.
>
> >+
> >+blackbox-dirclean:
> >+      rm -rf $(BLACKBOX_DIR)
> >+#############################################################
> >+#
> >+# Toplevel Makefile options
> >+#
> >+#############################################################
> >+ifeq ($(strip $(BR2_PACKAGE_BLACKBOX)),y)
>
> bloated, superfluous and ugly.
> And yes, i'm grumpy and annoyed by now.
> [snip]
>
