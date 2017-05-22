From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 22 May 2017 23:54:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-21
In-Reply-To: <20170522175415.pcy3uykh7ycoh42b@tarshish>
References: <20170522063013.3FE2A206ED@mail.free-electrons.com>
 <20170522120753.vebsgc6s2fz5fb6a@tarshish>
 <8E2EE25B-898A-4D7A-9936-BD2517D6D86A@openadk.org>
 <20170522152255.7dkweqx25ohzcg7u@tarshish>
 <20170522175415.pcy3uykh7ycoh42b@tarshish>
Message-ID: <20170522215414.GD6202@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
Baruch Siach wrote,

> Hi Waldemar,
> 
> On Mon, May 22, 2017 at 06:22:55PM +0300, Baruch Siach wrote:
> > On Mon, May 22, 2017 at 04:14:28PM +0200, Waldemar Brodkorb wrote:
> > > take a look here:
> > > https://github.com/richfelker/musl-cross-make/blob/master/patches/gcc-6.3.0/0010-static-pie-support.diff
> > 
> > Thanks for the pointer.
> > 
> > I don't see this, or equivalent, patch in any gcc version that Buildroot 
> > supports. Is this the right fix to the cifs-utils build failure?
> > 
> > diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> > index 152a3eeccf8a..ceedcf5de86f 100644
> > --- a/package/cifs-utils/cifs-utils.mk
> > +++ b/package/cifs-utils/cifs-utils.mk
> > @@ -12,6 +12,8 @@ CIFS_UTILS_LICENSE_FILES = COPYING
> >  
> >  ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
> >  CIFS_UTILS_CONF_OPTS += --disable-pie
> > +else ifeq ($(BR2_STATIC_LIBS),y)
> > +CIFS_UTILS_CONF_OPTS += --disable-pie
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_KEYUTILS),y)
> 
> A more generic solution might be this, which is similar to what we do with 
> uClibc-ng toolchains:
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 652c9d8c1df4..6aaf68bf6547 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -28,7 +28,7 @@ config BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_TOOLCHAIN_SUPPORTS_PIE
> +	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
>  
>  choice
>  	prompt "Toolchain type"


You can add my Acked-By.

Best regards
 Waldemar
