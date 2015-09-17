From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 17 Sep 2015 15:16:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable use of stack
 protector when not available
In-Reply-To: <55FA9501.9040109@zacarias.com.ar>
References: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
 <20150916224451.45bbe561@free-electrons.com>
 <CA+BsyQ4dFvFDR_e_vQ++8LoH9DfR9w2urypZ17795mEd5ZH2yA@mail.gmail.com>
 <20150916234321.7d49a220@free-electrons.com>
 <CA+BsyQ7Hr2XLUo5zFb=XOd062NMsU-K7mXS68kV3z-irEfvUxw@mail.gmail.com>
 <55FA9501.9040109@zacarias.com.ar>
Message-ID: <CA+BsyQ41u5r2JmWPV+bP=ji+bhbtSinYYCOYuwjJKR1_0Yd8AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> thanks for the tip - I will find out why that scenario seems to work,
>> after I've identified the failure mode of the one I'm looking at now.
>
> Hi.
> See
> http://git.buildroot.net/buildroot/tree/package/samba4/0002-build-improve-stack-protector-check.patch
> I've pointed Vicente to that problem when bumping to samba 4.3.0, and from
> the test in Ruby's configure.in i'm 99% certain we're seeing the same issue
> - the compiler optimizes away any stack usage when the test program does
> nothing, hence building/linking inserts no guards, thus "it works" (though
> not quite in reality).

Gustavo,

Yes, that's exactly what I'm seeing.

A regular main() which does nothing will not show the problem. I found
that if the test is extended so that a simple function is called,
which takes a pointer to an array and updates it, will properly test
what the compiler does, but some more testing would be needed to make
sure that it holds up under more aggressive optimisation flags (such
as using LTO).

> The solution is having a foolproof test that can't be optimized away,
> unfortunately many packagers/developers use this simplified test that is
> flawed, it will require a lot of education to properly fix :)
> (test program formulated together with Vicente and Arnout).

There are probably quite a few packages that have this problem.

However, there's definitely a problem with GCC. I posted a lengthy
explanation last night, but basically GCC assumes that if glibc
version 2.4 or greater is in use (as determined by __GLIBC__ and
__GLIBC_MINOR__) then the C library includes stack protection support,
which is a false assumption in the case of uclibc-ng.

I'm about to submit an initial patch which works, but it's not a very
satisfactory solution - I will CC you for comments.

regards

Brendan
