From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 17 Dec 2012 23:13:04 +0100
Subject: [Buildroot] [PATCH] netatalk : Fix BerkeleyDB library path
In-Reply-To: <50CF9728.7050806@mind.be>
References: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
 <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87pq29bq11.fsf@dell.be.48ers.dk>
 <CAGduivyvZNaaC8jdLzt1yVju3DS0Vu0fdaQYdHzK6LoRE==nYw@mail.gmail.com>
 <50CF8203.1010601@mind.be>
 <CAGduivzGSNwizLx8WbC+BN6J=dbmcDRjNyB7zc0stccS3X1BoQ@mail.gmail.com>
 <50CF9728.7050806@mind.be>
Message-ID: <CAGduivzm4RUMxoUWtsQshupg5Q=OFU3BYaXAOpp8CRVxghQYtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 17, 2012 at 11:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 17/12/12 23:00, Maxime Hadjinlian wrote:
>>
>> On Mon, Dec 17, 2012 at 9:35 PM, Arnout Vandecappelle<arnout@mind.be>
>> wrote:
>>>
>>> On 17/12/12 00:15, Maxime Hadjinlian wrote:
>
> [snip]
>
>>>   BDB_LIB isn't even used by configure, so I don't think does patch does
>>> much :-)
>>
>> You're right, it should be BDB_LIBS at least.
>
>
>  But BDB_LIBS is unconditionally set by configure.
>
>
>
>>>   The problem I encounter in my build is that configure uses `ls ...` to
>>> find the library, and my /bin/ls is linked against libacl.so.1. It seems
>>> LD_LIBRARY_PATH is overridden because ls fails with:
>>>
>>> /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.14' not found (required
>>> by
>>> /home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libacl.so.1
>>>
>>>   And indeed, configure sets:
>>> eval export $shlibpath_var=$bdblibdir
>>>
>>>   This is OK for native builds, but not for cross-builds...
>>
>> If I'm reading this correctly (and I'm not sure I am), there is one
>> bug with ls if you native hosts is 32bits but also, if you look the
>> value of atalk_libname, it will value lib64 and since the lib are not
>> put there by BerkeleyDB, it will also fail. And so we must look for
>> them in lib, right ? (That was I tried to fixed in my numerous
>> attempt).
>
>
>  Yes, but the configure script already does that: if it fails to find it in
> $atalk_libname and $atalk_libname != lib then it tries again in lib.
Okay, I see what I missed and I'm looking at your patch, I'll go to
bed less stupid.
>
>  Regards,
>  Arnout
Thanks
>
> [snip]
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
