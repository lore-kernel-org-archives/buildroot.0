From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 2 Jun 2015 13:03:48 +0200
Subject: [Buildroot] [PATCH v3] packages: fix and improve support for
 top-level parallel makefile
In-Reply-To: <1433241961-16445-1-git-send-email-fabio.porcedda@gmail.com>
References: <1433241961-16445-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC8b3p4V1CZmRFP=WSB7nb4SYFTO84Bf3Pkah+ZBK5W3Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 2, 2015 at 12:46 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> To fix packages that fail to build when PARALLEL_JOBS is empty instead
> of using an empty PARALLEL_JOBS just avoid to using it in
> the MAKE variable.
>
> Check the MAKEFLAGS variable to know automatically if the -j option is
> being used, but use the "=" operator instead of the ":=" operator
> because it can be checked only in a "recursively expanded variable".
> Use "override" because otherwise it's impossible to change the
> automatic variable "MAKE".
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---

v3:
- add Acked-by (Arnout)
v2:
- Use MAKEFLAGS to check if the "-j" option is used
- Don't empty the PARALLEL_JOBS variable (Thomas P.)

>  Makefile            | 4 ++--
>  package/Makefile.in | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 43b5ba5..9f82c6d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -58,8 +58,8 @@ export HOSTARCH := $(shell uname -m | \
>  #
>  # Taking into account the above considerations, if you still want to execute
>  # this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
> -# build using the following command:
> -#      make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
> +# use the -j<jobs> option when building, e.g:
> +#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
>  .NOTPARALLEL:
>
>  # absolute path
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a0c5a7a..55c65f2 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -18,7 +18,8 @@ PARALLEL_JOBS := $(BR2_JLEVEL)
>  endif
>
>  MAKE1 := $(HOSTMAKE) -j1
> -MAKE := $(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
> +override MAKE = $(HOSTMAKE) \
> +       $(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
>
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
> --
> 2.4.1
>



-- 
Fabio Porcedda
