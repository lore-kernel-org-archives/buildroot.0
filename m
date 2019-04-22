From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Apr 2019 21:14:42 -0300
Subject: [Buildroot] [PATCH 11/12 v3] support/scripts: use show-info to
 extract dependency graph
References: <cd1c2cccd0a2d39ba4ab7277d09ae0364ffa17f8.1555357645.git.yann.morin.1998@free.fr>
Message-ID: <5cbd07729d823_6f5c2ad964f8616052718@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

One question related to an output that changes with this patch and also some
nits.

On Mon, Apr 15, 2019 at 04:47 PM, Yann E. MORIN wrote:

> Currently, we extract the dependency graph from the aptly named but
> ad-hoc show-dependency-graph rule.
> 
> We now have a better solution to report package information, with
> show-info.
> 
> Since show-dependency-graph never went into a release so far, and
> show-info does provide the same (and more), swith to using show-info.

s/swith/switch/

> 
> Thanks to Adam for suggesting the coding style to have a readable code
> that is not ugly but still pleases flake8. Thanks to Arnout for
> suggesting the use of dict.get() to further simplify the code.
> 
> Note: we do not use th reverse_dependencies field because it only

s/th/the/

> contains those packages that have a kconfig option, so we'd miss most
> host packages.

When I do this before and after this patch:
$ make qemu_arm_versatile_defconfig
$ make graph-depends
The color for "rootfs-common" and "rootfs-ext2" changes.
Can you reproduce it?
Is this intended?
If not intended, do we care enough?

[snip]
> +        versions[pkg] = \
> +            None if pkg_list[pkg]["type"] == "rootfs" \
> +            else "virtual" if pkg_list[pkg]["virtual"] \
> +            else pkg_list[pkg]["version"]

Why not the straightforward version?
        if pkg_list[pkg]["type"] == "rootfs":
            versions[pkg] = None
        elif pkg_list[pkg]["virtual"]:
            versions[pkg] = "virtual"
        else:
            versions[pkg] = pkg_list[pkg]["version"]


Regards,
Ricardo
