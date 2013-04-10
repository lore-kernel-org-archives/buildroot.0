From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Apr 2013 08:11:57 +0200
Subject: [Buildroot] [PATCH v3 1/7] arch: toolchain: Introduce binary
	formats BINFMT_*.
In-Reply-To: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
References: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <516502AD.5080104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Sonic,

On 09/04/13 08:29, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> v3-changes:

  Please put your changelog below the Signed-off-by line, separated by ---
This way, the changelog doesn't appear in the final git commit log (it's 
anyway not relevant anymore).

> - Rename the BINFMT dependency names in external toolchain config file.
> - Add some help text to BINFMT macros.
>
> v2-changes:
> none
>
> v1-changes:
> - Just introduce the symbol and options in arch generic Config.in.
> Append FLAT format link flags to external toolchain wrapper.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>   arch/Config.in                                     |   29 ++++++++++++++++++++
>   toolchain/toolchain-external/Config.in             |   12 ++++----
>   toolchain/toolchain-external/ext-tool.mk           |    4 +++
>   .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
>   4 files changed, 42 insertions(+), 6 deletions(-)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index 472b10c..5dd6467 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -174,6 +174,35 @@ config BR2_GCC_TARGET_ABI
>   config BR2_GCC_TARGET_CPU
>   	string
>
> +# Set up target binary format
> +choice
> +	prompt "Target Binary Format"

  I don't really like to have this choice-which-isn't-really-a-choice for 
all platforms. I think the following should work:

	prompt "Target Binary Format" if BR2_bfin

> +	default BR2_BINFMT_ELF

  There should be a default for blackfin as well. So either put

	default BR2_BINFMT_FDPIC if BR2_bfin
	default BR2_BINFMT_ELF

  or alternatively you can put a 'default y' at the appropriate places below.


> +config BR2_BINFMT_ELF

  This symbol isn't used anywhere. Does it make sense to have it? We only 
need a binfmt choice on platforms that offer the choice, right?

> +	bool "ELF"
> +	depends on !BR2_bfin
> +	help
> +	  ELF (Executable and Linkable Format) is a format for libraries and
> +	  executables used across different architectures and operating
> +	  systems.

  An empty line between the config options would be nice.

> +config BR2_BINFMT_FDPIC
> +	bool "FDPIC"
> +	depends on BR2_bfin
> +	help
> +	  ELF FDPIC binaries are based on ELF, but allow the individual load
> +	  segments of a binary to be located in memory independently of each
> +	  other. This makes this format ideal for use in environments where no
> +	  MMU is available.

  I like this help text! It's very clear.

  Regards,
  Arnout

> +config BR2_BINFMT_FLAT
> +	bool "FLAT"
> +	depends on BR2_bfin
> +	select BR2_PREFER_STATIC_LIB
> +	help
> +	  FLAT binary is a relatively simple and lightweight executable format
> +	  based on the original a.out format. It is widely used in environment
> +	  where no MMU is available.
> +endchoice
> +
>   if BR2_arm || BR2_armeb
>   source "arch/Config.in.arm"
>   endif
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
