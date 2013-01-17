From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 20:47:45 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <201301171844.27209.yann.morin.1998@free.fr>
References: <50F6A26D.4030607@petroprogram.com>
 <20130117093159.2d46ecfd@skate> <50F8019C.4000003@petroprogram.com>
 <201301171844.27209.yann.morin.1998@free.fr>
Message-ID: <50F84751.8090102@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann

17.1.2013 19:44, Yann E. MORIN kirjoitti:
> Stefan, All,
>
> On Thursday 17 January 2013 Stefan Fr?berg wrote:
>> 17.1.2013 10:31, Thomas Petazzoni kirjoitti:
>>> Whenever you start having X.org on a system and a window manager, most
>>> likely you have hundreds of megabytes of flash, and therefore, the size
>>> difference between uClibc and glibc (probably somewhere between 1 and
>>> 1.5 MB) isn't that much of a problem anymore.
>> Eh... I think it's more than 1 - 1.5 MB :-)
> The full set of libraries from a full-blown eglibc, for an ARM gnueabihf
> target, is:
>                       Unstripped    Stripped
> Only eglibc libs      3.6MiB         2.3MiB
> With gcc's libs       8.8MiB         3.0MiB
>
> And for a relatively complete uClibc for x86_64 target:
>                       Unstripped    Stripped
> Only eglibc libs      2.0MiB         1.0MiB
> With gcc's libs       6.9MiB         1.9MiB
>
> (gcc libs: libstdc++ and libgcc_s)
> (These are not the same architecture, but I went for the toolchains I have
> locally)
>
> So, typically, speaking only about the C library libs, the gain would be
> around ~1.5MiB.

Here's the contents of my target /lib

*yhteens? 1,4M*
drwxr-xr-x.  6 root root 3,0K 17.1. 15:32 .
drwxr-xr-x. 20 root root 1,0K 13.1. 17:35 ..
drwxr-xr-x. 64 root root  10K 17.1. 15:31 firmware
-rwxr-xr-x.  1 root root  29K 17.1. 15:32 ld-uClibc-0.9.33.2.so
lrwxrwxrwx.  1 root root   21  7.1. 00:27 ld-uClibc.so.0 ->
ld-uClibc-0.9.33.2.so
lrwxrwxrwx.  1 root root   17  8.1. 20:20 libblkid.so.1 -> libblkid.so.1.1.0
-rwxr-xr-x.  1 root root 152K 17.1. 15:31 libblkid.so.1.1.0
-rwxr-xr-x.  1 root root  25K 17.1. 15:32 libcrypt-0.9.33.2.so
lrwxrwxrwx.  1 root root   20  7.1. 00:27 libcrypt.so.0 ->
libcrypt-0.9.33.2.so
lrwxrwxrwx.  1 root root   21  7.1. 00:27 libc.so.0 -> libuClibc-0.9.33.2.so
-rwxr-xr-x.  1 root root  13K 17.1. 15:32 libdl-0.9.33.2.so
lrwxrwxrwx.  1 root root   17  7.1. 00:27 libdl.so.0 -> libdl-0.9.33.2.so
lrwxrwxrwx.  1 root root   13  7.1. 00:44 libgcc_s.so -> libgcc_s.so.1
-rw-r--r--.  1 root root  89K 17.1. 15:32 libgcc_s.so.1
-rwxr-xr-x.  1 root root  49K 17.1. 15:31 libm-0.9.33.2.so
lrwxrwxrwx.  1 root root   17  8.1. 20:20 libmount.so.1 -> libmount.so.1.1.0
-rwxr-xr-x.  1 root root 152K 17.1. 15:31 libmount.so.1.1.0
lrwxrwxrwx.  1 root root   16  7.1. 00:27 libm.so.0 -> libm-0.9.33.2.so
-rwxr-xr-x.  1 root root 4,5K 17.1. 15:32 libnsl-0.9.33.2.so
lrwxrwxrwx.  1 root root   18  7.1. 00:27 libnsl.so.0 -> libnsl-0.9.33.2.so
lrwxrwxrwx.  1 root root   17  7.1. 20:47 libpamc.so -> libpamc.so.0.82.1
lrwxrwxrwx.  1 root root   17  7.1. 20:47 libpamc.so.0 -> libpamc.so.0.82.1
-rwxr-xr-x.  1 root root 9,6K 17.1. 15:32 libpamc.so.0.82.1
lrwxrwxrwx.  1 root root   21  7.1. 20:47 libpam_misc.so ->
libpam_misc.so.0.82.0
lrwxrwxrwx.  1 root root   21  7.1. 20:47 libpam_misc.so.0 ->
libpam_misc.so.0.82.0
-rwxr-xr-x.  1 root root 8,1K 17.1. 15:32 libpam_misc.so.0.82.0
lrwxrwxrwx.  1 root root   16  7.1. 20:47 libpam.so -> libpam.so.0.83.1
lrwxrwxrwx.  1 root root   16  7.1. 20:47 libpam.so.0 -> libpam.so.0.83.1
-rwxr-xr-x.  1 root root  45K 17.1. 15:31 libpam.so.0.83.1
-rwxr-xr-x.  1 root root  74K 17.1. 15:31 libpthread-0.9.33.2.so
lrwxrwxrwx.  1 root root   22  7.1. 00:27 libpthread.so.0 ->
libpthread-0.9.33.2.so
-rwxr-xr-x.  1 root root 4,5K 17.1. 15:32 libresolv-0.9.33.2.so
lrwxrwxrwx.  1 root root   21  7.1. 00:27 libresolv.so.0 ->
libresolv-0.9.33.2.so
-rwxr-xr-x.  1 root root  13K 17.1. 15:31 librt-0.9.33.2.so
lrwxrwxrwx.  1 root root   17  7.1. 00:27 librt.so.0 -> librt-0.9.33.2.so
-rwxr-xr-x.  1 root root 690K 17.1. 15:31 libuClibc-0.9.33.2.so
-rwxr-xr-x.  1 root root 4,7K 17.1. 15:31 libutil-0.9.33.2.so
lrwxrwxrwx.  1 root root   19  7.1. 00:27 libutil.so.0 ->
libutil-0.9.33.2.so
lrwxrwxrwx.  1 root root   16  8.1. 20:20 libuuid.so.1 -> libuuid.so.1.3.0
-rwxr-xr-x.  1 root root  14K 17.1. 15:31 libuuid.so.1.3.0
drwxr-xr-x.  3 root root 1,0K  9.1. 04:01 modules
drwxr-xr-x.  3 root root 5,0K 17.1. 15:31 security
drwxr-xr-x.  3 root root 1,0K  8.1. 22:41 udev

As you can see from the top of the line the total sum of uClibc + *all
the other stuff (pam etc..)* is just
1.4 MB (the size of libuClibc-0.9.33.2.so itself is just 690 KB)

So uClibc wins this round :-)

> How large is your Xorg stack?
> Then, compare that 1.5MiB to the size of your Xorg stack. What's the ratio?
You mean how much Xorg stuff from buildroot I have installed into my
target system???
Short answer: Full
Well, almost, left only xterm (replaced with rxvt-unicode which
lighter), twm (replaced with fluxbox)
and xeyes (totally useless application) out.

> If you're 1.5MiB short of space, then probably Xorg is not the solution for
> your platform.
>
> Of course, switching to uClibc as a learning experience is very
> intreresting. But no more. ;-)
>
> Regards,
> Yann E. MORIN.

BTW, I forgot to mention in my message to Thomas that that 520 MB
uncompressed Live-CD stuff does
also contain the full linux 3.3.1 kernel and *all* the drivers compiled
as modules
(Live-CD without that would be useless when running it in myriad x86
machines with allkinds of hardware)

Regards
Stefan
