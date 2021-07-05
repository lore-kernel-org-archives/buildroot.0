From: Adam Duskett <aduskett@gmail.com>
Date: Sun,  4 Jul 2021 22:40:55 -0700
Subject: [Buildroot] [PATCH 0/5] Polkit: bump version to 0.119 and use
 duktape
Message-ID: <20210705054100.2857251-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is done, I have successfully destroyed spidermonkey.
As discussed by Yann and Thomas, spidermonkey is no more. Duktape fixes
everything yet again, and this is one more package that requires python2 gone.

Of course, tested in centos7 with "test-pkg -c ./defconfig -p polkit -a" and
./support/testing/run-tests -o ./output -d ./dl -k tests.package.test_polkit.TestPolkitInit
AND
./support/testing/run-tests -o ./output -d ./dl -k tests.package.test_polkit.TestPolkitSystemd

45 builds, 11 skipped, 0 build failed, 1 legal-info failed

Adam Duskett (5):
  package/duktape/duktape.pc.in: New file
  package/polkit: bump version to 0.119 and use duktape
  package/polkit/S50polkit: new file
  support/testing: add polkit tests
  package/spidermonkey: drop package

 Config.in.legacy                              |   9 ++
 package/Config.in                             |   1 -
 package/duktape/duktape.mk                    |   4 +
 package/duktape/duktape.pc.in                 |  10 ++
 .../0001-make-netgroup-support-optional.patch |  19 +--
 package/polkit/0002-jsauthority-memleak.patch |  28 ----
 ...lkit-0.116-pkttyagent-sigttou-bg-job.patch |  34 -----
 package/polkit/Config.in                      |  24 +--
 package/polkit/S50polkit                      |  51 +++++++
 package/polkit/polkit.hash                    |   4 +-
 package/polkit/polkit.mk                      |  16 +-
 .../0001-allow-newer-autoconf-versions.patch  |  61 --------
 .../0002-allow-building-in-tree.patch         |  47 ------
 ...-allow-unknown-configuration-options.patch |  35 -----
 .../0004-fix-building-with-musl.patch         | 133 ----------------
 .../spidermonkey/0005-add-riscv-support.patch | 121 ---------------
 ...ers-on-install-instead-of-symlinking.patch |  34 -----
 ...ng-on-64-bit-and-32-bit-be-platforms.patch | 144 ------------------
 ...-on-ARM64-for-generated-unboxed-obje.patch |  66 --------
 ...-clobbering-it-in-the-regex-compiler.patch | 100 ------------
 ...lent-year-to-determine-the-time-zone.patch | 103 -------------
 ....in-install-shell-only-if-it-s-built.patch |  28 ----
 package/spidermonkey/Config.in                |  60 --------
 package/spidermonkey/spidermonkey.hash        |   3 -
 package/spidermonkey/spidermonkey.mk          |  64 --------
 package/systemd/Config.in                     |  17 +--
 package/udisks/Config.in                      |  23 +--
 .../package/br2-external/polkit/Config.in     |   1 +
 .../package/br2-external/polkit/external.desc |   1 +
 .../package/br2-external/polkit/external.mk   |   1 +
 .../package/polkit-rules-test/Config.in       |   6 +
 .../polkit-rules-test/initd/hello-polkit.c    |   6 +
 .../initd/hello-polkit.policy                 |  14 ++
 .../initd/hello-polkit.rules                  |   6 +
 .../polkit-rules-test/polkit-rules-test.mk    |  38 +++++
 .../systemd/systemd-timesyncd-restart.rules   |   7 +
 support/testing/tests/package/test_polkit.py  |  70 +++++++++
 37 files changed, 265 insertions(+), 1124 deletions(-)
 create mode 100644 package/duktape/duktape.pc.in
 delete mode 100644 package/polkit/0002-jsauthority-memleak.patch
 delete mode 100644 package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
 create mode 100755 package/polkit/S50polkit
 delete mode 100644 package/spidermonkey/0001-allow-newer-autoconf-versions.patch
 delete mode 100644 package/spidermonkey/0002-allow-building-in-tree.patch
 delete mode 100644 package/spidermonkey/0003-allow-unknown-configuration-options.patch
 delete mode 100644 package/spidermonkey/0004-fix-building-with-musl.patch
 delete mode 100644 package/spidermonkey/0005-add-riscv-support.patch
 delete mode 100644 package/spidermonkey/0006-copy-headers-on-install-instead-of-symlinking.patch
 delete mode 100644 package/spidermonkey/0007-ensure-proper-running-on-64-bit-and-32-bit-be-platforms.patch
 delete mode 100644 package/spidermonkey/0008-save-and-restore-non-volatile-x28-on-ARM64-for-generated-unboxed-obje.patch
 delete mode 100644 package/spidermonkey/0009-save-x28-before-clobbering-it-in-the-regex-compiler.patch
 delete mode 100644 package/spidermonkey/0010-always-use-the-equivalent-year-to-determine-the-time-zone.patch
 delete mode 100644 package/spidermonkey/0011-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
 delete mode 100644 package/spidermonkey/Config.in
 delete mode 100644 package/spidermonkey/spidermonkey.hash
 delete mode 100644 package/spidermonkey/spidermonkey.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.desc
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
 create mode 100644 support/testing/tests/package/test_polkit.py

-- 
2.31.1
