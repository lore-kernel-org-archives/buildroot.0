From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 18:49:17 +0200
Subject: [Buildroot] [PATCH 02/24 v2] system: sysvinit only selects
 busybox-show-others if busybox is enabled
In-Reply-To: <927864ad-b946-bf1a-8317-c8244fc8358a@gmail.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <a6739dce77434d44e657409dcc953ec3532789c1.1466622379.git.yann.morin.1998@free.fr>
 <927864ad-b946-bf1a-8317-c8244fc8358a@gmail.com>
Message-ID: <20160704164917.GG3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-03 09:53 +0200, Romain Naour spake thusly:
> Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is a bit special. When Busybox is
> > enabled, it is a Busybox option. When Busybox is not enabled, it is a
> > stand-alone option, forcibly enabled.
> > 
> > So we can safely 'select' it without ensuring (via a 'depends on' or
> > another 'select') that Busybox is enabled.
> > 
> > However, the name of this option does not express the fact that it is
> > safe to select it without checking Busybox, which can lead to a bit of
> > time-consuming head-scratching.
> > 
> > To avoid future puzzlement from an unsuspecting observer, consider this
> > to be a Busybox option, and only select it when Busybox is enabled.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> Not related to your patch but should we do the same change for tovid and systemd
> packages which select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS ?

Indeed, but in retrospect, I think I should drop this patch
altogether...

This option is really special, so I think a better solution would
probably to add a big fat comment above that option that basically
states that:

    # This option is not an option of Busybox, it canbe selected even
    # if Busybox is not enabled.

I'll do that in a follow-up series.

Thanks for the review! ;-)

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> > 
> > ---
> > Changes v1 -> v2:
> >   - only select if busybox is enabled  (Thomas)
> > 
> > ---
> > Hopefully, this will avoid people to go hunting like I did, and loose a
> > few precious minutes of hair-pulling... ;-]
> > ---
> >  system/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/system/Config.in b/system/Config.in
> > index 9441467..2d20230 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -74,7 +74,7 @@ config BR2_INIT_BUSYBOX
> >  
> >  config BR2_INIT_SYSV
> >  	bool "systemV"
> > -	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
> > +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # sysvinit
> >  	select BR2_PACKAGE_INITSCRIPTS
> >  	select BR2_PACKAGE_SYSVINIT
> >  
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
