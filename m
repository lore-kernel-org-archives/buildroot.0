From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jul 2016 09:26:35 +0200
Subject: [Buildroot] [PATCH 16/24 v2] package/skeleton: split into sysv
 and custom skeleton
In-Reply-To: <b14280cd-3b1a-8950-7642-b447bc944f4e@gmail.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <f1043a01854ac5436fe818f3342f5674107748fc.1466622379.git.yann.morin.1998@free.fr>
 <b14280cd-3b1a-8950-7642-b447bc944f4e@gmail.com>
Message-ID: <20160705072635.GB6533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-03 12:27 +0200, Romain Naour spake thusly:
> Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> > Currently, both the sysv-like and custom skeletons are managed in a
> > single package.
> > 
> > However, for the custom skeleton, we basically do nothing, except for
> > a few symlinks for the /lib directory aliases, and a few checks about
> > merged /usr.
> > 
> > OTOH, for the default (sysv-like) skeleton, we do a lot more things,
> > like tweaking the issue, the hostname, setting the root password and so
> > on...
> > 
> > Furthermore, we're soon gonna have a skeleton for each kind of init
> > system, be it sysv-based or systemd.
> > 
> > So, it makes sense to offload the custom skeleton management to its own
> > package.
> > 
> > We change the way we check for the merged /usr readiness, from checking
> > at make parse time, to a configure command. This has virtually zero
> > impact, since the skeleton is the very first package to be "built", so
> > its configure commands are the very first to be run. It however slightly
> > cimplifies the .mk as we need not enclose the parse-time checks inside
>   ^
> s/cimplifies/simplifies/

Fixed.

[--SNIP--]
> > diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
> > new file mode 100644
> > index 0000000..0a2f51b
> > --- /dev/null
> > +++ b/package/skeleton-sysv/skeleton-sysv.mk
> > @@ -0,0 +1,126 @@
> > +################################################################################
> > +#
> > +# skeleton-sysv
> > +#
> > +################################################################################
> > +
> > +SKELETON_SYSV_SOURCE =
> > +
> > +SKELETON_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
> > +SKELETON_SYSV_ADD_SKELETON_DEPENDENCY = NO
> > +
> > +SKELETON_SYSV_INSTALL_STAGING = YES
> > +
> > +# Provided by the 'skeleton' package:
> > +# - SKELETON_USR_SYMLINKS_OR_DIRS
> > +# - SKELETON_LIB_SYMLINK
> > +# - SKELETON_TARGET_GENERIC_HOSTNAME
> > +# - SKELETON_TARGET_GENERIC_ISSUE
> > +# - SKELETON_TARGET_ROOT_PASSWD
> > +# - SKELETON_TARGET_GENERIC_BIN_SH
> > +# - SKELETON_TARGET_GENERIC_GETTY_PORT
> > +# - SKELETON_TARGET_GENERIC_GETTY_BAUDRATE
> > +# - SKELETON_TARGET_GENERIC_GETTY_TERM
> > +# - SKELETON_TARGET_GENERIC_GETTY_OPTIONS
> > +# - SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK
> > +# - SKELETON_SET_NETWORK_IFUPDOWN_DHCP
> > +
> > +define SKELETON_INSTALL_TARGET_CMDS
> 
> s/SKELETON_INSTALL_TARGET_CMDS/SKELETON_SYSV_INSTALL_TARGET_CMDS/

Good catch, fixed.

[--SNIP--]
> Have you considered to convert skeleton package to a virtual package with
> skeleton-sysv and skeleton-custom as providers ?

Have you considered looking at the following patch? ;-)
(I know you have!)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
