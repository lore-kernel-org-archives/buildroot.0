From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 15:13:25 +0100
Subject: [Buildroot] FW: [PATCH] linux-headers: cross compile fix
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C47E@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF4D@ezex10.ezchip.com>
 <20140223105041.414123e2@skate>
 <884EA965490E3C4D8E66AEF41E98025006C47E@ezex10.ezchip.com>
Message-ID: <20140223141325.GB3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, All,

On 2014-02-23 12:33 +0000, Noam Camus spake thusly:
> See Inline
> 
> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
> Sent: Sunday, February 23, 2014 11:51 AM
> To: Noam Camus
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] FW: [PATCH] linux-headers: cross compile fix
> 
> Dear Noam Camus,
> 
> On Sun, 23 Feb 2014 08:29:15 +0000, Noam Camus wrote:
> > Otherwise compiler not found errors occured.
> > 
> > Signed-off-by: Noam Camus <noamc@ezchip.com>
> > ---
> >  package/linux-headers/linux-headers.mk |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/package/linux-headers/linux-headers.mk 
> > b/package/linux-headers/linux-headers.mk
> > index 30d3076..632b94f 100644
> > --- a/package/linux-headers/linux-headers.mk
> > +++ b/package/linux-headers/linux-headers.mk
> > @@ -25,6 +25,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
> >  			HOSTCFLAGS="$(HOSTCFLAGS)" \
> >  			HOSTCXX="$(HOSTCXX)" \
> >  			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
> > +			CROSS_COMPILE="$(TARGET_CROSS)" \
> >  			headers_install)
> >  endef
> >  
> 
> Doesn't look harmful in principle, but it seems to have worked until now
> without CROSS_COMPILE="$(TARGET_CROSS)". Can you expand the commit log
> by explaining in which case you have seen errors, and which errors.
> The linux-headers package is used daily to build toolchains by all
> Buildroot users, so I'd like to understand how your situation is
> different. Is it that the ARC kernel headers need something special?
> But we are building ARC toolchains everyday in the autobuilders, with
> no problem. That's why I'd like to have more details.
> Thomas 
> 
> [Noam Camus]
> Just use target linux-headers-rebuild and you will get many errors that
> buildroot silently ignores.

It's not Buildroot that ignores those errors, it's the Linux buildsystem
itself that ignores them, since they are harmless at the time of
installing headers.

> You alternatively may add intentionally BAD CROSS_COMPILE if you don't
> have ARC setup handy and see that Toolchain building is not stopped due
> to this error.

The cross-compiler is not used at the time of 'make headers-install'.
So, those are spurious errors of the Linux buildsystem.

They can/should be safely ignored.

(Side note: ARC is not the only arch that exhibit this behaviour. IIRC,
cris, hexagon, ia64, parisc, score and xtensa behave the same, with ia64
in an aggaravated way.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
