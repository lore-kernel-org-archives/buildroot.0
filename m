From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:39:42 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: needs NPTL
In-Reply-To: <20180916050522.bldd73xzol5nryte@sapphire.tkos.co.il>
References: <20180915192005.29373-1-fontaine.fabrice@gmail.com>
 <20180916050522.bldd73xzol5nryte@sapphire.tkos.co.il>
Message-ID: <20180916153942.56d7c7d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Sep 2018 08:05:22 +0300, Baruch Siach wrote:

> On Sat, Sep 15, 2018 at 09:20:05PM +0200, Fabrice Fontaine wrote:
> > /home/buildroot/autobuild/run/instance-1/output/host/bin/or1k-linux-gcc   phc_ctl.o phc.o sk.o util.o clockadj.o sysoff.o print.o version.o  -lm -lrt  -o phc_ctl
> > phc2sys.o: In function `do_loop':
> > phc2sys.c:(.text+0x18bc): undefined reference to `clock_nanosleep'
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/a31e0a5ae15e1164115e4e5981ef5fb3c3284bcc  
> 
> This should only affect 2018.02.x. The latest uClibc-ng version provides 
> clock_nanosleep() even for non NPTL configurations.

Indeed. Due to this, perhaps there's a bunch of NPTL dependencies we
could remove:

package/blktrace/Config.in:     depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
package/can-utils/Config.in:    depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
package/dvblast/Config.in:      depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
package/nilfs-utils/Config.in:  depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()

Anyway, for this linuxptp change, I have marked the patch as "Delegated
to Peter" on patchwork, so that Peter takes care of it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
