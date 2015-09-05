From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2015 14:31:58 +0200
Subject: [Buildroot] [PATCHv4] pkg-generic: detect incorrectly used
 package
In-Reply-To: <20150905114327.3075e0e4@free-electrons.com>
References: <1441141898-26885-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55EAB0CF.2040707@mind.be>
 <20150905114327.3075e0e4@free-electrons.com>
Message-ID: <20150905123158.GB3604@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2015-09-05 11:43 +0200, Thomas Petazzoni spake thusly:
> On Sat, 5 Sep 2015 11:07:27 +0200, Arnout Vandecappelle wrote:
> > > To detect such issues more easily, this patch adds a check in the
> > > package infrastructure. When the build process of a package is being
> > > triggered, we verify that the package is enabled in the
> > > configuration. We do this check in the "configure" step, since this
> > > step is the first common step between the normal download case and the
> > > "local site method" / "package override" case.
> > 
> >  I would actually prefer checks like this to de done by a separate checkpackage
> > script rather than as part of the package infrastructure. This is IMHO more in
> > line with the buildroot is simple principle.
> > 
> >  However, we don't have a checkpackage script yet - I started on one a while ago
> > but it still has a ways to go. And anyway, it is probably pretty complicated to
> > check this in a checkpackage script. Therefore, let's include this feature.
> 
> I agree on principle, but I also believe doing such a check in a
> separate script is going to be quite tricky.

Well, I believe it *will* be quite tricky.

If we do it in a check-package script, then we'll have to handle quite
some special cases. For example, how can we differentiate those cases:

  - Config.in does not select/depend, but .mk has it unconditionally in
    the _DEPENDENCIES;

  - Config.in does not select/depend, but .mk has it conditionally in
    the _DEPEDNENCIES (i.e. if foo enabled, add it to dependencies);

  - Config.in conditionally selects/depends, and .mk has it
    unconditionally in the _DEPENDENCIES;

  - Config.in conditionally selects/depends, and .mk has it
    conditionally in the _DEPENDENCIES.

Short of writing an actual Makefile parser (Kconfiglib already exists
for the Kconfig part) and writing a "dependency solver" (i.e. being able
to test all condition-paths), I don;t see how we can do a good job with
a check-package script...

So, checkign at build-time is not the optimum (especially since the
error may happen quite late during the build), but that's IMHO the best
we can hope for without investing a huge amount of work.

> > >  # Configure
> > >  $(BUILD_DIR)/%/.stamp_configured:
> > > +# Only trigger the check for default builds. If the user forces
> > > +# building a package, even if not enabled in the configuration, we
> > > +# want to accept it.
> > > +ifeq ($(MAKECMDGOALS),)
> > > +	@if test "$(TYPE)" = "target" -a -z "$($(KCONFIG_VAR))" ; then \
> > > +		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \
> > > +		echo "forgot to add the corresponding select / depends on $(KCONFIG_VAR)." ; \
> > > +		echo "Potential culprits: " ; \
> > > +		for p in $($(PKG)_DEPENDENT_OF) ; do echo " - $$p" ; done ; \
> > 
> >  I don't really like adding that extra _DEPENDENT_OF variable just for this
> > purpose. But it will be hard to avoid I guess. It _could_ be avoided by looping
> > over $(.VARIABLES), then selecting the ones that match the _DEPENDENCIES pattern
> > and that have $(call lowercase,$(PKG)) in them. But that's a bit complicated :-)

Yes, that's a bit compicated. And I'm afraid looping over .VARIABLES
would take quite some time: "make printvars" takes quite some time
(especially for large configurations), and is doing almost the same as
what you suggest.

But that's an error-path, so we may not care completely...

Yet, this new variable could be usefull for other stuff. We currently
have "make PKG-show-depends" to see what the dependencies are for that
package. We could also add "make PKG-show-dependees" to show the reverse
dependencies for that package.

I can't really think what the final use-case would be for that, but I
believe it would be useful on its own.

> I am also not sure adding this additional variable just for this
> purpose is really needed. My initial proposal did not have this, and
> was just saying "some package has a problem". Yann proposed this
> improvement to point to potential offenders, making the investigation
> easier. So it's up to us to decide whether we want to make that
> investigation easier (which requires this additional variable), or keep
> the code simpler and remove one variable, but make the investigation of
> such errors a bit more complicated.
> 
> I don't have a very strong feeling on this. It's just one more
> variable, computed in a reasonably simple way.

Well, you do split the patch in two: you original submission (with the
comments addressed, of course) followed by an additional patch that
introduces the culprits.

That way, if that second part (my sugggestion) is too controversial, we
can still benefit for the sanity-check you proposed, which is still a
very good thing! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
