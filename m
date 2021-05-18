From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 16:17:19 +0300
Subject: [Buildroot] [PATCH 3/6] package/seatd: new package
In-Reply-To: <20210516135451.GF2506@scaer>
References: <20210513163325.1775639-1-aperez@igalia.com>
 <20210513163325.1775639-4-aperez@igalia.com> <20210516135451.GF2506@scaer>
Message-ID: <20210518161719.GF1064184@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 May 2021 15:54:51 +0200 "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Adrian, All,
> 
> On 2021-05-13 19:33 +0300, Adrian Perez de Castro spake thusly:
> > Introduce a seatd package, which can be used by wlroots 0.12.0 and
> > newer. The package includes both a library (always built) and an
> > optional seat management daemon.
> > 
> > The library can use systemd-logind, the seatd daemon, or a simple
> > builtin in-process mode. Build options are introduced for each of them.
> > At least one backend needs to be built; if both logind and seatd are
> > disabled the builtin backend will be enabled unconditionally.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> [--SNIP--]
> > diff --git a/package/seatd/Config.in b/package/seatd/Config.in
> > new file mode 100644
> > index 0000000000..a921e0e01c
> > --- /dev/null
> > +++ b/package/seatd/Config.in
> > @@ -0,0 +1,48 @@
> > +menuconfig BR2_PACKAGE_SEATD
> > +	bool "seatd"
> > +	select BR2_PACKAGE_SEATD_LIBSEAT
> > +	help
> > +	  Seat management daemon and support library.
> > +
> > +	  https://git.sr.ht/~kennylevinsen/seatd
> > +
> > +if BR2_PACKAGE_SEATD
> > +
> > +config BR2_PACKAGE_SEATD_LIBSEAT
> 
> Why do you need a separate option BR2_PACKAGE_SEATD_LIBSEAT? If the
> package is not enabled, that option is not visible; if the package is
> enabled, that option is forcibly set... So, I fail to see a reason for
> it...

As it turns out, right now I cannot remember why it was written this way.
Let's go with the simplification. The auxiliary option can be brought back
when there is some reason for it (if ever).
 
> > +	bool "libseat"
> > +	select BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN \
> > +		if !BR2_PACKAGE_SEATD_LIBSEAT_LOGIND && !BR2_PACKAGE_SEATD_LIBSEAT_SEATD
> 
> ... and the select it does can be moved to the main symbol without any
> issue, AFAICS...

Aye.

> > +if BR2_PACKAGE_SEATD_LIBSEAT
> > +
> > +config BR2_PACKAGE_SEATD_LIBSEAT_LOGIND
> > +	bool "logind backend"
> > +	default y
> 
> We usually do not default y, unless there is a very good reason for it.
> In this case, I would even drop the option completely, and just enable
> the logind support in the makefile:
> 
>     ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
>     SEATD_CONF_OPTS += -Dlogind=enabled
>     else
>     SEATD_CONF_OPTS += -Dlogind=disabled
>     endif

Sounds good to me.

> Also, don't you need a "SEATD_DPENDENCIES += systemd" in that case?

Indeed, good catch.

> > +	depends on BR2_PACKAGE_SYSTEMD_LOGIND
> > +	help
> > +	  Support using logind for seat management.
> > +
> > +comment "logind backend needs systemd-logind"
> > +	depends on !BR2_PACKAGE_SYSTEMD_LOGIND
> > +
> > +config BR2_PACKAGE_SEATD_LIBSEAT_SEATD
> > +	bool "seatd backend"
> > +	default y
> > +	depends on BR2_PACKAGE_SEATD_SEATD
> > +	help
> > +	  Support using seatd for seat management.
> 
> Ditto: I would also drop the option and enable the seatd backend if the
> daemon is enabled.

Sure.

> > +comment "seatd backend needs seatd daemon"
> > +	depends on !BR2_PACKAGE_SEATD_SEATD
> > +
> > +config BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN
> > +	bool "builtin backend"
> > +	help
> > +	  Builtin in-process seatd implementation.
> 
> And thus, we'd just have this one option, which gets forcibly selected
> when neither systemd-logind nor the seatd daemone are enabled;
> 
>     config BR2_PACKAGE_SEATD
>         bool "seatd"
>         select BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN \
>             if !BR2_PACKAGE_SYSTEMD_LOGIND \
>             && !BR2_PACKAGE_SEATD_SEATD
> 
> Regards,
> Yann E. MORIN.
> 
> > +endif
> > +
> > +config BR2_PACKAGE_SEATD_SEATD
> > +	bool "seatd daemon"
> > +
> > +endif
> > diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
> > new file mode 100644
> > index 0000000000..342079e958
> > --- /dev/null
> > +++ b/package/seatd/seatd.hash
> > @@ -0,0 +1,5 @@
> > +# Calculated locally
> > +sha256  274b56324fc81ca6002bc1cdd387668dee34a6e1063e5f3896805c3770948988  0.5.0.tar.gz
> > +
> > +# License files
> > +sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
> > diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
> > new file mode 100644
> > index 0000000000..45da53904f
> > --- /dev/null
> > +++ b/package/seatd/seatd.mk
> > @@ -0,0 +1,42 @@
> > +################################################################################
> > +#
> > +# seatd
> > +#
> > +################################################################################
> > +
> > +SEATD_VERSION = 0.5.0
> > +SEATD_SOURCE = $(SEATD_VERSION).tar.gz
> > +SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
> > +SEATD_LICENSE = MIT
> > +SEATD_LICENSE_FILES = LICENSE
> > +SEATD_INSTALL_STAGING = YES
> > +
> > +SEATD_CONF_OPTS += \
> > +	-Dman-pages=disabled \
> > +	-Dexamples=disabled
> > +
> > +ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT_LOGIND),y)
> > +SEATD_CONF_OPTS += -Dlogind=enabled
> > +else
> > +SEATD_CONF_OPTS += -Dlogind=disabled
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT_SEATD),y)
> > +SEATD_CONF_OPTS += -Dseatd=enabled
> > +else
> > +SEATD_CONF_OPTS += -Dseatd=disabled
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT_BUILTIN),y)
> > +SEATD_CONF_OPTS += -Dbuiltin=enabled
> > +else
> > +SEATD_CONF_OPTS += -Dbuiltin=disabled
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SEATD_SEATD),y)
> > +SEATD_CONF_OPTS += -Dserver=enabled
> > +else
> > +SEATD_CONF_OPTS += -Dserver=disabled
> > +endif
> > +
> > +$(eval $(meson-package))
> > -- 
> > 2.31.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210518/9537e543/attachment.asc>
