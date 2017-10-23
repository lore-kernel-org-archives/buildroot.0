From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:14:27 +0200
Subject: [Buildroot] [PATCH 1/1] boost: require NPTL
In-Reply-To: <20171023183413.18288-1-aduskett@gmail.com>
References: <20171023183413.18288-1-aduskett@gmail.com>
Message-ID: <7e35a843-015c-71bf-ef96-f956a76961da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 23-10-17 20:34, Adam Duskett wrote:
> pin_thread.cpp:31:39: error: '::pthread_setaffinity_np' has not been declared [1]
> 
> 
> [1]
> http://autobuild.buildroot.net/results/029/0298038fc126d15733d81c54e0bb7cb00be48b92/build-end.log
> http://autobuild.buildroot.net/results/6f3/6f3a218c47204e431100799482a3ed0ec159fa15/build-end.log
> http://autobuild.buildroot.net/results/63e/63e5569a90d3ace97cb6102509cbd04aeab6f5f7/build-end.log
> 
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/boost/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 3b3c89b8c1..e06529a3fe 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -1,9 +1,10 @@
> -comment "boost needs a toolchain w/ C++, threads, wchar"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +comment "boost needs a toolchain w/ C++, threads, wchar, NTPL"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL

 You don't need to specify both _HAS_THREADS and HAS_THREADS_NPTL - the second
impies the first.

 Also in the comment you can put "NPTL threads" instead of "threads, ..., NPTL".
Oh, and it's NPTL (New Posix Threads Library), not NTPL.

>  
>  config BR2_PACKAGE_BOOST
>  	bool "boost"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	# Boost could theorically be built with threading=single, but
>  	# that unfortunately doesn't work. Until someone fixes that,
>  	# let's depend on threads.

 Same here of course.

 And finally: don't forget to propagate to the reverse dependencies. Yes, it is
terribly annoying, but Kconfig has no way to avoid it.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
