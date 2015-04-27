From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 27 Apr 2015 10:10:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccache: add wrapper for
	internal toolchain
In-Reply-To: <CABbD_XAvt57EFAVEeUghPG1HtpHOyxw1naYcq+PorTU5KO1qsw@mail.gmail.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <1430040062-46308-2-git-send-email-kaszak@gmail.com>
 <20150426113742.182fa26b@free-electrons.com>
 <CABbD_XCocg8xyZHE5rxAA3FUH5p2eGaFiKdaJhoaXhdFVingug@mail.gmail.com>
 <20150426142444.51f5b4d6@free-electrons.com>
 <CABbD_XAvt57EFAVEeUghPG1HtpHOyxw1naYcq+PorTU5KO1qsw@mail.gmail.com>
Message-ID: <CABbD_XC=A1FM31F5U+vvsPi+ZtwaRLreyDeqgALXbcsqbDgxMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, all,


>
>> Indeed. But maybe the existing external toolchain wrapper can be used.
>> We probably don't want to have a shell wrapper call a C wrapper
>> calling the compiler.
>>
>
> I'll look into it!
>
>
Some overview as I understand:

By default ccache works by doing a hash on the compiler, it's arguments,
and the source file to choose a previously cached result instead of
compiling it. If no fitting hash found, it just falls back compiling (and
storing the result in cache).

In Buildroot, we can use 3+1 different compilers:

- The host compiler (mostly /usr/bin/gcc or whatever) - this changes only
if the host is updated, the default ccache checking method (mtime) can
efficiently used with it. No deep changes needed to make this work, only
applies for host-* packages. If we decide to use a ccache wrapper script
(see below), than this can be called from it. If we want to skip the
wrapper script here, then all occurrences of the $(CCACHE) variable
everywhere in BR needs to reviewed/modified, as $(CCACHE) $(HOSTCC) and
$(CCACHE) $(TARGET_CC) will have to be separated.

- The external toolchain target compiler - this is the same in terms of
binary, but the problem as ThomasP. pointed out, that it is called by a
wrapper that is recompiled every time, thus invalidating the cache if mtime
is used on it. Ccache can only hash it's first argument ($1) with mtime, so
the solution is to turn off this kind of hashing (compiler_check=none) and
use another file (extra_files) as the source of the hash. This file can be
an extract of the BR .config file, which only contains compiler/toolchain
related settings, thus recompiling different packages won't invalidate the
compiler's identity.
After roughly understanding the ext-toolchain-wrapper, I think there are
two paths to follow:
  1) Use a wrapper script to call ccache, which will call the wrapper
binary for the compiler. In this script, extrafiles can be set up as an
environment variable. This is far more easier, requires a lot less
modifications, but should (may) be a bit slower, as we have to call a shell
script before every compiler invocation. If we want a universal solution
for internal and external toolchains, this can be used.
  2) Modify BR to let the wrapper binary decide whether to use ccache
before calling the real compiler. This requires tampering with the
TARGET_CC and TARGET_CC_NOCCACHE variables in BR at least and modifying the
source code of ext-toolchain-wrapper, but should be a bit more faster, as
it won't call an additional shell script every time gcc/g++ is invoked.
This won't be universal naturally.

- The internal toolchain - this is recompiled every time, so mtime is out
of question. The external toolchain solution is also valid here, using
method 1) - ccache wrapper script. I could think of no other viable
solutions.

+1 the internal toolchain gcc-initial stage, for which the simple internal
toolchain's extrafiles setting should work.

My questions are:
 - Did I miss something?
 - Anybody has other solutions for hashing the external toolchain?
 - If not, which should be implemented?
 - Do we want an universal solution (wrapper script) or independent
solutions for every case?

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150427/df1eb388/attachment.html>
