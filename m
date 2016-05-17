From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:48:41 +0200
Subject: [Buildroot] [PATCH v3 1/9] python3: bump to 3.5.1
In-Reply-To: <1462133720-409-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160517224841.37ff98dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 22:15:12 +0200, Thomas Petazzoni wrote:
> The major changes in terms of Buildroot packaging are:
> 
>  - Due to PEP488, Python no longer generates .pyc (unoptimized) and
>    .pyo (optimized) byte-code files. Instead, it generates <foo>.pyc,
>    <foo>.opt-1.pyc and <foo>.opt-2.pyc. Therefore, we removed the
>    --disable-pyo-build option and kept only the --disable-pyc-build
>    option, which completely disables building all .pyc files. In
>    addition, since the optimized .opt-X.pyc files don't work if the
>    corresponding un-optimized .pyc file is not present, we are for the
>    moment unconditionally removing the optimized ones (keeping both
>    the unoptimized and optimized ones doubles the required filesystem
>    size!). So basically we preserve the behavior we had before this
>    commit:
> 
>      BR2_PACKAGE_PYTHON3_PY_ONLY -> only *.py
>      BR2_PACKAGE_PYTHON3_PYC_ONLY -> only non-optimized *.pyc
>      BR2_PACKAGE_PYTHON3_PY_PYC -> both the *.py and non-optimized *.pyc
> 
>    To achieve this, the TARGET_FINALIZE_HOOKS are reworked:
> 
>     PYTHON3_REMOVE_PY_FILES is responsible for removing *.py files in
>     the BR2_PACKAGE_PYTHON3_PYC_ONLY case.
> 
>     PYTHON3_REMOVE_PYC_FILES is responsible for removing *.pyc files
>     in the BR2_PACKAGE_PYTHON3_PY_ONLY case.
> 
>     PYTHON3_REMOVE_OPTIMIZED_PYC_FILES is responsible for removing the
>     optimized *.opt-1.pyc and *.opt-2.pyc files, which is done
>     unconditionally.
> 
>  - The PEP3147 disabling patch had to be significantly reworked due to
>    the code having changed heavily. The code was moved into a
>    _bootstrap_external.py, which is a "frozen" Python module, i.e a
>    module generated into a .h file at compile time using the
>    _freeze_importlib program.
> 
>  - Due to the above, we now need to regenerate importlib.h at build
>    time. Unfortunately, for the target Python _freeze_importlib is
>    built for the target, so we can't run it on the build machine. To
>    fix this, we copy the _freeze_importlib program from the
>    host-python in $(HOST_DIR), and then patch the target python to use
>    it. Since the same solution can be used for 'pgen', we do it, and
>    avoid having to touch the graminit.{c,h} files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> ---
> Changes since v2:
>  - Add Samuel Reviewed-by.
> Changes since v1:
>  - Remove the no longer useful --disable-pyo-build, as noticed by
>    Arnout.
>  - Fix the handling of *.opt-X.pyc files by simply getting rid of them
>    for the moment.
> ---
>  ...up.py-do-not-add-invalid-header-locations.patch |  6 +-
>  ...the-install-location-of-_sysconfigdata.py.patch | 18 ++---
>  ...he-build-of-pyc-and-pyo-files-conditional.patch | 78 ----------------------
>  ...3-Make-the-build-of-pyc-files-conditional.patch | 54 +++++++++++++++
>  ...gy_getaddrinfo-configure-test-when-cross-.patch |  6 +-
>  ...ructure-to-disable-the-build-of-certain-e.patch | 18 ++---
>  ...006-distutils-sysconfig-use-sysconfigdata.patch |  6 +-
>  ...ibrary-header-paths-for-cross-compilation.patch | 12 ++--
>  ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  6 +-
>  .../python3/0009-Don-t-add-multiarch-paths.patch   |  6 +-
>  .../0010-Abort-on-failed-module-build.patch        | 10 +--
>  package/python3/0011-Serial-ioctl-workaround.patch |  2 +-
>  ...st-the-shebang-of-Python-scripts-for-cros.patch |  2 +-
>  ...-config.sh.in-ensure-sed-invocations-only.patch |  6 +-
>  ...-harcode-invalid-path-to-ncursesw-headers.patch |  6 +-
>  ...stem-locale-and-set-to-default-when-addin.patch |  6 +-
>  ...0016-Add-importlib-fix-for-PEP-3147-issue.patch | 69 +++++++++++--------
>  ...on-to-disable-installation-of-test-module.patch | 16 ++---
>  .../0018-Add-an-option-to-disable-pydoc.patch      | 20 +++---
>  .../0019-Add-an-option-to-disable-lib2to3.patch    | 22 +++---
>  ...-Add-option-to-disable-the-sqlite3-module.patch | 14 ++--
>  ...21-Add-an-option-to-disable-the-tk-module.patch | 18 ++---
>  ...dd-an-option-to-disable-the-curses-module.patch | 12 ++--
>  .../0023-Add-an-option-to-disable-expat.patch      | 16 ++---
>  .../0024-Add-an-option-to-disable-CJK-codecs.patch |  6 +-
>  .../0025-Add-an-option-to-disable-NIS.patch        |  6 +-
>  ...0026-Add-an-option-to-disable-unicodedata.patch |  6 +-
>  .../0027-Add-an-option-to-disable-IDLE.patch       | 18 ++---
>  .../0028-Add-an-option-to-disable-decimal.patch    | 10 +--
>  ...-option-to-disable-the-ossaudiodev-module.patch |  6 +-
>  ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch | 62 +++++++++++++++++
>  package/python3/python3.hash                       |  6 +-
>  package/python3/python3.mk                         | 58 ++++++++--------
>  33 files changed, 333 insertions(+), 274 deletions(-)
>  delete mode 100644 package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
>  create mode 100644 package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
>  create mode 100644 package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
