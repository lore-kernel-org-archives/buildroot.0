From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 22:24:31 +0100
Subject: [Buildroot] [git commit] cpanminus: mark as broken
Message-ID: <20121116212645.4677E99FD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30d99041ce5f32c30c470c3b114d612ba26e49ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cpanminus/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
