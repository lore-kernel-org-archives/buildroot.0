From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 20:10:39 +0100
Subject: [Buildroot] [PATCHv3 2/7] support/download/hg: implement
 source-check
In-Reply-To: <20190209215319.GH3079@scaer>
References: <20190209202350.4984-1-patrickdepinguin@gmail.com>
 <20190209202350.4984-2-patrickdepinguin@gmail.com>
 <20190209215319.GH3079@scaer>
Message-ID: <CAAXf6LWibP0eq3w3E_bRdJuiVMxn6KGXck+73VTiiat+wMk0gQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 9 feb. 2019 a las 22:53, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2019-02-09 21:23 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Note: the implementation is different (better) than what used to be in
> > Buildroot before source-check was removed.
> >
> > The original implementation:
> >     hg incoming --force -l1 <URL>
> > would only verify that the repository exists, not that the requested
> > revision is present.
> >
> > An already better implementation is:
> >     hg incoming --force -l1 -r <revision> <URL>
> > but compared to the next solution it has a large resource consumption on the
> > local machine. In the background, the full repository is first downloaded.
> >
> > The implemented solution is:
> >     hg identify -r <revision> <URL>
> > which operates directly on the remote repository.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  support/download/hg | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > v3: no changes
> >
> > diff --git a/support/download/hg b/support/download/hg
> > index efb515fca5..ed8dcfbcff 100755
> > --- a/support/download/hg
> > +++ b/support/download/hg
> > @@ -7,6 +7,7 @@ set -e
> >  #
> >  # Options:
> >  #   -q          Be quiet.
> > +#   -C          Only check that the changeset exists in the remote repository.
> >  #   -o FILE     Generate archive in FILE.
> >  #   -u URI      Clone from repository at URI.
> >  #   -c CSET     Use changeset (or revision) CSET.
> > @@ -19,6 +20,7 @@ verbose=
> >  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> >      case "${OPT}" in
> >      q)  verbose=-q;;
> > +    C)  checkonly=1;;
>
> I've come to like an alternate solution to handle boolean options:
>
>     checkonly=false
>     while getopts ...; do
>         case "${OPT}" in
>             C)  checkonly=true;;
>         esac
>     done
>
> Which allows to write nicer conditions:
>
>     if ${checkonly}; then
>         ...
>     fi

Ok, will use this


>
> >      o)  output="${OPTARG}";;
> >      u)  uri="${OPTARG}";;
> >      c)  cset="${OPTARG}";;
> > @@ -36,6 +38,11 @@ _hg() {
> >      eval ${HG} "${@}"
> >  }
> >
> > +if [ -n "${checkonly}" ]; then
> > +    _hg identify ${verbose} "${@}" --rev "'${cset}'" "'${uri}'" > /dev/null
> > +    exit ${?}
>
> Incorrect use of exit. The script has a 'set -e' at the beginning, so a
> command that exits in error will cause the script to abort. So, if the
> script reaches the exit clause, it means the call to _hg did not fail.
> Ditto the other backends, of course.


Ok, I will fix it.

Note that there is the danger that someone removes the 'set -e' in the
future, which would break the plain 'exit'. Something to be careful
about...

>
> Also, I think it always makes sense to check that the revision exists,
> even if doing the actual download: it allows for a fastpath even in case
> the user wants to do the actual download anyway:
>
>     if ! _hg identify ${verbose} "${@}" --rev "'${cset}'" "'${uri}'" > /dev/null; then
>         printf 'error blabla no such revision blabla\n'
>         exit 1
>     fi
>     if ${checkonly}; then exit 0; fi
>

Ok, will do.

Thanks,
Thomas
