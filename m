From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 15:23:30 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55AF91B5.8050806@zacarias.com.ar>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
Message-ID: <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Thomas,

Thanks for the helpful explanation earlier.

>> *Or*, maybe better, we fix those packages so that they do the right
>> configure.ac test and automatically link with libatomic if needed.
>> Probably this is what glib should do, for example. This reduces the
>> crap in Buildroot, and allows to push the solution to the upstream
>> projects. I don't think that many packages have atomic operations
>> requirements, so it should not be a horrible effort.
>>
>> Thoughts?
>
>
> The problem is that packages might have a valid reason for not doing so,
like what glib explicitly says "lockless atomics", libatomic implements the
fallback via locks.
> One of the fallbacks is that performance will suffer possibly a lot
(depending on usage), there may be other drawbacks that i'm not aware of.

I have a compromise idea for libglib2. It involves asking the upstream to
patch but avoids extra configure.ac magic. I think the same principle
applies for all packages dealing with this problem.

The problematic code in libglib2's gthread-posix.c can be traced back to
this compile-time decision point :

===================
/* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && !defined(__clang__)
#define USE_NATIVE_MUTEX
#endif
===================

In other words, they're assuming (in essence) that if __ATOMIC_SEQ_CST is
defined then the architecture must support atomic instructions. This
assumption appears to be invalid.

GCC defines macros which indicate the presence of the atomic compare and
swap functions, see :
https://gcc.gnu.org/onlinedocs/cpp/Common-Predefined-Macros.html

If we fix the above code to :

===================
/* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) &&
defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) && !defined(__clang__)
#define USE_NATIVE_MUTEX
#endif
===================

... the package compiles cleanly. This sounds like what they actually
intended to do, as their atomic macros (gatomic.h) test the compare & swap
macros.

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/a771c329/attachment.html>
