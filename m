From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2015 20:00:32 +0200
Subject: [Buildroot] [PATCH 0/9] Add gcc version dependency mechanism
Message-ID: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We are getting more and more packages that use C11 or C++11 support,
or otherwise have some dependency on features available only since
certain gcc versions.

While doing dependencies on the features themselves (like C++11
support, or C11 support) would be better, it is actually not very
practical: C++11 support has only been gradually introduced in gcc. So
while a certain version of gcc may have sufficient C++11 support for a
given package, it may not be the case for another package using more
advanced C++11 features, supported only in a later gcc version. Since
we don't want to add gazillions of gcc feature options, let's support
this by using gcc versions instead.

The patches are fairly straightforward and follow to the letter the
version dependency mechanism used for kernel headers.

The first four patches introduce the gcc version dependency mechanism
itself, the fifth patch solves the libsigrok build failures currently
affecting the autobuilders, and the last four patches refactor
existing packages to use the gcc version dependency mechanism.

This set of patches is also available at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=gcc-version

Thanks!

Thomas

Thomas Petazzoni (9):
  toolchain: add common gcc version hidden config options
  gcc: select the appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_* option
  toolchain-external: add support for gcc version dependency
  docs/manual: document gcc version dependencies
  libsigrok: depends on gcc >= 4.7
  upmpdcli: update to use the gcc version dependency mechanism
  zmqpp: update to use the gcc version dependency mechanism
  libupnpp: update to use the gcc version dependency mechanism
  mpd: update to use the gcc version dependency mechanism

 docs/manual/adding-packages-directory.txt          |  6 ++
 package/gcc/Config.in.host                         |  7 +++
 package/libsigrok/Config.in                        | 11 ++--
 package/libupnpp/Config.in                         | 11 +---
 package/mpd/Config.in                              |  9 +--
 package/pulseview/Config.in                        |  9 +--
 package/sigrok-cli/Config.in                       |  6 +-
 package/upmpdcli/Config.in                         | 15 +----
 package/zmqpp/Config.in                            | 11 ++--
 toolchain/helpers.mk                               | 22 +++++++
 toolchain/toolchain-common.in                      | 44 ++++++++++++++
 toolchain/toolchain-external/Config.in             | 70 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  2 +
 13 files changed, 175 insertions(+), 48 deletions(-)

-- 
2.5.0
