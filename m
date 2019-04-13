From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Apr 2019 19:17:20 +0200
Subject: [Buildroot] [PATCH 06/10] infra/pkg-generic: introduce
 foo-show-info
In-Reply-To: <2e6876e6-3098-44ee-11b5-f8b900d3b2ee@mind.be>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
 <2e6876e6-3098-44ee-11b5-f8b900d3b2ee@mind.be>
Message-ID: <20190413171720.GM2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-13 10:58 +0200, Arnout Vandecappelle spake thusly:
> On 07/04/2019 13:51, Yann E. MORIN wrote:
> > Users are increasingly trying to extract information about packages.
> > For example, they might need to get the list of URIs, or the
> > dependencies of a package.
> > 
> > Although we do have a bunch of rules to generate some of that, this is
> > done in ad-hic way, with most of the output formats just as-hoc, raw,
> > unformatted blurbs, mostly internal data dumped as-is.
> > 
> > Introduce a new rule, foo-show-info, that provides a properly formatted
> > output of all the meta-information about a package: name, type, version,
> > licenses, dependencies...
> 
>  I love the concept of this patch series, because it makes it much easier to
> write external scripts but also to write our own internal scripts (graph-depends
> etc.). However, I have a number of gripes with the chosen implementation. Only
> the first one is essential, the rest is nice-to-have.
> 
> * The null in the downloads list is really silly, and makes life difficult for
> the user because it has to be filtered out again (cfr. Thomas's PoC jq script).
> So it really has to go.

I'll try to see how it can be done with your sugestion below. Not that I
find the code nice, though...

> * I think the structure should always be completely the same. So a virtual
> package should still have version: "", licenses: "", downloads: []. This again
> makes it easier to process things.

I really wondered about that one. But to me, it does not make sense that
a virtual package has a license or a version: it is virtual... Yet, there
might be a point in having that information however, because, apart from
being virtual, they actually *can* install things in the target (or host
or staging).

But then, what about filesystems? Semantically, it does not make sense
at all to have a license or a version for them...

> * I think it would be better to output per-package minified strings (i.e.
> without whitespace).

As you noticed later, this is already the case.

> To make it human-readable, you can just pipe through jq.
> The advantage of the minified string is that you can just grep for some metadata
> that you're interested in and get all the lines of info that you need - this is
> a lot easier than writing a jq filter. It also gives a solution for the null,
> because you can just do $(subst $(comma)},},...) to get rid of the redundant comma.

Hmm... That's a neat trick, which could also be applied to $(comma)] as
well, I guess...

> * I absolutely hate these per-package rules. I also don't think it would behave
> correctly: I would expect 'make {foo,bar}-show-info' to output JSON, but it
> doesn't (as you note for the show-recursive-info). So I think we should just
> have a top-level show-info, which uses _FINAL_RECURSIVE_DEPENDENCIES to iterate
> over all packages (note that that variable would have to be added for rootfs as
> well). If we want to support selecting a subset of packages, we could add
> something like the VARS of printvars.

It would certainly simplify things a little bit... But I do like to keep
the per-package rules consistent each with the others:
    foo-build
    foo-install
    foo-reconfigure
    foo-legal-info
    foo-show-info

So, I'll at least keep foo-show-info, but will ditch the recursive one.

> * I have a vague feeling that the _SHOW_INFO variable looks ugly, but I can't
> put my finger on it what makes it ugly (or how it could be better).

I honestly ca'tn see uglyness in that one. _SHOW_INFO_DETAILS, which is
conditional, is indeed not nice because of the conditional block...

But really, I don't see a better solution.

> * Maybe it would be better if the top-level structure where a dict as well:
> "pkg": { "type": ... }.

Can do.

> * I think it would be useful to also export either the uppercase name of the
> package, or at least the kconfig symbol. In fact, I would export as much info as
> we can - though that can of course be done in follow-up patches. infra would be
> a nice one, but we don't have a variable for that at the moment.

This can be added later, in followup patches. That's the interesting
part of this solution: we can add more information to the output without
breaking existing consumers.

snip
> > The complex part of this change was the conditional output of parts of
> > the data: virtual packages have no source, version, license or
> > downloads, unlike non-virtual packages. 
> 
>  So, as I wrote, I think we should keep the same structure, which makes this
> extremely trivial because the empty source, version, license variables will just
> do the right thing.

Sorry, I still disagree, if at least because for filesystems it does not
even make sense. So a consumer of the JSON output will anyway have to
cope with this, so it should also cope with the rest.

I will keep the difference for now.

[--SNIP--]
> > Finally, the variable is $(strip...)ed before being displayed, so as to
> > make it fit on a single line, one per package info.
> 
>  Oh, I thought strip just stripped starting and trailing whitespace, not the
> whitespace in the middle... Apparently I was wrong. So the JSON is in fact
> almost-minified already. I wonder, then, what is the value of still adding that
> additional space after the comma.

You mean, in make-comma-list?

I still believe the output should be readable by humans too, so a space
after the comma is still nice.

> > This is just JSON,
> > so it does not matter, but at least it should be parallel-safe in the
> > future.
> 
>  Well, only if the lines remain under BUFSIZ, and only if you don't unbuffer the
> output (i.e. if you don't use brmake...).

Hmm.. I'll remove that part of the commit log.

> > +	$$(foreach dl,$$($(2)_ALL_DOWNLOADS),
> > +		{
> > +			"source": "$$(notdir $$(dl))",
> > +			"URIs": [
> > +			$$(call make-comma-list,
> > +				$$(subst \|,|,
>  Is this really needed? Isn't "\|" and "|" the same in JSON?

YUes it is required, otherwise tools liek json_pp will whine:

    $ echo '{ "a": "\|" }' |json_pp
    illegal backslash escape sequence in string, at character offset 8
    (before "\\|" }\n")

jq whines, too: parse error: Invalid escape at line 1, column 11

> > +					$$(call DOWNLOAD_URIS,$$(dl),$(2))
> > +				)
> > +			)
> > +			]
> > +		},
> > +	)
> 
>  I think you might be able to get rid of the null like this:
> 
> 	$$(subst }{,}$$(comma){,
> 		$$(foreach dl,$$($(2)_ALL_DOWNLOADS),{
> 			...
> 		})
> 
>  Ugly, I know :-)

And then you fond that the _SHOW_INFO variable is ugly, and you want me
to add more uglyness to it? Meh! ;-)

But yes, your subst trick is interesting.

> > +	null
> > +	],
> > +endef
> > +endif
> > +
> > +define $(2)_SHOW_INFO
> > +	"name": "$(1)",
> > +	"type": "$(4)",
> > +	$$($(2)_SHOW_INFO_VIRTUAL)
> > +	"depends on": [
> > +		$$(call make-comma-list,$$($(2)_FINAL_ALL_DEPENDENCIES))
> > +	],
> > +	"dependency of": [
> > +		$$(call make-comma-list,$$($(2)_RDEPENDENCIES))
> > +	]
> > +endef
> 
>  Maybe it would be better to make this a function (defined outside of
> inner-generic-package) rather than a per-package variable.

Good idea, indeed.

> > +$(1)-show-info:
> > +	@:
> > +	$$(info { $$(strip $$($(2)_SHOW_INFO)) })$$($(2)_ALL_DOWNLOADS),
> 
>  So here you'd use
> 
> 	$$(info { $$(strip $$(call show-info,$(1),$(2))) })

Right.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
