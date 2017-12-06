From: Stafford Horne <shorne@gmail.com>
Date: Wed, 6 Dec 2017 09:41:59 +0900
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <20171128064921.GA27558@waldemar-brodkorb.de>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <20171128064921.GA27558@waldemar-brodkorb.de>
Message-ID: <20171206004159.GA2890@lianli.shorne-pla.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2017 at 07:49:21AM +0100, Waldemar Brodkorb wrote:
> Hi Joel,
> Joel Stanley wrote,
> 
> > Hello,
> > 
> > I did a build of the Buildroot Openrisc Qemu defconfig and attempted
> > to run some userspace tools. They were failing in strange ways:
> 
> Can you test the buildroot patch I have sent to the mailinglist,
> it updates uClibc-ng 1.0.27. This contains a lot of critical
> bugfixes for or1k from Stafford.

Hello,

I tested with this I am still getting the same error.  I think I figured
out the issue though.  The issue is busybox internally calls syscall(2).

 - in unistd.h defined something like
   int syscall(nr, ....)

 - in syscall.c (common) implemented as
   int syscall(nr, arg1, arg3, arg3, arg4, arg5, arg6)

This will not work, busybox thinks syscall should have varargs calling
conventions.  But it doesnt in the uclibc implementation so no args go through.

Most architectures this will work.  But on openrisc varargs are all sent on the
stack.  Regular args are passed in registers.

For openrisc I think we need a custom implementation of syscall(2).

-Stafford
