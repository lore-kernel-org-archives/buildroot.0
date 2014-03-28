From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 01:00:20 +0100
Subject: [Buildroot] [PATCH 0/10] Misc bumps and implied changes (branch
	yem/bumps)
Message-ID: <cover.1395964430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a series with a few bumps. Apart from the now-usual RPi-related
bumps, to be noted:
  - bumping dvb-apps makes us loose our provider of transponders data,
  - which are now provided by dtv-scan-tables

So, the sequence is a bit comvoluted:

  - first add dtv-scan-tables, exclusive with dvb-apps (our currently
    packages version still installs them

  - make dvb-apps use scan-tables from dtv-scan-tables; this has the
    adverse effect that transponders data from dtv-scan-tables get
    overwritten by those from dvb-apps. But that's a temporary situation

  - switch our two transponders data users (tvheadend and /gst1-plugins-bad)
    to now depend on dtv-scan-tables

  - finally bump dvb-apps, to a version that no longer has the scan-tables

As a bonus, some coding-rules fixes in the affected packages.

Regards,
Yann E. MORIN.


The following changes since commit 9cfd429c1c3d6c7b793f58210f39bb041e680bac:

  xbmc: Add comment for host-sdl_images dependency (2014-03-27 23:48:56 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 4f298ad3beb7ace204437c079c353fa641fe14ae:

  package/tvheadend: do not line-up variables (2014-03-28 00:52:03 +0100)

----------------------------------------------------------------
Yann E. MORIN (10):
      package/rpi-firmware: bump revision
      package/rpi-userland: bump revision
      package/dtv-scan-tables: new package
      package/dvb-apps: rely on dtv-scan-tables to provide transponder data
      package/tvheadend: transponders data now provided by dtv-scan-tables
      package/gst1-plugins-bad: transponders data now provided by dtv-scan-tables
      package/dvb-apps: bump revision
      package/tvheadend: bump revision
      package/dvb-apps: do not line-up variables
      package/tvheadend: do not line-up variables

 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 +
 package/dtv-scan-tables/Config.in                  |  6 ++++
 package/dtv-scan-tables/dtv-scan-tables.mk         | 27 +++++++++++++++
 package/dvb-apps/Config.in                         | 23 ++++---------
 package/dvb-apps/dvb-apps.mk                       | 38 ++++------------------
 package/gstreamer1/gst1-plugins-bad/Config.in      |  2 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  2 +-
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 package/rpi-userland/rpi-userland.mk               |  2 +-
 package/tvheadend/Config.in                        |  2 +-
 package/tvheadend/tvheadend.mk                     | 18 +++++-----
 12 files changed, 69 insertions(+), 61 deletions(-)
 create mode 100644 package/dtv-scan-tables/Config.in
 create mode 100644 package/dtv-scan-tables/dtv-scan-tables.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
