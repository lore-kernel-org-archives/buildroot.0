From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Mon, 30 Jul 2018 17:51:50 +0200
Subject: [Buildroot] [PATCH 0/3] Buildroot: Target to update config
 fragments in kconfig based packages
Message-ID: <20180730155153.24091-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The intention of this patch series is to allow developers to change the
configuration via menuconfig or whatever editor and to apply those
changes automatically to the last fragment. This should further ease
layering of buildroot configurations.

This patch series introduces, besides some refactoring for code
sharing, a new make target for kconfig based packages:
    <pkg>-update-last-config-fragment

The new target updates the last configuration fragment that is
specified in <PKG>_KCONFIG_FRAGMENT_FILES in a defined way. Let's
assume that we have three fragment files X, Y and Z configured. So the
update process will only affect Z and be as follows:

1) Create the defconfig Dnow from the current .config file .Cnow:

    Dnow = savedefconfig .Cnow

2) Create the .config file .C out of either <PKG>_KCONFIG_DEFCONFIG
   or <PKG>_KCONFIG_FILE.

3) Merge .C with the two first fragments X and Y into .Cy and create
   the corresponding defconfig Dy:

    .Cy = merge_config.sh .C X Y
     Dy = savedefconfig .Cy

4) Collect all items that differ between the two defconfigs Dy and Dnow
   and take their values from .Cnow:

    Znow = diff_defconfig.sh Dy Dnow .Cnow

Now the following holds:

     .Cnow = merge_config.sh .C X Y Znow


Znow will only contain configuration items that are visible in
defconfigs (see step 4 and the associated script). Also, I assume that
Znow will not contain items that are not user-settable because those
are not expected to be in defconfigs.

Marcel Patzlaff (3):
  Support script for defconfig comparison
  Refactoring of pkg-kconfig.mk to increase re-usability
  New <pkg>-update-last-config-fragment target in pkg-kconfig.mk

 package/pkg-kconfig.mk  | 89 ++++++++++++++++++++++++++++----------
 utils/diff_defconfig.sh | 95 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 23 deletions(-)
 create mode 100755 utils/diff_defconfig.sh

-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
