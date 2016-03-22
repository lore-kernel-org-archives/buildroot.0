From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 22:28:58 +0100
Subject: [Buildroot] [PATCH 0/3] libdrm: ARMv4/ARMv5 compatibility fixes
Message-ID: <1458682141-23630-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

What prompted me to do this small patch series is this pending patch
from Bernd: http://patchwork.ozlabs.org/patch/559218/. It really
annoyed me to have to propagate this dependency that DRI support is
not available on ARMv4/ARMv5.

So I investigated, and found out that it was caused by one of our
patches on libdrm, which introduces ARMv6+ instructions. Since the CAS
stuff in libdrm is only an optimization, we can safely really on the
slow path for ARMv4/ARMv5. The CAS path is not an optimization for
Vivante GPUs for some reason, but since Vivante GPUs are only found in
ARMv6+ based SoCs anyway, we don't really care.

Fixing this patch allows:

 (1) To revert a former patch done on the X.org server to take into
     account this ARMv6+ dependency.

 (2) Discard Bernd's patch

 (3) Avoid future patches needed to propagate this ARMv6+ dependency.

Best regards,

Thomas

Thomas Petazzoni (3):
  libdrm: reformat patch 0001 with Git
  libdrm: adjust the ARM patch to work on ARMv4/ARMv5
  Revert "package/x11r7/xserver_xorg-server: dri needs arm >= v6"

 .../0001-Add-ARM-support-into-xf86drm.h.patch      | 56 ++++++++++++++++++++++
 package/libdrm/0001-update-arm.patch               | 37 --------------
 .../xserver_xorg-server/xserver_xorg-server.mk     |  3 +-
 3 files changed, 57 insertions(+), 39 deletions(-)
 create mode 100644 package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
 delete mode 100644 package/libdrm/0001-update-arm.patch

-- 
2.6.4
