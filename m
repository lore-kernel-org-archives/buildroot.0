From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 19:08:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libgit2: security
 bump to version 0.27.10
Message-ID: <20191223180003.CE7EE8DFC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f2e1f3fbe0e8a5c13dc849eded3f7c0b7c5692c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following CVE:

- CVE-2019-1351: Windows provides the ability to substitute
  drive letters with arbitrary letters, including multi-byte
  Unicode letters. To fix any potential issues arising from
  interpreting such paths as relative paths, we have extended
  detection of DOS drive prefixes to accomodate for such cases.

- CVE-2019-1352: by using NTFS-style alternative file streams for
  the ".git" directory, it is possible to overwrite parts of the
  repository. While this has been fixed in the past for Windows,
  the same vulnerability may also exist on other systems that
  write to NTFS filesystems. We now reject any paths starting
  with ".git:" on all systems.

- CVE-2019-1353: by using NTFS-style 8.3 short names, it was
  possible to write to the ".git" directory and thus overwrite
  parts of the repository, leading to possible remote code
  execution. While this problem was already fixed in the past for
  Windows, other systems accessing NTFS filesystems are
  vulnerable to this issue too. We now enable NTFS protecions by
  default on all systems to fix this attack vector.

- CVE-2019-1354: on Windows, backslashes are not a valid part of
  a filename but are instead interpreted as directory separators.
  As other platforms allowed to use such paths, it was possible
  to write such invalid entries into a Git repository and was
  thus an attack vector to write into the ".git" dierctory. We
  now reject any entries starting with ".git" on all systems.

libgit2 is not affected by these git CVE:

- CVE-2019-1348: the fast-import stream command "feature
  export-marks=path" allows writing to arbitrary file paths.

- CVE-2019-1349: by using NTFS 8.3 short names, backslashes or
  alternate filesystreams, it is possible to cause submodules to
  be written into pre-existing directories during a recursive
  clone using git.

- CVE-2019-1350: recursive clones may lead to arbitrary remote
  code executing due to improper quoting of command line
  arguments.

- CVE-2019-1387: it is possible to let a submodule's git
  directory point into a sibling's submodule directory, which may
  result in overwriting parts of the Git repository and thus lead
  to arbitrary command execution. As libgit2 doesn't provide any
  way to do submodule clones natively, it is not susceptible to
  this vulnerability. Users of libgit2 that have implemented
  recursive submodule clones manually are encouraged to review
  their implementation for this vulnerability.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 2d06c26d2d..8b3d57eadd 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	adf17310b590e6e7618f070c742b5ee028aeeed2c60099bc4190c386b5060de1  libgit2-0.27.9.tar.gz
+sha256	f6fd26378ff71bd7a4b17b576c82c774a2e9c2d6b74b24718a8fb29551e1c4a5  libgit2-0.27.10.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 25a93d72f3..e797ca5185 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 0.27.9
+LIBGIT2_VERSION = 0.27.10
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
