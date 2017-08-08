From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Aug 2017 18:07:29 +0200
Subject: [Buildroot] [PATCH] mutt: fix build with
 BR2_PACKAGE_SKELETON_NONE
In-Reply-To: <20170807175732.leo6oj2but7lpu5p@tarshish>
References: <23d9ad1d2c270c942d286f0fdf779dabfb876ffd.1502042905.git.baruch@tkos.co.il>
 <20170806204433.GC2921@scaer>
 <20170807175732.leo6oj2but7lpu5p@tarshish>
Message-ID: <20170808160729.GB3441@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-08-07 20:57 +0300, Baruch Siach spake thusly:
> On Sun, Aug 06, 2017 at 10:44:33PM +0200, Yann E. MORIN wrote:
> > On 2017-08-06 21:08 +0300, Baruch Siach spake thusly:
> > > BR2_PACKAGE_SKELETON_NONE does not provide the /var subdirectory which break
> > > symlink creation in that directory. Ignore the symlink creation error. It is
> > > up to the user to provide a functional skeleton.
> > 
> > Note that this defconfig does not use a custom skeleton; it uses the
> > default skeleton. In this situation, the user is not providing the
> > skeleton, so he has no chance to "provide a functional skeleton."
> > 
> > Instead, we must ensure that our default skeleton for the "none" init
> > system is correct.
> > 
> > So, we have two options:
> >   - provide /var in the skeleton-none
> >   - have mutt do the mkdir as it needs it
> > 
> > My preference goes with the second solution, because it looks to me that
> > it is the best solution: mutt needs /var? Then it has to ensure that
> > /var exists before it uses it.
> > 
> > I do agreee however that one may consider that /var is a "magic"
> > directory, like /etc or /bin and /lib, and that it should always exist.
> 
> So do you think it is a good idea to add /var to skeleton-common? Maybe 
> skeleton-none only?

WE should not add /var to skeleton-common, because it is used by both
sys-v and systemd skeletons, and the systemd skeleton wants /var to be a
symlink in case the roots is readonly. Which was all the point of the
biggish skeleton rework series that has been merged a few days ago.

So, no /var is skeleton-common, ever, please. ;-)

> > Nonetheless, I believe the second solution is still technically better,
> > because it does not make any assumption.
> > 
> > Care to respin by doing an mkdir, please?
> 
> Done.

Thanks. I see it was just applied, good! :-)

Regards,
Yann E. MORIN.

> baruch
> 
> > > Fixes:
> > > http://autobuild.buildroot.net/results/32d/32dff0df759baf1120e4f11335e735eb0708b237/
> > > 
> > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > > ---
> > >  package/mutt/mutt.mk | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> > > index abd40e5dd612..447c336b4893 100644
> > > --- a/package/mutt/mutt.mk
> > > +++ b/package/mutt/mutt.mk
> > > @@ -66,7 +66,7 @@ MUTT_CONF_ENV += \
> > >  MUTT_CONF_OPTS += --with-mailpath=/var/mail
> > >  
> > >  define MUTT_VAR_MAIL
> > > -	ln -sf /tmp $(TARGET_DIR)/var/mail
> > > +	-ln -sf /tmp $(TARGET_DIR)/var/mail
> > >  endef
> > >  MUTT_POST_INSTALL_TARGET_HOOKS += MUTT_VAR_MAIL
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
