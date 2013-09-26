From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Sep 2013 17:54:05 +0200
Subject: [Buildroot] libgcc erroneously built as armv5 for
 arm920t(armv4t)
In-Reply-To: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
Message-ID: <20130926175405.67336473@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Sep 2013 08:34:53 -0700 (PDT), adam hussein\(!\) wrote:
> I've been building the at91rm9200ek configuration of buildroot to get
> a toolchain I can use to build u-boot with some board specific
> configuration.
> 
> This is an ARM920T core chip with ARMv4T architecture??- later ARM9
> series have ARMv5TE architecture (http://en.wikipedia.org/wiki/ARM9)
> 
> When gcc is built, or perhaps specifically libgcc only, it seems the
> selection of 920t/v4 architecture gets lost and v5 is used instead.
> This means that when I use it to build u-boot, I find it has the
> __udivsi3 function using the illegal (to v4) instruction CLZ (count
> leading zeros).
> 
> The easiest workaround for me is to specify arm7tdmi and be done with
> it, but I'd like to try contributing a proper fix if possible.
> 
> It turns out that this issue has been around for some time:
> 
> e.g. 2006: http://www.mail-archive.com/oe at handhelds.org/msg02024.html
> e.g. 2007:
> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/3139 e.g.
> 2007:
> http://web.archive.org/web/20070815094037/http://bugs.busybox.net/view.php?id=1406
> (referred to in previous link)
> 
> and then the last link has this patch:
> http://web.archive.org/web/20070815094037/http://bugs.busybox.net/file_download.php?file_id=1059&type=bug
> 
> ...which seems not to have made it into the main repo, and no longer
> applies correctly; all the locations have changed.
> 
> 
> So, here follows an up-to-date version of it. I hope someone finds it
> useful and avoids repeating all my 'digging about'.
> 
> And many thanks to 'bjdooks' for the original.

Interesting. First, thanks for the investigation.

When you select BR2_arm920t as the ARM processor, we are already
passing --with-arch=armv4t to the gcc configure. So, gcc should already
avoid the use of CLZ, since ARMv4T does not support it.

Have you investigated why passing the --with-cpu argument is also
needed, in addition to --with-arch?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
