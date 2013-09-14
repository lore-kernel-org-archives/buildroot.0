From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 21:03:49 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
Message-ID: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the second version of the BR2_EXTERNAL patch series.

Changes since v1
================

 * Store BR2_EXTERNAL in the Makefile generated in the output
   directory, so that BR2_EXTERNAL doesn't have to be passed over and
   over again. Suggested by Ryan Barnett.

 * Patch set splitted in more fine-grained changes, as suggested by
   Arnout.

 * Instead of having the top-level Config.in file generated at
   run-time, use instead a trick proposed by Arnout: make BR2_EXTERNAL
   point to support/dummy-external/, which contains an empty
   Config.in. This way, regardless of whether BR2_EXTERNAL is
   specified by the user or not, kconfig is happy as 'source
   "$BR2_EXTERNAL/Config.in"' will always point to an existing
   file. If BR2_EXTERNAL is not used, it will point to the dummy file,
   if BR2_EXTERNAL is used, it will point to Config.in file in the
   provided BR2_EXTERNAL directory.

   With this, BR2_EXTERNAL always has a value, so testing whether
   BR2_EXTERNAL is empty no longer tells us if the user has provided a
   value or not. Therefore, we have another variable,
   BR2_EXTERNAL_USED, which tells if the mechanism is used by the user
   or not. This variable avoids trying to use defconfigs from the
   dummy directory, or to encode the BR2_EXTERNAL value in the
   Makefile wrapper.

 * As a consequence of the previous change, it is no longer needed to
   refactor the *config dependencies using a variable, so I've dropped
   what was previously the first patch of the series.

 * BR2_EXTERNAL is turned into an absolute path, in order to avoid any
   problem. Suggested by Arnout.

 * Fixed the usage of <some board> vs. <boardname> in the
   documentation, as noted by Arnout.

Remaning questions
==================

 * Interaction with the 'local.mk' mechanism. Should 'external.mk'
   replace the 'local.mk' mechanism? Should they co-exist?

Introduction to the patch series
================================

Following the e-mail from Ryan Barnett entitled "[RFC] New feature to
handle a custom board folder", I finally took a bit of time to
implement how I think the support for externally stored Buildroot
customization should be done.

I really think the approach of having board-related configuration
options within Buildroot is wrong: it is the Buildroot configuration
as a whole that defines what the configuration of the user system is:
a combination of a kernel, a root filesystem with various packages, a
selection of a root filesystem image format, some system configuration
tuning, a bootloader, etc.

In Ryan e-mail, I believe the most important thing is the wish to
store the board-specific details outside of the Buildroot tree. In
fact, this is already possible: nothing prevents anyone from using
$(TOPDIR)/../company/kernel.config as the kernel configuration file
for example, where $(TOPDIR)/../company/ is outside of the Buildroot
tree, and versioned in a completely different way.

However, it seems like this possibility is not 'visible' enough, and
admittedly only usable for some Buildroot configuration elements,
while an user may also be interested in storing Buildroot package
recipes and Buildroot deconfig files outside of the main Buildroot
tree.

So, this patch set adds the BR2_EXTERNAL mechanism. It is very
lightweight, and doesn't change anything to the Buildroot overall
logic. Basically, BR2_EXTERNAL is an environment variable that one can
point to a directory that will contain Buildroot customizations. It is
then usable for three things:

 * It is available as $(BR2_EXTERNAL) within all of the Buildroot
   configuration options, to define the location of the kernel
   configuration file, the root filesystem overlay, etc.

 * It allows to store additional Config.in options and makefile logic
   in $(BR2_EXTERNAL), since Buildroot automatically includes
   $(BR2_EXTERNAL)/Config.in into the top-level menu, and
   $(BR2_EXTERNAL)/external.mk in the makefile logic. The main purpose
   of this is to be able to store custom packages outside of the
   Buildroot tree.

 * It allows to store defconfigs in $(BR2_EXTERNAL)/configs/. They
   appear automatically in 'make help' and can be loaded like any
   other defconfig using 'make <something>_defconfig'.

Best regards,

Thomas

Thomas Petazzoni (4):
  core: introduce the BR2_EXTERNAL variable
  core: allow external Config.in/makefile code to be integrated
  core: allow external defconfigs to be used
  docs/manual: add explanations about BR2_EXTERNAL

 Config.in                            |   6 ++
 Makefile                             |  25 +++++++-
 docs/manual/customize-outside-br.txt | 112 +++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt            |   2 +
 support/dummy-external/Config.in     |   0
 support/scripts/mkmakefile           |   3 +-
 6 files changed, 144 insertions(+), 4 deletions(-)
 create mode 100644 docs/manual/customize-outside-br.txt
 create mode 100644 support/dummy-external/Config.in

-- 
1.8.1.2
