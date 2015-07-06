From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2015 18:12:55 +0200
Subject: [Buildroot] [git commit] pkg-autotools: fix patching libtool for
	version 2.4
Message-ID: <20150706162130.5B2B27FFEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9917e48d7eb5bc7fbbb0188872a32c11b4b67010
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the libtool used by the package is 2.4 (i.e. with no patchlevel), we
end up with error messages like this one, seen when building ntp-4.2.8p3:

    /bin/sh: line 0: test: 2.4: integer expression expected

That's because the current sed expression "[0-9].[0-9]." only deletes content
like "2.4.", so it leaves "2.4" (no patch level *and* no second period) intact,
resulting in an ltmain_patchlevel of "2.4", not empty, and not "0".  Then the
shell line goes bad, because the built in shell test -gt operates on integers
only, and fails on floating point numbers (like "2.4").

Additionally, the existing sed lines are problematic in other ways, because the
current expression "[0-9].[0-9]" will match "234" as well as "2.4", as an unescaped
period matches any character, not just a period.  Also, the lack of an asterisk
after the first character may be a problem in the future, if a two digit initial
number is used.

So, this patch changes the sed regex as follows:

* Match a string of digits when searching for a number.  I.e. "[0-9]*"
* Match specifically a period in between two numbers.  I.e. "\."
* When searching for a patch level, make the second period optional.  I.e. "\.*"

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 1d694f0..54f5dcd 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -61,9 +61,9 @@ define LIBTOOL_PATCH_HOOK
 	@$(call MESSAGE,"Patching libtool")
 	$(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
 		ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
-		sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+		sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'`; \
 		ltmain_patchlevel=`sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' $$i | \
-		sed -e 's/\([0-9].[0-9].\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
+		sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
 		if test $${ltmain_version} = '1.5'; then \
 			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 		elif test $${ltmain_version} = "2.2"; then\
