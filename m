From: Andreas Naumann <dev@andin.de>
Date: Wed, 18 Mar 2020 22:03:57 +0100
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <CALFsTFVHh+K0_9Un4Gx1TKVi1HwoDqG7N=gvMgdVxpN5iB0vyQ@mail.gmail.com>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-19-anaumann@ultratronik.de>
 <20200311232503.0bafe189@windsurf>
 <33267645-fd49-cb20-bb8f-f6a1edd57a15@mind.be>
 <d6125560-ca00-a4be-cfde-ff200d332756@andin.de>
 <20200317070800.6365cac6@windsurf.home>
 <CALFsTFUiXLAVUPaKE22FZE7sF2V4uhv6XmDyim0-cveKP950mA@mail.gmail.com>
 <0172c8d6-c39a-10a4-cb03-839242936287@andin.de>
 <CALFsTFVHh+K0_9Un4Gx1TKVi1HwoDqG7N=gvMgdVxpN5iB0vyQ@mail.gmail.com>
Message-ID: <6e936a94-ca1a-dce4-cae5-40605344119b@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 18.03.20 19:59, Asaf Kahlon wrote:
> Hello,
> 
> On Wed, Mar 18, 2020 at 5:35 PM Andreas Naumann <dev@andin.de> wrote:
>>
>> Hi,
>>
>> On 17.03.20 20:02, Asaf Kahlon wrote:
>>> Hello,
>>>
>>> On Tue, Mar 17, 2020 at 8:08 AM Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> On Mon, 16 Mar 2020 23:15:24 +0100
>>>> Andreas Naumann <dev@andin.de> wrote:
>>>>
>>>>>>> This commit log was a bit vague on what the issue was. If I understand
>>>>>
>>>>> The issue was that the cmake configure step stopped with an error if I
>>>>> used the -O option. I dont think it was related to which output strategy
>>>>> was used.
>>>>
>>>> I have not been able to reproduce the CMake configure step failure
>>>> then. Are you still able to reproduce this? If so, could you provide
>>>> more details about the setup: make version being, exact command line,
>>>> Buildroot version, etc ?
>>>
>>> I had this problem too, but currently I can't reproduce it.
>>> I'm still trying to reproduce and will update, but for the meantime:
>>> * My Buildroot version is 2020.02
>>> * The command I used was: make -j9 --output-sync=target
>>> * The CMake configure step failed. On the CMake log I saw the following message:
>>>      ccache: invalid option -- 'O'
>>> It seems like somehow the -O flag (==output-sync) was passed directly to ccache.
>>
>> I'm not using ccache at the moment and I dont get a sensible error
>> message. But seeing your error message I recognize it because probably I
>> used ccache back when I made the patch.
>>
>> Now after testing again with master (0f0868a) I can state the following:
>>
>> Build breaks during configure (bootstrap) phase when running
>> *  make -j2 -Oline host-cmake
>> *  make -j2 -Otarget host-cmake
>> with
>>     Error when bootstrapping CMake:
>>     Problem while running make
>>     ---------------------------------------------
>>     Log of errors:
>> /home/yocto/anaumann/buildroot-qmake-v6/output/build/host-cmake-3.15.5/Bootstrap.cmk/cmake_bootstrap.log
>>
>> Looking at the logfile I cant figure out what the problem is.
>>
>> The build succeeds with
>> *  make -j2 host-cmake
>> *  make -j2 -Onone host-cmake
>> *  make -j2 -Orecurse host-cmake
>>
>> My assumption is that the problem lies in passing certain MAKEFLAGS for
>> a parallel build while not passing -jxxx itself but using the
>> --parallel=$(PARALLEL_JOBS) option. The bootstrap script then somehow
>> reassembles the -jxxx option and certain ${cmake_make_flags} in an
>> incompatible way (at least for -Oline and -Otarget).
>>
>> I use GNU Make 4.1.
> 
> This line made me suspect the make version.
> I use make 4.2.1 and it always works for me.
> I tried to reproduce it on a docker with make 4.1 and it instantly reproduced.
> When I installed on the docker container Make 4.2.1 - it worked.
> Can this be a bug in Make?

I tried 4.2.1 as well and the issue is gone. In the changelog for 4.2 at 
https://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html I found:
* main.c(main): Disable output sync without parallel builds.
To me it seems like this could be the culprit. The question is, what 
should we do with this? Check for Make version < 4.2 && -j && -O and 
give a warning? Maybe this is a bit too much.

regards,
Andreas

> 
>>
>> best regards,
>> Andreas
>>
>>
>>>
>>>>
>>>> Best regards,
>>>>
>>>> Thomas
>>>> --
>>>> Thomas Petazzoni, CTO, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>> Regards,
>>> Asaf.
>>>
> 
> Regards,
> Asaf.
> 
