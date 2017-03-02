From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 11:34:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: use mkfs to generate
 rootfs image
In-Reply-To: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20170302113411.26bd85f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 10:06:16 +0100, S?bastien Szymanski wrote:
> mkfs is now capable of generating rootfs images. Use mkfs intead of
> genext2fs.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/mke2img/Config.in.host |  1 -
>  package/mke2img/mke2img        | 58 +++++++++++++++++-------------------------
>  package/mke2img/mke2img.mk     |  2 +-
>  3 files changed, 25 insertions(+), 36 deletions(-)

Thanks for working on this, definitely very useful.

Do we still need the mke2img wrapper script? The only reason why this
wrapper script was created is because genext2fs was too stupid, and
many things had to be done "by hand" (like calling tune2fs, etc.) and
it became too nasty to do in fs/ext2/ext2.mk.

Now that we use mkfs, is it possible to get rid of mke2img entirely?

> +    # Disable some defaults features
> +    mkfs_O_opts+=",^ext_attr,^64bit,^flex_bg,^large_file,^huge_file,^dir_nlink,^extra_isize"

Why would we disable these default features

> +    # Running e2fsck will ensure coherency of the filesystem,
> +    # although it is not required.

If we use mkfs, I don't think calling e2fsck. It was really needed
between genext2fs and tune2fs, but I don't think it's needed anymore
now.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
