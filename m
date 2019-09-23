From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Sep 2019 21:02:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-17
In-Reply-To: <d68e4895-611b-7a34-0d22-3bb5efbe8cce@mind.be>
References: <20190918061626.A01A88614D@whitealder.osuosl.org>
 <20190918225655.37a87136@gmx.net>
 <d68e4895-611b-7a34-0d22-3bb5efbe8cce@mind.be>
Message-ID: <20190923210229.0d90432a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Sat, 21 Sep 2019 13:26:00 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 18/09/2019 22:56, Peter Seiderer wrote:
> > Hello,
> >
> > On Wed, 18 Sep 2019 06:16:20 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >
> > [...]
> >>
> >> Results for branch 'master'
> >> ===========================
> > [...]
> >
> >>    x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/061fd3cd6e29c86f49ebfe47b4abb7497ee17fa5 |
> >
> > The ffmpeg configure step fails with:
> >
> >  ERROR: gnutls not found using pkg-config
> >
> > From build/ffmpeg-4.2/ffbuild/config.log:
> >
> >  .../host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/libgnutls.so: undefined reference to `__get_cpuid_count'
> >
> > From build/gnutls-3.6.9/lib/accelerated/x86/x86-common.c:
> >
> >  41 #ifdef HAVE_CPUID_H
> >  42 # include <cpuid.h>
> >  43 #else
> >  44 # define __get_cpuid(...) 0
> >  45 # define __get_cpuid_count(...) 0
> >  46 #endif
> >
> > The given toolchain cpuid.h file is missing the get_cpuid_count definition (for
> > an cpuid.h file with it see e.g. [1])...
> >
> > The gnutls search for cpuid.h can be disabled by the
> > '--disable-hardware-acceleration' configure option, so the build could
> > be fixed by the following patch:
> >
> > --- a/package/gnutls/gnutls.mk
> > +++ b/package/gnutls/gnutls.mk
> > @@ -27,7 +27,8 @@ GNUTLS_CONF_OPTS = \
> >         --with-librt-prefix=$(STAGING_DIR) \
> >         --without-tpm \
> >         $(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
> > -       $(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
> > +       $(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
> > +       --disable-hardware-acceleration
> >  GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
> >         ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
> >         gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
> >
> >
> > Unconditionally disabling hardware acceleration seems to be overkill, but
> > did not spot the right condition (yet)...
> >
> > Or alternatively patch configure to check not only for cpuid.h header,
> > but although check for __get_cpuid/__get_cpuid_count presence...
>
>  Fixed by http://patchwork.ozlabs.org/patch/1157883/ I guess?

Yes, I can confirm the ffmpeg 'gnutls not found using pkg-config' failure
is fixed by the above patch (which is already applied on master)...

Regards,
Peter

>
>  Regards,
>  Arnout
>
> >
> > Regards,
> > Peter
> >
> > [1] https://github.com/gcc-mirror/gcc/blob/master/gcc/config/i386/cpuid.h
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
