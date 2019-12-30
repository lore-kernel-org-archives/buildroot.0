From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:22:05 +0100
Subject: [Buildroot] [PATCH 1/3] package/libopenssl: move target arch
 selection to Config.in
In-Reply-To: <20191230125458.GO26395@scaer>
References: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
 <20191027102420.15560-2-thomas.petazzoni@bootlin.com>
 <20191230125458.GO26395@scaer>
Message-ID: <20191230142205.705b7030@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Dec 2019 13:54:58 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> > new file mode 100644
> > index 0000000000..732da5b4ef
> > --- /dev/null
> > +++ b/package/libopenssl/Config.in
> > @@ -0,0 +1,29 @@
> > +# 4xx PowerPC cores seem to have trouble with openssl's ASM
> > +# optimizations
> > +config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC  
> 
> Why 'LINUX' in the option name?

I wrote the patch a while ago, but I guess my reasoning was that it was
related to the "linux-ppc" OpenSSL architecture name. I.e this option
says which "TARGET_ARCH" in Buildroot speak, are compatible with the
"linux-ppc" OpenSSL architecture support.

But I'm fine with the name being changed, it's really just because I
had to find a name :-)

> So I know you just transposed the existing logic from Makefile to
> Kconfig. Yet, I'd like to point at how fragile this ordering is.
> 
> The arm vs. aarch64 situation works because BR2_ARM_CPU_HAS_ARM is never
> selected by an armv8 CPU when it works in 64bit mode.
> 
> I think a more reliable way would have been something like:
> 
>     config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_ARM
>         bool
>         default y if BR2_arm || BR2_armeb
>         depends on BR2_ARM_CPU_HAS_ARM
> 
> and then:
> 
>     default "linux-armv4"  if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_ARM

True. Could then also be:

	default "linux-armv4" if (BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM

We will need to clarify the semantic of BR2_ARM_CPU_HAS_ARM I believe,
to indicate what it means in the context of 64-bit ARM platforms.

> > diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> > index a64660bea3..4d37a3ecf9 100644
> > --- a/package/openssl/Config.in
> > +++ b/package/openssl/Config.in
> > @@ -43,6 +43,8 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
> >  	help
> >  	  Install additional encryption engine libraries.
> >  
> > +source "package/libopenssl/Config.in"  
> 
> Amybe it makes sense to move BR2_PACKAGE_LIBOPENSSL_BIN there too?

Yes, it does.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
