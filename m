From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Jan 2014 14:17:31 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: update Linaro
	AArch64 toolchains
In-Reply-To: <87ob3zpbqa.fsf@dell.be.48ers.dk>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LX9ZMaBppPWkRG1me5h5EZ9umV-8MGKWVyN+EbAW4_hjg@mail.gmail.com>
 <20131229185313.43b17aaa@skate> <87ob3zpbqa.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LW+E2KLPs8y88SCYe_eXJOMEAg9rGQyr+vcib+Ttn1cWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Dec 29, 2013 at 10:51 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>  > Why would we keep a very old gcc 4.7.x toolchain, but immediately get
>  > rid of a more recent gcc 4.8 toolchain that is based on eglibc 2.17 ?
>
>  > As we never managed to come up with a reasonable model to handle this,
>  > I believe we should in the mean time continue to update the toolchains
>  > as we used to do in the past.
>
> Agreed.

While I agree that the existing patchset could continue in the
meanwhile, I think it is worth revisiting the core discussion. For
reference, here is the previous discussion:
http://lists.busybox.net/pipermail/buildroot/2013-October/080119.html

Back then (October) there was not much debate about the idea of only
providing sufficiently-different versions of the Linaro toolchains.
The biggest problem was how to identify the toolchains so that 'minor'
updates can keep the same config symbol (and thus be transparent to
users). This boils down to the question: which parts of the toolchain
may change to continue considering it as 'the same' toolchain.
I think everyone will agree that a new gcc version or a new C library
version means a different toolchain.
However, what about the other parts? If Linaro updates binutils, do we
consider it the same toolchain or not?

Based on this we could devise some logical names of the config symbols.
Note that this does not mean we can't change our minds later. Suppose
we start with the gcc/libc combination as key, and we'd have symbols
LINARO_GCC_4_8_GLIBC_2_17
LINARO_GCC_4_8_GLIBC_2_18
LINARO_GCC_5_0_GLIBC_2_18

and suddenly Linaro releases a toolchain with the same gcc and glibc
version, but some other change that we consider as significant. Then
at that point we can simply introduce a new symbol and keep both, for
example:
LINARO_GCC_4_8_GLIBC_2_17
LINARO_GCC_4_8_GLIBC_2_18
LINARO_GCC_5_0_GLIBC_2_18
LINARO_GCC_5_0_GLIBC_2_18_OTHER_FEATURE


Does this make sense? Did I overlook something?

Thanks,
Thomas
