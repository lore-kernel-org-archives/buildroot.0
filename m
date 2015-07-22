From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 16:54:05 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
 <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
Message-ID: <20150722165405.217f4e4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Wed, 22 Jul 2015 15:23:30 +0100, Brendan Heading wrote:

> ===================
> /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
> #if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && !defined(__clang__)
> #define USE_NATIVE_MUTEX
> #endif
> ===================
> 
> In other words, they're assuming (in essence) that if __ATOMIC_SEQ_CST is
> defined then the architecture must support atomic instructions. This
> assumption appears to be invalid.
> 
> GCC defines macros which indicate the presence of the atomic compare and
> swap functions, see :
> https://gcc.gnu.org/onlinedocs/cpp/Common-Predefined-Macros.html
> 
> If we fix the above code to :
> 
> ===================
> /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
> #if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) &&
> defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) && !defined(__clang__)
> #define USE_NATIVE_MUTEX
> #endif
> ===================
> 
> ... the package compiles cleanly. This sounds like what they actually
> intended to do, as their atomic macros (gatomic.h) test the compare & swap
> macros.

My fairly uninformed opinion is that this indeed looks like a good
approach. Though maybe Gustavo's more informed opinion might contradict
me on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
