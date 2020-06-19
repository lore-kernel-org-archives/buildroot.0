From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 19 Jun 2020 14:54:58 +0200
Subject: [Buildroot] [PATCH 0/2] weston: fix i.MX support
Message-ID: <20200619125500.524503-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series aims at fixing the weston support for i.MX processors.

Long time ago, weston-imx was added for i.MX8MQ as part of the weston
package. Then it was split from it as the versions differed.

Since then the weston-imx was broken and updating it seems like a bad
idea as it now requires forking several other components:
- libdrm [1]
- waylands-protocols [2]

This series therefore removes weston-imx and adds vivante support to
the regular weston package.

Drawback here is that the HDR capabilities of the i.MX8MQ or the GPU2D
of the i.MX8M Mini won't be used in Weston. I'd rather have those
limitations and use standard weston than forking everything.

Also, note that this series was tested on Nitrogen8M and Nitrogen8M Mini
platforms, making sure the Vivante 3D examples are properly running.
However in order to compile weston properly with Vivante as egl
provider, one patch sent earlier [3] is needed.

Let me know if you have any questions.

Regards,
Gary

[1] https://source.codeaurora.org/external/imx/meta-imx/tree/meta-bsp/recipes-graphics/drm/libdrm_2.4.99.imx.bb?h=zeus-5.4.3-1.0.0
[2] https://source.codeaurora.org/external/imx/meta-imx/tree/meta-bsp/recipes-graphics/wayland/wayland-protocols_1.18.imx.bb?h=zeus-5.4.3-1.0.0
[3] http://patchwork.ozlabs.org/project/buildroot/patch/20200402130842.918696-3-gary.bisson at boundarydevices.com/

Gary Bisson (2):
  package/weston: add imx-gpu-viv as possible egl provider
  package/weston-imx: remove deprecated package

 Config.in.legacy                   |   6 ++
 package/Config.in                  |   1 -
 package/weston-imx/Config.in       | 114 -----------------------
 package/weston-imx/weston-imx.hash |   3 -
 package/weston-imx/weston-imx.mk   | 144 -----------------------------
 package/weston/Config.in           |   8 +-
 6 files changed, 10 insertions(+), 266 deletions(-)
 delete mode 100644 package/weston-imx/Config.in
 delete mode 100644 package/weston-imx/weston-imx.hash
 delete mode 100644 package/weston-imx/weston-imx.mk

-- 
2.26.2
