From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Oct 2016 11:00:18 +0200
Subject: [Buildroot] [PATCH 2/2 v2] support/download: be more
 conservative	about git special refs
In-Reply-To: <1396149584.763951.1472045558046.JavaMail.zimbra@datacom.ind.br>
References: <cover.1470004037.git.yann.morin.1998@free.fr>
 <de318be75bdcad45f90ddb81d86911b72951e607.1470004037.git.yann.morin.1998@free.fr>
 <1396149584.763951.1472045558046.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20161015090018.GB3668@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

Sorry for the delay...

On 2016-08-24 10:32 -0300, Ricardo Martincoski spake thusly:
> ----- Original Message -----
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: buildroot at buildroot.org
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Sent: Sunday, July 31, 2016 7:35:56 PM
> > Subject: [Buildroot] [PATCH 2/2 v2] support/download: be more conservative
> >	about git special refs
> > The git special refs (e.g. Github PRs, Gerrit changes...) are not
> > retrieved on non-bare clones; we need to fetch them manually.
> > 
> > However, we need not fetch any cset that is not such a special ref; it
> > only generates warning messages that are *really* confusing.
> > 
> > Instead, we now check if we have the cset we need, and only when it is
> > missing do we explicitly request it.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> > ---
> > support/download/git | 8 ++++++--
> > 1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/support/download/git b/support/download/git
> > index e3be2e1..1c08c17 100755
> > --- a/support/download/git
> > +++ b/support/download/git
> > @@ -66,8 +66,12 @@ pushd "${basename}" >/dev/null
> > # below, if there is an issue anyway. Since most of the cset we're gonna
> > # have to clone are not such special refs, consign the output to oblivion
> > # so as not to alarm unsuspecting users, but still trace it as a warning.
> > -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
> > -    printf "Could not fetch special ref '%s'; assuming it is not special.\n"
> > "${cset}"
> > +#
> > +# Only try to fetch such a special ref if we do not already have the
> > +# cset we need locally.
> > +#
> > +if ! _git rev-parse -q --verify "'${cset}^{commit}'" >/dev/null; then
> > +    _git fetch origin "'${cset}:${cset}'"
> 
> A question more related to 13c89c2f than to this patch, but anyway...
> 13c89c2f support/download/git: do not use bare clones
> 
> When cset is a special ref, e.g. refs/changes/80/22580/2, this 'git fetch' works
> fine.
> But when cset is a sha1 of a special ref, since 13c89c2f the checkout fails
> AFAIK because git server using default configuration does not upload
> unreachable sha1.
> 
> Maybe we could translate the sha1 to a named ref when we assume we are about to
> ask for a special ref. Something like this...
> 
> if ! _git rev-parse -q --verify "'${cset}^{commit}'" >/dev/null; then
>     named_ref=$(_git ls-remote "'${repo}'" 2>&1 | grep "^${cset}" | cut -f2)
>     if [ -n "$named_ref" ]; then
>         _git fetch origin "'${named_ref}:${named_ref}'"
>     else
>         _git fetch origin "'${cset}:${cset}'"
>     fi
> fi
> 
> What do you think?

I don't use such "special refs", so I can't really state whether it is
good or not. If there was a publicy-reachable tree I could test against,
that would be nice. Do you know of such atree (even for a package not in
Buildroot)?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
