From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 19:34:57 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
 <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
Message-ID: <20190415173457.GT2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

(note: I won't reply to comments I agree with, so they got elided from
my reply, unless I had more to state about them)

On 2019-04-15 14:17 +0200, Arnout Vandecappelle spake thusly:
> On 14/04/2019 22:17, Yann E. MORIN wrote:
[--SNIP--]
> > The whole stuff is $(strip)ed to make it a somewhat-minified JSON blurb
> > that fits on a single line with all spaces squashed (but still with
> > spaces, as it is not possible to differentiate spaces between JSON
> > elements from spaces inside JSON strings).
>  The implicit assumption here is that show-info will never include anything
> where whitespace is significant. Which I think is a valid assumption (I don't
> expect any whitespace at all anywhere within the keys or values, except for the
> license list where the whitespace is usually a list separator anyway).

Indeed. I shall add that to the commit log, then. Thanks!

> > Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > 
> > ---
> > Changes v1 -> v2:
> >   - make it a macro to be called  (Arnout)
> >   - make it a top-level rule  (Arnout)
> > ---
> >  Makefile             | 15 ++++++++++++
> >  package/pkg-utils.mk | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 83 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 60bf7d7d08..33215f91e5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -903,6 +903,21 @@ check-dependencies:
> >  	@cd "$(CONFIG_DIR)"; \
> >  	$(TOPDIR)/support/scripts/graph-depends -C
> >  
> > +.PHONY: show-info
> > +show-info:
> > +	@:
> > +	$(info $(call clean-json, \
> > +			$(foreach p, \
> > +				$(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
> > +						$(i) \
> > +						$($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
> 
>  So, with the comment I made in the earlier patch, this line won't be needed
> anymore because packages already contains *_FINAL_RECURSIVE_DEPENDENCIES. Boy,
> this is too good to be true...

Won't do that in this series. Can be refined later. ;-)

> > +	"$($(1)_NAME)": {
> > +		"type": "$($(1)_TYPE)",
> 
>  I may be exaggerating here, but I am getting a bit confused between commas that
> are intrepreted by make and the JSON commas. Maybe we should consistently use
> $(comma) for the commas that go into the output, even if it is not needed like here?

This is a macro definition, not a macro call, so commas are not
interpreted.

> > +# _show-info-pkg, _show-info-pkg-details, _show-info-fs: private helpers
> > +# for show-info, above
> > +define _show-info-pkg
> > +	$(if $($(1)_IS_VIRTUAL), \
> > +		"virtual": true$(comma),
> 
>  Again, I may be exaggerating, but I would find it more aesthetically pleasing
> to put the
> 		"virtual": false$(comma)
> here rather than in the pkg-details.

Can doo, OK.

Also, since that would be the else-clause of the if, the folowing commas
would *not* be interpreted as separators of the if clause. E.g.:

    all:
        @: $(info $(if ,ignored,shown, too))

would print:

    shown, too

Yet, it looks hackish to do so...

> > +define _show-info-pkg-details
> > +	"virtual": false,
> > +	"version": "$($(1)_DL_VERSION)",
> > +	"licenses": "$($(1)_LICENSE)",
> 
>  I'm torn here...
> 
>  The licenses could be converted into a list - actually, it is already a list,
> just missing the quotes. But clearly, converting that into a JSON list in make
> syntax is... a challenge.
> 
>  However, I'm actually dreaming of making the license statement a SPDX
> expression instead of a list (i.e. conjoined with AND and OR, and with
> parenthesis; unfortunately, SPDX has no syntax to express that it only applies
> to a part, e.g. GPL (programs) is not valid SPDX). Then it is no longer a list.
> 
>  And we should make a decision now, we're defining "userspace ABI" here so it's
> difficult to switch the string to a list or vice versa later.

Sorry, two things:

1. I don't think we should treat the _LICENSE fields as a list, becasue
   it is *very* difficult to split:
        FOO_LICENSE = GPL (tools, utils, doc), LGPL (libs)

2. The reason to use JSON is to actually be able to expand it later. We
   can add and "spdx" object later when we are confident we can generate
   something reliable.

> > +define _show-info-fs
> > +	"dependencies": [
> > +		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
> > +	]
> > +endef
> > +
> > +# clean-json -- cleanup pseudo-json into clean json:
> > +#  - adds opening { and closing }
> 
>  I don't think it's appropriate that clean-json does that. Without it, you can
> call clean-json as often as you like.

On the other hand, everywhere we call clean-json, we enclose the result
between { }. I.e. the purpose of that macro *is* to output a clean json
object.

But OK, I can switch over (that was what I did previously, so I don't
have a strong feeling either...)

> > +#  - remove commas before closing ] and }
> > +#  - minify with $(strip)
> > +clean-json = $(strip \
>  Why strip a second time?

First is to eliminate new lines and duplicate spaces, second is to
remove duplicate spaces and newlines introduced by the macro itself.
Try without either, it is not pretty... ;-)

> > +	$(subst $(comma)},, \
>                           ^}

This is the part I lost during a borked rebase. :-(

> > +		$(subst $(comma)$(space)},$(space)}, \
> > +			$(subst $(comma)],, \
>                                           ^]

Ditto.

> > +				$(subst $(comma)$(space)],$(space)], \
> > +					{ $(strip $(1)) } \
> > +				) \
> 
>  Even though incorrect, I think this would be more readable and maintainable by
> not indenting the nested subst's:
> 
> 	$(subst $(comma)},},
> 	$(subst $(comma)],],
> 	$(subst $(comma)$(space)},$(space)},
> 	$(subst $(comma)$(space)],$(space)],
> 		$(strip $(1))
> 	))))

Ah, I was not sure this would be appropriate to do so. I even thought of
doing:

    clean-json = $(strip \
        $(subst $(comma)},}, $(subst $(comma)$(space)},$(space)},
        $(subst $(comma)],], $(subst $(comma)$(space)],$(space)], \
            $(strip $(1)) \
        )))) \
    )

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +			) \
> > +		) \
> > +	) \
> > +)
> > +
> >  #
> >  # legal-info helper functions
> >  #
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
