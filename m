From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 00:12:56 +0200
Subject: [Buildroot] [PATCH 1/4] core/pkg-kconfig: ensure kconfig file
 and fragments exist
In-Reply-To: <20150612232422.4a12fc2b@free-electrons.com>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <22cb4293142894b08d3103f39ceaa2351b0e357b.1433591404.git.yann.morin.1998@free.fr>
 <20150612232422.4a12fc2b@free-electrons.com>
Message-ID: <20150612221256.GG3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-12 23:24 +0200, Thomas Petazzoni spake thusly:
> On Sat,  6 Jun 2015 13:54:23 +0200, Yann E. MORIN wrote:
> > Because the base kconfig file has a dependency but no rule, make will
> > always try to rebuild targets that depend on it:
> > 
> >     https://www.gnu.org/software/make/manual/make.html#Force-Targets
> > 
> > To complexify things yet a little bit more, missing kconfig fragments
> > are properly caught,
> 
> What do you mean by "are properly caught" ?

Just that missing fragments cause a build failure, becasue of that rule:

    $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)

Contrary to $$($(2)_KCONFIG_FILE), which has a rule to generate it,
there is no such rule for the fragments. So make itself whines there is
a missing file for which it has no rule to generate it.

> Also, I don't see the
> interaction between this and the previous paragraph, and hence the "To
> complexity things yet a little bit more"

Well, complexity comes from the fact that a missing base config file or
a missing fragment do not cause the same behaviour:

  - a missing fragment cause a build error that make reports as a missing
    file (see above)

  - a missing base file causes no build failure, because merge-config.sh
    does not check its inputs (and thus produces a garbled .config).

> > but since they could be bundled in the package,
> > they should depend on it being extracted. And then we'd have the same
> > issue as with the base kconfig file, above.
> 
> "then" what ?

Then make would not complain, and feed them to merge-config, wich would
not care at all (but produce a garbled .config).

> > Furthermore, merge-config.sh does not check for the existence of the
> > fragments, not even the existence of the base file.
> 
> How is this related to the previous paragraph ?

Well, it is related because a missing file is not an error for merge-config
and we'd get a broken .config.

But Ok, that is far from being clear, so I'll rework and split the
commit in two, as you explained below.

> >   - manualy check that the base and fragments do exist.
> manually

OK.

> > -# The config file could be in-tree, so before depending on it the package should
> > -# be extracted (and patched) first
> > -$$($(2)_KCONFIG_FILE): | $(1)-patch
> > +# The config file as well as the fragments could be in-tree, so before
> > +# depending on them the package should be extracted (and patched) first
> > +$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
> 
> This part makes complete sense.

Ah! :-)

> >  # The specified source configuration file and any additional configuration file
> >  # fragments are merged together to .config, after the package has been patched.
> >  # Since the file could be a defconfig file it needs to be expanded to a
> >  # full .config first. We use 'make oldconfig' because this can be safely
> >  # done even when the package does not support defconfigs.
> > +#
> > +# merge-config.sh does not check for the existence of the fragments, not even
> > +# the existence of the base file, so we do it manually.
> > +#
> >  $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> > +	for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
> > +		if [ ! -f "$$$${f}" ]; then \
> > +			printf "Kconfig fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
> > +			exit 1; \
> > +		fi; \
> > +	done
> 
> And this one as well.

Yeah!

> So basically, I understand the code, but absolutely not the commit
> log :-)

OK. It means the problem is badly explained. After the patch is plit, I
hope it will be easier to explain each part independently.

However, by further splitting those, I'm afraid we'd loose the big
picture. I'll try to catch that in the cover letter.

> And also, I don't understand why those two things are so much
> "inter-woven" that they cannot be done in two separate patches. It's
> actually two very separate things: 1/ support kconfig fragments bundled
> in the package source code (chunk 1) and 2/ check that they exist
> (chunk 2).

Right, will do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
