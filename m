From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 23 Dec 2010 10:04:36 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTikFyao3mPUg=cWm-D9YGM91DU6dBvJk84o7WjJ5@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
	<AANLkTimy9OaB+LHAxLD4psmnewUntXfbr0rDUKywMZjG@mail.gmail.com>
	<AANLkTikFyao3mPUg=cWm-D9YGM91DU6dBvJk84o7WjJ5@mail.gmail.com>
Message-ID: <AANLkTi=7CxPqcF3Mr9SYNghbJ1ymmLUnniU70wCKKnts@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2010/12/22 Samuel Martin <s.martin49@gmail.com>:
> Hi Bj?rn,
>
>>
>> > In my version (not submitted), i also set the following
>>
>> > variables:?CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH
>>
>> I just read up on those variables (man cmake) and it seems to me that they
>>
>> are used in addition to a default set of paths(?), which I presume are
>>
>> relative to CMAKE_FIND_ROOT_PATH. So are they really needed? What paths
>>
>> do you set them to?
>
> You're right.
> It might be an interesting point to add in the doc, but needs to be tested
> and confirmed.
> use case:
> ??You build a BR environment, then an external lib out of BR and develop a
> project for the BR's target?that use this external lib.
> ??In this case, there are 2 solutions at least:
> ?? ?- add the external lib output directory path to the?CMAKE_FIND_ROOT_PATH
> variable (need to alter the toolchain file)
> ?? ?- or set?CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH pointed on the
> corresponding?sub-directories of?the external lib output directory.

Yes. Also, the toolchain file can be copied out of buildroot and
modified (if desired).

>> >> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
>>
>> >
>>
>> > Here is the main point of disagreement. Because in BR the cross-compiler
>> > and
>>
>> > all tools around are located somewhere in a subdirectory of
>> > $(STAGING_DIR),
>>
>> > i do set CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to "ONLY".
>>
>> Is it completely safe to set it to "ONLY"? Couldn't host binaries be
>> picked
>>
>> up during cross-compilation? Or am I missing something?
>
> When cross-compiling, you need to build the whole toolchain (ie. the
> cross-compiler, assembler, linker, and all useful cross-tools) and the
> sysroot for the target.
> You have to do this and only refer to these tools and sysroot when building
> binaries for the target to avoid building broken binaries that could
> be?linked with something from the host.
> So, yes, for the target, i think it's safe to set it to "ONLY"

But is it necessary? Wouldn't "NEVER" suffice? I don't mean to be
difficult, but I'd like to see a real world example of when it is needed
and not just add it because it "also works".

Best regards,
Bj?rn Forsman
