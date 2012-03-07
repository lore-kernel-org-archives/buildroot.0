From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:00 +0100
Subject: [Buildroot] [RFC v2 00/31] Automatically produce legal compliance
	info
Message-ID: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

during the latest two Buildroot Developers Days (in November 2011 and February
2012) and in this mailing list there has been some discussion about introducing
in Buildroot the possibility to automatically derive legally relevant material,
such as licensing info and source tarballs for open source packages.

I have submitted a first tentative RFC implementation of these features back in
late January
(http://lists.busybox.net/pipermail/buildroot/2012-January/049590.html).

This second RFC incorporates many of the additions and modifications that have
been discussed, as well as many other improvements. Thanks Arnout, ThomasDS and
others for their review, and the BDD participants for their suggestions.

This code is now fully working, meaning that the core features are there and
those things that cannot be handled produce big fat warnings.
I think this code does not need big changes before being merged (unless your
review is catastrophic).

However I hit a few issues that still need to be sorted out, see the "ISSUE"
sections below.

My approach is based on two per-package constants in eack .mk file, such as:
  FOOBAR_LICENSE = GPLv3 + LGPLv2.1
  FOOBAR_LICENSE_FILES = COPYING.LGPL demo-app/COPYING.GPL3
or:
  MYAPP_LICENSE = PROPRIETARY
  # MYAPP_LICENSE_FILES not relevant in this case
This is the only effort required to the package creator. If <PKG>_LICENSE is
not specified it defaults to "unknown".

After running 'make legal-info', the following things will be produced in
$(O)/legal-info/:
  $ find legal-info/ -type f
  legal-info/README            # Lists saved stuff, warns about unsaved stuff
  legal-info/licenses.txt      # Text of all licenses
  legal-info/buildroot.config  # The buildroot config
  legal-info/licenses/buildroot/COPYING       # License files, one dir per pkg
  legal-info/licenses/busybox/LICENSE         # ...
  legal-info/licenses/...other packages...    # ...
  legal-info/manifest.csv                     # CSV table summarizing all info
  legal-info/sources/busybox-1.19.4.tar.bz2   # tarballs
  legal-info/sources/kmod-5.tar.xz            # ...
  legal-info/sources/libtool-2.2.10.tar.gz    # ...
  legal-info/sources/...other packages...     # ...

Given the technical difficulties, the toolchain and the BR sources are not
saved. Warnings are generated to make sure the user is aware of this.

Following is an explanation of the open issues and future development
directions. Actually issue 3 is the one where I mostly would like to have
comments, so you may skip to it if your time is limited. Otherwise seat down
comfortably and read on.


ISSUE 1: the License Repository Feature
=======================================

The original idea that came out of the last Buildroot Developer Day was to
maintain in BR a "license repository" holding those licenses that are used
without change by many projects, such as the GPL family.
Packages that cannot use this mechanism would need to explicitly define the
license file in <PKG>_LICENSE_FILES.

The idea of implementation was:
  if (<PKG>_LICENSE_FILES defined):
    copy $(<PKG>_LICENSE_FILES)
  else if (<PKG>_LICENSE = *GPL*, or any other known that's always equal):
    copy file from a "license repo dir" (one copy only per file);
  else:
    copy nothing and warn user

Unfortunately, as Will Moore also pointed out, I discovered that the same
license (e.g. GPLv2) is not always identical between two packages, although
the differences might be not substantial.

I do not have precise figures, but the number of variations might be quite
large. In a config with ~25 packages enabled I got this:
  $ make external-deps|wc -l
  39
  $ find . -iname "COPYING*" -o -iname "LICENSE*" | \
    xargs grep -l 'Version 2,' | xargs md5sum | \
    awk '{print $1}'|sort|uniq|wc -l
  20

These are 20 different GPLv2 files! Some only have whitespace changes, some
have other little differences. An example:

  $ diff -u0 -b  ./binutils-2.21.1/COPYING ./libtool-2.2.10/COPYING
  --- ./binutils-2.21.1/COPYING	2005-07-14 03:24:56.000000000 +0200
  +++ ./libtool-2.2.10/COPYING	2010-05-20 23:18:41.000000000 +0200
   @@ -4 +4 @@
   - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
   + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,

An added comma.

   @@ -18 +18 @@
   -the GNU Library General Public License instead.)  You can apply it to
   +the GNU Lesser General Public License instead.)  You can apply it to

This updates a reference to another license.

  @@ -306,4 +306,3 @@
  -    You should have received a copy of the GNU General Public License
  -    along with this program; if not, write to the Free Software
  -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  -
  +    You should have received a copy of the GNU General Public License along
  +    with this program; if not, write to the Free Software Foundation, Inc.,
  +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Just formatting changes here.

  @@ -339 +338 @@
  -library.  If this is what you want to do, use the GNU Library General
  +library.  If this is what you want to do, use the GNU Lesser General

Same as above.

Another example:

  $ diff -u0 -b  ./binutils-2.21.1/COPYING  ./iostat-2.2/LICENSE 
  --- ./binutils-2.21.1/COPYING	2005-07-14 03:24:56.000000000 +0200
  +++ ./iostat-2.2/LICENSE	2004-11-25 11:53:11.000000000 +0100
  @@ -5 +5 @@
  -     51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  +     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Apparently the FSF offices have moved some time in the past.

  @@ -308 +308 @@
  -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  +    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Same as above.

I did not investigate a lot to discover if there are more substantial
differences. I wanted to stay on the safe side, so I just did not implement the
"license repository" and the second step of the algorithm. All packages that
want their license files copied must define <PKG>_LICENSE_FILES. Full stop.

The license repository feature may still be added in the future, but I think
it should be discussed before. Asking the FSF may be an option, I guess they
listen to an active community developing free software.


ISSUE 2: Packages with multiple licenses
========================================

Some packages (e.g. freetype, qt) allow to choose among different licenses.
- Should we add an option in menuconfig for choosing the license? This would
  allow to generate "customized" manifest and license files.
- Or should we save all licenses and and define the package license as, for
  instance:
    QT_LICENSE = GPLv3 or LGPLv2.1 or COMMERCIAL?

I think the first option is more nice and still legally correct, so I
implemented it for Qt to see how it would look. You can see the implementation
in a patch near the bottom of this set. It's not currently documented at all,
I'd first like to know if the approach is good or option 2 (or whatever else)
is better.


ISSUE 3: packages without a license file
========================================

Some packages (e.g. tslib) do not have a license file. Instead, the license is
written in a comment at the top of one or more source files. In such cases we
planned that the package maintainer would manually copy this text into a file
in the package directory (where the .mk lives) and the teach the infrastructure
where it is, so it gets copied from there.

I haven't started working on an implementation of this feature yet, but at
first sight it's not totally trivial. The problem is the <PKG>_LICENSE_FILES
definition as it is implemented in the present RFC does not easily allow to
discriminate between a file in $(O)/build/<pkg>-<ver>/ and a file in
packages/<pkg>/.

This is how it works now:
        @cp $(addprefix $$($(2)_DIR)/,$$($(3)_LICENSE_FILES)) \
                $(LICENSE_FILES_DIR)/$$($(3)_NAME)/
It assumes the files are in the package build dir, $(2)_DIR, which allows a
very simple and clean implementation.

In order to support a copy from the package directory, option 1 is to define
the full path in <PKG>_LICENSE_FILES, and remove the addprefix from the above
code snipped. Example:
  FOO_LICENSE_FILES = $(BUILD_DIR)/foo-$(FOO_VERSION)/COPYING
  BAR_LICENSE_FILES = packages/bar/COPYING
which is not very pleasant to read, and is quite error-prone for the developer
adding a package.

Option 2 would be to have two distinct constants for the two cases:
  FOO_LICENSE_FILES_IN_BUILD_DIR = COPYING
  BAR_LICENSE_FILES_IN_PACKAGE_DIR = COPYING
Even with better constant names this would not be extremely beautiful IMHO.

Option 3 is to wait for a smarter idea coming from your reviews! :)


TODO in the next patchset before merging into mainline
======================================================

- Add to the documentation:
  - some words of advice from Buildroot developers about how to comply to GPL
    and other open source licenses;
  - brief instructions on using this stuff ('make legal-info');
 - instructions in the GENTARGETS section about the _LICENSE and _LICENSE_FILES
   constants.

- Write a few lines of explanation in the log message of the first big commit,
  the one that implements all the logic.

- Save a defconfig instead of the whole .config for the Buildroot configuration?
  Which one would you better like?


POSSIBLE FUTURE IMPROVEMENTS
============================

IMHO these should be planned after the merge of the first core functionality:
I would like to keep it as simple as possible for a first step.

- How to handle local and override packages?
  - Modify the -source target (_DOWNLOAD macros) to produce tarball?
    But adds a lot of work for normal builds that is used only rarely.
  - Modify the legal-info stuff to re-download them and make a tarball?
  - Assume they are not / almost never used in production and just save
    nothing? Meaning just like the present patchset does, generating a warning.
    My vote here.

- The toolchain is not currently saved (internal, external, ct-NG, no
  discrimination). Actually, only GENTARGETS-based packages are handled, so the
  best approach might be to "simply" migrate the toolchains to GENTARGETS.

- Save the Buildroot sources too. If the sources are not a git clone this might
  be as simple as tar of the current directory and exclude dl and output, but
  this has never been tested. Also, make sure this works for out-of-tree BR
  builds.

- Add a hook for a post-legal-info script.


SHOW US THE CODE NOW
====================

Ok, the patches are there.
- The implementation is all in the first commit.
- A few patches follow to make non-GENTARGETS packages warn about their
  dumbness.
- Other commits define licenses for some packages.
- A couple of support commits (for testing only) closes the series.

Changed in v2:
- squashed together patches 1-4 from RFC v1; now all the legal-info mechanism
  is implmented in a unique patch.
- rebase on top of current master
- don't clean $(REDIST_SOURCES_DIR): it is a subdir of $(LEGAL_INFO_DIR), so
  doesn't need to be cleaned twice
- added legal-info-clean target
- made legal-info target .PHONY
- remove the output/legal-info dir before populating it
- when saving source tarballs, create hardlinks instead of copies if possible
- add infrastructure to warn the user about info that has not been saved: a
  .warnings file is filled with such info and displayed to the user at the
  end of the legal-info processing
- ensure manual (non-GENTARGETS-based) packages return error, at least; this
  required to explicitly create a -legal-info target for each of them, or
  they would have been silently skipped.
- list also Buildroot in the manifest file! :)
- save the Buildroot .config
- save license files listed in <PKG>_LICENSE_FILES, both in a separate
  directory for each package and all together in a unique file
- various cleanups.

Luca

Luca Ceresoli (31):
  legal-info: infrastructure to collect legally-relevant material
  cups: warn that legal-info is not implemented
  fis: warn that legal-info is not implemented
  doom-wad: warn that legal-info is not implemented
  gettext: warn that legal-info is not implemented
  microperl: warn that legal-info is not implemented
  netkitbase: warn that legal-info is not implemented
  netkittelnet: warn that legal-info is not implemented
  newt: warn that legal-info is not implemented
  tinyhttpd: warn that legal-info is not implemented
  ttcp: warn that legal-info is not implemented
  uemacs: warn that legal-info is not implemented
  vpnc: warn that legal-info is not implemented
  xfsprogs: warn that legal-info is not implemented
  mpc: define license
  linux: define license
  m4: define license
  busybox: define license
  bzip2: define license
  directfb: define license
  iostat: define license
  lzo: define license
  lzop: define license
  tslib: define license
  libusb: define license
  pcre: define license
  netsnmp: define license
  berkeleydb: define license
  qt: define license choice
  foobar: create a fake proprietary package (testing only)
  Create test configs (testing only)

 Makefile                                  |   52 ++++++++++++++++++++++++-
 configs/legal_info_test2_defconfig        |    8 ++++
 configs/legal_info_test_defconfig         |   20 ++++++++++
 linux/linux.mk                            |    2 +
 package/Config.in                         |    1 +
 package/Makefile.package.in               |   59 +++++++++++++++++++++++++++++
 package/berkeleydb/berkeleydb.mk          |    2 +
 package/busybox/busybox.mk                |    2 +
 package/bzip2/bzip2.mk                    |    2 +
 package/cups/cups.mk                      |    4 ++
 package/directfb/directfb.mk              |    2 +
 package/fis/fis.mk                        |    4 ++
 package/foobar/Config.in                  |    5 ++
 package/foobar/foobar.mk                  |   15 +++++++
 package/foobar/source/foobar.c            |    7 +++
 package/games/doom-wad/doom-wads.mk       |    4 ++
 package/gettext/gettext.mk                |    4 ++
 package/iostat/iostat.mk                  |    2 +
 package/libusb/libusb.mk                  |    2 +
 package/lzo/lzo.mk                        |    2 +
 package/lzop/lzop.mk                      |    2 +
 package/m4/m4.mk                          |    2 +
 package/microperl/microperl.mk            |    4 ++
 package/mpc/mpc.mk                        |    2 +
 package/netkitbase/netkitbase.mk          |    4 ++
 package/netkittelnet/netkittelnet.mk      |    4 ++
 package/netsnmp/netsnmp.mk                |    2 +
 package/newt/newt.mk                      |    4 ++
 package/pcre/pcre.mk                      |    2 +
 package/qt/Config.in                      |   15 +++++++
 package/qt/qt.mk                          |    9 ++++
 package/tinyhttpd/tinyhttpd.mk            |    4 ++
 package/tslib/tslib.mk                    |    2 +
 package/ttcp/ttcp.mk                      |    4 ++
 package/uemacs/uemacs.mk                  |    4 ++
 package/vpnc/vpnc.mk                      |    4 ++
 package/xfsprogs/xfsprogs.mk              |    4 ++
 support/legal-info/README.header          |   24 ++++++++++++
 support/legal-info/README.warnings-header |    4 ++
 39 files changed, 296 insertions(+), 3 deletions(-)
 create mode 100644 configs/legal_info_test2_defconfig
 create mode 100644 configs/legal_info_test_defconfig
 create mode 100644 package/foobar/Config.in
 create mode 100644 package/foobar/foobar.mk
 create mode 100644 package/foobar/source/foobar.c
 create mode 100644 support/legal-info/README.header
 create mode 100644 support/legal-info/README.warnings-header

-- 
1.7.5.4
