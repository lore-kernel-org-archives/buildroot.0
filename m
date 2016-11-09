From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Nov 2016 23:07:01 +0100
Subject: [Buildroot] [PATCH 5/5] package/pseudo: provide better legacy
 handling for fakeroot
In-Reply-To: <3f25ce99-52f1-72be-d802-f886593ec208@mind.be>
References: <cover.1478643505.git.yann.morin.1998@free.fr>
 <29ffadca0013de2c9d9c7e749f13cb6e0361a9f0.1478643505.git.yann.morin.1998@free.fr>
 <3f25ce99-52f1-72be-d802-f886593ec208@mind.be>
Message-ID: <20161109220701.GB3663@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-09 01:29 +0100, Arnout Vandecappelle spake thusly:
> On 08-11-16 23:18, Yann E. MORIN wrote:
> > We now have a wrapper that makes pseudo behaves like the fakeroot of the
> > good ol' days. So the symlink will just magically keep old scripts
> > working as they did before the switch to pseudo.
> > 
> > However, using fakeroot is deprecated, and we want people to stop using
> > it altogether and switch to pseudo.
> > 
> > So, make the wrapper recognise how it's called, and if called as
> > fakeroot, print a warning message.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> > Cc: Erico Nunes <nunes.erico@gmail.com>
> > Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  package/pseudo/pseudo-wrapper | 9 ++++++++-
> >  package/pseudo/pseudo.mk      | 2 +-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
> > index feaa7fc..9c8dbdb 100644
> > --- a/package/pseudo/pseudo-wrapper
> > +++ b/package/pseudo/pseudo-wrapper
> > @@ -1,5 +1,12 @@
> >  #!/bin/sh
> >  
> > +if [ "${0##*/}" = "fakeroot" ]; then
> > +    cat >&2 <<-_EOF_
> > +	WARNING: fakeroot has been replaced with pseudo.
> > +	WARNING: Update your script(s) to use pseudo or pseudo-wrapper instead.
> > +	_EOF_
> > +fi
> > +
> >  export PSEUDO_PREFIX="$(dirname "${0%/*}")"
> >  export PSEUDO_OPTS="-t0"
> >  if [ -n "${TARGET_DIR}" ]; then
> > @@ -9,4 +16,4 @@ if [ -n "${BASE_DIR}" ]; then
> >      export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
> >  fi
> >  
> > -exec "${0%-wrapper}" "${@}"
> > +exec "${0%/*}/pseudo" "${@}"
> 
>  This hunk should have been squashed into patch 3. But who cares.

I disagree, because until this very patch, there is no reason to replace
the filebname. Patch 3 expects the wrapper to be called 'pseudo-wrapper'
so it really only needs -wrapper to be stripped. Only with this patch 5
do we introduce the fakeroot wrapper, so only now do we need to remove
the full filename.

Technically, this does not change at all, agreed. Semantically, it is as
I explained above. ;-)

Regards,
Yann E. MORIN.

> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Regards,
>  Arnout
> 
> > diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
> > index 474eae2..02d6247 100644
> > --- a/package/pseudo/pseudo.mk
> > +++ b/package/pseudo/pseudo.mk
> > @@ -33,7 +33,7 @@ endef
> >  HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_INSTALL_WRAPPER
> >  
> >  define HOST_PSEUDO_FAKEROOT_SYMLINK
> > -	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
> > +	ln -sf pseudo-wrapper $(HOST_DIR)/usr/bin/fakeroot
> >  endef
> >  HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
> >  
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
