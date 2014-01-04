From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 4 Jan 2014 17:43:38 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: add support for squashfs
In-Reply-To: <f19557ea778ede9bf0de8be578a2fdd6cdd1785c.1388768519.git.yann.morin.1998@free.fr>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <f19557ea778ede9bf0de8be578a2fdd6cdd1785c.1388768519.git.yann.morin.1998@free.fr>
Message-ID: <CAGduivx8F02CaJ52nnv6pFKPTJ_4LCBAKymu0RQeoBhtrC8NOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Jan 3, 2014 at 6:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  docs/manual/partition-layout.txt | 11 ++++++++++-
>  fs/custom/fs/squashfs            | 19 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 fs/custom/fs/squashfs
>
> diff --git a/docs/manual/partition-layout.txt b/docs/manual/partition-layout.txt
> index 092ae1b..e9027bf 100644
> --- a/docs/manual/partition-layout.txt
> +++ b/docs/manual/partition-layout.txt
> @@ -133,7 +133,8 @@ Properties for +type=fs+
>
>  * +fs_type+ (mandatory): the type of filesystem to generate
>  ** +ext+: generate an extended filesystem (ext2, ext3, ext4)
> -** +vfat+: generate a VFAT filesystem (FAT16, FAT32)
> +** +squashfs+: generate a squashfs (version 4) filesystem
> +** +vfat+: generate a VFAT filesystem (FAT12, FAT16 or FAT32)
>
>  * +fs_label+ (optional): the label to assign to this filesystem, if that
>    filesystem supports a label
> @@ -177,6 +178,14 @@ Properties for +fs_type=ext+
>  ** +1+ (mandatory for ext3 or ext4): generate a revision 1 extended
>     filesystem
>
> +Properties for +fs_type=squashfs+
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +* +squashfs_comp+ (mandatory): the compression type to use
> +** +gzip+, +xz+, +lzo+: gzip, xz or lzo compression
> +
> +* +squashfs_block+ (optional): the size of blocks, in bytes
> +
>  Properties for +fs_type=vfat+
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> diff --git a/fs/custom/fs/squashfs b/fs/custom/fs/squashfs
> new file mode 100644
> index 0000000..132d3ef
> --- /dev/null
> +++ b/fs/custom/fs/squashfs
> @@ -0,0 +1,19 @@
> +# Create a squashfs filesystem
> +
> +#-----------------------------------------------------------------------------
> +DEPENDS+=( squashfs )
> +
> +#-----------------------------------------------------------------------------
> +do_image() {
> +    local root_dir="${1}"
> +    local img="${2}"
> +    local -a fs_opts
> +
> +    fs_opts+=( -no-progress -noappend )
> +    [ -z "${squashfs_comp}"  ] || fs_opts+=( -comp "${squashfs_comp}" )
It just a question of taste, but I really do prefer to read something like:
[ -n "${squashfs_comp}"  ] && fs_opts+=( -comp "${squashfs_comp}" )
But that's just a personal taste.
> +    [ -z "${squashfs_block}" ] || fs_opts+=( -b ${squahsfs_block} )
> +
> +    mksquashfs "${root_dir}" "${img}" "${fs_opts[@]}" >/dev/null
> +}
> +
> +# vim: ft=sh
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks !
