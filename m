From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 11:15:06 +0200
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
Message-ID: <20180918111506.0648d78c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 08:03:19 +0000, Alexey Brodkin wrote:

> This is how libaio.so is linked now (before my patch) with
> omitted some non-important options:
> ----------------------->8-------------------  
> arc-buildroot-linux-uclibc-gcc -shared -matomic -Os -nostdlib -nostartfiles -fPIC \
>   -o libaio.so io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
>   io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os raw_syscall.os compat-0_1.os
> ----------------------->8-------------------  
> 
> And that's what happens with my patch:
> ----------------------->8-------------------  
> arc-buildroot-linux-uclibc-gcc -shared -matomic -Os -nostdlib -nostartfiles -fPIC \
>   -o libaio.so io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
>   io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os raw_syscall.os compat-0_1.os -lgcc
> ----------------------->8-------------------  
> 
> Note "-lgcc" in the latter case.

Thank you, I do understand that passing LDFLAGS=-lgcc will add -lgcc to
the link command line :-)

The question is: why does libaio needs to be told explicitly to link
against libgcc, and not any other package.

And I believe the reason is because -nostdlib -nostartfiles are used.
Why is libaio using those flags? Is there a good reason ?

> Now let's see what happens with millicode symbols in both cases.
> Pre-patch case:
> ----------------------->8-------------------  
> # arc-linux-gnu-readelf -s libaio.so | grep __st_r13_to_r17
>     3: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __st_r13_to_r17
>    41: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __st_r13_to_r17
> ----------------------->8-------------------  
> 
> Note millicode's "__st_r13_to_r17" is GLOBAL UNDEFINED symbol.
> Thus during linkage of the final application that symbol will
> need to be resolved and LD finds it in libgcc.a and essentially
> refuses to proceed as there's no way for shared library to
> use a function that is implemented in a different static library.
> 
> Post-patch case:
> ----------------------->8-------------------  
> # arc-linux-gnu-readelf -s libaio.so | grep __st_r13_to_r17
>    38: 000006cc    18 FUNC    LOCAL  DEFAULT    9 __st_r13_to_r17
> ----------------------->8-------------------  
> 
> Note "__st_r13_to_r17" is locally defined so shared library doesn't
> need anything from libgcc.a.

Indeed.

> > Why is this problem happening only with libaio, and not with other
> > packages ?  
> 
> That's a good question :)
> I may assume other shared libs gets linked with libgcc.a, i.e. all
> symbols from libgcc including millicode get built into libXXX.so.

See above: -nostdlib -nostartfiles are used in libaio. That's the
difference. The question is why libaio is using those flags.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
