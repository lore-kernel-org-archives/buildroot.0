From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 20:22:24 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: add sparc64 architecture
 support
In-Reply-To: <20150811203709.GA9885@waldemar-brodkorb.de>
References: <20150811203709.GA9885@waldemar-brodkorb.de>
Message-ID: <20150828202224.2f12a93c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 11 Aug 2015 22:37:09 +0200, Waldemar Brodkorb wrote:
> Introduce sparc64 architecture to buildroot.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  arch/Config.in                          |   12 +++++++++++-
>  arch/Config.in.sparc                    |    9 +++++++--
>  toolchain/toolchain-buildroot/Config.in |    3 ++-
>  3 files changed, 20 insertions(+), 4 deletions(-)

Are you willing to help fixing the autobuilder failures that will be
found on this new architecture? I'm fine with supporting additional
architectures, but Sparc64 seems unlikely to be used in embedded
contexts, so my concern is that it may be just a "demo support". But of
course, if you're fine with helping with autobuilder issues (which you
are already doing with lots of uClibc issues), I'll be happy to merge
this.

One question below, though.


> diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
> index cc10e8d..faf4a11 100644
> --- a/arch/Config.in.sparc
> +++ b/arch/Config.in.sparc
> @@ -1,7 +1,8 @@
>  choice
>  	prompt "Target Architecture Variant"
> -	depends on BR2_sparc
> -	default BR2_sparc_v8
> +	depends on BR2_sparc || BR2_sparc64
> +	default BR2_sparc_v8 if BR2_sparc
> +	default BR2_sparc_v9 if BR2_sparc64
>  	help
>  	  Specific CPU variant to use
>  
> @@ -9,10 +10,13 @@ config BR2_sparc_v8
>  	bool "v8"
>  config BR2_sparc_leon3
>  	bool "leon3"
> +config BR2_sparc_v9
> +	bool "v9"

This means that v8, leon3 or v9 can be selected for either SPARC or
SPARC64. Are SPARCv8 or Leon3 really 64 bit capable CPU variants?

>  endchoice
>  
>  config BR2_ARCH
>  	default "sparc"	if BR2_sparc
> +	default "sparc64" if BR2_sparc64
>  
>  config BR2_ENDIAN
>  	default "BIG"
> @@ -20,3 +24,4 @@ config BR2_ENDIAN
>  config BR2_GCC_TARGET_CPU
>  	default "leon3"		if BR2_sparc_leon3
>  	default "v8"		if BR2_sparc_v8
> +	default "ultrasparc"	if BR2_sparc_v9

Why not using v9 here? It's a valid -mcpu value:

'-mcpu=CPU_TYPE'
     Set the instruction set, register set, and instruction scheduling
     parameters for machine type CPU_TYPE.  Supported values for
     CPU_TYPE are 'v7', 'cypress', 'v8', 'supersparc', 'hypersparc',
     'leon', 'sparclite', 'f930', 'f934', 'sparclite86x', 'sparclet',
     'tsc701', 'v9', 'ultrasparc', 'ultrasparc3', 'niagara', 'niagara2',
     'niagara3', and 'niagara4'.

We will have to add one SPARC64 toolchain to the autobuilders to test
this architecture. Maybe an external toolchain built by Buildroot is
the best option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
