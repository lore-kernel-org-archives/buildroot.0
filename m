From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Apr 2012 22:06:32 +0200
Subject: [Buildroot] Problems when compiling gnutls and gst-plugins-base
	on arm (panda)
In-Reply-To: <CAC2kKA9r0gZuP56HwuF_U0ZGyJP9hBBytcY8v5ruhp1jQsqL+A@mail.gmail.com>
 (Shawn Ferris's message of "Sat, 7 Apr 2012 10:38:37 -0600")
References: <CAC2kKA9r0gZuP56HwuF_U0ZGyJP9hBBytcY8v5ruhp1jQsqL+A@mail.gmail.com>
Message-ID: <87ty0vtign.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shawn" == Shawn Ferris <shawn.ferris@gmail.com> writes:

 Shawn> Hey Guys
 Shawn> I've checked out '2012.02-268-g5ee4614' of buildroot and I'm having
 Shawn> two issues. I've included NetworkManager which requires gnutls. gnutls
 Shawn> fails to find libgcrypt, but I see that it's built when looking in
 Shawn> output/build. I suspect that it's not finding the pkg-config stuff,
 Shawn> which I can probably hack around, but I excluded it for now to move
 Shawn> on. (just thought I'd mention it.. I'll do more investigation and
 Shawn> report back unless someone already knows the answer)

Strange, it works here.

 Shawn> My bigger issue is that I can't get gst-plugins-base to compile. I get
 Shawn> the errors:


 Shawn>   CC     libgstpbutils_0.10_la-pbutils-enumtypes.lo
 Shawn> {standard input}: Assembler messages:
 Shawn> {standard input}:1386: Error: immediate value out of range -- `movt ip,-32640'
 Shawn> {standard input}:1513: Error: immediate value out of range -- `movt ip,-32640'
 Shawn> make[6]: *** [libgstvideo_0.10_la-tmp-orc.lo] Error 1

Sounds like a compiler bug. What architecture / toolchain is this?

 Shawn> I've tried different toolchains and the linaro-2012.03 works fine, but
 Shawn> I have other issues when using that one to. (libgcc_s.so doesn't seem
 Shawn> to be copied to the build and systemd fails on boot) I've also tried
 Shawn> compiling with big endian and that works, but wont boot. (fails to
 Shawn> find init, even though it exists)

The linaro toolchain (and systemd) are very recent additions, so there
might indeed be some issues with it. I had a quick look, and our
external toolchain expects these libraries to reside inside the sysroot
(which on linaro is detected as arm-linux-gnueabi/libc), and libstdc++
is in the lib dir instead.

I'll have a closer look to see how we can fix it.

-- 
Bye, Peter Korsgaard
