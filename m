From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 16 Sep 2015 22:29:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable use of stack
 protector when not available
In-Reply-To: <20150916224451.45bbe561@free-electrons.com>
References: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
 <20150916224451.45bbe561@free-electrons.com>
Message-ID: <CA+BsyQ4dFvFDR_e_vQ++8LoH9DfR9w2urypZ17795mEd5ZH2yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> So same as for the sudo patch: I'm fine with applying your patches, but
> I'd prefer first to understand why we see this difference in behavior.

Thomas,

Yes I agree. This is a toolchain compilation issue and the right place
to solve it is there.

By way of an update, during the host-gcc-final build there is a check
for the symbol __stack_chk_fail. Under glibc and uclibc this test
fails, as expected. But under uclibc-ng, this test passes (ie returns
"yes") when it should actually fail, even though the symbol is
definitely not present. Inside the configure script there is some
logic that can cause it to return "yes" (for example, buildroot added
a patch such that when musl is detected it's hardcoded to always
return yes) so I'm trying to work out what code path in there is doing
this.

The presence of this symbol leads, ultimately, to slightly different
GCC specs. If it thinks that the target C library does not provide
SSP, GCC tries to link in its own SSP support libraries. This is the
path that is supposed to be executed. However, in the uclibc-ng case
we are wrongly detecting that the C library *does* have SSP even
though it doesn't. This causes the specs *not* to link the SSP support
libraries.

The reason why configure doesn't flag up a linker error in these
circumstances is because the conftest.c program is too simple. A
"hello world" type program does no stack operations and hence GCC
never emits any of the stack checking calls. So the problem slips
through the configure script.

So, once I've found out why uclibc-ng is triggering the false positive
in the GCC build I'll send in a patch.

Brendan
