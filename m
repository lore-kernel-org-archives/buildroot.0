From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Nov 2014 18:30:12 +0100
Subject: [Buildroot] [PATCH v2 13/15] erlang-p1-iconv: new package.
In-Reply-To: <20141110163700.GE2466@free.fr>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-14-git-send-email-johan.oudinet@gmail.com>
 <20141110163700.GE2466@free.fr>
Message-ID: <20141110173012.GA22119@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-11-10 17:37 +0100, Yann E. MORIN spake thusly:
> On 2014-11-07 14:28 +0100, Johan Oudinet spake thusly:
> > Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> > ---
> >  package/Config.in                          |  1 +
> >  package/erlang-p1-iconv/Config.in          |  6 ++++++
> >  package/erlang-p1-iconv/erlang-p1-iconv.mk | 17 +++++++++++++++++
> >  3 files changed, 24 insertions(+)
> >  create mode 100644 package/erlang-p1-iconv/Config.in
> >  create mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk
> [--SNIP--]
> 
> While I was reviewing the other patches, I got a build failure with this
> package (long lines may have got split in the copy-paste):
> 
> Compiling c_src/iconv.c
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lerl_interface
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lei
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lerl_interface
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lei
> collect2: error: ld returned 1 exit status
> ERROR: sh(/home/ymorin/dev/buildroot/O/host/usr/bin/armv6-rpi-linux-gnueabihf-gcc
> c_src/iconv.o
> -L/home/ymorin/dev/buildroot/O/target/usr/lib/erlang/lib/erl_interface-/lib
> -lerl_interface -lei  -shared
> -L/home/ymorin/dev/buildroot/O/target/usr/lib/erlang/lib/erl_interface-/lib
> -lerl_interface -lei -o priv/lib/iconv.so)
> failed with return code 1 and the following output:
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lerl_interface
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lei
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lerl_interface
> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> cannot find -lei
> collect2: error: ld returned 1 exit status
> 
> ERROR: compile failed while processing
> /home/ymorin/dev/buildroot/O/build/erlang-p1-iconv-dff5ee5: rebar_abort
> 
> Here is my defconfig file:
> 
> BR2_armeb=y
> BR2_arm1176jzf_s=y
> BR2_ARM_EABIHF=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="/home/ymorin/x-tools/armv6-rpi-linux-gnueabihf"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv6-rpi-linux-gnueabihf"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_ERLANG=y
> BR2_PACKAGE_EJABBERD=y

I still get the same error with this defconfig:

BR2_armeb=y
BR2_cortex_a9=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ERLANG=y
BR2_PACKAGE_EJABBERD=y

But I can see the missing libs to be present, except the path to them is
not specified in the compile line:
    staging/usr/lib/erlang/usr/lib/liberl_interface.a
    staging/usr/lib/erlang/usr/lib/libei.a

Except it seems weird to have ".../erlang/usr/lib/..." to begin with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
