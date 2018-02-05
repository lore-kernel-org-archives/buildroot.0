From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Feb 2018 22:10:10 +0100
Subject: [Buildroot] [PATCH v2 0/5] Add gdb 8.1 support,
 switch to 8.0 as default, drop old versions
Message-ID: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is just a respin of Romain's series on gdb, with only two
changes, but somewhat important ones:

 - An additional commit (first in the series) that reworks how the
   host and target gdb dependencies are handled. Indeed, switching to
   gdb 8.0 by default has a consequence, because it needs C++11
   support in the toolchain, and that breaks with how the dependencies
   were currently expressed. See the commit log of PATCH 1 for
   details.

 - In the patch bumping to 8.1, remove the MPFR handling that Romain
   did: it was not correct to bring host-mpfr as a dependency for the
   host gdb when the target mpfr package was enabled. Since mpfr
   support in gdb for the target is not needed (it's only used when
   host != target), we don't support that and pass --without-mpfr. For
   the host, we also pass --without-mpfr, as we don't support this
   optional feature for the moment.

 - The patch bumping to 8.1 is adjust afer the dependency changes.

 - All other patches are unchanged.

Thomas

Romain Naour (4):
  package/gdb: bump to version 8.1
  package/gdb: switch to 8.0 as the default version
  package/gdb: remove 7.10
  package/gdb: remove 7.11

Thomas Petazzoni (1):
  package/gdb: rework dependency for C++11

 Config.in.legacy           | 14 ++++++++++++++
 package/gdb/Config.in      | 15 +++++++++++++++
 package/gdb/Config.in.host | 21 ++++++++-------------
 package/gdb/gdb.hash       |  3 +--
 package/gdb/gdb.mk         |  4 +++-
 5 files changed, 41 insertions(+), 16 deletions(-)

-- 
2.14.3
