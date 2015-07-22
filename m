From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 09:51:01 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722144535.103766f3@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>	<20150722094349.424e7a3e@free-electrons.com>	<CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>	<CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>	<55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
Message-ID: <55AF91B5.8050806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/07/15 09:45, Thomas Petazzoni wrote:

> Ok, thanks for the summary. If I summarize it another way:
>
>   * Some packages use atomic operations, operating on values of
>     different sizes
>
>   * Some architectures implement all the atomic operations in a built-in
>     way, but some architectures need libatomic to be linked in to
>     provide the atomic operations on certain value sizes.


Yup, that nails it.

> *Or*, maybe better, we fix those packages so that they do the right
> configure.ac test and automatically link with libatomic if needed.
> Probably this is what glib should do, for example. This reduces the
> crap in Buildroot, and allows to push the solution to the upstream
> projects. I don't think that many packages have atomic operations
> requirements, so it should not be a horrible effort.
>
> Thoughts?

The problem is that packages might have a valid reason for not doing so, 
like what glib explicitly says "lockless atomics", libatomic implements 
the fallback via locks.
One of the fallbacks is that performance will suffer possibly a lot 
(depending on usage), there may be other drawbacks that i'm not aware of.
Regards.
