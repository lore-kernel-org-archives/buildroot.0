From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Jul 2019 23:39:33 +0200
Subject: [Buildroot] [PATCH 1/1] utils/check-package: Add a quiet flag
In-Reply-To: <20190702185227.14435-1-brandon.maier@rockwellcollins.com>
References: <20190702185227.14435-1-brandon.maier@rockwellcollins.com>
Message-ID: <6749b240-6844-b50e-59dd-fc5d2485fa3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Brandon,

On 02/07/2019 20:52, Brandon Maier wrote:
> When running in a CI system, stat messages become white noise. Introduce
> an option to suppress non-error, non-warning, messages.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

 Applied to master, thanks.

 However, could you give an example of a case where this is annoying in CI
output? If I look at e.g. the output in gitlab-ci [1], the cruft that is added
by gitlab-ci itself makes it pretty verbose already.

 Regards,
 Arnout

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/242921394


> ---
>  utils/check-package | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index ce1fe98d67..f09aaeea03 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -33,6 +33,7 @@ def parse_args():
>                          default="http://nightly.buildroot.org/",
>                          help="default: %(default)s")
>      parser.add_argument("--verbose", "-v", action="count", default=0)
> +    parser.add_argument("--quiet", "-q", action="count", default=0)
>  
>      # Now the debug options in the order they are processed.
>      parser.add_argument("--include-only", dest="include_list", action="append",
> @@ -177,8 +178,10 @@ def __main__():
>      # (e.g. counted by 'wc'), so for stats use stderr. Wait all warnings are
>      # printed, for the case there are many of them, before printing stats.
>      sys.stdout.flush()
> -    print("{} lines processed".format(total_lines), file=sys.stderr)
> -    print("{} warnings generated".format(total_warnings), file=sys.stderr)
> +
> +    if not flags.quiet:
> +        print("{} lines processed".format(total_lines), file=sys.stderr)
> +        print("{} warnings generated".format(total_warnings), file=sys.stderr)
>  
>      if total_warnings > 0:
>          sys.exit(1)
> 
