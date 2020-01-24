From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Jan 2020 22:30:06 +0000
Subject: [Buildroot] [Bug 12501] New: libnss-3.49.1: ld error: multiple
 definition of `gcm_HashZeroX_hw'
Message-ID: <bug-12501-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12501

            Bug ID: 12501
           Summary: libnss-3.49.1: ld error: multiple definition of
                    `gcm_HashZeroX_hw'
           Product: buildroot
           Version: 2019.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seems.deviant at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

My head is on "8258a60ad4 (HEAD -> master, origin/master, origin/HEAD)
package/uboot-tools: bump to version 2020.01"

I get an ld error when I build libnss with a specific set of Target options. 
The root of the issue seems to be setting Floating point strategy option to
something non-NEON.

To reproduce, do:

$ make menuconfig
   Target options  --->  
     Target Architecture --->
        ARM (little endian)
     Target Architecture Variant --->
        cortex-A8
     Target ABI --->
        EABI
     Floating point strategy --->
        VFPv3 (or VFPv3-D16)

  -> Target packages
     -> Libraries
       -> Crypto
      [*] libnss

$ make all

/home/oleksandr/buildroot-git/output/a8/host/bin/arm-buildroot-linux-gnueabi-gcc
-shared  -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,libfreeblpriv3.so 
-Wl,--version-script,Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/freeblpriv.def
-Wl,-Bsymbolic -o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreeblpriv3.so
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/freeblver.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ldvector.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/sysrand.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/sha_fast.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/md2.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/md5.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/cmac.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/alghmac.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/rawhash.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/alg2268.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/arcfour.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/arcfive.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/crypto_primitives.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/blake2b.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/desblapi.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/des.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/drbg.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/chacha20poly1305.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/cts.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ctr.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/blinit.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/fipsfreebl.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/hmacct.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/rijndael.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/aeskeywrap.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/camellia.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/dh.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ec.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecdecode.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/pqg.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/dsa.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/rsa.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/rsapkcs.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/shvfy.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/tlsprfalg.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/seed.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/jpake.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mpprime.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mpmontg.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mplogic.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mpi.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mp_gf2m.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mpi_arm.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/mpcpucache.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecl.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecl_mult.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecl_gf.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_aff.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_jac.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_mont.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ec_naf.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_jm.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_256.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_384.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_521.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_256_32.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/ecp_25519.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/curve25519_32.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/Hacl_Chacha20.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/Hacl_Chacha20_Vec128.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/FStar.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/stubs.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/nsslowhash.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/aes-armv8.o
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/Hacl_Poly1305_32.o
     -ldl -lc
/home/oleksandr/buildroot-git/output/a8/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o:
in function `gcm_HashMult_hw':
/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/nss/lib/freebl/gcm-arm32-neon.c:126:
multiple definition of `gcm_HashMult_hw';
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/nss/lib/freebl/gcm.c:56:
first defined here
/home/oleksandr/buildroot-git/output/a8/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o:
in function `vcreate_u8':
/home/oleksandr/buildroot-git/output/a8/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/include/arm_neon.h:6582:
multiple definition of `gcm_HashWrite_hw';
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/nss/lib/freebl/gcm.c:48:
first defined here
/home/oleksandr/buildroot-git/output/a8/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o:
in function `gcm_HashInit_hw':
/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/nss/lib/freebl/gcm-arm32-neon.c:186:
multiple definition of `gcm_HashInit_hw';
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/nss/lib/freebl/gcm.c:63:
first defined here
/home/oleksandr/buildroot-git/output/a8/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm-arm32-neon.o:
in function `gcm_HashZeroX_hw':
/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/nss/lib/freebl/gcm-arm32-neon.c:197:
multiple definition of `gcm_HashZeroX_hw';
Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/gcm.o:gcm.c:(.text.gcm_HashZeroX_hw+0x0):
first defined here
collect2: error: ld returned 1 exit status
../../coreconf/rules.mk:289: recipe for target
'Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreeblpriv3.so'
failed
make[5]: ***
[Linux2.6_arm_arm-buildroot-linux-gnueabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreeblpriv3.so]
Error 1
Makefile:655: recipe for target 'libs' failed
make[4]: *** [libs] Error 2
../coreconf/rules.mk:101: recipe for target 'libs' failed
make[3]: *** [libs] Error 2
coreconf/rules.mk:101: recipe for target 'libs' failed
make[2]: *** [libs] Error 2
package/pkg-generic.mk:257: recipe for target
'/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/.stamp_built'
failed
make[1]: ***
[/home/oleksandr/buildroot-git/output/a8/build/libnss-3.49.1/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
