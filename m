From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 12 Nov 2019 18:21:15 -0300
Subject: [Buildroot] [PATCH] toolchain/helpers: make sure we bail out
 when kernel headers check fails
In-Reply-To: <20191112202118.56136-1-thomas.petazzoni@bootlin.com>
References: <20191112202118.56136-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAJ4jsaeAhEVJY9pCR3-vhmhpuAndc3F1Y3GVjrM-KXbEJv34KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 12, 2019 at 5:21 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> In commit 6136765b23abd9faba610dd54ed276a777811575 ("toolchain:
> generate check-headers program under $(BUILD_DIR)"), the
> check_kernel_headers_version function was simplified to not check the
> return value of the check-kernel-headers.sh script, assuming that
> "make" does bail out on the first failing command.
>
> However, check_kernel_headers_version when used in $(2)_CONFIGURE_CMDS
> from pkg-toolchain-external.mk, is called in a sequence of commands,
> where the return value of each command is not checked. Therefore, a
> failure of check-kernel-headers.sh no longer aborts the build.
>
> Since all other macros are using this principle of calling "exit 1",
> we revert back to the same for check_kernel_headers_version, as it was
> done prior to 6136765b23abd9faba610dd54ed276a777811575.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Carlos Santos <unixmania@gmail.com>
> ---
>  toolchain/helpers.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 42e5522060..996cc70d44 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -163,7 +163,9 @@ copy_toolchain_sysroot = \
>  # $3: kernel version string, in the form: X.Y
>  #
>  check_kernel_headers_version = \
> -       support/scripts/check-kernel-headers.sh $(1) $(2) $(3)
> +       if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3); then \
> +               exit 1; \
> +       fi
>
>  #
>  # Check the specific gcc version actually matches the version in the
> --
> 2.23.0
>

The function became a one-liner after commit 6136765b23. Wouldn't it
be simpler and more readable to run the script and test the result,
both in linux-headers.mk and pkg-toolchain-external.mk?

-- 
Carlos Santos <unixmania@gmail.com>
