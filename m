From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 08:48:57 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  udpcast
In-Reply-To: <20080328025442.9F6123C32C@busybox.net> (jspence@uclibc.org's
	message of "Thu\, 27 Mar 2008 19\:54\:42 -0700 \(PDT\)")
References: <20080328025442.9F6123C32C@busybox.net>
Message-ID: <87lk43mgpi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jspence" == jspence  <jspence@uclibc.org> writes:

 jspence> Author: jspence
 jspence> Date: 2008-03-27 19:54:42 -0700 (Thu, 27 Mar 2008)
 jspence> New Revision: 21526

 jspence> Log:
 jspence> Added udpcast package.

 jspence> Added:
 jspence>    trunk/buildroot/package/udpcast/
 jspence>    trunk/buildroot/package/udpcast/Config.in
 jspence>    trunk/buildroot/package/udpcast/udpcast.mk

 jspence> Modified:
 jspence>    trunk/buildroot/package/Config.in


 jspence> Changeset:
 jspence> Modified: trunk/buildroot/package/Config.in
 jspence> ===================================================================
 jspence> --- trunk/buildroot/package/Config.in	2008-03-28 02:50:42 UTC (rev 21525)
 jspence> +++ trunk/buildroot/package/Config.in	2008-03-28 02:54:42 UTC (rev 21526)
 jspence> @@ -205,6 +205,7 @@
 jspence>  # ATTENTION! This was merged into busybox!
 jspence>  #source "package/udhcp/Config.in"
 jspence>  #endif
 jspence> +source "package/udpcast/Config.in"
 jspence>  source "package/vpnc/Config.in"
 jspence>  source "package/vtun/Config.in"
 jspence>  if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

 jspence> Added: trunk/buildroot/package/udpcast/Config.in
 jspence> ===================================================================
 jspence> --- trunk/buildroot/package/udpcast/Config.in	                        (rev 0)
 jspence> +++ trunk/buildroot/package/udpcast/Config.in	2008-03-28 02:54:42 UTC (rev 21526)
 jspence> @@ -0,0 +1,27 @@
 jspence> +config BR2_PACKAGE_UDPCAST
 jspence> +        bool "udpcast"
 jspence> +        default n
 jspence> +        help
 jspence> +          A multicast protocol implementation which happens to
 jspence> +          be very handy for imaging drives over the network.
 jspence> +
 jspence> +          http://www.udpcast.linux.lu/
 jspence> +
 jspence> +menu "udpcast tools selection"
 jspence> +        depends on BR2_PACKAGE_UDPCAST
 jspence> +
 jspence> +config BR2_PACKAGE_UDPCAST_SENDER
 jspence> +        bool "sender"
 jspence> +        default n
 jspence> +        depends on BR2_PACKAGE_UDPCAST
 jspence> +        help
 jspence> +          The udpcast transmitter.
 jspence> +
 jspence> +config BR2_PACKAGE_UDPCAST_RECEIVER
 jspence> +        bool "receiver"
 jspence> +        default n
 jspence> +        depends on BR2_PACKAGE_UDPCAST
 jspence> +        help
 jspence> +          The udpcast receiver.
 jspence> +
 jspence> +endmenu

 jspence> Added: trunk/buildroot/package/udpcast/udpcast.mk
 jspence> ===================================================================
 jspence> --- trunk/buildroot/package/udpcast/udpcast.mk	                        (rev 0)
 jspence> +++ trunk/buildroot/package/udpcast/udpcast.mk	2008-03-28 02:54:42 UTC (rev 21526)
 jspence> @@ -0,0 +1,99 @@
 jspence> +#############################################################
 jspence> +#
 jspence> +# udpcast
 jspence> +#
 jspence> +#############################################################
 jspence> +UDPCAST_VERSION:=20071228
 jspence> +UDPCAST_SOURCE:=udpcast-$(UDPCAST_VERSION).tar.gz
 jspence> +UDPCAST_SITE:=http://www.udpcast.linux.lu/download
 jspence> +UDPCAST_CAT:=$(ZCAT)
 jspence> +UDPCAST_DIR:=$(BUILD_DIR)/udpcast-$(UDPCAST_VERSION)
 jspence> +
 jspence> +BR2_UDPCAST_CFLAGS:=
 jspence> +
 jspence> +$(DL_DIR)/$(UDPCAST_SOURCE):
 jspence> +	 $(WGET) -P $(DL_DIR) $(UDPCAST_SITE)/$(UDPCAST_SOURCE)
 jspence> +
 jspence> +udpcast-source: $(DL_DIR)/$(UDPCAST_SOURCE)
 jspence> +
 jspence> +$(UDPCAST_DIR)/.unpacked: $(DL_DIR)/$(UDPCAST_SOURCE)
 jspence> +	$(UDPCAST_CAT) $(DL_DIR)/$(UDPCAST_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 jspence> +	toolchain/patch-kernel.sh $(UDPCAST_DIR) package/udpcast udpcast\*.patch
 jspence> +	$(CONFIG_UPDATE) $(UDPCAST_DIR)
 jspence> +	touch $(UDPCAST_DIR)/.unpacked

Please use touch $@ instead.

 jspence> +
 jspence> +$(UDPCAST_DIR)/.configured: $(UDPCAST_DIR)/.unpacked
 jspence> +	(cd $(UDPCAST_DIR); rm -rf config.cache; \
 jspence> +		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
 jspence> +		$(TARGET_CONFIGURE_OPTS) \
 jspence> +		$(TARGET_CONFIGURE_ARGS) \
 jspence> +		CFLAGS="$(TARGET_CFLAGS) $(BR2_UDPCAST_CFLAGS)" \
 jspence> +		./configure \
 jspence> +		--target=$(REAL_GNU_TARGET_NAME) \
 jspence> +		--host=$(REAL_GNU_TARGET_NAME) \
 jspence> +		--build=$(GNU_HOST_NAME) \
 jspence> +		--prefix=/usr \
 jspence> +		--exec-prefix=/usr \
 jspence> +		--bindir=/usr/bin \
 jspence> +		--sbindir=/usr/sbin \
 jspence> +		--libdir=/lib \
 jspence> +		--libexecdir=/usr/lib \
 jspence> +		--sysconfdir=/etc \
 jspence> +		--datadir=/usr/share \
 jspence> +		--localstatedir=/var \
 jspence> +		--mandir=/usr/man \
 jspence> +		--infodir=/usr/info \

Are all of these needed? Normally only prefix (and maybe exec-prefix)
and sysconfdir needs to be set.

 jspence> +		$(DISABLE_NLS) \
 jspence> +	)
 jspence> +	touch $(UDPCAST_DIR)/.configured

touch $@ please.

 jspence> +
 jspence> +UDPCAST_BINARIES:=udp-sender udp-receiver
 jspence> +
 jspence> +UDPCAST_BUILD_TARGETS:=$(addprefix $(UDPCAST_DIR)/,$(UDPCAST_BINARIES))
 jspence> +
 jspence> +$(UDPCAST_BUILD_TARGETS): $(UDPCAST_DIR)/.configured
 jspence> +	$(MAKE) CC=$(TARGET_CC) -C $(UDPCAST_DIR)
 jspence> +
 jspence> +UDPCAST_PROGS:=$(addprefix $(TARGET_DIR)/usr/sbin/,$(UDPCAST_BINARIES))
 jspence> +
 jspence> +UDPCAST_INSTALL_MANPAGES=$(addprefix $(TARGET_DIR)/usr/man/, $(addsuffix .1,$(UDPCAST_BINARIES)))
 jspence> +
 jspence> +UDPCAST_INSTALL_FILES:=$(UDPCAST_PROGS) $(UDPCAST_INSTALL_MANPAGES)
 jspence> +
 jspence> +$(UDPCAST_PROGS): $(UDPCAST_BUILD_TARGETS)
 jspence> +	$(MAKE) -C $(UDPCAST_DIR) DESTDIR=$(TARGET_DIR) install
 jspence> +	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(REMOVE_SECTION_COMMENT) \
 jspence> +	  $(REMOVE_SECTION_NOTE) \
 jspence> +	  $(UDPCAST_PROGS)
 jspence> +ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
 jspence> +	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
 jspence> +	rm -f $(TARGET_DIR)/usr/sbin/udp-sender.1

man pages under /usr/sbin?

 jspence> +endif
 jspence> +ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
 jspence> +	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
 jspence> +	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
 jspence> +endif
 jspence> +ifneq ($(BR2_HAVE_MANPAGES),y)
 jspence> +	rm -f $(addprefix $(TARGET_DIR)/usr/man/, \
 jspence> +		$(addsuffix .1,$(UDPCAST_BINARIES)))
 jspence> +endif
 jspence> +
 jspence> +udpcast: uclibc $(UDPCAST_PROGS)
 jspence> +
 jspence> +udpcast-clean:
 jspence> +	rm -f $(UDPCAST_INSTALL_FILES)
 jspence> +	$(MAKE) -C $(UDPCAST_DIR) clean

Make that -$(MAKE) so it doesn't fail if the makefile/dir doesn't
exist.

 jspence> +	rm -f $(UDPCAST_DIR)/.configured
 jspence> +
 jspence> +udpcast-dirclean:
 jspence> +	rm -rf $(UDPCAST_DIR)
 jspence> +
 jspence> +
 jspence> +#############################################################
 jspence> +#
 jspence> +# Toplevel Makefile options
 jspence> +#
 jspence> +#############################################################
 jspence> +ifeq ($(strip $(BR2_PACKAGE_UDPCAST)),y)
 jspence> +TARGETS+=udpcast
 jspence> +endif

 jspence> _______________________________________________
 jspence> buildroot mailing list
 jspence> buildroot at uclibc.org
 jspence> http://busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
