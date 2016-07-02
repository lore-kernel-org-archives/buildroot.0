From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 16:44:55 +0200
Subject: [Buildroot] [PATCH 1/3] Move the host-pkgconf dependency from
 host-cmake to pkg-cmake
In-Reply-To: <14747128-2dd0-efb6-6c4c-faf744e8899a@mind.be>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-2-git-send-email-luca@lucaceresoli.net>
 <14747128-2dd0-efb6-6c4c-faf744e8899a@mind.be>
Message-ID: <20160702144455.GN22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-07-02 15:56 +0200, Arnout Vandecappelle spake thusly:
> On 01-07-16 17:53, Luca Ceresoli wrote:
> > In 3d475ee0ba4d6eea6aca25594cfe5bb153ac804f a dependency on
> > host-pkgconf was added to host-cmake. It is a workaround to fix build
> > failures for packages that use pkgconf through a cmake module, but do
> > not depend on host-pkgconf as they should.
> 
>  Wouldn't this be a great time to just bite the bullet, remove the host-pkgconf
> dependency, and fixes packages as they break in the autobuilders?

We've jsut discussed it live here in TLS, and we've concluded that this
is a topic unrelated to the work by Luca.

So even if we wanted to remove this "hack", this should not block this
patch from going in.

However, because the culprit for causing the dependency to host-pkgconf
is cmake itslef, and not a cmake-based package, I would suggest that we
do not consider this a hack, but the reality.

Anyway, for this patch:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> > Since it is the package that needs host-pkgconf and not host-cmake
> > itself, move the dependency to the proper place, in pkg-cmake.mk.
> > 
> > Also copy the explanation on the mentioned commit as a comment in
> > order to clarify why we do this.
> > 
> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
>  If it is decided to keep the current hack around:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Regards,
>  Arnout
> 
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Davide Viti <zinosat@tiscali.it>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > 
> > ---
> > 
> > This is done as a preliminary cleanup step for the following patch
> > that allows to skip building host-cmake in some cases. The dependency
> > where it is now would be missed when we skip building host-cmake, so I
> > moved it where it will be catched in all cases. Without the following
> > patch this can be considered just a cleanup without any visible
> > effect.
> > ---
> >  package/cmake/cmake.mk | 2 +-
> >  package/pkg-cmake.mk   | 4 ++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> > index a776b14..33fb4aa 100644
> > --- a/package/cmake/cmake.mk
> > +++ b/package/cmake/cmake.mk
> > @@ -10,7 +10,7 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
> >  CMAKE_LICENSE = BSD-3c
> >  CMAKE_LICENSE_FILES = Copyright.txt
> >  
> > -HOST_CMAKE_DEPENDENCIES = host-pkgconf
> > +HOST_CMAKE_DEPENDENCIES =
> >  CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz
> >  
> >  CMAKE_CONF_OPTS = \
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 81dcfcc..8d7d265 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -149,6 +149,10 @@ $(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
> >  	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> >  endif
> >  
> > +# Since some CMake modules (even upstream ones) use pgk_check_modules
> > +# primitives to find {C,LD}FLAGS, add it to the dependency list.
> > +$(2)_DEPENDENCIES += host-pkgconf
> > +
> >  $(2)_DEPENDENCIES += host-cmake
> >  
> >  #
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
