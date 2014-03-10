From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 10 Mar 2014 22:27:10 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140307093056.23f6c021@skate>
References: <20140303090219.65a08cc7@skate>	<495852511.10469178.1393846305700.JavaMail.root@openwide.fr>	<20140303134805.2eb084c4@skate>	<5319165F.2080401@openwide.fr>
 <20140307093056.23f6c021@skate>
Message-ID: <531E2E2E.1030203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 07/03/2014 09:30, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Fri, 07 Mar 2014 01:44:15 +0100, Romain Naour wrote:
>
>> It seems that __ELF__ has been removed from gcc
> I don't really the relation between this statement you're making.
>
>> http://gcc.gnu.org/gcc-4.9/changes.html
>> "Support for a number of older systems and recently unmaintained or
>> untested target ports of GCC has been declared obsolete in GCC 4.9"
> And this statement.
I'm sorry, I spoke too hastily...
Curiosity brought me to look at this problem and find where __ELF__ was 
defined.
But this is the first time I look at the code of gcc, so I could be wrong.

>> (version 4.9.0)
>> ./microblaze-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__
>>
>> (version 4.7.2)
>> (code sourcery toolchain x86)
>> ./i686-pc-linux-gnu-cpp -dM /dev/null | grep __ELF__
>> #define __ELF__ 1
>>
>> (version 4.8.2)
>> (buildroot internal toolchain x86)
>> ./i686-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__
>> #define __ELF__ 1
> And a x86 toolchain with gcc 4.9.x ?
(version 4.9.0-20140302)
./i686-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__
#define __ELF__ 1

Ok, it'snot a problem related to gcc version...

I found an discussion about missing elfos.h in config.gcc for microblaze :
http://gcc.gnu.org/ml/gcc-patches/2013-07/msg01341.html
This header add a macro that define __ELF__ with builtin_define ("__ELF__").

So, I don't know how to solve this problem properly except placing
"builtin_define ("__ELF__")" in gcc/config/microblaze/microblaze-c.c

Really need a gcc/microblaze specialist here...
>> I'll send a patch to remove this test since buildroot does not have
>> support for non ELF system.
> That's not true: we support Blackfin FLAT, which is not an ELF binary
> format.
>
> Thomas
Understood, thank you for your explanation.

Best regards,
Romain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140310/235aca92/attachment.html>
