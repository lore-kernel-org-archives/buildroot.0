From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Feb 2017 17:48:26 +0100
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <1044520233.10180443.1487025689348.JavaMail.zimbra@datacom.ind.br>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
 <20170212141425.GE11105@free.fr>
 <1044520233.10180443.1487025689348.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170214164826.GB3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-02-13 20:41 -0200, Carlos Santos spake thusly:
> Sorry, I forgot so send this yesterday. Here is a reliable reproducer:
> 
> $ cat defconfig 
> BR2_powerpc=y
> BR2_powerpc_8548=y
> BR2_CCACHE=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-linux-gnuspe"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_OPENSSL=y
> $ 
> $ echo $GCC_COLORS 
> error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01
> $
> $ make V=1 BR2_JLEVEL=1 openssl-dirclean openssl

Indeed, I could reproduce. Thanks.

So, I think Arnout is right in saying we should just globally unexport
GCC_COLORS and be done with that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
