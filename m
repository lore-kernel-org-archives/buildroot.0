From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 18:06:50 +0200
Subject: [Buildroot] [PATCH 0/7 v4] core/pkg-kconfig: ensure we have
 necessary tools to run configurators
Message-ID: <cover.1534522005.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Recent version of the linux kernel introduced major changes in the
kconfig infrastructure.

Starting with linux-4.16, the kconfig parser code is no longer shipped
with the linux source tree, and mut be generated from the lex/yacc
parser sources.

Similarly, starting with linux-4.18, the kconfig infra allows calling
back to the shell to run various commands, especially calling to the
compiler to test its features (and hide/show options accordingly).

So, we need to ensure the appropriate tools are available before we
attempt to run any of the configurators. Since building host-flex and
host-bison is not entirely free (they both have a few dependencies of
their own), we want to be able to use the system ones if they are
present.

This seven-patch series first documents the reasons for having host-flex
and host-bison as dependencies of the linux package.

Then we add support for detecting if the system provides flex and/or
bison; if either is missing, a conditional dependency is defined for
either.

Third, the kconfig infra is enhanced to accept dependencies needed
before the configurators are called.

The linux packages is then adapted, one step at a time, to use the
conditional flex/bison dependencies for the configurators, and use
the host-{flex,bison} dependencies only for the DTS support.

Then, the toolchain is added as a kconfig dependencies of the linux
kernel.

Eventually, uboot is also fixed to conditionally require flex/bison.

Changes v3 -> v4:
  - also fix uboot

(note: there was no v2.)

Changes v1 -> v3:
  - introduce the KCONFIG_DEPENDENCIES in the kconfig-package infra
    (Thomas)
  - change linux to take advantage of that  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit f70b13a7cb6eb01e9d78fddcb695b84a22e5699b

  dahdi-tools: unify dependencies comments (2018-08-17 17:07:11 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ed63f1c812145907ef83c6bf245ad5765c67aded

  boot/uboot: needs host-{flex,bison} (2018-08-17 17:40:03 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      linux: explain why we need host-{flex,bison}
      support/dependencies: check for system-provided bison and flex
      core/pkg-kconfig: allow dependencies before configurators
      linux: kconfig may need host-{flex,bison} to build the configurators
      linux: host-{flex,bison} only needed for DTS
      linux: kconfig needs the toolchain
      boot/uboot: needs host-{flex,bison}

 boot/uboot/uboot.mk                           |  3 +++
 docs/manual/adding-packages-kconfig.txt       |  4 ++++
 linux/linux.mk                                | 19 ++++++++++++++++++-
 package/pkg-kconfig.mk                        |  9 +++++++++
 support/dependencies/check-host-bison-flex.mk | 10 ++++++++++
 5 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 support/dependencies/check-host-bison-flex.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
