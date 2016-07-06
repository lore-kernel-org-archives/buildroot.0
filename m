From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:17:48 +0200
Subject: [Buildroot] Report from the Buildroot Summer Camp
Message-ID: <20160706221748.3bd00890@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

As was announced on the list, six core/regular Buildroot developers
met from July 1 to July 5 in Toulouse, France, for the "Buildroot
Summer Camp". Peter Korsgaard, Samuel Martin, Yann E. Morin, Romain
Naour, Maxime Hadjinlian and myself participated to this event. Thanks
to spending 5 days full time on Buildroot, we managed to work on a
significant number of topics.

First of all, most of our effort was concentrated on reducing the
backlog of patches in patchwork.

 - We started the meeting with about ~250 patches in patchwork.

 - We ended the meeting with only 98 patches remaining in patchwork,
   which is the lowest number that has been reached in many years. We
   hope to continue this effort in the coming weeks, and welcome your
   help to review and test the patches that remain in the backlog.

 - We merged a total of 357 patches (from
   3d7aa870a162b7b4cbb840f79a56e1f2c0e6d89c to
   563c693fdce1363ea6a66af9b8f73987de8b6ff9).

 - 1402 e-mails have been exchanged on the list during the meeting.

Noticeable things that have been merged:

 - Bump of the SELinux stack. Thanks to Adam Duskett for providing the
   patches.

 - Addition of Qemu defconfig for MIPS r6. Thanks to Vicente Olivert
   Riera for providing the patches.

 - Many new packages added: python-engineio, python-socketio,
   python-tomako, openblas, python-xlwt, python-xlutils, libuio,
   python-scapy3k, babeld, systemd-bootchart, acpitool, libaacs,
   libbdplus, libvdpau, ninja, supertuxkart, acpica, runc,
   docker-containerd, jemalloc, texinfo, rs485conf, circus, dante.

 - Better support for Fortran was added, including support for Fortran
   in the external toolchains, and the addition of a hidden boolean
   that tells packages whether Fortran is available or not. Several
   packages started using it. Thanks to Samuel Martin and Vicente
   Olivert Riera for working on this topic.

 - Addition of BR2_REPRODUCIBLE, which will be used progressively to
   make Buildroot builds byte-to-byte reproducible. Thanks to Gilles
   Chanteperdrix for starting this effort.

 - A significant amount of systemd patches have been merged, mainly
   from Gave Evans. Thanks to Maxime Hadjinlian and Yann E. Morin for
   their review and additional patches on the topic.

 - Support for fetching git submodules in packages has been added. Use
   <pkg>_GIT_SUBMODULES = YES in your package to enable the fetching
   of git submodules. Thanks to Yann E. Morin for working on this
   topic.

 - The automatic "derivation" of host package dependencies from their
   corresponding target dependencies has been removed. This was too
   "obscure" and caused a number of mistakes over time. We thought it
   was better to make the dependencies of the target and host packages
   separate and explicit. A large number of patches was needed to
   achieve this goal. Thanks to Julien Floret for his work on the
   topic.

 - The package infrastructure has been changed to not attempt to
   download when no <pkg>_VERSION variable is set (instead of defining
   it to "undefined"). This allowed to clean-up a number of packages
   for which the source code is in Buildroot, or when there is no
   source code at all (virtual packages for example).

 - Support for building the "system emulation" mode in the host-qemu
   package has been added. Thanks to Simon Maes for providing the
   initial patches.

 - The dependencies on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS have been moved
   from package/Config.in to their respective packages.

 - libgpg-error was finally bumped (to version 1.23). This was long
   overdue, but wasn't a simple bump since libgpg-error now has some
   architecture specific bits, so the architecture dependency had to
   be propagated to all reverse dependencies.

 - A number of tweaks have been made on how the options of some
   packages are displayed. However, the complete series from Yann
   E. Morin that moved more packages to use "menuconfig" has not been
   merged. Both Peter and I felt that it was not really improving the
   usability.

 - Support for the Blackfin architecture in the internal toolchain has
   been added. Thanks to Waldemar Brodkorb for working on this topic.

 - A host-texinfo package has been added, and is now used as a
   dependency of binutils and gdb when needed. This should hopefully
   fix the longstanding "makeinfo missing" build failures.

 - Packages can now register "target finalize hooks" using
   <pkg>_TARGET_FINALIZE_HOOKS rather than the global
   TARGET_FINALIZE_HOOKS variable. This makes sure the package hooks
   are only called when the package is enabled.

 - We have added a new option, BR2_ROOTFS_POST_FAKEROOT_SCRIPT, which
   allows to pass to Buildroot some scripts that will be called
   *within* the fakeroot environment. It started from a patch provided
   by Cam Hutchison that proposed to support rootfs overlays passed as
   tarball, and extracted within the fakeroot environment (so that
   permissions and owernship are preserved). We replaced Cam's
   proposal by a more general solution, similar to the post-build and
   post-image script, but that runs within the fakeroot environment,
   right before the root filesystem image is produced.

Other topics:

 - We decided to reject the "merged defconfig" proposal from Sam
   Bobroff, since we believe this should be handled outside of
   Buildroot
   (http://lists.busybox.net/pipermail/buildroot/2016-June/165384.html).

 - As mentionned above, we decided to not merge a significant part of
   Yann E. Morin's proposal to use 'menuconfig' in many more places,
   though we took some of the patches
   (http://lists.busybox.net/pipermail/buildroot/2016-July/166512.html).

 - We started discussing the series from Yann E. Morin that splits the
   skeleton to improve systemd support, and adds support for using a
   read-only rootfs with systemd. Some of the preparatory patches have
   been merged. I'll sum up the discussion as a reply to the relevant
   thread.

I think I can say that all of us really enjoyed this Summer Camp, and
we look forward to the next Buildroot meeting next to the Embedded
Linux Conference Europe.

I would like to thank all the participants who joined this Summer Camp
and participated. I would also like to thank OpenWide/Smile [1] for
sponsoring the participation of Romain Naour to the Summer Camp.

Best regards,

Thomas

[1] http://ingenierie.openwide.fr/
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
