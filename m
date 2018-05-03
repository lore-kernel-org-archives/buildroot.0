From: Stefan Becker <chemobejk@gmail.com>
Date: Thu, 03 May 2018 06:11:58 +0000
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <0756834a-6d03-8c29-4b5d-975b7ee7e425@mind.be>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180502175722.GA31449@scaer>
 <CAOJ2eMf-+1JfvVcwKKFX1BPj36gbSV+Vc58ShJj61UzrGCe16Q@mail.gmail.com>
 <0756834a-6d03-8c29-4b5d-975b7ee7e425@mind.be>
Message-ID: <CAOJ2eMeg6zxaVck0rv5BRkYn326WPnWbeo4LASAdMqOTHV==1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wed, May 2, 2018 at 11:38 PM Arnout Vandecappelle <arnout@mind.be> wrote:

> And in pre-F28 this header will be provided by glibc-devel, right?
>
> But so in practice we can assume that crypt.h is always present, so why not
> include it unconditionally?
>

crypt.h and -lcrypt seem to be ancient glibc artefacts. E.g. RedHat 7.x
glibc-2.2.5 (
http://rpm.pbone.net/index.php3/stat/4/idpl/38881780/dir/redhat_7.x/com/glibc-devel-2.2.5-44.i386.rpm.html
).

For the Fedora 28 change see also:

*
https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_with_libxcrypt
*
https://src.fedoraproject.org/rpms/glibc/c/2687b3c78b7b05ca9cc568e40464fb7909e9ec6d
* https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html

So at least on Linux & glibc the guidance

   #define _XOPEN_SOURCE

   #include <stdlib.h>
   #include <stdio.h>
   #include <unistd.h>

   #ifndef _XOPEN_CRYPT
   #include <crypt.h>
   #endif

   int main(int argc, char **argv)
   {
     (void)argc;
     (void)argv;
     printf("%s\n", crypt("passwd", "salt"));
     return(0);
  }

should be always correct.

Fedora 28 (glibc 2.27 + libcrypt deprecation patch):

$ gcc -Wall -Wextra -Werror -dD -E dummy.c | fgrep -e _CRYPT -e crypt.h -e
'*crypt '
    _SC_XOPEN_CRYPT,
#define _SC_XOPEN_CRYPT _SC_XOPEN_CRYPT
# 1 "/usr/include/crypt.h" 1 3 4
# 20 "/usr/include/crypt.h" 3 4
#define _CRYPT_H 1
# 63 "/usr/include/crypt.h" 3 4
extern char *crypt (const char *__phrase, const char *__setting)
...

Fedora 27  (glibc 2.26):

$ gcc -Wall -Wextra -Werror -dD -E dummy.c | fgrep -e _CRYPT -e crypt.h -e
'*crypt '
#define _XOPEN_CRYPT 1
    _SC_XOPEN_CRYPT,
#define _SC_XOPEN_CRYPT _SC_XOPEN_CRYPT
extern char *crypt (const char *__key, const char *__salt)

Ubuntu 14.04 (glibc 2.19):

$ gcc -Wall -Wextra -Werror -dD -E dummy.c | fgrep -e _CRYPT -e crypt.h -e
'*crypt '
#define _XOPEN_CRYPT 1
    _SC_XOPEN_CRYPT,
#define _SC_XOPEN_CRYPT _SC_XOPEN_CRYPT
extern char *crypt (const char *__key, const char *__salt)

Buildroot target @master (glibc 2.27):

$ output/host/bin/arm-buildroot-linux-gnueabihf-gcc -Wall -Wextra -Werror
-dD -E dummy.c | fgrep -e _CRYPT -e crypt.h -e '*crypt '
#undef __ARM_FEATURE_CRYPTO
#define _XOPEN_CRYPT 1
    _SC_XOPEN_CRYPT,
#define _SC_XOPEN_CRYPT _SC_XOPEN_CRYPT
extern char *crypt (const char *__key, const char *__salt)

Regards, Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180503/a8c28eb0/attachment.html>
