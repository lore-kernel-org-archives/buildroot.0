From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Dec 2013 16:30:28 +0000
Subject: [Buildroot] [PATCH] sawman: Link using gcc instead of ld
Message-ID: <1386347428-4142-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using ld may cause a link failure due to using the default emulation
linker which is configured when building the linker in binutils.  Using
gcc instead will pass the appropriate -m value because the compiler
knows the ABI you are using.

Here is an example of the failure:

ld: .libs/libdirectfbwm_sawman.a.tmp/sawman_wm.o: ABI is incompatible
with that of the selected emulation
ld: failed to merge target specific data of file
.libs/libdirectfbwm_sawman.a.tmp/sawman_wm.o
ld: Attempt to do relocatable link with elf64-tradbigmips input and
elf32-tradbigmips output
ld: .libs/libdirectfbwm_sawman.a.tmp/sawman_wm.o: file class ELFCLASS64
incompatible with ELFCLASS32
ld: final link failed: File in wrong format

Fixes:

   http://autobuild.buildroot.net/results/e4b/e4b77681a44626efa2a44627604630697e785086/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../sawman-001-link-using-gcc-instead-of-ld.patch  |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch

diff --git a/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch b/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
new file mode 100644
index 0000000..5472651
--- /dev/null
+++ b/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
@@ -0,0 +1,20 @@
+sawman: Link using gcc instead of ld
+
+Using ld may cause a link failure due to using the default emulation
+linker which is configured when building the linker in binutils.  Using
+gcc instead will pass the appropriate -m value because the compiler 
+knows the ABI you are using.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+--- SaWMan-1.6.3/wm/sawman/Makefile.in.orig	2013-12-06 14:22:22.675409826 +0000
++++ SaWMan-1.6.3/wm/sawman/Makefile.in	2013-12-06 16:04:03.383752843 +0000
+@@ -622,7 +622,7 @@ uninstall-am: uninstall-wmDATA uninstall
+ 	if test -d $<.tmp; then rmdir $<.tmp; fi
+ 	mkdir $<.tmp
+ 	(cd $<.tmp && $(AR) x ../../$<)
+-	$(LD) -o $@ -r $<.tmp/*.o
++	$(CC) $(LDFLAGS) -nostdlib -o $@ -r $<.tmp/*.o
+ 	rm -f $<.tmp/*.o && rmdir $<.tmp
+ 
+ .PHONY: $(LTLIBRARIES:%.la=.libs/%.a)
-- 
1.7.1
