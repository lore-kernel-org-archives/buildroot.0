From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:39:45 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-12
In-Reply-To: <20170513063125.BA761220BB@mail.free-electrons.com>
References: <20170513063125.BA761220BB@mail.free-electrons.com>
Message-ID: <20170513153945.1170491c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fabrice, Alexey, Bernd, Vicente, Peter, there are some
questions/comments for you below. Thanks!

On Sat, 13 May 2017 08:31:25 +0200 (CEST), Thomas Petazzoni wrote:

>       successes : 232
>        failures : 22 

Still not bad, but let's try to do better!

On 22 failures, 13 failures have already been resolved, which leaves 9
failures to be investigated.

>       x86_64 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/3c35110f53601bce09028249f9a069934f05782a |     

Seems like a C++11 related issue. Fabrice, could you have a look ?

>         m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/66b48ed9ab5c816cf5b2a50133c0ecbec1be7e54 |     

Still the coldfire/ffmpeg issue. There are some patches pending, but
I'm not sure they are the best/correct solution.

>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/e837737abaea851bea428a35ea9d3395a6565c54 |     
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/1dab93aff5555f092ff30674ec0b35301ce62411 |     
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/90f0899f158af53dfa62ba20a46276e72d2facfd |     

Alexey, this still happens with the latest ARC toolchain components (I
tested here). Since it has been happening for a while with no fix, I've
disabled libcdio on ARC for the moment:

  https://git.buildroot.org/buildroot/commit/?id=459f7302df8cdc45aa0f7f2581ebb6f05fb6432a

>       x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/643f200d63f1505f8a44eae82a00572c1ee2bcaa |     

Another C++11 issue, quite similar to the one for domoticz it seems.
Bernd, could you have a look?

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7e6c45a56d09a61fe63bdb4ed807091f140045df |     

CC	libavcodec/x86/blockdsp_init.o
libavcodec/x86/ac3dsp_init.c: In function 'ac3_downmix_sse':
libavcodec/x86/ac3dsp_init.c:161:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/ac3dsp_init.c:165:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'

Bernd, could you have a look?

>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/996e0b2872f7712db9e8ec6aa724fb373c578d43 |     

Architecture mismatch problem. Needs investigation.

>         i686 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/3932419d50af337230e58964238a3bb9e6c8ac15 |     
>         i586 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/93fd12dd4deac0569f88ea18ee593159a218740f |     
>         i686 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/f0beae1fe9825d5561e8f6b13ff318071b2a4629 |     
>          arc |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/2f2bdfa62da64124a86401cadcfd300239042698 |     
>    powerpc64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/347d8fd2e286b3e4e5e18743e64d862bdb66dbb9 |     
>    powerpc64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/e54dc73660bc3e0edbe4bee6c54a10d6723c522d |     
>         i586 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/ca7c9442a98bdc0eef7d5860f99f7b3f6e1df18b |     
>      aarch64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/0a5c2f06dd447801efc9378b09dd31bb3399cf77 |     

I believe most, if not all of these have been fixed by:

  https://git.buildroot.org/buildroot/commit/?id=b6ea64aec80d50b840881bc89d4a2a1102b49d7e

>          arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6756c1e49da27aa5af8e42a69e908380a91235bf | ORPH

A static linking configuration, but Qt tries to uses libltdl. Peter
(Seiderer) could you have a look?

>       mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/5f6aa282d19019a078ad0b3aec112eb4f05e8799 |     

{standard input}: Assembler messages:
{standard input}:708: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v0,$t8,$t7'
{standard input}:759: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v1,$t8,$t7'

Vicente, since this is MIPS stuff, could you have a look? Webkit not
suitable for mips32r6 ?

>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fe6f800c292633e4cf296a23c614b6379f8be42f |     
>         m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/27695ec6b216acc379f31b24fd2777ae8d85aba0 |     

Static linking issues, again and again.

>        nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/d61c8d169fc070271114a515159650f7a0f333c0 |     
>          arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/22295711046c519df44d5d976e0bfcae1f006e5a |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=e7a64ddcbc0b262eaa549fede9bd1e8ca3bb310f.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
