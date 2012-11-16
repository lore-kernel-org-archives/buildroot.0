From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 15:01:14 +0100
Subject: [Buildroot] [PATCH] cpanminus: mark as broken
Message-ID: <1353074474-1684-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpanminus is currently responsible for about half of the autobuilder
failures, due to the missing dependency on host-qemu. However, even
with the host-qemu proposed by Arnout, cpanminus will still not work
properly: it will try to execute on the build machine executables
built for the target. While qemu is here to emulate the instruction
set, there is still the unsolved problem of kernel headers version
mismatch between the target and the build environments.

So the whole approach that consists in using host-qemu for building
simply cannot work properly, and until it is solved, the package
should be marked as broken.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpanminus/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index b8b39dc..b10d211 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_CPANMINUS
 	bool "cpanminus"
+	# Requires host-qemu, which cannot work properly due to kernel
+	# headers mismatch between the build environment and the
+	# target.
+	depends on BR2_BROKEN
 	help
 	  cpanminus is a script to get, unpack, build and install Perl modules
 	  from CPAN.
-- 
1.7.9.5
