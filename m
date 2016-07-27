From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 27 Jul 2016 15:53:29 +0200
Subject: [Buildroot] [PATCH 0/5] Update i.MX multimedia packages
Message-ID: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series is long overdue since it is the answer for that request:
http://patchwork.ozlabs.org/patch/409684/

Basically NXP imx-codec and imx-parser are copying their libraries
to /usr/lib/imx-mm/. But Buildroot only looks for libraries under
/usr/lib at runtime which causes some GStreamer plugins to fail
at runtime.

Previous attempts to solve this issue were discarded since it was
using symlink in both staging and target areas to cover all the
cases.

The gst-fsl-plugin links against the libraries whereas gst1-imx
only does that for one plugin and uses dlopen for another.

Debugging that issue it appeared that gst1-imx wasn't looking
at the right place at build-time so linking wasn't possible.
Then it also appeared that gst1-imx would use dlopen at runtime
with the path being the one on the build machine.

Those issues have been resolved with Carlos Rafael Giani, creator
and maintainer of the gst1-imx plugin. That is why this series
includes the gst1-imx version bump necessary to have everything
working properly.

As for imx-codec/parser, their libraries are now copied to
/usr/lib using a post install target hook just like it is
done in the Yocto recipes.

Regards,
Gary 

Gary Bisson (5):
  imx-codec: add install hooks to fix libraries path
  imx-codec: add missing configure options
  imx-parser: add install hooks to fix libraries path
  imx-parser: add missing configure options
  gst1-imx: bump to version 0.12.2

 package/freescale-imx/imx-codec/imx-codec.mk   | 15 +++++++++++++++
 package/freescale-imx/imx-parser/imx-parser.mk | 13 +++++++++++++
 package/gstreamer1/gst1-imx/gst1-imx.hash      |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk        |  2 +-
 4 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.8.1
