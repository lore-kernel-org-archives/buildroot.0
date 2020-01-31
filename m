From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 31 Jan 2020 10:33:39 +0100
Subject: [Buildroot] Linux kernel: host-libyaml dependency
In-Reply-To: <87lfposhfl.fsf@dell.be.48ers.dk>
References: <CAGm1_ktWWnNymXDhkKowu+0u2DSwqNA-3dW6hHy_omW_PXXdOg@mail.gmail.com>
 <87lfposhfl.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_kuySu9PVbXpJL5Z1V2UQj6C0cgiqgERoWrAC1FkT3sdAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 30, 2020 at 11:33 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
>  > I had a build breakage during the 5.4.15 kernel compilation because of
>  > the missing yaml library. The code in kernel is under scripts/dtc.
>
> Hmm, what is the error exactly?

>>> linux 5.4.15 Configuring
>>> linux 5.4.15 Building
PATH="/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/bin:/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
BR_BINARIES_DIR=/home/user/MyProjects/oss/br-test-v2/bsp-experimental/images
/usr/bin/make -j9 HOSTCC="/usr/bin/gcc -O2
-I/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/include
-L/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/lib
-Wl,-rpath,/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/lib"
ARCH=arm INSTALL_MOD_PATH=/home/user/MyProjects/oss/br-test-v2/bsp-experimental/target
CROSS_COMPILE="/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/bin/arm-linux-gnueabihf-"
DEPMOD=/home/user/MyProjects/oss/br-test-v2/bsp-experimental/host/sbin/depmod
INSTALL_MOD_STRIP=1 -C
/home/user/MyProjects/oss/br-test-v2/bsp-experimental/build/linux-5.4.15
all
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
  UPD     include/generated/uapi/linux/version.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-common.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-oabi.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-eabi.h
  WRAP    arch/arm/include/generated/uapi/asm/kvm_para.h
  WRAP    arch/arm/include/generated/uapi/asm/bitsperlong.h
  WRAP    arch/arm/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/arm/include/generated/uapi/asm/errno.h
  WRAP    arch/arm/include/generated/uapi/asm/ioctl.h
  WRAP    arch/arm/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/arm/include/generated/uapi/asm/msgbuf.h
  WRAP    arch/arm/include/generated/uapi/asm/param.h
  WRAP    arch/arm/include/generated/uapi/asm/poll.h
  WRAP    arch/arm/include/generated/uapi/asm/resource.h
  WRAP    arch/arm/include/generated/uapi/asm/sembuf.h
  WRAP    arch/arm/include/generated/uapi/asm/shmbuf.h
  WRAP    arch/arm/include/generated/uapi/asm/siginfo.h
  WRAP    arch/arm/include/generated/uapi/asm/socket.h
  WRAP    arch/arm/include/generated/uapi/asm/sockios.h
  WRAP    arch/arm/include/generated/uapi/asm/termbits.h
  WRAP    arch/arm/include/generated/uapi/asm/termios.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/yamltree.o
scripts/dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
 #include <yaml.h>
          ^~~~~~~~
compilation terminated.
  UPD     include/config/kernel.release
scripts/Makefile.host:124: recipe for target 'scripts/dtc/yamltree.o' failed
make[3]: *** [scripts/dtc/yamltree.o] Error 1
make[3]: *** Waiting for unfinished jobs....

> Is it this? From scripts/dtc/Makefile:
>
> ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> ifneq ($(CHECK_DTBS),)
> $(error dtc needs libyaml for DT schema validation support. \
>         Install the necessary libyaml development package.)

No.

> This seems to come from:
>
> commit 4f0e3a57d6eb727c54249542c509e0b7aa122465
> Author: Rob Herring <robh@kernel.org>
> Date:   Thu Sep 6 13:26:07 2018 -0500
>
>     kbuild: Add support for DT binding schema checks
>
>     This adds the build infrastructure for checking DT binding schema
>     documents and validating dts files using the binding schema.
>
>     Check DT binding schema documents:
>     make dt_binding_check
>
>     Build dts files and check using DT binding schema:
>     make dtbs_check
>
>     Optionally, DT_SCHEMA_FILES can be passed in with a schema file(s) to
>     use for validation. This makes it easier to find and fix errors
>     generated by a specific schema.
>
>     Currently, the validation targets are separate from a normal build to
>     avoid a hard dependency on the external DT schema project and because
>     there are lots of warnings generated.
>
>
> But this shouldn't trigger unless you are running 'make dtbs_check',
> which you presumably aren't?
>
>
>  > Has anyone encountered such a problem? Should we add host-libyaml
>  > unconditionally?
>
> We should definately not do it unconditionally, as it seems to only be
> needed for (a subset of the) systems using device-tree.
>
> Can you be more specific about what config triggers this for you?

deconfig is attached. My BR version is caff6dc4816c5279226c018ba10d5db71adb26eb.

Seems like some build order issue. This error can be triggered when I
make a full rebuild. But I cannot trigger it when I perform:

make clean; make linux

libyaml-dev is not installed on my host.

Regards,
Yegor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: defconfig
Type: application/octet-stream
Size: 1322 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200131/b5d9050b/attachment-0001.obj>
