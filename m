From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 3 May 2018 12:13:16 +0200
Subject: [Buildroot] [PATCH 1/7] libidn2: new package
In-Reply-To: <03d92121-8a91-a2a8-5fc3-e20b130e19f4@mind.be>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
 <03d92121-8a91-a2a8-5fc3-e20b130e19f4@mind.be>
Message-ID: <CAPi7W81HoFLk6tuue9BRojAxaSH0FhzUPYrv7A6Uxqzfh8yGMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

2018-05-02 23:51 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>  Hi Fabrice,
>
> On 01-05-18 22:40, Fabrice Fontaine wrote:
> > Libidn2 is an implementation of the IDNA2008 + TR46
> > specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
> > TR 46).
> >
> > http://www.gnu.org/software/libidn/
>
>  So, basically libidn2 replaces libidn. Do we really want to support both?
> Yes,
> obviously the API changed, but that happens all the time when bumping
> packages.
> So, the question is what gives the best user experience...
>
>  The problem with adding libidn2 is that a user who currently has libidn
> and
> libcurl enabled, after updating Buildroot, will suddenly loose IDN support
> with
> no warning...
>
Actually, IDN support on libcurl is already broken in buildroot since
November 2016 as libcurl only supports libidn2 since version 7.51.0:
https://github.com/curl/curl/commit/9c91ec778104ae3b744b39444d544e82d5ee9ece
.

>
>  On the other hand, if a user has selected libidn and is using it in some
> package outside of Buildroot, then that package will fail to build
> entirely,
> with no (easy) way to recovery. But how likely is it that libidn is used
> in an
> external package?
>
>  But first, of course, if we want to just bump libidn then we have to make
> sure
> that all packages support libidn2. That means the following packages have
> to be
> checked: dnsmasq, ghostscript, libgsasl, mutt, omxplayer, prosody.
>
Actually, that's what I have tried to do (see my patch's serie):
- dnsmaq supports both packages: libidn and libidn2 (and it prefers libidn2)
- systemd supports both packages but only one can enable at the same time
(see my patch)
- ghostscript, ligsasl, mutt, omxplayer, prosody supports only libidn
- libcurl, wget, gnutls, lftp supports only libidn2 (again that means that
IDN support is currently broken with libcurl/lftp)
- whois supports both packages in the version embedded in buildroot
(5.2.17) but libidn supports will be removed if we bump to latest release
(5.3.0).
So, I think the only option is to support both packages in buildroot. Most
recent packages made the jump to libidn2  but old ones won't be updated any
time soon.

> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [snip]
>
> > diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
> > new file mode 100644
> > index 0000000000..38b1378990
> > --- /dev/null
> > +++ b/package/libidn2/Config.in
> > @@ -0,0 +1,17 @@
> > +config BR2_PACKAGE_LIBIDN2
> > +     bool "libidn2"
>
>  Can it be parallel-installed with libidn or does it need a depends on
> !BR2_PACKAGE_LIBIDN?
>
Yes, it can be parallel-installed.

>
> > +     help
> > +       Libidn2 is an implementation of the IDNA2008 + TR46
> > +       specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
> > +       TR 46).
> > +
> > +       http://www.gnu.org/software/libidn/
> [snip]
> > +LIBIDN2_VERSION = 2.0.4
> > +LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
> > +LIBIDN2_LICENSE = GPL-2.0+, LGPL-3.0+
> > +LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3
> COPYING.unicode
> > +LIBIDN2_DEPENDENCIES = \
> > +     host-pkgconf \
> > +     $(TARGET_NLS_DEPENDENCIES) \
> > +     $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> > +LIBIDN2_INSTALL_STAGING = YES
> > +
> > +ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
> > +LIBIDN2_DEPENDENCIES += libunistring
>
>  No --enable/disable option for this?
>
 Nope, there is only a test "$ac_cv_libunistring" = "yes" in configure.ac

>
>  Also, don't the java and C# bindings exist any more?
>
Yes, these bindings don't exist anymore

>
> > +endif
> > +
> > +define LIBIDN2_REMOVE_BINARY
> > +     rm -f $(TARGET_DIR)/usr/bin/idn2
> > +endef
>
>  Small nit: we prefer to have the define of the hook inside the condition
> as well.
>
OK, I can fix this if you want, I have just copy/paste libidn.mk.

>
>  Regards,
>  Arnout
>
> > +
> > +ifneq ($(BR2_PACKAGE_LIBIDN2_BINARY),y)
> > +LIBIDN2_POST_INSTALL_TARGET_HOOKS += LIBIDN2_REMOVE_BINARY
> > +endif
> > +
> > +$(eval $(autotools-package))
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180503/a5746874/attachment.html>
