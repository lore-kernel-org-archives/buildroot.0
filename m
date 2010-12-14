From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 14 Dec 2010 13:39:12 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
Message-ID: <AANLkTimy9OaB+LHAxLD4psmnewUntXfbr0rDUKywMZjG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

2010/12/13 Samuel Martin <s.martin49@gmail.com>:
> Hi?Bj?rn,
> Again, this reviews may refer to the other patch reviews of the set...
>>
>> +$(O)/toolchainfile.cmake:
>>
>> + ? ? ? @echo -en "\
>>
>> + ? ? ? set(CMAKE_SYSTEM_NAME Linux)\n\
>>
>> + ? ? ? set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
>>
>> + ? ? ? set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
>
> In my version (not submitted), i also set the following
> variables:?CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH

I just read up on those variables (man cmake) and it seems to me that they
are used in addition to a default set of paths(?), which I presume are
relative to CMAKE_FIND_ROOT_PATH. So are they really needed? What paths
do you set them to?

>>
>> + ? ? ? set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
>>
>> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
>
> Here is the main point of disagreement. Because in BR the cross-compiler and
> all tools around are located somewhere in a subdirectory of?$(STAGING_DIR),
> i do set?CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to "ONLY".

Is it completely safe to set it to "ONLY"? Couldn't host binaries be picked
up during cross-compilation? Or am I missing something?

I haven't tested more than 'hello world' packages (no dependencies) with
the toolchain-file, so if having "ONLY" is mandatory for more complex
packages (like using pkg-config?) I'll change it.

>> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
>>
>> + ? ? ? set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
>>
>> + ? ? ? " > $@
>
> The generated toolchain file does not seem to support external
> ?cross-toolchain (btw, from my understanding, CTNG is installed in the
> staging, so no problem)
> To do that, I think?CMAKE_FIND_ROOT_PATH is a list (so are
> CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH), so adjust them,?CMAKE_C_COMPILER
> and?CMAKE_CXX_COMPILER.

Did you test external toolchain? Did it break? I haven't tested it (yet),
but AFAIK Buildroot copies external toolchain's sysroot into staging so
there should no need for multiple entries in CMAKE_FIND_ROOT_PATH
(or changes to CMAKE_{C,CXX}_COMPILER). Right?

Best regards,
Bj?rn Forsman
