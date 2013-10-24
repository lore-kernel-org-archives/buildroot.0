From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 24 Oct 2013 13:06:43 -0500
Subject: [Buildroot] [git commit] Makefile: export BUILD_DIR
In-Reply-To: <20131024064830.61FC19BB90@busybox.osuosl.org>
References: <20131024064830.61FC19BB90@busybox.osuosl.org>
Message-ID: <OF5F29E93C.F28E759E-ON86257C0E.0062B22A-86257C0E.00637BA8@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Can we please revert this change? It is causing issues with building 
u-boot
as seen by the autobuilder logs:

http://autobuild.buildroot.net/results/1f6/1f65289d5c284caa82a4e9137613f792797ee08a/build-end.log
http://autobuild.buildroot.net/results/6a5/6a5f77483e908dc96d08824cf9113402431bace7/build-end.log

Exporting BUILD_DIR is dangerous for u-boot as shown by the following 
excerpt
from the uboot/Makefile:

#########################################################################
#
# U-boot build supports generating object files in a separate external
# directory. Two use cases are supported:
#
# 1) Add O= to the make command line
# 'make O=/tmp/build all'
#
# 2) Set environment variable BUILD_DIR to point to the desired location
# 'export BUILD_DIR=/tmp/build'
# 'make'
#
# The second approach can also be used with a MAKEALL script
# 'export BUILD_DIR=/tmp/build'
# './MAKEALL'
#
# Command line 'O=' setting overrides BUILD_DIR environment variable.
#
# When none of the above methods is used the local build is performed and
# the object files are placed in the source directory.
#

The credit should go to Gustavo Zacarias for figuring this issue out
and saving me a lot of headache.

Thanks,
-Ryan

Peter Korsgaard <peter@korsgaard.com> wrote on 10/24/2013 01:47:16 AM:

> commit: 
http://git.buildroot.net/buildroot/commit/?id=feb0877015cc0c644129e69276b3000c83742750

> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> $(BUILD_DIR) is a nice place to put files generated during the build.
> With the advent of user-supplied step-hooks, they may want to store
> some information on the build.
> 
> Export BUILD_DIR to that effect; update manual accordingly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Makefile                         |    1 +
>  docs/manual/customize-rootfs.txt |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f266e2d..9528703 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -291,6 +291,7 @@ export STAGING_DIR
>  export HOST_DIR
>  export BINARIES_DIR
>  export BASE_DIR
> +export BUILD_DIR
> 
> 
################################################################################
>  #
> diff --git a/docs/manual/customize-rootfs.txt 
b/docs/manual/customize-rootfs.txt
> index 49a6b4b..158389c 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -41,6 +41,7 @@ there are a few ways to customize the resulting target 
filesystem.
>      - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
>      - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
>        xref:generic-package-reference[]
> +    - +BUILD_DIR+: the directory where packages are extracted and built
>      - +BINARIES_DIR+: the place where all binary files (aka images) are
>        stored
>      - +BASE_DIR+: the base output directory
> @@ -79,7 +80,7 @@ in one of these _post-image scripts_ will require 
special handling
>  Just like for the _post-build scripts_ mentioned above, you also have
>  access to the following environment variables from your _post-image
>  scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
> -+BINARIES_DIR+ and +BASE_DIR+.
> ++BUILD_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
> 
>  Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
>  +BR2_ROOTFS_POST_IMAGE_SCRIPT+ scripts will be passed the arguments
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
