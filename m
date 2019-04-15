From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 14:17:13 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2019 22:17, Yann E. MORIN wrote:
> Users are increasingly trying to extract information about packages. For
> example, they might need to get the list of URIs, or the dependencies of
> a package.
> 
> Although we do have a bunch of rules to generate some of that, this is
> done in ad-hoc way, with most of the output formats just ad-hoc, raw,
> unformatted blurbs, mostly internal data dumped as-is.
> 
> Introduce a new rule, show-info, that provides a properly formatted
> output of all the meta-information about packages: name, type, version,
> licenses, dependencies...
> 
> We choose to use JSON as the output format, because it is pretty
> versatile, has parsers in virtually all languages, has tools to parse
> from the shell (jq).

 Actually, OpenWrt has a couple of bash functions to convert JSON into bash
variables. If we start making extensive use of show-info, it might be worth
copying that.

> It also closely matches Python data structure,
> which makes it easy to use with our own internal tools as well. Finally,
> JSON being a key-value store, allows for easy expanding the output
> without requiring existing consumers to be updated; new, unknown keys
> are simply ignored by those (as long as they are true JSON parsers).
> 
> The complex part of this change was the conditional output of parts of
> the data: virtual packages have no source, version, license or
> downloads, unlike non-virtual packages. Same goes for filesystems. We
> use a wrapper macro, show-info, that de-multiplexes unto either the
> package-related- or filesystem-related macros, and for packages, we also
> use a detailed macro for non-virtual packages.
> 
> It is non-trivial to properly output correct JSON blurbs, especially
> when trying to output an array of objects, like so, where the last item
> shall not be followed by a comma:  [ { ... }, { ... } ]
> 
> So, we use a trick (as sugegsted by Arnout), to $(subst) any pair of
> ",}" or ", }" or ",]" or ", ]" with only the respective closing symbol,
> "}" or "]".
> 
> The whole stuff is $(strip)ed to make it a somewhat-minified JSON blurb
> that fits on a single line with all spaces squashed (but still with
> spaces, as it is not possible to differentiate spaces between JSON
> elements from spaces inside JSON strings).

 The implicit assumption here is that show-info will never include anything
where whitespace is significant. Which I think is a valid assumption (I don't
expect any whitespace at all anywhere within the keys or values, except for the
license list where the whitespace is usually a list separator anyway).

> 
> Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - make it a macro to be called  (Arnout)
>   - make it a top-level rule  (Arnout)
> ---
>  Makefile             | 15 ++++++++++++
>  package/pkg-utils.mk | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 60bf7d7d08..33215f91e5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -903,6 +903,21 @@ check-dependencies:
>  	@cd "$(CONFIG_DIR)"; \
>  	$(TOPDIR)/support/scripts/graph-depends -C
>  
> +.PHONY: show-info
> +show-info:
> +	@:
> +	$(info $(call clean-json, \
> +			$(foreach p, \
> +				$(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
> +						$(i) \
> +						$($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \

 So, with the comment I made in the earlier patch, this line won't be needed
anymore because packages already contains *_FINAL_RECURSIVE_DEPENDENCIES. Boy,
this is too good to be true...

> +					) \
> +				), \
> +				$(call show-info,$(call UPPERCASE,$(p)))$(comma) \
> +			) \
> +		) \
> +	)
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  # Some subdirectories are also package names. To avoid that "make linux"
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index bffd79dfb0..00d1d6bcac 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -62,6 +62,74 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
>  endif
>  endef
>  
> +# show-info -- return package or filesystem metadata formatted as an entry
> +#              of a JSON dictionnary
> +# $(1): upper-case package or filesystem name
> +define show-info

 Really nitpicking here: this function is not showing anything. So maybe
'json-info' is better. Same for the internal functions obviously.

> +	"$($(1)_NAME)": {
> +		"type": "$($(1)_TYPE)",

 I may be exaggerating here, but I am getting a bit confused between commas that
are intrepreted by make and the JSON commas. Maybe we should consistently use
$(comma) for the commas that go into the output, even if it is not needed like here?

> +		$(if $(filter rootfs,$($(1)_TYPE)), \
> +			$(call _show-info-fs,$(1)), \
> +			$(call _show-info-pkg,$(1)), \

 Very elegant!

> +		)
> +	}
> +endef
> +
> +# _show-info-pkg, _show-info-pkg-details, _show-info-fs: private helpers
> +# for show-info, above
> +define _show-info-pkg
> +	$(if $($(1)_IS_VIRTUAL), \
> +		"virtual": true$(comma),

 Again, I may be exaggerating, but I would find it more aesthetically pleasing
to put the
		"virtual": false$(comma)
here rather than in the pkg-details.

> +		$(call _show-info-pkg-details,$(1)) \
> +	)
> +	"dependencies": [
> +		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
> +	],
> +	"reverse_dependencies": [
> +		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
> +	]
> +endef

 Add an empty line here.

> +define _show-info-pkg-details
> +	"virtual": false,
> +	"version": "$($(1)_DL_VERSION)",
> +	"licenses": "$($(1)_LICENSE)",

 I'm torn here...

 The licenses could be converted into a list - actually, it is already a list,
just missing the quotes. But clearly, converting that into a JSON list in make
syntax is... a challenge.

 However, I'm actually dreaming of making the license statement a SPDX
expression instead of a list (i.e. conjoined with AND and OR, and with
parenthesis; unfortunately, SPDX has no syntax to express that it only applies
to a part, e.g. GPL (programs) is not valid SPDX). Then it is no longer a list.

 And we should make a decision now, we're defining "userspace ABI" here so it's
difficult to switch the string to a list or vice versa later.


> +	"downloads": [
> +	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
> +		{
> +			"source": "$(notdir $(dl))",
> +			"URIs": [

 I would prefer all keys to be consistent case, i.e. lowercase.

> +				$(call make-comma-list,
> +					$(subst \|,|,
> +						$(call DOWNLOAD_URIS,$(dl),$(1))
> +					)
> +				)
> +			]
> +		},
> +	)
> +	],
> +endef

 Empty line again.

> +define _show-info-fs
> +	"dependencies": [
> +		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
> +	]
> +endef
> +
> +# clean-json -- cleanup pseudo-json into clean json:
> +#  - adds opening { and closing }

 I don't think it's appropriate that clean-json does that. Without it, you can
call clean-json as often as you like.

> +#  - remove commas before closing ] and }
> +#  - minify with $(strip)
> +clean-json = $(strip \

 Why strip a second time?

> +	$(subst $(comma)},, \
                          ^}

> +		$(subst $(comma)$(space)},$(space)}, \
> +			$(subst $(comma)],, \
                                          ^]

> +				$(subst $(comma)$(space)],$(space)], \
> +					{ $(strip $(1)) } \
> +				) \

 Even though incorrect, I think this would be more readable and maintainable by
not indenting the nested subst's:

	$(subst $(comma)},},
	$(subst $(comma)],],
	$(subst $(comma)$(space)},$(space)},
	$(subst $(comma)$(space)],$(space)],
		$(strip $(1))
	))))

 Regards,
 Arnout

> +			) \
> +		) \
> +	) \
> +)
> +
>  #
>  # legal-info helper functions
>  #
> 
