From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 00:37:17 +0100
Subject: [Buildroot] [PATCH 2/8] core/pkg-utils: add a macro to
 pretty-print a help entry
In-Reply-To: <3c47341f237bad2ed0c674c2ffe1def03a2bdb64.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <3c47341f237bad2ed0c674c2ffe1def03a2bdb64.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <56E0B3AD.2040104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:22, Yann E. MORIN wrote:
> To ensure that all the help entries we display are all formatted the
> same, we currently indent the help texts manually.
>
> Also, when a br2-external tree wants to display local custom help, they
> have to rely on a hard-coded layout (if they want to match our iwn
> output, which is not mandatory).
>
> Add a macro to pretty-print make rules in the help texts.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/pkg-utils.mk | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index f88313a..873dbec 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -104,6 +104,19 @@ define sep
>
>   endef
>
> +# Pretty-print a make rule in the help text
> +#
> +# $(1): a list of double- or single-quoted string representing the rule
> +#       and their help text, formatted as:  "action : help for action"
> +#       'action' should be less than 22 characters, otherwise the help
> +#       text will not be correctly indented.
> +#
> +define HELP_RULE

  Most of our functions are lowercase. Perhaps print-help?

  If we don't have the help-local indirection but directly do it in the 
top-level help, then there's no need for an additional function.

  Regards,
  Arnout

> +	for h in $(1); do \
> +		printf "  %-22s - %s\n" "$${h%% : *}" "$${h#* : }"; \
> +	done
> +endef
> +
>   # check-deprecated-variable -- throw an error on deprecated variables
>   # example:
>   #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
