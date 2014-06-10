From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 10 Jun 2014 10:01:23 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
In-Reply-To: <20140609211341.GB10459@ned>
References: <20140609211341.GB10459@ned>
Message-ID: <20140610080123.GF9791@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jun 09, 2014 at 11:13:43PM +0200, Eric Le Bihan wrote:
> Hi!
> 
> To properly use systemd as init system, some modifications should be performed
> on the default skeleton. This can be done via an overlay and a post-build
> script, as done in [1]. However, it would be best for Buildroot users to have
> it done automatically, as noted per ThomasP and MaximeH [2]. This brings forth
> the idea of having one target skeleton per init system.
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

And you also have:

  c) Move the files in the skeleton at the package level. Each package
     would be providing whatever file it needs and is not shared by
     all the init systems.

> Solution A is the quickest and less intrusive to implement, but it can only
> copy the files of the skeleton, not perform the additional operations from the
> post-build script. So solution B seems the best.

And solution C would be taking the advantages of both. It's not very
intrusive, since everything is already in place, and you can do pretty
much anything you want.

> But if a new package target-skeleton is added, what would be the dependency
> chain? Would `make target-skeleton-rebuild` rebuild... the whole rootfs?

And you don't have to worry about the dependencies either.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/15468d61/attachment.asc>
