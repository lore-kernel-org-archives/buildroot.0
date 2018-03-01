From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 1 Mar 2018 21:09:07 +0000
Subject: [Buildroot] [master,1/2] uboot: use local fdt headers
In-Reply-To: <87371kjl6s.fsf@dell.be.48ers.dk>
References: <20180219155632.30086-2-thomas.de_schampheleire@nokia.com>
 <1519868910.25567.259.camel@impinj.com> <87371kjl6s.fsf@dell.be.48ers.dk>
Message-ID: <1519938547.25567.273.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-03-01 at 08:42 +0100, Peter Korsgaard wrote:
> > > > > > 
>  > It see the include dir order should be:
>  > u-boot
>  > buildroot host
>  > host os
> 
>  > But this patch gives:
>  > u-boot
>  > host os
>  > buildroot host
> 
> So what do we do? Would it work to use -isystem instead of -idirafter?
> As I read it, this would put it after the -I lines but before the built
> in system directories. Can you give that a try?

This appears to work for me.  I see that uboot is pulling the buildroot
host openssl and not the system openssl.  I also tried installing
libfdt-devel, and uboot is not using those headers.  It's getting some
from uboot and some from the buildroot host includes.  I don't know
what example is supposed to happen or not happen with libfdt, so I'm
not sure how well I have tested against that issue.

> What other alternatives do we have? Reverting this change would fix it
> for people using mainline u-boot with a config needing openssl, but
> would break it for Thomas' use cases.

I think the concept of building multiple libfdts (buildroot's dtc
package's, uboot's, host-uboot-tools', etc.) and trying to get some
code to use one while other code uses another by rejiggering include
paths is doomed.
