From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2016 22:52:04 +0100
Subject: [Buildroot] [PATCH 1/1] added option to enable or disable
 reboot on ctrl-alt-del
In-Reply-To: <87y4c6mlfx.fsf@dell.be.48ers.dk>
References: <1451773503-11764-1-git-send-email-felten@vaxnet.de>
 <87y4c6mlfx.fsf@dell.be.48ers.dk>
Message-ID: <20160103215204.GA3551@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lothar, Peter, All,

On 2016-01-03 21:56 +0100, Peter Korsgaard spake thusly:
> >>>>> "lothar" == lothar felten <felten@vaxnet.de> writes:
> 
>  > From: felten <felten@vaxnet.de>
>  > Signed-off-by: lothar felten <felten@vaxnet.de>
> 
> I'm not sure this is something that needs to be tweaked often enough
> (E.G. most systems don't have a keyboard connected), so I'm not sure we
> want the clutter the system menu with the option.
> 
> Perhaps we should simply remove the ctrlaltdel handling of our inittabs,
> as most people probably don't want it - And then just let the (few?)
> people wanting it add it through an overlay / post-build script.
> 
> Comments anyony?

FTR, here's a repeat from IRC:

I do agree with Peter. Just disabling the 3-finger salute is OK for me.
As Lothar suggested, I don;t mind the line being kept as comments in the
inittabs.

Lothar, I'll mark your patch as "Changes Requested" in our patchwork.
Care to send an update, please?

Thanks!

Regards,
Yann E. MORIN.

> > ---
>  >  package/skeleton/skeleton.mk | 12 ++++++++++++
>  >  system/Config.in             | 10 ++++++++++
>  >  2 files changed, 22 insertions(+)
> 
>  > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>  > index d640e24..7c9d8ed 100644
>  > --- a/package/skeleton/skeleton.mk
>  > +++ b/package/skeleton/skeleton.mk
>  > @@ -230,6 +230,18 @@ define SKELETON_SYSTEM_REMOUNT_RW
>  >  endef
>  >  endif
>  >  TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_REMOUNT_RW
>  > +ifeq ($(BR2_TARGET_GENERIC_ENABLE_CTRL_ALT_DEL),y)
>  > +# Find commented line, if any, and remove leading '#'s
>  > +define SKELETON_SYSTEM_ENABLE_CTRL_ALT_DEL
>  > +	$(SED) '/^#.*ctrlaltdel.*$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
>  > +endef
>  > +else
>  > +# Find uncommented line, if any, and add a leading '#'
>  > +define SKELETON_SYSTEM_ENABLE_CTRL_ALT_DEL
>  > +	$(SED) '/^[^#].*ctrlaltdel.*$$/s~^~#~' $(TARGET_DIR)/etc/inittab
>  > +endef
>  > +endif
>  > +TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_ENABLE_CTRL_ALT_DEL
>  >  endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
>  
>  >  endif # BR2_ROOTFS_SKELETON_DEFAULT
>  > diff --git a/system/Config.in b/system/Config.in
>  > index 2e14971..e3ff125 100644
>  > --- a/system/Config.in
>  > +++ b/system/Config.in
>  > @@ -347,6 +347,16 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  >  	  read-only.
>  >  	  If unsure, say Y.
>  
>  > +config BR2_TARGET_GENERIC_ENABLE_CTRL_ALT_DEL
>  > +	bool "enable system reboot on ctrl-alt-del"
>  > +	default y
>  > +	help
>  > +	  By default, pressing ctrl-alt-del will reboot the system by invoking
>  > +	  the reboot command.
>  > +	  Say no here if you would rather like your system to ignore the
>  > +	  ctrl-alt-del combination.
>  > +	  If unsure, say y.
>  > +
>  >  endif # BR2_ROOTFS_SKELETON_DEFAULT
>  
>  
>  > -- 
>  > 1.9.1
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> -- 
> Bye, Peter Korsgaard
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
