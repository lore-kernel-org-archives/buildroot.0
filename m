From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Mar 2017 18:53:25 +0200
Subject: [Buildroot] [PATCHv3] core: enhance printvars
In-Reply-To: <20170329094305.18098-1-yann.morin.1998@free.fr>
References: <20170329094305.18098-1-yann.morin.1998@free.fr>
Message-ID: <6a1b3b90-b904-bcb5-bddb-d4fbee65dbb6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-03-17 11:43, Yann E. MORIN wrote:
> Currently, the output of printvars copntains the name of the variable,
                                       ^
 Didn't notice it before :-)

> its expanded value and its un-expanded value.
> 
> However, most of the time, we need the actual, expanded value, so it can
> be re-used from a (non-Buildroot) infrastructure script, like a
> post-build script, or a build-farm driver (e.g. a Jenkins job...)
> 
> Add two options that a user may set to change the output of printvars:
>   - QUOTED_VARS, if set, will quote the value
>   - RAW_VARS, if set, will print the unexpanded value
> 
> The new output by default only prints the expanded value now.
> 
> So that it can be used as such:
> 
>     $ make -s printvars VARS=BUSYBOX_VERSION
>     BUSYBOX_VERSION=1.26.2
> 
>     $ make -s printvars VARS=BUSYBOX_RDEPENDENCIES QUOTED_VARS=YES
>     BUSYBOX_RDEPENDENCIES='ncurses util-linux'
> 
>     $ make -s printvars VARS=BUSYBOX_FINAL_PATCH_DEPENDENCIES RAW_VARS=YES
>     BUSYBOX_FINAL_PATCH_DEPENDENCIES=$(sort $(BUSYBOX_PATCH_DEPENDENCIES))
> 
> And it is even possible to directly evaluate it in a shell script:
> 
>     eval $(make -s printvars VARS=BUSYBOX_VERSION QUOTED_VARS=YES)
> 
> Backward compatibility of the output is not maintained. It is believed
> that scripts that depended on the previous output were very fragile to
> begin with, because they had to filter the non-formatted output
> (splitting on spaces or braces was not really possible, because values
> could contain either).
> 
> Document printvars and its options in the manual; list it in the output
> of 'make help'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(I didn't test this version of the patch anymore)

[snip]
> diff --git a/Makefile b/Makefile
> index cceae92..886bd96 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -940,7 +940,10 @@ printvars:
>  		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>  		$(if $(filter-out environment% default automatic, \
>  				$(origin $V)), \
> -		$(info $V=$($V) ($(value $V)))))
> +		$(if $(QUOTED_VARS),\
> +			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> +			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
> +# ' Syntax colouring...

 To avoid that, you could use $(QUOTE) instead of '

 Actually, it would make sense to factor the quoting with the construct we
already have in the definition of PRINTF (in support/misc/utils.mk). But it's
simple enough that I don't mind the duplication.

 Just for the heck of it, here is some make magic that avoids any duplication
but looks horrible:

nop = $(1)
shellquote = '$(subst ','\'',$(1))'
printvars:
	@$(foreach V, \
		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
		$(if $(filter-out environment% default automatic, $(origin $V)), \
			$(info $V=$(call $(if $(QUOTED_VARS),shellquote,nop),$(if $(RAW_VARS),$(value
$V),$($V))))))

 Ah, make is really ideal for coding golf :-)

>  
>  clean:
>  	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
> @@ -1018,6 +1021,7 @@ help:
>  	@echo '  source-check           - check selected packages for valid download URLs'
>  	@echo '  external-deps          - list external packages used'
>  	@echo '  legal-info             - generate info about license compliance'
> +	@echo '  printvars              - dump all the internal variables'
>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
