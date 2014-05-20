From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 09:25:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-19
In-Reply-To: <20140520063007.ACE63100F8E@stock.ovh.net>
References: <20140520063007.ACE63100F8E@stock.ovh.net>
Message-ID: <20140520092513.0ad98a62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:

>     x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3ecb780be9e7912dac9670d9e7ad9a810c6243af/

Multiple definitions of vfork in libc.a and libpthread.a. To me, this
looks like a uClibc bug. Do other agree about this? Should we mark
alsa-lib as not available on pure static builds with uClibc? Is there a
uClibc patch that fixes that?

>       i686 |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/725962e174198f0b26b7cbd335691d9a23be73f5/

A build error in Busybox? Really weird:

libbb/appletlib.c:164:13: error: ???NUM_APPLETS??? undeclared (first use in this function)
libbb/appletlib.c:164:13: note: each undeclared identifier is reported only once for each function it appears in
libbb/appletlib.c: In function ???install_links???:
libbb/appletlib.c:595:18: error: invalid application of ???sizeof??? to incomplete type ???int (* const[])(int,  char **)???

Peter, any idea?

>     mipsel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/cde0a6eda1db441cd16ef933fa27cd37411b837e/

The infamous static linking problem with libstdc++.so.

>       bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/b47f85553336b7f63ee4ecdf8598374ce4a225a3/

Fixed by http://git.buildroot.net/buildroot/commit/?id=dfc3cc23af3ceb715f322dcb63d82d9d9abfe3ac.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/5cde56a0bf8dfac22d01752a98d399f71f664e07/

The usual gcc issue. Last night, I've restarted the build of the
Buildroot external toolchains used in the autobuilders with Buildroot
2014.05-rc1. When I'll deploy them, it should hopefully fix the issue
since we now have the gcc patch that fixes this problem.

>        arm |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/47380d57e507ec395a1132dfd7b32d35459c1c7a/

checking for FAKEKEY... yes
checking for XFT... configure: error: *** Required xft Librarys not found ***
make: *** [/scratch/peko/build/matchbox-keyboard-0.1/.stamp_configured] Error 1

>      avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/0142b1d5b8c3f20f1bff76ece646d901407f7490/

Could be fixed by applying http://patchwork.ozlabs.org/patch/350543/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
