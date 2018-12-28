From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2018 14:03:27 +0100
Subject: [Buildroot] [PATCH v7 7/8] docs/manual: add details about
 top-level parallel build support
In-Reply-To: <20181228104335.22379-8-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-8-thomas.petazzoni@bootlin.com>
Message-ID: <20181228130327.GW14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-28 11:43 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/manual/common-usage.txt        | 44 +++++++++++++++++++++++++++++
>  docs/manual/faq-troubleshooting.txt |  3 ++
>  docs/manual/quickstart.txt          |  8 +++---
>  3 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index e3d7578c85..ebe3238e38 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -329,6 +329,50 @@ Refer to the help text of this script for more details:
>  utils/size-stats-compare -h
>  ----------------
>  
> +[[top-level-parallel-build]]
> +=== Top-level parallel build

I would really add a big-fat warning that this is still experimental:

    .Note:
    This section deals with a very experimental feature, which is known
    to break even in some non-unusual situations. Use at your own risk.

> +Buildroot has always been capable of using parallel build on a per
> +package basis: each package is built by Buildroot using +make -jN+ (or
> +the equivalent invocation for non-make-based build systems). The level
> +of parallelism is by default number of CPUs + 1, but it can be
> +adjusted using the +BR2_JLEVEL+ configuration option.
> +
> +Until 2019.02, Buildroot was however building packages in a serial
> +fashion: each package was built one after the other, without
> +parallelization of the build between packages. As of 2019.02,
> +Buildroot has experimental support for *top-level parallel build*,
> +which allows some signicant build time savings by building packages
> +that have no dependency relationship in parallel. This feature is
> +however marked as experimental and is known to not work in all
> +situations.

... is know not to work in some cases.

(otherwise, the way you wrote it means it never works).

Besides, it would be interesting to list at least a few cases where it
is known to break, e.g.: qt5 packages...

> +In order to use top-level parallel build, one must:
> +
> +. Enable the option +BR2_PER_PACKAGE_DIRECTORIES+ in the Buildroot
> +configuration
> +
> +. Use +make -jN+ when starting the Buildroot build
> +
> +Internally, the +BR2_PER_PACKAGE_DIRECTORIES+ will enable a mechanism
> +called *per-package directories*, which will have the following
> +effects:
> +
> +* Instead of a global _target_ directory and a global _host_ directory
> +  common to all packages, per-package _target_ and _host_ directories
> +  will be used, in +$(O)/per-package/<pkg>/target/+ and
> +  +$(O)/per-package/<pkg>/host/+ respectively. Those folders will be

s/folders/directories/  and elsewhere, too...

> +  populated from the corresponding folders of the package dependencies
> +  at the beginning of +<pkg>+ build. The compiler and all other tools
> +  will therefore only be able to see and access files installed by
> +  dependencies explicitly listed by +<pkg>+.
> +
> +* At the end of the build, the global _target_ and _host_ directories
> +  will be populated, located in +$(O)/target+ and +$(O)/host+
> +  respectively. This means that during the build, those folders will
> +  be empty and it's only at the very end of the build that they will
> +  be populated.
> +
>  include::eclipse-integration.txt[]
>  
>  include::advanced.txt[]
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index b144c9e7f0..5adf3fa6ce 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -239,3 +239,6 @@ help reduce the build time:
>  
>   * Buy new hardware. SSDs and lots of RAM are key to speeding up the
>     builds.
> +
> + * Experiment with top-level parallel build, see
> +   xref:top-level-parallel-build[].
> diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
> index 74158ae249..77b73ef116 100644
> --- a/docs/manual/quickstart.txt
> +++ b/docs/manual/quickstart.txt
> @@ -60,10 +60,10 @@ To start the build process, simply run:
>   $ make
>  --------------------
>  
> -You *should never* use +make -jN+ with Buildroot: top-level parallel
> -make is currently not supported. Instead, use the +BR2_JLEVEL+ option
> -to tell Buildroot to run the compilation of each individual package
> -with +make -jN+.
> +By default, Buildroot does not support top-level parallel build, so
> +running +make -jN+ is not necessary. There is however experimental
> +support for top-level parallel build, see
> +xref:top-level-parallel-build[].

What about:

    Buildroot does not officially support top-level parallel build,
    so you should not use +make -jN+ when calling Buildroot. However,
    there is *experimental* support for top-level parallel build, see
    xref:top-level-parallel-build[].

Regards,
Yann E. MORIN.

>  The `make` command will generally perform the following steps:
>  
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
