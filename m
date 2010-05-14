From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 13:37:23 +0200
Subject: [Buildroot] [pull request] Pull request for branch 2010-05-14-fixes
Message-ID: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are a few fixes for Buildroot. The two first patches are more
invasive than usual fixes, but they are needed to make glibc external
toolchains work properly with packages relying on gettext. The
proposed solution replaces the ugly "hack" submitted to fix grep a few
days ago.

I have tested these changes by compiling a Buildroot configuration
with busybox ltrace flex libcgicc avahi gmpc grep hal libglib2 libidn
libsoup make libmpd php php_ext_gettext psmisc util-linux (packages
affected by the changes), with the four following toolchains:

 * External ARM glibc CodeSourcery toolchain

 * External ARM Buildroot uClibc no-locale toolchain

 * External ARM Crosstool-NG eglibc toolchain

 * Internal ARM Buildroot uClibc locale toolchain

Thomas

The following changes since commit 6d1ab151cb4a14a6ca29e692de26fefd2f453d0a:
  Peter Korsgaard (1):
        update for 2010.05-rc2

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot 2010-05-14-fixes

Thomas Petazzoni (8):
      Add a BR2_NEEDS_GETTEXT option
      Make all package using gettext rely on BR2_NEEDS_GETTEXT
      libcap: fix build failure
      libcgicc: fix package after autotools infrastructure conversion
      ltrace: fix build failure
      gettext: make only available if BR2_NEEDS_GETTEXT is set
      avahi: needs IPv6
      external toolchain: check BR2_INSTALL_LIBSTDCPP

 package/avahi/Config.in                            |    5 +++--
 package/avahi/avahi.mk                             |    2 +-
 package/gettext/Config.in                          |    2 ++
 package/gmpc/Config.in                             |    4 ++--
 package/gmpc/gmpc.mk                               |    3 ++-
 package/grep/Config.in                             |    4 ++--
 package/grep/grep.mk                               |    2 +-
 package/hal/Config.in                              |    4 ++--
 package/hal/hal.mk                                 |    2 +-
 package/libcap/libcap.mk                           |    4 ++--
 ...cgicc-3.2.9-disable-documentation-option.patch} |    0
 package/libcgicc/libcgicc.mk                       |    2 ++
 package/libglib2/Config.in                         |    4 ++--
 package/libglib2/libglib2.mk                       |    2 +-
 package/libidn/libidn.mk                           |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/ltrace/ltrace.mk                           |    3 +--
 package/make/Config.in                             |    4 ++--
 package/make/make.mk                               |    2 +-
 package/multimedia/libmpd/Config.in                |    2 --
 package/pango/pango.mk                             |    2 +-
 package/php/Config.ext                             |    2 +-
 package/php/php.mk                                 |    2 +-
 package/psmisc/Config.in                           |    4 ++--
 package/psmisc/psmisc.mk                           |    8 +-------
 package/sshfs/Config.in                            |    4 ++--
 package/sshfs/sshfs.mk                             |    2 +-
 package/util-linux/Config.in                       |    4 ++--
 package/util-linux/util-linux.mk                   |    4 ++--
 toolchain/Config.in.2                              |    6 ++++++
 toolchain/external-toolchain/ext-tool.mk           |   12 ++++++++++++
 31 files changed, 60 insertions(+), 45 deletions(-)
 rename package/libcgicc/{cgicc-3.2.9-disable-documentation-option.patch => libcgicc-3.2.9-disable-documentation-option.patch} (100%)

Thanks,
-- 
Thomas Petazzoni
