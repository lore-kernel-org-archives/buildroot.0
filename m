From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 18:28:06 +0100
Subject: [Buildroot] [PATCH] systemd: Allow building with no init system
In-Reply-To: <20180917182900.15902-1-tpiepho@impinj.com>
References: <20180917182900.15902-1-tpiepho@impinj.com>
Message-ID: <9ddf2016-0a94-d873-311a-e1565386801e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Trent,

On 17/09/2018 19:29, Trent Piepho wrote:
> It's possible to build systemd, and use the systemd libraries, on a
> target with no init system.
> 
> While installing systemd when trying to use SysV init will result in
> systemd clobbering the SysV system and vice versa, it may well work when
> no init system has been selected.  For instance, when building an SDK
> the sytemd headers and libraries might be necessary but there is no
> reason to have an init system selected.  Someone creating a custom init
> system might also want some of the systemd libraries.

 I understand your reasoning and I tend to agree to some extent.

 However, for the use cases you mention, you can actually just enable
BR2_INIT_SYSTEMD. If you really don't want /sbin/init in your target, just
remove it post-build.

 To *properly* support a libsystemd-only configuration, a lot more should
change. Basically, nothing should be installed in target except for
libsystemd.so (and the header files which will be removed in finalize). Also,
there is a possible conflict with eudev that needs to be resolved. Possibly
other things would need to be cleaned up as well.

 But basically, we don't really see a use case that warrants all this additional
complexity. Just enable BR2_INIT_SYSTEMD and clean up post-build.

 Regards,
 Arnout

> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/systemd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index c858d89c05..71d37f6a5a 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>  
>  menuconfig BR2_PACKAGE_SYSTEMD
>  	bool "systemd"
> -	depends on BR2_INIT_SYSTEMD
> +	depends on BR2_INIT_SYSTEMD || BR2_INIT_NONE
>  	depends on !BR2_STATIC_LIBS # kmod
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>  	depends on BR2_USE_MMU # dbus
> 
