From: Stefan Becker <chemobejk@gmail.com>
Date: Wed, 02 May 2018 18:23:50 +0000
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180502175722.GA31449@scaer>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180502175722.GA31449@scaer>
Message-ID: <CAOJ2eMf-+1JfvVcwKKFX1BPj36gbSV+Vc58ShJj61UzrGCe16Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Wed, May 2, 2018 at 8:57 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

>
> But what if the libxcrypt package is not installed? Since crypt is only
> optional in POSIX, there is no guarantee that libxcrypt is even present
> on a system, especially now that glibc has decided to no longer provide
> it by default, and given that even --enable-obsolete-crypt does not even
> declare _XOPEN_CRYPT...
>

If crypt() is provided by libxcrypt instead of glibc, then this should be
automatically handled by package dependencies, i.e.

$ rpm -q --provides libxcrypt
...
libcrypt.so.1()(64bit)
libcrypt.so.1(GLIBC_2.2.5)(64bit)
libcrypt.so.1(OW_CRYPT_1.0)(64bit)
libcrypt.so.1(XCRYPT_2.0)(64bit)
$ rpm -q --whatrequires 'libcrypt.so.1()(64bit)' | wc -l
57
$ rpm -q --whatrequires 'libcrypt.so.1(XCRYPT_2.0)(64bit)' | wc -l
26

The first one ensures that pre-F28 binaries still continue to work on
Fedora 28. The latter ones have obviously been rebuilt against libxcrypt.so
already.

As for the development stuff:

$ rpm -ql libxcrypt-devel
/lib64/libcrypt.so
/usr/include/crypt.h
...
$ rpm -q --provides libxcrypt-devel
libxcrypt-devel = 4.0.0-5.fc28
libxcrypt-devel(x86-64) = 4.0.0-5.fc28
pkgconfig(libxcrypt) = 4.0.0
$ rpm -q --whatrequires 'libxcrypt-devel(x86-64)'
glibc-devel-2.27-8.fc28.x86_64

So at least on Fedora 28 this is handled in a backward compatible way, i.e.
if I want to compile against glibc I also get libxcrypt-devel and therefore
crypt.h.

In short: I updated 2 systems from F27 to F28 and automatically have
libxcrypt and libxcrypt-devel available after the update. On the remaining
F27 system I can see that libxcrypt isn't available at all, i.e. it is a
new F28 feature.

Just my ?0.02, Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180502/6b8ecc97/attachment.html>
