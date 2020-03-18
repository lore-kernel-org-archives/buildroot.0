From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 22:12:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/rcw : bump to LSDK-19.09
In-Reply-To: <20200318071427.347-1-laurent.hartanerot@gmail.com>
References: <20200318071427.347-1-laurent.hartanerot@gmail.com>
Message-ID: <20200318221239.095b0422@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurent,

Thanks for your contribution, see below for a review.

On Wed, 18 Mar 2020 08:14:27 +0100
Laurent Hartanerot <laurent.hartanerot@gmail.com> wrote:

> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> Upgrade python to python3 : "Only Python versions 3.0+ are supported"
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/rcw/rcw.hash | 2 +-
>  package/rcw/rcw.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
> index 7de1ec659a..76b6373942 100644
> --- a/package/rcw/rcw.hash
> +++ b/package/rcw/rcw.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
> +sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
>  sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
> diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
> index 81e22fff93..5081b1c646 100644
> --- a/package/rcw/rcw.mk
> +++ b/package/rcw/rcw.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RCW_VERSION = LSDK-18.12
> +RCW_VERSION = LSDK-19.09
>  RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
>  RCW_SITE_METHOD = git
>  RCW_LICENSE = BSD-3-Clause
> @@ -39,7 +39,7 @@ endef
>  HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
>  
>  define HOST_RCW_BUILD_CMDS
> -	python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
> +	python3 $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin

We don't have any guarantee that python3 is available on the build
machine. And in fact, since commit
9c0c7846cdb63f3ed62563c4f532ad02ad0a1c98 we also don't have the
guarantee that python is available on the build machine.

So, here, we would need two patches:

 - A first patch that is a fix to the package in its current version.
   It should add host-python to its dependencies, and make sure
   $(HOST_DIR)/bin/python gets used. This way, the patch can be
   backported to our LTS branch 2020.02.

 - A second patch that bumps the package to LSDK-19.09, switches to
   using $(BR2_PYTHON3_HOST_DEPENDENCY) in HOST_RCW_DEPENDENCIES, and
   then be careful to use python3, but with $(HOST_DIR)/bin in the
   PATH, so that either the system-wide python3 is used, or the one
   built by Buildroot.

Could you look into doing this ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
