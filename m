From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Nov 2016 14:49:42 +0100
Subject: [Buildroot] mplayer issue due to toolchain wrapper
Message-ID: <1788f3a4-3ad3-9b22-d5fb-a1f8971f1fef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 I'm investigating the mplayer build failure and ran into something annoying.

 It turns out that mplayer uses the host compiler rather than the cross-compiler
for cortex-M4. That is because mplayer checks for a valid compiler with "$CC
-v". However, on Cortex-M4, we add -Wl,-elf2flt to the compiler flags, and it
seems that this forces a link.

 Normally, gcc -v will just print versions and exit 0. Now, it will attempt a
link, print an error (undefined main()) and exit 1.

 So, we need to remove the -Wl,-elf2flt from the wrapper. Here are the options I
see - none are satisfactory...

* Detect this specific gcc invocation and remove -Wl,-elf2flt. Yikes.

* Just remove if and pass -Wl,-elf2flt through LDFLAGS. We already know however
that the way that package build systems use LDFLAGS is very unreliable. The good
news is that (AFAIU) failing to pass this option will lead to build failures
when linking programs (but I think it won't for linking libraries, so all leaf
libraries remain untested).

* Create an ld wrapper. However, this ld wrapper will have to add the -elf2flt
even when called from gcc, so it's not just the one in host/usr/bin that has to
be wrapped, but also the one in $CC -print-prog-name=ld. And it's likely that
some packages (kernel, bootloader, ...) do NOT want this option.

* Fix individual packages that behave this way. Two problems with that: the
patches will never be upstreamable (this is really a buildroot issue), and it's
hard to find these situations - in the mplayer case, for example, it falls back
to the host compiler and that could have given a successful build. It's just
because also -marm is passed that we get a build failure.

 Does anyone have better ideas?

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
