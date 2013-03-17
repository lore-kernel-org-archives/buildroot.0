From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Mar 2013 23:09:23 +0100
Subject: [Buildroot] [PATCH v2] rework patch model
In-Reply-To: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
References: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAHXCMMJy+UWHy9Vn=7jfimXn6HM0b=s0EuFMU0z9OwNGdkLHWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

Nice to see this point moving forward :-)

2013/3/17  <spdawson@gmail.com>:
> From: Simon Dawson <spdawson@gmail.com>
>
> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
> to the patch logic was discussed. See
>
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
>
> for details. In summary:
>
> * For patches stored in the package directory, if package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch, otherwise, apply package/<pkg>/*.patch
> * For patches stored in the global patches directory, if $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
>
> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
> the generic package infrastructure to implement the new patch logic.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  v2: Add documentation, as suggested by Baruch Siach
>
>  Config.in                          |   15 +++++++++++++++
>  docs/manual/customize-packages.txt |   23 +++++++++++++++++++++++
>  docs/manual/customize.txt          |    2 ++
>  package/pkg-generic.mk             |   16 ++++++++--------
>  4 files changed, 48 insertions(+), 8 deletions(-)
>  create mode 100644 docs/manual/customize-packages.txt
>
[...]
> diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
> new file mode 100644
> index 0000000..9e158c7
> --- /dev/null
> +++ b/docs/manual/customize-packages.txt
> @@ -0,0 +1,23 @@
> +// -*- mode:doc -*- ;
> +
> +[[packages-custom]]
> +Customizing packages
> +~~~~~~~~~~~~~~~~~~~~
> +
> +It is sometimes useful to apply 'extra' patches to packages - over and
> +above those provided in Buildroot. This might be used to support custom
> +features in a project, for example, or when working on a new architecture.
> +
> +The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> +used to specify a directory containing global package patches.
> +
> +For a specific version <version> of a specific package <pkg>, patches
> +are applied as follows.
> +
> +First, the default Buildroot patch set for the package is applied.
> +
> +If the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg>/<version> exists, then
> +all *.patch files in the directory will be applied.
> +
> +Otherwise, if the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg> exists, then
> +all *.patch files in the directory will be applied.
> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> index 3b1a5a7..0456ef1 100644
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -15,3 +15,5 @@ include::customize-kernel-config.txt[]
>  include::customize-toolchain.txt[]
>
>  include::customize-store.txt[]
> +
> +include::customize-packages.txt[]

Would also be good to update and maybe add cross-refs in the "Patching
a package" section in docs/manual/patch-policy.txt

Regards,

-- 
Samuel
