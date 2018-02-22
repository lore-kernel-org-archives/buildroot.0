From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 21 Feb 2018 22:58:53 -0300
Subject: [Buildroot] [PATCH next v2 1/5] support/scripts/pkg-stats-new:
 rewrite in Python
References: <20180221221342.15683-2-thomas.petazzoni@bootlin.com>
Message-ID: <5a8e23dda8705_24263ff17ca48f783320@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry, I missed few items when reviewing v1.
I hope I find the time to review the other patches in the next days.

On Wed, Feb 21, 2018 at 07:13 PM, Thomas Petazzoni wrote:

[snip]
> +def add_patch_count(packages):
> +    """
> +    Fills in the .patch_count field of all Package objects
> +    """
> +    for pkg in packages:
> +        pkgdir = os.path.dirname(pkg.path)
> +        pkg.patch_count = len(fnmatch.filter(os.listdir(pkgdir), '*.patch'))

This method is missing patches in subdirs for binutils, gdb, ...

    for pkg in packages:
        pkg.patch_count = 0
        for subdir, _, _ in os.walk(pkgdir):
            pkg.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))

> +
> +
> +def get_check_package_warnings(pkgdir):
> +    cmd = ["./utils/check-package"]
> +    for root, dirs, files in os.walk(pkgdir):
> +        for f in files:
> +            if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
> +                cmd.append(f)

Here you need:
                cmd.append(os.path.join(root, f))
otherwise the whole column is filled with zeros.

> +    o = subprocess.check_output(cmd, stderr=subprocess.STDOUT)

When above line is fixed, this command can return non-zero code that leads to
exception CalledProcessError. There are a few ways to solve it:

1)
    o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
2)
    try:
        ...
    except ...
3) change check-package, adding an option to always return code zero.

IMO, option 1 is the better one.

> +    lines = o.splitlines()
> +    for line in lines:
> +        m = re.match("^([0-9]*) warnings generated", line)
> +        if m:
> +            return int(m.group(1))
> +    return None
> +

Regards,
Ricardo
