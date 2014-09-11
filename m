From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Sep 2014 22:53:08 +0200
Subject: [Buildroot] [git commit] arch/arc: fix atomics selection
Message-ID: <20140911205338.738169D669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21c8f1e9470d37787b6d7cef10612df56cfdef2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a kconfig limitation, we can't select a no-prompt symbol that
gets its dependencies by being conditionally re-defined in one or more
if-blocks, like we currently do for BR2_ARCH_HAS_ATOMICS.

As a workaround to this issue, we just redefine that symbol in the arc
if-block, like we do for all other architectures, except that in the arc
case, the default value is conditional.

Reported-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: indepently re-done a patch similar to the one
 Thomas made on his own]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 8a7f290..fcb5d7d 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,7 +1,9 @@
 # Choise of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	select BR2_ARCH_HAS_ATOMICS
+
+config BR2_ARCH_HAS_ATOMICS
+	default y if BR2_ARC_ATOMIC_EXT
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
