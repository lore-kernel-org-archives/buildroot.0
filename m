From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 13:51:41 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
In-Reply-To: <1455393768-26580-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455393768-26580-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160214135141.3b0cbd49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 13 Feb 2016 21:02:48 +0100, Bernd Kuhls wrote:

> --#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
> -+#if defined(__GLIBC__)
> -+# if __GLIBC_PREREQ(2,11)
> ++#ifndef __GLIBC_PREREQ
> ++# define __GLIBC_PREREQ(x,y) 0
> ++#endif
> ++
> + #if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)

I still don't understand why

#if defined(__GLIBC__)
#if __GLIBC_PREREQ(2, 11)
...
#endif
#endif

isn't the proposed solution. It looks so much cleaner and simpler than
defining __GLIBC_PREREQ to 0 when __GLIBC__ is not defined. And it is
actually the most correct solution I believe: only use __GLIBC_PREREQ
when __GLIBC__ is defined.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
