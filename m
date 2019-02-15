From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 20:15:04 +0100
Subject: [Buildroot] [PATCHv3 6/7] support/download/scp: implement
 source-check
In-Reply-To: <20190209220910.GI3079@scaer>
References: <20190209202350.4984-1-patrickdepinguin@gmail.com>
 <20190209202350.4984-6-patrickdepinguin@gmail.com>
 <20190209220910.GI3079@scaer>
Message-ID: <CAAXf6LXGEF9_utnUKTyTWrmzMP+-hay2V52RxZCQW2quzdVAPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 9 feb. 2019 a las 23:09, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2019-02-09 21:23 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  support/download/scp | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > v3: no changes
> >
> > diff --git a/support/download/scp b/support/download/scp
> > index 80cf495c4e..d81952956c 100755
> > --- a/support/download/scp
> > +++ b/support/download/scp
> > @@ -7,17 +7,20 @@ set -e
> >  #
> >  # Options:
> >  #   -q          Be quiet.
> > +#   -C          Only check that the file exists remotely.
> >  #   -o FILE     Copy to local file FILE.
> >  #   -f FILE     Copy from remote file FILE.
> >  #   -u URI      Download file at URI.
> >  #
> >  # Environment:
> >  #   SCP       : the scp command to call
> > +#   SSH       : the ssh command to use for checkonly
> >
> >  verbose=
> >  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> >      case "${OPT}" in
> >      q)  verbose=-q;;
> > +    C)  checkonly=1;;
> >      o)  output="${OPTARG}";;
> >      f)  filename="${OPTARG}";;
> >      u)  uri="${OPTARG}";;
> > @@ -33,8 +36,19 @@ shift $((OPTIND-1)) # Get rid of our options
> >  _scp() {
> >      eval ${SCP} "${@}"
> >  }
> > +_ssh() {
> > +    eval ${SSH} "${@}"
> > +}
> >
> >  # Remove any scheme prefix
> >  uri="${uri##scp://}"
> >
> > +if [ -n "${checkonly}" ]; then
> > +    # uri now looks like:  foo.example.org:some/directory
> > +    domain="${uri%%:*}"
> > +    path="${uri#*:}/${filename}"
> > +    _ssh ${verbose} "${@}" "'${domain}'" ls "'${path}'" > /dev/null
>
> I was going to reply to the previous thread, but you were too fast to
> respin, so here's my proposal to avoid ls:
>
>     /usr/bin/env [ -f "'${path}'" ]
>
> It is almost impossible to have a system that lacks 'env' or that have
> it in another location, as POSIX mandates env to exist, and IIRC, it
> even mandates it to be /usr/bin/env (of is it FHS? at least, scripts in
> Buildroot use "#!/usr/bin/env bash").
>
> You may have to carefully quote the [ and ], to avoid the eval from
> doing a nasty, weel, evaluation...

I would use 'test' rather than [ ] to avoid any such problem.

Thanks for the suggestion, I will test it.

/Thomas
