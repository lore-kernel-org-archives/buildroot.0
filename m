From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 23:43:39 +0200
Subject: [Buildroot] [PATCH 0/4] Allow Busybox installation as individual
	binaries
Message-ID: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For SELinux, we need to be able to use the Busybox installation mode
of "one binary per applet". So, this patch series allows the Busybox
package to use this option.

However, this requires some preparation, due to two different aspects:

 1. In terms of permissions, it is no longer as easy as making
    /bin/busybox SUID root. We want only the actual applets that need
    to be SUID to be SUID, and therefore the list of files that should
    be SUID root is now generated depending on the Busybox
    configuration, thanks to the addition of the support for
    <pkg>_PERMISSIONS_FILE to the package infrastruture (implemented
    by Yann E. Morin)

 2. The /bin/sh symlink is normally created to point to /bin/busybox,
    which does not exist when using this "individual binary"
    mode. Therefore, a patch also tweaks the /bin/sh logic to not
    overwrite the /bin/sh implementation of Busybox.

I've runtime tested this on an ARM platform, and it works for me. I'm
not super interested by this feature personaly, but it's been waiting
in patchwork for ages, so it's time to do something with it. If too
much rework is requested, I'll just drop the patches and mark them as
Rejected.

Best regards,

Thomas

Clayton Shotwell (1):
  busybox: applets as individual binaries

Thomas Petazzoni (1):
  system: do not overwrite /bin/sh Busybox symlink

Yann E. MORIN (2):
  core: allow packages to declare a permission file
  docs/manual: document FOO_PERMISSIONS_FILE

 docs/manual/adding-packages-generic.txt |  8 +++++++-
 fs/common.mk                            |  3 +++
 package/busybox/Config.in               | 16 ++++++++++++++++
 package/busybox/busybox.mk              | 28 ++++++++++++++++++++++++++++
 package/pkg-generic.mk                  |  1 +
 package/skeleton/skeleton.mk            |  2 ++
 system/Config.in                        |  1 -
 7 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.7.4
