From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Dec 2013 16:22:12 +0000
Subject: [Buildroot] [PATCH v3] sawman: Link using gcc instead of ld
Message-ID: <1387297332-28286-1-git-send-email-Vincent.Riera@imgtec.com>
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
 .../sawman-001-link-using-gcc-instead-of-ld.patch  |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch

diff --git a/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch b/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
new file mode 100644
index 0000000..02e8029
--- /dev/null
+++ b/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
@@ -0,0 +1,19 @@
+sawman: Link using gcc instead of ld
+
+Using ld may cause a link failure due to using the default emulation
+linker which is configured when building the linker in binutils.  Using
+gcc instead will pass the appropriate -m value because the compiler 
+knows the ABI you are using.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+--- SaWMan-1.6.3/rules/libobject.make.orig	2013-12-17 15:54:22.137856874 +0000
++++ SaWMan-1.6.3/rules/libobject.make	2013-12-17 15:54:44.233201909 +0000
+@@ -3,7 +3,7 @@
+ 	if test -d $<.tmp; then rmdir $<.tmp; fi
+ 	mkdir $<.tmp
+ 	(cd $<.tmp && $(AR) x ../../$<)
+-	$(LD) -o $@ -r $<.tmp/*.o
++	$(CC) -nostdlib -o $@ -r $<.tmp/*.o
+ 	rm -f $<.tmp/*.o && rmdir $<.tmp
+ 
+ .PHONY: $(LTLIBRARIES:%.la=.libs/%.a)
-- 
1.7.1
