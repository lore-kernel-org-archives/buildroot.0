From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2017 23:08:41 +1030
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <20171206004159.GA2890@lianli.shorne-pla.net>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <20171128064921.GA27558@waldemar-brodkorb.de>
 <20171206004159.GA2890@lianli.shorne-pla.net>
Message-ID: <CACPK8XcCua5m5HgaTP97=ccg8RTgFuRcwGAepRx6+_ocWc5mRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 6, 2017 at 11:11 AM, Stafford Horne <shorne@gmail.com> wrote:
> I tested with this I am still getting the same error.  I think I figured
> out the issue though.  The issue is busybox internally calls syscall(2).
>
>  - in unistd.h defined something like
>    int syscall(nr, ....)
>
>  - in syscall.c (common) implemented as
>    int syscall(nr, arg1, arg3, arg3, arg4, arg5, arg6)
>
> This will not work, busybox thinks syscall should have varargs calling
> conventions.  But it doesnt in the uclibc implementation so no args go through.
>
> Most architectures this will work.  But on openrisc varargs are all sent on the
> stack.  Regular args are passed in registers.
>
> For openrisc I think we need a custom implementation of syscall(2).

Great find! I hacked up an implementation up and did a buildroot
build, and it passed my testcase (`strace ping 127.0.0.1`).

The patch is attached. It might be a better idea to load the varargs
directly into registers like the cx6 port does. Let me know what you
think, and I can post it to the uclibc-ng list.

Cheers,

Joel
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-or1k-syscall-Pass-arguments-on-the-stack.patch
Type: text/x-patch
Size: 2557 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171206/0e6b6207/attachment.bin>
