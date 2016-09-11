From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 14:38:52 +0200
Subject: [Buildroot] [PATCH 0/4] Fix a few unmet dependencies (branch
	yem/unmet-deps)
Message-ID: <cover.1473597259.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes a few unmet direct dependencies, like so:

    warning: (BR2_INIT_SYSTEMD) selects BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
    which has unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

However, there is one such unmet direct dependency I was not able to
understand (with this series already applied):

    $ make KCONFIG_SEED=0x9F309288 randconfig
    warning: (BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER)
    selects BR2_PACKAGE_GST_PLUGINS_BASE which has unmet direct dependencies
    (BR2_PACKAGE_GSTREAMER)
    warning: (BR2_PACKAGE_FREERDP_GSTREAMER && BR2_PACKAGE_QT_WEBKIT &&
    BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER) selects
    BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP which has unmet direct dependencies
    (BR2_PACKAGE_GSTREAMER && BR2_PACKAGE_GST_PLUGINS_BASE)

As far as I can see, the dependencies of gstreamer and gst-plugins-base
*are* properly propagated to the offending packages. I think I'm gonna
loose my sanity on that one... :-/ If any one feels adventurous...

Regards,
Yann E. MORIN.


The following changes since commit f4918b3a7424bedb0eddf56c713298a78c1160d2

  package/x11r7/xserver_xorg-server: glamor depends on libgl (2016-09-08 23:11:05 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ff633ea671d650a4be16ff4468579043a5c6e523

  system: fix unmet dependencies (2016-09-11 14:33:46 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      linux/ext: fix Xenomai unmet dependencies
      package/docker-engine: fix unmet dependencies
      package/weston: fix unmet dependencies
      system: fix unmet dependencies

 linux/Config.ext.in             | 18 ++++++++++--------
 package/docker-engine/Config.in |  1 +
 package/weston/Config.in        |  9 +++++----
 system/Config.in                |  2 +-
 4 files changed, 17 insertions(+), 13 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
