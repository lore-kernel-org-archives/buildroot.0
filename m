From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:20:59 +0200
Subject: [Buildroot] [pull request] Pull request for branch gettext-rework
Message-ID: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that builds on top of the work from Maxime
Ripard and Samuel Martin to clean up how gettext is handled, and in
the end migrate the gettext package to the autotools-package
infrastructure.

Compared to Samuel last posting, I've splitted the work into more
patches to ease the review process:

 * The first patch removes the possibility of building gettext
   statically.

 * The second patch removes the gettext-target make target, which was
   never used anywhere.

 * The third patch removes the separation between gettext and libintl
   targets. Now, there is only a 'gettext' target, which installs just
   the necessary libraries in the target (identical to what libintl
   was doing previously). This patch breaks the build for many
   packages, but was kept separate to make the review easier.

 * The fourth patch adjusts all the packages that add a dependency on
   libintl, and use instead a dependency on gettext.

 * The final fifth patch converts the gettext package to the
   autotools-package infrastructure.

I hope that this rework of Maxime's and Samuel's work will help in
getting this nice cleanup merged.

Please review and, if possible, ack this patch series.

Thanks!

Thomas

The following changes since commit 498ea22be27863c8eff99033384f9d268167a2b3:

  sam-ba: only propose it if the host is x86 or x86_64 (2012-07-18 19:33:46 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git gettext-rework

for you to fetch changes up to 66a7689f733357af7bb277467bc2198817fc9b69:

  gettext: convert to autotools-package (2012-07-19 23:18:03 +0200)

----------------------------------------------------------------
Maxime Ripard (1):
      gettext: convert to autotools-package

Thomas Petazzoni (4):
      gettext: remove option to build statically
      gettext: remove the gettext-target make target, unused
      gettext: remove libintl handling
      Remove all references to libintl

 package/avahi/Config.in                     |    1 -
 package/avahi/avahi.mk                      |    6 +-
 package/axel/Config.in                      |    1 -
 package/axel/axel.mk                        |    2 +-
 package/binutils/Config.in                  |    1 -
 package/binutils/binutils.mk                |    2 +-
 package/diffutils/diffutils.mk              |    3 +-
 package/dnsmasq/Config.in                   |    1 -
 package/dnsmasq/dnsmasq.mk                  |    2 +-
 package/flex/flex.mk                        |    3 +-
 package/gdk-pixbuf/Config.in                |    1 -
 package/gdk-pixbuf/gdk-pixbuf.mk            |    2 +-
 package/gettext/Config.in                   |   32 ++---
 package/gettext/gettext.mk                  |  181 ++++-----------------------
 package/glib-networking/Config.in           |    1 -
 package/glib-networking/glib-networking.mk  |    2 +-
 package/gmpc/Config.in                      |    1 -
 package/gmpc/gmpc.mk                        |    2 +-
 package/grep/Config.in                      |    1 -
 package/grep/grep.mk                        |    2 +-
 package/kbd/Config.in                       |    1 -
 package/kbd/kbd.mk                          |    2 +-
 package/libglib2/Config.in                  |    1 -
 package/libglib2/libglib2.mk                |    2 +-
 package/libsoup/Config.in                   |    1 -
 package/libsoup/libsoup.mk                  |    2 +-
 package/lshw/lshw.mk                        |    2 +-
 package/make/Config.in                      |    1 -
 package/make/make.mk                        |    2 +-
 package/midori/Config.in                    |    1 -
 package/midori/midori.mk                    |    2 +-
 package/multimedia/pulseaudio/Config.in     |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 package/ndisc6/ndisc6.mk                    |    4 +-
 package/pango/Config.in                     |    1 -
 package/pango/pango.mk                      |    2 +-
 package/psmisc/Config.in                    |    1 -
 package/psmisc/psmisc.mk                    |    2 +-
 package/quota/Config.in                     |    1 -
 package/quota/quota.mk                      |    2 +-
 package/sshfs/Config.in                     |    1 -
 package/sshfs/sshfs.mk                      |    2 +-
 package/sysstat/Config.in                   |    1 -
 package/sysstat/sysstat.mk                  |    2 +-
 package/ushare/Config.in                    |    1 -
 package/ushare/ushare.mk                    |    2 +-
 package/util-linux/util-linux.mk            |    4 +-
 package/vala/Config.in                      |    1 -
 package/vala/vala.mk                        |    2 +-
 49 files changed, 63 insertions(+), 234 deletions(-)

Thanks,
-- 
Thomas Petazzoni
