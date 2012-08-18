From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Aug 2012 11:47:24 +0200
Subject: [Buildroot] external toolchain
In-Reply-To: <1345275222.2621.YahooMailNeo@web164603.mail.gq1.yahoo.com>
References: <1345275222.2621.YahooMailNeo@web164603.mail.gq1.yahoo.com>
Message-ID: <201208181147.24495.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoran, All,

On Saturday 18 August 2012 09:33:42 Zoran Djordjevic wrote:
> Thank you Yann for revealing me the matter about Crosstool- NG adjustment
> and related to glibc. I was not able to try (but will do at monday), however,
> it raises another question to me. Having in mind that I built with  2.6.9 choice 
> - which is default (although I didn't know the fact)

No, 2.6.9 is *not* the default. The default (at least for crosstool-NG) is
to use the same version as is used by the kernel headers. Thus, if you used
kernel headers greater than 2.6.32 (say, 2.6.39), then the oldest kernel
supported at runtime by the C library will be 2.6.39.

If you want to support an older kernel than the one used for the kernel
headers, then you have to tell glibc about that fact.

> and that my exact kernel
> version is 2.6.32.2 (that is on target board) then how it comes the error
> "kernel too old" (because target kernel is newer one) ?  

Basically, that's how it works:
  - C library needs the kernel headers to know the kernel ABI/API.
  - thus, C library can make use of /advanced/ native kernel features, or
    emulate them
  - C library also needs to know what oldest kernel will be used at runtime,
    to provision (if possible) for missing features in older kernels.

For example, let's take AIO (Asynchronous Input/Output):
    kernel headers              : 3.5
    first kernel with native AIO: 2.6.37 [*]
    kernel on target            : 2.6.32

In this case, *by default*, the C library (glibc) will:
  - know that AIO are native in the headers, because it knows that AIO were
    introduced in 2.6.37, and that the headers are 3.5
  - so it will directly use native AIO
  - and will not emulate them

But if you tell glibc that it is expected to run on a kernel as old as 2.6.32,
then it will know that:
  - it can use native AIO by default (3.5 has AIO)
  - it should also provision emulated AIO in case they are missing at runtime

So you have three options when you build your toolchain:
  - use the kernel headers from the oldest kernel you'll be using on the
    target
  - use older kernel headers (not recommended)
  - use newer (or the newest) kernel headers, and specify the oldest kernel
    you'll be using.

Of course, if you'll only be using only one version on your target, and will
never, ever upgrade your kernel, option 1 is the best option. But, if you are
supposed/able to boot different kernel versions, then option 3 is the best,
because you can use native kernel features if they are present, and fallback
to emulation if they are missing. Option 2 is rarely an option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
