From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 02 Dec 2014 12:01:11 +0100
Subject: [Buildroot] [PATCHv2 3/4] support/scripts: add size-stats script
In-Reply-To: <1417470100-32657-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470100-32657-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429484.vXm9l0Ysfx@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I have a few comments below.

On Monday 01 December 2014 22:41:39 Thomas Petazzoni wrote:
> This new script uses the data collected by the step_pkg_size
> instrumentation hook to generate a pie chart of the size contribution
> of each package to the target root filesystem, and two CSV files with
> statistics about the package size and file size. To achieve this, it
> looks at each file in $(TARGET_DIR), and using the
> packages-file-list.txt information collected by the step_pkg_size
> hook, it determines to which package the file belongs. It is therefore
> able to give the size installed by each package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/size-stats | 225 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
>  create mode 100755 support/scripts/size-stats
> 
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> new file mode 100755
> index 0000000..7dc28a0
> --- /dev/null
> +++ b/support/scripts/size-stats
> @@ -0,0 +1,225 @@
> +#!/usr/bin/env python
[...]
> +#
> +# This function returns a dict containing as keys the files present in
> +# the filesystem skeleton, and as value, the string "skeleton". It is
> +# used to simulate a fake "skeleton" package, to assign the files from
> +# the skeleton to some package.
> +#
> +# builddir: path to the Buildroot output directory
> +#
> +def build_skeleton_dict(builddir):
> +    skeleton_files = {}
> +    for root, _, files in os.walk("system/skeleton"):
> +        for f in files:
> +            if f == ".empty":
> +                continue
> +            frelpath = os.path.relpath(os.path.join(root, f), "system/skeleton")
> +            # Get the real size of the installed file
> +            targetpath = os.path.join(builddir, "target", frelpath)
> +            if os.path.islink(targetpath):
> +                continue
> +            sz = os.stat(targetpath).st_size
> +            skeleton_files[frelpath] = { 'pkg': "skeleton", 'size': sz }
> +    return skeleton_files
Is it possible to rely on Kconfiglib in order to support customized skeleton
and overlays? Or you think skeleton and overlays (and post-build scripts) 
should be managed by package infra (like https://patchwork.ozlabs.org/patch/399413/)?

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
> +            fpath = f[1].strip().replace("./", "")
> +            fullpath = os.path.join(builddir, "target", fpath)
> +            if not os.path.exists(fullpath):
> +                continue
It means the file was remove by another package. You may emit a warning
there?

> +            pkg = f[0]
> +            sz = os.stat(fullpath).st_size
> +            pkgdict[fpath] = { 'pkg': pkg, 'size': sz }
If pkgdict[fpath] is already defined, it means:
  a. pkg == pkgdict[fpath].pkg -> Package was reinstalled
  b. pkg != pkgdict[fpath].pkg -> File was overwritten by another package

You may emit a warning is second case?


> +    pkgdict.update(build_skeleton_dict(builddir))
> +    return pkgdict
> +
[...]

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
