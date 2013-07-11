From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 11 Jul 2013 11:24:51 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
References: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 3, 2013 at 3:06 PM, Markos Chandras
<markos.chandras@gmail.com> wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
>
> gcc hardcodes the uClibc interpreter for MIPS64/n32 as follows:
> (gcc-4.7.3, gcc/config/mips/linux64.h):
> define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
>
> However, buildroot always creates the $(TARGET_DIR)/lib,
> $(TARGET_DIR)/usr/lib, $(STAGING_DIR)/lib and
> $(STAGING_DIR)/usr/lib directories, therefore for consinstency
> reasons, we create a lib32->lib symlink to fix the interpreter
> problems for MIPS64/n32.
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> Changes since v1:
> http://lists.busybox.net/pipermail/buildroot/2013-July/074586.html
> - drop pushd/popd
> - Create symlinks for the STAGING_DIR as well
> ---
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 509eab6..31c41e4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -436,6 +436,13 @@ $(BUILD_DIR)/.root:
>                 --exclude .hg --exclude=CVS --exclude '*~' \
>                 $(TARGET_SKELETON)/ $(TARGET_DIR)/
>         cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> +ifeq ($(BR2_MIPS_NABI32),y)
> +       ln -sfn lib $(TARGET_DIR)/lib32
> +       ln -sfn lib $(TARGET_DIR)/usr/lib32
> +       ln -sfn lib $(STAGING_DIR)/lib32
> +       ln -sfn lib $(STAGING_DIR)/usr/lib32
> +
> +endif
>         touch $@
>
>  $(TARGET_DIR): $(BUILD_DIR)/.root

We are doing a similar thing from our post-build script, on a
Cavium-based MIPS64 n32 ABI, so I'm definitely in favor of this patch.

I'm not sure though if the $(BUILD_DIR)/.root rule is the best place
to put this, it seems a bit odd in my opinion.

Best regards,
Thomas
