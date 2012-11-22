From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 09:52:17 +0100
Subject: [Buildroot] crosstools build fails when hard fpu is selected
In-Reply-To: <50ADE660.6000802@wanadoo.fr>
References: <50ACAB98.90607@wanadoo.fr> <20121121132549.7c180f2f@skate>
 <50ADE660.6000802@wanadoo.fr>
Message-ID: <20121122095217.7408e82a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 22 Nov 2012 09:46:24 +0100, Thierry Bultel wrote:

> I thought that is was due to the fact that the "Use soft float by 
> default" option was not available when using an external toolchain (why 
> ?) but I have the same issue when crosstol-ng is built within buildroot 
> (and the option deselected of course)
> 
> I am still investigating, but if you have a clue I would appreciate

> /home/tbultel/x-tools/arm-unknown-linux-gnueabi/lib/gcc/arm-unknown-linux-gnueabi/4.6.3/../../../../arm-unknown-linux-gnueabi/bin/ld: 
> error: ../lib/libncurses.so.5.9 uses VFP register arguments, 
> ../obj_s/hardscroll.o does not

From a quick look, it smells like not everybody has been built with the
same CFLAGS or something like that. Like part of it has been built with
hardfp, and some other with softfp. I would think "use VFP register
arguments" means hardfp (floating point values are passed to functions
through the floating-point registers). So libncurses.so.5.9 would be
hardfp, and hardscroll.o would be softfp or soft-float and that cannot
be linked together.

Are you sure you disabled BR2_SOFT_FLOAT in Buildroot? Check the entire
build log of ncurses to see which compiler flags are being passed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
