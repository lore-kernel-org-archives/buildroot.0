From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 28 Mar 2019 01:08:29 +0200
Subject: [Buildroot] [PATCH v4 0/2] add gettext-tiny package
Message-ID: <20190327230831.31468-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add lightweight alternative for the GNU gettext package - gettext-tiny.
The sources are used from sabotage-linux project. Some files are used
from the original gettext gnu like po/*, gettextize and some m4 files.

The original gettext package is renamed to gettext-gnu because now gettext is
a virtual package and gettext-gnu and gettext-tiny became as gettext providers.

There is only the case when BR2_PACKAGE_GETTEXT is selected directly - by
ecryptfs-utils, for this case the gettext-tiny install gettext-wrapper for the
target, the wrapper just echoes the messages w/o any translation.

v4:
    1) Refactored by Thomas Pettazoni, with extracting required gettext-gnu files from
       from downloaded archive rather than from direct URL link per each file.

    2) Allow gettext-tiny to be installed for the target which only installs
       gettext tool echo-wrapper provided by Yann E. Morin.

    3) Fixed author and SoB emails in *-format-not-a-string-literal-error-for-gc.patch

v3:
    1) Rebased on master.

    2) Drop wine related patch which is already applied.


v2:
    1) Add patch to disable gettext option for "wine" if NLS is disabled.

    2) Fix build issue with libuio by adding config.rpath by separate package
       patch:

           0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch

    3) Use gettext-tiny only as for HOST alternative and if NLS is disabled.
       There is no option to manually select gettext-gnu or gettext-tiny which
       is controlled by gettext virtual package.

    4) Drop "files" folder with copied files from original gettext gnu, but
       download them from:

           https://git.savannah.gnu.org/cgit/gettext.git

       Thanks to Yann E. Morin for help with this.

    5) gettextize is preprocessed from the original gettextize.in

    6) Use only host-generic-package for gettext-tiny, hence remove "target"
       related stuff.

Vadim Kochan (2):
  package/gettext: turn into virtual package
  package/gettext-tiny: new package

 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   2 +
 .../0001-error_print_progname.patch                |   0
 .../0002-Update-after-gnulib-changed.patch         |   0
 package/gettext-gnu/Config.in                      |  24 +++++
 .../gettext.hash => gettext-gnu/gettext-gnu.hash}  |   0
 package/gettext-gnu/gettext-gnu.mk                 | 103 +++++++++++++++++++
 ...-format-not-a-string-literal-error-for-gc.patch |  55 ++++++++++
 package/gettext-tiny/Config.in                     |  18 ++++
 package/gettext-tiny/gettext-tiny.hash             |   5 +
 package/gettext-tiny/gettext-tiny.mk               | 114 +++++++++++++++++++++
 package/gettext-tiny/gettext-wrapper               |  24 +++++
 package/gettext/Config.in                          |  25 ++---
 package/gettext/gettext.mk                         |  96 +----------------
 14 files changed, 357 insertions(+), 110 deletions(-)
 rename package/{gettext => gettext-gnu}/0001-error_print_progname.patch (100%)
 rename package/{gettext => gettext-gnu}/0002-Update-after-gnulib-changed.patch (100%)
 create mode 100644 package/gettext-gnu/Config.in
 rename package/{gettext/gettext.hash => gettext-gnu/gettext-gnu.hash} (100%)
 create mode 100644 package/gettext-gnu/gettext-gnu.mk
 create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
 create mode 100644 package/gettext-tiny/Config.in
 create mode 100644 package/gettext-tiny/gettext-tiny.hash
 create mode 100644 package/gettext-tiny/gettext-tiny.mk
 create mode 100644 package/gettext-tiny/gettext-wrapper

-- 
2.14.1
