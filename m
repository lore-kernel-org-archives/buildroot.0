From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Sep 2019 18:05:26 +0200
Subject: [Buildroot] [PATCH] core/show-info: extend with kconfig
 variables
In-Reply-To: <dc4b1e27-8cdb-82c4-c8fc-01de4fa88d5f@mind.be>
References: <20190922125500.13865-1-yann.morin.1998@free.fr>
 <dc4b1e27-8cdb-82c4-c8fc-01de4fa88d5f@mind.be>
Message-ID: <20190922160526.GD7274@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-09-22 17:24 +0200, Arnout Vandecappelle spake thusly:
>  I have two comments on this one, one bikeshedding and one fundamental.

Let's bikeshed, yeah! :-)

> On 22/09/2019 14:55, Yann E. MORIN wrote:
> > Extend the output of show-info with the kconfig variables applicable to
> > each item in the list:
> >   - the main variable, if it exists
> >   - the list of sub-options, if any
> > 
> > The main variable may not exist for host packages or for some low-level
> > target packages (e.g. virtual packages), and does not exist for the
> > pseudo, common rootfs.
> > 
> > Even though a host package may not have a main option, it may still have
> > sub-options (e.g. a blind option to enable an optional feature, like an
> > hypotetical BR2_PACKAGE_HOST_PYTHON_NEEDS_SSL).
> > 
> > For a package, the new ouput may now contain structures like:
> >     "busybox": {
> >       "kconfig_var": {
> >         "BR2_PACKAGE_BUSYBOX": "y",
> >         "options": {
> 
>  I'm not sure I like this mixing of levels. I mean, the key of this kconfig_var
> dict (or whatever a dict is called in JS-speak) can be either the symbol name,
> or the special name "options" in which case we get another level of dict. (This
> is the bikeshedding comment.)

Yeah, I also thought pretty hard about it.

My initial issue was to get the main symbol, and the sub-options, some
of which are not boolean so I needed their values as well, so I initially
added them in this order at the same level.

But in json, dicts are unsorted, which means that when you load this json
in a higher-level language, you are no longer guaranteed that the first
key is the main symbol.

Of course, one may sort the keys by length, and get the shortest, but
that is painful.

So, I then split that in two keys:

    "kconfig_var": "BR2_PACKAGE_BUSYBOX",
    "kconfig_options_vars": {
        "BR2_PACKAGE_BUSYBOX_CONFIG": "package/busybox/busybox.config",
        "BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES": "",
        "BR2_PACKAGE_BUSYBOX_SHOW_OTHERS": "y"
    }

But I do not like the dissymetry, where the main option is just the name
(and it is forcibly 'y', otherwise the package would not be there) while
the sub-options would be the name and the value.

So I moved the options to be a sub-key as this patch implements.

As you can read, I also did bikeshed with myself before sending the
patch! ;-)

> >           "BR2_PACKAGE_BUSYBOX_CONFIG": "package/busybox/busybox.config",
> >           "BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES": "",
> >           "BR2_PACKAGE_BUSYBOX_SHOW_OTHERS": "y"
> 
>  I'm a bit worried about these suboptions. The problem is that it's kind of a
> mixed bag of things:
> 
>  - as noted below, some options may be missing;

This should be fixed when the options are incorrectly named.

>  - booleans that are relevant but happen to be unset are not listed;

This is actually what I expected.

>  - blind options that are not relevant (_ARCH_SUPPORTS) *are* listed;

Indeed. We could probably filter some away...

>  - completely unrelated options are included (e.g. AT_SPI2_CORE for "at").

Indeed, that's a shame. But it is no worse than: make printvars VARS=AT_%

>  Given that this information is never really reliable, I doubt there is a
> practical (generic) use case for it.

Practical [0], yes. 100%-bullet-proof, nope...

[0] https://www.merriam-webster.com/dictionary/practical 1.a.

> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index 74ade437d9..a05bf54527 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -97,6 +97,16 @@ define _json-info-pkg
> >  endef
> >  
> >  define _json-info-pkg-details
> > +	"kconfig_var": {
> > +		$(if $(filter $($(1)_KCONFIG_VAR),$(.VARIABLES)),
> > +			"$($(1)_KCONFIG_VAR)": "$($($(1)_KCONFIG_VAR))"$(comma)
> 
>  It might make sense to convert this to bool, similar like is done with _IS_VIRTUAL.
> 
>  And it might make sense to refactor *that* into
> 
> y-empty-to-bool = $(if $($(1)),true,false)
> 
>  But I'm not 100% sure of this. We could also say we want to stay close to the
> original (i.e. the actual variable value in make).

Problem is, if we do that for the main symbol, then we also need to do
it for all sub-options that are booleans. And then convert all number
options to numbers, and keep strings as strings. Except that hexadecimal
numbers can't be represented in json. And then, it becomes a bit more
complex...

But since this patch is indeed not completely reliable, let's drop it.

Thanks!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +		)
> > +		"options": {
> > +			$(foreach v,$(sort $(filter $($(1)_KCONFIG_VAR)_%,$(.VARIABLES))),
> > +				"${v}": "$(call qstrip,$($(v)))"$(comma)
> > +			)
> > +		}
> > +	},
> >  	"version": "$($(1)_DL_VERSION)",
> >  	"licenses": "$($(1)_LICENSE)",
> >  	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
> > @@ -119,6 +129,16 @@ define _json-info-pkg-details
> >  endef
> >  
> >  define _json-info-fs
> > +	"kconfig_var": {
> > +		$(if $(filter BR2_TARGET_$(1),$(.VARIABLES)),
> > +			"BR2_TARGET_$(1)": "$(BR2_TARGET_$(1))"$(comma)
> > +		)
> > +		"options": {
> > +			$(foreach v,$(sort $(filter BR2_TARGET_$(1)_%,$(.VARIABLES))),
> > +				"${v}": "$(call qstrip,$($(v)))"$(comma)
> > +			)
> > +		}
> > +	},
> >  	"dependencies": [
> >  		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
> >  	]
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
