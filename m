From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Mar 2017 00:00:25 +0100
Subject: [Buildroot] [PATCH 0/6] python(3): fix optional modules
Message-ID: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches aim at fixing the problem pointed out by Danomi
Manchego in:

 https://patchwork.ozlabs.org/patch/691109/
 https://patchwork.ozlabs.org/patch/691108/

Essentially, what Danomi discovered is that if you have a
configuration like this:

  BR2_PACKAGE_READLINE=y
  BR2_PACKAGE_PYTHON=y
  # BR2_PACKAGE_PYTHON_READLINE is not set

Then you still get the readline Python extension built. This is
because all what BR2_PACKAGE_PYTHON_READLINE does is bring the
"readline" package as a dependency, but never disables the readline
extension.

This commit fixes that by adding more --{enable,disable} options in
python and python3.

The other patches are related preparation commits or related fixes.

Thanks!

Thomas

Thomas Petazzoni (6):
  python: move to Git formatted patches
  python: make hashlib and readline modules really optional
  python: fix disabling the SSL module
  python3: refresh Git formatted patches
  python3: explicitly disable OpenSSL support for the target
  python3: make readline, gzip, bzip2 and xz really optional

 ...p.py-do-not-add-invalid-header-locations.patch} |  18 ++-
 ...Fix-get_python_inc-for-cross-compilation.patch} |  18 ++-
 ...he-install-location-of-_sysconfigdata.py.patch} |  38 ++++---
 ...compilation-of-.pyc-and-.pyo-conditional.patch} |  29 ++++-
 ...st-getaddrinfo-test-for-cross-compilation.patch |  29 +++++
 ...infrastructure-to-be-able-to-disable-ext.patch} |  41 +++++--
 ...brary-header-paths-for-cross-compilation.patch} |  50 +++++----
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} |  18 ++-
 ... 0009-Fix-python-config-for-cross-builds.patch} | 121 ++++++++++++---------
 ...-Remove-the-python-symlink-install-rules.patch} |  25 +++--
 ....patch => 0011-Don-t-add-multiarch-paths.patch} |  17 ++-
 ...tch => 0012-Abort-on-failed-module-build.patch} |  17 ++-
 ...build-when-threads-are-not-used-availabl.patch} |  17 ++-
 ...nd.patch => 0014-Serial-ioctl-workaround.patch} |  15 ++-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} |  18 ++-
 ...n-to-disable-installation-of-test-module.patch} |  27 +++--
 ...h => 0017-Add-an-option-to-disable-pydoc.patch} |  37 ++++---
 ...=> 0018-Add-an-option-to-disable-lib2to3.patch} |  39 ++++---
 ...Add-option-to-disable-the-sqlite3-module.patch} |  65 ++++++-----
 ...0-Add-an-option-to-disable-the-tk-module.patch} |  31 +++---
 ...d-an-option-to-disable-the-curses-module.patch} |  27 +++--
 ...h => 0022-Add-an-option-to-disable-expat.patch} |  35 +++---
 ...0023-Add-an-option-to-disable-CJK-codecs.patch} |  17 ++-
 ...tch => 0024-Add-an-option-to-disable-NIS.patch} |  17 ++-
 ...025-Add-an-option-to-disable-unicodedata.patch} |  17 ++-
 ...h => 0026-Add-an-option-to-disable-bsddb.patch} |  31 +++---
 ...-Add-an-option-to-disable-the-ssl-module.patch} |  19 ++--
 ...-Add-an-option-to-disable-the-bz2-module.patch} |  16 ++-
 ...Add-an-option-to-disable-the-zlib-module.patch} |  16 ++-
 ...h => 0030-Do-not-install-the-idle-editor.patch} |  26 +++--
 ...option-to-disable-the-ossaudiodev-module.patch} |  15 ++-
 ...-Add-option-to-disable-the-hashlib-module.patch |  30 +++++
 ...-Add-an-option-to-disable-readline-module.patch |  30 +++++
 package/python/006-cross-compile-getaddrinfo.patch |  13 ---
 package/python/018-fix-add-gcc-paths-logic.patch   |  27 -----
 package/python/python.mk                           |   4 +
 ...up.py-do-not-add-invalid-header-locations.patch |   8 +-
 ...the-install-location-of-_sysconfigdata.py.patch |  22 ++--
 ...3-Make-the-build-of-pyc-files-conditional.patch |  14 +--
 ...gy_getaddrinfo-configure-test-when-cross-.patch |   8 +-
 ...ructure-to-disable-the-build-of-certain-e.patch |  16 +--
 ...006-distutils-sysconfig-use-sysconfigdata.patch |   4 +-
 ...ibrary-header-paths-for-cross-compilation.patch |   6 +-
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |   8 +-
 .../python3/0009-Don-t-add-multiarch-paths.patch   |   8 +-
 .../0010-Abort-on-failed-module-build.patch        |   8 +-
 package/python3/0011-Serial-ioctl-workaround.patch |   4 +-
 ...st-the-shebang-of-Python-scripts-for-cros.patch |   4 +-
 ...-config.sh.in-ensure-sed-invocations-only.patch |   4 +-
 ...-harcode-invalid-path-to-ncursesw-headers.patch |   8 +-
 ...stem-locale-and-set-to-default-when-addin.patch |   8 +-
 ...0016-Add-importlib-fix-for-PEP-3147-issue.patch |  12 +-
 ...on-to-disable-installation-of-test-module.patch |  14 +--
 .../0018-Add-an-option-to-disable-pydoc.patch      |  22 ++--
 .../0019-Add-an-option-to-disable-lib2to3.patch    |  24 ++--
 ...-Add-option-to-disable-the-sqlite3-module.patch |  16 +--
 ...21-Add-an-option-to-disable-the-tk-module.patch |  16 +--
 ...dd-an-option-to-disable-the-curses-module.patch |  14 +--
 .../0023-Add-an-option-to-disable-expat.patch      |  18 +--
 .../0024-Add-an-option-to-disable-CJK-codecs.patch |   8 +-
 .../0025-Add-an-option-to-disable-NIS.patch        |   8 +-
 ...0026-Add-an-option-to-disable-unicodedata.patch |   8 +-
 .../0027-Add-an-option-to-disable-IDLE.patch       |  20 ++--
 .../0028-Add-an-option-to-disable-decimal.patch    |  12 +-
 ...-option-to-disable-the-ossaudiodev-module.patch |   8 +-
 ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch |  20 ++--
 ...Add-an-option-to-disable-openssl-support.patch} |   9 +-
 ...-an-option-to-disable-the-readline-module.patch |  30 +++++
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  42 +++++++
 package/python3/python3.mk                         |  10 ++
 70 files changed, 917 insertions(+), 534 deletions(-)
 rename package/python/{001-remove-host-header-path.patch => 0001-setup.py-do-not-add-invalid-header-locations.patch} (78%)
 rename package/python/{002-fix-get-python-inc.patch => 0002-Fix-get_python_inc-for-cross-compilation.patch} (76%)
 rename package/python/{004-sysconfigdata-install-location.patch => 0003-Change-the-install-location-of-_sysconfigdata.py.patch} (72%)
 rename package/python/{005-pyc-pyo-conditional.patch => 0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch} (68%)
 create mode 100644 package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
 rename package/python/{007-disable-extensions.patch => 0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch} (58%)
 rename package/python/{008-distutils-use-python-sysroot.patch => 0007-Adjust-library-header-paths-for-cross-compilation.patch} (75%)
 rename package/python/{009-no-termcap-host-path.patch => 0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (67%)
 rename package/python/{010-fix-python-config.patch => 0009-Fix-python-config-for-cross-builds.patch} (81%)
 rename package/python/{011-remove-python-symlink.patch => 0010-Remove-the-python-symlink-install-rules.patch} (65%)
 rename package/python/{013-dont-add-multiarch-path.patch => 0011-Don-t-add-multiarch-paths.patch} (68%)
 rename package/python/{014-abort-on-failed-modules.patch => 0012-Abort-on-failed-module-build.patch} (57%)
 rename package/python/{015-fix-sqlite-without-threads.patch => 0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch} (72%)
 rename package/python/{016-serial-ioctl-workaround.patch => 0014-Serial-ioctl-workaround.patch} (66%)
 rename package/python/{017-distutils-scripts-dont-adjust-shebang.patch => 0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (61%)
 rename package/python/{100-optional-test-modules.patch => 0016-Add-an-option-to-disable-installation-of-test-module.patch} (79%)
 rename package/python/{101-optional-pydoc.patch => 0017-Add-an-option-to-disable-pydoc.patch} (70%)
 rename package/python/{102-optional-2to3.patch => 0018-Add-an-option-to-disable-lib2to3.patch} (71%)
 rename package/python/{103-optional-sqlite.patch => 0019-Add-option-to-disable-the-sqlite3-module.patch} (59%)
 rename package/python/{104-optional-tk.patch => 0020-Add-an-option-to-disable-the-tk-module.patch} (65%)
 rename package/python/{105-optional-curses.patch => 0021-Add-an-option-to-disable-the-curses-module.patch} (62%)
 rename package/python/{106-optional-expat.patch => 0022-Add-an-option-to-disable-expat.patch} (75%)
 rename package/python/{107-optional-codecs-cjk.patch => 0023-Add-an-option-to-disable-CJK-codecs.patch} (58%)
 rename package/python/{108-optional-nis.patch => 0024-Add-an-option-to-disable-NIS.patch} (63%)
 rename package/python/{109-optional-unicodedata.patch => 0025-Add-an-option-to-disable-unicodedata.patch} (58%)
 rename package/python/{110-optional-db.patch => 0026-Add-an-option-to-disable-bsddb.patch} (72%)
 rename package/python/{111-optional-ssl.patch => 0027-Add-an-option-to-disable-the-ssl-module.patch} (50%)
 rename package/python/{112-optional-bzip2.patch => 0028-Add-an-option-to-disable-the-bz2-module.patch} (58%)
 rename package/python/{113-optional-zlib.patch => 0029-Add-an-option-to-disable-the-zlib-module.patch} (58%)
 rename package/python/{114-remove-idle-editor.patch => 0030-Do-not-install-the-idle-editor.patch} (63%)
 rename package/python/{115-optional-ossaudiodev.patch => 0031-Add-an-option-to-disable-the-ossaudiodev-module.patch} (65%)
 create mode 100644 package/python/0032-Add-option-to-disable-the-hashlib-module.patch
 create mode 100644 package/python/0033-Add-an-option-to-disable-readline-module.patch
 delete mode 100644 package/python/006-cross-compile-getaddrinfo.patch
 delete mode 100644 package/python/018-fix-add-gcc-paths-logic.patch
 rename package/python3/{0031-Add-an-option-to-disable-openssl.patch => 0031-Add-an-option-to-disable-openssl-support.patch} (73%)
 create mode 100644 package/python3/0032-Add-an-option-to-disable-the-readline-module.patch
 create mode 100644 package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch

-- 
2.7.4
