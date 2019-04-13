From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 10:58:13 +0200
Subject: [Buildroot] [PATCH 06/10] infra/pkg-generic: introduce
 foo-show-info
In-Reply-To: <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <2e6876e6-3098-44ee-11b5-f8b900d3b2ee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

 First of all, for me, patches 1-5 or good to go, with or without the changes
proposed by Thomas & Thomas.


On 07/04/2019 13:51, Yann E. MORIN wrote:
> Users are increasingly trying to extract information about packages.
> For example, they might need to get the list of URIs, or the
> dependencies of a package.
> 
> Although we do have a bunch of rules to generate some of that, this is
> done in ad-hic way, with most of the output formats just as-hoc, raw,
> unformatted blurbs, mostly internal data dumped as-is.
> 
> Introduce a new rule, foo-show-info, that provides a properly formatted
> output of all the meta-information about a package: name, type, version,
> licenses, dependencies...

 I love the concept of this patch series, because it makes it much easier to
write external scripts but also to write our own internal scripts (graph-depends
etc.). However, I have a number of gripes with the chosen implementation. Only
the first one is essential, the rest is nice-to-have.

* The null in the downloads list is really silly, and makes life difficult for
the user because it has to be filtered out again (cfr. Thomas's PoC jq script).
So it really has to go.

* I think the structure should always be completely the same. So a virtual
package should still have version: "", licenses: "", downloads: []. This again
makes it easier to process things.

* I think it would be better to output per-package minified strings (i.e.
without whitespace). To make it human-readable, you can just pipe through jq.
The advantage of the minified string is that you can just grep for some metadata
that you're interested in and get all the lines of info that you need - this is
a lot easier than writing a jq filter. It also gives a solution for the null,
because you can just do $(subst $(comma)},},...) to get rid of the redundant comma.

* I absolutely hate these per-package rules. I also don't think it would behave
correctly: I would expect 'make {foo,bar}-show-info' to output JSON, but it
doesn't (as you note for the show-recursive-info). So I think we should just
have a top-level show-info, which uses _FINAL_RECURSIVE_DEPENDENCIES to iterate
over all packages (note that that variable would have to be added for rootfs as
well). If we want to support selecting a subset of packages, we could add
something like the VARS of printvars.

* I have a vague feeling that the _SHOW_INFO variable looks ugly, but I can't
put my finger on it what makes it ugly (or how it could be better).

* Maybe it would be better if the top-level structure where a dict as well:
"pkg": { "type": ... }.

* I think it would be useful to also export either the uppercase name of the
package, or at least the kconfig symbol. In fact, I would export as much info as
we can - though that can of course be done in follow-up patches. infra would be
a nice one, but we don't have a variable for that at the moment.


 Again, except for the stupid null, none of this is important enough for me to
block the merging of this patch. And I can even back down on the null if getting
rid of it is too difficult. This feature trumps any little concerns I may have
about the beauty of it.


> We choose to use JSON as the output format, because it is pretty
> veratile, has parsers in virtually all languages, has tols to parse from
> the shell (jq). It also closely matches Python data structure, which
> makes it easy to use with our own internal tools as well. Finally, JSON
> being a key-value store, allows for easy expanding the output without
> requiring existing consumers to be updated; new, unknown keys are simply
> ignored by those (as long as they are true JSON parsers).
> 
> The complex part of this change was the conditional output of parts of
> the data: virtual packages have no source, version, license or
> downloads, unlike non-virtual packages. 

 So, as I wrote, I think we should keep the same structure, which makes this
extremely trivial because the empty source, version, license variables will just
do the right thing.

> The basic idea was to
> intersperse those conditions directly inside the $(info ...) block.
> However, becasue key-value pairs in JSON are separated with commas, and
> that the comma is also the parameters separator in Makefile, we'd have
> had to use $(comma) to output an actual comma when inside an $(if ...)
> statement, like so:
> 
>     $(if $$($(2)_IS_VIRTUAL), \
>         "virtual": true$(comma), \
>         "virtual": false$(comma) \
>         "version": "$$($(2)_DL_VERSION)"$(comma) \
>         [...]
>     )
> 
> This was, with the trailing '\'i and the indentation, a bit cumbersome
> to handle, and would be difficult to maintain.
> 
> Instead, an intermediate variable is used, which is set conditionally.
> And to make the rest of the information look similar, it is also stored
> in an intermediate variable. This makes it easier to read, and thus to
> maintain (hopefully so).
> 
> Note that we can't set part of the variable conditionally, like so:
> 
>     SOMETHING = YES
>     define FOO
>     ifeq ($(SOMETHING),YES)
>         Meh $(SOMETHING)
>     else
>         Meh --$(SOMETHING)--
>     endif
>     endef
>     $(info $(FOO))
> 
> as that would yield:
> 
>     ifeq (YES,YES)
>         Meh YES
>     else
>         Meh --YES--
>     endif
> 
> So, we use intermediate variables.
> 
> Finally, the variable is $(strip...)ed before being displayed, so as to
> make it fit on a single line, one per package info.

 Oh, I thought strip just stripped starting and trailing whitespace, not the
whitespace in the middle... Apparently I was wrong. So the JSON is in fact
almost-minified already. I wonder, then, what is the value of still adding that
additional space after the comma.

> This is just JSON,
> so it does not matter, but at least it should be parallel-safe in the
> future.

 Well, only if the lines remain under BUFSIZ, and only if you don't unbuffer the
output (i.e. if you don't use brmake...).


> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pkg-generic.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f78ff2e665..72b1a87f5f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -843,6 +843,49 @@ $(1)-external-deps:
>  	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
>  endif
>  
> +ifeq ($$($(2)_IS_VIRTUAL),YES)
> +define $(2)_SHOW_INFO_VIRTUAL
> +	"virtual": true,
> +endef
> +else
> +define $(2)_SHOW_INFO_VIRTUAL
> +	"virtual": false,
> +	"version": "$$($(2)_DL_VERSION)",
> +	"licenses": "$$($(2)_LICENSE)",
> +	"downloads": [
> +	$$(foreach dl,$$($(2)_ALL_DOWNLOADS),
> +		{
> +			"source": "$$(notdir $$(dl))",
> +			"URIs": [
> +			$$(call make-comma-list,
> +				$$(subst \|,|,

 Is this really needed? Isn't "\|" and "|" the same in JSON?

> +					$$(call DOWNLOAD_URIS,$$(dl),$(2))
> +				)
> +			)
> +			]
> +		},
> +	)

 I think you might be able to get rid of the null like this:

	$$(subst }{,}$$(comma){,
		$$(foreach dl,$$($(2)_ALL_DOWNLOADS),{
			...
		})

 Ugly, I know :-)

> +	null
> +	],
> +endef
> +endif
> +
> +define $(2)_SHOW_INFO
> +	"name": "$(1)",
> +	"type": "$(4)",
> +	$$($(2)_SHOW_INFO_VIRTUAL)
> +	"depends on": [
> +		$$(call make-comma-list,$$($(2)_FINAL_ALL_DEPENDENCIES))
> +	],
> +	"dependency of": [
> +		$$(call make-comma-list,$$($(2)_RDEPENDENCIES))
> +	]
> +endef

 Maybe it would be better to make this a function (defined outside of
inner-generic-package) rather than a per-package variable.

> +
> +$(1)-show-info:
> +	@:
> +	$$(info { $$(strip $$($(2)_SHOW_INFO)) })$$($(2)_ALL_DOWNLOADS),

 So here you'd use

	$$(info { $$(strip $$(call show-info,$(1),$(2))) })


 Regards,
 Arnout

> +
>  $(1)-show-version:
>  			@echo $$($(2)_VERSION)
>  
> @@ -1099,6 +1142,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>  	$(1)-rsync \
>  	$(1)-show-dependency-tree \
>  	$(1)-show-depends \
> +	$(1)-show-info \
>  	$(1)-show-version \
>  	$(1)-source
>  
> 
