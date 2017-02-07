From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Feb 2017 15:51:49 +0100
Subject: [Buildroot] [PATCH v5 05/19] pycompile: allow to force
	compilation
In-Reply-To: <1482241596-31688-6-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-6-git-send-email-jezz@sysmic.org>
Message-ID: <CAHXCMMK1Vma3--xX=G5MFL0i4d8QROTAUk6z71_G6As2TNkxJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all,

On Tue, Dec 20, 2016 at 2:46 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> By default, compile_dir() rely on modification time to know if a python file
> have to be built again. However in some circumstances (when doing reproducible
> builds), modification times are not reliable. Thus, this patch add a way to
> force rebuild of all python sources.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>
> Notes:
>     v5:
>       - Improve commit log
>     v3:
>       - new patch
>
>  support/scripts/pycompile.py | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index fde711a..5598f8a 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -10,6 +10,7 @@ from __future__ import print_function
>  import sys
>  import py_compile
>  import compileall
> +import argparse
>
>  class ReportProblem:
>      def __nonzero__(self):
> @@ -21,4 +22,12 @@ class ReportProblem:
>
>  report_problem = ReportProblem()
>
> -compileall.compile_dir(sys.argv[1], quiet=report_problem)
> +parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
> +parser.add_argument("target", metavar='DIRECTORY',
> +        help='Directory to scan')
> +parser.add_argument("--force", action='store_true',
> +        help="Force compilation even if alread compiled")
> +
> +args = parser.parse_args()
> +
> +compileall.compile_dir(args.target, force=args.force, quiet=report_problem)
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
