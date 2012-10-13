From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:13:45 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
Message-ID: <20121013231344.17317.92930.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Many buildroot users prefer to keep their project's customizations
separate from buildroot itself.  This makes it easier to go to a
new buildroot version, and to identify which parts are project-
specific.  Although it was already possible to keep the project's
customization separate, this patch set simplifies it.

 It introduces a new config option, BR2_PROJECT_DIR (patch 1).
This symbol is used to set defaults for many other config options
(patches 2-7). The buildroot config itself can also be stored in
the project directory by setting a default BR2_DEFCONFIG (patch 8).

 Patch 9 does a 'make defconfig' and 'make world' in a single run
when a project directory is available.

 Patch 10 makes it possible to update all config files (buildroot,
linux, busybox, ...) in a single shot.

 Patch 11 adds a 'make projectdir' target to initialize a project
directory.  It also creates a Makefile in the project directory:
it downloads buildroot itself, so the project directory is
self-sufficient.

 Patch 12 adds the thing that everybody has to put in their
post-build script as a configuration option: a rootfs overlay.
This patch could also be applied independent of the series
(except for the one line that sets a default based on PROJECT_DIR).

 Patch 13, finally, adds the PROJECT_DIR concept to the manual.

 What is still missing is a way to add custom packages and custom
patches in the project directory.  Either can already be done
with the BR2_PACKAGE_OVERRIDE_FILE, but I'm considering specific
additions:

- For custom packages, including $(PROJECT_DIR)/package/*/*.mk
  and automatically setting these packages to 'y'.  I don't think
  it's useful to include custom packages in the menuconfig - you
  just want them to be always enabled.

- For custom patches, add $(PROJECT_DIR)/patches/<pkg>/<pkg>-*.patch
  to the list of patches that generic-package looks for.  The custom
  patches would come in addition to and after the buildroot patches.

 Comments on these last two ideas are welcome.


 Two weeks from now (Oct. 28) I'm giving a presentation about buildroot
at T-Dose in Eindhoven.  I'll use the project directory concept in
that presentation.  So if there's any major feedback I'd like to hear
it before that time :-)

 Regards,
 Arnout

---

Arnout Vandecappelle (Essensium/Mind) (13):
      Add BR2_PROJECT_DIR config option
      Set default BR2_PACKAGE_OVERRIDE_FILE based on BR2_PROJECT_DIR
      linux: get default paths from BR2_PROJECT_DIR
      busybox: get default paths from BR2_PROJECT_DIR
      target/generic: get default paths from BR2_PROJECT_DIR
      toolchain-crosstool-ng: get default paths from BR2_PROJECT_DIR
      uClibc: get default paths from BR2_PROJECT_DIR
      Store BR2_DEFCONFIG in .config, and use it to update the original input
      Skip menuconfig if BR2_DEFCONFIG or BR2_PROJECT_DIR is given.
      Add update-all-config target
      Add target to create a project directory
      target/generic: add filesystem overlay option
      Document BR2_PROJECT_DIR in the manual


 Config.in                                        |   27 +++++++
 Makefile                                         |   86 +++++++++++++++++++--
 Makefile.project.tmpl                            |   40 ++++++++++
 docs/manual/customize-project.txt                |   37 +++++++++
 docs/manual/customize-rootfs.txt                 |   21 ++---
 docs/manual/customize.txt                        |    2 
 fs/common.mk                                     |    7 +-
 linux/Config.in                                  |    2 
 linux/linux.mk                                   |    2 
 package/busybox/Config.in                        |    1 
 package/busybox/busybox-1.20.x.config            |   26 +++---
 package/busybox/busybox.mk                       |    4 +
 target/generic/Config.in                         |   16 ++++
 toolchain/toolchain-crosstool-ng/Config.in       |    1 
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 ++
 toolchain/uClibc/Config.in                       |    1 
 toolchain/uClibc/uClibc-0.9.33.config            |   91 +++++++++-------------
 toolchain/uClibc/uclibc.mk                       |    4 +
 18 files changed, 286 insertions(+), 89 deletions(-)
 create mode 100644 Makefile.project.tmpl
 create mode 100644 docs/manual/customize-project.txt

-- 
Signature
