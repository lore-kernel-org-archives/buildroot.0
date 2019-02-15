From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 22:00:17 +0100
Subject: [Buildroot] [PATCHv3 6/7] support/download/scp: implement
 source-check
In-Reply-To: <CAAXf6LXGEF9_utnUKTyTWrmzMP+-hay2V52RxZCQW2quzdVAPg@mail.gmail.com>
References: <20190209202350.4984-1-patrickdepinguin@gmail.com>
 <20190209202350.4984-6-patrickdepinguin@gmail.com>
 <20190209220910.GI3079@scaer>
 <CAAXf6LXGEF9_utnUKTyTWrmzMP+-hay2V52RxZCQW2quzdVAPg@mail.gmail.com>
Message-ID: <CAAXf6LUDUisVaiEKKComsaP=R+c9FQHn8LdfHEPTubxx6g0EWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El vie., 15 feb. 2019 a las 20:15, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> El s?b., 9 feb. 2019 a las 23:09, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> >
> > Thomas, All,
> >
> > On 2019-02-09 21:23 +0100, Thomas De Schampheleire spake thusly:
> > > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > >
> > > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > > ---
> > >  support/download/scp | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > v3: no changes
> > >
> > > diff --git a/support/download/scp b/support/download/scp
> > > index 80cf495c4e..d81952956c 100755
> > > --- a/support/download/scp
> > > +++ b/support/download/scp
> > > @@ -7,17 +7,20 @@ set -e
> > >  #
> > >  # Options:
> > >  #   -q          Be quiet.
> > > +#   -C          Only check that the file exists remotely.
> > >  #   -o FILE     Copy to local file FILE.
> > >  #   -f FILE     Copy from remote file FILE.
> > >  #   -u URI      Download file at URI.
> > >  #
> > >  # Environment:
> > >  #   SCP       : the scp command to call
> > > +#   SSH       : the ssh command to use for checkonly
> > >
> > >  verbose=
> > >  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> > >      case "${OPT}" in
> > >      q)  verbose=-q;;
> > > +    C)  checkonly=1;;
> > >      o)  output="${OPTARG}";;
> > >      f)  filename="${OPTARG}";;
> > >      u)  uri="${OPTARG}";;
> > > @@ -33,8 +36,19 @@ shift $((OPTIND-1)) # Get rid of our options
> > >  _scp() {
> > >      eval ${SCP} "${@}"
> > >  }
> > > +_ssh() {
> > > +    eval ${SSH} "${@}"
> > > +}
> > >
> > >  # Remove any scheme prefix
> > >  uri="${uri##scp://}"
> > >
> > > +if [ -n "${checkonly}" ]; then
> > > +    # uri now looks like:  foo.example.org:some/directory
> > > +    domain="${uri%%:*}"
> > > +    path="${uri#*:}/${filename}"
> > > +    _ssh ${verbose} "${@}" "'${domain}'" ls "'${path}'" > /dev/null
> >
> > I was going to reply to the previous thread, but you were too fast to
> > respin, so here's my proposal to avoid ls:
> >
> >     /usr/bin/env [ -f "'${path}'" ]
> >
> > It is almost impossible to have a system that lacks 'env' or that have
> > it in another location, as POSIX mandates env to exist, and IIRC, it
> > even mandates it to be /usr/bin/env (of is it FHS? at least, scripts in
> > Buildroot use "#!/usr/bin/env bash").
> >
> > You may have to carefully quote the [ and ], to avoid the eval from
> > doing a nasty, weel, evaluation...
>
> I would use 'test' rather than [ ] to avoid any such problem.
>
> Thanks for the suggestion, I will test it.
>

Actually, I don't think the 'env' is needed, a simple 'test -f' will
do, my reasoning below.

Arnout is right that 'ls' is not guaranteed to exist, it is not a
mandatory POSIX utility but an 'XSI' extension.
http://pubs.opengroup.org/onlinepubs/009695399/utilities/ls.html

On the contrary, 'test' is a mandatory POSIX utility (i.e. there are
no specific codes like XSI mentioned on following page)
http://pubs.opengroup.org/onlinepubs/000095399/utilities/test.html

So 'test' will certainly exist. We are not sure if it is in /bin/ or
/usr/bin/ or another place, though.
By calling it without absolute path, we assume that it is in the standard PATH.

One could argue that '/usr/bin/env test' is better, but if 'test' is
_not_ in the standard PATH, then 'env' will also not find it. So, I
don't see how 'env' brings an advantage.

/Thomas
