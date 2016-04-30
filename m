From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:47:47 +0200
Subject: [Buildroot] [PATCH v2 0/4] Bump to Python 3.5 and pyc compilation
	improvements
Message-ID: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series of patches bump Python3 to the 3.5 series, and brings some
pyc compilation improvements gathered from patches sent by Yegor and
Samuel.

Patch 1 makes the bump to Python 3 itself. Compared to the previous
version, feedback from Arnout has been taken into account (see the
patch itself for details about the changes). We are now getting rid of
the optimized .opt-<X>.pyc files since there is no way to use them
without the non-optimized .pyc files.

Patch 2 is a minor clean up in the python3 package, to make it look
more similar to the python package.

Patch 3 is the patch from Yegor to handle globally the compilation of
.pyc files, which makes sure we don't remove .py files that had not
been compiled. I have merged into it the improvements from Samuel that
ensures the build aborts if the .pyc compilation fails.

Patch 4 simplifies the samba4 package, which no longer needs to build
.pyc files manually, as it's now done globally.

Thanks!

Thomas

Thomas Petazzoni (3):
  python3: bump to 3.5.1
  python: align the target finalize hooks with python3
  samba4: remove compilation of .pyc files

Yegor Yefremov (1):
  python/python3: globalize *.pyc files compilation

 package/pkg-python.mk                              |  2 +-
 package/python/python.mk                           | 24 +++++--
 ...up.py-do-not-add-invalid-header-locations.patch |  6 +-
 ...the-install-location-of-_sysconfigdata.py.patch | 18 +++---
 ...-Make-the-build-of-pyc-files-conditional.patch} | 50 ++++-----------
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  6 +-
 ...ructure-to-disable-the-build-of-certain-e.patch | 18 +++---
 ...006-distutils-sysconfig-use-sysconfigdata.patch |  6 +-
 ...ibrary-header-paths-for-cross-compilation.patch | 12 ++--
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  6 +-
 .../python3/0009-Don-t-add-multiarch-paths.patch   |  6 +-
 .../0010-Abort-on-failed-module-build.patch        | 10 +--
 package/python3/0011-Serial-ioctl-workaround.patch |  2 +-
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  2 +-
 ...-config.sh.in-ensure-sed-invocations-only.patch |  6 +-
 ...-harcode-invalid-path-to-ncursesw-headers.patch |  6 +-
 ...stem-locale-and-set-to-default-when-addin.patch |  6 +-
 ...0016-Add-importlib-fix-for-PEP-3147-issue.patch | 69 ++++++++++++--------
 ...on-to-disable-installation-of-test-module.patch | 16 ++---
 .../0018-Add-an-option-to-disable-pydoc.patch      | 20 +++---
 .../0019-Add-an-option-to-disable-lib2to3.patch    | 22 +++----
 ...-Add-option-to-disable-the-sqlite3-module.patch | 14 ++--
 ...21-Add-an-option-to-disable-the-tk-module.patch | 18 +++---
 ...dd-an-option-to-disable-the-curses-module.patch | 12 ++--
 .../0023-Add-an-option-to-disable-expat.patch      | 16 ++---
 .../0024-Add-an-option-to-disable-CJK-codecs.patch |  6 +-
 .../0025-Add-an-option-to-disable-NIS.patch        |  6 +-
 ...0026-Add-an-option-to-disable-unicodedata.patch |  6 +-
 .../0027-Add-an-option-to-disable-IDLE.patch       | 18 +++---
 .../0028-Add-an-option-to-disable-decimal.patch    | 10 +--
 ...-option-to-disable-the-ossaudiodev-module.patch |  6 +-
 ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch | 62 ++++++++++++++++++
 package/python3/python3.hash                       |  6 +-
 package/python3/python3.mk                         | 74 +++++++++++++---------
 package/samba4/samba4.mk                           | 10 ---
 support/scripts/pycompile.py                       | 24 +++++++
 36 files changed, 349 insertions(+), 252 deletions(-)
 rename package/python3/{0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch => 0003-Make-the-build-of-pyc-files-conditional.patch} (47%)
 create mode 100644 package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
 create mode 100644 support/scripts/pycompile.py

-- 
2.6.4
