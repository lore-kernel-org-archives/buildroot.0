From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 14:47:42 +0200
Subject: [Buildroot] [PATCHv2/next 0/4] DEVELOPERS file and get-developer
	tool
Message-ID: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the second iteration of this patch series.

Changes since v1
================

 - Took into account comments received on the DEVELOPERS file,
   specifically:

   * Baruch isn't taking care of wireshark, Gustavo is.
   * Bernd isn't taking care of pjsip, Luca is.
   * Luca is not taking care of ffmpeg and linphone.
   * Added Chris Packham as the micropython-lib and syslog-ng
     developer, upon his request.

 - Thanks to the comment from Chris Packham, found many more Git
   commits adding packages, and used that to further extend the
   DEVELOPERS final with a bunch of additional entries. This reduces
   the number of unassigned files from 3458 to 3016 (on a total of
   8543). Of course, many packages have been added a long time ago,
   and their original submitter is no longer active. This is something
   we will adjust progressively, as we determine which developers are
   active on a given package.

 - Improved the getdeveloperlib.py library to check if the patterns in
   the "F:" entries of the DEVELOPERS file actually match existing
   files/directories.

Also, today's autobuilder e-mail to the mailing list has been sent
using the new Python script
(https://git.buildroot.org/buildroot-test/tree/utils/daily-mail), and
individual developers have received notifications about build failures
related to their architectures and packages.

Original introduction for the patch series
==========================================

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

 DEVELOPERS                         | 1542 ++++++++++++++++++++++++++++++++++++
 docs/manual/contribute.txt         |   12 +-
 docs/manual/developers.txt         |   45 ++
 docs/manual/manual.txt             |    2 +
 support/scripts/get-developers     |   83 ++
 support/scripts/getdeveloperlib.py |  201 +++++
 6 files changed, 1883 insertions(+), 2 deletions(-)
 create mode 100644 DEVELOPERS
 create mode 100644 docs/manual/developers.txt
 create mode 100755 support/scripts/get-developers
 create mode 100644 support/scripts/getdeveloperlib.py

-- 
2.7.4
