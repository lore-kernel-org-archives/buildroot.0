From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Dec 2013 20:20:49 +0100
Subject: [Buildroot] [PATCH 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <1386784684-6546-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1386784684-6546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1386784684-6546-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CAAXf6LV57o+o=TMJo8BY5F2SNV1GmVDj=7xX9shpjR0NC2UX-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 11, 2013 at 6:58 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Updating the documentation to reflect that multiple directories can
> now be specified for BR2_GLOBAL_PATCH_DIR. Along with giving an
> example use case of how to use multiple global patch directories.

You forgot a signed-off-by line...

> ---
>  docs/manual/customize-packages.txt |   69 +++++++++++++++++++++++++++++++-----
>  docs/manual/patch-policy.txt       |   13 ++++---
>  2 files changed, 69 insertions(+), 13 deletions(-)
>
> diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
> index 1820c54..d3fb052 100644
> --- a/docs/manual/customize-packages.txt
> +++ b/docs/manual/customize-packages.txt
> @@ -8,16 +8,67 @@ It is sometimes useful to apply 'extra' patches to packages - over and
>  above those provided in Buildroot. This might be used to support custom
>  features in a project, for example, or when working on a new architecture.
>
> -The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> -used to specify a directory containing global package patches.
> +The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
> +a space separated list of one or more directories containing global
> +package patches. By specifying multiple global patch directories, a
> +user could implement a layered approach to patches. This could be
> +useful when a user has multiple boards that share a common processor
> +architecture. It is often the case that a subset of patches for a
> +package that need to be shared between the different boards a user

shouldn't this 'that' be removed?

> +has. However, each board may require specific patches for the package
> +that build on top of the common subset of patches.
>
> -For a specific version <packageversion> of a specific package <packagename>,
> -patches are applied as follows.
> +For a specific version +<packageversion>+ of a specific package
> ++<packagename>+, patches are applied as follows:
>
> -First, the default Buildroot patch set for the package is applied.
> +. First, the default Buildroot patch set for the package is applied.
>
> -If the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>+
> -exists, then all +*.patch+ files in the directory will be applied.
> +. Then for every directory - +<global-patch-dir>+ - that exists in
> +  +BR2_GLOBAL_PATCH_DIR+, the following will be done:
> ++
> +* If the directory
> +  +<global-patch-dir>/<packagename>/<packageversion>/+ exists, then
> +  all *.patch files in this directory will be applied.
> ++
> +* Otherwise, if the directory +<global-patch-dir>/<packagename>+ exists,
> +  then all *.patch files in the directory will be applied.
>
> -Otherwise, if the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>+
> -exists, then all +*.patch+ files in the directory will be applied.
> +The +BR2_GLOBAL_PATCH_DIR+ option is preferred method for specifying a

the preferred

> +custom patch directory for packages. It should be used when patching
> +Linux, U-Boot, and other packages that already have custom patch
> +directories options available to them as configuration options. By

Shouldn't this be 'directory options' rather than 'directories options'?

Also, I'm not sure I follow you here: even if there are no custom
patch directory options, the global patch dir is useful, right?

> +doing this, it will allow a user to manage their patches from one
> +top-level directory.`

What is the purpose of this backtick here? Is it a typo?

> +
> +An example directory structure for where a user has multiple
> +directories specified for +BR2_GLOBAL_PATCH_DIR+ may look like this:
> +
> +-----
> +board/
> ++-- common-fooarch
> +|   +-- patches
> +|       +-- linux
> +|       |   +-- linux-patch1.patch
> +|       |   +-- linux-patch2.patch
> +|       +-- u-boot
> +|       +-- foopkg
> ++-- fooarch-board
> +    +-- patches
> +        +-- linux
> +        |   +-- linux-patch3.patch
> +        +-- u-boot
> +        +-- foopkg
> +-----
> +
> +If the user to have +BR2_GLOBAL_PATCH_DIR+ configuration option set as

to have --> has the

> +follows:
> +
> +-----
> +BR2_GLOBAL_PATCH_DIR="board/common-fooarch board/fooarch-board"
> +-----
> +
> +Then the patches would applied as follows for the Linux kernel:
> +
> +. board/common-fooarch/patches/linux/linux-patch1.patch
> +. board/common-fooarch/patches/linux/linux-patch2.patch
> +. board/fooarch-board/patches/linux/linux-patch1.patch
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index d9bc8ca..26586ad 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -50,8 +50,9 @@ Global patch directory
>  ^^^^^^^^^^^^^^^^^^^^^^
>
>  The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> -used to specify a directory containing global package patches. See
> -xref:packages-custom[] for details.
> +used to specify a space separated list of one or more directories
> +containing global package patches. See xref:packages-custom[] for
> +details.
>
>
>  How patches are applied
> @@ -72,11 +73,15 @@ How patches are applied
>  +
>  * Otherwise, patch files matching +<packagename>-*.patch+
>    are applied in alphabetical order.
> -  So, to ensure they are applied in the right order, it is hightly
> -  recommended to named the patch files like this:
> +  So, to ensure they are applied in the right order, it is highly
> +  recommended to name the patch files like this:
>    +<packagename>-<number>-<description>.patch+, where +<number>+
>    refers to the 'apply order'.
>
> +. If +BR2_GLOABL_PATCH_DIR+ is defined, the directories will be
> +  enumerated in the order they are specified for patches. The patches
> +  are applied as described in the previous step.
> +
>  . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
>
>  If something goes wrong in the steps _3_ or _4_, then the build fails.
> --


Best regards,
Thomas
