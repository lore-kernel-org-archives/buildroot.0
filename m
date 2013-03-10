From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 14:52:01 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <20130310145201.60cc8b1c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 23:04:39 +0100, Yann E. MORIN wrote:

>  ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
> +ifeq ($(BR2_PACKAGE_HOST_E2FSPROGS),y)
> +ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
> +endif

I believe the ifeq () here is useless: you are anyway selecting
BR2_PACKAGE_HOST_E2FSPROGS from BR2_TARGET_ROOTFS_EXT2.

Initially, I was confused by this test: it would mean that you could
potentially work without host-e2fsprogs, which isn't the case.

> +EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
>  
>  define ROOTFS_EXT2_CMD
> -	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> +	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
>  endef

Why PATH=$(TARGET_PATH) ? I know it was like this, but HOST_PATH would
be more appropriate. That said, it's completely silly to have both
TARGET_PATH and HOST_PATH, since they are essentially the same thing.

Also, why do you pass GEN= in the environment? Other options are passed
through normal command line options, so it's strange to move away from
this idea just for GEN=<foo>, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
