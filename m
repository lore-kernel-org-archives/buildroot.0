From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 01:11:58 +0200
Subject: [Buildroot] [PATCH v2] package/perf: build outside kernel tree
In-Reply-To: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
References: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150712011158.3aab2b47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Thu, 19 Mar 2015 03:57:31 -0700, Steven Noonan wrote:
> This is necessary for introducing patches.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
> 
> v2:
>   - Running 'make source' made me realize that the PERF_SOURCE variable needed
> 	to be added, pointing to the same location as e.g. linux-headers.
> 
>  package/perf/perf.mk | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> index f35abc9..2177ac8 100644
> --- a/package/perf/perf.mk
> +++ b/package/perf/perf.mk
> @@ -5,10 +5,15 @@
>  ################################################################################
>  
>  # Source taken from the Linux kernel tree
> -PERF_SOURCE =
>  PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +PERF_SOURCE = linux-$(PERF_VERSION).tar.xz
> +ifeq ($(findstring x2.6.,x$(PERF_VERSION)),x2.6.)
> +PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> +else
> +PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
> +endif

Unfortunately, this works only if an upstream kernel tarball is
selected. However, that's not really the case in many situations: a lot
of people use tarballs from custom locations, or a kernel coming from a
Git repository. And for all those cases, your definition of PERF_SITE
will not work.

The simplest solution is quite probably to apply your perf patches to
your kernel tree. You can use BR2_GLOBAL_PATCH_DIR to apply custom
patches to your kernel tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
