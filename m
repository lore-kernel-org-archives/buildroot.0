From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 12 May 2020 21:24:18 +0200
Subject: [Buildroot] [PATCH 0/1] Fix GCC 9.3.0 failing to build because
 of self tests
In-Reply-To: <ad21c75a-7dba-cf77-1a83-54266063a43d@gmail.com>
References: <AM0PR10MB241730612D4A254D0BBA4543AABE0@AM0PR10MB2417.EURPRD10.PROD.OUTLOOK.COM>
 <35d7cfea-fdd0-8cdd-9227-4fed0f531cca@gmail.com>
 <AM0PR10MB24174C00983B26728F12C9BDAABE0@AM0PR10MB2417.EURPRD10.PROD.OUTLOOK.COM>
 <ad21c75a-7dba-cf77-1a83-54266063a43d@gmail.com>
Message-ID: <c798264c-4124-6776-53fe-bd1034f7e8d9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben,

Le 12/05/2020 ? 19:48, Romain Naour a ?crit?:
> Ben,
> 
> Le 12/05/2020 ? 16:32, Ben Dakin-Norris a ?crit?:
>> Romain,
>>
>> I am currently using buildroot to create a toolchain that I then use in two other buildroot configurations.
>>
>> When I take master or the last release and apply a simple GCC 9.3.0 toolchain build it errors about xgcc.
>>
>> I will attach my configuration that causes the error. The patch appears to stop the error.
>>
>> If you need any more information please just ask.
> 
> I started a build using your config file. I just disabled ccache because it can
> cause weird issues... Maybe you can try without ccache.

Ok, I reproduced the issue by enabling again ccache.

It fail with:

/home/naourr/buildroot/test/toolchain/build/host-gcc-final-9.3.0/build/./gcc/xgcc
-B/home/naourr/buildroot/test/toolchain/build/host-gcc-final-9.3.0/build/./gcc/
-xc -nostdinc /dev/null -S -o /dev/null -fself-test=../../gcc/testsuite/selftests

make[4]:
/home/naourr/buildroot/test/toolchain/build/host-gcc-final-9.3.0/build/./gcc/xgcc:
Command not found

For some reason, xgcc is not built when ccache is used...

Best regards,
Romain


> 
> So far the build succeeded here.
> 
> Can you try with qemu_arm_vexpress_defconfig
> 
> $ make qemu_arm_vexpress_defconfig
> $ make toolchain
> 
> If something go wrong, then it's a problem on your host.
> 
> Best regards,
> Romain
> 
>>
>> Regards,
>>
>> Ben
>>
>> -----Original Message-----
>> From: Romain Naour <romain.naour@gmail.com> 
>> Sent: 12 May 2020 15:27
>> To: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>; buildroot at buildroot.org
>> Cc: thomas.petazzoni at bootlin.com
>> Subject: Re: [PATCH 0/1] Fix GCC 9.3.0 failing to build because of self tests
>>
>> Hi Ben,
>>
>> Le 12/05/2020 ? 14:46, Ben Dakin-Norris a ?crit?:
>>> Hi,
>>>
>>> ?
>>>
>>> This patch enables GCC 9.3.0 to build as a toolchain only
>>>
>>> ?
>>>
>>> The build will report an error xgcc: No such file or directory 
>>> otherwise
>>
>> Sorry but I don't understand what's the issue you are trying to fix.
>> I've built some gcc 9.x toolchain without any issue.
>> Can you give some details please.
>>
>> Best regards,
>> Romain
>>
>>
>>>
>>> ?
>>>
>>> Regards,
>>>
>>> ?
>>>
>>> Ben
>>>
>>> ?
>>>
>>> Benedict Dakin-Norris (1):
>>>
>>> ? Remove SELFTEST_TARGETS from GCC 9.3.0
>>>
>>> ?
>>>
>>> .../gcc/9.3.0/0004-gcc-remove-selftest-targets.patch? | 11 +++++++++++
>>>
>>> 1 file changed, 11 insertions(+)
>>>
>>> create mode 100644 
>>> package/gcc/9.3.0/0004-gcc-remove-selftest-targets.patch
>>>
>>> ?
>>>
>>> --
>>>
>>> 2.25.1
>>>
>>> Ben Dakin-Norris
>>> Software Engineer
>>> Navtech Radar Limited <https://www.navtechradar.com> Navtech Radar 
>>> Limited Home Farm, Ardington, Wantage, Oxfordshire, OX12 8PD, UK
>>> ??+44 (0)1235 832419
>>> ??ben.dakin-norris at navtechradar.com
>>> LinkedIn <https://www.linkedin.com/company/navtech-radar-ltd/> 	Twitter
>>> <https://twitter.com/Navtechradar> 	YouTube
>>> <https://www.youtube.com/user/NavtechRadar> 	Instagram
>>> <https://www.instagram.com/navtechradar/> 	Facebook
>>> <https://www.facebook.com/navtechradar>
>>>
>>> Navtech Radar Ltd registered in England & Wales No: 3699400. Vat No: 
>>> 742071067
>>
> 
