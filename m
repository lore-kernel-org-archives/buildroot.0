From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 May 2013 19:36:18 +0200
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <km2rp9$jgd$1@ger.gmane.org>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
 <klhkoe$dak$1@ger.gmane.org> <km1kpr$t5l$1@ger.gmane.org>
 <20130504102552.03b360ae@skate> <km2rp9$jgd$1@ger.gmane.org>
Message-ID: <20130504193618.729e01cb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Sat, 04 May 2013 21:35:09 +1000, Adam Nielsen wrote:

> I'm happy to do my best to try to fix this, but I'm afraid I might need a 
> little help as I'm not too familiar with buildroot.
> 
> I have worked out this so far:
> 
>   - In order to enable FLAT binaries, you need to disable MMU support in 
> uClibc.  Deselecting the buildroot option BR2_USE_MMU does not change the 
> uClibc option.  I am guessing this should happen automatically, but not quite 
> sure how to achieve it.

Most likely should be done in toolchain/uClibc/uclibc.mk.

>   - Disabling MMU support in uClibc stops the thread components from 
> compiling.  Apparently this is a bug in uClibc? (something about fork() being 
> called vfork() instead)

If uClibc doesn't build for a given configuration, it's definitely
something that can be reported to the uClibc developers.

>   - Disabling threads entirely in both uClibc and buildroot gets past that 
> previous problem, but gcc-final then does not compile as some components 
> (libitm and libatomic) need thread support.  I am not sure how to tell 
> buildroot to ask GCC to skip compiling libitm and libatomic when thread 
> support has been disabled.

Hum, this is strange, because we do regularly test no-thread
toolchains, but not for all gcc versions. Which gcc versions have you
tried?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
