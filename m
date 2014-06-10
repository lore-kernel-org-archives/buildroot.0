From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 10 Jun 2014 09:21:39 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
In-Reply-To: <20140609211341.GB10459@ned>
References: <20140609211341.GB10459@ned>
Message-ID: <CAGduivxeet2u3KqTZfNYPy7bi6ddtmYYLovc5b_cNLvFuNz0pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric, all

On Mon, Jun 9, 2014 at 11:13 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> Hi!
>
> To properly use systemd as init system, some modifications should be performed
> on the default skeleton. This can be done via an overlay and a post-build
> script, as done in [1]. However, it would be best for Buildroot users to have
> it done automatically, as noted per ThomasP and MaximeH [2]. This brings forth
> the idea of having one target skeleton per init system.
Exactly, and I have started a few patches to do so. I shall send them
pretty soon and break my series in too so that this part is at least
done.
>
> IHMO, there are two solutions for implementing it:
>
> a) Move system/skeleton to system/skeleton/busybox, then add
>    system/skeleton/systemd, and maybe system/skeleton/sysv. The menu in
>    system/Config.in will be updated to select BR2_ROOTFS_SKELETON_BUSYBOX,
>    or BR2_ROOTFS_SKELETON_CUSTOM.
> b) Add a new virtual package: target-skeleton, with some providers:
>    target-skeleton-busybox, target-skeleton-systemd and
>    target-skeleton-custom (path to the custom skeleton would be handled in the
>    configuration menu).
>
> Solution A is the quickest and less intrusive to implement, but it can only
> copy the files of the skeleton, not perform the additional operations from the
> post-build script. So solution B seems the best.
>
> But if a new package target-skeleton is added, what would be the dependency
> chain? Would `make target-skeleton-rebuild` rebuild... the whole rootfs?
>
Actually the package that I have introduced after discussing it with
Thomas Petazzoni was a package called initscripts and busybox/systemv
only depends on it. This way, when you chose an init system, it will
copy the files to the target directory.

This seems to be less intrusive as the end users would not even notice
(except the disappearance of the init.d folder when systemd is
chosen).

If you have any comments regarding this idea, they are welcomed.
I'll try and send this patch tonight so we can discuss on the idea
with some code.
> Comments and ideas welcomed!
>
> Best regards,
> ELB
>
> [1] https://github.com/elebihan/buildroot-ext-elb/tree/master/overlays/base-systemd
> [2] http://lists.busybox.net/pipermail/buildroot/2014-June/098738.html
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
