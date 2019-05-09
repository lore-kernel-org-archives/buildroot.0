From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 22:52:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/netsurf: change how
 CFLAGS/LDFLAGS are passed
In-Reply-To: <20190509202808.6741-2-thomas.petazzoni@bootlin.com>
References: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
 <20190509202808.6741-2-thomas.petazzoni@bootlin.com>
Message-ID: <20190509225259.2b62a2cb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 May 2019 22:28:07 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> In commit 6da049f8ae61b956d135526722ce58fc2f67626a ("package/netsurf:
> fix build"), the CC variable passed to netsurf's build system was
> extended to pass some special -I and -L options needed for netsurf to
> find its own headers/libraries.
> 
> Unfortunately, on some systems (including mine), it breaks the build,
> due to:
> 
>   toolpath_ := $(shell /bin/which $(CC__))
> 
> when $(CC__) contains some -I/-L options, they are considered to be
> options "to which", which causes the funny:
> 
> /usr/bin/make install --directory=libnslog HOST=arm-buildroot-linux-uclibcgnueabi PREFIX=/home/thomas/projets/outputs/shared-netsurf/build/netsurf-3.8/tmpusr Q=@ WARNFLAGS='-Wall -W -Wno-error' DESTDIR=
> make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

In fact, I discovered that the autobuilders have encountered this issue
as well:

    powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/eeb2863c6237aac8428e49a5ee514d43088b0fb8 |     
       x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/f938fd1515f1d6e11b57aa6e314135789da52a44 |     

Both of those timeouts would be fixed by this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
