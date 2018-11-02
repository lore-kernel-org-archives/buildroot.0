From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 2 Nov 2018 14:57:10 +0100
Subject: [Buildroot] [PATCH 1/1] fwts: Enable optional efi_runtime
 kernel module build
In-Reply-To: <1541162207-8770-1-git-send-email-sumit.garg@linaro.org>
References: <1541162207-8770-1-git-send-email-sumit.garg@linaro.org>
Message-ID: <CAK4VdL2=P8w_6aoVkHmvtx8N6JnCSosG_btJooDz+Db1K9rRAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 2, 2018 at 1:37 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Firmware test suite does provides efi_runtime kernel module required
> to run UEFI tests. So optionally enable this module build.

Thanks for working on this. I ended up never adding support for it in
the package because efi_runtime can also be enabled in the kernel
config (config EFI_TEST) rather than being provided by fwts. But I
think it's not bad to also have the support here for the source
shipped with the given fwts version.

I have some suggestions below.

>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  package/fwts/Config.in | 8 ++++++++
>  package/fwts/fwts.mk   | 6 ++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/package/fwts/Config.in b/package/fwts/Config.in
> index 959d871..3ddb989 100644
> --- a/package/fwts/Config.in
> +++ b/package/fwts/Config.in
> @@ -28,3 +28,11 @@ comment "fwts needs a glibc toolchain w/ wchar, threads"
>         depends on BR2_USE_MMU
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>                 !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> +       bool "efi_runtime_module"

For a slightly better looking menu, I'd suggest dropping the second
underscore and making it "efi_runtime module".

> +       depends on BR2_PACKAGE_FWTS

Looking at most packages, I think a more clear way to show this option
only then fwts is selected, is to wrap it inside a 'if
BR2_PACKAGE_FWTS' instead of a 'depends on' for this case. Not sure if
it changes anything in practice but it seems more appropriate than a
'depends on' to me.

> +       depends on BR2_LINUX_KERNEL
> +       help
> +         Firmware Test Suite (FWTS) also provides EFI runtime kernel
> +         module required to run UEFI tests.

As it is, the option looks confusing in the menu as it doesn't look
like a fwts suboption. It looks like this:
[*] fwts
[ ] efi_runtime_module

I don't fully understand the Kconfig inner workings, but if
BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE is moved to right after
BR2_PACKAGE_FWTS (before the comment) then it becomes automatically
indented and to me much more easier to understand that it is a fwts
suboption:
[*] fwts
[ ]   efi_runtime_module

> diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
> index 15f0afc..840190e 100644
> --- a/package/fwts/fwts.mk
> +++ b/package/fwts/fwts.mk
> @@ -14,3 +14,9 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
>         $(if $(BR2_PACKAGE_DTC),dtc)
>
>  $(eval $(autotools-package))
> +
> +ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> +FWTS_DEPENDENCIES += linux

You don't need to add linux as an explicit dependency if you are using
$(kernel-module).

> +FWTS_MODULE_SUBDIRS = efi_runtime
> +$(eval $(kernel-module))
> +endif

This doesn't work for me, it doesn't trigger linux as a dependency and
fails to build from a clean build. The entire block including the
$(eval $(kernel-module)) needs to happen before $(eval
$(autotools-package)) so that it works as intended.


Erico
