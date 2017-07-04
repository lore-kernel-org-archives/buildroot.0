From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 Jul 2017 16:03:50 +0200
Subject: [Buildroot] [PATCH v3 00/14] Remove /usr component from HOST_DIR
Message-ID: <20170704140404.4098-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is the same as v2 (on which I forgot to add a version
number) but extended with a few more patches that are not fragile.
After this, there will be a series of patches doing automatic
replacement - these I will send only when they are ready to be
committed because they're pretty fragile to changes in the tree.


We currently use $(HOST_DIR)/usr as the prefix for host packages. That
has a few disadvantages:

- There are some things installed in $(HOST_DIR)/etc and
  $(HOST_DIR)/sbin, which is inconsistent.

- To pack a buildroot-built toolchain into a tarball for use as an
  external toolchain, you have to pack output/host/usr instead of the
  more obvious output/host.

- Because of the above, the internal toolchain wrapper breaks which
  forces us to work around it (call the actual toolchain executable
  directly). This is OK for us, but when used in another build system,
  that's a problem.

- Paths are four characters longer.

This series replaces all occurences of 'host/usr' (in its various forms)
with 'host', and updates relative paths accordingly.

To allow for a gradual change, host/usr is replaced with a symlink, so
that everything keeps working. Except that it turns out that not
everything keeps working when we do that: quite a few things need to
be fixed. Therefore that patch is split up into three steps:

- First $(HOST_DIR)/usr/$(GNU_TARGET_NAME) is moved one level up. This
  can be done safely (tested with both internal and external toolchain
  and building a few packages). The usr bit is removed from STAGING_DIR
  in the same patch, though it could have been split off.

- Next, $(HOST_DIR)/usr/lib is moved one level up. This can only be
  done after the first step, otherwise the internal toolchain fails to
  find ar, ld, etc. Also, when we do this, check-host-rpath has to be
  adapted to take into account the new location of the shared libs. The
  check-host-rpath change could have been partly split off in a
  separate patch, but then we'd have to check for either lib or
  usr/lib, and afterwards check only for lib again.

- Then we can move the entire host/usr one level up. At the same time,
  the ../.. in the external toolchain and toolchain wrapper has to be
  changed. Doing /bin and /sbin in a separate step still turns out not
  to be possible, again because of the internal toolchain that doesn't
  find cc1 etc. And it anyway wouldn't help much, because the ../..
  change has to be done in the same patch as moving the bin directory.

Next comes a long series of patches that clean things up. They are all
mostly independent from each other, although sometimes there will be
merge conflicts of course.

- The first three are things that were also covered by the automatic
  replacements, but required some additional fixups. So these are
  split up into patches that stand on their own. They are anyway also
  infrastructure changes so nicer to have in separate patches.

- Next we have two patches that fix the use of
  $(HOST_DIR)/usr/$(GNU_TARGET_NAME) in gcc and gdb. These could in
  fact come immediately after the move of that directory, but I thought
  it was nicer to keep all the cleanups together.

- Next come six patches that clean up the various infras.

After that will come the mechanical cleanups, and more patches to clean
up remaining issues.


I've tested both internal and external toolchains, and a large number
of host packages after these changes. That turned up one problem:
libsepol, which creates a symlink that is no longer valid after the
move. Fortunately that could be fixed in an independent patch.



Arnout Vandecappelle (14):
  Move $(HOST_DIR)/usr/$(GNU_TARGET_NAME) one level up.
  Move $(HOST_DIR)/usr/lib to $(HOST_DIR)/lib
  Eliminate $(HOST_DIR)/usr
  check-host-rpath: no longer check $(HOST_DIR)/usr/{bin,sbin}
  Makefile: remove $(HOST_DIR)/usr from BR_PATH
  package/Makefile.in: remove $(HOST_DIR)/usr part from HOST_LDFLAGS
  gdb: Remove /usr part from installation path of gdbserver
  gcc-final: things are no longer installed in $(HOST_DIR)/usr
  pkg-autotools: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
  pkg-cmake: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
  pkg-cmake: move configuration files out of $(HOST_DIR)/usr
  pkg-cmake: programs are now installed in $(HOST_DIR)/bin
  pkg-python: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
  pkg-rebar: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix

 Makefile                                               | 11 ++++++++---
 package/Makefile.in                                    |  4 ++--
 package/gcc/gcc-final/gcc-final.mk                     | 14 +++++++-------
 package/gdb/gdb.mk                                     |  2 +-
 package/pkg-autotools.mk                               |  2 +-
 package/pkg-cmake.mk                                   | 10 +++++-----
 package/pkg-python.mk                                  |  4 ++--
 package/pkg-rebar.mk                                   | 14 +++++++-------
 support/misc/toolchainfile.cmake.in                    |  6 +++---
 support/scripts/check-host-rpath                       |  8 +++++---
 toolchain/toolchain-external/pkg-toolchain-external.mk |  6 +++---
 toolchain/toolchain-wrapper.c                          |  2 +-
 toolchain/toolchain/toolchain.mk                       |  4 ++--
 13 files changed, 47 insertions(+), 40 deletions(-)

-- 
2.13.2
