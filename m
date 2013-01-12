From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 12 Jan 2013 08:37:05 -0800
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <20130112120713.59a71794@skate>
References: <1357948846-3710-1-git-send-email-gilles.talis@gmail.com>
 <20130112120713.59a71794@skate>
Message-ID: <CAKcgs2wSe4QLNxk-SHCt4+jutkSaONvgVaAzsFbNCRbpcrncLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Thanks a lot for your comments, I am going to fix these issues right away!
It is amazing how much you can learn from code reviews :-).
Best regards,
Gilles
 On Jan 12, 2013 3:07 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Dear gilles.talis at gmail.com,
>
> Thanks for your contribution! Your package mostly looks good, but I (of
> course!) have a few comments. See below.
>
> On Fri, 11 Jan 2013 16:00:46 -0800, gilles.talis at gmail.com wrote:
> > diff --git a/package/httping/Config.in b/package/httping/Config.in
> > new file mode 100644
> > index 0000000..578028f
> > --- /dev/null
> > +++ b/package/httping/Config.in
> > @@ -0,0 +1,24 @@
> > +config BR2_PACKAGE_HTTPING
> > +     bool "httping"
> > +     help
> > +       Httping is like 'ping' but for http-requests.
> > +       Give it an url, and it'll show you how long it takes to connect,
> > +       send a request and retrieve the reply (only the headers).
> > +       Be aware that the transmission across the network also takes
> time!
> > +          So it measures the latency of the webserver + network.
>
> Indentation of this line is not correct: it is composed of spaces only,
> while it should be one tab + 2 spaces like the other lines.
>
> > +if BR2_PACKAGE_HTTPING
> > +
> > +config BR2_PACKAGE_HTTPING_OPENSSL
> > +     bool "OpenSSL support"
> > +     default y
> > +     select BR2_PACKAGE_OPENSSL
>
> Here there is a point that is rather unclear in Buildroot:
>
>  *) Should each package offer a configuration sub-option to enable
>     features that depend on other packages (like you did on OpenSSL)
>
>  *) Or should a package automatically enable features if it finds that
>     the dependencies are available? This is generally what we do for
>     packages having an optional dependency on OpenSSL.
>
> This is to be discussed with other Buildroot developers. Probably we
> need to clarify what the rule is, and then document it.
>
> > +config BR2_PACKAGE_HTTPING_TFO
> > +     bool "TCP Fast Open (TFO) support"
> > +     default n
>
> 'default n' is the default, so it's not needed.
>
> > --- /dev/null
> > +++ b/package/httping/httping.mk
> > @@ -0,0 +1,44 @@
> > +#############################################################
> > +#
> > +# httping
> > +#
> > +#############################################################
> > +HTTPING_VERSION = 1.5.6
> > +HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
> > +HTTPING_SITE = http://www.vanheusden.com/httping
> > +HTTPING_LICENSE = GPL
>
> You should be more specific about the version, and whether the "or
> later" specifier is here or not. Good choices are: GPLv2, GPLv2+,
> GPLv3, GPLv3+.
>
> > +HTTPING_LICENSE_FILES = license.txt
> > +
> > +ifeq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
> > +HTTPING_DEPENDENCIES = openssl
> > +endif
> > +
> > +
> > +ifneq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
> > +     HTTPING_SSL = no
> > +endif
>
> This should be slightly changed to something like:
>
> ifeq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
>         HTTPING_DEPENDENCIES += openssl
>         HTTPING_SSL = yes
> else
>         HTTPING_SSL = no
> endif
>
> (assuming SSL=yes is correct to enable SSL support)
>
> > +ifeq ($(BR2_PACKAGE_HTTPING_TFO),y)
> > +     HTTPING_TFO = yes
> > +endif
> > +
> > +define HTTPING_BUILD_CMDS
> > +     $(MAKE) CC="$(TARGET_CC)" \
> > +     SSL=$(HTTPING_SSL) \
> > +     DEBUG=no \
> > +     TFO=$(HTTPING_TFO) \
> > +     LD="$(TARGET_LD)" \
> > +     STRIP="$(TARGET_STRIP)" -C $(@D)
> > +endef
>
> Here, I would recommend using $(TARGET_CONFIGURE_OPTS) :
>
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>                 SSL=$(HTTPING_SSL) \
>                 DEBUG=no \
>                 TFO=$(HTTPING_TFO) \
>                 -C $(@D)
>
> > +define HTTPING_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -D -m 0755 $(@D)/httping $(TARGET_DIR)/usr/bin
> > +endef
>
> With -D, you should give a complete path to the  target binary:
>
>         $(INSTALL) -D -m 0755 $(@D)/httping $(TARGET_DIR)/usr/bin/httping
>
> > +define HTTPING_CLEAN_CMDS
> > +     $(MAKE) -C $(@D) clean
> > +endef
> > +
> > +$(eval $(generic-package))
> > +
> > +# http://www.vanheusden.com/httping/httping-1.5.6.tgz
>
> This comment is not needed.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130112/7eff6bf2/attachment.html>
