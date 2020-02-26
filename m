From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:43:42 +0100
Subject: [Buildroot] [PATCH 0/2] Fix file listing logic for top-level
 parallel build
Message-ID: <20200226194345.1087529-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The current logic in pkg-generic.mk that calculates the list of files
installed by packages is not compatible with top-level parallel
build. Indeed, when package N-1 has been finished installing, we keep
a file that is then used after package N is installed to calculate
which files were installed by package N. This is inherently broken for
top-level parallel build, and we have seen build failures caused by
this in top-level parallel build mode.

For example:

  http://autobuild.buildroot.net/results/4e6/4e60fa31b1cd08bc7fdf9c5dd3a3f4941e029ba3/build-end.log

shows:

>>> capnproto 0.7.0 Installing to staging directory
comm: /home/giuliobenetti/autobuild/run/instance-0/output-1/build/.files-list-staging.new: No such file or directory
package/pkg-generic.mk:311: recipe for target '/home/giuliobenetti/autobuild/run/instance-0/output-1/build/c-ares-1.15.0/.stamp_staging_installed' failed

which is an example of that: the .new file has been deleted in the
mean time by another package being built.

This paytch series fixes that by making the installed file calculation
a per-package logic, until target-finalize which will use the
per-package file lists and gather them in a single global file list.

Thanks!

Thomas

Thomas Petazzoni (2):
  package/pkg-generic.mk: simplify step_pkg_size
  package/pkg-generic: make file list logic parallel build compatible

 Makefile               | 15 ++++------
 package/pkg-generic.mk | 65 +++++++++++++++++++-----------------------
 2 files changed, 36 insertions(+), 44 deletions(-)

-- 
2.24.1
