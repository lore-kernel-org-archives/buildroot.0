From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:54:09 +0100
Subject: [Buildroot] [PATCH] qemu: disable Qemu user-land emulation for
 uClibc toolchains
In-Reply-To: <1488619059-1499-1-git-send-email-francois.perrad@gadz.org>
References: <1488619059-1499-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20170304115409.0e798143@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 10:17:39 +0100, Francois Perrad wrote:
> fixes:
> http://autobuild.buildroot.org/results/69c/69c66f1876f0d8dba1bd71ee109df371577d8dda

This error happens in ARM only code, so I believe disabling it on all
architectures is probably a bit too much. In addition, the fix is most
likely trivial, and probably looks like this:

diff --git a/user-exec.c b/user-exec.c
index 6db0758..2b3d116 100644
--- a/user-exec.c
+++ b/user-exec.c
@@ -409,7 +409,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 #if defined(__NetBSD__)
     pc = uc->uc_mcontext.__gregs[_REG_R15];
-#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
+#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
     pc = uc->uc_mcontext.gregs[R15];
 #else
     pc = uc->uc_mcontext.arm_pc;

Could you have a try with this?

Adding Waldemar in Cc: since it's a uClibc related issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
