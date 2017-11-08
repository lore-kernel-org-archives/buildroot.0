From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 8 Nov 2017 19:35:01 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171108172914.GA4602@scaer>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171108172914.GA4602@scaer>
Message-ID: <CAAXf6LWzz1eLMZgBvWf1ytVQ6tmt_D3By0YfeXPLedpbK1v1Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-11-08 18:29 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Hello Chu, Zhuliang; All,
>
> On 2017-11-07 11:48 +0000, Chu, Zhuliang (NSB - CN/Shanghai) spake thusly:
>> I have seen your mail on the buildroot mailing list.
>> I download your buildroot branch 'ppsh' and test it with my configurations.
>> After my test, I will report about 4 problem under below.
>
> Thanks for the feedback on this early series, very valuable indeed! :-)
>
>> Test environment:
>> when using your buildroot, I will execute the parallel build command 'make -j8'.
>> when using mainstream buildroot, I will execute 'make -j1'.
>> config?
>> 1\ qemu_x86_defconfig
>> 2\ my_private_configuration(it is ok in mainstream buildroot)
>>
>> Q1: Compatibility Issues
>> In qemu_x86_defconfig, mainstream and 'ppsh' is all ok because it is simple.
>> In my private, if using 'make -j8' in the 'ppsh', there still has the first question as shows in lines 103-116 of the top-level
>> Makefile.
>> i.e.
>> >>> openssl Configuring
>> checking whether we are using A... yes(A has been compiled)/no(A has not been compiled)
>
> This does not look like this is opensl configure messages...
>
> Here, openssl (really, libopenssl nowadays) configure step says things
> like:
>
>     ---8<---
>     Configuring for linux-armv4
>         no-ec_nistp_64_gcc_128 [default]  OPENSSL_NO_EC_NISTP_64_GCC_128 (skip dir)
>         no-gmp          [default]  OPENSSL_NO_GMP (skip dir)
>         no-jpake        [experimental] OPENSSL_NO_JPAKE (skip dir)
>         no-krb5         [krb5-flavor not specified] OPENSSL_NO_KRB5
>         no-libunbound   [experimental] OPENSSL_NO_LIBUNBOUND (skip dir)
>         no-md2          [default]  OPENSSL_NO_MD2 (skip dir)
>         no-rc5          [option]   OPENSSL_NO_RC5 (skip dir)
>         no-rfc3779      [default]  OPENSSL_NO_RFC3779 (skip dir)
>         no-sctp         [default]  OPENSSL_NO_SCTP (skip dir)
>         no-ssl-trace    [default]  OPENSSL_NO_SSL_TRACE (skip dir)
>         no-ssl2         [default]  OPENSSL_NO_SSL2 (skip dir)
>         no-store        [experimental] OPENSSL_NO_STORE (skip dir)
>         no-unit-test    [default]  OPENSSL_NO_UNIT_TEST (skip dir)
>         no-weak-ssl-ciphers [default]  OPENSSL_NO_WEAK_SSL_CIPHERS (skip dir)
>     IsMK1MF=0
>     CC            =/home/ymorin/dev/buildroot/O/host/bin/arm-linux-gnueabihf-gcc
>     CFLAG         =-fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -O3 -Wall -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM
>     EX_LIBS       =-ldl
>     CPUID_OBJ     =armcap.o armv4cpuid.o
>     BN_ASM        =bn_asm.o armv4-mont.o armv4-gf2m.o
>     EC_ASM        =
>     DES_ENC       =des_enc.o fcrypt_b.o
>     AES_ENC       =aes_cbc.o aes-armv4.o bsaes-armv7.o aesv8-armx.o
>     BF_ENC        =bf_enc.o
>     CAST_ENC      =c_enc.o
>     RC4_ENC       =rc4_enc.o rc4_skey.o
>     RC5_ENC       =rc5_enc.o
>     MD5_OBJ_ASM   =
>     SHA1_OBJ_ASM  =sha1-armv4-large.o sha256-armv4.o sha512-armv4.o
>     RMD160_OBJ_ASM=
>     CMLL_ENC      =camellia.o cmll_misc.o cmll_cbc.o
>     MODES_OBJ     =ghash-armv4.o ghashv8-armx.o
>     ENGINES_OBJ   =
>     PROCESSOR     =
>     RANLIB        =/home/ymorin/dev/buildroot/O/host/bin/arm-linux-gnueabihf-ranlib
>     ARFLAGS       =
>     PERL          =/usr/bin/perl
>     THIRTY_TWO_BIT mode
>     DES_UNROLL used
>     DES_INT used
>     BN_LLONG mode
>     RC4 uses uchar
>     RC4_CHUNK is unsigned long
>     BF_PTR used
>     created directory `include/openssl'
>     e_os2.h => include/openssl/e_os2.h
>     making links in crypto...
>     crypto.h => ../include/openssl/crypto.h
>     [...]
>     ---8<---
>
> So, I wonder what openssl you are using... :-/
>
>> in mainstream buildroot, the order of package A is before openssl. So openssl is always support A.
>> but in 'ppsh', openssl is always not support A. if once 'ppsh' is merged into the mainstream, there will cause software
>> inconsistencies.
>
> This behavioural change is expected, indeed. Top-level parallel build
> can no longer guarantee the build order, by the mere fact of being
> parallel. Whatever currently depends on the build order will indeed be
> broken once top-level parralel build is merged.
>
> The solution is to correctly express dependencies in the .mk files.
>
> Now, if your 'A' package is not something that is known to buildroot,
> but changes the way a package known to buildroot behaves, there is not
> much we in Buildroot can do, unless you submit the 'A' package for
> inclusion in Buildroot...
>
>> Q2: Space Expension
>> in qemu_x86_defconfig, the size of output increased from 3.4G to 3.6G between mainstream with 'ppsh'.
>> in my private, the rate of space occupancy growth is higher. it`s crazy from 3.6G to 9G .This obviously can not accept. (A large
>> part of reason is that I use a very large toolchain-external which about 1.5G)
>> Before a package only consumes one space, but now a package maybe reoccupied space below per-package.
>> BEFORE(mainstream):
>> 1.7G    ./build
>> 115M    ./images
>> 37M    ./target
>> 1.8G    ./host
>> 3.6G    .
>>
>> NOW('ppsh')
>> 1.7G    ./build
>> 5.5G    ./per-package
>> 115M    ./images
>> 37M    ./target
>> 1.8G    ./host
>> 8.9G    .
>
> As others already stated, in may depend on the tools you use to report
> the disk usage, but can also depend on the type of filesystem.
>
> What filesystem are you using: ext3/4, btrfs, xfs, other?
>
> What command did you run to come up with those numbers?
>
>> Q3: ERROR: Could not generate syscalls.(uclibc_error.log)
>> I have not solved this problem, I put the error message in the attachment
>>
>> Q4: Ccache path needs to be fixed(ccache_error.log)
>> When ccache is enabled, it will generate the 'command not found' error like below.
>> make: /home/zhulianc/inprogress/orig/tpbuildroot/output/host/bin/ccache: Command not found
>> this issue has been fix.
>>
>> patch(0001-ccache-fix-ccache-HOST_DIR.patch):
>> -----------------------------------------------------------------------------------
>> From 2e60c344a47fe64d92b3d29af8143d73802e71c4 Mon Sep 17 00:00:00 2001
>> From: Zhuliang Chu <zhuliang.chu@nokia-sbell.com>
>> Date: Tue, 7 Nov 2017 19:23:46 +0800
>> Subject: [PATCH 1/1] ccache: fix ccache HOST_DIR
>>
>> The ccache binary is located in the per-package directory when ccache is installed.
>> But it is set at '$(HOST_DIR)/usr/bin/ccache' in top-level Makefile as below:
>> CCACHE := $(HOST_DIR)/usr/bin/ccache
>
> I wonder on what version of Buildroot you applied the patches: we no
> longer have the usr directory in $(HOST_DIR) now.

Trying to bridge the timezone gap here: the version we are currently
using is 2017.02.5, so normally Chu Zhuliang worked on top of that.

Best regards,
Thomas
