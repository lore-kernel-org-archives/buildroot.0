From: Jan Heylen <heyleke@gmail.com>
Date: Sun, 16 Oct 2016 13:36:19 +0200
Subject: [Buildroot] [PATCH v2 1/4] toolchain: wrap 'ld' with
	toolchain-wrapper
In-Reply-To: <20161016120510.55c138f0@free-electrons.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
 <20161016120510.55c138f0@free-electrons.com>
Message-ID: <CAGszK3i9-JcnWFeHaydg+oA8ntPb=Gb+a9UKsHXUNQyV8JUUGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So we should fix libdmalloc as well?

On 16 Oct 2016 12:05 pm, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue,  5 Apr 2016 21:45:18 +0200, Jan Heylen wrote:
> > extend the toolchain wrapper to also wrap the ld linker.
> >
> > Tested with gnu ld and gnu 'gold'
> > BR2_BINUTILS_EXTRA_CONFIG_OPTIONS="--enable-gold=default
> --enable-plugins"
> >
> > make host-binutils result in: (ld and ld.gold are equal)
> > <ARCH>-buildroot-linux-uclibc-ld -> toolchain-wrapper
> > <ARCH>-buildroot-linux-uclibc-ld.bfd
> > <ARCH>-buildroot-linux-uclibc-ld.br_real
> > <ARCH>-buildroot-linux-uclibc-ld.gold -> toolchain-wrapper
> > <ARCH>-buildroot-linux-uclibc-ld.gold.br_real
> > <ARCH>-linux-ld -> toolchain-wrapper
> > <ARCH>-linux-ld.br_real -> <ARCH>-buildroot-linux-uclibc-ld.br_real
> > <ARCH>-linux-ld.gold -> toolchain-wrapper
> > <ARCH>-linux-ld.gold.br_real -> <ARCH>-buildroot-linux-uclibc-
> ld.gold.br_real
> > toolchain-wrapper
> >
> > after host-gcc-initial, toolchain-wrapper will be rebuild, but the ld
> > symlinks remain
> >
> > Based upon patch from Thomas Petazzoni:
> > http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942
>
> We had a discussion at the Buildroot Developers meeting today about
> this patch series. After discussion, we concluded that there should be
> no need to wrap ld. ld should not be used directly, except in very
> specific cases, where the caller knows what it is doing and should pass
> the right arguments.
>
> As far as we know, the only case that was broken was the libiscsi
> package, but such a package should definitely *not* use ld directly. So
> the fix should be done in libiscsi, not in the wrapper.
>
> However, your patch series triggered a very useful discussion about
> reworking how flags are handled by the wrapper, and we took the
> following notes of things to do:
>
>  - We want to refactor how the CFLAGS are handled by the wrapper:
>
>    - Combine BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS into a
>      single BR2_TARGET_EXTRA_FLAGS
>
>    - Have a make variable called TARGET_WRAPPER_FLAGS that includes
>      all flags we want to include in the wrapper:
>
>       * $(TARGET_ABI)
>       * $(TARGET_CPPFLAGS)
>       * $(BR2_TARGET_EXTRA_FLAGS)
>       * Custom flags added by package/Makefile.in
>
>      $(TARGET_OPTIMIZATION) and $(TARGET_DEBUGGING) are *NOT* in the
>      wrapper.
>
>    - TARGET_CFLAGS = $(TARGET_WRAPPER_CFLAGS) $(TARGET_OPTIMIZATION)
> $(TARGET_DEBUGGING)
>      TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>      TARGET_LDFLAGS = $(TARGET_CFLAGS)
>      TARGET_FCFLAGS = $(TARGET_CFLAGS)
>
>    - The wrapper, instead of having special cases for different flags,
>      just receives (at build time), the list of hardcoded flag. A
>      special logic needs to be put in place to handle precious flags
>      (mcpu, march, mtune, mfloat-abi, etc.), for which the
>      command-line passed flag must be preserved if passed.
>
>  - Define LD to "false" in $(TARGET_CONFIGURE_OPTS) so that we detect
>    the crappy packages that use LD directly. Individual packages can
>    still pass LD=$(TARGET_LD) or LD=$(TARGET_CC) if really needed.
>
> We're of course not asking you to work on those topics. Arnout has
> volunteered to do it already.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161016/4cd466f6/attachment.html>
