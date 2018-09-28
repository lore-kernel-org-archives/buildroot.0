From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri, 28 Sep 2018 13:36:41 +0000
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <20180918155800.748eae34@windsurf>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
 <20180918111506.0648d78c@windsurf>
 <aae1bc5da723d9dd98ddd4dcc7868e4dacb4b6f8.camel@synopsys.com>
 <20180918112657.7d1b9d28@windsurf>
 <99fcad6be0ba045a8d00274723ac511be2805aac.camel@synopsys.com>
 <098ECE41A0A6114BB2A07F1EC238DE89667FD144@de02wembxa.internal.synopsys.com>
 <24f81ffc5c8606c74c9d478a29b245d7646b90f6.camel@synopsys.com>
 <20180918155800.748eae34@windsurf>
Message-ID: <a754fe5132d69d9b9b6d78d9d9e47f7245a2ebcd.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2018-09-18 at 15:58 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 18 Sep 2018 12:44:26 +0000, Alexey Brodkin wrote:
> 
> > Sure that's indeed an option. We'll just finally add "-mno-millicode"
> > in TARGET_ABI for ARC and forget about that class of problems. Also
> > maybe it worth having "-mno-millicode" set by default for Linux
> > toolchains so looking forward there will be no need to mess with
> > millicode manually.
> 
> Yes, that's indeed one solution, though the problem also exists for
> PowerPC, so it would have been nice to understand it.
> 
> What I find weird is that why it happens only with libaio ? I mean
> there are plenty of libraries built with -fpic, and libaio is the only
> one causing this problem. The fact that libaio is using -nostdlib
> -nostartfiles was an initial hint to explain why libgcc isn't brought
> into the link, but as Alexey said, removing -nostdlib -nostartfiles
> doesn't solve the problem.

Not sure what kind of pot I was smoking to make a conclusion that
removal of both "-nostdlib" and "nostartfiles" makes no difference.
Maybe my 

I returned back to this topic and decided to give it another shot based on
Debian fix you pointed me to [1]. And I do see it works for both PPC and ARC:
-------------------------------->8---------------------------------
# arc-linux-gcc -shared -Os -Wall -I. -fPIC -Wl,--version-script=libaio.map \
  -Wl,-soname=libaio.so.1 -o libaio.so.1.0.1 io_queue_init.os io_queue_release.os \
  io_queue_wait.os io_queue_run.os io_getevents.os io_submit.os io_cancel.os \
  io_setup.os io_destroy.os raw_syscall.os compat-0_1.os

# arc-linux-readelf -s libaio.so.1.0.1 | grep __ld
    59: 00000ab4    50 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r23_ret
    62: 00000ad0    22 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r16_ret
    63: 00000abc    42 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r21_ret
    65: 00000ac4    34 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r19_ret
    66: 00000ab8    46 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r22_ret
    77: 00000acc    26 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r17_ret
    83: 00000ab0    54 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r24_ret
    84: 00000ac8    30 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r18_ret
    86: 00000aac    58 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r25_ret
    88: 00000ac0    38 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r20_ret
    89: 00000ad4    18 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r15_ret
    94: 00000ad8    14 FUNC    LOCAL  DEFAULT   11 __ld_r13_to_r14_ret

# arc-linux-gcc -shared -Os -nostdlib -nostartfiles -Wall -I. -fPIC \
  -Wl,--version-script=libaio.map -Wl,-soname=libaio.so.1 -o libaio.so.1.0.1 \
  io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
  io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os \
  raw_syscall.os compat-0_1.os

#  arc-linux-readelf -s libaio.so.1.0.1 | grep __ld
     4: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r16_ret
     6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r19_ret
     9: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r17_ret
    11: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r15_ret
    42: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r16_ret
    44: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r19_ret
    51: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r17_ret
    55: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __ld_r13_to_r15_ret
-------------------------------->8---------------------------------

You see in case of "-nostdlib" and "nostartfiles" absence symbol
__ld_rX_to_rY_ret is LOCAL while in presence of them 
__ld_rX_to_rY_ret is GLOBAL - and that's what you expected :)

That said I created a pull-request with corresponding fix for libaio [2]
and will shortly send a patch for Buildroot with it.

[1] https://sources.debian.org/patches/libaio/0.3.111-1/01_link_libs.patch/
[2] https://pagure.io/libaio/pull-request/7

-Alexey
