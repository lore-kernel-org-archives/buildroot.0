From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Sep 2015 07:25:05 -0300
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable use of stack
 protector when not available
In-Reply-To: <CA+BsyQ7Hr2XLUo5zFb=XOd062NMsU-K7mXS68kV3z-irEfvUxw@mail.gmail.com>
References: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
 <20150916224451.45bbe561@free-electrons.com>
 <CA+BsyQ4dFvFDR_e_vQ++8LoH9DfR9w2urypZ17795mEd5ZH2yA@mail.gmail.com>
 <20150916234321.7d49a220@free-electrons.com>
 <CA+BsyQ7Hr2XLUo5zFb=XOd062NMsU-K7mXS68kV3z-irEfvUxw@mail.gmail.com>
Message-ID: <55FA9501.9040109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/09/15 18:46, Brendan Heading wrote:

>> Thanks for the update. However, notice that the toolchain at
>> http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.08-rc1-38-gad0f85e.tar.bz2
>> is capable of building sudo and ruby, even if:
>>
>>   1/ It is using uClibc-ng 1.0.5
>>   2/ It has SSP disabled: #undef __UCLIBC_HAS_SSP__
>>
>> So it's not simply a matter of uClibc vs. uClibc-ng, since one
>> uClibc-ng toolchains works fine.
>
> Thomas,
>
> thanks for the tip - I will find out why that scenario seems to work,
> after I've identified the failure mode of the one I'm looking at now.

Hi.
See 
http://git.buildroot.net/buildroot/tree/package/samba4/0002-build-improve-stack-protector-check.patch
I've pointed Vicente to that problem when bumping to samba 4.3.0, and 
from the test in Ruby's configure.in i'm 99% certain we're seeing the 
same issue - the compiler optimizes away any stack usage when the test 
program does nothing, hence building/linking inserts no guards, thus "it 
works" (though not quite in reality).
The solution is having a foolproof test that can't be optimized away, 
unfortunately many packagers/developers use this simplified test that is 
flawed, it will require a lot of education to properly fix :)
(test program formulated together with Vicente and Arnout).
Regards.
