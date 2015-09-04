From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2015 18:29:46 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E9534C.3070708@mind.be>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <55E94CE5.1010308@imgtec.com> <55E9534C.3070708@mind.be>
Message-ID: <20150904162946.GC4540@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-04 10:16 +0200, Arnout Vandecappelle spake thusly:
[--SNIP--]
> >> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> >> index 1aa74b3..24fe4ed 100644
> >> --- a/package/eudev/eudev.mk
> >> +++ b/package/eudev/eudev.mk
> >> @@ -22,11 +22,9 @@ EUDEV_CONF_ENV += LIBS=-lrt
> >>  EUDEV_CONF_OPTS =		\
> >>  	--disable-manpages	\
> >>  	--sbindir=/sbin		\
> >> -	--with-rootlibdir=/lib	\
> >>  	--libexecdir=/lib	\
> >>  	--with-firmware-path=/lib/firmware	\
> >>  	--disable-introspection			\
> >> -	--enable-split-usr			\
> >>  	--enable-libkmod
> >>  
> >>  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> > 
> > shouldn't you do that _ONLY_ when BR2_ROOTFS_MERGED_USR is selected?
> 
>  In addition, are --sbindir and --libexecdir still needed?

Dunno... Will test.

> >> diff --git a/system/Config.in b/system/Config.in
> >> index fad829d..735ad62 100644
> >> --- a/system/Config.in
> >> +++ b/system/Config.in
> >> @@ -88,6 +88,7 @@ config BR2_INIT_SYSTEMD
> >>  	depends on BR2_USE_MMU
> >>  	depends on !BR2_STATIC_LIBS
> >>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> >> +	select BR2_ROOTFS_MERGED_USR
> 
>  Wouldn't it be more appropriate to move this to package/systemd/Config.in,
> which already has all the other selects?
> 
>  OTOH, this is a system option while package/systemd/Config.in selects only
> packages.

Well, I don't care. In fact, BR2_INIT_SYSTEMD and BR2_PACKAGE_SYSTEMD
are in effect synonyms. So, it's completely arbiotrary where we put the
selects.

I would have favoured pacakge dependencies, like libs and support stuff,
to be selected by the package, while system-related dependencies would
have been handled by the init sytem.

But as you say, this is a fringe case. After all, systemd *does* support
a separate /usr, it's just that we in Buildroot decided (with this
patch) not to support that case.

>  I think we should reason as follows: if we would ever support building the
> systemd package without BR2_INIT_SYSTEMD,

But does that question even make sense to start with? systemd *is* an
init system and nothing more, so there's no reason we would ever build
systemd stand-alone.

At least, in the current state of affairs, for the foreseeable future,
there's almost no chance we build systemd standalone.

>  Anyway, it's probably bikeshedding. But perhaps you can put a rationale in the
> commit message for future reference.

Like:

    In Buildroot, we decided not to support a split-usr when systemd
    is used as an init system. This is not a systemd issue, this is a
    deign decision. Thus the select is with BR2_INIT_SYSTEMD rather
    than with BR2_PACKAGE_SYSTEMD.

> After all, your commit message is a bit
> short at the moment :-P

I'll take that as an incitation at expanding it even more. The four
lines above will make it! ;-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
