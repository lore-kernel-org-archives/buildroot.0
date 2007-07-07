From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 23:07:46 +0200
Subject: [Buildroot] <package>_VER vs <package>_VERSION
In-Reply-To: <1183836807.19912.12.camel@elrond.sweden.atmel.com>
References: <004201c7c0a2$9420c900$dcc4af0a@atmel.com>
	<468FB5F5.1070205@realitydiluted.com>
	<1183836807.19912.12.camel@elrond.sweden.atmel.com>
Message-ID: <20070707210746.GY4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 09:33:26PM +0200, Ulf Samuelsson wrote:
>l?r 2007-07-07 klockan 10:49 -0500 skrev Steven J. Hill:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>> 
>> Ulf Samuelsson wrote:
>> > Some packages use <package>_VER  and some use  <package>_VERSION
>> > and some does not use this at all and hardcodes the version.
>> > 
>> > Suggest we clean this up so we use a single template.
>> > 
>> > Suggest we do it using the following template, allowing user to override.
>> > 
>> > ifeq    ($(<package>_VERSION),)
>> > <package>_VERSION:=X.Y.Z
>> > endif
>> > 
>> That's an interesting idea. I agree on the _VER and _VERSION clean-up. How
>> about you submit a patch for that first? Thanks.
>> 
>> - -Steve
>
>Some packages do not have a version:
>customize

I'd remove that one, but i guess you're opposed to that ;)

>gnuconfig

That's just CVS (nothing interresting was changed there, i looked about
three weeks ago).

>hostap		Always use a snapshot
>microcom	This is not clean, version = 1.02, 
>		package is m102.tar.gz

"clean", well, live with it until an upstream maintainer fixes this
cosmetic issue.

>jpeg	   	6b vs v6b

about the same as microcom

>mtd		Configurable from menuconfig or snapshot
>sfdisk		No version, this is located on www.uclibc.org so we 
>		should change to sfdisk-1.00.tar.bz2

1.00 is inappropriate. Either use the official version from util-linux
or implement a _small_ sfdisk in busybox (but we already have fdisk,
IIRC) or leave it alone, IMHO.

>tinylogin	Makefile force use of snapshot,
>		Configure using menuconfig?

standalone tinylogin is deprecated and unmaintained from my POV (use
busybox which is actively maintained).

>ttcp		No version

"No version" depends on you view. It clearly reads
"ttcp.c $Revision: 1.12 $";

>Index: package/qte/qte.mk
>===================================================================
>--- package/qte/qte.mk	(revision 19021)
>+++ package/qte/qte.mk	(arbetskopia)
>@@ -222,18 +222,18 @@
> 
> $(QTE_QTE_LIB): $(QTE_QTE_DIR)/src-mt.mk
> 	export QTDIR=$(QTE_QTE_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
>PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_CC) -C $(QTE_QTE_DIR) src-mt
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_CC) DESTDIR=
>$(TARGET_DIR)/lib -C $(QTE_QTE_DIR) src-mt
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CC) -C $(QTE_QTE_DIR) src-mt
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CC) DESTDIR=

superfluous TARGET_CC

>$(TARGET_DIR)/lib -C $(QTE_QTE_DIR) src-mt
> 	# ... and make sure it actually built... grrr... make deep-deep-deep
>makefile recursion for this habit
> 	test -f $@
> 
> $(QTE_QTOPIA_FILE): $(QTE_QTOPIA_DIR)/.configured
> 	export QTDIR=$(QTE_QT3_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
>PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QTE_QTOPIA_DIR)
> 
> $(QTE_QTOPIA_IFILE): $(QTE_QTOPIA_FILE)
> 	export QTDIR=$(QTE_QT3_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
>PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
>install PREFIX=$(TARGET_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QTE_QTOPIA_DIR) install PREFIX=
>$(TARGET_DIR)
> 
> 
> qte:: $(QTE_QTE_LIB)
>Index: package/tinyx/tinyx.mk
>===================================================================
>--- package/tinyx/tinyx.mk	(revision 19021)
>+++ package/tinyx/tinyx.mk	(arbetskopia)
>@@ -85,7 +85,7 @@
> 	rm -f $(TINYX_BINX)/Xfbdev
> 	#make World CROSSCOMPILEFLAGS="CROSSCOMPILEDIR=<cross compiler dir>";
> 	#( cd $(TINYX_DIR) ; $(MAKE) World CROSSCOMPILEFLAGS="CROSSCOMPILEDIR=
>$(STAGING_DIR)/bin" )
>-	#( cd $(TINYX_DIR) ; $(TARGET_CONFIGURE_OPTS) $(MAKE) World )
>+	#( cd $(TINYX_DIR) ; $(MAKE) $(TARGET_CONFIGURE_OPTS) World )

well, yea, but i don't expect that you got a real error from this hunk
;)

> 	#
> 	#mv $(TINYX_DIR)/Makefile $(TINYX_DIR)/Makefile.xxxx
> 	#echo "AS=$(TARGET_CROSS)as" > $(TINYX_DIR)/Makefile
>Index: package/samba/samba.mk
>===================================================================
>--- package/samba/samba.mk	(revision 19021)
>+++ package/samba/samba.mk	(arbetskopia)
>@@ -46,7 +46,7 @@
> 	touch $(SAMBA_DIR)/.configured
> 
> $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(SAMBA_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SAMBA_DIR)
> 
> SAMBA_TARGETS_ :=
> SAMBA_TARGETS_y :=
>@@ -79,7 +79,7 @@
> SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_WBINFO)	+= usr/bin/wbinfo
> 
> $(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC)	\
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) 	\
> 		prefix="${TARGET_DIR}/usr" \
> 		BASEDIR="${TARGET_DIR}/usr" \
> 		SBINDIR="${TARGET_DIR}/usr/sbin" \

samba is an excellent example where (it uses autoconf) i expect all
these duplication to be superfluous; configure should have set up this
stuff properly, didn't it? (didn't look)

>--- package/libevent/libevent.mk	(revision 19021)
>+++ package/libevent/libevent.mk	(arbetskopia)
>@@ -37,7 +37,7 @@
> 	touch $@
> 
> $(LIBEVENT_DIR)/$(LIBEVENT_BINARY): $(LIBEVENT_DIR)/.configured
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBEVENT_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBEVENT_DIR)
> 
> $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY):
>$(LIBEVENT_DIR)/$(LIBEVENT_BINARY)
> 	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(STAGING_DIR) install

I don't use this package but installing to STAGING_DIR sounds
suspicious, fwiw

>Index: package/libusb/libusb.mk
>===================================================================
>--- package/libusb/libusb.mk	(revision 19021)
>+++ package/libusb/libusb.mk	(arbetskopia)
>@@ -36,7 +36,7 @@
> 	touch $(LIBUSB_DIR)/.configured
> 
> $(STAGING_DIR)/$(LIBUSB_BINARY): $(LIBUSB_DIR)/.configured
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBUSB_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBUSB_DIR)
> 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install

also suspicious DESTDIR
