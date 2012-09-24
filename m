From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Sep 2012 22:28:22 +0200
Subject: [Buildroot] [PATCH 1/3] New top-level directory: system
In-Reply-To: <201209242209.50482.yann.morin.1998@free.fr>
References: <cover.1348468443.git.thomas.petazzoni@free-electrons.com>
 <d1e6b9d55b385bee2d698c950a610d52fffd2d95.1348468443.git.thomas.petazzoni@free-electrons.com>
 <201209242209.50482.yann.morin.1998@free.fr>
Message-ID: <201209242228.22916.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 24 September 2012 22:09:50 Yann E. MORIN wrote:
> On Monday 24 September 2012 08:34:29 Thomas Petazzoni wrote:
> > This directory groups the following elements:
> >  * the default root filesystem skeleton
> >  * the default device tables
> >  * the Config.in options for system configuration (UART port for
> >    getty, system hostname, etc.)
> >  * the make rules to apply the system configuration options
> [--SNIP--]
> > diff --git a/Makefile b/Makefile
> > index 6536bca..ac4aa39 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -309,7 +309,6 @@ endif
> >  include package/*/*.mk
> >  
> >  include boot/common.mk
> > -include target/Makefile.in
> >  include linux/linux.mk
> >  
> >  TARGETS+=target-finalize
> > @@ -324,6 +323,7 @@ TARGETS+=target-generatelocales
> >  endif
> >  endif
> >  
> > +include system/system.mk
> >  include fs/common.mk
> >  
> >  TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
> 
> I don't know why, but now the build is broken:
> 
>     make defconfig
>     make
>     [--SNIP a lot of lines and a long time to build--]
>     /bin/sed -i -e '$a \127.0.1.1\tbuildroot' \
>           -e '/^127.0.1.1/d' /home/ymorin/dev/buildroot/O001/target/etc/hosts
>     /bin/sed: can't read /home/ymorin/dev/buildroot/O001/target/etc/hosts: No
>     such file or directory
> 
> Looks like the skeleton is not copied.
> 
> I've tried moving back the include to the place its predecessor used to be
> (ie., moved it back in place of 'include target/Makefile.in'), but no matter
> what, the build is still broken the same way (although I'll double check
> again in a moment)...

Confirmed: moving the 'include system/system.mk' back to where the previous
'include target/Makefile.in' was yields a build with the same error.

I was unable to identify the root cause for this failure... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
