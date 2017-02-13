From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 13 Feb 2017 20:41:29 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <20170212141425.GE11105@free.fr>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
 <20170212141425.GE11105@free.fr>
Message-ID: <1044520233.10180443.1487025689348.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, arnout at mind.be,
> gustavo at zacarias.com.ar
> Sent: Sunday, February 12, 2017 12:14:25 PM
> Subject: Re: [PATCH v2] infra/ccache: avoid color diagnostics with GCC older than v4.9

> Carlos, All,
[...]
> 
> Can you provide a reliable way to reproduce the issue, please?
> 
> Regards,
> Yann E. MORIN.

Sorry, I forgot so send this yesterday. Here is a reliable reproducer:

$ cat defconfig 
BR2_powerpc=y
BR2_powerpc_8548=y
BR2_CCACHE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-linux-gnuspe"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_OPENSSL=y
$ 
$ echo $GCC_COLORS 
error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01
$
$ make V=1 BR2_JLEVEL=1 openssl-dirclean openssl
[...]
/work/ccache-colors/host/usr/bin/powerpc-ctng_e500v2-linux-gnuspe-gcc -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DB_ENDIAN -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=double -Wa,-me500x2 -Os  -Wall -DOPENSSL_BN_ASM_MONT -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM -DVPAES_ASM -c  -o ppccpuid.o ppccpuid.s
powerpc-ctng_e500v2-linux-gnuspe-gcc: error: unrecognized command line option '-fdiagnostics-color'
<builtin>: recipe for target 'ppccpuid.o' failed
make[3]: *** [ppccpuid.o] Error 1
Makefile:287: recipe for target 'build_crypto' failed
make[2]: *** [build_crypto] Error 1
package/pkg-generic.mk:216: recipe for target '/work/ccache-colors/build/openssl-1.0.2k/.stamp_built' failed
make[1]: *** [/work/ccache-colors/build/openssl-1.0.2k/.stamp_built] Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
