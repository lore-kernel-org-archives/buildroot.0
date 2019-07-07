From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Sun, 7 Jul 2019 09:43:16 -0500
Subject: [Buildroot] [PATCH 1/1] utils/check-package: Add a quiet flag
In-Reply-To: <6749b240-6844-b50e-59dd-fc5d2485fa3a@mind.be>
References: <20190702185227.14435-1-brandon.maier@rockwellcollins.com>
 <6749b240-6844-b50e-59dd-fc5d2485fa3a@mind.be>
Message-ID: <CA+fik53QPbO5pG48C3nutnvOHhFZU_cCxDMmJfYwQoQJd7Ab3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 3, 2019, 4:39 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Brandon,
>
> On 02/07/2019 20:52, Brandon Maier wrote:
> > When running in a CI system, stat messages become white noise. Introduce
> > an option to suppress non-error, non-warning, messages.
> >
> > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
>
>  Applied to master, thanks.

Thanks

>
>  However, could you give an example of a case where this is annoying in CI
> output? If I look at e.g. the output in gitlab-ci [1], the cruft that is
> added
> by gitlab-ci itself makes it pretty verbose already.
>

We have a custom tool to run various checks on our team's pull requests and
display findings. E.g. check-package, checkpatch, shellcheck, pylint, etc.

It's a simple tool though, and dumps stdout/stderr into the report. So it
assumes no output means everything is okay. All the other checkers have a
-q equivalent, so figured it'd be easiest to add it to check-package as
well.


>  Regards,
>  Arnout
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/242921394
>
>
> > ---
> >  utils/check-package | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/utils/check-package b/utils/check-package
> > index ce1fe98d67..f09aaeea03 100755
> > --- a/utils/check-package
> > +++ b/utils/check-package
> > @@ -33,6 +33,7 @@ def parse_args():
> >                          default="http://nightly.buildroot.org/",
> >                          help="default: %(default)s")
> >      parser.add_argument("--verbose", "-v", action="count", default=0)
> > +    parser.add_argument("--quiet", "-q", action="count", default=0)
> >
> >      # Now the debug options in the order they are processed.
> >      parser.add_argument("--include-only", dest="include_list",
> action="append",
> > @@ -177,8 +178,10 @@ def __main__():
> >      # (e.g. counted by 'wc'), so for stats use stderr. Wait all
> warnings are
> >      # printed, for the case there are many of them, before printing
> stats.
> >      sys.stdout.flush()
> > -    print("{} lines processed".format(total_lines), file=sys.stderr)
> > -    print("{} warnings generated".format(total_warnings),
> file=sys.stderr)
> > +
> > +    if not flags.quiet:
> > +        print("{} lines processed".format(total_lines), file=sys.stderr)
> > +        print("{} warnings generated".format(total_warnings),
> file=sys.stderr)
> >
> >      if total_warnings > 0:
> >          sys.exit(1)
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190707/0de8b419/attachment.html>
