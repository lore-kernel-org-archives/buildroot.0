From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:53 +0200
Subject: [Buildroot] [PATCH 0/7] dependencies: ensure availability of
 host-tar, cleanups in graphs
Message-ID: <cover.1524301847.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings two major changes:

 1- consistency cleanups in the dependency graph

 2- ensure that host-tar is available when we need it

The first part, covering the first three patches, is mostly a cleanup
pass, to ensure the graph is not too cluttered, but yet does not miss
out any package. This is pretty trivial, except for the first patch,
which has a detailed commit log: in some conditions, we may have missed
packages from the dependency graph. We did not have that situation with
our internal packages so far, but the host-skeleton cut-off really
uncovered it: when a package with no dependency is also a cut-off
point (to avoid cluterring), and is not a top-level dependency, then
that package is not displayed in the dependency graph, not even as a
dependency of 'ALL'. Fixing is pretty trivial: add any newly-discovered
package asa dependency of 'ALL'; transitivity removal will clanup the
mess afterward.

The second part, not much more complex either, ensures that host-tar is
built and installed before a download backend, that _locally_ generates
a tarball, is called. When a package downloaded from a repository is
downloaded 'early' in the build process, it may well be so-downloaded
before host-tar was built, because host-tar is only an extract
dependency (so far), so the system tar is used, which may generate
archives that do not match the hash we have for them.

As such, a new type of dependency is added, that guarantees ordering
before the download step. Then, host-tar is added as a download
dependency to packages which site method is one of the repository-based
downloads that call to tar: cvs, git and svn (bzr and hg use their
internal tarball generator).

Finally, the filesystems are made to depend on host-tar when it is
needed, too, because we do generate the intermediate tarball, which is
then extracted by all filesystems.


Regards,
Yann E. MORIN.


The following changes since commit d5d305d40c9d65e0e51f4dfe6a43b4766a250bef

  libuv: bump to version 1.20.1 (2018-04-20 16:36:04 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 021f6b14835ca89bc6ecb4b36aa09fd246f7d896

  fs: always depend on build host-tar if needed (2018-04-21 11:05:58 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      support/graph-depends: ensure all packages get graphed
      support/graph-depends: also cut on host-skeleton
      support/graph-depends: also cut on host-tar
      core/package: postpone evaluation of dependency conditions
      core/package: add possibility to declare download dependencies
      core/package: add host-tar dependency for downloads from repositories
      fs: always depend on build host-tar if needed

 fs/common.mk                  |  1 +
 package/pkg-generic.mk        | 21 ++++++++++++++-------
 support/scripts/graph-depends | 19 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
