From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 8 Jun 2018 11:45:00 +0200
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add dependency on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20180607230144.387-1-xuminready@gmail.com>
References: <20180607230144.387-1-xuminready@gmail.com>
Message-ID: <630c76ca-9a08-115d-5c32-85567237d012@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Min,

 Thank you for your speedy reaction!

On 08-06-18 01:01, Min Xu wrote:
> To fixup linking errors:
> "undefined reference to `__sync_val_compare_and_swap_4'"
> Fixes
> http://autobuild.buildroot.net/results/d00c5f9e1e7a6a40fac5763a06977b351b7875da
> http://autobuild.buildroot.net/results/0612f2dc09a8763fdf2111ee8d0c223c8531262a
> 
> reference: https://git.buildroot.org/buildroot/commit/?id=7c77d965bdcd301c2644004140faec613c1ee202

 No need for this - it's actually confusing, I thought you meant that the
dependency was indirect due to libuv (as is the case in that commit).

> Signed-off-by: Min Xu <xuminready@gmail.com>
> ---
>  package/shadowsocks-libev/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
> index d02e5a93ef..c914ed778b 100644
> --- a/package/shadowsocks-libev/Config.in
> +++ b/package/shadowsocks-libev/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_SHADOWSOCKS_LIBEV
>  	bool "shadowsocks-libev"
> +	# uses __sync_val_compare_and_swap_4

 It actually uses the __sync_val_compare_and_swap macro, so the actual function
that is called depends on sizeof(int) and sizeof(void*)...

> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

 ... so I think we also need

	depends on BR2_TOOLCHAIN_HAS_SYNC_8 if BR2_ARCH_IS_64

although in practice of course all 64-bit arches have sync_8.

 BTW I checked, it really needs sync, it can't use atomics.

 Oh, and I also noticed that it seems to unconditionally require pthreads.

 Regards,
 Arnout

>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_C_ARES
>  	select BR2_PACKAGE_LIBEV
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
