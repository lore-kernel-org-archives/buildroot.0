From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Sep 2013 22:04:20 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916202439.50de3e76@skate>
References: <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr> <20130916195846.32e98c8a@skate>
 <20130916181512.GD3293@free.fr> <20130916202439.50de3e76@skate>
Message-ID: <20130916200420.GF3293@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-09-16 20:24 +0200, Thomas Petazzoni spake thusly:
> On Mon, 16 Sep 2013 20:15:12 +0200, Yann E. MORIN wrote:
> > But your BR2_EXTERNAL will make this really trivial:
> >   - do all FLOSS stuff in Buildroot tree
> >   - do all proprietary stuff in BR2_EXTERNAL
> >   - provide the Buidlroot tree to be compliant
> >   - keep BR2_EXTERNAL private
> > 
> > Et voil?! :-)
> 
> What a good selling argument for BR2_EXTERNAL :-)

Hehe! :-)

Also, I would like to reiterate my suggestion the vriable BR2_EXTERNAL
contains a list (space- or colon-sperated, as you wish) of external
trees to descend into, rather than containing a single entry.

This way, one could have this layout:

    buildroot/    <- Buildroot tree with only redistributable changes
    ext-floss/    <- external tree with only FLOSS components
    ext-prop/     <- external tree with weak-copyleft or proprietary
                     components

which would be used as thus:
    make BR2_EXTERNAL="/path/to/ext-floss /path/to/ext-prop"

Then, distribute both buildroot/ and ext-floss/ and you're compliant
without leaking any sensitive stuff.

A side question to this: what if any of the external tree(s) contain a
package already in a previous external tree or in the original Buildroot
tree?

> But it isn't quite sufficient: by your definition, the
> Buildroot .config should also be shipped, and it also contains config
> options for the company-specific proprietary packages. So the .config
> should be "filtered" before being released. Not simple.

I think that is relatively easy: in the Buildroot tree, just run:
    make BR2_EXTERNAL= oldconfig

That will expunge the .config from any variable from the BR2_EXTERNAL
tree. You can then tar up the Buildroot tree, and make that available.
Quite easy, but requires a process that documents this simple extra step
prior to publication.

> > > What I'm questioning is really the case where a company makes an
> > > embedded product, and has used Buildroot to generate a rootfs that
> > > includes GPL programs, is this company required to distribute Buildroot.
> > 
> > Short answer: no.
> > Long answer: no, but it is an easy path.
> 
> Aren't companies going to be afraid of revealing too much of their
> secret sauce if they have to disclose their Buildroot tree?

Depends on what you call "their secret sauce". If you meant "their
prorietary apps packaged in Buildroot" then, curently, yes, since those
would be in the Buildroot tree. But with BR2_EXTERNAL (and the little
oldconfig trick above), that'd be straightforward.

If you meant "the fact that they actually use Buildroot", then I don;t
think how this could be seen as a "secret sauce".

> My point is also that nobody has ever cared about enforcing the
> Buildroot license, and I sincerely doubt anyone will be willing to do
> in the foreseeable future. Since no-one cares about that, is it really
> necessary to annoy companies with the fairly fuzzy requirements of the
> GPL when applied to a build system?
> 
> > We just have to settle on what we want to put in there: BR2_EXTERNAL:
> > derived work or not? ;-)
> 
> If it's considered as a derived work, then your above idea of using
> BR2_EXTERNAL to split things between secret stuff and released stuff no
> longer works.

Well, yes it still stands. The GPL only applies at the time of
distribution. So if BR2_EXTERNAL only contains recipes for
weak-copyleft or non-copyleft packages, then there is no need for the
company to distribute it, since the "official" Buildroot tree is enough
to reproduce the GPL program(s) on the target.

This applies, of course, only if the company decides to publish
Buildroot to catter for section 3 of the GPL of those programs.

If the company decides for another route, then this point is moot
anyway, since there is no distribution at all.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
