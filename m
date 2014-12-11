From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:49:14 +0100
Subject: [Buildroot] [git commit] arch: ensure BR2_BINFMT_ELF is really used
Message-ID: <20141211215300.AE82C80193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1a38829e7529289040e24d6d1c14765f0ab426e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the binary format choice is only shown for the Blackfin and
m68k architectures, since we assume that all other architectures are
using the ELF binary format. However, due to this, the BR2_BINFMT_ELF
symbol is in fact not set to 'y' for those architectures that use the
ELF format.

This will be causing problems for the refactoring of the static/shared
library support, as we will need to know if the binary format supports
shared libraries or not.

Therefore, we simply make the choice visible on all architectures,
even if it means that on many architectures no other choice than ELF
will be available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 3bac187..c05e5d7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -254,7 +254,7 @@ config BR2_ARCH_HAS_ATOMICS
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	depends on BR2_bfin || BR2_m68k
+	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
 	default BR2_BINFMT_FDPIC if BR2_bfin
 	default BR2_BINFMT_FLAT if BR2_m68k
 
