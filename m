From: Sangjung Woo <again4you@gmail.com>
Date: Thu, 27 Mar 2014 23:48:08 +0900
Subject: [Buildroot] NPTL compile error without MMU (ARM)
In-Reply-To: <20140327074058.4059aa56@skate>
References: <5333C645.8000203@samsung.com> <20140327074058.4059aa56@skate>
Message-ID: <53343A28.9090300@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas


On 03/27/2014 03:40 PM, Thomas Petazzoni wrote:
> Dear Sangjung,
>
> On Thu, 27 Mar 2014 15:33:41 +0900, Sangjung wrote:
>> Dear developers.
>>
>> Hi. I found out that nptl make a compile error when MMU (i.e. 'Toolchain
>> - Enable MMU support')  is disabled.
>>
>> Detailed error message is as below.
>>
>> --------------------------------------------------------------------------------
>>
>> In file included from
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:31:0:
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:17: error:
>> 'fork' undeclared here (not in a function)
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:63:1: error:
>> '__libc_fork' redeclared as different kind of symbol
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: note:
>> previous declaration of '__libc_fork' was here
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:228:1: error:
>> 'fork' redeclared as different kind of symbol
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:227:1: note:
>> previous declaration of 'fork' was here
>> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:229:1: error:
>> '__EI_fork' aliased to undefined symbol '__GI_fork'
>> make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os] Error 1
>> --------------------------------------------------------------------------------
>>
>> This problem is already reported by Axel Lin.
>> (Link: http://lists.uclibc.org/pipermail/uclibc-cvs/2013-May/031094.html)
>>
>> However, it looks like that this issue is not solved for a long time.
>> If someone let me know the alternative solution, I'd be really happy.
> Thanks for your report. The problem really looks like a uClibc problem,
> so I would suggest you to take the uClibc configuration file in
> output/build/uclibc-<version>/.config, and sent the report to the
> uClibc developers. I am also on the uClibc mailing list, so I will be
> able to add additional Buildroot-specific details if requested by the
> uClibc developers.


After looking into this issue for a while,
in my opinion, buildroot generated the wrong configuration for uclibc.

I also found out that the _SAME_ problem already reported in _uclibc_ 
Bugzilla.
(URL: https://bugs.uclibc.org/show_bug.cgi?id=6224)


What if you want to reproduce this error,
'qemu_arm_versatile_defconfig' could be used as below.
Then, you will face the same errors that I reported.

---------------------------------------------
$ make qemu_arm_versatile_defconfig
Disable MMU (i.e. 'BR2_USE_MMU is not set' in .config)
$ make
---------------------------------------------


If I misunderstood something, let me know it.

BRs
Sangjung.
