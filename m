From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu, 17 Sep 2015 12:13:01 +0100
Subject: [Buildroot] sysvinit-2.88 build is failing for ARM64
In-Reply-To: <20150917111217.GP11632@tarshish>
References: <ec4144432f3279ce0594dd6adbd847f5e4a7fb13.1442482205.git.jpinto@synopsys.com>
 <55FA95DB.80408@synopsys.com> <20150917103540.GO11632@tarshish>
 <55FA986B.9080208@synopsys.com> <55FA9C24.2060901@synopsys.com>
 <20150917111217.GP11632@tarshish>
Message-ID: <55FAA03D.2020705@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Yes I am already making it. Patch will be sent in a sec.

Joao

On 9/17/2015 12:12 PM, Baruch Siach wrote:
> Hi Joao,
> 
> On Thu, Sep 17, 2015 at 11:55:32AM +0100, Joao Pinto wrote:
>> The library is checked as:
>> ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
>>
>> And the library is located at:
>> output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/libcrypt.a
>>
>> Maybe for ARM64 we have to make an extra check?
> 
> This check is from package/sysvinit/0001-fix-libcrypt-test.patch. You'll 
> probably need to adjust that patch to match this Linaro toolchain.
> 
> baruch
> 
>> On 9/17/2015 11:39 AM, Joao Pinto wrote:
>>> On 9/17/2015 11:35 AM, Baruch Siach wrote:
>>>> On Thu, Sep 17, 2015 at 11:28:43AM +0100, Joao Pinto wrote:
>>>>> I am trying to build sysvinit-2.88 for ARM64 and it is failing as shown 
>>>>> bellow:
>>>>>
>>>>> Error log:
>>>>>
>>>>> droot-linux-gnu/sysroot -C
>>>>> /media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/src
>>>>> make[1]: Entering directory
>>>>> `/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/src'
>>>>> /media/Dev_Disk/buildroot-junor1/output/host/usr/bin/aarch64-linux-gnu-gcc
>>>>> sulogin.o    -o sulogin
>>>>> /media/Dev_Disk/buildroot-junor1/output/host/usr/bin/aarch64-linux-gnu-gcc
>>>>> last.o oldutmp.h   -o last
>>>>> sulogin.o: In function `main':
>>>>> sulogin.c:(.text.startup+0x648): undefined reference to `crypt'
>>>>> collect2: error: ld returned 1 exit status
>>>>> make[1]: *** [sulogin] Error 1
>>>>> make[1]: *** Waiting for unfinished jobs....
>>>>> make[1]: Leaving directory
>>>>> `/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/src'
>>>>> make: ***
>>>>> [/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/.stamp_built] Error 2
>>>>>
>>>>> I have checked from mailing history that this problem has already been addressed
>>>>> and tested against X86_64. Did anyone tested in ARM64?
>>>>> In the meanwhile I will try to fix this problem and I will send the fix patch.
>>>>
>>>> Please attach the Buildroot .config file to your failure reports so we can try 
>>>> to reproduce the issue you encounter.
>>>>
>>>> baruch
>>>>
>>>
>>> Sending in attachment the buildroot' config. The build is successfull if I make
>>> the following in the src/Makefile:
>>>
>>> # Additional libs for GNU libc.
>>> #ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
>>>   SULOGINLIBS	+= -lcrypt
>>> #endif
>>>
>>> Thanks,
>>> Joao
> 
