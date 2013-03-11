From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Mar 2013 22:21:14 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <201303110120.28329.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
 <20130310145201.60cc8b1c@skate>
 <201303110120.28329.yann.morin.1998@free.fr>
Message-ID: <20130311222114.7153613e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 11 Mar 2013 01:20:28 +0100, Yann E. MORIN wrote:

> > > +EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
> > >  
> > >  define ROOTFS_EXT2_CMD
> > > -	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> > > +	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> > >  endef
> > 
> > Why PATH=$(TARGET_PATH) ? I know it was like this, but HOST_PATH would
> > be more appropriate. That said, it's completely silly to have both
> > TARGET_PATH and HOST_PATH, since they are essentially the same thing.
> 
> Well, ask Peter! ;-)
>     http://git.buildroot.org/buildroot/commit/fs/ext2/ext2.mk?id=fb951b9

Huhu. We should probably have one single <something>_PATH variable,
doesn't make much sense to have HOST_PATH and TARGET_PATH. But fair
enough, that's another topic not related at all with the present patch
set.

> > Also, why do you pass GEN= in the environment? Other options are passed
> > through normal command line options, so it's strange to move away from
> > this idea just for GEN=<foo>, no?
> 
> That's what I initially did, but Arnout suggested to pass it in the env
> instead:
>     http://lists.busybox.net/pipermail/buildroot/2013-February/067488.html
>     http://lists.busybox.net/pipermail/buildroot/2013-February/067552.html
> 
> The problem I see with passing it as an option is that it is not a valid
> option for genext2fs, and it means we have to reconstruct the genext2fs
> options in the script, which is a bit ugly, as you can see in my previous
> submission.

Ok, fair enough, I'm fine with the environment variable. Not entirely
pretty, but the other option isn't either. So just let's go with the
existing code.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
