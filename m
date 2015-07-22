From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 21:40:00 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722220606.58233cd0@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
 <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
 <20150722165405.217f4e4f@free-electrons.com>
 <CA+BsyQ67ic88wTW173o4QWbZS8d=cnSRh_2RDp4Ffs8T2Lsyeg@mail.gmail.com>
 <55AFB950.10603@zacarias.com.ar>
 <20150722220606.58233cd0@free-electrons.com>
Message-ID: <CA+BsyQ7p+dtTmE41+DvuyZ8n0jLgn_6agGpi5MuD2aUOR+e1Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Let's have a look at the issue on a per-package basis. For webkit, can
> it either avoid using atomic operations (like glib), or can we add a
> configure.ac test for the availability of the atomic operations, and if
> not available, attempt again with -latomic linked in?
>

Had a quick look at webkit. If we are talking about the same problem, the
offending section is in Source/WTF/wtf/Atomics.h : ("wtf" is a great name
for this module, with the amount of conditional stuff in here!)

==================
[..]
#elif COMPILER(GCC) && !CPU(SPARC64) // sizeof(_Atomic_word) != sizeof(int)
on sparc64 gcc
#define WTF_USE_LOCKFREE_THREADSAFEREFCOUNTED 1

inline int atomicIncrement(int volatile* addend) { return
__sync_add_and_fetch(addend, 1); }
inline int atomicDecrement(int volatile* addend) { return
__sync_sub_and_fetch(addend, 1); }

inline int64_t atomicIncrement(int64_t volatile* addend) { return
__sync_add_and_fetch(addend, 1); }
inline int64_t atomicDecrement(int64_t volatile* addend) { return
__sync_sub_and_fetch(addend, 1); }
#endif
==================

This is looks broken as it assumes that any non-SPARC GCC has a complete
atomic locking implementation. The WTF_USE_LOCKFREE_THREADSAREREFCOUNTED
part is then used to enable calls to the atomicIncrement functions. This
macro is checked in the same file, and also in ThreadSafeRefCounted.h in
the same directory. In each case they're doing something like this example:

==================
#if USE(LOCKFREE_THREADSAFEREFCOUNTED)
        atomicIncrement(&m_refCount);
#else
        MutexLocker locker(m_mutex);
        ++m_refCount;
#endif
==================

I think it would make sense to propose a similar upstream patch as glib, ie
check for __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 in addition to COMPILER(GCC).
I'd be happy to do this if you like.

Do we have a sample failing .config for this problem ? Is it also SPARC or
is it another arch ? (I think I saw Gustavo mentioning SH).

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/89948f4b/attachment.html>
