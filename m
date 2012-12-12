From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Dec 2012 01:35:27 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <20121211171008.3b869509@skate>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate>
Message-ID: <50C7D14F.4060304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Note that Maxime already reported this problem three months ago:
http://lists.busybox.net/pipermail/buildroot/2012-September/059193.html


On 11/12/12 17:10, Thomas Petazzoni wrote:
> Dear Willy Lambert,
>
> On Tue, 11 Dec 2012 16:09:46 +0100, Willy Lambert wrote:
>
>> I did this again from another machine
>> (silvie at silvie-VirtualBox:~/buildroot-2012.11$ uname -a
>> Linux silvie-VirtualBox 3.2.0-34-generic-pae #53-Ubuntu SMP Thu Nov 15
>> 11:11:12 UTC 2012 i686 i686 i386 GNU/Linux)
>>
>> In short :
>> wget buildroot, tar -xf, make, a menuconfig pops, I exit and save
>> config, make, wait a bit ... and it fails with the above error about
>> large file system.
>>
>> So I'm sure now that the default config has a problem with largefiles.
>> I'm sorry I'm too new to investigate further. Should I open a bug
>> ticket ?
>>
>> I did not try other versions of gcc as proposed by Berns. But my gcc
>> version is :
>> ard at ard-host(10.0):/opt/buildroot/output/host/usr$
>> ./x86_64-buildroot-linux-uclibc/bin/gcc --version
>> gcc (Buildroot 2012.11-svn2-dirty) 4.6.3
>> I wonder about the "svn2-dirty" tag.
>
> Can you do:
>
> 	make clean
> 	rm .config
> 	make menuconfig / exit / save
> 	env>  buildroot-fails.env
> 	make 2>&1 | tee buildroot-fails.log
> 	cp output/toolchain/uClibc-0.9.33.2/.config buildroot-fails.uClibc.config
>
> And then put somewhere online (do *NOT* send them by e-mail on the
> list, it will be too large) the buildroot-fails.env,
> buildroot-fails.log and buildroot-fails.uClibc.config files.

  Except for the environment, I don't expect we'll see much interesting
in these...

  Probably more useful are all the config.log under output/toolchain/gcc*
(especially output/toolchain/gcc-*-final/*/libgcc/config.log and config.h)

  I vaguely remember having looked at this or a similar problem, and
coming to the conclusion that there are some files that gcc builds
a few files in libgcc with the host's config.h instead of the target's.
And if I remember correctly, this was still the same in gcc 4.7 and
upstream git.  Rainer, you reported that it works with gcc 4.5; can you
check if it is still broken in gcc 4.7?

  It would be interesting to diff the config.log results between 4.5 and
4.6.  So maybe, put a tarball of the whole output dir with a 4.5 and a
4.6 build in a pastebin...


> I have just built the default Buildroot configuration on two Ubuntu
> 12.04 machines, with zero problem.

  Did you try it on an i386 machine?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
