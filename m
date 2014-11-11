From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 16:35:16 +0100
Subject: [Buildroot] [PATCH v2 02/15] package/pkg-rebar.mk: new
 infrastructure.
In-Reply-To: <54622372.7000700@mind.be>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-3-git-send-email-johan.oudinet@gmail.com>
 <20141110233154.GG22119@free.fr> <54622372.7000700@mind.be>
Message-ID: <20141111153516.GH4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-11-11 15:55 +0100, Arnout Vandecappelle spake thusly:
> On 11/11/14 00:31, Yann E. MORIN wrote:
> > Johan, Thomas, All,
> > 
> > Thomas, there is a question for you later in the mail, just search for
> > your first name. ;-)
> > 
> > On 2014-11-07 14:28 +0100, Johan Oudinet spake thusly:
> >> Ease the development of packages that use the erlang rebar tool as
> >> their build system.
[--SNIP--]
> > For other pkg infras, we prefix the language type for packages that
> > actually use that infra (e.g. PYTHON_FOO_SOURCE for a Python package,
> > but we do not prefix the Python package itself, like: PYTHON_PYTHON_SOURCE)
> 
>  Err, we do exactly the same for python-setuptools, so how is this different?
> 
>  You could say that the package infrastructure should be named pkg-erlang
> instead of pkg-rebar, but I don't think so. The situation is a bit similar to
> qmake - qmake is the canonical build tool for Qt packages, but if we would have
> qmake infrastructure, it would be called pkg-qmake and not pkg-qt.
> 
>  So I vote for erlang-rebar and pkg-rebar, exactly as it is now.

OK.

> > So, I think 'rebar' should just be 'rebar'.
> > 
> >> +#
> >> +################################################################################
> >> +
> >> +ERLANG_REBAR_VERSION = 2.5.1
> >> +ERLANG_REBAR_SOURCE = $(ERLANG_REBAR_VERSION).tar.gz
> >> +ERLANG_REBAR_SITE = https://github.com/rebar/rebar/archive
> > 
> > Hmm... The Erlang folks really can't do anything like the others...
> > 
> > There are two ways to get packages from github:
> >   - the github helper in Buildroot
> >   - the direct 'released' tarballs
> > 
> > So, rebar does do releases on GitHub. Except what they release is not
> > the source code, but the actual generated rebar executable. Sigh...
> 
>  Err, when I download https://github.com/rebar/rebar/archive/2.5.1.tar.gz I get
> exactly the same files as what is in the 2.5.1 tag, I don't get any executable...

That's because you did not follow the recent discussion about the github
helper, which came to be written in the manual (which is broken
formatting-wise, and I'll send a patch to fix the formatting soon):
    http://nightly.buildroot.org/#_tips_and_tricks

    ---8<---
    - If there is a green download button, like mongrel2, then it was
      uploaded by the maintainer and you should use the link of that
      button to specify FOO_SITE.
    - If there is grey download button, like xbmc, then it?s an
      automatically generated tarball and you should use the github
      helper function.
    ---8<---

And in the case of rebar, there *is* a green button meaning the
maintainers did upload a release. Except when Buildroot expects a source
release, they did a binary release.

Hence all my explanations above.

[--SNIP--]
> >> +#
> >> +REBAR_HOST_DEPS_DIR = $(BUILD_DIR)/erlang-rebar-deps/host
> >> +REBAR_TARGET_DEPS_DIR = $(BUILD_DIR)/erlang-rebar-deps/target
> > 
> > Well, I would prefer those directories not be stored in the build dir,
> > but somewhere like:
> >     $(HOST_DIR)/usr/share/rebar/deps-host
> >     $(HOST_DIR)/usr/share/rebar/deps-target
> 
>  +1, but I'd say
> 
> $(HOST_DIR)/usr/share/rebar/deps
> $(STAGING_DIR)/usr/share/rebar/deps

Works for me too.

>  Note on the naming: even though the package is called erlang-rebar for
> buildroot, anything it installs will just be rebar (without erlang-) because
> that's how upstream identifies itself.

Yup.

[--SNIP--]
> >> +	for dir in ebin priv $(2); do					\
> >> +		if test -d "$$(@D)/$$$$dir"; then			\
> >> +			cp -r	"$$(@D)/$$$$dir"			\
> >> +				'$(1)$$($$(PKG)_ERLANG_LIBDIR)';	\
> >> +		fi;							\
> >> +	done
> >> +endef
> 
>  Ah, double-$ mess :-)
> 
>  The double-$ is needed only because it is called from inner-rebar-package,
> which means that this function cannot be called from custom package commands.
> That's not very nice.
> 
>  Fortunately, the solution is very simple: use single $ here, and put a double $
> at the $$(call install-erlang-directories,...) site.
> 
>  (Of course I haven't tested this, so YMMV.)
> 
>  Same for all other functions defined below

I'll be looking into that double-$ [nm]ess. ;-]

[--SNIP--]
> >> +define inner-rebar-package
> >> +
> >> +$(2)_ERLANG_APP ?= $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))
> 
>  It would make more sense to me to do
> 
> $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))))
> 
> 
> >> +$(2)_ERLANG_LIBDIR ?= \
> >> +	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)

Hey, here, it's "/usr/lib/erlang/lib/" while my build error was about
"/usr/lib/erlang/usr/lib/" (notice the extra "/usr" after "erlang/").

>  Does it make sense to make this configurable? I.e., wouldn't it be better to
> just expand this in the two places where it's used? It would certainly be
> clearer that way.

Well, I like it that it's a variable, so we can tweak the paths in a
single location. But surely, that should not be configurable by the
package.

> >> +$(2)_ENV ?=								\
> >> +	CC='$$($(call UPPERCASE,$(4))_CC)'				\
> >> +	CFLAGS='$$($(call UPPERCASE,$(4))_CFLAGS)'			\
> >> +	LDFLAGS='$$($(call UPPERCASE,$(4))_LDFLAGS)'			\
> 
>  I don't like this way of distinguishing host and target very much. It avoids
> code duplication, but it's a lot harder to read. So I'd prefer
> 
> ifeq ($(4),host)
> $(2)_ENV ?= \
> 	CC='$$(TARGET_CC)' \
> 	CFLAGS='$$(TARGET_CFLAGS)' \
> 	...

Agreed.

>  Also, it would be nice to cater for custom CFLAGS, i.e.
> 
> 	CFLAGS='$$(TARGET_CFLAGS) $$($$(PKG)_CFLAGS)'

Agreed.

[--SNIP--]
> > And you need to autoreconf ejabberd because:
> >   - you get it from the git tree. There is a release tarball, though:
> >       http://www.process-one.net/downloads/ejabberd/14.07/ejabberd-14.07.tgz
> 
>  That's of course definitely a good idea, but it should still be _possible_ to
> use a git version.

But please let's start simple, as this is already complex stuff.

[--SNIP--]
> > Hmmm... Looking further, it seems a few others (all from ProcessOne?)
> > also uses ./configure . What about adding a new variable, like:
> > 
> >     ERLANG_FOO_CONFIGURE = YES
> > 
> > which would tell whether running configure is needed?
> 
>  I have the feeling we'll need a rebar-package and rebar-autotools-package.
> 
>  But starting with FOO_CONFIGURE isn't a bad idea either.

Yes, I was wondering if we should go with:

    ERLANG_FOO_TYPE = {autotools,generic}

> > I'd like input from Thomas P. on all the above, because we get into
> > really tricky-icky stuff... Thomas?
> > 
> > And by the way, since ejabberd is using the rebar infra, then maybe it
> > makes sense to call that package erlang-ejabberd? I know it sounds
> > strange, but that what's you did for all other rebar-using packages, so
> > I don't see why this would be different for that one.
> 
>  No, the convention is that library-type packages should be called
> <language>-<package>, while program-type packages should be called just
> <package> (and should select the programming language rather than depending on it).

I'm fine with that.

> >> +ifndef $(2)_BUILD_CMDS
> >> +define $(2)_BUILD_CMDS
> >> +	cd '$$(@D)' &&							\
> >> +	if [ -f ./rebar ]; then						\
> >> +		$$($$(PKG)_ENV)						\
> >> +		$$($$(PKG)_REBAR_ENV)					\
> >> +			./rebar $$($$(PKG)_REBAR_FLAGS) compile;	\
> >> +	else								\
> >> +		$$($$(PKG)_ENV)						\
> >> +		$$($$(PKG)_REBAR_ENV)					\
> >> +			rebar $$($$(PKG)_REBAR_FLAGS) compile;		\
> >> +	fi
> >> +endef
> >> +endif
> > 
> > Hmm... Do we want to trust the package's own rebar? Shouldn't we always
> > use our own version of rebar instead?
> > 
> > What would be the reason to 'trust' the package's rebar more than our?
> 
>  Because the package's rebar may be more up-to-date or may be modified. As long
> as we don't apply cross-compilation patches to our rebar, there is no reason to
> prefer that one.
> 
>  Ideally, however, the package should only depend on host-rebar if it will
> actually use it. It's not a showstopper for me, just a preference.

But as Johan said, some packages' rebar may break the compilation, like
I could observe in my testing.

Johan, care to investigate why would we use the package's rebar instead
of our own?

>  Also, I have a slight preference for the buildroot package to specify which one
> should be used rather than autodiscovering it. But again, not a showstopper for me.

Agreed.

> >> +ifeq ($(4),host) # Install host files.
> >> +
> >> +ifndef $(2)_INSTALL_CMDS
> >> +define $(2)_INSTALL_CMDS
> >> +	$(call install-erlang-directories,$$(HOST_DIR),include)
> 
>  Personally, I'd find it slightly more readable to put all the directories here
> (ebin priv include) rather than automagically installing ebin and priv.

I'm not too fond of that. The things we always want to install should
not be configurable, even from inside the pkg-infra itself.

But I won't be pedantic about that one. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
