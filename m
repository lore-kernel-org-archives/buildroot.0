From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:09:47 +0200
Subject: [Buildroot] [PATCH 2/2] xen: Remove TARGET_CONFIGURE_OPTS from
 make
In-Reply-To: <dd89e679-681d-a3e6-b37e-1beea8744937@mind.be>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
 <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
 <dd89e679-681d-a3e6-b37e-1beea8744937@mind.be>
Message-ID: <20160917160947.1b29638d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 01:23:32 +0200, Arnout Vandecappelle wrote:
> On 13-09-16 22:45, Alistair Francis wrote:
> > The TARGET_CONFIGURE_OPTS variable resulted in a double definition
> > error:
> > <command-line>:0:0: error: "__OBJECT_FILE__" redefined [-Werror]
> > 
> > Remove the options to avoid the error.  
> 
>  This doesn't look right. TARGET_CONFIGURE_OPTS definitely doesn't
> contain -D__OBJECT_FILE__ (or you have some very weird stuff in
> BR2_TARGET_OPTIMIZATION).

It doesn't look right, but it's actually what happens. When we pass our
TARGET_CONFIGURE_OPTS, what happens is:

/home/thomas/projets/buildroot/output/host/usr/bin/aarch64-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -O2 -fomit-frame-pointer -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2 -fomit-frame-pointer -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2 -fomit-frame-pointer -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable
-Wno-unused-local-typedefs -DNDEBUG -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -pipe -g -D__XEN__ -include /home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/include/xen/config.h '-D__OBJECT_FILE__="/home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/xen"' -Wa,--strip-local-absolute -MMD -MF /home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/.xen.d -mcpu=generic -mgeneral-regs-only -I/home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/include -fno-stack-protector -fno-exceptions -Wnested-externs -DGCC_HAS_VISIBILITY_ATTRIBUTE -O2 -fomit-frame-pointer -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2 -fomit-frame-pointer -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -DNDEBUG -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -pipe -g -D__XEN__ -include /home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/include/xen/config.h '-D__OBJECT_FILE__="asm-offsets.s"' -Wa,--strip-local-absolute -MMD -MF ./.asm-offsets.s.d -mcpu=generic -mgeneral-regs-only -I/home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/include -fno-stack-protector -fno-exceptions -Wnested-externs -DGCC_HAS_VISIBILITY_ATTRIBUTE -S -o asm-offsets.s arm64/asm-offsets.c
<command-line>:0:0: error: "__OBJECT_FILE__" redefined [-Werror]
<command-line>:0:0: note: this is the location of the previous definition
cc1: all warnings being treated as errors
Makefile:103: recipe for target 'asm-offsets.s' failed
make[5]: *** [asm-offsets.s] Error 1

So _OBJECT_FILE_ is really defined twice, once incorrectly, and the
second time correctly.

When we stop passing $(TARGET_CONFIGURE_OPTS), the same compilation
step looks like this:

/home/thomas/projets/buildroot/output/host/usr/bin/aarch64-linux-gnu-gcc -O2 -fomit-frame-pointer -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -DNDEBUG -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -pipe -g -D__XEN__ -include /home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/include/xen/config.h '-D__OBJECT_FILE__="asm-offsets.s"' -Wa,--strip-local-absolute -MMD -MF ./.asm-offsets.s.d -mcpu=generic -mgeneral-regs-only -I/home/thomas/projets/buildroot/output/build/xen-4.7.0/xen/include -fno-stack-protector -fno-exceptions -Wnested-externs -DGCC_HAS_VISIBILITY_ATTRIBUTE -S -o asm-offsets.s arm64/asm-offsets.c

And the build succeeds.

So apparently, the fact that we are passing our own CFLAGS confuses the
Xen build system, which then adds its own CFLAGS twice for some reason.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
