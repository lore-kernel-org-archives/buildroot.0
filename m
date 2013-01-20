From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 17:03:44 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem-instrument-build
Message-ID: <cover.1358697765.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds some intrumentation to the pkg-infra so that it is easier
for the autobuilders to extract meaningfull information about the reason
of failures.

It does so by:
  - logging all messages displayed with calls to MESSAGE to a time-stamped
    log file
  - log the last such mesage to a file
  - add calls to MESSAGE in the non-package steps of the external toolchain
    backend
  - add calls to MESSAGE in the non-package steps of the crosstool-NG
    toolchain backend
  - add calls to MESSAGE in the non-package steps of the internal toolchain
    backend (gcc, kernel headers, and uClibc)

Although I've tested it with external and internal toolchain backends (not
crosstool-NG for now), and although it does work, I expect some polishing
to be required. 

So, take this series as a kind of RFC, rather than a final series.


Changes v1 -> v2:
  - invert the patches ordering for easier upstreaming (Thomas)
  - include Arnout's fixes against the filesystem infra (Arnout)
    (with a few fixes for "no newline at end of file" by me)
  - eye-candy fixes in displayed messages (Arnout)


The following changes since commit ad0279f0ee51e97bf7dbb70fdd6f14f789f344a8:

  gettext: fix static build failure (2013-01-20 09:54:25 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-instrument-build

Yann E. MORIN (7):
      toolchain/external: sprinkle with some calls to MESSAGE
      toolchain/crosstool-ng: sprinkle with some calls to MESSAGE
      toolchain/gcc: sprinkle with some calls to MESSAGE
      toolchain/kernel-headers: sprinkle with some calls to MESSAGE
      toolchain/uClibc: sprinkle with some calls to MESSAGE
      fs/common.mk: delay evaluation of variables.
      pkg-infra: log current message

 fs/cloop/cloop.mk                                |    4 +-
 fs/common.mk                                     |   44 +++++++++++-----------
 fs/cpio/cpio.mk                                  |    2 +-
 fs/cramfs/cramfs.mk                              |    2 +-
 fs/ext2/ext2.mk                                  |    2 +-
 fs/jffs2/jffs2.mk                                |    8 ++--
 fs/romfs/romfs.mk                                |    4 +-
 fs/squashfs/squashfs.mk                          |    4 +-
 fs/tar/tar.mk                                    |    2 +-
 fs/ubifs/ubi.mk                                  |    4 +-
 fs/ubifs/ubifs.mk                                |    4 +-
 package/pkg-utils.mk                             |    9 ++++-
 toolchain/gcc/gcc-uclibc-4.x.mk                  |   16 ++++++++
 toolchain/kernel-headers/kernel-headers.mk       |    4 ++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    5 +-
 toolchain/toolchain-external/ext-tool.mk         |    8 ++-
 toolchain/uClibc/uclibc.mk                       |   13 ++++++
 17 files changed, 88 insertions(+), 47 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
