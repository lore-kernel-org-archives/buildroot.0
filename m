From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 18 Sep 2018 09:17:20 +0000
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <20180918111506.0648d78c@windsurf>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
 <20180918111506.0648d78c@windsurf>
Message-ID: <aae1bc5da723d9dd98ddd4dcc7868e4dacb4b6f8.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2018-09-18 at 11:15 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 18 Sep 2018 08:03:19 +0000, Alexey Brodkin wrote:
> 
> > This is how libaio.so is linked now (before my patch) with
> > omitted some non-important options:
> > ----------------------->8-------------------  
> > arc-buildroot-linux-uclibc-gcc -shared -matomic -Os -nostdlib -nostartfiles -fPIC \
> >   -o libaio.so io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
> >   io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os raw_syscall.os compat-0_1.os
> > ----------------------->8-------------------  
> > 
> > And that's what happens with my patch:
> > ----------------------->8-------------------  
> > arc-buildroot-linux-uclibc-gcc -shared -matomic -Os -nostdlib -nostartfiles -fPIC \
> >   -o libaio.so io_queue_init.os io_queue_release.os io_queue_wait.os io_queue_run.os \
> >   io_getevents.os io_submit.os io_cancel.os io_setup.os io_destroy.os raw_syscall.os compat-0_1.os -lgcc
> > ----------------------->8-------------------  
> > 
> > Note "-lgcc" in the latter case.
> 
> Thank you, I do understand that passing LDFLAGS=-lgcc will add -lgcc to
> the link command line :-)
> 
> The question is: why does libaio needs to be told explicitly to link
> against libgcc, and not any other package.
> 
> And I believe the reason is because -nostdlib -nostartfiles are used.
> Why is libaio using those flags? Is there a good reason ?

I tried removing those 2 as the first thing but it made no difference
until I added "-lgcc" explicitly.

-Alexey
