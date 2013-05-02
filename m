From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 2 May 2013 15:36:11 +0800
Subject: [Buildroot] [PATCH v6 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <1366279592-9055-6-git-send-email-sonic.adi@gmail.com>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
 <1366279592-9055-6-git-send-email-sonic.adi@gmail.com>
Message-ID: <CAJxxZ0M4jZccZF3i3OM8-B7bWT1NzEXf62qsKEg4-wfAJqjnJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Apr 18, 2013 at 6:06 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Reserve all 3 blackfin toolchain folders under the TOOLCHAIN_EXTERNAL_DIR.
> Set current blackfin toolchain bin folder to the toolchain prefix subfolder.
> Install FDPIC and FLAT library in target ext-toolchain-installed.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> ---
>
> v6-changes:
> - Move options of installing blackfin toolchain libraries into external
> toolchain Config.in.
> - Fix typo error.
> - Merge the options of the same name and add descriptions.
>
> v5-changes:
> - Update comments.
>
> v3-changes:
> - Remove arch specific makefiles.
> - Reserve all 3 blackfin toolchain folders under the TOOLCHAIN_EXTERNAL_DIR.
> - Set current blackfin toolchain bin folder to the toolchain prefix subfolder.
> - Move FDPIC and FLAT library installation target from blackfin makefile to
> the ext-toolchain-installed target in external toolchain makefile.
>
> v2-changes:
> - Remove useless Macro __uClinux__
>
> v1-changes:
> - Create arch makefile.
> - Create blackfin makefile.
> - Add FDPIC and FLAT library options and makefile targets to install
> libraries for different binary formats into the same rootfs image.
> - update the TARGET_EXCEPTIONS variable in support/scripts/graph-depends for
> new custom targets
> ---
>  toolchain/toolchain-external/Config.in   |   25 ++++++++++++++++
>  toolchain/toolchain-external/ext-tool.mk |   46 ++++++++++++++++++++++-------
>  2 files changed, 60 insertions(+), 11 deletions(-)
>
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 6cf29aa..c4d17e0 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -887,5 +887,30 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
>
>  endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>
> +# When the FDPIC shared binary format is used, the corresponding libraries are
> +# always installed. When a different binary format is used, we offer the option
> +# of installing the FDPIC shared libraries.
> +config BR2_BFIN_INSTALL_FDPIC_SHARED
> +       bool "Install FDPIC shared libraries"
> +       depends on BR2_bfin && !BR2_BINFMT_FDPIC
> +       help
> +         The Linux kernel supports running both FDPIC and FLAT applications
> +         concurrently if the binary format specific libraries are installed properly.
> +         This option allows developer to install FDPIC libraries into a buildroot
> +         rootfs image built with binary format that is not FDPIC.
> +
> +# When the FLAT shared binary format is used, we force the installation
> +# of the corresponding libraries. When a different binary format is
> +# used, we offer the option of installing the FLAT shared libraries.
> +config BR2_BFIN_INSTALL_FLAT_SHARED
> +       bool "Install FLAT shared libraries"
> +       depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
> +       default y if BR2_BINFMT_FLAT_SHARED
> +       help
> +         The Linux kernel supports running both FDPIC and FLAT applications
> +         concurrently if the binary format specific libraries are installed properly.
> +         This option allows developer to install FLAT libraries into a buildroot
> +         rootfs image built with binary format that is not shared FLAT.
> +

Your former suggestion to merge 2 options

---------------------------------
config BR2_BFIN_INSTALL_FLAT_SHARED
       default y if BR2_BINFMT_FLAT_SHARED

config BR2_BFIN_INSTALL_FLAT_SHARED
       bool "Install FLAT shared libraries"
       depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
---------------------------------
into one
---------------------------------
config BR2_BFIN_INSTALL_FLAT_SHARED
       bool "Install FLAT shared libraries"
       depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
       default y if BR2_BINFMT_FLAT_SHARED
---------------------------------

doesn't work. In the later case, if BR2_BINFMT_FLAT_SHARED is
selected, option BR2_BFIN_INSTALL_FLAT_SHARED is not set to y by
default. Only the former case works correctly.

So, I have to revert the options back.

Regards,

Sonic Zhang
