From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 20:56:01 +0100
Subject: [Buildroot] [git commit] manual/faq: add section about why no
	binary packages
Message-ID: <20140220211951.73A9B9CAE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffeda5e429225712b66e1c28e4d77dd50844568c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It comes up every now and then on the list, so better be prepared to
point at the manual, rather than rehash the same every time.

Most of the chapter is a copy-paste of the report from the Buildroot
Developpers Day in Pragues, 2011-10-28:
    http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html

We consider the opinions expressed in that report to be still valid
now, two years later.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/faq-troubleshooting.txt |  100 +++++++++++++++++++++++++++++++++++
 1 files changed, 100 insertions(+), 0 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 4e0612b..4026e18 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -111,3 +111,103 @@ directory as the new root, will most likely fail.
 If you want to run the target filesystem inside a chroot, or as an NFS
 root, then use the tarball image generated in +images/+ and extract it
 as root.
+
+[[faq-no-binary-packages]]
+Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
+----------------------------------------------------------------
+
+One feature that is often discussed on the Buildroot list is the
+the general topic of "package management". To summarize, the idea
+would be to add some tracking of which Buildroot package installs
+what files, with the goals of:
+
+ * being able to remove files installed by a package when this package
+   gets unselected from the menuconfig;
+
+ * being able to generate binary packages (ipk or other format) that
+   can be installed on the target without re-generating a new root
+   filesystem image.
+
+In general, most people think it is easy to do: just track which package
+installed what and remove it when the package is unselected. However, it
+is much more complicated than that:
+
+ * It is not only about the +target/+ directory, but also the sysroot in
+   +host/usr/<tuple>/sysroot+ and the +host/+ directory itself. All files
+   installed in those directories by various packages must be tracked.
+
+ * When a package is unselected from the configuration, it is not
+   sufficient to remove just the files it installed. One must also
+   remove all its reverse dependencies (i.e packages relying on it)
+   and rebuild all those packages. For example, package A depends
+   optionally on the OpenSSL library. Both are selected, and Buildroot
+   is built. Package A is built with crypto support using OpenSSL.
+   Later on, OpenSSL gets unselected from the configuration, but
+   package A remains (since OpenSSL is an optional dependency, this
+   is possible.) If only OpenSSL files are removed, then the files
+   installed by package A are broken: they use a library that is no
+   longer present on the target. Although this is technically doable,
+   it adds a lot of complexity to Buildroot, which goes against the
+   simplicity we try to stick to.
+
+ * In addition to the previous problem, there is the case where the
+   optional dependency is not even known to Buildroot. For example,
+   package A in version 1.0 never used OpenSSL, but in version 2.0 it
+   automatically uses OpenSSL if available. If the Buildroot .mk file
+   hasn't been updated to take this into account, then package A will
+   not be part of the reverse dependencies of OpenSSL and will not be
+   removed and rebuilt when OpenSSL is removed. For sure, the .mk file
+   of package A should be fixed to mention this optional dependency,
+   but in the mean time, you can have non-reproducible behaviors.
+
+ * The request is to also allow changes in the menuconfig to be
+   applied on the output directory without having to rebuild
+   everything from scratch. However, this is very difficult to achieve
+   in a reliable way: what happens when the suboptions of a package
+   are changed (we would have to detect this, and rebuild the package
+   from scratch and potentially all its reverse dependencies), what
+   happens if toolchain options are changed, etc. At the moment, what
+   Buildroot does is clear and simple so its behaviour is very
+   reliable and it is easy to support users. If configuration changes
+   done in menuconfig are applied after the next make, then it has to
+   work correctly and properly in all situations, and not have some
+   bizarre corner cases. The risk is to get bug reports like "I have
+   enabled package A, B and C, then ran make, then disabled package
+   C and enabled package D and ran make, then re-enabled package C
+   and enabled package E and then there is a build failure". Or worse
+   "I did some configuration, then built, then did some changes,
+   built, some more changes, built, some more changes, built, and now
+   it fails, but I don't remember all the changes I did and in which
+   order". This will be impossible to support.
+
+For all these reasons, the conclusion is that adding tracking of
+installed files to remove them when the package is unselected, or to
+generate a repository of binary packages, is something that is very
+hard to achieve reliably and will add a lot of complexity.
+
+On this matter, the Buildroot developers make this position statement:
+
+ * Buildroot strives to make it easy to generate a root filesystem (hence
+   the name, by the way.) That is what we want to make Buildroot good at:
+   building root filesystems.
+
+ * Buildroot is not meant to be a distribution (or rather, a distribution
+   generator.) It is the opinion of most Buildroot developers that this
+   is not a goal we should pursue. We believe that there are other tools
+   better suited to generate a distro than Buildroot is. For example,
+   http://openembedded.org/[Open Embedded], or https://openwrt.org/[openWRT],
+   are such tools.
+
+ * We prefer to push Buildroot in a direction that makes it easy (or even
+   easier) to generate complete root filesystems. This is what makes
+   Buildroot stands out in the crowd (among other things, of course!)
+
+ * We believe that for most embedded Linux systems, binary packages are
+   not necessary, and potentially harmful. When binary packages are
+   used, it means that the system can be partially upgraded, which
+   creates an enormous number of possible combinations of package
+   versions that should be tested before doing the upgrade on the
+   embedded device. On the other hand, by doing complete system
+   upgrades by upgrading the entire root filesystem image at once,
+   the image deployed to the embedded system is guaranteed to really
+   be the one that has been tested and validated.
