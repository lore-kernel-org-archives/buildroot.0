From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 16:46:59 +0200
Subject: [Buildroot] [PATCH 0/5] Various init scripts modification
Message-ID: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All !

This is a short series which does the following: (the indexes match the
patches)

   1 Extract the init.d folder into its own package
   1 Make Busybox and SysV depends on it
   2 Change busybox a little bit to not install scripts if it's not the
   init
   3 Add a generic way to install startup scripts for the relevant init
   systems. This is mainly done to avoid duplicated code everywhere.
   For this to work, you need to have a variable and tell where are the
   init scripts files. This is done that way for two main reasons:
      - Many packages have/will have their init scripts packaged in
      	their sources. We don't want to keep them in the packages, so
      	you are able to specify something along the line "$(@D)/src/S99foo"
      - If you want to install init scripts conditionnaly (if there's a
      	daemon), you are able to do it.
   If a package requires customs actions, you can use the current
   LIBFOO_INSTALL_INIT_* or even mix the two together (which would be
   usefull for avahi for example)
   4-5 Two patches only to show, what the modification leads to. Theses
   two patches should not be applied as is, see question below.

Also, should the modification of each packages be done in one huge patch
or in multilple patches ?
Since it's a custom modification and not mechanical for each packages, I
would go for a patch per package.

Looking forward for comments.

Maxime Hadjinlian (5):
  initscripts: new package
  busybox: Install scripts only when needed
  infra: Add automatic install of init scripts
  acpid: Use new FOO_INIT_SYSV_FILES variable
  am33x-cm3: Use new FOO_INIT_SYSV_FILES variable

 docs/manual/adding-packages-generic.txt            | 17 +++++++++++++
 package/acpid/acpid.mk                             |  6 +----
 package/am33x-cm3/am33x-cm3.mk                     |  6 +----
 package/busybox/busybox.mk                         | 11 +++++++++
 .../inittab => package/initscripts/busybox_inittab |  0
 .../etc => package/initscripts}/init.d/S20urandom  |  0
 .../etc => package/initscripts}/init.d/S40network  |  0
 .../etc => package/initscripts}/init.d/rcK         |  0
 .../etc => package/initscripts}/init.d/rcS         |  0
 package/initscripts/initscripts.mk                 | 28 ++++++++++++++++++++++
 .../inittab => initscripts/sysvinit_inittab}       |  0
 package/pkg-generic.mk                             | 26 ++++++++++++++++----
 package/sysvinit/sysvinit.mk                       | 11 +++++----
 13 files changed, 86 insertions(+), 19 deletions(-)
 rename system/skeleton/etc/inittab => package/initscripts/busybox_inittab (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/S20urandom (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/S40network (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/rcK (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/rcS (100%)
 create mode 100644 package/initscripts/initscripts.mk
 rename package/{sysvinit/inittab => initscripts/sysvinit_inittab} (100%)

--
2.1.1
