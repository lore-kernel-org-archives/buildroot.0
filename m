From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 4 Nov 2015 11:18:32 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <20151103151730.1e9dcc3c@free-electrons.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
Message-ID: <CAM+bi4sGFXwL3AqiqmVoxQtOXXVyHH32sVEfpKp+-0PO32afpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

2015-11-03 15:17 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Can you rebuild with BR2_ENABLE_DEBUG=y, then run "ulimit -c unlimited"
> on your target, run the crashing Python stuff, grab back the "core"
> file on your host machine, and 1 /look at the backtrace and 2/ at the
> specific instruction that caused the crash ?
>

I've executed gdb python core inside the platform itself, so down below I'm
including the excerpts from the files mentioned in the backtrace:

#0  math_1 (can_overflow=0, func=<optimized out>, arg=<optimized out>)
    at /tmp/test/output/build/python-2.7.10/Modules/mathmodule.c:691
#1  math_sqrt (self=<optimized out>, args=<optimized out>)
    at /tmp/test/output/build/python-2.7.10/Modules/mathmodule.c:859
#2  0x00003fffabb4df3c in .PyEval_EvalFrameEx () from
/usr/lib64/libpython2.7.so.1.0
#3  0x00003fffabb4fe30 in .PyEval_EvalCodeEx () from
/usr/lib64/libpython2.7.so.1.0
#4  0x00003fffabb4ff4c in .PyEval_EvalCode () from
/usr/lib64/libpython2.7.so.1.0
... etc


As per #0:

build/python-2.7.10/Modules/mathmodule.c:691
static PyObject *
math_1(PyObject *arg, double (*func) (double), int can_overflow)
{
    double x, r;
    x = PyFloat_AsDouble(arg);
    if (x == -1.0 && PyErr_Occurred())
        return NULL;
    errno = 0;
    PyFPE_START_PROTECT("in math_1", return 0);
    r = (*func)(x);
    PyFPE_END_PROTECT(r);

The call to (*func) is the one raising the Illegal instruction:

And as per #1, the calling of this is:
/tmp/test/output/build/python-2.7.10/Modules/mathmodule.c:859
FUNC1(sqrt, sqrt, 0,
      "sqrt(x)\n\nReturn the square root of x.")

Somehow sqrt(x) is failing? Here is this function dissasembled by gdb:
Dump of assembler code for function math_sqrt:
   0x00003fff8f80c690 <+0>:    mflr    r0
   0x00003fff8f80c694 <+4>:    stfd    f30,-16(r1)
   0x00003fff8f80c698 <+8>:    stfd    f31,-8(r1)
   0x00003fff8f80c69c <+12>:    mr      r3,r4
   0x00003fff8f80c6a0 <+16>:    std     r31,-24(r1)
   0x00003fff8f80c6a4 <+20>:    std     r0,16(r1)
   0x00003fff8f80c6a8 <+24>:    stdu    r1,-144(r1)
   0x00003fff8f80c6ac <+28>:    bl      0x3fff8f806dac
<00000017.plt_call.PyFloat_AsDouble>
   0x00003fff8f80c6b0 <+32>:    ld      r2,40(r1)
   0x00003fff8f80c6b4 <+36>:    addis   r9,r2,-2
   0x00003fff8f80c6b8 <+40>:    lfs     f0,28480(r9)
   0x00003fff8f80c6bc <+44>:    fmr     f30,f1
   0x00003fff8f80c6c0 <+48>:    fcmpu   cr7,f1,f0
   0x00003fff8f80c6c4 <+52>:    bne     cr7,0x3fff8f80c6dc <math_sqrt+76>
   0x00003fff8f80c6c8 <+56>:    bl      0x3fff8f8070bc
<00000017.plt_call.PyErr_Occurred>
   0x00003fff8f80c6cc <+60>:    ld      r2,40(r1)
   0x00003fff8f80c6d0 <+64>:    li      r9,0
   0x00003fff8f80c6d4 <+68>:    cmpdi   cr7,r3,0
   0x00003fff8f80c6d8 <+72>:    bne     cr7,0x3fff8f80c73c <math_sqrt+172>
=> 0x00003fff8f80c6dc <+76>:    fsqrt   f31,f30


So, I've created the following test code:
#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[])
{
    double d=4, sd;
    sd = sqrt(d);
    printf("%f\n", sd);
    return 0;
}

When compiled with NO optimizations, it receives SIGILL on:
Dump of assembler code for function .sqrtl:
   0x00003fffa154c690 <+0>:    addis   r9,r2,-6
   0x00003fffa154c694 <+4>:    fmr     f2,f1
   0x00003fffa154c698 <+8>:    lfd     f0,1240(r9)
   0x00003fffa154c69c <+12>:    fcmpu   cr7,f1,f0
   0x00003fffa154c6a0 <+16>:    blt     cr7,0x3fffa154c6b0 <.sqrtl+32>
=> 0x00003fffa154c6a4 <+20>:    fsqrt   f1,f2

When compiled with -O1, it doesn't receive SIGILL and correctly prints 2 as
sqrt(4).
The difference seems to be that without optimization, sqrt results in:
        bl sqrt
While when optimized, that call disappears.

After all this, it definitely seems to be that fsqrt instruction is the one
at fault here.
By doing a simple google search for "e6500 fsqrt" I've come across several
posts that seem to indicate that e6500's FPU does not in fact support fsqrt
instruction. For example, this:
http://lists.openembedded.org/pipermail/openembedded-core/2012-September/069345.html

I'm gonna be trying this again once the whole compilation finishes with
glibc-2.22, just in case it's been solved there. If not, I don't know if a
patch in the fashion of that in the mailing list above should be provided
for buildroot's glibc package or if it should be sent to glibc mailing
list, or possibly both.

Please, let me know if there's anything else I can test or how to provide
more information on this.

Best regards,

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/4ffd45f6/attachment.html>
