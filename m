From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 10:50:54 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qemu: disable qemu user
 emulation on MIPS64 for host variant
Message-ID: <20181021092409.29749863D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3855afdaf3273229a880c7db2e5aa544bae3ae6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

According to target/mips/TODO in the Qemu sources:

MIPS64
------
- Userland emulation (both n32 and n64) not functional.

And indeed, trying to run a mips64n32 binary under qemu user emulation
results in:

Invalid ELF image for this architecture

So we move the BR2_mips64(el) dependency from
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS to
BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS, so that only the system
emulation is available on mips64, and not the user-mode emulation.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 17024f5900b9803fc34388c39915f70ce51fb037)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 78ff052983..957c7d2ae1 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -9,8 +9,6 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_microblazebe
 	default y if BR2_mips
 	default y if BR2_mipsel
-	default y if BR2_mips64
-	default y if BR2_mips64el
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
@@ -22,6 +20,8 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	default y if BR2_mips64
+	default y if BR2_mips64el
 
 config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	bool
