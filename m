From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Feb 2017 18:56:48 +0100
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between
 the various providers
In-Reply-To: <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
References: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
 <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
Message-ID: <20170216175648.GD4986@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-02-16 18:46 +0100, Arnout Vandecappelle spake thusly:
> On 14-02-17 22:13, Yann E. MORIN wrote:
> > Some GL providers will provide libegl and libgles, but not libgl, while
> > other will provide libgl but not libegl not libgles. This can be the
> > case with:
> >   - mesa3d       -> libgl
> >   - rpi-userland -> libegl and libgles
> 
>  The commit message is missing an explanation of why this is bad... Something
> like "Such a situation leads to conflicting headers and libraries when building
> a package that uses both libgl and libegl."

OK, I can fix that.

> > Since we can not protect against this situation in the Config.in files
> > (especially because providers may be out-of-tree), we can only check for
> > the validity after the fact.
> 
>  Perhaps it would be possible to create a new opengl virtual package, and that
> the libgl* providers provide opengl instead of the specific libgl. So libgl etc.
> would no longer be virtual packages by themselves, but just suboptions of
> opengl. The libgl* consumers would depend on BR2_PACKAGE_HAS_LIBGL but add
> opengl to their dependencies instead of libgl.

I don't like it, because it means that it is no longer possible to have
out-of-tree providers (e.g. in a br2-external tree).

(If I understood correctly what you are proposing.)

>  Clearly this alternative is too invasive for 2017.02, so your patch is still valid.
> 
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/6f1/6f197c643972e92f0b27b3afac7da7b4b1115f7e/
> >     http://autobuild.buildroot.org/results/6c6/6c6e0a236bde7b892a69119a49422119f3efaa97/
> >     http://autobuild.buildroot.org/results/5a2/5a2a1503b7d19c0ca5b0e9093aa24ed9c020e812/
> 
>  Does the autobuilder script filter out errors like these? If not, the
> autobuilder errors will not be fixed, they'll just move...

Clearly, the autobuilder scripts will have to learn to catch this, as
they are currently catching the multiple-providers case.

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/opengl/opengl.mk | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/package/opengl/opengl.mk b/package/opengl/opengl.mk
> > index abf96d5..47902f2 100644
> > --- a/package/opengl/opengl.mk
> > +++ b/package/opengl/opengl.mk
> > @@ -1 +1,30 @@
> >  include $(sort $(wildcard package/opengl/*/*.mk))
> > +
> > +# Ensure consistency betwenn the various GL providers:
> > +
> > +# If we have a libgl provider, then the libegl provider must be the same
> > +ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_HAS_LIBEGL),yy)
> > +# No need to qstrip, both are quoted
> > +ifneq ($(BR2_PACKAGE_PROVIDES_LIBGL),$(BR2_PACKAGE_PROVIDES_LIBEGL))
> > +$(error Provider for libgl ($(BR2_PACKAGE_PROVIDES_LIBGL)) is not the same \
> > +	as for libegl ($(BR2_PACKAGE_PROVIDES_LIBEGL)))
> > +endif
> > +endif
> 
>  Shouldn't all this be protected by BR_BUILDING?

I was wondering if we should have it, so that we could re-enter the
menuconfig in case of error, but it seems that it was not needed.

And we do not want to allow 'make source' either, sonce the
configuration is invalid.

What are you trying to protect against (here) with BR_BUILDING?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
