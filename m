From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 01:20:28 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <20130310145201.60cc8b1c@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
 <20130310145201.60cc8b1c@skate>
Message-ID: <201303110120.28329.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 23:04:39 +0100, Yann E. MORIN wrote:
> 
> >  ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
> > +ifeq ($(BR2_PACKAGE_HOST_E2FSPROGS),y)
> > +ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
> > +endif
> 
> I believe the ifeq () here is useless: you are anyway selecting
> BR2_PACKAGE_HOST_E2FSPROGS from BR2_TARGET_ROOTFS_EXT2.

Oh, right, we just have to have an unconditional dependency.

> Initially, I was confused by this test: it would mean that you could
> potentially work without host-e2fsprogs, which isn't the case.

That was just a remnant from when e2fsprogs was a dependency only
for ext3 and ext4. Now, we need it for ext2, too.

Nice catch! :-)

> > +EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
> >  
> >  define ROOTFS_EXT2_CMD
> > -	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> > +	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> >  endef
> 
> Why PATH=$(TARGET_PATH) ? I know it was like this, but HOST_PATH would
> be more appropriate. That said, it's completely silly to have both
> TARGET_PATH and HOST_PATH, since they are essentially the same thing.

Well, ask Peter! ;-)
    http://git.buildroot.org/buildroot/commit/fs/ext2/ext2.mk?id=fb951b9

> Also, why do you pass GEN= in the environment? Other options are passed
> through normal command line options, so it's strange to move away from
> this idea just for GEN=<foo>, no?

That's what I initially did, but Arnout suggested to pass it in the env
instead:
    http://lists.busybox.net/pipermail/buildroot/2013-February/067488.html
    http://lists.busybox.net/pipermail/buildroot/2013-February/067552.html

The problem I see with passing it as an option is that it is not a valid
option for genext2fs, and it means we have to reconstruct the genext2fs
options in the script, which is a bit ugly, as you can see in my previous
submission.

But I do not have a strong opinion either...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
