From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 15:58:03 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55C366E8.3060207@oliseo.fr>
References: <20150729063017.EDA6D101EBC@stock.ovh.net>
 <20150729100334.00137b70@free-electrons.com>
 <55C366E8.3060207@oliseo.fr>
Message-ID: <20150806155803.66771b6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume,

On Thu, 6 Aug 2015 15:53:44 +0200, Guillaume GARDET - Olis?o wrote:

> >>           arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/cb623460de30dd7c4ef3275fe13220c1ca0642a5/
> > c_icap-service.o: In function `load_c_service':
> > service.c:(.text+0x710): undefined reference to `ci_module_load'
> > service.c:(.text+0x720): undefined reference to `ci_module_sym'
> > service.c:(.text+0x774): undefined reference to `ci_module_unload'
> >
> > Unknown, already happened yesterday. Guillaume, can you have a look?
> 
> This is because HAVE_DLFCN_H is not set because dlfcn.h is not provided by the toolchain. But ./os/unix/dlib.c uses dlopen and dlclose functions.
> Apparently, this is missing on uClibc when it is configured as a static-only C library.

The c-icap code seems a bit stupid: it encloses the definition of
ci_module_{load,sym,unload} in #ifdef HAVE_DLFCN_H to not implement
them when dlopen/dlclose are not available (which is good), but
ci_module_{load,sym,unload} are still called unconditionally from the
rest of the c-icap code.

Bottom line: the condition on HAVE_DLFCN_H is useless.

> What would be the best way to fix it? Maybe a "depends on !BR2_STATIC_LIBS" ?

Either fix c-icap, or simpler, make it depends on !BR2_STATIC_LIBS (and
don't forget the corresponding comment).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
