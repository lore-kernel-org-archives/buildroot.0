From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 00:51:34 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	yem/instrument-build
Message-ID: <cover.1384127173.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series adds support for instrumenting the build process, reworked
after discussion both on the ML and during the developpers' day.

It works as thus:
  - we register a set of hooks
  - hooks are called before and after each steps

There are currently two hooks defined:
  - log steps with timings (as an example of how to do a hook)
  - call a user-supplied script

More hooks can be added later on. Specifically, we may want to add a
script (in support/scripts or wherever) that runs some verifications
after packages are installed (in target/ and staging/), for example
to check for RPATH, or to check scripts do not have build-dir paths
in them (eg python scripts)...

I'm planning on adding at least one other hook, that runs all scripts
present in support/step-hooks/ (or whatever its name).

Changes v2 -> v3:
  - rename the internal variable that holds the hooks  (Thomas DS)
  - misc typo fixes  (Thomas DS)

Changes v1 -> v2:
  - removed the intra-steps instrumentation  (Thomas, Peter)
  - accept a list of user-supplied hooks, not only one hook  (Thomas)

Regards,
Yann E. MORIN.


The following changes since commit 13ae0075a94895c1b021d20905867ee5f354bd49:

  uboot-tools: factor out common mkimage infrastructure (2013-11-11 00:37:03 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/instrument-build

for you to fetch changes up to 1be7266b22b1c6104d2050be1b1f5e75cbf0e362:

  pkg-infra: add user-supplied step-hooks (2013-11-11 00:45:59 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      post-{build,images} hooks: export BUILD_DIR too
      pkg-infra: introduce pre/post-step hooks
      pkg-infra: add hook to log timing of steps
      pkg-infra: add user-supplied step-hooks

 Makefile                            |  4 +--
 docs/manual/customize-rootfs.txt    |  5 ++--
 docs/manual/debugging-buildroot.txt | 33 +++++++++++++++++++++
 docs/manual/developer-guide.txt     |  2 ++
 package/Makefile.in                 |  6 ++++
 package/pkg-generic.mk              | 59 +++++++++++++++++++++++++++++++++++++
 6 files changed, 105 insertions(+), 4 deletions(-)
 create mode 100644 docs/manual/debugging-buildroot.txt

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
