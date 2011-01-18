From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 18 Jan 2011 23:32:01 +0100
Subject: [Buildroot] beagleboard support
In-Reply-To: <20110118182007.GD9083@bulix.org>
References: <895970.43224.qm@web161805.mail.bf1.yahoo.com>
	<20110118182007.GD9083@bulix.org>
Message-ID: <4D3614E1.4080904@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Petazzoni ha scritto:

> Hi Steve,
>
> * Steve Calfee <nospamcalfee@yahoo.com> [2011-01-17 17:06:51]:
>
>   
>> I found a patch from last may proposing a beagleboard defconfig, but it is not 
>> in my 11/10 release of buildroot. Does anyone know the status of beagleboard 
>> support?
>>     
>
> AFAIK BeagleBoard support has not been merged in yet. The patch from
> last May is being progressively reworked. I recently submitted a patch
> for X-Loader support which is a pre-requesite to BeagleBoard support. We
> then need to implement building a kernel from Git instead of from a
> released tarball (kernel trees with BeagleBoard support are usually not
> tarballed), and finally we can add the board support.
>
> I haven't heard anything back on my X-Loader support patch though, but I
> guess everyone is pretty busy in the beginning of the new year.
>   
Sorry for not having found the time to comment your patch timely. I'll do it now.

Your contribution is naturally appreciated, but what I think is that X-loader
should not be in buildroot at all. Although it has historical merits, I find
X-loader totally useless nowadays. I develop the buildsystem for a custom OMAP3
board, and I completely eliminated X-loader with great relief.

X-loader is made for two uses:
1. a serial loader for being able to burn a "main" bootloader (e.g. U-boot) onto
   an empty or corrupted flash (a "bricked" board);
2. a 2nd stage bootloader for normal boot, being run by the boot ROM (1st stage
   bootloader) and used to run the "main", or 3rd, bootloader (e.g. U-boot).

For the first usage, I found that barebox is a great alternative. In its
omap3530_beagle_per_uart_defconfig it has the same functionality as X-loader,
but it is well-written, supported and actively developed (while X-loader is a
fork from a very ancient version of U-boot).

About the second usage, a 2nd stage bootloader is just not needed. The OMAP3
boot ROM can directly boot the "main" bootloader if the latter is prefixed by a
suitable configuration header. You can read more about this at
http://nishanthmenon.blogspot.com/2009/05/configuration-header-no-more-x-loader.html

Finally, I don't know if X-loader can act as a "main" bootloader but I think it
doesn't. Anyway, since barebox and U-boot are around, would you choose anything
else?

Instead of putting efforts on integrating X-loader, I would instead investigate
how to integrate in buildroot the steps to generate a bootloader with a
configuration header (as per Nishanth's blog entry). I hadn't time to do it so
far, but I'd be glad to to so if time permits, as well as to review someone
else's proposal.

Luca
