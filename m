From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 21:44:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-18
In-Reply-To: <20170519063157.2654320766@mail.free-electrons.com>
References: <20170519063157.2654320766@mail.free-electrons.com>
Message-ID: <20170519214454.08c259df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 May 2017 08:31:57 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6a495d25f3d87ae00254258fa862884ffada09b4 |     
>       xtensa |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/44c7fa9f2ecda70ed4fa58019d31a39739914662 |     

I've sent a patch for these:

  https://patchwork.ozlabs.org/patch/764820/

>          arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/8beab6e29fad77eea8a0f3e3129dcde2b7cfdcc8 |     

Already fixed by:

  https://git.buildroot.org/buildroot/commit/?id=2677210f545c3f3e8c52c973e08c3a460c521e5b

>          arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5dfdd18bc9aa0713bf8eb8e5f374932686b13d9b |     
>       x86_64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/29f572c35815b8e474f137039a7db9f8499fb0e3 |     

libpostproc/postprocess.c:94:53: error: expected ',' or ';' before 'FFMPEG_VERSION'
 const char postproc_ffversion[] = "FFmpeg version " FFMPEG_VERSION;

This error is weird, it happens on different architectures. I'll try to reproduce.

>         i686 |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/6e1cb08d385b1a406c0c0d4960bfb279d3137020 | ORPH

/home/buildroot/autobuild/run/instance-1/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libicui18n.a(umsg.o): In function `icu_58::MessageFormatAdapter::getArgTypeList(icu_58::MessageFormat const&, int&)':
umsg.cpp:(.text._ZN6icu_5820MessageFormatAdapter14getArgTypeListERKNS_13MessageFormatERi+0x0): multiple definition of `icu_58::MessageFormatAdapter::getArgTypeList(icu_58::MessageFormat const&, int&)'
ext/intl/msgformat/msgformat_helpers.o:msgformat_helpers.cpp:(.text+0x24): first defined here
collect2: error: ld returned 1 exit status

Static linking configuration.

>        sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/995656a6f9fff594af6b10297253788683a0098f |     

This would be fixed by:

  https://patchwork.ozlabs.org/patch/763762/
  https://patchwork.ozlabs.org/patch/763763/

I was hoping to get some review/feedback from Peter Seiderer on this.
Peter, could you have a look?

>          arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/ffc84eb08e32dabdccc579d67c8d1f8ae71ab1e4 | ORPH

Compiler failure on ARC:

  ospf_ri.c:839:1: internal compiler error: in extract_insn, at recog.c:2287

Alexey, is this one already known?

> microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/b8c18a2cc5e7170695c273e8017a4771096167b6 |     

Issue when linking against gnutls, itself linked against libunistring.
Romain and I have already identified an issue in gnutls .pc file while
investigating a ffmpeg build failure. It might be the same issue here.

>        sparc | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/54c2daad582fab6558815608ea388e8ec82ea384 | ORPH

Classical libintl missing when statically linking.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
