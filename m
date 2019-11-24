From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 24 Nov 2019 13:48:19 -0800
Subject: [Buildroot] [PATCH/next v2 0/4] spidermonkey: new package.
Message-ID: <20191124214823.2570598-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>


Spidermonkey is Mozilla's JavaScript engine written in C and C++. It is used in
various Mozilla products, including Firefox, and is available under the MPL2.

There are 19 patches currently required to properly cross-compile spidermonkey:

1) allow-newer-autoconf-versions
  - Spidermonkey is hardcoded to use Autoconf 2.13, which is from 1999!
    The reasoning behind using 2.13 is because newer versions of Autoconf do not
    work correctly with the custom m4 macros in the source code.

    However: Because we are building just the Spidermonkey engine instead of the
    entire Firefox package, newer versions of Autoconf work without issue.
    See: See: https://bugzilla.mozilla.org/show_bug.cgi?id=104642
    for further explanation.

2) allow-building-in-tree
  - By default, spidermonkey must be configured and built out-of-tree, otherwise
    the following error occurs:

    FATAL ERROR PROCESSING MOZBUILD FILE
    ==============================

    The error occurred while processing the following file or one of the files
    it includes:
      js/src/shell/moz.build

    The error occurred when validating the result of the execution. The reported
    error is:
        The path specified in LOCAL_INCLUDES is not allowed:
        .. (resolved to js/src)
    Remove this check, as spidermonkey builds without issue in-tree.

3) allow-unknown-configuration-options
  - By default, if an unknown parameter is passed to configure, an error is
    raised. Replace the raise with a pass and continue.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1379540

4) fix-building-with-musl
  - The MIPS specific header <sgidefs.h> is not provided by musl.
    The Linux kernel headers <asm/sgidefs.h> provide the same definitions.

5) add-riscv-support
  - Submitted upstream:
    See: https://bugzilla.mozilla.org/show_bug.cgi?id=1318905

6) copy-headers-on-install-instead-of-symlinking
  - When installing, instead of linking the headers to the source directory,
    copy them.

7) ensure-proper-running-on-64-bit-and-32-bit-be-platforms
  - Taken from the Fedora RPM
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1488552

8) 0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje
  - Taken from the Fedora RPM:
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1375074

9) save-x28-before-clobbering-it-in-the-regex-compiler
  - Taken from the Fedora RPM:
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1445907

10) always-use-the-equivalent-year-to-determine-the-time-zone
  - Taken from the Fedora RPM:
    Applied upstream.
    Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=1415202

Typically, The Firefox source tarball is used to build spidermonkey; however,
this has two disadvantages:
  - It's large. The Firefox source tarball is over 250M.
  - It requires Autoconf 2.13
Instead, use a tarball with only the Spidermonkey source code in it with a
pre-setup configure file. This tarball reduces the size to 31M and prevents the
Autoconf 2.13 requirement.

Also in this patch set:
 - Update polkit to 0.116
 - Update polkit to support systemd-logind
 - Update polkit to support linux-pam

Tested with test-pkg -a
 - 44 tests completed:
 - 18 OK
 - 26 SKIPPED
 - 0 FAILED
 
Changes from v1 -> v2:
 - When making large patch series like this, I tend to do all of my work in my
   own fork of buildroot, and then copy the changes over to a master copy of
   buildroot. I was testing spidermonkey without host_python_ssl to make sure
   it's actually a requirement (It is), and I forgot to re-add it back before
   making the patch. Doh!

Adam Duskett (4):
  spidermonkey: new package
  package/polkit: bump to version 0.116
  package/polkit: support different authentication frameworks
  package/polkit: enable systemd login support

 DEVELOPERS                                    |   2 +
 package/Config.in                             |   1 +
 .../0001-make-netgroup-support-optional.patch | 232 ++++++++++++++++++
 package/polkit/Config.in                      |  22 +-
 package/polkit/polkit.hash                    |   2 +-
 package/polkit/polkit.mk                      |  22 +-
 .../0001-allow-newer-autoconf-versions.patch  |  61 +++++
 .../0002-allow-building-in-tree.patch         |  47 ++++
 ...-allow-unknown-configuration-options.patch |  35 +++
 .../0004-fix-building-with-musl.patch         | 133 ++++++++++
 .../spidermonkey/0005-add-riscv-support.patch | 121 +++++++++
 ...ers-on-install-instead-of-symlinking.patch |  34 +++
 ...ng-on-64-bit-and-32-bit-be-platforms.patch | 144 +++++++++++
 ...-on-ARM64-for-generated-unboxed-obje.patch |  66 +++++
 ...-clobbering-it-in-the-regex-compiler.patch | 100 ++++++++
 ...lent-year-to-determine-the-time-zone.patch | 103 ++++++++
 package/spidermonkey/Config.in                |  39 +++
 package/spidermonkey/spidermonkey.hash        |   3 +
 package/spidermonkey/spidermonkey.mk          |  58 +++++
 19 files changed, 1213 insertions(+), 12 deletions(-)
 create mode 100644 package/polkit/0001-make-netgroup-support-optional.patch
 create mode 100644 package/spidermonkey/0001-allow-newer-autoconf-versions.patch
 create mode 100644 package/spidermonkey/0002-allow-building-in-tree.patch
 create mode 100644 package/spidermonkey/0003-allow-unknown-configuration-options.patch
 create mode 100644 package/spidermonkey/0004-fix-building-with-musl.patch
 create mode 100644 package/spidermonkey/0005-add-riscv-support.patch
 create mode 100644 package/spidermonkey/0006-copy-headers-on-install-instead-of-symlinking.patch
 create mode 100644 package/spidermonkey/0007-ensure-proper-running-on-64-bit-and-32-bit-be-platforms.patch
 create mode 100644 package/spidermonkey/0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje.patch
 create mode 100644 package/spidermonkey/0009-save-x28-before-clobbering-it-in-the-regex-compiler.patch
 create mode 100644 package/spidermonkey/0010-always-use-the-equivalent-year-to-determine-the-time-zone.patch
 create mode 100644 package/spidermonkey/Config.in
 create mode 100644 package/spidermonkey/spidermonkey.hash
 create mode 100644 package/spidermonkey/spidermonkey.mk

-- 
2.23.0
