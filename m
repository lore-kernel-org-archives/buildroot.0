From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 23:51:14 +0200
Subject: [Buildroot] [PATCH/next 0/4] DEVELOPERS file and get-developer tool
Message-ID: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series implements something that has already been discussed
several times during Buildroot meeting and that will hopefully help
maintaining Buildroot.

It adds a DEVELOPERS text file that associates developers (and their
e-mail address) with the list of files they look after in
Buildroot. On top of this, a "get-developer" tool allows to:

 - Get the proper list of recipients for "git send-email" when sending
   patches. This will make sure that developers looking after a given
   area in Buildroot (be it a package, package infra, documentation,
   defconfig, etc.) will receive the patches touching this area.

 - Notify developers when there are build failures on architectures
   they take care of (this was already the case today) but also
   packages they take care of (it wasn't possible without this
   mechanism)

The first patch adds the get-developer tool itself and its companion
Python library. We have a separate library because it is used by the
autobuilder infrastructure (rather than calling the command line tool
repeatedly).

The second patch adds an initial DEVELOPERS file. Of course, the aim
is to progressively improve this file so that it covers as many areas
of Buildroot as possible.

The last two patches update the Buildroot manual.

Let me know what you think, both in the general principles, but also
the implementation details (I'm sure my Python is not very good, so
comments and suggestions welcome).

This patch series is also available in a Git repository at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=developers

It is worth mentioning that I have already adapted the autobuilder
infrastructure to use this mechanism, and if everything works well:

 - Tomorrow's daily autobuilder report on the list will be generated
   by the new Python script (no visible difference)

 - All developers taking care of an architecture or a package causing
   a build failure will be individually notified.

Thanks,

Thomas

Thomas Petazzoni (4):
  support/scripts/get-developers: add new script
  DEVELOPERS: add initial list of Buildroot developers
  docs/manual: update contribute.txt to cover get-developers
  docs/manual: add new section about the DEVELOPERS file and
    get-developer

 DEVELOPERS                         | 1375 ++++++++++++++++++++++++++++++++++++
 docs/manual/contribute.txt         |   12 +-
 docs/manual/developers.txt         |   45 ++
 docs/manual/manual.txt             |    2 +
 support/scripts/get-developers     |   83 +++
 support/scripts/getdeveloperlib.py |  198 ++++++
 6 files changed, 1713 insertions(+), 2 deletions(-)
 create mode 100644 DEVELOPERS
 create mode 100644 docs/manual/developers.txt
 create mode 100755 support/scripts/get-developers
 create mode 100644 support/scripts/getdeveloperlib.py

-- 
2.7.4
