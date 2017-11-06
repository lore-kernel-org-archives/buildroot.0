From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Nov 2017 12:06:50 -0600
Subject: [Buildroot] [PATCH 1/2] uboot: use local libfdt.h
In-Reply-To: <20171106121328.20330-1-matthew.weber@rockwellcollins.com>
References: <20171106121328.20330-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpatZzVxThWn6kSjgJf92EMS8SCmTOFVN6naFFnvGPTuPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Nov 6, 2017 at 6:13 AM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> Use of libfdt.h by u-boot is currently using
> the <system-path>.
>
> Jan submitted the following upstream
> https://patchwork.ozlabs.org/patch/833760/
>
> Resolves a failure like this one observed on uboot-tools
> http://autobuild.buildroot.net/results/347cde4b5c0e6ca76d354396385be4ec1294da73
>
> CC: Jan Kundr?t <jan.kundrat@cesnet.cz>
> CC: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/uboot/uboot.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index fdacf16856..3350814a82 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -183,6 +183,12 @@ define UBOOT_APPLY_LOCAL_PATCHES
>  endef
>  UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
>
> +# Bug: https://patchwork.ozlabs.org/patch/833760/
> +define UBOOT_FIX_LIBFDT_SYSTEM_PATH
> +       $(SED) 's%<../include/libfdt.h>%"../include/libfdt.h"%' $(@D)/tools/fdtgrep.c 2> /dev/null


Found a bug, I need to go back and test again with an older uboot.  I
thought I had but it looks like it errors out even with the re-direct.

Matt
