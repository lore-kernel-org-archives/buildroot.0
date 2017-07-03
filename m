From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 14:44:54 +0200
Subject: [Buildroot] [PATCH 0/8] Remove /usr component from HOST_DIR
Message-ID: <20170703124502.26113-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

I've tested both internal and external toolchains, and a large number
of host packages after these changes, including the target packages
that depend on them. That turned up one problem: libsepol, which
creates a symlink that is no longer valid after the move. Fortunately
that could be fixed in an independent patch. So after this series
(and at any point in between) everything seems to work fine still.

This is only the first part of the cleanup. It still needs to be
followed by about 45 patches to remove the /usr part from all packages.
I'm waiting with rebasing and posting that part because it is very
fragile w.r.t. merge conflicts.

I also noticed a small issue in pkg-rebar, so I added an additional
patch in the very beginning of the series that fixes it. It's totally
independent of the rest, however.

Regards,
Arnout


-----------------------------------------------------------------------------
Arnout Vandecappelle (8):
  pkg-rebar: remove redundant / in front of $($(PKG)_ERLANG_LIBDIR)
  libsepol: rework host installation
  Move $(HOST_DIR)/usr/$(GNU_TARGET_NAME) one level up.
  Move $(HOST_DIR)/usr/lib to $(HOST_DIR)/lib
  Eliminate $(HOST_DIR)/usr
  check-host-rpath: no longer check $(HOST_DIR)/usr/{bin,sbin}
  Makefile: remove $(HOST_DIR)/usr from BR_PATH
  package/Makefile.in: remove $(HOST_DIR)/usr part from HOST_LDFLAGS

 Makefile                                               | 11 ++++++++---
 package/Makefile.in                                    |  4 ++--
 package/libsepol/libsepol.mk                           | 13 ++++++++-----
 package/pkg-rebar.mk                                   |  6 +++---
 support/scripts/check-host-rpath                       |  8 +++++---
 toolchain/toolchain-external/pkg-toolchain-external.mk |  6 +++---
 toolchain/toolchain-wrapper.c                          |  2 +-
 7 files changed, 30 insertions(+), 20 deletions(-)

-- 
2.13.2
