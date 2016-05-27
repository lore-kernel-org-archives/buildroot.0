From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 22:41:33 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-26
In-Reply-To: <20160527063021.48E29101C97@stock.ovh.net>
References: <20160527063021.48E29101C97@stock.ovh.net>
Message-ID: <20160527224133.22b8cb60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Waldemar, Samuel, Gwenhael, Bernd, Gustavo, Vicente, some questions for you below.

On Fri, 27 May 2016 08:30:21 +0200 (CEST), Thomas Petazzoni wrote:

>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8fc8b8d78376b7ad66cf1dc329babe0590464591/

Worked around by disabling ffmpeg on mips64r2/r6, done in
https://git.buildroot.net/buildroot/commit/?id=bd8cbe16c4e3909da13528d72b2573efc8d355fd.

>      powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/96786b04c1eb9ddda11c9686f026d6fc195e69d9/

According to Gustavo, can only be solved by switching from -Os to -O2
as the default on PowerPC.

>       x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/7a4486265f8240e293fac4e67f63ba4c07828b81/

volk_8u_x2_encodeframepolar_8u.h:319:1: internal compiler error: Segmentation fault

Gwenhael, this has been happening for quite some time. Could you investigate?

>          arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/376ab2e8688ff019bafbe4f68cafcd1a1d2d972c/

Solved by the go series which I've merged yesterday.

>          arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/42242e3f4485b9e77a916e6fe480c83f70e024e4/

Musl build issue.

>       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d61e56ac6c4b9611bdac307e51dd1bfb033bda2c/

NGREG issue, I've proposed a solution for this, need to write a proper
patch for it.

>       x86_64 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/8292973e9f6f2971d090f02f24d11a31709254cf/

Fixed by https://git.buildroot.net/buildroot/commit/?id=0b6b67f34d6d4aeb340bbca579dbf85363c3f4ea.

>        sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/b3bdd5d48c2997ce3df76fca275d05ff90191795/
>        sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/74dd29b5ea146c320fde80a87a2fc910de9b7f60/

Would be fixed by http://patchwork.ozlabs.org/patch/626636/

>      powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/a719f00919cbb974860d2be70f9b4a5f852dc30f/

Fixed by https://git.buildroot.net/buildroot/commit/?id=e6f976b6d4fdd307b81372e9ffbf94ea93852c90.

>          arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/43b98ddf9eb44152ed9ac4a98d887af14831d8da/

Samuel, could you have a look?

>          arc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/863e3b61741c19d2c6698e90328d7356ee8d3275/
>          arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/65a7e00179a750f15ae7b9dee462b8f6ae65d1e2/
>          arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/e149d9662ea6d8e63d57a504de5307817bfaf14d/

Alexey, could you look into this problem? Is this fixed with the new
version of the ARC toolchain?

>        sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/0c3e8931b2d157764ed18c2a97f26c8e77ea426e/

Waldemar?

>       x86_64 |                   mono-4.2.3.4 | NOK | http://autobuild.buildroot.net/results/42d9f34d04ac83a6602c387ec3754035a856bf8f/

Musl build issue. I've investigated, fixed some issues, but there are
some other issues down the road.

>         i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c5a722607ec9797c317b63b0fd3235608a340c98/

libavcodec/x86/hpeldsp_init.c: In function 'hpeldsp_init_mmxext':
libavcodec/x86/hpeldsp_init.c:218:31: error: 'put_pixels16_y2_mmxext' undeclared (first use in this function)
     c->put_pixels_tab[0][2] = put_pixels16_y2_mmxext;

Bernd, Gustavo, do you have an idea?

>          arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e99834b179e28eeaa6543d817efbdc7f010cd4ce/

Weird C++ issue. Vicente, could you have a look?

>      aarch64 |          qt5imageformats-5.6.0 | NOK | http://autobuild.buildroot.net/results/f0b33ff63193b9eec6b92155a655525adcc8be9f/

.obj/home/test/autobuild/instance-3/output/build/qt5imageformats-5.6.0/src/3rdparty/libwebp/src/dsp/dec.o: In function `VP8DspInit':
dec.c:(.text+0x2bbc): undefined reference to `VP8DspInitNEON'

Peter (Seiderer) could you have a look at this?

>      powerpc |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/c042b3b2f58681cc9066112b3b2f84d1ce2fb175/

Missing -lpthread. Anyone to look into this?

>          arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/04259ddbdf24afc507b0f21e1f5ba8738ec492b1/

Fixed by
https://git.buildroot.net/buildroot/commit/?id=ddc0df10ab4f40a2552ac60eb185d28b122fbdcb.

>          arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/b3f6fcff7b02fb31df912e978e42cb25601d52f9/

tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
 #include <bits/local_lim.h>
                            ^

Musl build issue?

>         bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/e418b97766c943bf41fc80815c3e625e6a68b12d/
>         bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/3597a9377b51297672bda75f46b2b0e974de6976/

Would be fixed by: http://patchwork.ozlabs.org/patch/626689/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
