From: M ZV <giometriq@gmail.com>
Date: Thu, 10 May 2018 20:32:10 +0430
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180509202254.GA9837@scaer>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
 <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
 <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
 <1fdbacbd-e80f-8735-89c8-2ca92224ee9a@mind.be> <20180509202254.GA9837@scaer>
Message-ID: <CAF7Xa=1p1KcbY8zUfmU+8bStTeUBo3c3buooD-cHmWFpOKj+xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Arnout, Yann, All,

I just noticed there are actually two places host-mkpasswd is being used:
root account (skeleton-init-common.mk) and users table. I think,
if we're going to replace mkpasswd with a script, this all should go through
one single point somehow (something like support/scripts/crypt_wrapper).

On Thu, May 10, 2018 at 12:52 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> I don't like that we reinvent such tools... Especially when dealing with
> security-related tools...
>
>>       dd if=/dev/urandom bs=1 count=12 | python -c "
>
> This is not optimal. Better to do a single read instead of 12: bs=12
> count=1
>
>>                       import sys, crypt, base64
>>                       salt = sys.stdin.read()
>
> Why such convoluted code to read 12 bytes of random data? Why not use
> Python's builtins for that?
>
>     https://docs.python.org/3/library/secrets.html
>
>     import secrets
>     blob = secrets.token_bytes(12)
>

I actually like Arnout way of using /dev/urandom. The more we make use of
system resources (and less responsibility for python) the better.

>
> Sorry, I am not too convinced that writing our own tool is good...
>
> Regards,
> Yann E. MORIN.

To be honest, like all of you, I'm also very uncomfortable replacing
mkpasswd with
a python solution. There're three reasons that made me convinced this
is the right thing to do.

First, it's cryptographically sound. We're not going to roll our own
hash algorithm.
It?s simply making a LIBC crypt(3) function call. Like mkpasswd, this is just a
system/libc call wrapper.

Second, host-mkpasswd (which is carved out of another package to be a
lightweight
buildroot?s own bundle) apparently needs periodic attention (as can be
seen in the
mailing list archive throughout the years). In my case it actually
built the shadow
with empty password for the root (SHA functions are ignored for musl)
without throwing
 any errors. I know these blatant failures are easily caught by the
developer before any kind
of release but they all reveal how rapidly this package is going
through bit-rot.

And finally, this (python or perl script) seems to be the only
cross-distribution solution
that actually works without adding hundreds of lines of code (or a
full-blown whois package)
to the build infrastructure with their own specific libc compatibility
patches and version bumps.
And it works on Alpine!

I personally settle for a code that is aesthetically wanting or
philosophically unschooled
if the alternative is to take more of the maintainers? attention and time.
An absolute rare commodity we can ill afford.

Thank you.
Mike Z. Vand
