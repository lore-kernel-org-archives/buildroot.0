From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 08:50:46 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/download-rework
Message-ID: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a pull request for Maxime's work on cleaning up the download
code and adding support for Git and SVN download. After
review/testing, I've added my Signed-off-by to those patches.

Some notes :

 * 'make source-check' doesn't work, but it didn't work previously
   either. Doing 'make source-check' does an allyesconfig, which
   enables all packages. But some packages (e.g Barebox), need a
   configuration or their Makefile produce an error. This is not a
   regression introduced by this patchset, and it's something that
   should be fixed separatly.

 * 'make external-deps' used to show only the basename of all the
   files that are downloaded and not the full URL. This patchset keeps
   this behaviour for http/ftp downloads, but for SVN/Git downloads it
   doesn't really make sense, so it shows the full URL. In the future,
   'make external-deps' should probably show the full URL for http/ftp
   downloads as well, but that can be handled as a separate patch.

 * 'make external-deps' does not work with external toolchains, but
   it's not a regression introduced by this patchset, and can
   therefore be fixed separatly. There are already patches floating
   around to fix this.

Regards,

Thomas

The following changes since commit 33070528796dafe90ebab836356fea03f2dc24f9:
  Marcus Osdoba (1):
        usbutils: bump to 0.90

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/download-rework

Maxime Petazzoni (8):
      Remove the spider feature
      Cleanup the VCS commands configuration
      Update defconfigs with new VCS config options
      Implement basic non-wget download methods
      Use the normal download method for Tremor
      Use the normal download method for libsvgtiny
      Re-implement the source-check and external-deps targets
      Revert "Makefile.package.in: allow packages to override download step"

 Config.in                                 |   24 ++----
 Makefile                                  |   16 +---
 configs/arm_toolchain_defconfig           |    5 +-
 configs/at91rm9200df_defconfig            |    5 +-
 configs/at91rm9200df_ext_bare_defconfig   |    5 +-
 configs/at91rm9200df_ext_defconfig        |    5 +-
 configs/at91sam9260dfc_defconfig          |    5 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    5 +-
 configs/at91sam9260dfc_ext_defconfig      |    5 +-
 configs/at91sam9261ek_defconfig           |    5 +-
 configs/at91sam9261ek_ext_bare_defconfig  |    5 +-
 configs/at91sam9261ek_ext_defconfig       |    5 +-
 configs/at91sam9263ek_defconfig           |    5 +-
 configs/at91sam9263ek_ext_bare_defconfig  |    5 +-
 configs/at91sam9263ek_ext_defconfig       |    5 +-
 configs/at91sam9g20dfc_defconfig          |    5 +-
 configs/at91sam9g20dfc_ext_bare_defconfig |    5 +-
 configs/at91sam9g20dfc_ext_defconfig      |    5 +-
 configs/atngw100-base_defconfig           |    5 +-
 configs/atngw100_defconfig                |    5 +-
 configs/atstk1005_defconfig               |    5 +-
 configs/atstk100x_defconfig               |    5 +-
 configs/i386_defconfig                    |    5 +-
 configs/i686_defconfig                    |    5 +-
 configs/integrator926_defconfig           |    5 +-
 configs/integrator926_huge_defconfig      |    5 +-
 configs/kb9202_defconfig                  |    5 +-
 configs/v100sc2_defconfig                 |    5 +-
 package/Makefile.package.in               |  138 ++++++++++++++++++++++++++---
 package/libsvgtiny/libsvgtiny.mk          |   11 +--
 package/mpfr/mpfr.mk                      |    2 +-
 package/multimedia/tremor/tremor.mk       |   12 +--
 toolchain/wget-show-external-deps.sh      |    6 --
 33 files changed, 190 insertions(+), 149 deletions(-)
 delete mode 100755 toolchain/wget-show-external-deps.sh

Thanks,
-- 
Thomas Petazzoni
