From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 7 Dec 2017 20:28:39 +0100
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <20171206224419.GC2890@lianli.shorne-pla.net>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <20171128064921.GA27558@waldemar-brodkorb.de>
 <20171206004159.GA2890@lianli.shorne-pla.net>
 <CACPK8XcCua5m5HgaTP97=ccg8RTgFuRcwGAepRx6+_ocWc5mRw@mail.gmail.com>
 <20171206125530.GB2890@lianli.shorne-pla.net>
 <20171206182000.GE27558@waldemar-brodkorb.de>
 <20171206224419.GC2890@lianli.shorne-pla.net>
Message-ID: <20171207192839.GG27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Stafford Horne wrote,

> On Wed, Dec 06, 2017 at 07:20:00PM +0100, Waldemar Brodkorb wrote:
> > Hi Stafford,
> > Stafford Horne wrote,
> > 
> > > I was thinking we can just update : libc/sysdeps/linux/common/syscall.c
> > > 
> > > There is not much openrisc specific about this.  But it's up to Waldemar.
> > 
> > What are the advantages or disadvantages using it in
> > common/syscall.c?
> 
> The advantages would be that the code is generic enough to work for any
> architecture, reducing code needed for porting.  Also the implementation
> arguments will match the header delared arguments.
> 
> > Does it might break support for existing architectures using no
> > special syscall.c/syscall.S?
> 
> I dont think so, but some possible downsides:
>   - if those architectures have buggy handling of vargs it will have issues
>   - the varargs code might be sub optimal compared to the regular args code
> 
> I did a quick audit of some of the other syscall.c implementation so see if any
> other architectures use generic c code.
> 
>     ./libc/sysdeps/linux/common/syscall.c   COMMON generic implementation
>     ./libc/sysdeps/linux/arc/syscall.c      Same as COMMON
>     ./libc/sysdeps/linux/hppa/syscall.c     varargs + asm
>     ./libc/sysdeps/linux/frv/syscall.c      asm
>     ./libc/sysdeps/linux/c6x/syscall.c      varargs + asm
>     ./libc/sysdeps/linux/nds32/syscall.c    GENERIC varargs (7 args?)
>     ./libc/sysdeps/linux/arm/syscall.c      asm
>     ./libc/sysdeps/linux/metag/syscall.c    asm
> 
> So it looks like we could remove the arc and nds32 syscall.c files as they are
> generic.
> 
> The architectures using the common syscall.c are:
> 
>   bfin
>   h8300
>   lm32
>   m68k
>   microblaze
>   nios2
>   or1k
>   sh
> 
> If we feel we dont have good test coverage for these then maybe its best we just
> add this as a OR1K only file as per Joel's patch.

I checked the test suite and no syscall() is used.
Would it be possible for you to suggest a test case for syscall()?

Then I can run the tests for all architectures, where I can do
runtime testing.

best regards
 Waldemar
