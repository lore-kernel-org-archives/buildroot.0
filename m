From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Tue, 10 Nov 2009 09:18:33 -0800
Subject: [Buildroot] building kernel modules
In-Reply-To: <20091109225951.GI14091@buzzloop.caiaq.de>
References: <4AF34ADF.7090303@cs.ucsb.edu> <4AF7A886.8000703@cs.ucsb.edu>
	<20091109065815.GZ14091@buzzloop.caiaq.de>
	<4AF899C8.5010702@cs.ucsb.edu>
	<20091109225951.GI14091@buzzloop.caiaq.de>
Message-ID: <4AF9A069.80404@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hmm. If you only get this error for your own module (and not the kernel
> itself), you should have a look at the assembly output and see what gcc
> does there and why. It shouldn't be using the __aeabi_uldivmod function
> which is part of libgcc which the kernel does not seem to link on your
> platform. According to the postings below, these errors are likely to be
> caused by false gcc optimisations.
> 
> You should get around that by altering your sources, but again, without
> the code, this is all speculating.

Turns out it was a division of a long that was causing that.  After I
changed the long to a uint32_t then the problem went away.  Now, I have
to figure out why I cannot insert the module.

musec_can: unknown relocation: 40
insmod: can't insert
'/proj/tools/can_driver/musec_can/src/musec_can.ko': invalid module format

Modules built during the kernel built work fine.  I guess I have to
figure out what linker setting I am missing.

> 
> Those links could also help:
> 
>   http://www.spinics.net/lists/arm-kernel/msg48776.html
>   http://lists.arm.linux.org.uk/lurker/message/20080227.081641.1580db5d.en.html
> 
> In case you consider bringing your driver mainline, you can also post it
> to LKML and get some feedback there.

That would be down the road once I actually test the driver and iron out
any problems that might occur.

> 
> After all, what you're seeing is an effect that has to do with your
> code, the kernel and gcc. And not with buildroot :)

True.  I was just hoping that somebody would give me a starting point as
  I new to cross compiling :)  Thanks for the help.

Roman

> 
> Daniel
> 
