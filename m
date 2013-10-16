From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Oct 2013 23:32:07 +0200
Subject: [Buildroot] [PATCH] zmqpp: Remove duplicated thread dependency
 for zmqpp client
In-Reply-To: <1381906247.31664.1.camel@phoenix>
References: <1381906247.31664.1.camel@phoenix>
Message-ID: <525F05D7.5010207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/13 08:50, Axel Lin wrote:
> BR2_PACKAGE_ZMQPP_CLIENT depends on BR2_PACKAGE_ZMQPP which depends on
> BR2_TOOLCHAIN_HAS_THREADS.
> BR2_PACKAGE_ZMQPP_CLIENT is visible only when BR2_TOOLCHAIN_HAS_THREADS is
> enabled, thus remove the duplicated dependency and comment for zmqpp client.

  Since the client itself depends on threads through boost as well as 
through zmqpp, I'd prefer to keep the dependency and comment. That way, 
if zmqpp ever looses its dependency on threads, we don't forget to keep 
it for the client.

  Regards,
  Arnout

>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   package/zmqpp/Config.in | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
> index bbc4f95..bfbdf4b 100644
> --- a/package/zmqpp/Config.in
> +++ b/package/zmqpp/Config.in
> @@ -22,12 +22,8 @@ comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
>   config BR2_PACKAGE_ZMQPP_CLIENT
>   	bool "zmqpp client"
>   	depends on BR2_PACKAGE_ZMQPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
>   	select BR2_PACKAGE_BOOST
>   	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>   	help
>   	  Build and install the zmqpp client, a command line tool that can be
>   	  used to listen or send to zeromq sockets.
> -
> -comment "zmqpp client needs a toolchain w/ threads"
> -	depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
