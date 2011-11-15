From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 Nov 2011 09:33:38 +0100
Subject: [Buildroot] RFC: package patching
Message-ID: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The current automatic patching of packages based on files in
package/foo is not very nice.

01:        if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
02:          if test "$(wildcard
$($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
03:            support/scripts/apply-patches.sh $(@D)
$($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch
$(NAMEVER)\*.patch.$(ARCH) || exit 1; \
04:          else \
05:            support/scripts/apply-patches.sh $(@D)
$($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch
$(RAWNAME)\*.patch.$(ARCH) || exit 1; \
06:            if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
07:              support/scripts/apply-patches.sh $(@D)
$($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH)
|| exit 1; \
08:            fi; \
09:          fi; \
10:        fi; \
11:        )

The current principles are as follows (assume we are patching package
foo with version 1.2.3):

* if there are patches package/foo/foo-1.2.3-something.patch, apply
those, and stop.
* if there are no such files, apply any patch of the form
package/foo/foo-something.patch, and
* check whether there is a directory package/foo/foo-1.2.3, and apply
all patches therein.

Here are some problems with this approach:

1. package/foo/foo-1.2.3.patch cannot co-exist with any other type of
patch, like package/foo/foo-common-change.patch or
package/foo/foo-1.2.3/something.patch. Whenever the first type exists,
none of the others will be applied.

2. it is not possible to hold a patch for a previous version while
there is no patch at all for the current version, unless you move it
to a foo-xyz subdirectory. If you have
package/foo/foo-1.2.2-backport.patch while the current version is
1.2.3 but has no specific patches, then the if on line 02 above will
be false, and line 05 will apply any patch that starts with 'foo' and
ends with '.patch', including foo-1.2.2-backport.patch, which it
shouldn't.


I think we should try and improve this.

A first approach could be to simply remove support for
foo-1.2.3-something.patch, and require version-specific patches to be
in a versioned subdirectory, package/foo/foo-1.2.3. For this, we
should remove line 02-04. In this case, common patches are applied
first, followed by versioned patches in subdirectories.

Alternatively, we can continue to support foo-1.2.3.patch, but we'll
have to make sure that this form is not matched by line 05, to fix
problem 2. Additionally, the mutual exclusivity of line 03 versus
lines 05-07 should be removed.

Comments are welcome.

Best regards,
Thomas
