From: Jeremie Scheer <jeremie.scheer@armadeus.com>
Date: Mon, 28 Jan 2013 10:49:59 +0100
Subject: [Buildroot] Qwt: New package
Message-ID: <510649C7.1010402@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My replies are inside your mail.
The patch adding Qwt to Buildroot is a little bit old now and has not 
been updated since some time. So there may be some Buildroot features 
unused, like autotargets, or obsolete parts of the patch.

Regards,

-- 
J?r?mie Scheer 
Software Engineer 
Tel: +33 (0)9 72 29 41 44 
Fax: +33 (0)9 72 28 79 26 
Armadeus Systems - A new vision of the embedded world
http://www.armadeus.com 

On 12/16/2012 11:08 AM, Peter Korsgaard wrote:

>>>>>> "Samuel" == Samuel Martin<s.martin49@gmail.com>  writes:
> Hi,
>
> A few comments:
>
>   Samuel> @@ -141,6 +141,7 @@ comment "QT libraries and helper libraries"
>   Samuel>  source "package/grantlee/Config.in"
>   Samuel>  source "package/qextserialport/Config.in"
>   Samuel>  source "package/qtuio/Config.in"
>   Samuel> +source "package/qwt/Config.in"
>   Samuel>  endif
>   
>   Samuel>  source "package/x11r7/Config.in"
>   Samuel> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
>   Samuel> new file mode 100644
>   Samuel> index 0000000..15e3925
>   Samuel> --- /dev/null
>   Samuel> +++ b/package/qwt/Config.in
>   Samuel> @@ -0,0 +1,17 @@
>   Samuel> +comment "Qwt requires Qt to be installed"
>   Samuel> +	depends on !BR2_PACKAGE_QT
>   Samuel> +
>   Samuel> +config BR2_PACKAGE_QWT
>   Samuel> +	bool "Qwt"
>
> We normally use lower case for package name.
>
>   Samuel> +	depends on BR2_PACKAGE_QT
>
> The package is already within a BR2_PACKAGE_QT conditional, so you can
> drop this.
>
> Can this work with any QT configuration? I would guess you would need to
> select BR2_PACKAGE_QT_GUI_MODULE atleast.

Yes, Qt Gui is necessary for Qwt to compile.

>   Samuel> +	help
>   Samuel> +	  Qwt for Embedded Linux.
>
> Everything in buildroot is about embedded Linux. I would prefer if you
> instead explain what Qwt means - E.G.:
>
> Qt Widgets for Technical Applications
>
>
>   Samuel> +
>   Samuel> +	http://qwt.sourceforge.net/
>   Samuel> +
>   Samuel> +config BR2_PACKAGE_QWT_EXAMPLES
>   Samuel> +	bool "Examples"
>
> Lower case as well.
>
>   Samuel> +	depends on BR2_PACKAGE_QWT
>   Samuel> +	select BR2_PACKAGE_QT_SVG
>   Samuel> +	help
>   Samuel> +	  Compile & install the examples.
>   Samuel> diff --git a/package/qwt/qwt-5.2.1-change-install-directories.patch b/package/qwt/qwt-5.2.1-change-install-directories.patch
>   Samuel> new file mode 100644
>   Samuel> index 0000000..4c28065
>   Samuel> --- /dev/null
>   Samuel> +++ b/package/qwt/qwt-5.2.1-change-install-directories.patch
>   Samuel> @@ -0,0 +1,23 @@
>   Samuel> +Change install directories.
>
> Please provide a patch description explaining WHY this is done instead.

Qwt is installed by default under /usr/lib and /usr/include/qwt-x.x.x. 
So I made this patch to install it under Buildroot staging dir.

>   Samuel> +
>   Samuel> +Signed-off-by: Julien Boibessot<julien.boibessot@armadeus.com>
>   Samuel> +Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>   Samuel> +
>   Samuel> +--- qwt-5.2.1/src/src.pro.orig	2010-09-28 14:40:39.000000000 +0200
>   Samuel> ++++ qwt-5.2.1/src/src.pro	2010-09-28 14:41:29.000000000 +0200
>   Samuel> +@@ -218,9 +218,12 @@
>   Samuel> + }
>   Samuel> +
>   Samuel> + # Install directives
>   Samuel> +-
>   Samuel> +-headers.files  = $$HEADERS
>   Samuel> +-doc.files      = $${QWT_ROOT}/doc/html $${QWT_ROOT}/doc/qwt-5.2.0.qch
>   Samuel> ++
>   Samuel> ++target.path = /usr/lib
>   Samuel> ++headers.files  = $$HEADERS
>   Samuel> ++headers.path = /usr/include/qwt-5.2.1
>   Samuel> ++doc.files      = $${QWT_ROOT}/doc/html $${QWT_ROOT}/doc/qwt-5.2.0.qch
>   Samuel> ++doc.path = /usr/doc/qwt-5.2.1
>   Samuel> + unix {
>   Samuel> +     doc.files      += $${QWT_ROOT}/doc/man
>   Samuel> + }
>   Samuel> diff --git a/package/qwt/qwt-5.2.1-disable-designer.patch b/package/qwt/qwt-5.2.1-disable-designer.patch
>   Samuel> new file mode 100644
>   Samuel> index 0000000..5d1bbe5
>   Samuel> --- /dev/null
>   Samuel> +++ b/package/qwt/qwt-5.2.1-disable-designer.patch
>   Samuel> @@ -0,0 +1,17 @@
>   Samuel> +Disable QwtDesigner.
>
> Why?

Because QwtDesigner needs Qt Designer libraries, that was not included 
in Buildroot's Qt configuration.

>   Samuel> +
>   Samuel> +Signed-off-by: Julien Boibessot<julien.boibessot@armadeus.com>
>   Samuel> +Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>   Samuel> +
>   Samuel> +--- qwt-5.2.1/qwtconfig.pri.orig	2010-09-28 14:34:01.000000000 +0200
>   Samuel> ++++ qwt-5.2.1/qwtconfig.pri	2010-09-28 15:37:02.000000000 +0200
>   Samuel> +@@ -115,7 +115,7 @@
>   Samuel> + # Otherwise you have to build it from the designer directory.
>   Samuel> + ######################################################################
>   Samuel> +
>   Samuel> +-CONFIG     += QwtDesigner
>   Samuel> ++#CONFIG     += QwtDesigner
>   Samuel> +
>   Samuel> + ######################################################################
>   Samuel> + # If you want to auto build the examples, enable the line below
>   Samuel> +
>   Samuel> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
>   Samuel> new file mode 100644
>   Samuel> index 0000000..3d4e7f1
>   Samuel> --- /dev/null
>   Samuel> +++ b/package/qwt/qwt.mk
>   Samuel> @@ -0,0 +1,74 @@
>   Samuel> +######################################################################
>   Samuel> +#
>   Samuel> +# QWT
>   Samuel> +#
>   Samuel> +######################################################################
>   Samuel> +QWT_VERSION = 5.2.1
>   Samuel> +QWT_SOURCE = qwt-$(QWT_VERSION).zip
>
> Why not use the .tar.bz2 version instead? Upsteam is now up to 5.2.3
> (and 6.0) - Any reason to use the old 5.2.1?

It was the most recent version of Qwt when this patch was made. But it 
can be updated.
.tar.bz2 archive can be used instead of .zip.

>   Samuel> +QWT_SITE =http://sourceforge.net/projects/qwt/files/qwt/$(QWT_VERSION)
>
> Normally the sf.net URLs are of the downloads.sourceforge.net/.. form.

Yes, so QWT_SITE can be 'downloads.sourceforge.net/qwt/$(QWT_VERSION)'.

>   Samuel> +# Qwt License v1.0 is a LGPL v2.1 with exceptions
>   Samuel> +QWT_LICENSE = QWTv1.0
>   Samuel> +QWT_LICENSE_FILES = COPYING
>   Samuel> +
>   Samuel> +QWT_DEPENDENCIES = qt
>   Samuel> +
>   Samuel> +QWT_INSTALL_STAGING = YES
>   Samuel> +
>   Samuel> +define QWT_EXTRACT_CMDS
>   Samuel> +	$(RM) -rf $(QWT_DIR)
>   Samuel> +	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(QWT_SOURCE)
>   Samuel> +	test -d $(QWT_DIR) || \
>   Samuel> +		mv $(BUILD_DIR)/$(subst .zip,,$(QWT_SOURCE)) $(QWT_DIR)
>   Samuel> +endef
>
> With .tar.bz2 this could be dropped.

Yes, if we use AUTOTARGETS, this could be dropped.
Otherwise it must be replaced by:
$(BZCAT) $(DL_DIR)/$(QWT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

>   Samuel> +
>   Samuel> +ifeq ($(BR2_PACKAGE_QWT_EXAMPLES),y)
>   Samuel> +define QWT_CONFIGURE_EXAMPLES
>   Samuel> +	test ! -f $(@D)/examples/Makefile || $(MAKE) -C $(@D)/examples distclean
>
> Hmm, we normally don't do something like this.

It can be dropped. It was only done to clean Qwt examples build if this 
was already compiled.

>   Samuel> +	cd $(@D)/examples && $(QT_QMAKE)
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_BUILD_EXAMPLES
>   Samuel> +	$(MAKE) -C $(@D)/examples
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_INSTALL_STAGING_EXAMPLES
>   Samuel> +	$(INSTALL) -d $(STAGING_DIR)/usr/local/qwt-5.2.1/examples/bin
>
> Why /usr/local? Please use QWT_VERSION.

There was no real reason to put it under /usr/local. So it can be put 
under /usr instead.

> Does it ever make sense to install examples into staging?

Maybe it can be installed into 'host' directory.

>   Samuel> +	cp -f $(@D)/examples/bin/* \
>   Samuel> +		$(STAGING_DIR)/usr/local/qwt-5.2.1/examples/bin
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_INSTALL_TARGET_EXAMPLES
>   Samuel> +	$(INSTALL) -d $(TARGET_DIR)/usr/local/qwt-5.2.1/examples/bin
>   Samuel> +	cp -f $(STAGING_DIR)/usr/local/qwt-5.2.1/examples/bin/* \
>   Samuel> +		$(TARGET_DIR)/usr/local/qwt-5.2.1/examples/bin
>
> Same comments. Why nor just install them into TARGET_DIR/usr/bin?

It was done like this to separate Qwt demos from other binaries. But it 
can also be put under /usr/bin.

>   Samuel> +endef
>   Samuel> +endif
>   Samuel> +
>   Samuel> +
>   Samuel> +define QWT_CONFIGURE_CMDS
>   Samuel> +	test ! -f $(@D)/Makefile || $(MAKE) -C $(@D) distclean
>
> Same comment as for CONFIGURE_EXAMPLES.

So same answer 

> Nit: It would be more logical to list these steps in the logical order
> they are used - E.G. configure -> build -> install.
>
>   Samuel> +	cd $(@D) && $(QT_QMAKE)
>   Samuel> +	$(QWT_CONFIGURE_EXAMPLES)
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_BUILD_CMDS
>   Samuel> +	$(MAKE) -C $(@D)
>   Samuel> +	$(QWT_BUILD_EXAMPLES)
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_INSTALL_STAGING_CMDS
>   Samuel> +	$(MAKE) INSTALL_ROOT=$(STAGING_DIR) -C $(@D) install
>   Samuel> +	$(QWT_INSTALL_STAGING_EXAMPLES)
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_INSTALL_TARGET_CMDS
>   Samuel> +	cp -dpf $(STAGING_DIR)/usr/lib/libqwt.so* $(TARGET_DIR)/usr/lib/
>
> Why not just make install like for staging?

This is also a possibility, I simply chose to copy the files instead of 
reinstall it.

>   Samuel> +	$(QWT_INSTALL_TARGET_EXAMPLES)
>   Samuel> +endef
>   Samuel> +
>   Samuel> +define QWT_CLEAN_CMDS
>   Samuel> +	-$(MAKE) -C $(@D) clean
>   Samuel> +	-rm $(TARGET_DIR)/usr/lib/libqwt.so.*
>
> If we cannot clean completely (E.G. everything else installed into
> staging), then I prefer just not providing a clean target.
>
So we can delete this target, because staging dir for instance is not 
cleaned.




------------------------------------------------------------------------------
Master Visual Studio, SharePoint, SQL, ASP.NET, C# 2012, HTML5, CSS,
MVC, Windows 8 Apps, JavaScript and much more. Keep your skills current
with LearnDevNow - 3,200 step-by-step video tutorials by Microsoft
MVPs and experts. ON SALE this month only -- learn more at:
http://p.sf.net/sfu/learnmore_122712
_______________________________________________
Armadeus-forum mailing list
Armadeus-forum at lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/armadeus-forum

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130128/b43ab76f/attachment-0001.html>
