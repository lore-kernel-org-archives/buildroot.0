From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Aug 2014 22:38:07 +0200
Subject: [Buildroot] [PATCH 4 of 6 v2] uclibc: only add targets if
 uclibc is enabled
In-Reply-To: <CAAXf6LVVYb259h3mtNi4XNczOzJHDKM9g=_kKg3uDRy4wCYHBw@mail.gmail.com>
References: <patchbomb.1406750281@localhost>
 <540167f28c2d41530ceb.1406750285@localhost>
 <20140731231338.205114b3@free-electrons.com>
 <CAAXf6LVVYb259h3mtNi4XNczOzJHDKM9g=_kKg3uDRy4wCYHBw@mail.gmail.com>
Message-ID: <20140801203807.GB3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-01 21:37 +0200, Thomas De Schampheleire spake thusly:
> On Thu, Jul 31, 2014 at 11:13 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Thomas De Schampheleire,
> >
> > On Wed, 30 Jul 2014 21:58:05 +0200, Thomas De Schampheleire wrote:
> >
> >> In analogy of linux.mk, only enable its targets (in particular the kconfig
> >> targets (menuconfig, update-config, ...) when the uclibc package is actually
> >> enabled.
> >>
> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >>
> >> ---
> >> v2: rebase after making kconfig-package a full infra
> >>
> >> Note: now that kconfig-package is a full package infra (inheriting from
> >> generic-package) this may seem a bit odd, as other packages do not do this.
> >> Nevertheless, it does not hurt and will slightly improve the parsing of the
> >> Makefiles when the package is not selected.
> >>
> >>  package/uclibc/uclibc.mk |  2 ++
> >>  1 files changed, 2 insertions(+), 0 deletions(-)
> >>
> >> diff -r 083076145a2b -r 540167f28c2d package/uclibc/uclibc.mk
> >> --- a/package/uclibc/uclibc.mk        Tue Jul 22 20:35:36 2014 +0200
> >> +++ b/package/uclibc/uclibc.mk        Wed Jul 23 20:12:32 2014 +0200
> >> @@ -539,7 +539,9 @@
> >>       $(UCLIBC_INSTALL_UTILS_STAGING)
> >>  endef
> >>
> >> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
> >>  $(eval $(kconfig-package))
> >> +endif
> >
> > I actually don't like this that much, because I like a lot the fact
> > that I can do "make <foo>-source" "make <foo>-extract", "make
> > <foo>-patch" or even "make <foo>" (though this last case, for the
> > specific situation of uClibc doesn't seem really possible).
> >
> > Though it's true it can be considered a bit strange to allow "make
> > <foo>-patch" but not "make <foo>-menuconfig".
> 
> I fully understand what you say. I also use that feature a lot.
> Given that linux added such a check around its menuconfig target
> (which you added by the way) and the fact that we are extracting
> everything in a kconfig-package infrastructure, there are three ways
> to proceed:
> - introduce the check in each of the kconfig-based packages
> - remove the check from each of the kconfig-based packages
> - introduce another way in kconfig-package to only allow menuconfig
> when the package is selected
> 
> What is your preference here?

Except for uClibc, I think it is still usefull (for debugging purposes,
for example) to be able to build a non-configured package.

So, in retrospect, I would side with Thomas P. on that one. We could
just maybe hide uClibc if not enabled, but allow it for the other
packages.

BTW, we now have the BR2_PACKAGE_UCLIBC (as well as BR2_PACKAGE_GLIBC
and BR2_PACKAGE_MUSL) if you need to know whether the corresponding
package is enabled.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
