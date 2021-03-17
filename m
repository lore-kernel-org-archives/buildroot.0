From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 22:33:02 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/libtheora: disable package
 if binutils is affected from bug 21464
In-Reply-To: <20210314225302.462b353d@windsurf.home>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-2-giulio.benetti@benettiengineering.com>
 <20210314225302.462b353d@windsurf.home>
Message-ID: <51b253de-be11-3908-698b-54cf5bfdeadc@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 3/14/21 10:53 PM, Thomas Petazzoni wrote:
> On Wed, 10 Mar 2021 10:14:48 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This package is affected from binutils bug 21464, since there is no
>> workaround, let's disable it.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/6c8/6c87be004adf03955c832be72c0c59749f311f71/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libtheora/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
> 
> This problem still affects binutils 2.33.1 and 2.34. Did you test with
> binutils 2.36 ?

Yes, tested with 2.36.1 and failed. This is the config used with today's 
master:
BR2_or1k=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_36_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBTHEORA=y

This is the output:
/home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: 
BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
/home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: 
BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
/home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: 
BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
collect2: error: ld returned 1 exit status

and no luck with -O0. I've also double-checked that this is bug 21464 
since its assert changed while binutils version advancing and it always 
asserts on the same point.

I've also pinged at binutils bugzilla:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
