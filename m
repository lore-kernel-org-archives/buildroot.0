From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 10:51:31 +0200
Subject: [Buildroot] [PATCH] uclibc: add simlinks from
 libdl/libm/libpthread/librt
In-Reply-To: <N9GXBQ.QY2GW6T2I42F3@crapouillou.net>
References: <20200613162001.154280-1-paul@crapouillou.net>
 <20200614150021.GU2346@scaer>
 <N9GXBQ.QY2GW6T2I42F3@crapouillou.net>
Message-ID: <20200621085131.GA2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2020-06-14 19:51 +0200, Paul Cercueil spake thusly:
> Le dim. 14 juin 2020 ? 17:00, Yann E. MORIN <yann.morin.1998@free.fr> a
> ?crit :
> >On 2020-06-13 18:20 +0200, Paul Cercueil spake thusly:
> >> All the symbols that were previously present in libdl.so.0, libm.so.0,
> >> libpthread.so.0 and librt.so.0 are now all packed within uClibc.
> >>
> >> In order to keep binary compatibility with old executables, which were
> >> dynamically linked with one of the libraries above, add symbolic links
> >> to the uClibc shared library.
> >This does not account for external toolchains.
[--SNIP--]
> >I wonder how good those symlinks are anyway: uClibc has no ABI/API
> >stability anyway, so there are no guarantee that a program linked
> >against a version of uClibc will work against another version, or even
> >the same version that was compiled with another configuration...

We've discussed this with the other maintainers, and we agree that "we do
not really care about binary-level compatibility, especially with uClibc
where it is anyway not guaranteed" (quoting the conclusion from Thomas)

The best bet for you is to remove those symlinks from your overlay, and
create them from a post-build script (where you can do the globbing you
need to find the current version string).

Or to create them as symlinks to libc.so.0 which we already create as a
sylink to the actual libuclibc-XXXX.so (but this is less flexible than a
post-build script).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
