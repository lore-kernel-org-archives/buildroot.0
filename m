From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun,  5 Jul 2015 16:53:48 -0400
Subject: [Buildroot] [PATCH 1/1] pkg-autotools: fix patching libtool for
	version 2.4
Message-ID: <1436129628-3636-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---

For more detail, add "set -x" before the for-loop in pkg-autotools.mk, and
rebuild ntp, which currently will patch three libtool setups - "2.4", then
"2.4.2", then another "2.4".

First two loops, before fix - first loop results in the shell warning:

++ find /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ -name ltmain.sh
+ for i in '`find /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ -name ltmain.sh`'
++ sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ltmain.sh
++ sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'
+ ltmain_version=2.4
++ sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ltmain.sh
++ sed -e 's/\([0-9].[0-9].\)\([0-9]*\).*/\2/' -e 's/\"//'
+ ltmain_patchlevel=2.4
+ test 2.4 = 1.5
+ test 2.4 = 2.2
+ test 2.4 = 2.4
+ test 2.4 -gt 2
/bin/sh: line 0: test: 2.4: integer expression expected
+ support/scripts/apply-patches.sh /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3 support/libtool buildroot-libtool-v2.4.patch

Applying buildroot-libtool-v2.4.patch using patch:
patching file ltmain.sh
Hunk #1 succeeded at 1416 (offset -1 lines).
Hunk #2 succeeded at 2962 (offset -1 lines).
Hunk #3 succeeded at 5167 (offset -12 lines).
Hunk #4 succeeded at 5177 (offset -12 lines).
Hunk #5 succeeded at 5459 (offset -12 lines).
Hunk #6 succeeded at 5740 (offset -13 lines).
Hunk #7 succeeded at 6682 (offset -14 lines).
Hunk #8 succeeded at 9256 (offset -18 lines).
+ for i in '`find /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ -name ltmain.sh`'
++ sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/sntp/libevent/build-aux/ltmain.sh
++ sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'
+ ltmain_version=2.4
++ sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/sntp/libevent/build-aux/ltmain.sh
++ sed -e 's/\([0-9].[0-9].\)\([0-9]*\).*/\2/' -e 's/\"//'
+ ltmain_patchlevel=2
+ test 2.4 = 1.5
+ test 2.4 = 2.2
+ test 2.4 = 2.4
+ test 2 -gt 2
+ support/scripts/apply-patches.sh /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/sntp/libevent/build-aux support/libtool buildroot-libtool-v2.4.patch

After fix:

++ find /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ -name ltmain.sh
+ for i in '`find /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ -name ltmain.sh`'
++ sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ltmain.sh
++ sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'
+ ltmain_version=2.4
++ sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ltmain.sh
++ sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'
+ ltmain_patchlevel=
+ test 2.4 = 1.5
+ test 2.4 = 2.2
+ test 2.4 = 2.4
+ test 0 -gt 2
+ support/scripts/apply-patches.sh /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3 support/libtool buildroot-libtool-v2.4.patch

Applying buildroot-libtool-v2.4.patch using patch:
patching file ltmain.sh
Hunk #1 succeeded at 1416 (offset -1 lines).
Hunk #2 succeeded at 2962 (offset -1 lines).
Hunk #3 succeeded at 5167 (offset -12 lines).
Hunk #4 succeeded at 5177 (offset -12 lines).
Hunk #5 succeeded at 5459 (offset -12 lines).
Hunk #6 succeeded at 5740 (offset -13 lines).
Hunk #7 succeeded at 6682 (offset -14 lines).
Hunk #8 succeeded at 9256 (offset -18 lines).
+ for i in '`find /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/ -name ltmain.sh`'
++ sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/sntp/libevent/build-aux/ltmain.sh
++ sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'
+ ltmain_version=2.4
++ sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/sntp/libevent/build-aux/ltmain.sh
++ sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'
+ ltmain_patchlevel=2
+ test 2.4 = 1.5
+ test 2.4 = 2.2
+ test 2.4 = 2.4
+ test 2 -gt 2
+ support/scripts/apply-patches.sh /home/bob/p4_workspace/linux_sw/build_systems/buildroot/buildroot-git/output/build/ntp-4.2.8p3/sntp/libevent/build-aux support/libtool buildroot-libtool-v2.4.patch
---
 package/pkg-autotools.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
