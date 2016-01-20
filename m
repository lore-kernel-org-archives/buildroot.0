From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 20 Jan 2016 23:43:37 +0100
Subject: [Buildroot] [v3, 0/4] Supporting building a second Barebox config
Message-ID: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch-set in 4 parts adds support for building barebox with up to 2
configurations. It can be used to build the barebox x-loader or MLO (also
called Secondary Program Loader) in addition to the standard barebox build
(Tertiary Program Loader). This implements the design proposed in
http://elinux.org/Buildroot#Todo_list:
1. Have boot/barebox/ containing the common stuff.
2. Add two separate packages boot/barebox-1/ and boot/barebox-2/.
3. There is only one version selection, but each package allows to
   define the configuration to be used.
4. Design is a little bit like package/gcc, where we have multiple gcc builds,
   but share a lot of common definitions between the packages.

To demonstrate that it works as advertized, the last patch adds a defconfig for
the beaglebone black that makes use of the added functionality.

Revision history:
v3: Updated for master at 544e2c5871f223facd1ab3c2853cd07ad70dd9d1
v2: Dropped x-loader build specialization in favor of 2 generic barebox builds
v1: Initial posting

Pieter Smith (4):
  barebox: prepare for secondary config build
  barebox: adds option to build secondary config
  barebox: user selection of build output images
  beaglebone: adds barebox bootloader defconfig

 boot/barebox/Config.in                | 155 +++++++++++++++++++++++++++++-----
 boot/barebox/barebox-1/barebox-1.hash |   1 +
 boot/barebox/barebox-1/barebox-1.mk   |  90 ++++++++++++++++++++
 boot/barebox/barebox-2/barebox-2.hash |   1 +
 boot/barebox/barebox-2/barebox-2.mk   |  61 +++++++++++++
 boot/barebox/barebox.mk               |  61 +------------
 configs/beaglebone_barebox_defconfig  |  39 +++++++++
 7 files changed, 328 insertions(+), 80 deletions(-)
 create mode 120000 boot/barebox/barebox-1/barebox-1.hash
 create mode 100644 boot/barebox/barebox-1/barebox-1.mk
 create mode 120000 boot/barebox/barebox-2/barebox-2.hash
 create mode 100644 boot/barebox/barebox-2/barebox-2.mk
 create mode 100644 configs/beaglebone_barebox_defconfig

-- 
2.5.0
