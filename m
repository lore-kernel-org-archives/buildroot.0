From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:31 +0100
Subject: [Buildroot] [PATCH 4/8] arch: ensure BR2_BINFMT_ELF is really used
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 arch/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.1.0
