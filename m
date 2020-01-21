From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Jan 2020 23:23:36 +0100
Subject: [Buildroot] [PATCH v2 1/1] perl: Add option to enable threads
In-Reply-To: <20200121192916.63356-1-clayton.shotwell@rockwellcollins.com>
References: <20200121192916.63356-1-clayton.shotwell@rockwellcollins.com>
Message-ID: <f5353499-031e-078a-f3a1-a72826e3f0d4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/01/2020 20:29, Clayton Shotwell wrote:
> From: Hector Kesari <hector.kesari@rockwellcollins.com>
> 
> Add config option for Perl to enable threads usage.
> 
> Signed-off-by: Hector Kesari <hector.kesari@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> ---
> Changes v1 -> v2:
>   - Changed references of PERL to Perl
>   - Added a warning about using Perl threads
> ---
>  package/perl/Config.in | 13 +++++++++++++
>  package/perl/perl.mk   |  4 ++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/perl/Config.in b/package/perl/Config.in
> index 32a3fd2ee9..34b87ee575 100644
> --- a/package/perl/Config.in
> +++ b/package/perl/Config.in
> @@ -24,4 +24,17 @@ config BR2_PACKAGE_PERL_MODULES
>  	  Leave empty for all modules (as far as the external libraries
>  	  are available).
>  
> +config BR2_PACKAGE_PERL_ENABLE_THREADS
> +	bool "Support for Threads in Perl"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Enable use of threads in Perl scripts
> +
> +	  WARNING: The use of interpreter-based threads in Perl
> +	  is officially discouraged.
> +	  See https://perldoc.perl.org/threads.html#WARNING

 So why do you want it then?

 Regards,
 Arnout

> +
> +comment "Perl threads need toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  endif
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 0ab81ddb34..e0bbf9cfd4 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -62,6 +62,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>  PERL_CONF_OPTS += -Dusedevel
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PERL_ENABLE_THREADS),y)
> +PERL_CONF_OPTS += -Dusethreads
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  PERL_CONF_OPTS += --all-static --no-dynaloader
>  endif
> 
