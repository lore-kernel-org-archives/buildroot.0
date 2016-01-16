From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 01:28:23 +0100
Subject: [Buildroot] [PATCH] support/scripts: add size-stats-compare
 script
In-Reply-To: <1452872492-6980-1-git-send-email-patrickdepinguin@gmail.com>
References: <1452872492-6980-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56998EA7.5020603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 Interesting concept...

On 15-01-16 16:41, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Leverage the CSV files produces by size-stats (make graph-size) to allow
> for a comparison of rootfs size between two different buildroot
> compilations.
> 
> The script takes the file-size CSV files of two compilations as input, and
> produces a textual report of the differences per package.
> Using the -d/--detail flag, the report will show the file size changes
> instead of package size changes.
> The -t/--threshold option allows to ignore file size differences smaller
> than the given threshold (in bytes).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  support/scripts/size-stats-compare | 98 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100755 support/scripts/size-stats-compare

 I think you should also add a reference to the script to
docs/manual/common-usage.txt. No full documentation is needed, you can just
point to the --help option (otherwise it would just get out of sync).

> 
> diff --git a/support/scripts/size-stats-compare b/support/scripts/size-stats-compare
> new file mode 100755
> index 0000000..d7eec09
> --- /dev/null
> +++ b/support/scripts/size-stats-compare
> @@ -0,0 +1,98 @@
> +#!/usr/bin/env python
> +
> +# Copyright (C) 2016 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> +
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +# General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +# Compare the rootfs size per package/file with that from another compilation
> +# (possibly from a different release).
> +
> +# This code relies on the output CSV files of 'make graph-size'. If you
> +# are comparing to an older Buildroot release, you can consider backporting
> +# that feature. See commits:
> +#    99aca138c20e1259ac8c23252c223e150d460482 (instrumentation hook)
> +#    598c80be8fc7b5ddfcba6f7715d90757033723ef (size-stats script)
> +#    24c75fbb38ffeb5c5a7278cf40f4f7cf867502e0 (make graph-size)

 I think this documentation should be part of the argparse description.

> +
> +import csv
> +import argparse
> +
> +def read_packages_csv(inputf, detail=None):

 Given the name of the input file read_file_size_stats_csv would be a more
natural name.

> +    sizes = {}
> +    with open(inputf) as f:
> +        reader = csv.reader(f)
> +        # skip first line (header)
> +        next(reader)

 Perhaps it would be good to verify here that the header is as expected, at
least the first 4 entries.

> +        for row in csv.reader(f):
> +            if detail:
> +                sizes[row[0]] = int(row[2])
> +            else:
> +                sizes[row[1]] = int(row[3])
> +    return sizes
> +
> +def compare_sizes(this, other):
> +    delta = {}
> +    removed = {}
> +    added = {}
> +    thiskeys = set(this.keys())
> +    otherkeys = set(other.keys())
> +
> +    # packages in both

 packages or files, actually.

> +    for pkg in thiskeys.intersection(otherkeys):
> +        delta[pkg] = this[pkg] - other[pkg]
> +    # packages only in this
> +    for pkg in thiskeys.difference(otherkeys):
> +        added[pkg] = this[pkg]
> +    # packages only in other
> +    for pkg in otherkeys.difference(thiskeys):
> +        removed[pkg] = -other[pkg]
> +
> +    return delta, added, removed
> +
> +def print_results(result, title, threshold):
> +    print '%s:' % title

 I would skip this complete if the result is empty. So

    if not result:
        return

> +    for pkg in result.keys():
> +        if abs(result[pkg]) < threshold:

 I think <= would be more natural here. Then you can pass -t 0 to get rid of all
packages that remain equal.

 Also a nice extension for a future patch would be to support K, M, G in the
threshold.

> +            continue
> +        print '%12d %s' % (result[pkg], pkg)

 I think it would be better if the output was also CSV. If it is not CSV, please
make it python3-compatible by adding () around the argument.

 A nice additional feature would be if the output CSV would (optionally?)
contain all the info from the original CSVs. But that can be follow-up patch, of
course.

> +
> +
> +# main #########################################################################
> +
> +parser = argparse.ArgumentParser(description='Compare rootfs size between Buildroot compilations')
> +
> +parser.add_argument('-f', '--file-size-csv',
> +                    help='CSV file with file and package size statistics')

 You could use type=argparse.FileType('r') to get automatic help in case the
file doesn't exist. And then you have to remove the open() from
read_packages_csv, of course.

 Can you put the actual file name in the help text? Perhaps just with
metavar='file-size-stats.csv'

 And actually, I would remove the -f and -g bits, i.e. make them positional
arguments. So add_argument('file-size-csv', help=...).

> +parser.add_argument('-g', '--other-file-size-csv',
> +                    help='CSV file with file and package size statistics to compare with')

 Wrap this line (using '''). argparse will rewrap the help text. Same below.
Note that you can even align the help text here, all whitespace will be rewrapped.

> +parser.add_argument('-d', '--detail', action='store_true',
> +                    help='detail with individual files rather than packages')
> +parser.add_argument('-t', '--threshold', type=int,
> +                    help='threshold value: ignore size differences smaller than this value (bytes)')
> +args = parser.parse_args()
> +
> +sizes = read_packages_csv(args.file_size_csv, args.detail)
> +other_sizes = read_packages_csv(args.other_file_size_csv, args.detail)
> +
> +delta, added, removed = compare_sizes(sizes, other_sizes)
> +
> +if args.detail:
> +    keyword = 'file'
> +else:
> +    keyword = 'package'
> +
> +print_results(delta, 'Size difference per %s (bytes)' % keyword, args.threshold)
> +print_results(added, 'Size difference due to added %ss (bytes)' % keyword, args.threshold)
> +print_results(removed, 'Size difference due to removed %ss (bytes)' % keyword, args.threshold)
> 

 Otherwise looks good. Or in fact, most of my comments are optional, feel free
to ignore them. Only the wrapping and the full description I consider essential.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
