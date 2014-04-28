From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 28 Apr 2014 16:25:21 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <CAEzGmjByYAXYo2bbnKqRcu4nzJfjbEz8ZsaiB_MdSNQgDs2M3Q@mail.gmail.com>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <20140427213936.6262021b@tux>
 <CAEzGmjByYAXYo2bbnKqRcu4nzJfjbEz8ZsaiB_MdSNQgDs2M3Q@mail.gmail.com>
Message-ID: <5293482.NlRU5sky3t@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 28 April 2014 14:33:19 Lennart Ramberg wrote:
> On Sun, Apr 27, 2014 at 9:39 PM, Bj?rn Kirchner <bjoern@am-soft.de> wrote:
> > The instructions refered to grub-legacy. I thougt you would use
> > grub-legacy because you wrote you could not select grub2.
> > In buildroot 2013.08 there is a /sbin/grub in the rootfs image,
> > if in the .config "BR2_TARGET_GRUB=y" is set. But there is no
> > "BR2_TARGET_GRUB_FS_EXT2" in my .config.
> 
> Hi Bj?rn,
> Yes, I am talking about grub-legacy only.
> 
> Maybe I should wait for grub2. Is that to be expected in the next stable
> release, anyone?

I did not check how it work exactly with grub-legacy. However, I can 
give you my recipe to get full disk image using grub2:

 * First cherry-pick c24fdb3 to get support of grub2 (I also work in 
   2014.02 and I had no problem to backport this commit)

 * Select BR2_PACKAGE_HOST_GENIMAGE, BR2_TARGET_GRUB2 and 
   BR2_TARGET_ROOTFS_EXT2 in your configuration

 * Add a boot/grub/grub.cfg to your overlay (you may also embed it in 
   grub, but i have some issues with that)

 * Add a configuration file for host-genimage:

genimage.cfg:
-----------8<--------------------------------8<------------------------
image hdimg.img {
        hdimage {
                align = 1M
        }
        partition boot {
                in-partition-table = "no"
                image = "boot.img"
                offset = 0
                size = 512
        }
        partition grub {
                 in-partition-table = "no"
                 image = "grub.img"
                 offset = 512
        }
        partition root {
                # size = 1G
                partition-type = 0x83
                image = "rootfs.ext2"
        }
}

config {
        outputpath = images
        inputpath = images
        #rootpath = target
        rootpath = empty
        tmppath = tmp
}
---------->8------------------------------->8--------------------------

  * Add a BR2_ROOTFS_POST_IMAGE_SCRIPT to create boot.img, grub.img[1] 
and final image:

postimage.sh:
-----------8<--------------------------------8<------------------------
#!/bin/bash

BOARD_DIR=$(dirname $(readlink -f $0))
IMAGE_DIR=$(readlink -f $1)
HOST_DIR=$(readlink -f $2)
PATH=$HOST_DIR/usr/bin:$HOST_DIR/host/usr/sbin:$PATH

cp $HOST_DIR/usr/lib/grub/i386-pc/boot.img $IMAGE_DIR
grub-mkimage -d $HOST_DIR/usr/lib/grub/i386-pc -O i386-pc -o 
$IMAGE_DIR/grub.img -p "(hd0,msdos1)/boot/grub" boot linux ext2 fat part_msdos 
normal biosdisk help ls minicmd serial

pushd $IMAGE_DIR/..
  mkdir -p empty
  genimage --config $BOARD_DIR/genimage.cfg || exit 1
popd
---------->8------------------------------->8--------------------------

 * In order to pass path of boot.img to this script, you also have to 
    set BR2_ROOTFS_POST_SCRIPT_ARGS="$(HOST_DIR)"


[1] Buildroot automatically generate grub.img. However, it looks like 
it is necessary to force a specific prefix (-p option) in order to have 
a bootable image.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
