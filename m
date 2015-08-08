From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 17:14:28 +0200
Subject: [Buildroot] [PATCH] package/dawgdic: needs gcc >= 4.7
In-Reply-To: <55C617D0.3050800@green-communications.fr>
References: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
 <55C617D0.3050800@green-communications.fr>
Message-ID: <20150808171428.68f11d28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Sat, 08 Aug 2015 16:53:04 +0200, Nicolas Cavallari wrote:

> > diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
> > index ce0b466..8ef9902 100644
> > --- a/package/dawgdic/Config.in
> > +++ b/package/dawgdic/Config.in
> > @@ -1,6 +1,8 @@
> >   config BR2_PACKAGE_DAWGDIC
> >   	bool "dawgdic"
> >   	depends on BR2_INSTALL_LIBSTDCPP
> > +	# std=c11
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> The string conversion functions also exist in 4.6[1].

Indeed. I've committed a fix to enable dawgdic for gcc 4.6:

	http://git.buildroot.net/buildroot/commit/?id=8069253ad178441521e584b02e84be9b88bc85c4

> However, there is another problem: If an external toolchain is built 
> using GCC and uclibc without any additional patches, then you will not 
> have them, because of a too-broad feature check in libstdc++ that checks 
> if the C library has complete support for C99[2].
> 
> This problem is still unresolved even with the latest GCC. buildroot 
> patches GCC to fix this, but if an external toolchain does not ...

We simply can't support all possible uClibc external toolchains. If you
come with an external toolchain that has a uClibc configuration
completely different than the one in Buildroot, then you will get tons
of failures. This is what happened with the pre-built ARC toolchain
from Synopsys, and we ended up disabling it because it was breaking too
many of the Buildroot assumptions on the uClibc configuration.

But indeed, due to this gcc shortcoming, none of the uClibc external
toolchains that are not built with Buildroot can be used. Do we really
want to fix this problem?

Or maybe this means that the idea of using the gcc version was not a
good idea, and we should really have feature-based Config.in options,
like TOOLCHAIN_HAS_STD_STRTOLL.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
