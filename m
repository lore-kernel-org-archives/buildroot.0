From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Jul 2015 18:09:58 -0400
Subject: [Buildroot] [PATCH v2 0/3] util-linux: rework utilities menu for
	finer control
Message-ID: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series changes the util-linux tool setup to support more scenarios.

Previously supported by buildroot:

a. Build libraries only.
  - Occurred when "install utilities" disabled.

b. Build basic set of tools which do not have separate config-time enables.
  - Examples of the basic set of utils that were installed whether you wanted
    them or not: dmesg, blkid, fdisk, flock, hexdump, logger, swapoff, ...
  - Many of these tools overlap with BusyBox applets.
  - Occurred when "install utilities" enabled, but no others.

c. Build basic set of tools, plus additional tools accessible by buildroot kconfig.

With the patch series, we introduce the possibility of:

d. Selectively build tools, without getting the basic set of utils.
  - This lets us keep BusyBox for most things, and only add what is actually
    needed from util-linux.

e. Build everything.

To get to this point, the patches do the following:

- Introduce new "basic set" option.

- Introduce missing options for "line" and "tunelp".

- Change boolean "install utilities" to a choice of none/all/custom.

  - none:
    - In menu, hide individual options.
    - Configure with --disable-all-programs.

  - all:
    - In menu, hide individual options.
    - Configure with --enable-all-programs.

  - custom:
    - In menu, show individual options.
    - Configure with --disable-all-programs if "basic set" is not enabled.

- Hide all the util-linux options in a menuconfig, as the option list is quite long.

The series was tested as follows:

- "Install utilities" set to "none" matches (a) above.  No apps are built.

- "Install utilities" set to "custom" with only the "basic set" enabled
  matches (b).

- "Install utilities" set to "custom" with only one app enabled results in
  only that app built, and the libraries, without the "basic set" described
  in "b".

- "Install utilities" set to "all" matches the output of a custom build
  with all the individual options enabled.

Danomi Manchego (3):
  util-linux: add more tool select options
  util-linux: rework utilities menu for finer control
  util-linux: put package options in a sub-menu

 package/util-linux/Config.in     |   59 ++++++++++++++++++++++++++++++++++----
 package/util-linux/util-linux.mk |   17 ++++++-----
 2 files changed, 64 insertions(+), 12 deletions(-)

-- 
1.7.9.5
