From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Oct 2016 18:39:37 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <20161019221035.2350c181@free-electrons.com>
References: <20161019221035.2350c181@free-electrons.com>
Message-ID: <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-10-16 22:10, Thomas Petazzoni wrote:
>  - Toolchain wrapper and CFLAGS. A patch series from Jan Heylen that
>    changes the toolchain wrapper to also wrap 'ld' triggered a fairly
>    lengthy discussion on how we handle CFLAGS. Some of them are
>    encoded in the wrapper, some are not, with no clear
>    definition. After this long discussion, we came to the conclusion
>    that wrapping 'ld' was not needed (packages should not use 'ld'
>    directly), and that the wrapper/CFLAGS handling should be reworked
>    as follows:
> 
>    * Combine BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS into a
>      single BR2_TARGET_EXTRA_FLAGS
> 
>    * Have a make variable called TARGET_WRAPPER_FLAGS that includes
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
>    * TARGET_CFLAGS = $(TARGET_WRAPPER_CFLAGS) $(TARGET_OPTIMIZATION) \
>                      $(TARGET_DEBUGGING)
>      TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>      TARGET_LDFLAGS = $(TARGET_CFLAGS)
>      TARGET_FCFLAGS = $(TARGET_CFLAGS)

 Turns out that it will be slightly more complicated than this. For MIPS, the
-mmsa option to enable SIMD processing MUST NOT be used in kernel and bootloader
builds. Therefore we cannot add it to TARGET_WRAPPER_CFLAGS. Instead, we'll have
a TARGET_EXTRA_CFLAGS that does not get added to the wrapper but does get added
to TARGET_CFLAGS and therefore passed to package buidls.

 The kernel and bootloaders don't use TARGET_CFLAGS, so those are safe. Also, it
is possible to link libraries built with -mmsa with programs that are built
without that option, so even if build systems ignore TARGET_CFLAGS it should be OK.

 That's the theory, we'll see how it develops in practice.


>    * The wrapper, instead of having special cases for different flags,
>      just receives (at build time), the list of hardcoded flag. A
>      special logic needs to be put in place to handle conflicting
>      flags (mcpu, march, mtune, mfloat-abi, etc.), for which the
>      command-line passed flag must be preserved if passed.
> 
>    Arnout has volunteered to do this work.

 As usual, I won't have this finished any time soon. Given that we're already
deep in October, don't expect this feature for 2016.11. Also I'd feel much more
comfortable if there were some test infrastructure in place before I start
submitting this magic :-).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
