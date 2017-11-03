From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 3 Nov 2017 15:18:24 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171103145257.172edd86@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
 <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
 <20171103143828.4f57ab67@windsurf>
 <CA+TH9V=Uw2C7L4M0P9+uos5M66EGjLLHFFq50EqJPEGppKhV2Q@mail.gmail.com>
 <20171103145257.172edd86@windsurf>
Message-ID: <CA+TH9VmEJrzwPHW8c6qR5K1bN5uTTce54vm9Fpq6met2we_bMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2017-11-03 14:52 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri, 3 Nov 2017 14:46:15 +0100, Angelo Compagnucci wrote:
>
>> > Unhandled Exception:
>> > System.ExecutionEngineException: System.IndexOutOfRangeException: Index was outside the bounds of the array. ---> System.IndexOutOfRangeException: Index was outside the bounds of the array.
>> >    --- End of inner exception stack trace ---
>> > [...]
>>
>> This is really strange. This error means that the code inside a mono
>> vm running program is failing, so mono is running correctly!
>>
>> >
>> > So it seems like host-mono doesn't build on a ppc64le machine. Looking
>> > at the host-monolite tarball, I see it's a bunch of .dll built for x86.
>> > Is this supposed to work on other architectures as well?
>>
>> Yes it is. host-mono it's used to bootstrap the mono compilation for
>> the target so it must run on the host architecture.
>
> I don't follow you here.
>
> gcc112 is a ppc64le machine, and I'm cross-compiling for ARM.
>
> Is it possible for those x86 .dll provided by monolite to be used on a
> ppc64le machine ?

Sorry for not having proof reading your initial message, I was not
aware buildroot was running on a ppc64le machine.
In theory, monolite is target agnostic cause is a subset of mono
libraries needed to compile the rest. Alse the main executable is
written in mono (mcs.exe).
The file command erroneously reports that the dlls are for windows
(probably deducing it from the dll extension) but are indeed dll for
the mono runtime.
So in theory it should work.

At least, it is working, cause the message you receive is from a
running mono runtime. The problem is probably elsewhere.

>> IMHO seems like something related to memory, mono changed so much in
>> the latests releases and it uses much more memory during the
>> compilation. I cannot reproduce the bug on my setup with 16GB of RAM
>> and the config that fails on the autobuilder.
>
> The ppc64le machine that causes the failure has 256GB of RAM.
>
>> Could you give me the config you are using?
>
> It's just:
>
> BR2_arm=y
> BR2_PACKAGE_MONO=y
>
> But you won't be able to reproduce the problem on your PC, because your
> PC is x86-64, and the build failure seems to be specific to building on
> ppc64le.
>
> Do you have an account on the gcc compile farm ?

Of course no. I don't think I can help here. If the problem persists,
probably the best way is to disable mono when the host is ppc64le.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
