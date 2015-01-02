From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat,  3 Jan 2015 00:58:46 +0100
Subject: [Buildroot] [PATCH v3 0/2] Portability fixes for "make menuconfig"
Message-ID: <1420243128-7708-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here are two portability fixes needed to be able to run "make menuconfig" on
NixOS[1].

[1]: http://nixos.org/

Bj?rn Forsman (2):
  Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time
  kconfig/lxdialog: get ncurses CFLAGS with pkg-config

 Makefile                                           |  4 +-
 support/kconfig/lxdialog/check-lxdialog.sh         |  6 ++-
 ...dialog-get-ncurses-CFLAGS-with-pkg-config.patch | 50 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 4 files changed, 59 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 support/kconfig/lxdialog/check-lxdialog.sh
 create mode 100644 support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch

Changes v2 -> v3:
  - fixup kconfig/lxdialog patch a/... b/... sub-paths (kconfig is located in
    different sub-directories in linux and buildroot) and apply the patch
    with quilt. (I apparently didn't test v2 properly; I thought the patch
    series were automatically applied by Buildroot, but it has to be applied
    manually and then committed.)
  - address comments from Yann:
    - use immediate assignment for HOST_PKG_CONFIG_PATH
    - drop unneeded export of HOST_PKG_CONFIG_PATH
    - drop unneeded sub-shell, place PKG_CONFIG_PATH in front of $(MAKE) instead
    - re-order patches
  - add quotes around expansion of $HOST_PKG_CONFIG_PATH

Changes v1 -> v2:
  - make the kconfig/lxdialog patch a separate patch file, instead of modifying
    the kconfig sources (which are synced with linux from time to time).
    Suggested by Thomas P.

-- 
2.1.3
