From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 18 Sep 2007 18:30:08 +0200
Subject: [Buildroot] oddity with project_ vs. kernel dir
Message-ID: <20070918163008.GA14096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Ulf,

I'm trying to build a kernel with openswan (for i386, for example).
Everything works as expected when generating and installing the
kernel-headers ??) but the, when unpacking/patching the kernel for the
target, soomebody seems to try to apply a duplicate patch:

rm -rf
/scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc/linux-2.6.22.6
*** Unpacking kernel source
bzcat /scratch/obj.i686/buildroot_trunk/down/linux-2.6.22.6.tar.bz2 |
tar -C /scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc   -xf -
touch /scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc/linux-2.6.22.6/.unpacked
toolchain/patch-kernel.sh /scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc/linux-2.6.22.6
toolchain/kernel-headers \
                linux-2.6.22.6-\*.patch{,.gz,.bz2}
toolchain/patch-kernel.sh /scratch/obj.i686/buildroot_trunk/toolchain_build_i386/linux-2.6.22.6
package/openswan \
                linux-2.6.22.6-\*.patch{,.gz,.bz2}

Applying linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch using
plaintext: 
The next patch would create the file README.openswan-2,
which already exists!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
(a bit line-wrapped, sorry).

Does that sound familiar to you?

??): 
touch
/scratch/obj.i686/buildroot_trunk/toolchain_build_i386/linux-2.6.22.6/.unp
acked
toolchain/patch-kernel.sh
/scratch/obj.i686/buildroot_trunk/toolchain_build_i386
/linux-2.6.22.6 toolchain/kernel-headers \
                linux-2.6.22.6-\*.patch{,.gz,.bz2}
toolchain/patch-kernel.sh
/scratch/obj.i686/buildroot_trunk/toolchain_build_i386
/linux-2.6.22.6 package/openswan \
                linux-2.6.22.6-\*.patch{,.gz,.bz2}

Applying linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch using
plaintext: 
patching file README.openswan-2
patching file crypto/ciphers/aes/test_main.c
patching file crypto/ciphers/aes/test_main_mac.c
patching file include/crypto/aes.h
[snip rest of stuff working fine for kernel-headers]
patching file net/ipsec/Makefile.ver

Applying linux-2.6.22.6-openswan-2.4.9.kernel-2.6-natt.patch using
plaintext: 
patching file include/net/xfrmudp.h
patching file net/ipv4/Kconfig
patching file net/ipv4/udp.c
touch /scratch/obj.i686/buildroot_trunk/toolchain_build_i386/linux-2.6.22.6/.patched
