From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 21 Sep 2010 10:39:40 -0700
Subject: [Buildroot] [PATCH 18/21] ntp: convert to autotargets and bump
	to 4.2.6p2
In-Reply-To: <20100918191944.612fee30@surf>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-18-git-send-email-Martin.Banky@gmail.com>
	<20100918191944.612fee30@surf>
Message-ID: <AANLkTik4DS2KdmqwaXrDcPF8soHVi6vn1aFo6PSqfPNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
     Thank you for the tips! As you can probably tell, I'm new to writing
makefiles, and have been using the other mk files in buildroot as examples.
Not always the best way to pick up the proper format for the buildroot
makefiles. Feel free to point out other issues with my mk files in the
future. You won't hurt my feelings, and I always appreciate being shown how
to do it properly.

Martin

On Sat, Sep 18, 2010 at 10:19 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello !
>
> On Mon, 13 Sep 2010 20:40:45 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +config BR2_PACKAGE_NTP_NTP-KEYGEN
>
> Please don't use the dash character in configuration options. This
> should be BR2_PACKAGE_NTP_KEYGEN or BR2_PACKAGE_NTP_NTP_KEYGEN.
>
> > +NTP_DIR = $(BUILD_DIR)/ntp-$(NTP_VERSION)
>
> Not needed.
>
> > +NTP_CAT = $(ZCAT)
>
> Not needed.
>
> >  ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
> > +define NTP_INSTALL_SNTP
> >       install -m 755 $(NTP_DIR)/sntp/sntp $(TARGET_DIR)/usr/bin/sntp
> > +endef
> > +endif
>
> Instead of $(NTP_DIR), use $(@D).
>
> > +
> > +ifeq ($(BR2_PACKAGE_NTP_NTP-KEYGEN),y)
> > +define NTP_INSTALL_NTP-KEYGEN
> > +     install -m 755 $(NTP_DIR)/util/ntp-keygen
> $(TARGET_DIR)/usr/bin/ntp-keygen
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTP_NTP-WAIT),y)
> > +define NTP_INSTALL_NTP-WAIT
> > +     install -m 755 $(NTP_DIR)/scripts/ntp-wait
> $(TARGET_DIR)/usr/bin/ntp-wait
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTP_NTPDC),y)
> > +define NTP_INSTALL_NTPDC
> > +     install -m 755 $(NTP_DIR)/ntpdc/ntpdc $(TARGET_DIR)/usr/bin/ntpdc
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTP_NTPQ),y)
> > +define NTP_INSTALL_NTPQ
> > +     install -m 755 $(NTP_DIR)/ntpq/ntpq $(TARGET_DIR)/usr/bin/ntpq
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTP_NTPTRACE),y)
> > +define NTP_INSTALL_NTPTRACE
> > +     install -m 755 $(NTP_DIR)/scripts/ntptrace
> $(TARGET_DIR)/usr/bin/ntptrace
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTP_TICKADJ),y)
> > +define NTP_INSTALL_TICKADJ
> > +     install -m 755 $(NTP_DIR)/util/tickadj
> $(TARGET_DIR)/usr/bin/tickadj
> > +endef
> >  endif
> > +
> > +define NTP_INSTALL_TARGET_CMDS
> > +     install -m 755 $(NTP_DIR)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
> > +     $(NTP_INSTALL_SNTP)
> > +     $(NTP_INSTALL_NTP-KEYGEN)
> > +     $(NTP_INSTALL_NTP-WAIT)
> > +     $(NTP_INSTALL_NTPDC)
> > +     $(NTP_INSTALL_NTPQ)
> > +     $(NTP_INSTALL_NTPTRACE)
> > +     $(NTP_INSTALL_TICKADJ)
>
> Humm, you could rewrite this this way:
>
> NTP_INSTALL_BIN_FILES =
> ifeq ($(BR2_PACKAGE_NTP_NTP_KEYGEN),y)
> NTP_INSTALL_BIN_FILES += util/ntp-keygen
> endif
> ifeq ($(BR2_PACKAGE_NTP_NTP-WAIT),y)
> NTP_INSTALL_BIN_FILES += scripts/ntp-wait
> endif
> ...
>
> and then :
>
> define NTP_INSTALL_TARGET_CMDS
>        install -m 755 $(NTP_DIR)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
>        test -z "$(NTP_INSTALL_BIN_FILES)" || install -m 755 $(addprefix
> $(@D),$(NTP_INSTALL_BIN_FILES)) $(TARGET_DIR)/usr/bin/
> endif
>
> and finally :
>
> define NTP_UNINSTALL_TARGET_CMDS
>        rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTP_INSTALL_BIN_FILES))
> endif
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100921/89ca7665/attachment-0001.html>
