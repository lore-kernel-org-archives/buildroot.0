From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:50:29 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/git: security
 bump to version 2.16.6
Message-ID: <20191222204334.04CF28D784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c79f88dc8d4c3873037ae2475680c0fbc8a154c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

* CVE-2019-1348:
  The --export-marks option of git fast-import is exposed also via
  the in-stream command feature export-marks=... and it allows
  overwriting arbitrary paths.

* CVE-2019-1349:
  When submodules are cloned recursively, under certain circumstances
  Git could be fooled into using the same Git directory twice. We now
  require the directory to be empty.

* CVE-2019-1350:
  Incorrect quoting of command-line arguments allowed remote code
  execution during a recursive clone in conjunction with SSH URLs.

* CVE-2019-1351:
  While the only permitted drive letters for physical drives on
  Windows are letters of the US-English alphabet, this restriction
  does not apply to virtual drives assigned via subst <letter>:
  <path>. Git mistook such paths for relative paths, allowing writing
  outside of the worktree while cloning.

* CVE-2019-1352:
  Git was unaware of NTFS Alternate Data Streams, allowing files
  inside the .git/ directory to be overwritten during a clone.

* CVE-2019-1353:
  When running Git in the Windows Subsystem for Linux (also known as
  "WSL") while accessing a working directory on a regular Windows
  drive, none of the NTFS protections were active.

* CVE-2019-1354:
  Filenames on Linux/Unix can contain backslashes. On Windows,
  backslashes are directory separators. Git did not use to refuse to
  write out tracked files with such filenames.

* CVE-2019-1387:
  Recursive clones are currently affected by a vulnerability that is
  caused by too-lax validation of submodule names, allowing very
  targeted attacks via remote code execution in recursive clones.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 35c8774d75..c258abf3c4 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 dfb71b053cbc38a9c5b08c2fe8b5eae210b4e3b63892426923e10cfd6ba63862  git-2.16.5.tar.xz
+sha256 cd45502a4146d8e77f40cc64b3b484247e6165633bb024d7a9385a85f68e1d52  git-2.16.6.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index b1434fb7be..8866909cc8 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.16.5
+GIT_VERSION = 2.16.6
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
