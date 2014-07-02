From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 09:45:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-01
In-Reply-To: <20140702063009.4715D1017F9@stock.ovh.net>
References: <20140702063009.4715D1017F9@stock.ovh.net>
Message-ID: <20140702094513.6ec730f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Jul 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>       bfin |                      crda-3.13 | NOK | http://autobuild.buildroot.net/results/d752a8d53ad9219b60113075c91c4dcc3e4027c1/

This thing is trying to build a shared library even though we have
BR2_PREFER_STATIC_LIB=y.

>    powerpc |              host-python-2.7.7 | NOK | http://autobuild.buildroot.net/results/145a44c9e86a130300f5f354b817df738b345cfd/
>    powerpc |              host-python-2.7.7 | NOK | http://autobuild.buildroot.net/results/9a405a215d84f0d4cb74f22afa5bc541c8f30a0e/
>    powerpc |              host-python-2.7.7 | NOK | http://autobuild.buildroot.net/results/75f2819fc2a624ffdcdc64c117a45b823543b8bd/
>    powerpc |              host-python-2.7.7 | NOK | http://autobuild.buildroot.net/results/e833b46b6df95de46df2ae06a515f9a4825acbe3/
>    powerpc |              host-python-2.7.7 | NOK | http://autobuild.buildroot.net/results/2a7d0e9aa3de78d87b75d2461eeb430d781e9c99/
>    powerpc |              host-python-2.7.7 | NOK | http://autobuild.buildroot.net/results/11a5420d9125795539992cf341fc0aa3c1baee7e/

This is a download issue: the python.org server now redirects to
https://, which causes certificate validation issues.

>    powerpc |                  libnss-3.16.1 | NOK | http://autobuild.buildroot.net/results/81019bf21a3199ac962c986b96e26ee25f34a0a8/

Usage of target cflags when building things for the host:

cc1: error: unrecognized command line option "-mabi=spe"
cc1: error: unrecognized command line option "-mfloat-gprs=double"
as: unrecognized option '-me500x2'

Someone to look into that?

>       bfin |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/993aca3f4719afaa4b37524f9136fb8cdc53a066/

The `___umulsi3_highpart' issue with the gcc 4.5 Blackfin toolchain.
I've reported this bug to ADI, and they said we shouldn't use the 4.5
version of the toolchain, and stick with the 4.3 version of it. I'll
send a patch to do that.

>      avr32 |                        nbd-3.8 | NOK | http://autobuild.buildroot.net/results/eb94b4d7847577c59a2407c9d0f5537e811c8e95/
>      avr32 |                        nbd-3.8 | NOK | http://autobuild.buildroot.net/results/38eec8197052de6fbe55249202d60d17fd3a3c69/
>      avr32 |                        nbd-3.8 | NOK | http://autobuild.buildroot.net/results/c206cc2e6a7aa838d9d6513e3576f44c2a88288d/

./.libs/libnbdsrv.a(libnbdsrv_la-nbdsrv.o): In function `ntohll':
nbdsrv.c:(.text+0x0): multiple definition of `ntohll'
[and more of this]

Weird, at first sight, doesn't seem like AVR32 specific issues.

>      avr32 |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/82bee28b25d2419a78ee46f1c66a1eb27b144c6a/

One tool we try to install doesn't get built on AVR32 ?

cannot stat `/home/test/autobuild/instance-2/output/build/oprofile-0.9.9/pe_counting/ocount': No such file or directory

>        arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/e0381e3a2e5558ab60da109fb82b0d25d71cbbf9/
>        arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/e471df933dfedb7b82defff6fc542a43bd599561/
>    powerpc |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/bedff01b5ba556a9b4ff32370c9a24cdca7f39c2/
>       sh4a |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/bd7728ac922996ed0ebca16cf008bc39e8cbeb39/
>    aarch64 |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/7e42ac880cbafa36c3f4f7ce0c948e1ba6cccc46/

Fixed by http://git.buildroot.net/buildroot/commit/?id=63d0d8040ab4ba8956a13dafd73e2fa044e29c8b.

>    powerpc |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/c4762d6c39ae8a898235dd0c5191d925f6751b29/

Fixed by http://git.buildroot.net/buildroot/commit/?id=42ecaf45dc372de1bbdfd3ca120c17e981ebac33.

>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/6c8c3cb19a6f98f6f27986b671d48ee092fdf7cc/

Compiler issue. I don't see any other solution than adding an exclusion
in the autobuilder script. Yann, Gustavo, any idea?

>        arc |                        unknown | TIM | http://autobuild.buildroot.net/results/a951ef04665c3d11453a40b1fc368946788ac256/

Ignore.

>    powerpc |     xserver_xorg-server-1.15.1 | NOK | http://autobuild.buildroot.net/results/1f25f744771fbb5124dca4563d79ea92cbfd72a3/

Bernd, despite the commit
http://git.buildroot.net/buildroot/commit/?id=e244eb12dfc50bb56167d5fdaef3aac52b0ff6a3
being merged, we still see a parallel installation issue here it seems.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
