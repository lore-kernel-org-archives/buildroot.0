From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Jul 2011 16:17:02 +0200
Subject: [Buildroot] [PATCH v2] libnss: Add new package.
In-Reply-To: <CAFbHwiTz-KPomDTeSsn_s2Ax+YrT=Mo3r_udBs1Aig=Hv1EYrg@mail.gmail.com>
 (Will Newton's message of "Fri, 8 Jul 2011 14:27:30 +0100")
References: <CAFbHwiTz-KPomDTeSsn_s2Ax+YrT=Mo3r_udBs1Aig=Hv1EYrg@mail.gmail.com>
Message-ID: <877h7syi01.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

Hi,

 Will> NSS is the Network Security Services library developed as part of
 Will> the Mozilla project. It provides similar functions to OpenSSL but
 Will> allows MPL, GPL and LGPL licensing.

 Will> +++ b/package/libnss/libnss-uclibc.patch
 Will> @@ -0,0 +1,19 @@
 Will> +
 Will> +uCLibc does not define RTLD_NOLOAD.
 Will> +
 Will> +Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> +
 Will> +--- nss-3.12.9.old/mozilla/security/nss/lib/freebl/stubs.c	2011-07-08
 Will> 13:32:54.964338355 +0100
 Will> ++++ nss-3.12.9/mozilla/security/nss/lib/freebl/stubs.c	2011-07-08
 Will> 13:33:57.255337490 +0100
 Will> +@@ -535,6 +535,11 @@
 Will> +     return SECSuccess;
 Will> + }
 Will> +
 Will> ++/* uClibc does not define RTLD_NOLOAD. */
 Will> ++#ifndef RTLD_NOLOAD
 Will> ++#define RTLD_NOLOAD 0
 Will> ++#endif

It's not completely true (but looks like a bug to me):

git grep RTLD_NOLOAD
libc/sysdeps/linux/common/bits/dlfcn.h:#define RTLD_NOLOAD      0x00004 /* Do no
libc/sysdeps/linux/mips/bits/dlfcn.h:#define RTLD_NOLOAD        0x00008 /* Do no

The common one is within #if 0 so that doesn't count, but for mips it
does. I suspect the best fix would actually be to fixup the mips header.

Thanks, I'll give it a bit of test and then commit.

-- 
Bye, Peter Korsgaard
