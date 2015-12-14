From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Dec 2015 00:50:40 +0100
Subject: [Buildroot] [PATCH v9 06/32] package/efl/libefl: new package
In-Reply-To: <566F4C03.5090403@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
 <20151212151524.0b711e40@free-electrons.com>
 <566C699E.5070804@openwide.fr> <566F4C03.5090403@openwide.fr>
Message-ID: <20151214235040.GF4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Thomas,

On 2015-12-15 00:08 +0100, Romain Naour spake thusly:
> Le 12/12/2015 19:38, Romain Naour a ?crit :
> > Hi Thomas, All,
> > 
> > Le 12/12/2015 15:15, Thomas Petazzoni a ?crit :
> >> Dear Romain Naour,
> >>
> >> On Sat, 12 Dec 2015 14:33:09 +0100, Romain Naour wrote:
> >>
> >>> diff --git a/package/efl/Config.in b/package/efl/Config.in
> >>> index 7ce5a36..1c6f9e5 100644
> >>> --- a/package/efl/Config.in
> >>> +++ b/package/efl/Config.in
> >>> @@ -1,8 +1,13 @@
> >>>  menuconfig BR2_PACKAGE_EFL
> >>>  	bool "Enlightenment Foundation Libraries"
> >>> -	depends on BR2_USE_WCHAR
> >>> -	# libeina uses madvise(). To revisit when bumping EFL to 1.8
> >>> -	depends on BR2_USE_MMU
> >>> +	depends on BR2_INSTALL_LIBSTDCPP # libefl
> >>> +	depends on BR2_PACKAGE_HAS_UDEV # libefl -> libudev
> >>> +	depends on BR2_PACKAGE_LUA # lua 5.1 or better
> >>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libefl
> >>> +	depends on BR2_USE_MMU # libefl
> >>> +	depends on BR2_USE_WCHAR # libefl
> >>> +	depends on !BR2_STATIC_LIBS # libefl
> >>
> >> So we have all these dependencies here in package/efl/Config.in and
> >> then duplicated in package/efl/libefl/Config.in. Is this really needed?
> > 
> > Indeed, it's not really great but since BR2_PACKAGE_EFL select
> > BR2_PACKAGE_LIBEFL all libefl dependencies must be propagated.
> > 
> > Do you want I remove the dependencies from libefl package ?
> > I'm not sure the right thing to do here.
> > 
> 
> In a previous series I wanted to make BR2_PACKAGE_EFL a real buildroot package.
> 
> So what Yann and me suggest is indeed duplicate the dependencies in this patch
> and at the end of the series remove them and change the BR2_PACKAGE_EFL from a
> menuconfig to a simple menu:
> 
> menu "Enlightenment Foundation Libraries"
> 
> source "package/efl/libefl/Config.in"
> source "package/efl/libelementary/Config.in"
> 
> endmenu
> 
> By doing this we can even rename the libefl package by efl in order to keep the
> previously used Kconfig BR2_PACKAGE_EFL.
> 
> We can do that only at the end of the series after the old {libecore,libevas...}
> removal.
> 
> Thoughts ?

Indeed, I think this is the best solution.

The current patch is transitional, since the old EFL packages are only
removed at the end.

However, if the duplication is still a concern, an option would be to just
have the dependencies on BR2_PACKAGE_EFL, and none on BR2_PACKAGE_LIBEFL,
like so:

package/efl/Config.in:
    config BR2_PACKAGE_EFL
        bool "EFL blabla"
        depends on C++
        depends on bla
        depends on blabla
        select BR2_PACKAGE_LIBEFL

package/efl/libefl/Config.in:
    config BR2_PACKAGE_LIBEFL
        bool "libefl"


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
