From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:46 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/remove-oldstyle-hooks
Message-ID: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, I would like to apologize for the huge patch bomb, but I
thought that having each change as a separate commit was better to
ease the review process than making a single, Buildroot-wide commit.

This set of commits converts all AUTOTARGETS packages to the new
conventions. In the following sections, I detail the three conventions
that I've enforced through these commits:

Hooks
-----

The old style of hooks was to write something like:

---------------8<------------------------------------------------------------------
$(OPENSSH_HOOK_POST_INSTALL):
       $(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
       touch $@
---------------8<------------------------------------------------------------------

defined after the $(eval $(call AUTOTARGETS,package,XXX)) line.

The new style of hooks allows to define several hooks for the same
hook point, and are defined this way:

---------------8<------------------------------------------------------------------
define OPENSSH_INSTALL_INITSCRIPT
        $(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
endef

OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
---------------8<------------------------------------------------------------------

defined before the $(eval $(call AUTOTARGETS,package,XXX)) line.

Therefore, this patch set convert all packages to use new style hooks,
and@the end remove the support for old style hooks in the package
infrastructure.

Step override method
--------------------

When a package wanted to override what a particular step does (like
the build step, or more commonly, the staging install or target
install steps), it used to do :

---------------8<------------------------------------------------------------------
$(TIFF_TARGET_INSTALL_TARGET):
       -cp -a $(TIFF_DIR)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so
       touch $@
---------------8<------------------------------------------------------------------

defined after the $(eval $(call AUTOTARGETS,package,XXX)) line.

The new way of doing this is to define the <pkg>_INSTALL_TARGET_CMDS
variable. It is also possible to override <pkg>_CONFIGURE_CMDS,
<pkg>_BUILD_CMDS, <pkg>_INSTALL_STAGING_CMDS,
<pkg>_UNINSTALL_STAGING_CMDS and <pkg>_UNINSTALL_TARGET_CMDS.

So the previous example becomes:

---------------8<------------------------------------------------------------------
define TIFF_INSTALL_TARGET_CMDS
       -cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
endef
---------------8<------------------------------------------------------------------

define before the $(eval $(call AUTOTARGETS,package,XXX)) line.

Therefore, this patch set converts all packages to use the new step
override method.

No strip inside packages
------------------------

The target-finalize target of the main Makefile already strips all
files that have the executable bit set, so packages do not need to
strip binaries themselves when BR2_ENABLE_DEBUG is not set.

Since many old-style post-install hooks were dedicated to stripping
binaries, we just removed them instead of converting them to new-style
hook, therefore enforcing this new package convention.

Contents
--------

The following changes since commit 33070528796dafe90ebab836356fea03f2dc24f9:
  Marcus Osdoba (1):
        usbutils: bump to 0.90

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/remove-oldstyle-hooks

Thomas Petazzoni (74):
      bind: remove old-style hook usage and step override
      libglade: convert old-style hook to new-style hook
      tn5250: remove old-style hook usage and step override
      avahi: convert old-style hook to new-style hook
      libungif: convert old-style hook to new-style hook
      libxslt: convert old-style hook to new-style hook
      libevent: convert old-style hook to new-style hook
      taglib: convert old-style hook to new-style hook
      pango: convert old-style hook to new-style hook
      samba: convert old-style hooks to new-style hooks
      php: convert old-style hooks to new-style hooks
      libidn: convert old-style hooks to new-style hooks
      jpeg: convert old-style hooks to new-style hooks
      sdl_sound: convert old-style hooks to new-style hooks
      freetype: convert old-style hooks to new-style hooks
      shared-mime-info: convert old-style hook to new-style hook
      mysql_client: convert old-style hook to new-style hook
      usbutils: convert old-style hook to new-style hook
      liboil: convert old-style hook to new-style hook
      libcurl: convert old-style hook to new-style
      libgtk2: convert old-style hook to new-style
      dropbear: convert old-style hook and commands to new-style
      lite: convert old-style hook to new-style hook
      libiconv: convert old-style hook to new-style hook
      libpng: convert old-style hook to new-style hook
      libdnet: convert old-style hook to new-style hook
      libxml2: convert old-style hook to new-style hook
      openssh: convert old-style hook to new-style hook
      e2fsprogs: convert old-style hooks to new-style hook
      xlib_libX11: convert old-style hooks to new-style hooks
      wpa_supplicant: convert old-style hooks to new-style hooks
      squid: convert old-style hook to new-style hook
      tiff: use correct construct to override target installation
      bridge: remove useless strip and use correct definition for uninstall
      at: convert old-style hook to new-style hook
      oprofile: use correct way of overriding steps
      ncftp: use correct way of overriding steps
      bmon: use correct way of overriding steps
      libnl: remove useless strip and use correct step override
      dmraid: remove useless strip and use correct step override method
      alsa-lib: use correct step override method
      kismet: use correct step override method
      gawk: convert old-style hook to new-style hook
      lighttpd: use correct step override method
      netperf: use correct step override method
      hostapd: use correct step override method
      sqlite: use correct step override method
      nano: use correct step override method
      openntpd: use correct step override method
      prboom: use correctly the autotargets infrastructrure
      mdadm: use correct step override method
      less: use correct step override method
      iptables: convert old-style hook to new-style hook
      openvpn: use correct step override method
      ntfsprogs: use correct step override method
      dbus: convert old-style hook to new-style hook
      docker: remove useless post install stripping hook
      expat: remove useless post install stripping hook
      gvfs: convert to new style hook, remove useless stripping
      haserl: convert to new style hook
      ifplugd: convert to new style hook
      kexec: convert to new style hook
      libpcap: remove useless stripping
      metacity: use new style hook
      speex: convert to new style hook
      nbd: use new style hook
      neon: remove useless stripping
      pcre: convert to new style hook
      radvd: convert to new style hook
      strace: convert to new style hook
      tcpdump: remove useless stripping
      udpcast: actually use the hooks
      which: remove useless stripping
      infrastructure: remove support for old style hooks

 package/Makefile.package.in                  |   33 ++--------
 package/at/at.mk                             |   15 +++--
 package/avahi/avahi.mk                       |   24 ++++++--
 package/bind/bind.mk                         |   23 ++++---
 package/bmon/bmon.mk                         |    9 +--
 package/bridge-utils/bridge.mk               |   17 +----
 package/dbus/dbus.mk                         |   37 +++++++----
 package/dmraid/dmraid.mk                     |   24 ++-----
 package/docker/docker.mk                     |    4 -
 package/dropbear/dropbear.mk                 |   40 ++++++------
 package/e2fsprogs/e2fsprogs.mk               |   61 +++++++++++++------
 package/expat/expat.mk                       |    4 -
 package/freetype/freetype.mk                 |   20 ++++--
 package/games/prboom/prboom.mk               |   49 ++++++----------
 package/gawk/gawk.mk                         |   17 +++---
 package/gvfs/gvfs.mk                         |   14 ++---
 package/haserl/haserl.mk                     |   11 ++--
 package/hostapd/hostapd.mk                   |   78 +++++++++++++-----------
 package/ifplugd/ifplugd.mk                   |   18 +++---
 package/iptables/iptables.mk                 |   28 ++++++---
 package/jpeg/jpeg.mk                         |   10 ++-
 package/kexec/kexec.mk                       |   14 ++---
 package/kismet/kismet.mk                     |   30 +++++++---
 package/less/less.mk                         |   17 ++---
 package/libcurl/libcurl.mk                   |   10 ++-
 package/libdnet/libdnet.mk                   |   10 ++-
 package/libevent/libevent.mk                 |   14 +++--
 package/libglade/libglade.mk                 |   10 ++-
 package/libgtk2/libgtk2.mk                   |   12 ++--
 package/libiconv/libiconv.mk                 |   20 ++++---
 package/libidn/libidn.mk                     |   20 ++++--
 package/libnl/libnl.mk                       |   13 +---
 package/liboil/liboil.mk                     |   11 ++--
 package/libpcap/libpcap.mk                   |    7 --
 package/libpng/libpng.mk                     |   11 ++--
 package/libungif/libungif.mk                 |   10 ++-
 package/libxml2/libxml2.mk                   |   12 ++--
 package/libxslt/libxslt.mk                   |   11 ++--
 package/lighttpd/lighttpd.mk                 |    9 +--
 package/lite/lite.mk                         |   16 +++--
 package/mdadm/mdadm.mk                       |    8 +-
 package/metacity/metacity.mk                 |   10 ++-
 package/multimedia/alsa-lib/alsa-lib.mk      |    9 ++-
 package/multimedia/speex/speex.mk            |   20 +++---
 package/multimedia/taglib/taglib.mk          |   10 ++-
 package/mysql_client/mysql_client.mk         |   10 ++-
 package/nano/nano.mk                         |   17 ++---
 package/nbd/nbd.mk                           |   16 +++--
 package/ncftp/ncftp.mk                       |   23 +++----
 package/neon/neon.mk                         |    7 --
 package/netperf/netperf.mk                   |   18 +++---
 package/ntfsprogs/ntfsprogs.mk               |   26 +-------
 package/openntpd/openntpd.mk                 |    9 +--
 package/openssh/openssh.mk                   |   10 ++-
 package/openvpn/openvpn.mk                   |   16 ++---
 package/oprofile/oprofile.mk                 |   21 +++----
 package/pango/pango.mk                       |   10 ++-
 package/pcre/pcre.mk                         |   18 ++++--
 package/php/php.mk                           |   17 +++--
 package/radvd/radvd.mk                       |   10 ++-
 package/samba/samba.mk                       |   29 +++++----
 package/sdl_sound/sdl_sound.mk               |   23 ++++---
 package/shared-mime-info/shared-mime-info.mk |   13 ++--
 package/sqlite/sqlite.mk                     |   11 ++--
 package/squid/squid.mk                       |   10 ++-
 package/strace/strace.mk                     |   18 ++++--
 package/tcpdump/tcpdump.mk                   |    5 --
 package/tiff/tiff.mk                         |   10 +--
 package/tn5250/tn5250.mk                     |   15 +++--
 package/udpcast/udpcast.mk                   |    4 +-
 package/usbutils/usbutils.mk                 |   30 +++++++--
 package/which/which.mk                       |    4 -
 package/wpa_supplicant/wpa_supplicant.mk     |   84 ++++++++++++++++----------
 package/x11r7/xlib_libX11/xlib_libX11.mk     |   18 ++++--
 74 files changed, 709 insertions(+), 643 deletions(-)

Thanks,
-- 
Thomas Petazzoni
