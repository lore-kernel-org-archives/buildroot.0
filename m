From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 09:34:16 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
In-Reply-To: <20140609211341.GB10459@ned>
References: <20140609211341.GB10459@ned>
Message-ID: <20140610093416.27e1bd35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 9 Jun 2014 23:13:43 +0200, Eric Le Bihan wrote:

> To properly use systemd as init system, some modifications should be performed
> on the default skeleton. This can be done via an overlay and a post-build
> script, as done in [1]. However, it would be best for Buildroot users to have
> it done automatically, as noted per ThomasP and MaximeH [2]. This brings forth
> the idea of having one target skeleton per init system.

Right. This looks a necessary cleanup to me.

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

Clearly, some sort of solution (b), i.e something based on packages.

Regarding the names, I'd use just skeleton-*, not target-skeleton-*.
And I believe I would make skeleton a virtual package provided by
skeleton-systemd and skeleton-busybox, but instead have the 'skeleton'
package be a real package that provides all the files common to both
the Busybox and Systemd cases, and then have skeleton-systemd and
skeleton-busybox depend on skeleton, and adding the additional stuff
needed by systemd or busybox.

Also, there is the case of sysvinit, which is another init system that
we support.

Regarding the dependency chain, I believe all target packages will have
to depend on 'skeleton-<init>', just like they all depend on the
'toolchain' package. Since 'skeleton-<init>' are also going to be
target packages, it will require a little trick to avoid the circular
dependency, but nothing really terrible here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
