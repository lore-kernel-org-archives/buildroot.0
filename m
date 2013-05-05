From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Sun, 05 May 2013 11:47:21 +1000
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <20130504193618.729e01cb@skate>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
 <klhkoe$dak$1@ger.gmane.org> <km1kpr$t5l$1@ger.gmane.org>
 <20130504102552.03b360ae@skate> <km2rp9$jgd$1@ger.gmane.org>
 <20130504193618.729e01cb@skate>
Message-ID: <km4dn6$7ds$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>    - In order to enable FLAT binaries, you need to disable MMU support in
>> uClibc.  Deselecting the buildroot option BR2_USE_MMU does not change the
>> uClibc option.  I am guessing this should happen automatically, but not quite
>> sure how to achieve it.
>
> Most likely should be done in toolchain/uClibc/uclibc.mk.

Ah yes, got this working, thanks.  As a side note, in buildroot itself, when 
BR2_HAS_MMU is *deselected* it should force BR2_ELF2FLT on.  I can't see how 
to do this (set BR2_ELF2FLT to be the inverse of BR2_HAS_MMU) unless I add a 
dummy option like this:

   config BR2_FORCE_ELF2FLT
     bool
     default y if !BR2_USE_MMU
     select BR2_ELF2FLT

Is this correct?  It's the only way I can come up with to select another 
option in response to an option being deselected.

>>    - Disabling MMU support in uClibc stops the thread components from
>> compiling.  Apparently this is a bug in uClibc? (something about fork() being
>> called vfork() instead)
>
> If uClibc doesn't build for a given configuration, it's definitely
> something that can be reported to the uClibc developers.

Thanks, I have submitted a bug for this with sample configuration files.

>>    - Disabling threads entirely in both uClibc and buildroot gets past that
>> previous problem, but gcc-final then does not compile as some components
>> (libitm and libatomic) need thread support.  I am not sure how to tell
>> buildroot to ask GCC to skip compiling libitm and libatomic when thread
>> support has been disabled.
>
> Hum, this is strange, because we do regularly test no-thread
> toolchains, but not for all gcc versions. Which gcc versions have you
> tried?

This is with GCC 4.8.0.  I was able to get around the problem by adding this 
to toolchain/gcc/gcc-uclibc-4.x.mk:

# Disable threading when thread implementation is 'none'
ifeq ($(BR2_PTHREADS_NONE),y)
EXTRA_GCC_CONFIG_OPTIONS += \
         --enable-threads=single \
         --disable-libitm \
         --disable-libatomic \
         --disable-libmudflap
endif

I'm not sure if this is the correct solution though given your comment about 
it being regularly tested.  If it is I'm happy to submit patches for this 
stuff if that's easier.

However it may be because disabling thread support in buildroot does not 
disable thread support in uClibc.  The two options must be set manually.  It 
could also be because I am compiling everything without MMU support, if that's 
not widely tested.

Thanks again,
Adam.
