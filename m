From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Jan 2019 22:03:15 +0100
Subject: [Buildroot] [PATCH 01/11] support/download: fix scp downloads
In-Reply-To: <20190103205518.GB5991@scaer>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-2-patrickdepinguin@gmail.com>
 <20190103205518.GB5991@scaer>
Message-ID: <CAAXf6LU6m9WnwztW6bVOxobwFkpVi3TBUAJc8pWNxJR5s8HfNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 3, 2019, 21:55 Yann E. MORIN <yann.morin.1998@free.fr wrote:

> Thomas, All,
>
> On 2019-01-03 21:40 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > scp download is broken, because scp is called without filename argument
> and
> > only the server is specified. The call is:
> >     scp <server> <outputfile>
> >
> > but should be:
> >     scp <server>/<filename> <outputfile>
> >
> > Instead of assuming '-u' lists a full URL including filename (which it is
> > not), align with the wget helper where -u is the server URL and -f gives
> the
> > filename.
> >
> > With this commit, an scp download can work if FOO_SITE_METHOD is
> explicitly
> > set to 'scp' and the server does not have a scheme prefix 'scp://'.
> > The next commit will handle the case where a scheme prefix is present.
> >
> > Signed-off-by: Thomas De Schampheleire <
> thomas.de_schampheleire at nokia.com>
> > ---
> >  support/download/scp | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/support/download/scp b/support/download/scp
> > index 8ecf2f4b22..746c3c6ba0 100755
> > --- a/support/download/scp
> > +++ b/support/download/scp
> > @@ -8,7 +8,8 @@ set -e
> >  # Options:
> >  #   -q          Be quiet.
> >  #   -o FILE     Copy to local file FILE.
> > -#   -u FILE     Copy from remote file FILE.
> > +#   -f FILE     Copy from remote file FILE.
> > +#   -u URL      Download file at URL.
>
> This is not an URL, but an URI, and even then, this is only the
> authority part [0] of the URI. ;-) But, Oh well... I'm bikeshedding
> here, so:
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> [0]
> https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Generic_syntax


The differences between URL and URI have never been really clear to me.
So from the link, URI is the generic term and URL is a type of URI?
And because this -u argument does not refer to one resource but a server
hosting multiple resources, it cannot be a URL?

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190103/2537e779/attachment.html>
