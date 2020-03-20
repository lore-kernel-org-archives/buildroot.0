From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Mar 2020 16:34:54 +0000
Subject: [Buildroot] [Bug 12686] New: recipe for target 'install_dev' failed
 (libcrypto.so: file format not recognized)
Message-ID: <bug-12686-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12686

            Bug ID: 12686
           Summary: recipe for target 'install_dev' failed (libcrypto.so:
                    file format not recognized)
           Product: buildroot
           Version: 2020.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jrmcorreo-linux at yahoo.es
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

I'm trying to compile the latest version of buildroot with internal toolchain
(I've tried gcc-8.x with c++ support enabled, binutils 2.32 and 2.33.1 with
same result), in order to upgrade the system of my embedded hardware based on
Sunxi A20 ARM processor, but I'm getting an unexpected error while installing
libopenssl-1.1.1d:

install libcrypto.a ->
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.a
install libssl.a ->
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libssl.a
link
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so
->
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so.1.1
install libcrypto.so ->
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so
install libcrypto.so.1.1 ->
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so
/buildrootpath/host/bin/arm-buildroot-linux-gnueabihf-ar:
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so:
file format not recognized
/buildrootpath/host/bin/arm-buildroot-linux-gnueabihf-ar:
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so.new:
file format not recognized
Makefile:358: recipe for target 'install_dev' failed


Checking files with readelf -hl I obtain next output:

$ readelf -hl libcrypto.so
Encabezado ELF:
  M?gico:  7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
  Clase:                             ELF32
  Datos:                             complemento a 2, little endian
  Versi?n:                           1 (current)
  OS/ABI:                            UNIX - System V
  Versi?n ABI:                       0
  Tipo:                              DYN (Fichero objeto compartido)
  M?quina:                           ARM
  Versi?n:                           0x1
  Direcci?n del punto de entrada:    0x50000
  Inicio de encabezados de programa: 52  (bytes en el fichero)
  Inicio de encabezados de secci?n:  2373548 (bytes en el fichero)
  Opciones:                          0x5000400, Version5 EABI, hard-float ABI
  Tama?o de este encabezado:         52 (bytes)
  Tama?o de encabezados de programa: 32 (bytes)
  N?mero de encabezados de programa: 6
  Tama?o de encabezados de secci?n:  40 (bytes)
  N?mero de encabezados de secci?n:  37
  ?ndice de tabla de cadenas de secci?n de encabezado: 36

Encabezados de Programa:
  Tipo           Desplaz  DirVirt    DirF?sica  TamFich TamMem  Opt Alin
  EXIDX          0x1c4b48 0x001c4b48 0x001c4b48 0x00008 0x00008 R   0x4
  LOAD           0x000000 0x00000000 0x00000000 0x1c4b54 0x1c4b54 R E 0x10000
  LOAD           0x1c55f8 0x001d55f8 0x001d55f8 0x16de0 0x1ac6c RW  0x10000
  DYNAMIC        0x1daed8 0x001eaed8 0x001eaed8 0x00128 0x00128 RW  0x4
  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
  GNU_RELRO      0x1c55f8 0x001d55f8 0x001d55f8 0x15a08 0x15a08 R   0x1

 mapeo de Secci?n a Segmento:
  Segmento Secciones...
   00     .ARM.exidx 
   01     .hash .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_d
.gnu.version_r .rel.dyn .rel.plt .init .plt .text .fini .rodata .ARM.exidx
.eh_frame 
   02     .init_array .fini_array .data.rel.ro .dynamic .got .data .bss 
   03     .dynamic 
   04     
   05     .init_array .fini_array .data.rel.ro .dynamic 

$ readelf -hl libcrypto.so.new 
Encabezado ELF:
  M?gico:  7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
  Clase:                             ELF32
  Datos:                             complemento a 2, little endian
  Versi?n:                           1 (current)
  OS/ABI:                            UNIX - System V
  Versi?n ABI:                       0
  Tipo:                              DYN (Fichero objeto compartido)
  M?quina:                           ARM
  Versi?n:                           0x1
  Direcci?n del punto de entrada:    0x50000
  Inicio de encabezados de programa: 52  (bytes en el fichero)
  Inicio de encabezados de secci?n:  2373548 (bytes en el fichero)
  Opciones:                          0x5000400, Version5 EABI, hard-float ABI
  Tama?o de este encabezado:         52 (bytes)
  Tama?o de encabezados de programa: 32 (bytes)
  N?mero de encabezados de programa: 6
  Tama?o de encabezados de secci?n:  40 (bytes)
  N?mero de encabezados de secci?n:  37
  ?ndice de tabla de cadenas de secci?n de encabezado: 36

Encabezados de Programa:
  Tipo           Desplaz  DirVirt    DirF?sica  TamFich TamMem  Opt Alin
  EXIDX          0x1c4b48 0x001c4b48 0x001c4b48 0x00008 0x00008 R   0x4
  LOAD           0x000000 0x00000000 0x00000000 0x1c4b54 0x1c4b54 R E 0x10000
  LOAD           0x1c55f8 0x001d55f8 0x001d55f8 0x16de0 0x1ac6c RW  0x10000
  DYNAMIC        0x1daed8 0x001eaed8 0x001eaed8 0x00128 0x00128 RW  0x4
  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
  GNU_RELRO      0x1c55f8 0x001d55f8 0x001d55f8 0x15a08 0x15a08 R   0x1

 mapeo de Secci?n a Segmento:
  Segmento Secciones...
   00     .ARM.exidx 
   01     .hash .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_d
.gnu.version_r .rel.dyn .rel.plt .init .plt .text .fini .rodata .ARM.exidx
.eh_frame 
   02     .init_array .fini_array .data.rel.ro .dynamic .got .data .bss 
   03     .dynamic 
   04     
   05     .init_array .fini_array .data.rel.ro .dynamic 



Relevant configuration entries are next:

#
# Target options
#
BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="cortex-a7"
BR2_GCC_TARGET_FPU="vfpv4-d16"
BR2_GCC_TARGET_FLOAT_ABI="hard"
BR2_GCC_TARGET_MODE="arm"
BR2_BINFMT_SUPPORTS_SHARED=y
BR2_READELF_ARCH_NAME="ARM"
BR2_BINFMT_ELF=y
BR2_ARM_CPU_HAS_NEON=y
BR2_ARM_CPU_HAS_FPU=y
BR2_ARM_CPU_HAS_VFPV2=y
BR2_ARM_CPU_HAS_VFPV3=y
BR2_ARM_CPU_HAS_VFPV4=y
BR2_ARM_CPU_HAS_ARM=y
BR2_ARM_CPU_HAS_THUMB2=y
BR2_ARM_CPU_ARMV7A=y

#
#Toolchain options
#
BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT=y

#
# Toolchain Buildroot Options
#
BR2_TOOLCHAIN_BUILDROOT_VENDOR="buildroot"
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc"

#
# Glibc Options
#
BR2_PACKAGE_GLIBC=y

#
# Binutils Options
#
BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=y
BR2_BINUTILS_VERSION_2_33_X=y
BR2_BINUTILS_VERSION="2.33.1"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_7_X is not set
BR2_GCC_VERSION_8_X=y
BR2_GCC_VERSION="8.3.0"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=y

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
BR2_PACKAGE_BOTAN_ARCH_SUPPORTS=y
# BR2_PACKAGE_BOTAN is not set
# BR2_PACKAGE_CA_CERTIFICATES is not set
# BR2_PACKAGE_CRYPTODEV is not set
# BR2_PACKAGE_GCR is not set
BR2_PACKAGE_GNUTLS=y
# BR2_PACKAGE_GNUTLS_OPENSSL is not set
BR2_PACKAGE_GNUTLS_TOOLS=y
# BR2_PACKAGE_LIBARGON2 is not set
# BR2_PACKAGE_LIBASSUAN is not set
# BR2_PACKAGE_LIBGCRYPT is not set
BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS=y
# BR2_PACKAGE_LIBGPG_ERROR is not set
BR2_PACKAGE_LIBGPG_ERROR_SYSCFG="arm-unknown-linux-gnueabi"
# BR2_PACKAGE_LIBGPGME is not set
# BR2_PACKAGE_LIBKCAPI is not set
# BR2_PACKAGE_LIBKSBA is not set
# BR2_PACKAGE_LIBMCRYPT is not set
# BR2_PACKAGE_LIBMHASH is not set
# BR2_PACKAGE_LIBNSS is not set
# BR2_PACKAGE_LIBOLM is not set
# BR2_PACKAGE_LIBP11 is not set
# BR2_PACKAGE_LIBSCRYPT is not set
# BR2_PACKAGE_LIBSECRET is not set
# BR2_PACKAGE_LIBSHA1 is not set
# BR2_PACKAGE_LIBSODIUM is not set
# BR2_PACKAGE_LIBSSH is not set
# BR2_PACKAGE_LIBSSH2 is not set
# BR2_PACKAGE_LIBTOMCRYPT is not set
# BR2_PACKAGE_LIBUECC is not set
# BR2_PACKAGE_MBEDTLS is not set
BR2_PACKAGE_NETTLE=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL=y
BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH="linux-armv4"
BR2_PACKAGE_LIBOPENSSL_BIN=y
# BR2_PACKAGE_LIBOPENSSL_ENGINES is not set
# BR2_PACKAGE_LIBRESSL is not set
BR2_PACKAGE_HAS_OPENSSL=y
BR2_PACKAGE_PROVIDES_OPENSSL="libopenssl"
BR2_PACKAGE_PROVIDES_HOST_OPENSSL="host-libopenssl"
# BR2_PACKAGE_RHASH is not set
# BR2_PACKAGE_TINYDTLS is not set
# BR2_PACKAGE_TPM2_TSS is not set
BR2_PACKAGE_TROUSERS=y
# BR2_PACKAGE_USTREAM_SSL is not set
# BR2_PACKAGE_WOLFSSL is not set

-- 
You are receiving this mail because:
You are on the CC list for the bug.
