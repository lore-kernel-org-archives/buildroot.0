From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Apr 2014 21:46:35 +0200
Subject: [Buildroot] [PATCH 2/6] support/graph-depends: use argparse to
 parse argv[]
In-Reply-To: <CAHXCMMJzSH9vzEhCnQaTTLvirrY-xJVjd_7NpJUyU09DuF3Naw@mail.gmail.com>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
 <6e53d567f4b2087188a43cb2602b4096972c8c20.1397421554.git.yann.morin.1998@free.fr>
 <CAHXCMMJzSH9vzEhCnQaTTLvirrY-xJVjd_7NpJUyU09DuF3Naw@mail.gmail.com>
Message-ID: <20140414194635.GA3255@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-14 21:20 +0200, Samuel Martin spake thusly:
> On Sun, Apr 13, 2014 at 10:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Currently, we are using a crude, ad-hoc parsing of argv[].
> > This is a limiting factor to adding new options.
> >
> > Use argparse instead, and introduce a single argument for now:
> >   --package, -p PACKAGE
> 
> Is an option really needed for package? I mean it could be the
> remaining argument(s); or maybe it does not fit in developments you
> have in mind ;).

It's just that I don't know how to do that with Python's argparse.
I just duplicated the code in:
    support/scripts/graph-nuild-time

[--SNIP--]
> > diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> > index ac24086..fc3cadd 100755
> > --- a/support/scripts/graph-depends
> > +++ b/support/scripts/graph-depends
> > @@ -31,14 +32,16 @@ PKG_MODE  = 2
> >
> >  mode = 0
> >
> > -if len(sys.argv) == 1:
> > +parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
> > +parser.add_argument("--package", '-p', metavar="PACKAGE",
> 
> Any reason to mixed double and single quotes?

Again, I just duplicated what was already in:
    support/scripts/graph-build-time

> > +                    help="Graph the dependencies of PACKAGE")
> > +args = parser.parse_args()
> > +
> > +if args.package == None:
> 
> In Python, None is a singleton, and it is recommended to use "is" or
> "is not" for testing them [1].

OK, I'll send an follow-up patch to fix that.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
