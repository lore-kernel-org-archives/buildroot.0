From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 09:51:54 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <55AF91EA.3080701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/07/15 04:43, Thomas Petazzoni wrote:

>>         sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/dd032aa7b387f3ba5b25bffcaf833ba0ea9ba199/
>
> sparc-linux-g++: error: unrecognized argument in option '-mcpu=c3'
>
> Gustavo, any idea?

Hi.
C3 sound very much like an x86 cpu (Via), i'll take a peek.

>>       powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/a07198b3f7f8029d80863a998814877ec9994c60/
>>       powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/a6d22f80938fa19933940a19664c2354e01a871f/
>>       aarch64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/cd15555cf90dddacdbf9599313e6e0a118049b38/
>
> Parallel build problem. We'll make host-heimdal build with $(MAKE1) in
> the mean time. Gustavo, can you submit a patch to this effect?

Ok, seems the sanest until upstream fixes the issues.

>>       powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/5c15e180973425a742629e9e8d0a56e1913d8c03/
>
> Smell very much like a too old kernel headers problem. Gustavo?

Possible, though you know i generally hate those powerpc toolchains :)
I think it's time to kill them.

>>       powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/f02e721e1812d03b5990884aa8f8ff09dd88272c/
>>       powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/bf17b998dcdb81f37776765ca200e0e5c344bada/
>>       powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/1b38f55602c7aff2afae6f2588e0a8f04b80b09d/
>>       powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/b7d703cf97345463af373217fb90e076bb3dbeb6/
>
> Compiler too old. Maybe exclude the toolchain for now?

Ditto above, at this point i don't think these will benefit anyone.

>>           arm |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/077714a0ee67057abcff680b244228a409243bbf/
>
> Smells like a GCC 5.x issue:
>
> nettest_omni.o: In function `send_omni_inner':
> nettest_omni.c:(.text+0x5688): undefined reference to `demo_interval_tick'

There's a new release, worth trying a bump.

>>          i686 |                  openssh-6.9p1 | NOK | http://autobuild.buildroot.net/results/dce0202e039f4636d68532c4aab8738938b76650/
>
> Weird build issues. Gustavo?

Seems like the portability layer is playing games, on a static build, 
that looks like it's triggering it, i'll investigate.

>>          bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/7417400bf7ce37d2c37e36b5ed31b2dc3e6cf382/
>>          bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/05c9e0504af6a6630890f0cff8fdb0033f8b41ff/
>>          bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/1f1daec5e7547fd7a1739ce43269110ccf2a5224/
>>          bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/3103c9028269a20aa6c53159a48f198e81c90303/
>>           arm |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/55beb7af1392cd2bedddee01edde83ce1bbcac6a/
>
> Gustavo, you're regularly bumping usb_modeswitch. Can you have a look?

Sure.

>>           arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c7fc621245351eb31afab1b96d3f1f2e6ad0bfad/
>
> checking for GLES2/gl2.h... yes
> checking whether to use OpenGL ES 2 support... configure: error: Cannot enable OpenGL ES 2 support without EGL
> package/pkg-generic.mk:146: recipe for target '/home/buildroot/build/instance-0/output/build/webkit-1.11.5/.stamp_configured' failed
> make: *** [/home/buildroot/build/instance-0/output/build/webkit-1.11.5/.stamp_configured] Error 1
> make: Leaving directory '/home/buildroot/build/instance-0/buildroot'
>
> Bernd, Gustavo?

I think the way forward is upgrading, there's no point in trying to fix 
such an old version full of security bugs.
I've got a minimal dep fix as pointed by Yann on the latest version of 
the webkitgtk24 package, i was waiting on more (any!) feedback from the 
bunch of users wanting a newer/working webkitgtk/midori but they've been 
dissapointing to say the least.

Regards.
