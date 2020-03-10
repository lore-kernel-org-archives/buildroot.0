From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:52:39 +0100
Subject: [Buildroot] [git commit] system: also create a lib64 -> lib
 symlink on mips64n32
In-Reply-To: <20200204220048.0812F8B83D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 4 Feb 2020 23:11:18 +0100")
References: <20200204220048.0812F8B83D@busybox.osuosl.org>
Message-ID: <87ftegoru0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=45fbadb0b785de116b369fb1d413063126316c19
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In gcc 5.1.0, a change was introduced which causes internal search paths
 > inside the sysroot to be relative to 'lib64' rather than 'lib'. See [1] [2]
 > and [3].

 > For example for dtc:

 >      LD convert-dtsv0
 >     /opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/bin/ld: cannot find crt1.o: No such file or directory
 >     /opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/bin/ld: cannot find crti.o: No such file or directory
 >     collect2: error: ld returned 1 exit status
 >     make[1]: *** [Makefile:236: convert-dtsv0] Error 1
 >     make[1]: *** Waiting for unfinished jobs....
 >     make[1]: Leaving directory '/opt/buildroot/output/build/dtc-1.4.7'
 >     make: *** [package/pkg-generic.mk:241: /opt/buildroot/output/build/dtc-1.4.7/.stamp_built] Error 2

 > In this case, crt1.o was searched for in following locations:

 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/n32/octeon3/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/lib/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/lib/../lib32-fp/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/../lib32-fp/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/../lib32-fp/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/lib/mips64-octeon-linux-gnu/7.3.0/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/lib/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o", R_OK) = -1 ENOENT (No such file or directory)
 >     16073 access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/crt1.o", R_OK) = -1 ENOENT (No such file or directory)

 > As can be seen above, all attempted paths contain 'lib64' as base,
 > instead of 'lib' or 'lib32', e.g.

 > .../sysroot/lib64/../lib32-fp/crt1.o
 > .../sysroot/lib64/crt1.o

 > This problem was detected on a gcc 7.x toolchain provided by Marvell as part
 > of their Octeon SDK. For this toolchain, here are the values of the paths
 > as detected by the Buildroot toolchain logic, for two different Octeon
 > processors:

 > - octeon2 (soft-float) (-mabi=n32 -march=octeon2):
 > SYSROOT_DIR=/opt/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
 > ARCH_SYSROOT_DIR=/opt/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
 > ARCH_SUBDIR=;
 > ARCH_LIB_DIR=lib32/octeon2;
 > SUPPORT_LIB_DIR=/opt/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/lib32/octeon2/

 > - octeon3 (hard-float) (-mabi=n32 -march=octeon3):
 > SYSROOT_DIR=/opt/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
 > ARCH_SYSROOT_DIR=/opt/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
 > ARCH_SUBDIR=;
 > ARCH_LIB_DIR=lib32-fp;
 > SUPPORT_LIB_DIR=/opt/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/lib32-fp/

 > For both cases (MIPS64n32) Buildroot created a symlink 'lib32->lib', from
 > SYSTEM_LIB_SYMLINK in system/system.mk. Additionally, the function
 > create_lib_symlinks in
 > toolchain/toolchain-external/pkg-toolchain-external.mk will use ARCH_LIB_DIR
 > and create an additional link $(ARCH_LIB_DIR)->lib.
 > For the Octeon3 case this thus results in the following symlinks (where the
 > 'lib32' one is normally not needed):

 >     lib32 -> lib/
 >     lib32-fp -> lib/

 > Since the toolchain is searching based on a 'lib64' component, it will fail
 > to find its internal paths.

 > To solve the problem, we need to create an additional symlink 'lib64':

 >     lib64 -> lib/

 > [1] https://github.com/gcc-mirror/gcc/commit/257ccd463a4f25495b252a3bdf989d057c54678d
 > [2] https://gcc.gnu.org/ml/gcc-patches/2014-10/msg03377.html
 > [3] https://gcc.gnu.org/ml/gcc-patches/2014-11/msg00539.html

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
