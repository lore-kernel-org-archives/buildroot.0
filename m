From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 22:23:28 +0200
Subject: [Buildroot] [PATCHv2 0/6] gettext improvements
Message-ID: <1401654214-19384-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series is an extension of the gettext/host-gettext speedup
patch series sent previously.

The first three patches are almost identical, with just a few minor
changes:

 - Improved the prompt of the Config.in.legacy option in "gettext:
   remove support for gettext-tools on target", as suggested by Thomas
   DS.
 - Remove the --disable-tools option from gettext configure options,
   as suggested by Baruch.
 - Add Tested-by tags from Andrew Ruder

Those first three patches can be applied without looking at the last
three patches, which are not directly related.

The last three patches fix a situation that our gettext handling was
not handling. We were assuming that gettext was *never* necessary for
glibc-based builds. However, it turns out that certain programs (for
example ecryptfs-utils) need the 'gettext' binary program on the
target to get translated strings. It is used in shell scripts in
ecryptfs-utils. This was reported at
https://bugs.busybox.net/show_bug.cgi?id=7136 and discussed on IRC
with the bug submitter, who tested the proposed patches and confirmed
that they work.

The approach is to allow the gettext package to be built even with
glibc toolchains. In this case, the gettext-runtime configure script
detects that it's not necessary to build libintl, and therefore only
the gettext utilities are built and installed on the target. Of
course, only packages that need this will select gettext
unconditionally (i.e without depending on BR2_NEEDS_GETTEXT or
BR2_NEEDS_GETTEXT_IF_LOCALE). This is a quite sensitive change, but I
believe it's good to do it early in the development cycle.

Thomas

Thomas Petazzoni (6):
  minidlna: do not select BR2_PACKAGE_GETTEXT_TOOLS
  gettext: remove support for gettext-tools on target
  gettext: optimize build time
  gettext: allow building when BR2_NEEDS_GETTEXT is not selected
  ecryptfs-utils: select gettext, needed for command line utilities
  docs/manual: update documentation about gettext handling

 Config.in.legacy                                   | 12 +++++++
 docs/manual/adding-packages-gettext.txt            | 22 +++++++++---
 package/ecryptfs-utils/Config.in                   |  8 +++--
 package/gettext/Config.in                          | 15 --------
 .../gettext-03-option-to-disable-tools.patch       | 42 ----------------------
 .../gettext/gettext-04-remove-examples-tests.patch | 20 -----------
 package/gettext/gettext.mk                         | 30 ++++++++--------
 package/minidlna/Config.in                         |  1 -
 8 files changed, 52 insertions(+), 98 deletions(-)
 delete mode 100644 package/gettext/gettext-03-option-to-disable-tools.patch
 delete mode 100644 package/gettext/gettext-04-remove-examples-tests.patch

-- 
1.9.3
