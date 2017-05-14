From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 14:34:54 +0200
Subject: [Buildroot] Analysis of defconfig failures
Message-ID: <20170514143454.44443932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Our last build of the defconfigs has almost been entirely successful,
there are only a few remaining issues to fix:

 * beaglebone_qt5_defconfig

   It fails to build because we use an older kernel than
   beaglebone_defconfig, and this older kernel doesn't build the Device
   Tree for the BeagleBone Green. In a previous commit, I removed
   building the BeagleBone Green DT from beaglebone_qt5_defconfig, but
   it continues to fail building because the genimage.cfg file
   references am335x-bonegreen.dtb, and this genimage.cfg is shared by
   both beaglebone_defconfig and beaglebone_qt5_defconfig.

   See https://gitlab.com/buildroot.org/buildroot/builds/16253472.

   Since Lothar (who contributed beaglebone_qt5_defconfig) hasn't
   provided any fix since quite a long time for this problem, my
   proposal would be to get rid of beaglebone_qt5_defconfig. I'll send
   a patch doing this.

 * csky_gx6605s_defconfig

   It fails to build because the pre-built external toolchain needs
   libelf installed on the host machine.

   Arnout, do you think it's reasonable to add libelf in the list of
   packages to install in the .gitlab-ci.yml file, just for the sake of
   the csky external toolchain ?

 * snps_archs38_zebu_defconfig

   Failed to build because the defconfig has been renamed, and I had
   forgotten to regenerate .gitlab-ci.yml. This is already fixed.

Bottom line: we have only two defconfigs that still have build issues,
so we're not far from a 100% build success here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
