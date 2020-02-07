From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  7 Feb 2020 16:14:24 +0100
Subject: [Buildroot] [PATCH 0/3] packages/exim: fix build failures
Message-ID: <20200207151427.12475-1-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exim is failing on the autobuilders since the version bump to 4.93 (commit
6038c3232acfdb: "package/exim: bump version to 4.93.0.3").

Commit 2c692e81a844b30b ("package/exim: fix host build") fixed one failure
when building the host tools, but we still have a similar ("'for' loop
initial declarations are only allowed in C99 mode") one when cross-building
target files.

In patch 1 I applied a similar fix (add -std=c99), but more failures
started appearing later in the build process.

I have not completely understood the new failures, yet with a couple of
patches it is now building. This is done in patch 2 but I'm not sure it is
a correct solution.

Finally another failure appeared. It is yet another
for-loop-initial-declaration error, but happens later in the install
step. This is fixed in patch 3 adding another -std=c99.

I cannot work on this issue for the next few days, so here are my patches,
as-is, in case anybody wants to have a look before 2020.02.

Luca

Luca Ceresoli (3):
  package/exim: fix target build on some toolchains
  package/exim: fix various build failures
  package/exim: fix build error during install step

 ..._lock-fix-lstat-related-build-errors.patch | 50 +++++++++++++++++++
 .../exim/0006-sieve-fix-build-errors.patch    | 41 +++++++++++++++
 package/exim/exim.mk                          |  7 ++-
 3 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch
 create mode 100644 package/exim/0006-sieve-fix-build-errors.patch

-- 
2.25.0
