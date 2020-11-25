From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 12:54:14 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <20201125215203.030cdb99@windsurf.home>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
 <CA+h8R2rQcCzEt6TtqjEHYMoJurXrqJQ=UsimFHBzg+1hzx9Q+g@mail.gmail.com>
 <20201125215203.030cdb99@windsurf.home>
Message-ID: <CA+h8R2oGbPWH=ziw=XuT9OiYqE5nZyQJ5v6PCqqaXFAxAF87Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 25, 2020 at 12:52 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> >
> >      # Parse our options; anything after '--' is for the backend
> > -    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
> > +    while getopts ":c:d:D:g:o:n:N:H:rf:u:qp:" OPT; do
> >          case "${OPT}" in
> >          c)  cset="${OPTARG}";;
> >          d)  dl_dir="${OPTARG}";;
> >          D)  old_dl_dir="${OPTARG}";;
> > +        g)  gomod_init="${OPTARG}";;
>
> Unfortunately, this is not really a very good solution, because the
> dl-wrapper is generic, and if we start adding language-specific and
> backend-specific options, it's really going to become a nightmare :-/

Pass it as an environment variable? I don't see what the problem is
aside from the optargs.

> >  # Do the Go vendoring
> >  pushd ${base_name} > /dev/null
> > +if [ -n "${gomod_init}" ]; then
> > +    # Note: does nothing if go.mod already exists.
> > +    go mod init ${gomod_init}
>
> So this cannot simply be conditional on go.mod existing or not, because
> we need the name of the Go module ?

The "go mod init" command will actually do nothing if go.mod already exists.

We do need the name of the go module though in the case that go.mod
does not exist.

Best regards,
Christian
