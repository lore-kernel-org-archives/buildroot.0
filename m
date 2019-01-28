From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2019 18:16:07 +0100
Subject: [Buildroot] [PATCH 6/8] utils/check-package: allow to disable
 warning for a line
In-Reply-To: <20190127185943.1136-7-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-7-ricardo.martincoski@gmail.com>
Message-ID: <9c30744b-fdf5-1b48-d320-b1c8a958ceec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/01/2019 19:59, Ricardo Martincoski wrote:
> Currently any exceptions for a check function need to be coded into the
> check-package script itself.
> 
> Create a pattern that can be used in a comment to make check-package
> ignore one or more warning types in the line immediately below:
>  # check-package Indent, VariableWithBraces
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

 It would be nice to have mentioned that an in-tree user of this feature will be
added in a later patch.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  utils/check-package           | 4 ++++
>  utils/checkpackagelib/base.py | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 26439f08eb..ce1fe98d67 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -119,36 +119,40 @@ def check_file_using_lib(fname):
>          return nwarnings, nlines
>      classes = inspect.getmembers(lib, is_a_check_function)
>  
>      if flags.dry_run:
>          functions_to_run = [c[0] for c in classes]
>          print("{}: would run: {}".format(fname, functions_to_run))
>          return nwarnings, nlines
>  
>      objects = [c[1](fname, flags.manual_url) for c in classes]
>  
>      for cf in objects:
>          nwarnings += print_warnings(cf.before())
>      if six.PY3:
>          f = open(fname, "r", errors="surrogateescape")
>      else:
>          f = open(fname, "r")
> +    lastline = ""
>      for lineno, text in enumerate(f.readlines()):
>          nlines += 1
>          for cf in objects:
> +            if cf.disable.search(lastline):
> +                continue
>              nwarnings += print_warnings(cf.check_line(lineno + 1, text))
> +        lastline = text
>      f.close()
>      for cf in objects:
>          nwarnings += print_warnings(cf.after())
>  
>      return nwarnings, nlines
>  
>  
>  def __main__():
>      global flags
>      flags = parse_args()
>  
>      if flags.intree_only:
>          # change all paths received to be relative to the base dir
>          base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
>          files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
>          # move current dir so the script find the files
> diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
> index fc09bec9a2..9544a64e5a 100644
> --- a/utils/checkpackagelib/base.py
> +++ b/utils/checkpackagelib/base.py
> @@ -1,16 +1,18 @@
>  # See utils/checkpackagelib/readme.txt before editing this file.
> +import re
>  
>  
>  class _CheckFunction(object):
>      def __init__(self, filename, url_to_manual):
>          self.filename = filename
>          self.url_to_manual = url_to_manual
> +        self.disable = re.compile(r"^\s*# check-package .*\b{}\b".format(self.__class__.__name__))
>  
>      def before(self):
>          pass
>  
>      def check_line(self, lineno, text):
>          pass
>  
>      def after(self):
>          pass
> 
