From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Dec 2014 22:41:36 +0100
Subject: [Buildroot] [PATCHv2 0/4] Generate package size statistics
Message-ID: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Buildroot currently doesn't provide any tool to help users analyze the
size contribution of the different files and packages to the overall
size of the filesystem. For people having tight system size
requirements, providing such tools could be useful.

This set of four patches implement tools that allow to generate a pie
chart graph of the size contribution of each package, plus CSV files
giving the detailed size statistics per-package and per-file.

In sequence:

 - The first patch changes the external toolchain logic to separate
   staging installation from target installation. Currently, target
   files are installed in the staging installation step, which is
   wrong and defeats the logic used in the following patches.

 - The second patch adds a new pkg_step hook which collects information
   about which file was installed by which package. The file size is
   not collected at this point, since binary stripping takes place at
   the very end of the build. This hook is conditionally enabled
   depending on a new Config.in option, because the hook calculates
   the md5 of all installed files at the beginning and end of each
   package installation, which can be considered time consuming.

   The information about which files are installed by which packages
   is stored in $(O)/build/packages-file-list.txt.

 - The third patch adds a Python script responsible for reading the
   data in $(O)/build/packages-file-list.txt, looking at the size of
   installed files, and generating the graph and CSV files.

 - The fourth patch creates a new 'size-stats' make target to allow
   users to easily generate the graph and CSV files.

Changes since v1:

 - Improve the logic to properly take into account packages that
   overwrite files installed by other packages.

 - Make the new pkg_step hook optional.

 - Extend the facility to not only generate a graph, but also CSV
   files. As a consequence, everything was renamed from 'graph-size'
   to 'size-stats'.

Best regards,

Thomas

Thomas Petazzoni (4):
  toolchain-external: split target installation from staging
    installation
  pkg-generic: add step_pkg_size global instrumentation hook
  support/scripts: add size-stats script
  Makefile: implement a size-stats target

 Config.in                                          |   9 +
 Makefile                                           |  11 +
 package/pkg-generic.mk                             |  36 ++++
 support/scripts/size-stats                         | 225 +++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  36 +++-
 5 files changed, 310 insertions(+), 7 deletions(-)
 create mode 100755 support/scripts/size-stats

-- 
2.1.0
