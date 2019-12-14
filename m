From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 21:21:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 sandboxing support
In-Reply-To: <20191214142216.2609541-1-aperez@igalia.com>
References: <20191214142216.2609541-1-aperez@igalia.com>
Message-ID: <20191214212150.6c81132b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 16:22:16 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Add an option to enable WebKit's sandbox, which uses kernel
> namespaces to isolate the processes used for Web content rendering
> (WebKitWebProcess) and network/disk access (WebKitNetworkProcess).
> 
> The reason to have an option is that it needs additional dependencies
> (bubblewrap, xdg-dbus-proxy, libseccomp), and that some users may
> choose to deploy alternative solution (for example: putting all
> of WebKit inside its own container, using systemd-nspawn or the
> like).
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/Config.in    | 14 ++++++++++++++
>  package/wpewebkit/wpewebkit.mk | 14 ++++++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index f1460db20e..37a3065761 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -63,6 +63,20 @@ config BR2_PACKAGE_WPEWEBKIT
>  
>  if BR2_PACKAGE_WPEWEBKIT
>  
> +config BR2_PACKAGE_WPEWEBKIT_SANDBOX
> +	bool "sandboxing support"
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
> +	select BR2_PACKAGE_BUBBLEWRAP # runtime
> +	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime

Didn't you forgot a:

	select BR2_PACKAGE_LIBSECCOMP

here ? No need to resend just for that, can be fixed when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
