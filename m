From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Sep 2013 15:15:26 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
	customization
Message-ID: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

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

 * It allows to store package recipes in $(BR2_EXTERNAL)/package/,
   exactly like the package/ directory of Buildroot. Buildroot will
   automatically include $(BR2_EXTERNAL)/Config.in under the top-level
   menu 'Target packages' menu, and will include
   $(BR2_EXTERNAL)/external.mk at the makefile level. So by adding a
   simple $(BR2_EXTERNAL)/Config.in and $(BR2_EXTERNAL)/external.mk,
   one can store package recipes outside Buildroot. See the manual
   update (PATCH 3) for details.

 * It allows to store defconfigs in $(BR2_EXTERNAL)/configs/. They
   appear automatically in 'make help' and can be loaded like any
   other defconfig using 'make <something>_defconfig'.

Best regards,

Thomas

Thomas Petazzoni (3):
  Makefile: factorize *config dependencies
  Add support for BR2_EXTERNAL
  docs/manual: add explanations about BR2_EXTERNAL

 Config.in                            |   6 +-
 Makefile                             |  64 +++++++++++++-------
 docs/manual/customize-outside-br.txt | 110 +++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt            |   2 +
 docs/manual/manual.mk                |   2 +-
 5 files changed, 161 insertions(+), 23 deletions(-)
 create mode 100644 docs/manual/customize-outside-br.txt

-- 
1.8.1.2
