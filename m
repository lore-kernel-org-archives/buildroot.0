From: Markus Mayer <mmayer@broadcom.com>
Date: Sat, 26 Oct 2019 11:29:27 -0700
Subject: [Buildroot] [PATCH] toolchain: introduce config options to
 include GCC's sanitation libraries
In-Reply-To: <20190605214155.3006-1-mmayer@broadcom.com>
References: <20190605214155.3006-1-mmayer@broadcom.com>
Message-ID: <CAGt4E5udpTU+_+jige3NdgBt2C0w9A9tfG+5xOPDdxdyWL=R2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, 5 Jun 2019 at 14:42, Markus Mayer <mmayer@broadcom.com> wrote:
>
> We add config options for external toolchains to allow copying the
> following libraries into the root file system:
>
>   - libasan (-fsanitize=address)
>   - liblsan (-fsanitize=leak)
>   - libtsan (-fsanitize=thread)
>   - libubsan (-fsanitize=undefined)
>
> Copying these shared libraries into the root file system will add
> run-time support for binaries compiled with one of the above "sanitize"
> options for enhanced run-time debugging.

It's been a few months, so I figured I'd follow up on this patch to
see if there is any interest in applying this. I think it makes a lot
of sense to have this option available. It's sure been handy for us to
have the sanitation libraries available at run-time.

I heard from another person who would be interested in seeing this
added. I am sure he'll be replying to this thread.

Thanks,
-Markus

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  toolchain/Config.in                           | 12 ++++++++
>  .../pkg-toolchain-external.mk                 | 16 +++++++++++
>  .../Config.in.options                         | 28 +++++++++++++++++++
>  3 files changed, 56 insertions(+)
>
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 2da537e7d4c8..15bd2179f9a2 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -632,4 +632,16 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>         bool
>         default y if BR2_i386 || BR2_x86_64
>
> +config BR2_TOOLCHAIN_HAS_LIBASAN
> +       bool
> +
> +config BR2_TOOLCHAIN_HAS_LIBLSAN
> +       bool
> +
> +config BR2_TOOLCHAIN_HAS_LIBTSAN
> +       bool
> +
> +config BR2_TOOLCHAIN_HAS_LIBUBSAN
> +       bool
> +
>  endmenu
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index baf719ad1f09..ca4dd00446b5 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -148,6 +148,22 @@ ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
>  endif
>
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBASAN),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libasan.so*
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBLSAN),y)
> +TOOLCHAIN_EXTERNAL_LIBS += liblsan.so*
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBTSAN),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libtsan.so*
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBUBSAN),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libubsan.so*
> +endif
> +
>  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
>
>
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index cb7095632fff..c62745103740 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -437,6 +437,34 @@ config BR2_TOOLCHAIN_EXTERNAL_OPENMP
>           support. If you don't know, leave the default value,
>           Buildroot will tell you if it's correct or not.
>
> +config BR2_TOOLCHAIN_EXTERNAL_LIBASAN
> +       bool "Toolchain has libasan support?"
> +       select BR2_TOOLCHAIN_HAS_LIBASAN
> +       help
> +         Select this option if your external toolchain has libasan
> +         support (-fsanitize=address).
> +
> +config BR2_TOOLCHAIN_EXTERNAL_LIBLSAN
> +       bool "Toolchain has liblsan support?"
> +       select BR2_TOOLCHAIN_HAS_LIBLSAN
> +       help
> +         Select this option if your external toolchain has libasan
> +         support (-fsanitize=leak).
> +
> +config BR2_TOOLCHAIN_EXTERNAL_LIBTSAN
> +       bool "Toolchain has libtsan support?"
> +       select BR2_TOOLCHAIN_HAS_LIBTSAN
> +       help
> +         Select this option if your external toolchain has libasan
> +         support (-fsanitize=thread).
> +
> +config BR2_TOOLCHAIN_EXTERNAL_LIBUBSAN
> +       bool "Toolchain has libasan support?"
> +       select BR2_TOOLCHAIN_HAS_LIBUBSAN
> +       help
> +         Select this option if your external toolchain has libubsan
> +         support (-fsanitize=undefined).
> +
>  config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
>         string "Extra toolchain libraries to be copied to target"
>         help
> --
> 2.17.1
>
