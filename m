From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 16:02:56 +0200
Subject: [Buildroot] [PATCHv3 3/5] support/scripts: add size-stats script
In-Reply-To: <1423171200-24583-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423171200-24583-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55229210.3020607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/15 22:19, Thomas Petazzoni wrote:
> This new script uses the data collected by the step_pkg_size
> instrumentation hook to generate a pie chart of the size contribution
> of each package to the target root filesystem, and two CSV files with
> statistics about the package size and file size. To achieve this, it
> looks at each file in $(TARGET_DIR), and using the
> packages-file-list.txt information collected by the step_pkg_size
> hook, it determines to which package the file belongs. It is therefore
> able to give the size installed by each package.

 I'm reviewing purely the python coding style here. Found no major shortcomings,
just a few things that can be done in a nicer way, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/size-stats | 231 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
>  create mode 100755 support/scripts/size-stats
> 
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> new file mode 100755
> index 0000000..a5c0c74
> --- /dev/null
> +++ b/support/scripts/size-stats
> @@ -0,0 +1,231 @@
> +#!/usr/bin/env python
> +
> +# Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
> +import sys
> +import os
> +import os.path
> +import argparse
> +import csv
> +
> +try:
> +    import matplotlib.font_manager as fm
> +    import matplotlib.pyplot as plt
> +except ImportError:
> +    sys.stderr.write("You need python-matplotlib to generate the size graph\n")
> +    exit(1)
> +
> +colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
> +          '#0068b5', '#f28e00', '#940084', '#97c000']
> +
> +#
> +# This function returns a dict containing as keys the files present in
> +# the filesystem skeleton, and as value, the string "skeleton". It is
> +# used to simulate a fake "skeleton" package, to assign the files from
> +# the skeleton to some package.
> +#
> +# builddir: path to the Buildroot output directory
> +# skeleton_path: path to the rootfs skeleton
> +#
> +def build_skeleton_dict(builddir, skeleton_path):
> +    skeleton_files = {}
> +    for root, _, files in os.walk(skeleton_path):
> +        for f in files:
> +            if f == ".empty":
> +                continue
> +            frelpath = os.path.relpath(os.path.join(root, f), skeleton_path)
> +            # Get the real size of the installed file
> +            targetpath = os.path.join(builddir, "target", frelpath)
> +            if os.path.islink(targetpath):
> +                continue

 There should be a similar escape for files that don't exist in target (removed
by finalize script).

> +            sz = os.stat(targetpath).st_size
> +            skeleton_files[frelpath] = { 'pkg': "skeleton", 'size': sz }
> +    return skeleton_files
> +
> +#
> +# This function returns a dict where each key is the path of a file in
> +# the root filesystem, and the value is a dict containing two
> +# elements: the name of the package to which this file belongs (key:
> +# pkg) and the size of the file (key: size).
> +#
> +# builddir: path to the Buildroot output directory
> +#
> +def build_package_dict(builddir):
> +    pkgdict = {}
> +    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
> +        for l in filelistf.readlines():
> +            f = l.split(",")

 I think a nicer way to write this is

pkg,fpath = l.split(",")

> +            fpath = f[1].strip().replace("./", "")

 Not likely to occur, but this will also replace foo./bar to foobar.

> +            fullpath = os.path.join(builddir, "target", fpath)
> +            if not os.path.exists(fullpath):
> +                continue
> +            pkg = f[0]
> +            sz = os.stat(fullpath).st_size
> +            pkgdict[fpath] = { 'pkg': pkg, 'size': sz }

 This entire part could be refactored with the skeleton handling. I think that
escaping symlinks is also relevant here.

> +    return pkgdict
> +
> +#
> +# This function builds a dictionary that contains the name of a
> +# package as key, and the size of the files installed by this package
> +# as the value.
> +#
> +# pkgdict: dictionary with the name of the files as key, and as value
> +# a dict containing the name of the package to which the files
> +# belongs, and the size of the file. As returned by
> +# build_package_dict.
> +#
> +# builddir: path to the Buildroot output directory
> +#
> +def build_package_size(pkgdict, builddir):
> +    pkgsize = {}
> +
> +    for root, _, files in os.walk(os.path.join(builddir, "target")):
> +        for f in files:
> +            fpath = os.path.join(root, f)
> +            if os.path.islink(fpath):
> +                continue

 Ah, you escape the link here... Makes sense of course otherwise it would become
unknown. But why is it different for the skeleton?

> +            frelpath = os.path.relpath(fpath, os.path.join(builddir, "target"))
> +            if not frelpath in pkgdict:
> +                print("WARNING: %s is not part of any package" % frelpath)
> +                pkg = "unknown"
> +            else:
> +                pkg = pkgdict[frelpath]["pkg"]
> +
> +            if pkg in pkgsize:
> +                pkgsize[pkg] += os.path.getsize(fpath)
> +            else:
> +                pkgsize[pkg] = os.path.getsize(fpath)

 Use a defaultdict [1]

import collections
pkgsize = collections.defaultdict(int)
pkgsize[pkg] += os.path.getsize(fpath)

> +
> +    return pkgsize
> +
> +#
> +# Given a dict returned by build_package_size(), this function
> +# generates a pie chart of the size installed by each package.
> +#
> +# pkgsize: dictionary with the name of the package as a key, and the
> +# size as the value, as returned by build_package_size.
> +#
> +# outputf: output file for the graph
> +#
> +def draw_graph(pkgsize, outputf):
> +    total = 0
> +    for (p, sz) in pkgsize.items():
> +        total += sz

total = sum(pkgsize.values())

> +    labels = []
> +    values = []
> +    other_value = 0
> +    for (p, sz) in pkgsize.items():
> +        if sz < (total * 0.01):
> +            other_value += sz
> +        else:
> +            labels.append("%s (%d kB)" % (p, sz / 1000.))
> +            values.append(sz)
> +    labels.append("Other (%d kB)" % (other_value / 1000.))
> +    values.append(other_value)
> +
> +    plt.figure()
> +    patches, texts, autotexts = plt.pie(values, labels=labels,
> +                                        autopct='%1.1f%%', shadow=True,
> +                                        colors=colors)
> +    # Reduce text size
> +    proptease = fm.FontProperties()
> +    proptease.set_size('xx-small')
> +    plt.setp(autotexts, fontproperties=proptease)
> +    plt.setp(texts, fontproperties=proptease)
> +
> +    plt.title('Size per package')
> +    plt.savefig(outputf)
> +
> +#
> +# Generate a CSV file with statistics about the size of each file, its
> +# size contribution to the package and to the overall system.

 I don't think this file is very useful, but obviously it doesn't hurt to
generate it.

> +#
> +# pkgdict: dictionary with the name of the files as key, and as value
> +# a dict containing the name of the package to which the files
> +# belongs, and the size of the file. As returned by
> +# build_package_dict.

 Since it has files as dict, I would think it makes more sense to call it filesdict.

> +#
> +# pkgsize: dictionary with the name of the package as a key, and the
> +# size as the value, as returned by build_package_size.
> +#
> +# outputf: output CSV file
> +#
> +def gen_files_csv(pkgdict, pkgsizes, outputf):
> +    total = 0
> +    for (p, sz) in pkgsizes.items():
> +        total += sz

 total = sum(pkgsizes.values())

> +    with open(outputf, 'w') as csvfile:
> +        wr = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
> +        wr.writerow(["File name",
> +                     "Package name",
> +                     "File size",
> +                     "Package size",
> +                     "File size in package (%)",
> +                     "File size in system (%)"])
> +        for (f, info) in pkgdict.items():
> +            pkgname = info["pkg"]
> +            filesize = info["size"]

 Given the way that this is used, I would define the pkgdict as a dict of pairs
instead of a dict of dicts. So this would become

for f, (pkgname, filesize) in pkgdict.items():

> +            pkgsize = pkgsizes[pkgname]
> +            wr.writerow([f, pkgname, filesize, pkgsize, "%.4f" % (float(filesize) / pkgsize * 100), "%.4f" % (float(filesize) / total * 100)])

 Can this long line be split? Also, I find .4f a bit too many digits - .1 ought
to be enough. Anything below .1% is really 0, no?

> +
> +
> +#
> +# Generate a CSV file with statistics about the size of each package,
> +# and their size contribution to the overall system.
> +#
> +# pkgsize: dictionary with the name of the package as a key, and the
> +# size as the value, as returned by build_package_size.
> +#
> +# outputf: output CSV file
> +#
> +def gen_packages_csv(pkgsizes, outputf):

 In the other functions it's called pkgsize instead of pkgsizes.

> +    total = 0
> +    for (p, sz) in pkgsizes.items():
> +        total += sz

 total = sum(well you get the drift :-)

> +    with open(outputf, 'w') as csvfile:
> +        wr = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
> +        wr.writerow(["Package name", "Package size", "Package size in system (%)"])
> +        for (pkg, size) in pkgsizes.items():
> +            wr.writerow([pkg, size, "%.4f" % (float(size) / total * 100)])
> +
> +parser = argparse.ArgumentParser(description='Draw build time graphs')
> +
> +parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
> +                    help="Buildroot output directory")
> +parser.add_argument("--graph", '-g', metavar="GRAPH",
> +                    help="Graph output file (.pdf or .png extension)")
> +parser.add_argument("--file-size-csv", '-f', metavar="FILE_SIZE_CSV",
> +                    help="CSV output file with file size statistics")
> +parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
> +                    help="CSV output file with package size statistics")
> +parser.add_argument("--skeleton-path", '-s', metavar="SKELETON_PATH", required=True,
> +                    help="Path to the skeleton used for the system")
> +args = parser.parse_args()
> +
> +# Find out which package installed what files
> +pkgdict = build_package_dict(args.builddir)
> +pkgdict.update(build_skeleton_dict(args.builddir, args.skeleton_path))

 No, skeleton should be first, packages afterwards. If a package overwrites a
skeleton file, the package should win.

 Also, there should be something similar like skeleton for the overlay(s), and
that should of course come after the packages.


 Regards,
 Arnout

> +
> +# Collect the size installed by each package
> +pkgsize = build_package_size(pkgdict, args.builddir)
> +
> +if args.graph:
> +    draw_graph(pkgsize, args.graph)
> +if args.file_size_csv:
> +    gen_files_csv(pkgdict, pkgsize, args.file_size_csv)
> +if args.package_size_csv:
> +    gen_packages_csv(pkgsize, args.package_size_csv)
> 


[1] http://jtauber.com/blog/2008/02/27/evolution_of_default_dictionaries_in_python/



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
