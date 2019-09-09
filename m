From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 9 Sep 2019 09:28:59 -0500
Subject: [Buildroot] [PATCH v2 12/12] linux: don't set
 -Wno-attribute-alias flag when Clang is used as cross-compiler
In-Reply-To: <20190907094027.9537-13-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-13-romain.naour@smile.fr>
Message-ID: <CANQCQpYqXG+29esYG4qs2YRtvG2QbfCbO9a3hVKYh06JYiD7Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Sep 7, 2019 at 4:40 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Clang stop the build due to -Werror and -Wunknown-warning-option:
>
> error: unknown warning option '-Wno-attribute-alias'; did you mean '-Wattributes'? [-Werror,-Wunknown-warning-option]
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>

Did a build time test using the qemu aarch64 configuration, selecting
the prebuilt external toolchain and enabling the Clang as
cross-compiler option.
I then booted this configuration in qemu and logged in.
# dmesg | grep clang
Linux version 4.19.16 (mlweber1 at fooobar) (clang version 8.0.1
(tags/RELEASE_801/final)) #1 SMP Mon Sep 9 09:25:19 CDT 2019
#

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  linux/linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index d381c96d85..93d80d85e6 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -145,7 +145,8 @@ endif
>  # abusing those aliases for system call entry points, in order to
>  # sanitize the arguments passed from user space in registers.
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
> -ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> +# Clang doesn't support -Wno-attribute-alias
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8):$(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y:)
>  LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
>  endif
>
> --
> 2.21.0
>


--

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
