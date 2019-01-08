From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 14:35:48 +0100
Subject: [Buildroot] [PATCH 09/19] support: add parser in python for
 packages-file-list files
In-Reply-To: <e7e1c2fbfe91efe150ea94270b60f477d131fa09.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <e7e1c2fbfe91efe150ea94270b60f477d131fa09.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUTE+HoEqZPAvSLgo4MEUjAX8TJPWV3Nku5+CRbS+Ookg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 7 ene. 2019 a las 23:06, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Currently, each script that want to parse the package-files lists has to
> invent its own parsing. So far, this was acceptable, as the format of
> those files was relatively easy (line-based records, comma-separated
> fields).
>
> However, that format is not very resilient against weird filenames (e.g.
> filenames with commas in the, or even with \n chars in them.

in the,   --> in them

>
> Furthermore, that format is not easily extensible.
>
> So, introduce a parser, in python, that abstracts the format of these
> files, and returns a dictionaries. Using dictionaries makes it easy for

returns a dictionary.

> callers to just ignore the fields they are not interested in, or even
> are not aware of. Consequently, it will make it easy for us to introduce
> new fields in the future.
>
> Convert the two existing python scripts that parse those files.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> ---
> Note: a shell-script also parses those files, it will be handled in a
> subsequent change.
> ---
>  support/scripts/brpkgutil.py     | 16 ++++++++++++++++
>  support/scripts/check-uniq-files |  7 +++----
>  support/scripts/size-stats       | 14 +++++++-------
>  3 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
> index e70d525353..d15b18845b 100644
> --- a/support/scripts/brpkgutil.py
> +++ b/support/scripts/brpkgutil.py
> @@ -5,6 +5,22 @@ import sys
>  import subprocess
>
>
> +# Iterate on all records of the packages-file-list file passed as filename
> +# Returns an iterator over a list of dictionaries. Each dictionary contains
> +# these keys (others maybe added in the future):
> +# 'file': the path of the file,
> +# 'pkg':  the last package that installed that file
> +def parse_pkg_file_list(path):
> +    with open(path, 'rb') as f:

Why exactly do you open as binary?
IIRC this will cause the need for decoding the strings on Python 3,
which you don't seem to do. This was also the reason why the orginal
check-uniq-files needed 'b' markers in front of some strings like
b','.

> +        for rec in f.readlines():
> +            l = rec.split(',0')

This looks wrong to me, there is no text ',0' in the input.
I think you meant rec.split(',', 1), no, like in the original code?

> +            d = {
> +                  'file': l[0],
> +                  'pkg':  l[1],

This seems also wrong, 0 and 1 are swapped.
Example input is:

busybox,./usr/bin/eject
busybox,./usr/bin/basename
busybox,./usr/bin/hexedit
busybox,./usr/bin/readlink
busybox,./usr/bin/cmp

so I would expect 'pkg' to be l[0] and 'file' to be l[1].

Note that 'l' could perhaps become a more meaningful variable name. I
also think that one of the python rules is that variable names should
be minimum 3 characters.

> +                }
> +            yield d
> +
> +
>  # Execute the "make <pkg>-show-version" command to get the version of a given
>  # list of packages, and return the version formatted as a Python dictionary.
>  def get_version(pkgs):
> diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
> index e95a134168..7020462981 100755
> --- a/support/scripts/check-uniq-files
> +++ b/support/scripts/check-uniq-files
> @@ -3,6 +3,7 @@
>  import sys
>  import argparse
>  from collections import defaultdict
> +from brpkgutil import parse_pkg_file_list as parse_pkg_file_list
>
>  warn = 'Warning: {0} file "{1}" is touched by more than one package: {2}\n'
>
> @@ -35,10 +36,8 @@ def main():
>          return False
>
>      file_to_pkg = defaultdict(set)
> -    with open(args.packages_file_list[0], 'rb') as pkg_file_list:
> -        for line in pkg_file_list.readlines():
> -            pkg, _, file = line.rstrip(b'\n').partition(b',')

Note that the rstrip of newlines is no longer present in parse_pkg_file_list.

> -            file_to_pkg[file].add(pkg)
> +    for record in parse_pkg_file_list(args.packages_file_list[0]):
> +        file_to_pkg[record['file']].add(record['pkg'])
>
>      for file in file_to_pkg:
>          if len(file_to_pkg[file]) > 1:
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index deea92e278..48cd834ab4 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -22,6 +22,7 @@ import os.path
>  import argparse
>  import csv
>  import collections
> +from brpkgutil import parse_pkg_file_list as parse_pkg_file_list
>
>  try:
>      import matplotlib
> @@ -66,13 +67,12 @@ def add_file(filesdict, relpath, abspath, pkg):
>  #
>  def build_package_dict(builddir):
>      filesdict = {}
> -    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
> -        for l in filelistf.readlines():
> -            pkg, fpath = l.split(",", 1)
> -            # remove the initial './' in each file path
> -            fpath = fpath.strip()[2:]
> -            fullpath = os.path.join(builddir, "target", fpath)
> -            add_file(filesdict, fpath, fullpath, pkg)
> +    fname = os.path.join(builddir, "build", "packages-file-list.txt")
> +    for record in parse_pkg_file_list(fname):
> +        # remove the initial './' in each file path
> +        fpath = record['file'].strip()[2:]

The stripping here and the rstrip in check-uniq-files could perhaps
all be moved to parse_pkg_file_list.

> +        fullpath = os.path.join(builddir, "target", fpath)
> +        add_file(filesdict, fpath, fullpath, record['pkg'])
>      return filesdict
>

/Thomas
