From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 08:48:24 +0200
Subject: [Buildroot] [PATCH] ncftp: use tar.gz to workaround upstream
	changing tarball post-release
Message-ID: <20170426064824.18049-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As explained here:
http://lists.busybox.net/pipermail/buildroot/2017-March/185550.html

Upstream has silently updated their 3.2.6 tarball some time between our
version bump in late November and December 4th.  The changed tarball also
contains a significant amount of source changes:

 libncftp/c_opennologin.c  |    4
 libncftp/ftp.c            |   31
 libncftp/ftw.c            |    2
 libncftp/io_getmem.c      |    2
 libncftp/io_list.c        |    6
 libncftp/io_sendfile.c    |    4
 libncftp/io_util.c        |    4
 libncftp/ncftp.h          |    2
 libncftp/open.c           |    4
 libncftp/rftw.c           |    2
 libncftp/rglobr.c         |    2
 libncftp/u_decodehost.c   |    2
 libncftp/u_decodeurl.c    |    2
 libncftp/u_getpass.c      |    2
 libncftp/u_misc.c         |    2
 libncftp/u_pathcat.c      |    4
 libncftp/u_scram.c        |    2
 libncftp/wincfg.h         |    1
 ncftp/cmds.c              |   38 -
 ncftp/gl_getline.c        |   26
 ncftp/ls.c                |    9
 ncftp/ls.h                |    9
 ncftp/progress.c          |    9
 ncftp/readln.c            |    4
 ncftp/shell.h             |   10
 ncftp/spoolutil.c         |    8
 ncftp/version.c           |    2
 sh/mksrctar.sh            |    1
 sh_util/gpshare.c         |   12
 sh_util/ncftpbatch.c      |  110 --
 sh_util/ncftpget.c        |    6
 sh_util/ncftpls.c         |    5
 sh_util/ncftpput.c        |   14
 sio/DNSUtil.c             |    4
 sio/Makefile.in           |   16
 sio/SBind.c               |   35
 sio/SConnect.c            |    9
 sio/SNew.c                |  115 ---
 sio/SRead.c               |    6
 sio/StrAddr.c             |    6
 sio/config.h.in           |   24
 sio/configure.in          |    8
 sio/sio.h                 |   18
 sio/wincfg.h              |    1
 vis/bmed.c                |   13
 vis/wgets.c               |   12
 vis/wgets.h               |    7
 vis/wutil.c               |    6
 vis/wutil.h               |    6

Upstream has been contacted to verify if this change was intentional and the
reason why. From the mail:

> Is this update intentional? Why was the tarball regenerated?

Yes.

The old hash was unfortunately already used in the 2017.02 (and .1)
releases, so just changing the hash and updating the tarball on
sources.buildroot.org would break ncftp for users of those releases.
Instead change to use the .tar.gz tarball as suggested by Arnout.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/ncftp.hash | 2 +-
 package/ncftp/ncftp.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 0a7c26c9b..f6f731015 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 7abd3e8f848f0efb4bb6a4bc5da58a59524d4378fc8d70a52adb0fe1fd00b89d  ncftp-3.2.6-src.tar.xz
+sha256 129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23  ncftp-3.2.6-src.tar.gz
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 11bfccaa2..816e0f1d4 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -5,7 +5,9 @@
 ################################################################################
 
 NCFTP_VERSION = 3.2.6
-NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
+# use .gz as upstream .xz tarball has changed after the hash was added for
+# 2017.02. Can be changed back to .xz when version is bumped
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
 NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
-- 
2.11.0
