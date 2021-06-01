From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:19:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftrace: needs dynamic library
In-Reply-To: <20210527184921.15596-1-fontaine.fabrice@gmail.com>
References: <20210527184921.15596-1-fontaine.fabrice@gmail.com>
Message-ID: <1d0b20c0-07e9-2f45-0255-e4c92aaa54f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2021 20:49, Fabrice Fontaine wrote:
> Since its addition in commit 09c97972d9f90b69cfc36f9ffe9e22c13daf9307,
> uftrace always build dynamic library which will raise the following
> build failure:
> 
>   LINK     libmcount/libmcount.so
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/crtbeginT.o: relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be used when making a shared object

 This line is *really* long, so I elided the long paths and applied to master,
thanks.

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/980bb38c6417bd48828379677762382030c5b28a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/uftrace/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
> index 6de9b840ba..98ddb7cbfb 100644
> --- a/package/uftrace/Config.in
> +++ b/package/uftrace/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_UFTRACE
>  	bool "uftrace"
>  	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_ARGP_STANDALONE if \
>  	       BR2_TOOLCHAIN_USES_UCLIBC || \
>  	       BR2_TOOLCHAIN_USES_MUSL
> @@ -22,6 +23,6 @@ config BR2_PACKAGE_UFTRACE
>  
>  	  https://github.com/namhyung/uftrace
>  
> -comment "uftrace needs a toolchain w/ threads"
> +comment "uftrace needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 
