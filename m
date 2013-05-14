From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 11:54:49 +0200
Subject: [Buildroot] Using Buildroot tool chain as external Toolchain
In-Reply-To: <1368525117.2434.50.camel@john-ubu>
References: <1368522484.2434.45.camel@john-ubu> <20130514112516.7ed42f44@skate>
 <1368525117.2434.50.camel@john-ubu>
Message-ID: <20130514115449.34d3cc76@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear john,

On Tue, 14 May 2013 10:51:57 +0100, john wrote:
> Hi Thomas,
> 
> Thank you for the reply.
> I have attached the config.log

So indeed the problem is:

/apps/buildroot_toolchain/usr/bin/../libexec/gcc/arm-unknown-linux-uclibcgnueabi/4.5.3/cc1:
error while loading shared libraries: libmpc.so.2: cannot open shared
object file: No such file or directory

Which is what I was referring to.

You can apply the below patch as a workaround:

commit b18bb4667fa5773c55e084c8b2d2df68735d3130
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Fri Aug 24 20:39:52 2012 +0000

    mpc, mpfr, gmp: build statically for the host
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5bcc6c1..9746150 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,5 +14,7 @@ ifeq ($(ARCH),arm)
 GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
+HOST_GMP_CONF_OPT += --enable-static --disable-shared
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index a366db7..4723220 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -12,6 +12,7 @@ MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
+HOST_MPC_CONF_OPT += --disable-shared --enable-static
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 9caf3ac..fd8ff08 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,5 +11,7 @@ MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 
+HOST_MPFR_CONF_OPT += --enable-static --disable-shared
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
