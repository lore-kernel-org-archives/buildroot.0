From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:19:04 +0100
Subject: [Buildroot] [git commit] arch: pass cpu option instead of tune
	option on ARM
Message-ID: <20131226222002.C88A59C1E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3539dd53bf9e37538fd4d8b89783a11fded119f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the ARM Config.in logic specifies values for
--with-arch/-march and --with-tune/-mtune, but not for
--with-cpu/-mcpu. However, this causes problems on ARMv4, because
specifying --with-arch=armv4t isn't enough to make gcc generate ARMv4
code: one should also pass --with-cpu=<some ARMv4 CPU>.

Moreover, since Buildroot is generally designed to generate code
specifically for the configured target, it makes sense to give our own
--with-cpu/-mcpu value instead of relying on the default value used by
gcc, and only do small optimizations with -mtune.

Reported-by: Adam Hussein <kryme76@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c0fabb7..dd58744 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -341,7 +341,7 @@ config BR2_ENDIAN
 	default "LITTLE" if BR2_arm
 	default "BIG"	 if BR2_armeb
 
-config BR2_GCC_TARGET_TUNE
+config BR2_GCC_TARGET_CPU
 	default "arm7tdmi"	if BR2_arm7tdmi
 	default "arm7tdmi"	if BR2_arm720t
 	default "arm7tdmi"	if BR2_arm740t
