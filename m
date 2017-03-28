From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Mar 2017 22:52:19 +0200
Subject: [Buildroot] [PATCHv2] core: enhance printvars
In-Reply-To: <20170328174052.7927-1-yann.morin.1998@free.fr>
References: <20170328174052.7927-1-yann.morin.1998@free.fr>
Message-ID: <a1058cba-5a4e-f674-c0a3-73e7ab93e57b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-03-17 19:40, Yann E. MORIN wrote:
> Currently, the output of printvars copntains the name of the variable,
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
> Document printvars and its options in the output of 'make help' and in
> the manual.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 Two nits, one which can be fixed while applying, the other that is probably
better in a follow-up patch. So

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> Changes v1 -> v2:
>   - add the documentation  (Thomas, Arnout)
>   - change the meaning of conmfig variables  (Thomas, Arnout)
>   - don't maintain backward compatibility  (Thomas, Arnout)
> ---
>  Makefile                  |  3 ++-
>  docs/manual/make-tips.txt | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index cceae92..d3530ad 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -940,7 +940,7 @@ printvars:
>  		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>  		$(if $(filter-out environment% default automatic, \
>  				$(origin $V)), \
> -		$(info $V=$($V) ($(value $V)))))
> +		$(info $V=$(if $(QUOTED_VARS),')$(if $(RAW_VARS),$(value $V),$($V))$(if $(QUOTED_VARS),'))))

 Unfortunately, this doesn't fully protect the variable for shell evaluation,
because the value may contain quotes. Try e.g. 'make VARS=BMON_CONF_ENV
QUOTED_VARS=YES'.

 The solution is to add $(subst ','\'',...). But of course only in case of
QUOTED_VARS. Which makes it a little annoying... Probably best to use
$(eval value := $(if $(RAW_VARS),$(value $V),$($V))) \
$(info $V=$(if $(QUOTED_VARS),'$(value)',$(value))

 Since that's pretty complicated, it's better in a separate patch. Anyway a
value that has quotes probably doesn't work well in the shell eval (because the
quotes will normally *not* be interpreted when the variable is used later on).

[snip]
> +
> +The output of quoited raw variables can be reused in shell scripts,
                    ^

 Regards,
 Arnout

> +for example:
> +
> +----
> + eval $(make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=YES QUOTED_VARS=YES)
> +----
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
