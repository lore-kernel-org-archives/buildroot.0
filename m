From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 May 2014 14:11:33 -0300
Subject: [Buildroot] openssl and cryptodev engine
In-Reply-To: <CAOMv6XyrqkUSw1ya+fSfrk=vUYREapTBcZwhuEJ1fjff0WCSBA@mail.gmail.com>
References: <CAOMv6XyrqkUSw1ya+fSfrk=vUYREapTBcZwhuEJ1fjff0WCSBA@mail.gmail.com>
Message-ID: <5388BBC5.6050709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/30/2014 11:13 AM, Xh Xiao wrote:

> I selected openssl and cryptodev-linux at menuconfig
> 
> after a successful built, I noticed the key file to build
> cryptodev-linux which is shared between cryptodev-linux and openssl is
> different, the file name is enc_cryptodev.c, they really should be
> identical I think.
> 
> plus, enc_cryptodev is not built to a library, i.e. libcryptodev.so,
> without that the crytodev engine can't be really used by openssl.
> 
> xxiao

libcryptodev.so? Why? It's builtin into openssl, you don't even need the
extra engines option, it's taken care of when building openssl with
cryptodev support in buildroot.

You only need a couple of things done for this to work in a seamless way:

1) Have some hardware crypto driver builtin or module loaded for the kernel.
2) Load the cryptodev kernel module.

That's it.

Now for the gory details of how it works just fine:

# openssl speed -evp aes256 -elapsed -multi 4

Gives me 11976.21k, 13457.76k, 13919.93k, 14035.04k and 14090.24k for a
test run _WITHOUT_ cryptodev being loaded, for block sizes 16, 64, 256,
1024 and 8192.
-evp is to make openssl use the engines (even builtin).
-elapsed is to measure elapsed time instead of cpu time, otherwise with
hardware acceleration in place you'll get pretty fake numbers.
-multi is to throw N (4) concurrent jobs for the benchmark, some
hardware accelerators have multiple execution units and you'll see
greater benefit if you load them all.
Ballpark numbers without cryptodev for the different block sizes are
usually the same since it's all cpu work with low overhead since there's
no hardware acceleration to set up.

After loading cryptodev i get 1253.61k, 5011.29k, 20502.87k, 79707.48k
and 219848.91k.
You now see a lot or variation on different block sizes, that's because
of hardware acceleration engine setup times which have a bad penalty for
small block sizes.
For architectures where acceleration is part of the ISA that's normally
not the case - just for SOCs where crypto acceleration is a different
entity.
For those who ask what's the benefit, well, almost 0% cpu load for those
SOCs where acceleration is not part of the ISA, you get the crypto for
free and the cpu can do other things.

If you don't see any benefit that's maybe because the SOC you are using
doesn't support the cipher suite you need for your application, take a
look at /proc/crypto.

Regards.
