From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Dec 2014 23:22:06 +0100
Subject: [Buildroot] [pull request] provide and install libssp
Message-ID: <cover.1419977553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series attempts to cover the cases where libssp might:

  - be needed by some packages (mostly proprietary stuff), such as
    pre-built binaries that are dynamically linked to libssp.so.1

  - source but proprietary packages for which it is not possible to
    update/fix the build system, and which unconditionally want to
    link at build time against -lssp or -lssp_nonshared

So, this series:

  - adds a package that installs a fake, empty libssp.so.1 in target
    (for pre-built stuff) and a fake libssp.a and libssp_nonshared.a
    in staging (for unfixable proprietary source); this package is
    always built and installed, even if not doing SSP builds, because
    of pre-built proprietary stuff;

  - adds an option to external libs to specify whether they implement
    SSP via libssp or not (default: no, as previously).

This is not fool-proof tested, and only casual testing was done:

  - using an external toolchain without libssp.so

  - using the same toolchain with an empty file has libssp.so (just so
    as to trigger the mechanism)

Regards,
Yann E. MORIN.


The following changes since commit 4fc5f4a644029d2d15e2fb7907f8ad6ae45ed249:

  package/libiio: fix static build (2014-12-30 11:19:12 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/libssp

for you to fetch changes up to 15e521114fdad342030ec2a699e44190188a3cd2:

  toolchain/external: add option to install libssp (2014-12-30 23:11:16 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      toolchain: add hidden option to specify it has libssp
      package/libssp-fake: new package
      toolchain: add dependency to fake libssp if needed
      toolchain/external: add option to install libssp

 package/Config.in                                  |  1 +
 package/libssp-fake/Config.in                      | 12 ++++++
 package/libssp-fake/libssp-fake.mk                 | 47 ++++++++++++++++++++++
 toolchain/helpers.mk                               | 25 +++++++++++-
 toolchain/toolchain-common.in                      |  3 ++
 toolchain/toolchain-external/Config.in             | 13 ++++++
 toolchain/toolchain-external/toolchain-external.mk |  3 ++
 toolchain/toolchain/toolchain.mk                   |  4 ++
 8 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 package/libssp-fake/Config.in
 create mode 100644 package/libssp-fake/libssp-fake.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
