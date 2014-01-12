From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 00:44:46 +0100
Subject: [Buildroot] [PATCH 0/6] [RFC] some download-related changes
Message-ID: <cover.1389569992.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series contains two download-related changes:

The first part, patch 1 to 3, are a fix the git download helper, which
is currently broken in case a PKG_VERSION is a sha1 that does not exist
in the repository.

Since the make macro was a bit complex to read and maintain, Peter
suggested it be moved to a shell script. If this change is OK, I'll
move the other download helpers to their own shell script.

The second part, patches 4 to 6, add the infrastructure to check the
hashes of the files Buildroot may download, so as to check their
integrity.

This is needed for some packages for which a trusted channel (eg. https)
is not available, and only a insecure channel (eg. http) is available.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (6):
      Makefile: rename USER_HOOKS_EXTRA_ENV to EXTRA_ENV
      pkg-infra: move git download helper to a script
      pkg-infra: git helper creates an empty archive if PKG_VERSION is a missing hash
      package infra: DOWNLOAD is never called with two arguments
      pkg-infra: add possiblity to check downloaded files against known hashes
      package/ca-certificates: add tarball's hash

 Makefile                                     |  4 +--
 docs/manual/adding-packages-directory.txt    | 35 +++++++++++++++++++++++
 package/Makefile.in                          |  2 +-
 package/ca-certificates/ca-certificates.hash |  1 +
 package/pkg-download.mk                      | 36 ++++++++++++------------
 package/pkg-generic.mk                       |  2 +-
 support/download/check-hash                  | 38 +++++++++++++++++++++++++
 support/download/git                         | 42 ++++++++++++++++++++++++++++
 8 files changed, 138 insertions(+), 22 deletions(-)
 create mode 100644 package/ca-certificates/ca-certificates.hash
 create mode 100755 support/download/check-hash
 create mode 100755 support/download/git

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
