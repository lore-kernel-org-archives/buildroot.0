From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:16:38 +0200
Subject: [Buildroot] [PATCH 23/67] libgail: libglib2 requires threads
In-Reply-To: <1373917670-30006-24-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
 <1373917670-30006-24-git-send-email-spenser@gillilanding.com>
Message-ID: <20130716101638.0f741513@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Mon, 15 Jul 2013 14:47:06 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libgail/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libgail/Config.in b/package/libgail/Config.in
> index ba74795..3e1af62 100644
> --- a/package/libgail/Config.in
> +++ b/package/libgail/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_LIBGAIL
>  	bool "libgail"
> +	depends on BR2_USE_WCHAR # pango -> libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
>  	depends on BR2_PACKAGE_LIBGTK2
>  	select BR2_PACKAGE_PANGO
>  	help
> @@ -16,3 +18,7 @@ config BR2_PACKAGE_LIBGAIL
>  	  program.
>  
>  	  http://developer.gnome.org/projects/gap
> +
> +comment "libgail requires a toolchain with WCHAR and threading support"
> +	depends on BR2_PACKAGE_LIBGTK2 && \
> +		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)

This one doesn't seem useful: the libgail package already has a
dependency on libgtk2, so it can't be enabled if gtk2 is not enabled.
And gtk2 can only be enabled if wchar and threads are available.

So this patch is not useful.

Remember: propagation of "depends on" is needed from package A to
package B when package B selects package A. If package B depends on
package A, then there's no point in propagating the "depends on" of
package A to package B.

More aspirin? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
