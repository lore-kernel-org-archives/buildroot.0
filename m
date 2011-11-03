From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 3 Nov 2011 10:27:58 +0100
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <CAAXf6LXV-aQgMNarenZa0ZpWpytQZKbeBnL83wKr5E-eK_bCOA@mail.gmail.com>
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate> <20110930214150.770f09e1@skate>
 <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
 <20111001113902.2aeff98d@skate>
 <CAAXf6LXV-aQgMNarenZa0ZpWpytQZKbeBnL83wKr5E-eK_bCOA@mail.gmail.com>
Message-ID: <CAAXf6LVTAU73avFA3BJXEvcbVoQj6er1PFg-ntjLo9F3tc6hOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Oct 3, 2011 at 8:21 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Thomas,
>
> On Sat, Oct 1, 2011 at 11:39 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Le Fri, 30 Sep 2011 23:12:52 +0200,
>> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>>
>>> An eglibc toolchain built with crosstool-ng, also works (both
>>> compilation as running on target).
>>
>> Ok. It would be good to identify whether Valgrind can be built with
>> uClibc with additional configuration options, or if glibc/eglibc is
>> really needed. In the former case, additional documentation in the
>> Config.in help would be good. In the latter case, some additional
>> "depends on" to hide valgrind when uClibc is used would be nice.
>
> Agreed. I will try to look at this when I have some time.

I did some further investigation on this.

Valgrind includes <a.out.h> which is provided by the C library.
With eglibc, the provided a.out.h has its own definitions, not
depending on linux.
With uClibc, the provided a.out.h includes <linux/a.out.h>, which is
supposed to come from the kernel headers. But, that a.out.h file is
not always present in the headers. The include/linux/Kbuild file has
the following lines:

ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/a.out.h \
                  $(srctree)/include/asm-$(SRCARCH)/a.out.h),)
header-y += a.out.h
endif

which say that a.out.h is only included in the headers if there is an
arch/<arch>/include/asm/a.out.h or include/asm-<arch>/a.out.h file.
For powerpc, there is no such file, only for x86, m68k, arm and alpha.

Possible solutions?
1. Modify uClibc so that it does not depend on the linux a.out.h file,
but rather provides its own definitions as eglibc does.
2. Modify the kernel so that powerpc also provides a.out.h
3. Modify buildroot to state that valgrind can not be build with uClibc.

Option 1 would be the best realistic overall solution, but requires a
uClibc developer to look into this (I don't have time for this,
unfortunately).
Option 3 would be the best alternative.

I added the uClibc mailing list to this thread. If anyone is
interested in making valgrind usable with uClibc, please step forward.

Thanks,
Thomas
