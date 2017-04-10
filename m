From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Apr 2017 21:31:12 +0200
Subject: [Buildroot] [PATCH v3] xenomai: Add choice for
 enabling/disabling Cobalt/Mercury core
In-Reply-To: <20170410123226.3719-1-sikor6@gmail.com>
References: <20170409235434.31059-1-sikor6@gmail.com>
 <20170410123226.3719-1-sikor6@gmail.com>
Message-ID: <CAAXf6LUgz48VtAd9=aL9m8f5640GimYMNrXg1Hy3_mMgM-_S+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 10, 2017 at 2:32 PM, Pawel Sikora <sikor6@gmail.com> wrote:
> Add an option choice for Cobalt or Mercury core
> depending on option BR2_LINUX_KERNEL_EXT_XENOMAI.
>
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> ---
> Changes v2 -> v3:
>  - Corrections in help (Arnout V.)
>
>  package/xenomai/Config.in  | 27 +++++++++++++++++++++++++++
>  package/xenomai/xenomai.mk |  6 ++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index b548ee810..324f5025a 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -51,6 +51,33 @@ config BR2_PACKAGE_XENOMAI_VERSION
>           BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
>           Kernel -> Linux Kernel Extensions menu.
>
> +choice
> +       prompt "Xenomai core"
> +       default BR2_PACKAGE_XENOMAI_MERCURY
> +       help
> +         Select the Xenomai core: dual kernel (Cobalt)
> +         or native Linux Kernel (Mercury).
> +
> +config BR2_PACKAGE_XENOMAI_MERCURY
> +       bool "Mercury"
> +       depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
> +       help
> +         Select Mercury core for the Xenomai userspace.
> +         You want to use it if you have the native Linux Kernel.
> +
> +config BR2_PACKAGE_XENOMAI_COBALT
> +       bool "Cobalt"
> +       help
> +         Select Cobalt core (dual kernel) for the Xenomai
> +         userspace. Use this if you use a Xenomai-patched
> +         Linux kernel.
> +
> +         If you want to use Cobalt core, your kernel must have

the Cobalt core

> +         the Adeos and Xenomai patches applied to it. You can
> +         add these through the BR2_LINUX_KERNEL_EXT_XENOMAI option
> +         in the Linux Kernel Extensions menu.

With the latest updates, the term 'I-pipe' has disappeared here, I
think it is a relevant term that helps clarifying 'Adeos', no?

More in general: I wonder which level of help we need to provide here.
I expect that people's choice of either Cobalt or Mercury cannot be
driven by the current help above. The choice has severe impact on your
application and system. We could try to extend the help, e.g.
clarifying that only the cobalt core can provide real real-time
guarantees, and that the mercury core's real-time strictness fully
depends on the linux kernel. But perhaps it may be better to
explicitly refer to the Xenomai documentation to make a proper
decision.

Best regards,
Thomas
