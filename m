From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:53:05 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: may fail to boot
 for binutils 2.29+ even without armv7m
Message-ID: <20180617150241.5888E81213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc221581c9f9781c1f053210ee43a2da71cf2f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit f13477b (linux: config.in: add comment for Arm Cortex-M) added a
comment so that the user that the linux kernel may miscompile with
binutils 2.29+, when the target is an armv7m CPU.

However, the real trigger is a compilation in thumb2 mode, which happens
to be the only option for armv7m CPUs.

We can't know whether the kernel will be built in arm or thumb2 mode,
though, because we do not have that information: it is only available in
the Linux' .config file, which we don;t have access to at the time we
run our menuconfig.

So, relax the conditions under which the comment is made, so that it
appears as soon as binutils are >= 2.29 (i.e. not 2.28, which is the
oldest we support) for ARM CPUs.

[Peter: reword comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
Cc: Laurent GONZALEZ <br22@gezedo.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit c2c0623bff4a93120642d68dcec247ac2729fa09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2ebddb403b..8007271cb7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,8 +8,8 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
-comment "Linux kernel will not boot with binutils >= 2.29"
-	depends on BR2_ARM_CPU_ARMV7M
+comment "Linux kernel may fail to boot with binutils >= 2.29"
+	depends on BR2_arm || BR2_armeb
 	depends on !BR2_BINUTILS_VERSION_2_28_X
 
 # Packages that need to have a kernel with support for loadable modules,
