From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Sat, 04 May 2013 21:35:09 +1000
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <20130504102552.03b360ae@skate>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
 <klhkoe$dak$1@ger.gmane.org> <km1kpr$t5l$1@ger.gmane.org>
 <20130504102552.03b360ae@skate>
Message-ID: <km2rp9$jgd$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I think the elf2flt stuff hasn't been used in a while, so it isn't very
> surprising that it is broken. Your patches are definitely welcome to
> fix it, and once it's fixed, I'll add a new toolchain configuration in
> our autobuilders to test this configuration on a regular basis.

I'm happy to do my best to try to fix this, but I'm afraid I might need a 
little help as I'm not too familiar with buildroot.

I have worked out this so far:

  - In order to enable FLAT binaries, you need to disable MMU support in 
uClibc.  Deselecting the buildroot option BR2_USE_MMU does not change the 
uClibc option.  I am guessing this should happen automatically, but not quite 
sure how to achieve it.

  - Disabling MMU support in uClibc stops the thread components from 
compiling.  Apparently this is a bug in uClibc? (something about fork() being 
called vfork() instead)

  - Disabling threads entirely in both uClibc and buildroot gets past that 
previous problem, but gcc-final then does not compile as some components 
(libitm and libatomic) need thread support.  I am not sure how to tell 
buildroot to ask GCC to skip compiling libitm and libatomic when thread 
support has been disabled.

Any tips on this would be much appreciated!

Many thanks,
Adam.
