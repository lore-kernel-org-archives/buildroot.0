From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 12 Feb 2016 23:28:20 +0100
Subject: [Buildroot] [PATCH 03/16 v4] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <821b8ea9cd929a6c05b715d12e99f3da00aa9ed4.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <821b8ea9cd929a6c05b715d12e99f3da00aa9ed4.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <56BE5C84.8050602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 03/02/2016 23:21, Yann E. MORIN wrote:
> This macro will try to copy a source file into a destination directory,
> by first attempting to hard-link, and falling back to a plain copy.
> 
> In some situations, it will be necessary that the destination file is
> named differently than the source (e.g. due to a re-numbering), so if a
> third argument is specified, it is treated as the basename of the
> destination file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> [Ran 'make legal-info' with output dir on {the same,another} fs]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v3 -> v4:
>   - forcibly remove destination file first  (Arnout, Luca)
>   - typoes  (Luca)
>   - drop trailing slash in destination directory name
> 
> Changes v2 -> v3;
>   - use "ln" instead of "cp -l"
>   - accept third argument, as the basename of the destination file
>   - drop reviewed-by and tested-by tags given in v2, due to the above
>     two changes
> 
> Changes RFC -> v1:
>   - move to pkg-utils  (Luca)
> ---
>  package/pkg-utils.mk | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 44bd2c9..ed05964 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -113,6 +113,35 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
>  endif
>  endef
>  
> +################################################################################
> +# hardlink-copy -- hardlink source and destination if possible, otherwise
> +# do a simple copy
> +#
> +# argument 1 is the source *file*
> +# argument 2 is the destination *directory*
> +# argument 3 is the basename of the destination file (optional, defaults to
> +#            the basename of the source file.
> +#
> +# examples:
> +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir)
> +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir,new-name)
> +#
> +# Note: we make that a single command, so we can:
> +#  - use '$(Q)' in front of it and properly silence the whole macro,
> +#  - use '|| exit 1' after it, so we can exit on error in compound commands.
> +#
> +# Note-2: we do not introduce any intermediate shell variables because we can't
> +# guarantee the number of expansions (as $-signs) we'll need.
> +################################################################################
> +define hardlink-copy
> +	{ mkdir -p $(2) && \
> +	  rm -f        $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) && \
> +	  { ln -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) 2>/dev/null || \
> +	    cp -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))); \
> +	  } \
> +	}
> +endef

Unfortunately this version of the patch does not seem to work, although
I can't wrap my head around the reason. What's happening is _weird_.

If I apply all of your patches up to 10/16, 'make legal-info' works. If
I add patch 11 ("core/legal-info: also save patches"), it does not. Add
patch 12 and it works again.

On patch 11, when I run 'make legal-info' I get:

$ cat defconfig
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_SYSTEM_DHCP="eth0"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
$ make clean
[...]
$ make legal-info
[...]
>>> busybox 1.24.1 Patching

Applying 0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
using patch:
patching file networking/libiproute/iplink.c

Applying 0002-unzip.patch using patch:
patching file archival/libarchive/decompress_gunzip.c
patching file testsuite/unzip.tests

Applying 0003-g-unzip-fix-recent-breakage.patch using patch:
patching file archival/libarchive/decompress_gunzip.c
patching file testsuite/unzip.tests

Applying 0004-truncate-open-mode.patch using patch:
patching file coreutils/truncate.c

Applying 0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
using patch:
patching file Makefile.flags
Hunk #1 succeeded at 148 (offset 7 lines).
cp: cannot create regular file
'/home/murray/devel/buildroot/output/legal-info/sources/busybox-1.24.1//home/murray/devel/buildroot/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch':
No such file or directory
make[1]: *** [busybox-legal-info] Error 1
make: *** [_all] Error 2
$

Notice the `pwd`/package/busybox/ prefix has not been removed from
the name of the destination file. The issue materializes in
hardlink-copy, so I instrumented it this way:

 define hardlink-copy
	{ mkdir -p $(2) && \
+	  echo "__1_$(1)_" && \
+	  echo "_n1_$(notdir $(1))_" && \
+	  echo "__2_$(2)_" && \
+	  echo "__3_$(3)_" && \
	  rm -f $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) && \
	  { ln -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1)))
2>/dev/null || \
	  cp -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))); \

And I get the following debug messages:

__1_ /home/murray/src/busybox-1.24.1.tar.bz2_
_n1_busybox-1.24.1.tar.bz2_
__2_ /home/murray/devel/buildroot/output/legal-info/sources/busybox-1.24.1_
__3__
__1_/home/murray/devel/buildroot/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch_
_n1_/home/murray/devel/buildroot/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch_
__2_/home/murray/devel/buildroot/output/legal-info/sources/busybox-1.24.1_
__3__

The first 4 lines are output when saving the tarball. See the
difference between the line prefixed with __1_ and the one prefixed
with _n1_. Clearly $(notdir) has removed the directory prefix, which
is correct.

On the next 4 lines we have the failing file, which is a patch. Here
it looks like $(notdir) has done nothing.

This explains why the issue disappears applying up to patch 12: the
patch renumbering added by patch 12 uses the third parameter to
hardlink-copy, which bypasses the call to $(notdir).

I noticed $1 and $2 have a leading space in the first call, but it is
not related to the problem. I tried adding/removing the space,
without any change. This is correct according to the documentation
for $(notdir): "...everything through the last slash is removed".

This is the best I could understand at the moment... :-(

-- 
Luca
