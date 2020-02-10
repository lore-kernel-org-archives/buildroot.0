From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 10 Feb 2020 22:48:37 +0100
Subject: [Buildroot] [PATCH v2 0/3] packages/exim: fix build failures
Message-ID: <20200210214840.15023-1-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[changes since v1: added upstream status to patches]

exim is failing on the autobuilders since the version bump to 4.93 (commit
6038c3232acfdb: "package/exim: bump version to 4.93.0.3").

Commit 2c692e81a844b30b ("package/exim: fix host build") fixed one failure
when building the host tools, but we still have a similar ("'for' loop
initial declarations are only allowed in C99 mode") one when cross-building
target files. In patch 1 I applied a similar fix (add -std=c99) for taget
files.

Now new failures started appearing later in the build process. Patch 2 adds
two patches to fix them. They have been sent to mainline exim:
https://bugs.exim.org/show_bug.cgi?id=2523

With that fixes, another failure appeared. It is yet another
for-loop-initial-declaration error, but happens later in the install
step. This is fixed in patch 3 adding another -std=c99.

Now exim builds again... at least with the Sourcery CodeBench ARM 2014.05
toolchain.

Luca

Luca Ceresoli (3):
  package/exim: fix target build on some toolchains
  package/exim: fix various build failures
  package/exim: fix build error during install step

 ..._lock-fix-lstat-related-build-errors.patch | 51 +++++++++++++++++++
 .../exim/0006-sieve-fix-build-errors.patch    | 42 +++++++++++++++
 package/exim/exim.mk                          |  7 ++-
 3 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch
 create mode 100644 package/exim/0006-sieve-fix-build-errors.patch

-- 
2.25.0
