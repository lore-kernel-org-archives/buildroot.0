From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 14:12:05 +0200
Subject: [Buildroot] [PATCH 1/1] git: Fix libintl linking if there is no
 full gettext support
In-Reply-To: <CAMw6YJKnyLbSO7FMf5ws5_vnEKS8TkZY1u_598YddvOm79J4GA@mail.gmail.com>
References: <20180824132049.20330-1-vadim4j@gmail.com>
 <20180824230917.20aaff8e@windsurf>
 <CAMw6YJKnyLbSO7FMf5ws5_vnEKS8TkZY1u_598YddvOm79J4GA@mail.gmail.com>
Message-ID: <20180825141205.4c5c7667@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Sat, 25 Aug 2018 14:24:37 +0300, Vadim Kochan wrote:

> > Could you give some minimal Buildroot configuration that exhibits the
> > issue ?  
> 
> So I just did:
> 1) make menuconfig
> 2) Toolchain -> WCHAR
> 3) System -> NLS
> 4) Target packages -> Development -> git
> 
> I attached also config file w/o '#' and empty lines.
> 
> P.S.
> Not sure if the fix is good, will try to cook v2 ...

OK, I can reproduce (we should really add some testing for NLS enabled
in our autobuilders, let's do this after the 2018.08 release). However,
the proper fix is:

 ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 GIT_MAKE_OPTS += NO_GETTEXT=1
+else
+GIT_EXTLIBS += $(TARGET_NLS_LIBS)
 endif

TARGET_NLS_LIBS is automaticaly set to -lintl when gettext provides the
full libintl library we need to link against.

Could you test this, and send an updated patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
