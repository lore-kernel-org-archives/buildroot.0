From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Dec 2013 18:12:53 +0100
Subject: [Buildroot] [PATCH 1/4] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <8738lmgnsu.fsf@dell.be.48ers.dk>
References: <cover.1387578655.git.yann.morin.1998@free.fr>
 <64a7e3a995100104cdebd681621a9abb510a1820.1387578655.git.yann.morin.1998@free.fr>
 <20131221094905.2641a84f@skate> <8738lmgnsu.fsf@dell.be.48ers.dk>
Message-ID: <20131221171253.GA3481@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2013-12-21 17:40 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear Yann E. MORIN,
>  > On Fri, 20 Dec 2013 23:32:54 +0100, Yann E. MORIN wrote:
> 
>  >> +Requirements on host packages
>  >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  >> +
>  >> +Depending on what types of partitioning and filesystems are used by your
>  >> ++partition table layout description+, you may have to enable some
>  >> +host-packages in the +Host utilities+ sub-menu.
>  >> +
>  >> +Since the content of a +partition table layout description+ is very
>  >> +specific to a board and/or a project, there is no way for Buildroot to
>  >> +automatically select those host packages, and thus it is your
>  >> +responsibility to select the appropriate ones.
>  >> +
>  >> +For example, for an MBR partitioning, you will have to enable the +host
>  >> +genpart+ package. For FAT filesystems, you will have to enable both of
>  >> ++host dosfstools+ and +host mtools+.
> 
>  > I'll have other comments about the genimages stuff later on, but I got
>  > an idea this night about this specific problem. I don't really like the
>  > fact that the user has to manually enable in menuconfig the relevant
>  > host tools, depending on his genimage .ini configuration file.
> 
>  > What about doing something like:
> 
>  > ROOTFS_CUSTOM_DEPENDENCIES = $(shell fs/custom/genimages --show-depends \
>  > 				'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'
> 
>  > The --show-depends option of genimages would, instead of doing the
>  > normal genimages work, simply parse the .ini file, and return a space
>  > separated list of dependencies needed by the ROOTFS_CUSTOM stuff. Not
>  > only this would make the dependencies automatic for the user, but also
>  > it would allow you to remove the following piece of code from the
>  > custom.mk file:
> 
> Sounds good to me.

Yep, I've implemented that now, and it seems to work pretty well.

> They won't actumatically get selected in kconfig
> though, but that might not be such a big deal (do they still even need
> to be visible in kconfig?)

Yes, in case someone wants to generate filesystem images with a
post-build script, and not with genimages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
