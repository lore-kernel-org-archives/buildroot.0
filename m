From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 12:36:21 +0200
Subject: [Buildroot] [PATCH] core: postpone evaluation on decompressor
	dependencies
In-Reply-To: <20170702103030.2210-1-yann.morin.1998@free.fr>
References: <20170702103030.2210-1-yann.morin.1998@free.fr>
Message-ID: <20170702123621.67df4ae7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Jul 2017 12:30:30 +0200, Yann E. MORIN wrote:
> Currently, we build any extractor dependency as soone as the host

soone -> soon

> utility is missing, even when such utility is not needed.
> 
> That is expecially the case for host-lzip, which is lacking except in

expecially -> especially

> the most recent distributions, and thus is always built, which is a bit

I'm not sure to understand the "except in the most recent
distributions". Indeed, even in the most recent distributions, lzip may
not be installed.

> of a shame since only very few packages need it.
> 
> To fix that, we change the host dependecies check to set a variable
> named after the extension they support, to the name of the host package
> that provides the necessary decompressor, if not installed on the host.
> 
> Then, we introduce a new variable, UNCOMP_TOOLS_DEPENDENCIES, to which

I think EXTRACT_TOOLS_DEPENDENCIES would be easier to understand. Yes,
it's not technically extraction but uncompression, but they are needed
as part of Buildroot "extract" step for each package, so I believe
EXTRACT_TOOLS_DEPENDENCIES would be better.

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f474704980..5745a9cfcf 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -942,6 +942,7 @@ DL_TOOLS_DEPENDENCIES += cvs
>  endif # SITE_METHOD
>  
>  DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
> +UNCOMP_TOOLS_DEPENDENCIES += $$(UNCOMP_TOOL_DEPENDENCY$$(suffix $$($(2)_SOURCE)))

I know we looked at it yesterday, but I again don't remember what
extractor-dependency is for. When looking at this code, it seems a bit
weird that extractor dependencies are added to DL_TOOLS_DEPENDENCIES
and "uncompressor dependencies" are added to UNCOMP_TOOLS_DEPENDENCIES.

Can we clarify this ? Should the output of extractor-dependency be added
to UNCOMP_TOOLS_DEPENDENCIES ? Do we need both extractor-dependency and
UNCOMP_TOOL_DEPENDENCY ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
