From: Willy Lambert <lambert.willy@gmail.com>
Date: Fri, 11 Jan 2013 00:01:03 +0100
Subject: [Buildroot] Using a precompiled busybox toolchain as an
	external toolchain
In-Reply-To: <CAHXCMMKctqMgQxnTzX1nG8Sm8W9NuxwLgaf8sGC_dH6aQr8uDg@mail.gmail.com>
References: <CAKvQZ_0sLwXqmGeTdeC6EBqqZ_FN4s6cVcnM3OwVrSHHYHfWDA@mail.gmail.com>
 <20121218135336.2e24d6bc@skate>
 <CAKvQZ_3-v9ArCy0b6Q9VmzNToDaigk1=USPJsgUKpEptzeP1yA@mail.gmail.com>
 <20121218163210.1573a9c7@skate>
 <CAKvQZ_2ZJ9GOV-B2Gi1zG-gjJiFVYHxpd4GzFCHCAg7ABAPFUA@mail.gmail.com>
 <CAKvQZ_1hK1dXwVs5W5XpuZY=O6AZj-Y8XtCHirW+wyXQ4Fwx8g@mail.gmail.com>
 <CAHXCMMKctqMgQxnTzX1nG8Sm8W9NuxwLgaf8sGC_dH6aQr8uDg@mail.gmail.com>
Message-ID: <CAKvQZ_0MyqeTjBSNXfFZ_nN1G-Mh2GQ73hS5iaEo4+ikUJwoYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/30 Samuel Martin <s.martin49@gmail.com>:
> Hi Willy, all,
>
> Apologize for the late answer.
>
> 2012/12/30 Willy Lambert <lambert.willy@gmail.com>:
>> 2012/12/18 Willy Lambert <lambert.willy@gmail.com>:
>>> 2012/12/18 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>>>> Dear Willy Lambert,
>>>>
>>>> On Tue, 18 Dec 2012 16:19:47 +0100, Willy Lambert wrote:
>>>>
>>>>> aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah. To be honest an entry
>>>>> in the manual to state this would be nice.
>>>>
>>>> Indeed. Feel free to submit a patch for the manual :-)
>>>>
>>>
>>> yes, but how ? Should I edit html files by and in the docs/manual folder ?
> Please edit the manual from docs/manual, this is the reference now.
> See http://buildroot.org/downloads/manual/manual.html#_the_documentation
>
>>> I'm not at ease with git, so I will see during hollidays if I can do
>>> something with it.
> Well, from my experience, playing with git is the best way to learn it! :P
> BTW, there is a lot of doc and so on around the web, e.g.:
> - http://try.github.com/levels/1/challenges/1
> - http://git-scm.com/documentation
> - ...

Thanks for pointing.

>
> Concerning patch posting to Buildroot, the online manual gathers the
> few useful things, see:
> http://buildroot.org/downloads/manual/manual.html#submitting-patches
>
> Lastly, if you sneak around on the Buildroot IRC channel, there will
> most likely be
> someone who will be able to help you with git. ;-)
>
>>>
>>>>> thanks, should I understand that I can't publish the buildroot
>>>>> toolchain on another  PC without installing it at the __same__ place ?
>>>>
>>
>> may I bump this, how should I edit documentation ?
> I guess you're using a git view of BR, so please pull it and rebuild the manual:
> make manual-clean manual

BTW, as discussed on IRC, I couldn't build it on my prefered computer
becaused it's a Debian Squeeze (known issue with libxml), and I need
to make the manual twice in a row cause first build always fails.

>
> Few things related to this have been merged yesterday thanks to Thomas! ;-)
>
>>
>> I succeeded in creating the toolchain in "MY_TOOLCAHIN_PATH", but :
>> _ if I do a make clean it disapear, so I suppose I have to change
>> BR2_HOST_DIR back the default value after having creating the
>> toolchain ?
>> _ what's happening if I create several toolchain for several arch in
>> the same "MY_TOOLCHAIN_PATH ? does they override or do they install
>> nicely both in the same dir ?
>> _ what is the path I have to give to buildroot ? "MY_TOOLCHAIN_PATH'
>> or something like "MY_TOOLCHAIN_PATH'/usr/...
> In the updated manual (the one you should have built; unfortunately
> not online until the next release),
> check the paragraph entitled "External toolchain backend" in the 3.1.1 section.
>
> Basically, if you want to build a toolchain with BR, but avoid de
> remove and rebuild it after each "make clean",
> you should build the toolchain first with Buildroot in some place (see
> http://buildroot.org/downloads/manual/manual.html#_building_out_of_tree),
> then use it as an external toolchain in another configuration, in
> another build directory
> (see http://buildroot.org/downloads/manual/manual.html#external-toolchain).
>
> To do so (after backuping your current BR config):
>
> 1) run 'make menuconfig O=/path/to/somewhere',
>
> 2) set the same toolchain configuration as your working configuration,
> and disable everything from the following menus:
> - System configuration
> - Package Selection for the target
> - Filesystem images
> - Bootloaders
> - Kernel
>
> 3) run 'make O=/path/to/somewhere'.
> This should build the toolchain and pretty much nothing else.
>
> 4) run 'make menuconfig' and update the toolchain configuration:
> Toolchain type (External toolchain)
> Toolchain (Custom toolchain)
> Toolchain origin (Pre-installed toolchain)
> (/path/to/somewhere/host/usr) Toolchain path
>
>
> Regards,
>
> --
> Samuel
