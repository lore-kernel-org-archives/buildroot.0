From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:11:16 +0100
Subject: [Buildroot] [PATCH 06/16] uclibc: NPTL thread implementation
 only available on MMU platforms
In-Reply-To: <1458164602-16983-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9E814.7010207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> As indicated by the uClibc-ng source code, the NPTL thread
> implementation is only available on MMU platforms, so we replicate
> this dependency in Buildroot so that the appropriate thread
> implementation is chosen by default on ARM noMMU.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   package/uclibc/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 16bf89c..8be99f8 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -48,6 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
>   choice
>   	prompt "Thread library implementation"
>   	default BR2_PTHREADS_NATIVE
> +	default BR2_PTHREADS_OLD if !BR2_USE_MMU
>   	help
>   	  Use this option to select the thread library implementation
>   	  that should be used in your toolchain.
> @@ -69,6 +70,7 @@ choice
>   		bool "Native POSIX Threading (NPTL)"
>   		select BR2_TOOLCHAIN_HAS_THREADS
>   		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +		depends on BR2_USE_MMU
>   		depends on !BR2_m68k && !BR2_x86_i386
>   endchoice
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
