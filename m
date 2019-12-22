From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:41:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/git: security
 bump to version 2.22.2
Message-ID: <20191222204328.4EAA08D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac2ffc15fffe25360c1ee1e4532d7245a9a5cab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

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

* CVE-2019-19604:
  The git submodule update operation can lead to execution of arbitrary
  shell commands defined in the .gitmodules file
  https://gitlab.com/gitlab-com/gl-security/disclosures/blob/master/003_git_submodule/advisory.md

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index e02fd0d181..820c0bb6df 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 159e4b599f8af4612e70b666600a3139541f8bacc18124daf2cbe8d1b934f29f  git-2.22.0.tar.xz
+sha256 c21b15fc6f249b761c95a5ffebff88ba6a03f32f183288d530f9bde79c30610d  git-2.22.2.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index fdcb9aa54d..1bd403d4bf 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.22.0
+GIT_VERSION = 2.22.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
