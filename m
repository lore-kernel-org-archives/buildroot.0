From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:42:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-13
In-Reply-To: <20150214073013.E7748101008@stock.ovh.net>
References: <20150214073013.E7748101008@stock.ovh.net>
Message-ID: <20150214224243.47b77b67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Feb 2015 08:30:13 +0100 (CET), Thomas Petazzoni wrote:

>          sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/7e3dc7d48d2c62867ea6f95615d583dee9b42e4b/

The infamous static linking problem with uClibc, which still exists on
SH4 because the toolchains have not been rebuilt since a long time.
Would anyone be willing to look at fixing the SH4 support in the
internal toolchain backend? It's broken due to SH4 requiring some form
of multilib support.

>       mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b1ec2e994c9b1f2629f37f54e04b228ad13ce3ca/

This is another uClibc issue. Vicente, I believe we don't yet have an
exception for this one, do we? Or is the issue fixed, but not visible
yet since we have not yet rebuilt the toolchains?

>         bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/6f30e976f307e2eca68abf7e379506e2754891ae/
>         bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/73aa1c7a2946f878c246e4cfec64859e04aaced1/

I remember starting having a quick look, but I think I was not able to
reproduce on my machine, for some reason.

>       x86_64 |                  gnutls-3.3.12 | NOK | http://autobuild.buildroot.net/results/d0d4618937af10ee675e84c86b13b0d48050fe47/

Patch sent, http://patchwork.ozlabs.org/patch/439796/.

>         bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/809af19323fb5d40b88dc4b8ca9ab07082e18d81/

Missing -liconv.

>          arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/ee9ab4b54d6c1d2c774362d518c6c0055ec6e898/
>          arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/d69a324434f370b490a53e6191d38a204ac28371/
>          arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/79b004e42331c4b581f2d3ead7ebec0c316f29f8/

Romain Naour has said on IRC he was looking at these ones.

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/188b0890761ec6ec618beda46e88396c3f0a7805/

Most likely it tries to generate a shared library.

>       x86_64 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/93b43e114f21a22f0f8b7d7dd6774c089c426cd1/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=3f335ed5508abe3a19e5e2106eb5339531cb4a82.

>         bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/71362af474461e99b7c188a316aa644a0faaad2e/
>         bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/469eadc6a7aa81c13643b5c249a63cf11d8c3fc9/
>         bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/1739ec14ce49a57d06a73d9164f42061ce80f203/

Not sure.

>       x86_64 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/24423eb5b72b56c5419d4ce9d95aedc17b4c8256/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=f87f3d139637410b0c418926795883509490d9af.

>      aarch64 |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/3d68fe01c0c167b2567e810d005f4e9b569ceffb/

Seems like a compiler issue:

/tmp/ccZMztUg.s: Assembler messages:
/tmp/ccZMztUg.s:2962: Error: operand 2 should be an integer register -- `mul x1,[x29,32],[x29,40]'
/tmp/ccZMztUg.s:2963: Error: operand 2 should be an integer register -- `smulh x0,[x29,32],[x29,40]'
/tmp/ccZMztUg.s:3033: Error: operand 2 should be an integer register -- `mul x1,[x29,40],[x29,40]'
/tmp/ccZMztUg.s:3034: Error: operand 2 should be an integer register -- `smulh x0,[x29,40],[x29,40]'
make[1]: *** [ext/standard/math.lo] Error 1

Probably something to report to the Linaro filks.

>         bfin |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/fadb76d19f40bd4c8921e607df5b8e319a4ece86/

checking for sqlite3_open in -lsqlite3... no
configure: error: wrong sqlite lib version or lib not found
make: *** [/home/test/autobuild/instance-0/output/build/php-5.5.21/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-0/buildroot'

>          sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/7bfd88269006e229cd120af6b3a8bf04261ad699/

Same problem as alsa-lib: static linking issue with uClibc.

>         i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/51c45ce58caf0eb6ea0e2f95efbc5eaf6fa0392a/

Compiler issue:

internal compiler error: in assign_by_spills, at lra-assigns.c:1281

Anyone to look into this?

>      powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/ad2ba82677680082ae837b39dee5acd22967843f/

The -fuse-ld=gold issue, for which Peter has said he would send a patch.

>          arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/ea2cd4691db18c549e5a51a143acb9073afc135a/

internal compiler error: in expand_expr_addr_expr_1, at expr.c:7669

>       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/dd30cae433f49980c7a80463969c38e40b6c0ce2/
>       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/2b5826a87d0fe78003f089ef12fe8652e1cae78c/
>       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/eda54770cfe7da2b636d452877f3e1ac13c08950/

These are irrelevant, due to the autobuild-run not being up-to-date.

>         bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/76f670d9654bca4b1f0e124c28997866fa174285/

libstdc++ issue. I sent a patch a long time ago, but there were
non-trivial comments to address: 

>      powerpc |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/18a06027475686e6d377efe3da48118f433045b1/

src/launcher-util.c: In function 'weston_launcher_open':
src/launcher-util.c:165:37: error: 'MSG_CMSG_CLOEXEC' undeclared (first use in this function)
   len = recvmsg(launcher->fd, &msg, MSG_CMSG_CLOEXEC);

>      powerpc |               wireshark-1.12.3 | NOK | http://autobuild.buildroot.net/results/d900fea263e1b161d83cd6e5f0326515d65b4b7a/

dissectors/.libs/libdissectors.a(libdissectors_la-packet-catapult-dct2000.o): In function `dissect_rrc_lte':
packet-catapult-dct2000.c:(.text.unlikely+0x838): relocation truncated to fit: R_PPC_PLTREL24 against symbol `call_dissector_only' defined in .text section in .libs/libwireshark_la-packet.o
dissectors/.libs/libdissectors.a(libdissectors_la-packet-dcerpc.o): In function `dissect_dcerpc_verifier':

(and more)

>         bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/2929ab7d0b2d19612988faea483b09a79851c03a/

/home/test/autobuild/instance-3/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libexslt.a(crypto.o): In function `_exsltCryptoGcryptInit':
crypto.c:(.text+0x112): undefined reference to `_gcry_check_version'

Missing -l flag.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
