From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Wed, 27 Nov 2013 17:03:20 +0000
Subject: [Buildroot] libglib2 (or maybe libffi) build failure
In-Reply-To: <20131127175114.619d17d5@skate>
References: <52960F8C.5040003@newflow.co.uk>	<20131127171511.2abd4873@skate>	<52961D17.6020904@newflow.co.uk>	<20131127173755.6019dd2f@skate>	<529621B0.60106@newflow.co.uk>
 <20131127175114.619d17d5@skate>
Message-ID: <529625D8.4080507@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/13 16:51, Thomas Petazzoni wrote:
> Dear Mark Jackson,
> 
> On Wed, 27 Nov 2013 16:45:36 +0000, Mark Jackson wrote:
> 
>>> Ok. What does libffi.pc contains?
>>
>> $ cat output/staging/usr/lib/pkgconfig/libffi.pc 
>> prefix=/usr
>> exec_prefix=/usr
>> libdir=${exec_prefix}/lib
>>
>> Name: libffi
>> Description: Library supporting Foreign Function Interfaces
>> Version: 3.0.13
>> Libs: -L${libdir} -lffi
> 
> Looks somewhat sane to me.
> 
> 
>>> However here, I see:
>>>
>>> PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/mpfj/buildroot/output/host/usr/bin
>>>
>>> So you have /home/mpfj/buildroot/output/host/usr/bin but the failing
>>> build takes place in /home/mpjf/buildroot-bt/.
>>>
>>> Can you remove /home/mpfj/buildroot/output/host/usr/bin from your PATH
>>> and try again?
>>>
>>> To be honest, I don't quite see why this would be causing problems, but
>>> that's the only possibly "odd" thing that I see in your
>>> configuration/setup for the moment.
>>
>> Still fails ...
> 
> Gaah. So, the next debugging step is:
> 
> strace -s 512 -o foo.log -f ./output/host/usr/bin/pkg-config --list-all
> 
> and then pastebin the contents of foo.log. We'll see where it looks for
> its .pc file, whether it looks or not for libffi.pc, etc.
> 
> Thanks :-)

Aha ... the previous "buildroot" entry in $PATH is the cuplrit.

The foo.log file contains lines such as:-

15616 open("/home/mpfj/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/libcrypto.pc", O_RDONLY)
                       ^^^^^^^^^
I guess it's now in a confused state, so I should do a full clean ?

If so, can you tell me if it's possible to keep 2 different toolchains in use ?

The original "buildroot" path was to my "known-good" buildroot setup (based on
2013.02), but I'm looking to update things to the latest.

I'd rather not destroy my existing toolchain setup, so is it possible to set things
up to handle 2 buildroots at the same time ?

Cheers
Mark J.
