From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 20:44:47 +0200
Subject: [Buildroot] [PATCH] wireguard: needs 3.10+ kernel
In-Reply-To: <20171003080448.3809-1-peter@korsgaard.com>
References: <20171003080448.3809-1-peter@korsgaard.com>
Message-ID: <0b87fcfb-da25-7574-3c7e-e3929383df71@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Peter,

 Looks like I don't manage to apply any of your patches today :-)

On 03-10-17 10:04, Peter Korsgaard wrote:
> The dependency is actually only for the kernel module (and thus on the
> runtime kernel version rather than kernel headers), but as we don't know the
> runtime version in kconfig this will have to do.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wireguard/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
> index 0321755db3..acce6663ba 100644
> --- a/package/wireguard/Config.in
> +++ b/package/wireguard/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WIREGUARD
>  	bool "wireguard"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10

 The kernel module is only built if BR2_LINUX_KERNEL=y, so shouldn't this be

	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_LINUX_KERNEL

? And of course in the comment as well.

 In addition, I think you should add the (abbreviated) contents of the commit
message as a comment here, otherwise it's not at all clear.

 Regards,
 Arnout

>  	select BR2_PACKAGE_LIBMNL
>  	help
>  	  WireGuard is an extremely simple yet fast and modern VPN
> @@ -16,3 +17,6 @@ config BR2_PACKAGE_WIREGUARD
>  	  VPN solution in the industry.
>  
>  	  https://www.wireguard.com
> +
> +comment "wireguard needs a toolchain w/ headers > 3.10"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
