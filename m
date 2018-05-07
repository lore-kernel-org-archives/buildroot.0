From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 May 2018 20:25:16 +0200
Subject: [Buildroot] [PATCH 0/5] package: bump attr and acl,
 fix builds of dependees
Message-ID: <cover.1525717511.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at bumping the attr and acl packages to a
later version.

The crux of the changes is to get an attr package that no longer behaves
silly [0]. attr has had a complete overhaul of it buildsystem, making it
fully autotools-based, which fixes quite a few idiosyncracies of the
previous hand-rolled one.

However, this means that attr no longer installs its own copy of xattr.h,
on the assumption that it has been provided by glibc "for ages" [1] [2]
[3] [4]. This means that a few packages have to be fixed now, of which acl.

Speaking of acl, that one had no release for the past 5 years, and still
got quite some amount of activity in the git tree. So, we update to an
arbitrary tag from the git tree, i.e. the latest as of today.

Two packages then need fixing because they still use attr/xattr.h:
stress-ng, which we bump and fix (so that we can send the fix upstream
easily), and lua-flu, which we simply fix (after sending the patch
upstream).

Of all packages that depend on attr or acl:

    sys  -> checks for, and uses <sys/xattr.h>   => Order means order
    attr -> checks for, and uses <attr/xattr.h>  => they are tested for.
    acl  -> checks for, and uses <acl/libacl.h> and/or -lacl
    patched    -> patch added to uses <sys/xattr.h>
    no xattr.h -> does not check for <attr/xattr.h> or <sys/xattr.h>,
                  but uses other <attr/*.h> and -lattr

    acl                 ACK, sys
    coreutils           ACK, sys-attr
    host-acl            ACK, sys
    host-fakeroot       ACK, sys
    host-pseudo         ACK, sys
    libarchive          ACK, attr-sys
    logrotate           ACK, acl
    lua-flu             ACK, patched, sys
    mtd                 ACK, sys
    netatalk            ACK, acl, attr-sys
    patch               ACK, no xattr.h
    rpm                 ACK, acl
    rsync               ACK, acl, attr-sys
    samba4              ACK, attr-sys [*]
    stress-ng           ACK, patched, sys
    systemd             ACK, acl
    tar                 ACK, acl, sys
    vim                 ACK, acl [**]
    xorriso             ACK, acl, patched, sys

[*] in my testing, I had a systemd-based system, and samba4 failed to
install (I'll investigate separately). But at least, it did detect and
use <sys/xattr.h> correctly, and the build succeeded. It even installed
OK, but our SAMBA4_INSTALL_INIT_SYSTEMD is borked (missing source file.)

[**] vim uses xattr to add support for SMACK. Before this series, it did
detect xattr, but failed to deteect a feature of it [4], so it always
disabled SMACK support. Now, it does not detect xattr at all, so it
doesn't enable SMACK either. So, even though we have a regression about
the detections of xattr.h, we have no regression in functionality.

Now, let's see some test-pkg configs and results:

    $ cat attr-nommu.cfg
    BR2_PACKAGE_ACL=y
    BR2_PACKAGE_ATTR=y
    BR2_PACKAGE_LIBARCHIVE=y
    BR2_PACKAGE_MTD=y
    BR2_PACKAGE_MTD_MKFSJFFS2=y
    BR2_PACKAGE_MTD_MKFSUBIFS=y
    $ ./utils/test-pkg -c attr-nommu.cfg -d $(pwd)/test-nommu
                                 br-arm-full [1/6]: OK
                      br-arm-cortex-a9-glibc [2/6]: OK
                       br-arm-cortex-m4-full [3/6]: OK
                              br-x86-64-musl [4/6]: OK
                          br-arm-full-static [5/6]: OK
                    armv5-ctng-linux-gnueabi [6/6]: OK
    6 builds, 0 skipped, 0 build failed, 0 legal-info failed

    $ cat attr-mmu.cfg
    BR2_PACKAGE_ACL=y
    BR2_PACKAGE_ATTR=y
    BR2_PACKAGE_COREUTILS=y
    BR2_PACKAGE_LIBARCHIVE=y
    BR2_PACKAGE_LOGROTATE=y
    BR2_PACKAGE_MTD=y
    BR2_PACKAGE_MTD_MKFSJFFS2=y
    BR2_PACKAGE_MTD_MKFSUBIFS=y
    BR2_PACKAGE_NETATALK=y
    BR2_PACKAGE_PATCH=y
    BR2_PACKAGE_RPM=y
    BR2_PACKAGE_RSYNC=y
    BR2_PACKAGE_SAMBA4=y
    BR2_PACKAGE_TAR=y
    BR2_PACKAGE_VIM=y
    BR2_PACKAGE_XORRISO=y
    $ ./utils/test-pkg -c attr-mmu.cfg -d $(pwd)/test-mmu
                                 br-arm-full [1/6]: OK
                      br-arm-cortex-a9-glibc [2/6]: OK
                       br-arm-cortex-m4-full [3/6]: SKIPPED
                              br-x86-64-musl [4/6]: SKIPPED
                          br-arm-full-static [5/6]: SKIPPED
                    armv5-ctng-linux-gnueabi [6/6]: OK
    6 builds, 3 skipped, 0 build failed, 0 legal-info failed

    Notes:
      - for mtd, the two utilities that use xattr are explcitly enabled;
      - for br-arm-cortex-m4-full, that's because it is a static
        build, so a lot of packages are disabled;
      - for br-x86-64-musl, samba4 is not available for musl;
      - for br-arm-full-static, again it is a static build.

    $ cat attr-mmu-glibc.cfg
    BR2_PACKAGE_ACL=y
    BR2_PACKAGE_ATTR=y
    BR2_PACKAGE_COREUTILS=y
    BR2_PACKAGE_LIBARCHIVE=y
    BR2_PACKAGE_LUA=y
    BR2_PACKAGE_LUA_FLU=y
    BR2_PACKAGE_LOGROTATE=y
    BR2_PACKAGE_MTD=y
    BR2_PACKAGE_MTD_MKFSJFFS2=y
    BR2_PACKAGE_MTD_MKFSUBIFS=y
    BR2_PACKAGE_NETATALK=y
    BR2_PACKAGE_PATCH=y
    BR2_PACKAGE_RPM=y
    BR2_PACKAGE_RSYNC=y
    BR2_PACKAGE_SAMBA4=y
    BR2_PACKAGE_STRESS_NG=y
    BR2_PACKAGE_TAR=y
    BR2_PACKAGE_VIM=y
    BR2_PACKAGE_XORRISO=y
    $ ./utils/test-pkg -c attr-mmu-glibc.cfg  -d $(pwd)/test-mmu-glibc
                                 br-arm-full [1/6]: SKIPPED
                      br-arm-cortex-a9-glibc [2/6]: OK
                       br-arm-cortex-m4-full [3/6]: SKIPPED
                              br-x86-64-musl [4/6]: SKIPPED
                          br-arm-full-static [5/6]: SKIPPED
                    armv5-ctng-linux-gnueabi [6/6]: OK
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed

    Notes:
      - br-arm-full: stress-ng only for glibc;
      - br-arm-cortex-m4-full: it's a static build;
      - br-x86-64-musl: stress-ng and smaba4 not avail on musl;
      - br-arm-full-static: static build

Now, I also build-tested systemd with a custom config (not with
test-pkg).

Note: I'll send the patches upstream asap.

[0] https://bugs.busybox.net/show_bug.cgi?id=10986
[1] https://git.savannah.gnu.org/cgit/attr.git/commit/?id=7921157890d07858d092f4003ca4c6bae9fd2c38)
[1] glibc: since 2.5: https://sourceware.org/git/?p=glibc.git;a=commit;h=0ecb606cb6cf65de1d9fc8a919bceb4be476c602
[2] uClibc: since 2004: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=d503d1d6c62506ba6fb51c04a9703039e71d11a9
[3] musl: since 2012 (a year after initial release): http://git.musl-libc.org/cgit/musl/commit/?id=207460d09742304941f1a010a89fc2efa46bcb29
[4] checking for XATTR_NAME_SMACKEXEC in linux/xattr.h... no


Regards,
Yann E. MORIN.


The following changes since commit ba33728bc3118a6f1d2b4233e7bddb17b2f67f1f

  uclibc: fix clock_nanosleep declaration (2018-05-06 23:19:14 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 6e7e5621022a8e788dc3cc8e04f123959e6de050

  package/attr: bump version (2018-05-07 20:23:33 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      package/lua-flu: fix to use system xattr header
      package/stress-ng: bump version, fix to use system xattr header
      package/xorriso: fix to use system xattr header
      package/acl: bump version
      package/attr: bump version

 package/acl/0001-support-static-installation.patch |  29 --
 ...2-add-__acl_-prefixes-to-internal-symbols.patch | 292 ---------------------
 package/acl/acl.hash                               |   2 +-
 package/acl/acl.mk                                 |  60 ++---
 .../attr/0001-support-static-installation.patch    |  29 --
 .../0002-avoid-glibc-specific-decls-defines.patch  |  37 ---
 package/attr/0003-portability-fixes.patch          |  37 ---
 package/attr/attr.hash                             |   2 +-
 package/attr/attr.mk                               |  43 +--
 package/lua-flu/0001-use-system-xattr-h.patch      | 161 ++++++++++++
 package/stress-ng/0001-xattr-from-libc.patch       |  49 ++++
 package/stress-ng/stress-ng.hash                   |   2 +-
 package/stress-ng/stress-ng.mk                     |   3 +-
 package/xorriso/0001-use-sys-xattr.h.patch         |  30 +++
 package/xorriso/xorriso.mk                         |  10 +
 15 files changed, 283 insertions(+), 503 deletions(-)
 delete mode 100644 package/acl/0001-support-static-installation.patch
 delete mode 100644 package/acl/0002-add-__acl_-prefixes-to-internal-symbols.patch
 delete mode 100644 package/attr/0001-support-static-installation.patch
 delete mode 100644 package/attr/0002-avoid-glibc-specific-decls-defines.patch
 delete mode 100644 package/attr/0003-portability-fixes.patch
 create mode 100644 package/lua-flu/0001-use-system-xattr-h.patch
 create mode 100644 package/stress-ng/0001-xattr-from-libc.patch
 create mode 100644 package/xorriso/0001-use-sys-xattr.h.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
