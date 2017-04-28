From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Apr 2017 21:53:18 +0200
Subject: [Buildroot] [PATCH] ola: mark as broken
In-Reply-To: <78a929f7208b78d17f45d4ddb8bc8df7f26ba74b.1493388478.git.baruch@tkos.co.il>
References: <78a929f7208b78d17f45d4ddb8bc8df7f26ba74b.1493388478.git.baruch@tkos.co.il>
Message-ID: <939b0c39-d10b-c699-8367-41f7e57cd4fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-04-17 16:07, Baruch Siach wrote:
> Build with current protobuf is broken. Mark as broken until upstream resolves
> this issue.

 We kind of decided a few months ago not use BROKEN anymore, except if we expect
that it will be repaired again very soon. The idea was that any BROKEN thing
would be converted into removal with legacy handling at time of release. Do we
expect the issue to be fixed by then?

 If not (probably not), I believe the proper approach is to remove, with legacy
handling. If the issue gets fixed somewhere down the line, the removal can be
reverted again.

 Make sure the help text of the legacy symbol clearly describes the problem, so
that anyone who actually needs the package can try to fix it.

 Regards,
 Arnout

> 
> https://github.com/OpenLightingProject/ola/issues/1192
> 
> Fixes:
> http://autobuild.buildroot.net/results/d9a/d9a24f7b715100be1580a568a5e3ff72b0389165/
> http://autobuild.buildroot.net/results/b31/b314811dedce04ebdc779df67de6cb59a1880cac/
> http://autobuild.buildroot.net/results/587/5877b2301b7da43c50127a4c5f648acd3b0264cc/
> 
> Cc: Dave Skok <blanco.ether@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ola/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/ola/Config.in b/package/ola/Config.in
> index 90a92fd2f2f4..656e82529a99 100644
> --- a/package/ola/Config.in
> +++ b/package/ola/Config.in
> @@ -1,6 +1,7 @@
>  comment "ola needs a toolchain w/ C++, threads, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| BR2_STATIC_LIBS
> +	depends on BROKEN
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  menuconfig BR2_PACKAGE_OLA
> @@ -8,6 +9,9 @@ menuconfig BR2_PACKAGE_OLA
>  	select BR2_PACKAGE_PROTOBUF
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	select BR2_PACKAGE_UTIL_LINUX
> +	# Build fails with current protobuf
> +	# https://github.com/OpenLightingProject/ola/issues/1192
> +	depends on BROKEN
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf
>  	depends on !BR2_STATIC_LIBS # protobuf
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
