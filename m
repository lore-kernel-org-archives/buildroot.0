From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 08:04:27 +0100
Subject: [Buildroot] [PATCH 5/9] manual: faq: add workaround to avoid
 rebuilding the buildroot toolchain after each clean
In-Reply-To: <e5a14b33f5b34b4fbfd5c5b3e2b1077c7ef91573.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
 <e5a14b33f5b34b4fbfd5c5b3e2b1077c7ef91573.1360795941.git.s.martin49@gmail.com>
Message-ID: <511C8C7B.6090105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 23:59, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>   docs/manual/common-usage.txt        |  1 +
>   docs/manual/faq-troubleshooting.txt | 34 ++++++++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index c7f511a..b36965f 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -20,6 +20,7 @@ all sources that you previously selected in the configurator
>   You can now disconnect or copy the content of your +dl+
>   directory to the build-host.
>
> +[[daily-oot-build]]
>   Building out-of-tree
>   ~~~~~~~~~~~~~~~~~~~~

  The other tags in this section don't have the 'daily-' prefix, and it 
took me a while to understand what the daily meant in the first place. So 
I'd rename it to out-of-tree-build.

>
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 8b0882a..f367275 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -147,3 +147,37 @@ Using the internal Buildroot toolchain backend
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>   These toolchains are currently *not relocatable*.
> +
> +However, it is possible to build a toolchain using the internal Buildroot
> +backend in another location (see xref:daily-oot-build[]), then use it as an
> +_external_ one to prevent from rebuilding it after issuing +make clean+
> +(see xref:faq-avoid-rebuild-toolchain[]).

  xreffing to immediately below is a bit silly...

> +
> +[[faq-avoid-rebuild-toolchain]]
> +How to avoid always rebuilding the toolchain?
> +---------------------------------------------
> +
> +When using the internal Buildroot toolchain backend or the
> +http://crosstool-ng.org[crosstool-NG] one, runnong +make clean+ not only
                                               ^^^^^^^ running

> +remove the built binaries, but also the whole toolchain.
> +
> +It is possible to prevent this by, first, building the toolchain in a
> +place different from the one  where the images will be built.

  The 'first' sounds a bit strange here. How about:

It is possible to prevent this by building the toolchain in a different 
place than the one where the images will be built. To do so:

> +
> +To do so:
> +
> +1. Build the toolchain somewhere:
> ++
> +----------------------------
> +make toolchain O=/path/to/toolchain

  I personally would do it with

make toolchain BR2_HOST_DIR=/path/to/toolchain

  That gives you everything you need and nothing more (no build dir and 
stuff).

> +----------------------------
> ++
> +1. Use this pre-built toolchain as an external one in a new and clean
> +   build (see xref:external-toolchain-backend[]) with a different output
> +   directory than the pre-built toolchain one.

  Not clear enough. How about:

1. Reconfigure buildroot with a custom external toolchain (see
xref:external-toolchain-backend[]). Set the toolchain path to
`/path/to/toolchain/usr`.

// Note: that's actually not a good example, because the default for
// BR2_TOOLCHAIN_EXTERNAL_PATH is literally /path/to/toolchain/usr, so a
// dumb user could think it is already correct...]

1. `make clean; make`

> +
> +This way, you will not have to rebuild the toolchain after invoking
> ++make clean+.
> +
> +However, the toolchain should be regenerated after any change of the
> ++Target Architecture+ (or its _variant_), or done in the +Toolchain+ menu.

However, the toolchain should be regenerated after you change a target 
architecture option (architecture variant, ABI, floating point, ...), or 
when you make any change in the +Toolchain+ menu.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
