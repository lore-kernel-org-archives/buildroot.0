From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 May 2014 23:11:30 +0200
Subject: [Buildroot] [PATCH 0/3] Detect and prevent multiple providers
	(branch yem/fix-virt-pkg)
Message-ID: <cover.1400101273.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Following a weird report about a cairo build failure, we came to the
conclusion that the problem was due to multiple providers of the same
virtual package were selected in the failing configuration. See the
thread starting there:
    http://lists.busybox.net/pipermail/buildroot/2014-May/096379.html

The matter was discussed on the list, and we came up to the conclusion
we would not implement anything in the menuconfig to prevent this
situation, but that we would just detect it prior to running the build.
See the thread starting there:
    http://lists.busybox.net/pipermail/buildroot/2014-May/096517.html

So, what this series does is just that: detect that more than one
provider for a virtual package are selected.

The way it does that is fully described in patch 1/3, but basically:

  - providers must now declare the virtual packages they are an
    implementation of, in their .mk file;

  - the generic package infrastructure checks that for each such
    declared virtual package, the current provider is indeed the
    selected implmenetation. If not, then it means two or more
    providers for that virtual pacakge are selected, and it bails
    out very early in the build.

Regards,
Yann E. MORIN.


The following changes since commit 655c0212f87ca4fc2621fb66a5dabd8bcc445eb7:

  linux: bump to version 3.14.4 (2014-05-14 09:31:08 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/fix-virt-pkg

for you to fetch changes up to 40eb8c9da48a46856d0acb7576d35d621a9efc9c:

  packages: make providers declare what they provide (2014-05-14 23:00:13 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      infra/pkg-virtual: validate only one provider provides an implementation
      docs/manual: document the new FOO_PROVIDES variable
      packages: make providers declare what they provide

 docs/manual/adding-packages-generic.txt            |  3 +++
 docs/manual/adding-packages-virtual.txt            | 15 ++++++++++---
 package/bellagio/bellagio.mk                       |  1 +
 package/eudev/eudev.mk                             |  1 +
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  2 ++
 package/lua/lua.mk                                 |  2 ++
 package/luajit/luajit.mk                           |  2 ++
 package/mesa3d/mesa3d.mk                           |  5 +++++
 package/pkg-generic.mk                             | 26 ++++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |  2 ++
 package/sunxi-mali/sunxi-mali.mk                   |  1 +
 package/systemd/systemd.mk                         |  2 ++
 package/ti-gfx/ti-gfx.mk                           |  1 +
 13 files changed, 60 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
