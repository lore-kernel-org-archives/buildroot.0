From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:22:40 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-15
In-Reply-To: <20170516063043.79C252213B@mail.free-electrons.com>
References: <20170516063043.79C252213B@mail.free-electrons.com>
Message-ID: <20170516092240.1cf6a3e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 May 2017 08:30:43 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/e77695bccb2fac76b4b56bf4cc37102cb983d00e |     

Still the static linking issue. I did some testing yesterday, and
discussed it with Romain Naour. I think we now understand the
conditions under which this occurs. You need the following combination:

 - static linking configuration
 - icu enabled
 - BOOST_LOCALE=y
 - another BOOST_xyz sub-options enabled which is not a header only
   feature of Boost, but requires libboost_system to be built

In this case, Boost will try to build libboost_system as a shared
library. If you remove BOOST_LOCALE=y, it works fine, libboost_system.a
is properly built as a static library. If you remove icu, it works
fine. If you remove static linking, it works fine.

I'll apply a patch today that disables BOOST_LOCALE in static linking +
icu scenarios (somewhat a combination of what Romain and Yegor
proposed).

>         bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/2344e3faf056166205f049dc44e799d45b9335bf | ORPH

LINKER BUG: .rofixup section size mismatch

Waldemar, we already have a patch for binutils that is supposed to get
rid of this issue, package/binutils/2.27/0905-bfin-rofixup-bug.patch.
However, it doesn't seem to work completely. Do you have an idea?

>          arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/14134c73cf4fc478554211a4c72b81f0176442ec |     

I have submitted a pull request upstream
(https://github.com/anholt/libepoxy/pull/119) which fixes this.

>          arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/533f2cc996f0a2b83e2a05d61045ba1920eb181e |     

Would be fixed by https://patchwork.ozlabs.org/patch/762195/

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/31c37d436a4482e3595990420e9eec95135a2787 |     
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/552dd83d1de7e84694008f599eab69041e0b7407 |     

Still the i686 issue. Bernd has submitted patches. I'm not too happy
with them, but oh well, since nobody cares in providing better patches,
so be it.

>       x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/e9f3f175e203529c44ecf92a34b82a0b3a473e34 |     

This has been occurring for a while. Anybody to have a look?

>        sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/49bc9345b9849c9c3c53ace290c534ff7bb98683 |     

Lacks linking against libatomic. Yann started looking
yesterday, not sure what the status is. Peter (Seiderer), if you can
help in terms of qmake knowledge, it would be nice.

>          arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/d81b0ae5821d525261347a66507a190733d625f0 | ORPH
>          arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/8589823e3da092ca25e6ee82e4fb199136c8e770 | ORPH

Toolchain issue:

ospf_ri.c:839:1: internal compiler error: in extract_insn, at recog.c:2287

>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fa3c0bd55a34c32ef48449641296aa04470fbf71 |     
>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f5bcf69ce18c9c1d221b0f4f10c67a7454a5bc12 |     

Static linking issue, I've proposed
https://patchwork.ozlabs.org/patch/762183/ to work around this.

>          arm |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/873ed8f2ade1d969abdff15b7b6d63e04819af9a |     

Would be fixed by https://patchwork.ozlabs.org/patch/762700/.

>         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/8319e8ad660839b6617f08a0639aab8d6391fc51 |     

Compiler issue:

src/client/options.cpp:139:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
