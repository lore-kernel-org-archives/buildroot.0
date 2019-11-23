From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Nov 2019 17:05:34 +0100
Subject: [Buildroot] [PATCH v2,
 2/4] package/celt051: needs dynamic library
In-Reply-To: <871rtyyapg.fsf@dell.be.48ers.dk>
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
 <20191117164452.5361-2-fontaine.fabrice@gmail.com>
 <871rtyyapg.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W80KMHAyKyHmmkHKZuyfQLyA5+cifwhdVp54PjwwK+8FtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Le sam. 23 nov. 2019 ? 14:38, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > celt051 can't be built statically with opus as opus embeds its own celt
>  > version. So add a dynamic library dependency to celt051 (and not to
>  > opus, as celt051 is only used optionally by spice whereas opus is
>  > selected by 9 packages)
>
>  > This will fix static build of spice with opus and celt:
>
>  > /home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/fabrice/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libopus.a(vq.o): in function `renormalise_vector':
>  > vq.c:(.text+0x5ee): multiple definition of `renormalise_vector'; /home/fabrice/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libcelt051.a(vq.o):vq.c:(.text+0x6e6): first defined here
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd
>
> So this is only really an issue for spice, if spice is built statically
> and both celt051 and opus are enabled?
>
> If so, then I would prefer to handle it in spice.mk instead,
> E.G. blacklist the celt51 + opus + static combination with a sensible
> comment, something like:
>
> ifeq ($(BR2_PACKAGE_CELT051),y)
>
> # opus embeds a copy of celt, causing multiple definitions of a number
> # of symbols when linked statically together with celt051, so disable
> # celt051 support for that combination
> ifeq ($(BR2_PACKAGE_OPUS)$(BR2_STATIC_LIBS),yy)
> SPICE_CONF_OPTS += --disable-celt051
> else
> SPICE_CONF_OPTS += --enable-celt051
> SPICE_DEPENDENCIES += celt051
> endif
>
> else
> SPICE_CONF_OPTS += --disable-celt051
> endif
>
> Care to send a patch doing something like that? Thanks.
An other option would be to remove celt051 package indeed the root
cause of this static build failure is that celt has been merged into
the IETF Opus codec and is now obsolete (see http://celt-codec.org/).
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
