From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Dec 2010 20:16:22 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.02/fix-ccache-support
Message-ID: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[ Sorry, previous pull request had some mistakes. ]

Here is a patch that reworks the ccache support to make it work and
make it useful. It is now a "Build options" rather than a "Toolchain
option". I have tested it with both internal toolchain and external
toolchain. The principle is simply to build ccache as early as
possible in the build process, and then use it to cache host and
target compiled files.

The ccache cache is kept in ~/.buildroot-ccache/, so that it can be
shared between different builds.

I'm not using the symlink technique that was used in the past, but
rather prefixing all invocation to host gcc and target gcc with
"$(HOST_DIR)/usr/bin/ccache".

Here are some speed-up results :

 *) First test on my laptop (dual core, 2 GB of RAM), using an ARM
    external toolchain, building Busybox and a couple of packages.

     -> ccache disabled:            5 minutes 29 seconds
     -> ccache enabled, cold cache: 5 minutes 47 seconds
     -> ccache enabled, hot cache:  3 minutes 40 seconds

    The test with "cold cache" is done after removing
    ~/.buildroot-ccache/. The test with "hot cache" is done after
    cleaning up the Buildroot build tree, but keeping the cache of the
    previous build.

    Here we see that ccache has a little cost, but that once the cache
    is hot from previous builds, the build speed-up is interesting.

 *) Second test on my build server (quad core i7, 12 GB of RAM), using
    an ARM internal toolchain, building Busybox and an ext2
    filesystem.

     -> ccache disabled:             7 minutes 10 seconds
     -> ccache enabled, cold cache:  5 minutes 43 seconds
     -> ccache enabled, hot cache:   4 minutes 24 seconds

    In this case we see that even when the cache is cold, ccache is
    useful. It's probably because gcc gets recompiled twice during the
    toolchain build process.

Regards,

Thomas

The following changes since commit 7e9c3a387820154fd1355f23c2669072c0c3a5f7:
  Peter Korsgaard (1):
        docs/news.html: add 2010.11 announce link

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/fix-ccache-support

Thomas Petazzoni (1):
      ccache: rework ccache management

 Config.in                                |    8 ++
 Makefile                                 |   27 +++-
 docs/buildroot.html                      |   26 ++++
 package/Config.in                        |    2 +-
 package/Makefile.in                      |   10 ++-
 package/ccache/Config.in                 |    5 +
 package/ccache/ccache.mk                 |   32 +++++
 toolchain/ccache/Config.in               |   16 ---
 toolchain/ccache/Config.in.2             |   13 --
 toolchain/ccache/ccache.mk               |  196 ------------------------------
 toolchain/dependencies/dependencies.sh   |    2 +-
 toolchain/toolchain-buildroot.mk         |    1 -
 toolchain/toolchain-buildroot/Config.in  |    1 -
 toolchain/toolchain-crosstool-ng.mk      |    1 -
 toolchain/toolchain-external.mk          |    1 -
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 16 files changed, 103 insertions(+), 240 deletions(-)
 create mode 100644 package/ccache/Config.in
 create mode 100644 package/ccache/ccache.mk
 delete mode 100644 toolchain/ccache/Config.in
 delete mode 100644 toolchain/ccache/Config.in.2
 delete mode 100644 toolchain/ccache/ccache.mk

Thanks,
-- 
Thomas Petazzoni
