From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 11:49:23 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
 <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
Message-ID: <20151104114923.67eb85d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro Gamez,

On Wed, 4 Nov 2015 11:18:32 +0100, Alvaro Gamez wrote:

> Somehow sqrt(x) is failing? Here is this function dissasembled by gdb:
> Dump of assembler code for function math_sqrt:
>    0x00003fff8f80c690 <+0>:    mflr    r0
>    0x00003fff8f80c694 <+4>:    stfd    f30,-16(r1)
>    0x00003fff8f80c698 <+8>:    stfd    f31,-8(r1)
>    0x00003fff8f80c69c <+12>:    mr      r3,r4
>    0x00003fff8f80c6a0 <+16>:    std     r31,-24(r1)
>    0x00003fff8f80c6a4 <+20>:    std     r0,16(r1)
>    0x00003fff8f80c6a8 <+24>:    stdu    r1,-144(r1)
>    0x00003fff8f80c6ac <+28>:    bl      0x3fff8f806dac
> <00000017.plt_call.PyFloat_AsDouble>
>    0x00003fff8f80c6b0 <+32>:    ld      r2,40(r1)
>    0x00003fff8f80c6b4 <+36>:    addis   r9,r2,-2
>    0x00003fff8f80c6b8 <+40>:    lfs     f0,28480(r9)
>    0x00003fff8f80c6bc <+44>:    fmr     f30,f1
>    0x00003fff8f80c6c0 <+48>:    fcmpu   cr7,f1,f0
>    0x00003fff8f80c6c4 <+52>:    bne     cr7,0x3fff8f80c6dc <math_sqrt+76>
>    0x00003fff8f80c6c8 <+56>:    bl      0x3fff8f8070bc
> <00000017.plt_call.PyErr_Occurred>
>    0x00003fff8f80c6cc <+60>:    ld      r2,40(r1)
>    0x00003fff8f80c6d0 <+64>:    li      r9,0
>    0x00003fff8f80c6d4 <+68>:    cmpdi   cr7,r3,0
>    0x00003fff8f80c6d8 <+72>:    bne     cr7,0x3fff8f80c73c <math_sqrt+172>
> => 0x00003fff8f80c6dc <+76>:    fsqrt   f31,f30
> 
> 
> So, I've created the following test code:
> #include <stdio.h>
> #include <math.h>
> 
> int main(int argc, char *argv[])
> {
>     double d=4, sd;
>     sd = sqrt(d);
>     printf("%f\n", sd);
>     return 0;
> }
> 
> When compiled with NO optimizations, it receives SIGILL on:
> Dump of assembler code for function .sqrtl:
>    0x00003fffa154c690 <+0>:    addis   r9,r2,-6
>    0x00003fffa154c694 <+4>:    fmr     f2,f1
>    0x00003fffa154c698 <+8>:    lfd     f0,1240(r9)
>    0x00003fffa154c69c <+12>:    fcmpu   cr7,f1,f0
>    0x00003fffa154c6a0 <+16>:    blt     cr7,0x3fffa154c6b0 <.sqrtl+32>
> => 0x00003fffa154c6a4 <+20>:    fsqrt   f1,f2

Ok, so fsqrt is not available on this CPU core.

> When compiled with -O1, it doesn't receive SIGILL and correctly prints 2 as
> sqrt(4).
> The difference seems to be that without optimization, sqrt results in:
>         bl sqrt
> While when optimized, that call disappears.

Ah, yes. This is because gcc is smart and realizes that:

	double d = 4;
	sd = sqrt(d);

will always result to sd = 2, so at -O1, it optimizes that.

If you change your code to:

double foo(double a)
{
	return sqrt(a);
}

int main(void)
{
	printf("%f\n", foo(4));
}

then it should not be optimized, even at -O1. Or maybe it will be
optimized if foo() is in the same file as main() if gcc automatically
inlines the function. But if you put foo() in a separate C file, built
into its own object file, it for sure will not optimize (unless you
enable LTO).

> After all this, it definitely seems to be that fsqrt instruction is the one
> at fault here.
> By doing a simple google search for "e6500 fsqrt" I've come across several
> posts that seem to indicate that e6500's FPU does not in fact support fsqrt
> instruction. For example, this:
> http://lists.openembedded.org/pipermail/openembedded-core/2012-September/069345.html
> 
> I'm gonna be trying this again once the whole compilation finishes with
> glibc-2.22, just in case it's been solved there. If not, I don't know if a
> patch in the fashion of that in the mailing list above should be provided
> for buildroot's glibc package or if it should be sent to glibc mailing
> list, or possibly both.

I believe this problem might be fixed by glibc commit
08cee2a464f614a6d4275b5af6c52481f1aa16e6, which has been merged since
glibc 2.21. Which glibc version have you been using so far ?

See
https://sourceware.org/git/?p=glibc.git;a=commit;h=08cee2a464f614a6d4275b5af6c52481f1aa16e6
and https://sourceware.org/bugzilla/show_bug.cgi?id=16576.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
