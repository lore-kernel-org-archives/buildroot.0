From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 21:47:00 +0100
Subject: [Buildroot] [PATCH] linux: make custom versions and patches
 exclusive
In-Reply-To: <1420582613-27692-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1420582613-27692-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150107214700.5474b6ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Tue,  6 Jan 2015 17:16:53 -0500, Vivien Didelot wrote:
> When using a custom kernel (custom tarball, repository or local tree),
> we're using the OVERRIDE_SRCDIR internally, which means we do not apply
> patches. Since this is the expected behavior, show the
> LINUX_KERNEL_PATCH option only when using a vanilla kernel.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  linux/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index bf30426..3845758 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -119,6 +119,9 @@ config BR2_LINUX_KERNEL_VERSION
>  
>  config BR2_LINUX_KERNEL_PATCH
>  	string "Custom kernel patches"
> +	depends on BR2_LINUX_KERNEL_LATEST_VERSION || \\
> +		  BR2_LINUX_KERNEL_SAME_AS_HEADERS || \\
> +		  BR2_LINUX_KERNEL_CUSTOM_VERSION
>  	help
>  	  A space-separated list of patches to apply to the
>  	  kernel. Each patch can be described as an URL, a local file

While I agree that we cannot apply patches when using
BR2_LINUX_KERNEL_CUSTOM_LOCAL, I think there is no reason to not
support patches when using a custom Git or Mercurial repository. It
works currently (contrary to the local case, which doesn't work), and I
don't see a reason to prevent these use cases. To me, they are very
valid: I can be using a custom vendor-provided kernel tree, and still
need to have some local patches to adapt the kernel to my board. Of
course, I could put those patches in my own kernel Git repository, but
if I don't have many of them, it might be more convenient to just have
those few patches in the Buildroot tree.

So, I think the patch should be changed to use instead:

	depends on !BR2_LINUX_KERNEL_CUSTOM_LOCAL

I've marked the patch as Changes Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
