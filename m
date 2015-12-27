From: Steven Noonan <steven@uplinklabs.net>
Date: Sat, 26 Dec 2015 16:27:59 -0800
Subject: [Buildroot] [PATCHv2] toolchain: granular choice for stack
	protector
In-Reply-To: <1451173326-3424-1-git-send-email-yann.morin.1998@free.fr>
References: <1451173326-3424-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAKbGBLj6=vRc5SnRPcTzcvaJAU20X3Wq93EUPPDEAJ5DGyWk5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LGTM. Also looks like a better implementation than what I've been
using (like the BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 usage). The next time I
rebase my tree I'll include this version instead and see how things go
(not expecting any difference in behavior based on my read of this,
though).

On Sat, Dec 26, 2015 at 3:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: Steven Noonan <steven@uplinklabs.net>
>
> Currently, we only support two levels of stach-smashing protection:
>   - entirely disabled,
>   - protect _all_ functions with -fstack-protector-all.
>
> -fstack-protector-all tends to be far too aggressive and impacts
> performance too much to be worth on a real product.
>
> Add a choice that allows us to select between different levels of
> stack-smashing protection:
>   - none
>   - basic   (NEW)
>   - strong  (NEW)
>   - all
>
> The differences are documented in the GCC online documentation:
>     https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/Optimize-Options.html
>
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> [yann.morin.1998 at free.fr:
>   - rebase
>   - add legacy handling
>   - SSP-strong depends on gcc >= 4.9
>   - slightly simple ifeq-block in package/Makefile.in
>   - keep the comment in the choice; add a comment shen strong is not
>     available
>   - update commit log
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> ---
> Changes v1 -> v2:
>   - see commit log ;-)  (Yann)
>
> ---
> Note: I (Yann) have only slightly tested this patch. More testing is in
> order before we can apply this. Steven, care to see if it still fits
> your need? Thanks! :-)
> ---
>  Config.in           | 50 +++++++++++++++++++++++++++++++++++++++++++++-----
>  Config.in.legacy    |  8 ++++++++
>  package/Makefile.in |  8 +++++++-
>  3 files changed, 60 insertions(+), 6 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index 0be44d9..1e85d78 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -522,12 +522,14 @@ config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
>
>  endif
>
> -config BR2_ENABLE_SSP
> +choice
>         bool "build code with Stack Smashing Protection"
> -       depends on BR2_TOOLCHAIN_HAS_SSP
> +       default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> +       default BR2_SSP_STRONG if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +       default BR2_SSP_REGULAR
>         help
> -         Enable stack smashing protection support using GCCs
> -         -fstack-protector-all option.
> +         Enable stack smashing protection support using GCC's
> +         -fstack-protector option family.
>
>           See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
>           for details.
> @@ -536,9 +538,47 @@ config BR2_ENABLE_SSP
>           support. This is always the case for glibc and eglibc
>           toolchain, but is optional in uClibc toolchains.
>
> -comment "enabling Stack Smashing Protection requires support in the toolchain"
> +config BR2_SSP_NONE
> +       bool "None"
> +       help
> +         Disable stack-smashing protection.
> +
> +comment "Stack Smashing Protection needs a toolchain w/ SSP"
>         depends on !BR2_TOOLCHAIN_HAS_SSP
>
> +config BR2_SSP_REGULAR
> +       bool "-fstack-protector"
> +       depends on BR2_TOOLCHAIN_HAS_SSP
> +       help
> +         Emit extra code to check for buffer overflows, such as stack
> +         smashing attacks. This is done by adding a guard variable to
> +         functions with vulnerable objects. This includes functions
> +         that call alloca, and functions with buffers larger than 8
> +         bytes. The guards are initialized when a function is entered
> +         and then checked when the function exits. If a guard check
> +         fails, an error message is printed and the program exits.
> +
> +config BR2_SSP_STRONG
> +       bool "-fstack-protector-strong"
> +       depends on BR2_TOOLCHAIN_HAS_SSP
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +       help
> +         Like -fstack-protector but includes additional functions to be
> +         protected - those that have local array definitions, or have
> +         references to local frame addresses.
> +
> +comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
> +       depends on BR2_TOOLCHAIN_HAS_SSP
> +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
> +config BR2_SSP_ALL
> +       bool "-fstack-protector-all"
> +       depends on BR2_TOOLCHAIN_HAS_SSP
> +       help
> +         Like -fstack-protector except that all functions are protected.
> +
> +endchoice
> +
>  choice
>         bool "libraries"
>         default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 2628796..5d45d04 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,14 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.02"
>
> +# BR2_ENABLE_SSP is still referenced in Config.in (default in choice)
> +config BR2_ENABLE_SSP
> +       bool "Stack Smashing protection now has different levels"
> +       help
> +         The protection offered by SSP can now be selected from different
> +         protection levels. Be sure to review the SSP level in the build
> +         options menu.
> +
>  config BR2_PACKAGE_DIRECTFB_CLE266
>         bool "cle266 driver for directfb removed"
>         select BR2_LEGACY
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 82a66c2..c5652af 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -159,7 +159,13 @@ TARGET_CFLAGS += -msep-data
>  TARGET_CXXFLAGS += -msep-data
>  endif
>
> -ifeq ($(BR2_ENABLE_SSP),y)
> +ifeq ($(BR2_SSP_REGULAR),y)
> +TARGET_CFLAGS += -fstack-protector
> +TARGET_CXXFLAGS += -fstack-protector
> +else ifeq ($(BR2_SSP_STRONG),y)
> +TARGET_CFLAGS += -fstack-protector-strong
> +TARGET_CXXFLAGS += -fstack-protector-strong
> +else ifeq ($(BR2_SSP_ALL),y)
>  TARGET_CFLAGS += -fstack-protector-all
>  TARGET_CXXFLAGS += -fstack-protector-all
>  endif
> --
> 1.9.1
>
