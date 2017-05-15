From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 14 May 2017 20:09:31 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-11
In-Reply-To: <20170514211956.662430db@free-electrons.com>
References: <20170512062950.23CF0220A8@mail.free-electrons.com>
 <20170514174506.GA16283@itchy> <20170514211956.662430db@free-electrons.com>
Message-ID: <CANQCQpaFEJtVONm4=0nNvKCU0CYqNo+M87QEvXda3PLzHB6TLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Eric,

On Sun, May 14, 2017 at 2:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 14 May 2017 19:45:06 +0200, Eric Le Bihan wrote:
>
>> On 17-05-12 08:29:50, Thomas Petazzoni wrote:
>>
>> >        sparc |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/85062b5f9dbe74d7d1c6edfeda085268ecaef4c2 |
>>
>> This one is puzzling. The configure steps ends with the following error:
>>
>> ```
>> Checking whether system has auto-close after fd-passing...
>>   ... test crashed, aborting.
>>   make: ***
>>   [/accts/mlweber1/instance-2/output/build/skalibs-2.4.0.2/.stamp_configured]
>>   Error 111
>>   make: Leaving directory `/accts/mlweber1/instance-2/buildroot'
>> ```
>>
>> The configure script tries to cross-compile and execute a program
>> (tryancilautoclose). The cross-compilation succeeds and of course the
>> execution fails, as it means running a program compiled for the
>> SPARC architecture on a x86 machine. Normally, the shell which executes
>> the program should return the code 126, as mentioned in the list of Bash
>> exit codes with special meaning [1].
>>
>> Here the exit code is 111. When looking at tryancilautoclose.c, we can
>> see that 111 may be returned.
>>
>> So this error means that either the shell managed to execute the
>> cross-compiled program or the shell does not follow the convention [1].
>>
>> Which are the architecture of the build machine and the shell used?
>
> Thanks for investigating this issue. This build failure occurred on
> Matt Weber's autobuilder instance, so I've added him in Cc. His
> instance has already triggered some weird issues recently due to an
> unusual setup. Hopefully Matt will be able to shed some light on what's
> going on, possibly reproduce by hand the issue and investigate.
>

Here's the machine info
# uname -a
Linux largo 3.13.0-43-generic #72-Ubuntu SMP Mon Dec 8 19:35:06 UTC
2014 x86_64 x86_64 x86_64 GNU/Linux
# ls -l /bin/sh
lrwxrwxrwx 1 root root 4 Nov 18  2014 /bin/sh -> bash
# bash --version
GNU bash, version 4.3.11(1)-release (x86_64-pc-linux-gnu)

I'll kick off a manual recreation now and see how it ends up.

Matt
