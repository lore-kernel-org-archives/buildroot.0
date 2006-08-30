From: Ed Swierk <eswierk@arastra.com>
Date: Wed, 30 Aug 2006 15:23:28 -0700
Subject: [Buildroot] Exception support
In-Reply-To: <200608290041.27413.thomas.moschny@gmx.de>
References: <200608290041.27413.thomas.moschny@gmx.de>
Message-ID: <c1bf1cf0608301523u1970bd8en61c048b94e796167@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8/28/06, Thomas Moschny <thomas.moschny@gmx.de> wrote:
> is there a way to get a toolchain built for i686, that supports C++
> exceptions?
>
> In a buildroot naively build using gcc 4.1.0 or 4.1.1 and uclibc 0.9.28, C++
> exceptions don't work. Apps instead abort with "terminate called after
> throwing an instance of foo" when an exception of type foo is thrown.

I've got C++ exceptions working with gcc 4.1.1 by enabling
BR2_GCC_USE_SJLJ_EXCEPTIONS in my buildroot configuration, and
changing --disable-__cxa_atexit to --enable-__cxa_atexit in
gcc-uclibc-3.x.mk. The former forces gcc to implement exceptions with
setjmp/longjmp rather than the more efficient stack unwinding, while
the latter enables code ensuring that static objects are cleaned up
properly on exit.

Apparently it is even possible to get stack unwinding to work, but I
have not tried it myself. See the thread beginning at
http://uclibc.org/lists/uclibc/2006-August/016090.html .

--Ed
