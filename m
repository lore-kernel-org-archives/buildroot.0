From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Jul 2015 00:40:20 +0200
Subject: [Buildroot] [PATCH] ARC: allow selection of MMU page size
In-Reply-To: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
References: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <55A832D4.9020801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/16/15 21:04, Alexey Brodkin wrote:
> Modern ARC cores (those sporting MMU of version 3 and 4) allow selection
> of different page sizes (4, 8 or 16 kB) during ASIC design creation.
> And it's important to build a toolchain with page size setting that matches
> hardware.
> 
> Otherwise user-space applications will fail on execution due to
> unexpected data layout/alignment etc.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> c: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arc       | 30 ++++++++++++++++++++++++++++++
>  package/uclibc/uclibc.mk |  8 ++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index b48a90f..e960eb8 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -40,3 +40,33 @@ config BR2_GCC_TARGET_CPU
>  	default "arc700" if BR2_arc750d
>  	default "arc700" if BR2_arc770d
>  	default "archs"	 if BR2_archs38
> +
> +choice
> +	prompt "MMU Page Size"

 It is not really current policy, but wouldn't it make more sense to do

	prompt "MMU Page Size" if BR2_arc770d || BR2_archs38

? (i.e., only show it when there's anything to choose).

 Also perhaps it makes sense to add a new symbol
BR2_ARC_SUPPORTS_PAGE_SIZE_SELECTION or similar instead of specifying the
individual processors.


 Regards,
 Arnout

> +	default BR2_arc_page_size_8k
> +	help
> +	    MMU starting from version 3 (could be found in ARC 770) and now
> +	    version 4 (could be found in ARC HS38) allows selection of page
> +	    size during ASIC design creation. And it's important to build
> +	    a toolchain with page size setting that matches hardware.
> +	    Otherwise user-space applications will fail on execution due to
> +	    unexpected data layout/alignment.
> +
> +config BR2_arc_page_size_4k
> +	bool "4KB"
> +	depends on BR2_arc770d || BR2_archs38
> +
> +config BR2_arc_page_size_8k
> +	bool "8KB"
> +
> +config BR2_arc_page_size_16k
> +	bool "16KB"
> +	depends on BR2_arc770d || BR2_archs38

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
