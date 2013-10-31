From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Oct 2013 18:39:58 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: disable on AVR32
In-Reply-To: <1383209956-31840-1-git-send-email-alexander.lukichev@gmail.com>
References: <1383209956-31840-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <527295EE.9030801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/13 09:59, Alexander Lukichev wrote:
> openpgm doesn't build correctly on AVR32 using
> gcc-4.2.2-avr32-2.1.5 toolchain: it is configured to call
> intrinsic atomic functions not provided by the toolchain,
> so they are propagated as unresolved external symbols in the
> built openpgm libraries. This breaks programs that try to link
> openpgm, because they do not know where to get those either. For
> instance, it breaks building zeromq tests when PGM support is
> selected.
>
> This commit disables openpgm on AVR32 due to apparent absence of
> interest in this package on that architecture and it breaking too
> many test builds.
>
> Fixes http://autobuild.buildroot.net/results/5a3261109ea63ba17375003eabd8b5d88757865f/
> (at least)
>
> Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>

  Good plan! However, your patch is incomplete.

> ---
>   package/openpgm/Config.in | 5 +++++
>   package/zeromq/Config.in  | 1 +
>   2 files changed, 6 insertions(+)
>
> diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
> index cae74f7..94733cd 100644
> --- a/package/openpgm/Config.in
> +++ b/package/openpgm/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_OPENPGM
>   	bool "openpgm"
> +	depends on !BR2_avr32
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INET_IPV6
>   	depends on BR2_USE_WCHAR
> @@ -14,3 +15,7 @@ config BR2_PACKAGE_OPENPGM
>
>   comment "openpgm needs a toolchain w/ wchar, threads, IPv6"
>   	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6 && BR2_USE_WCHAR)
> +	depends on !BR2_avr32
> +
> +comment "openpgm is BROKEN on AVR32"
> +	depends on BR2_avr32

  This comment isn't needed. We don't do it for other packages, and 
adding it would make it even more work to disable architectures.

> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> index 42e13d2..3e8516c 100644
> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -30,6 +30,7 @@ config BR2_PACKAGE_ZEROMQ
>   config BR2_PACKAGE_ZEROMQ_PGM
>   	bool "PGM/EPGM support"
>   	depends on BR2_PACKAGE_ZEROMQ
> +	depends on !BR2_avr32

  zeromq has a lot of reverse dependencies: cppzmq, czmq, filemq, 
mongrel2, [python-pyzmq not necessary because python needs MMU], [zmqpp 
already disabled for avr32]. And there's one more transitive dependency 
to zyre. So all these should also be disabled.

  Regards,
  Arnout

>   	select BR2_PACKAGE_OPENPGM
>   	help
>   	  Add support for Pragmatic General Multicast protocol (RFC 3208)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
