From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Dec 2013 12:22:28 +0100
Subject: [Buildroot] gets() undeclared???
In-Reply-To: <1729491.ttgRZG5klY@regdesktophome>
References: <1729491.ttgRZG5klY@regdesktophome>
Message-ID: <CAAXf6LU8YwQgOYqS4+5qQsrLqMM8Z-vB0vrNWP_J-Hk17ZQGaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ron,

On Sat, Dec 14, 2013 at 11:46 PM, Ron Eggler <reggler@semios.com> wrote:
> Hi,
>
>
>
> I'm trying to compile for a buildroot assembled package for an arm926t
> system (Atmel AT91SAM9G20)E10) for the e10 from synapse and what used to
> work once, now errors out like this:
>
>
>
> /usr/bin/gcc -std=gnu99 -I. -O2
> -I/usr/local/src/E10-buildroot/br1202-main/output/host/include
> -I/usr/local/src/E10-buildroot/br1202-main/output/host/usr/include -MT
> clean-temp.o -MD -MP -MF .deps/clean-temp.Tpo -c -o clean-temp.o
> clean-temp.c
>
> In file included from clean-temp.h:22:0,
>
> from clean-temp.c:23:
>
> ./stdio.h:477:1: error: 'gets' undeclared here (not in a function)
>
> _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
>
> ^
>
> mv -f .deps/c-ctype.Tpo .deps/c-ctype.Po
>
> mv -f .deps/c-stack.Tpo .deps/c-stack.Po
>
> make[4]: *** [clean-temp.o] Error 1
>
> make[4]: *** Waiting for unfinished jobs....
>
> mv -f .deps/gl_avltree_oset.Tpo .deps/gl_avltree_oset.Po
>
> make[4]: Leaving directory
> `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16/lib'
>
> make[3]: *** [all] Error 2
>
> make[3]: Leaving directory
> `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16/lib'
>
> make[2]: *** [all-recursive] Error 1
>
> make[2]: Leaving directory
> `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16'
>
> make[1]: *** [all] Error 2
>
> make[1]: Leaving directory
> `/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16'
>
> make: ***
> [/usr/local/src/E10-buildroot/br1202-main/output/build/host-m4-1.4.16/.stamp_built]
> Error 2
>
> root at regDesktopHome:/usr/local/src/E10-buildroot/br1202-main#
>
>
>
> I don't get it, why would gets be undeclared? How can I get this fixed
> please?

As the error says, gets() shouldn't be used. It has been deprecated a while now.
Since this error pops up when building a host package (host-m4), it
uses the host compiler. My guess is that you upgraded either the host
compiler or the C library to a more recent version, compared to before
when it used to work for you.

Have you tried using a more recent version of buildroot? I'd assume
that m4 has been fixed in the mean time to stop using gets().

If upgrading buildroot, nor backporting patches that fix this issue is
possible for you, you could try downgrading your host toolchain, or
create a separate older installation of it, pointing buildroot to that
instead of /usr/bin/gcc.

Best regards,
Thomas
