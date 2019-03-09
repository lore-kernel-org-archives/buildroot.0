From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 14:43:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.1.0
In-Reply-To: <20190308221534.16430-1-fontaine.fabrice@gmail.com>
References: <20190308221534.16430-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309144320.03e4158a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri,  8 Mar 2019 23:15:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add BSD-3-Clause (CRYPTOGAMS) and Public domain (ChaCha SSE2 and  AVX)
>   to LICENSE, see:
>   https://github.com/weidai11/cryptopp/commit/64a89bf352c7eb8ec905b4bf6d1177a56fed0121
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-config.h-avx2-depends-on-gcc-4.9.patch | 40 -------------------
>  package/cryptopp/cryptopp.hash                |  6 +--
>  package/cryptopp/cryptopp.mk                  |  4 +-
>  3 files changed, 5 insertions(+), 45 deletions(-)
>  delete mode 100644 package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch

Applied to master, thanks.

Note that there is something wrong going on with this package: it
builds stuff during the host installation step:

>>> host-cryptopp 8.1.0 Installing to host directory
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/libexec/python3-sphinx:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/projets/git-wrappers/:/home/thomas/.local/bin" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" /usr/bin/make -j5 -C /home/thomas/projets/buildroot/output/build/host-cryptopp-8.1.0 PREFIX=/home/thomas/projets/buildroot/output/host install
ar r libcryptopp.a cryptlib.o cpu.o integer.o 3way.o adler32.o algebra.o algparam.o arc4.o aria.o aria_simd.o ariatab.o asn.o authenc.o base32.o base64.o basecode.o bfinit.o blake2.o blake2b_simd.o blake2s_simd.o blowfish.o blumshub.o camellia.o cast.o casts.o cbcmac.o ccm.o chacha.o chacha_avx.o chacha_simd.o chachapoly.o cham.o cham_simd.o channels.o cmac.o crc.o crc_simd.o darn.o default.o des.o dessp.o dh.o dh2.o dll.o donna_32.o donna_64.o donna_sse.o dsa.o eax.o ec2n.o eccrypto.o ecp.o elgamal.o emsa2.o eprecomp.o esign.o files.o filters.o fips140.o fipstest.o gcm.o gcm_simd.o gf256.o gf2_32.o gf2n.o gf2n_simd.o gfpcrypt.o gost.o gzip.o hc128.o [...] zlib.o
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c adhoc.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c test.cpp
ar: creating libcryptopp.a
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c bench1.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c bench2.cpp
ranlib libcryptopp.a
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c bench3.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c datatest.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c dlltest.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c fipsalgt.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat0.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat1.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat2.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat3.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat4.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat5.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat6.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat7.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat8.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat9.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c validat10.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c regtest1.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c regtest2.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c regtest3.cpp
g++ -DNDEBUG -g2 -O3 -fPIC -pthread -pipe -c regtest4.cpp

These should either be built during the build step, or not built at all
(tests) if possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
