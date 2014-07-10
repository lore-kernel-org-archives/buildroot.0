From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:40:38 +0200
Subject: [Buildroot] [git commit] busybox: support only one version
Message-ID: <20140710150058.0F5529C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b18dca0df8a3f633e156dc18c2c698814c92baf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit removes the version selection for the busybox
package. Busybox is very well maintained, and bugs are typically fixed
in a timely fashion. Moreover, regressions are fairly unlikely in this
very stable and well-tested tool.

Therefore, there isn't a very compelling reason to have a version
selection for Busybox since we don't accept such a version selection
for the vast majority of other packages, unless there is a strong
reason to do so.

Consequently, this commit:

 * Removes the 1.19.4, 1.20.2 and 1.21.1 Busybox versions, patches and
   default configuration file.

 * Moves the 1.22.1 patches from package/busybox/1.22.1 to just
   package/busybox/ like all other packages.

 * Renames the default 1.22.1 configuration file to just
   busybox.config.

 * Adapts the busybox.mk makefile to encode the current version to
   use.

 * Adds appropriate options to Config.in.legacy. However, even though
   the BR2_BUSYBOX_VERSION_1_22_X is removed, we don't add a
   Config.in.legacy option for it, since it would cause a legacy
   warning for virtually *all* users as most people are currently
   using 1.22.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   24 +
 package/busybox/1.19.4/busybox-1.19.4-udhcp.patch  |  164 ----
 .../busybox/1.20.2/busybox-1.20.2-kernel_ver.patch |   25 -
 package/busybox/1.20.2/busybox-1.20.2-ntpd.patch   |   11 -
 .../1.20.2/busybox-1.20.2-pkg-config-selinux.patch |   67 --
 .../1.20.2/busybox-1.20.2-sys-resource.patch       |  123 ---
 ...01-libbb-use-poll.h-instead-of-sys-poll.h.patch |   32 -
 ...onfig-include-linux-if_slip.h-instead-of-.patch |   33 -
 ...libiproute-use-linux-if_packet.h-instead-.patch |   36 -
 package/busybox/Config.in                          |   37 +-
 ...ibiproute-use-linux-if_packet.h-instead-.patch} |    0
 ...patch => busybox-0002-busybox-1.22.1-ash.patch} |    0
 ...atch => busybox-0003-busybox-1.22.1-date.patch} |    0
 ...ch => busybox-0004-busybox-1.22.1-iplink.patch} |    0
 ....patch => busybox-0005-busybox-1.22.1-nc.patch} |    0
 package/busybox/busybox-1.19.x.config              | 1013 -------------------
 package/busybox/busybox-1.20.x.config              | 1024 -------------------
 package/busybox/busybox-1.21.x.config              | 1030 --------------------
 .../{busybox-1.22.x.config => busybox.config}      |    0
 package/busybox/busybox.mk                         |    7 +-
 20 files changed, 26 insertions(+), 3600 deletions(-)

Patch is too large, so refusing to show it
