From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:04:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/softether: Fix build error on
 ARC
In-Reply-To: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428004759-25894-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150403140451.3dba6a5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  2 Apr 2015 21:59:18 +0200, Bernd Kuhls wrote:

> +--- a/src/Mayaqua/Mayaqua.h.org	2015-04-02 21:52:44.911083674 +0200
> ++++ b/src/Mayaqua/Mayaqua.h	2015-04-02 21:51:52.075081069 +0200
> +@@ -235,9 +235,11 @@
> + #ifdef	OS_UNIX
> + #ifndef	UNIX_SOLARIS
> + #ifndef	CPU_SH4
> ++#ifndef	__arc__

This is not the correct fix. The fact that the toolchain used in the
build tests that failed does not have ifaddrs support is completely
unrelated to the fact that it's an ARC toolchain.

It's simply because this specific toolchain is an external toolchain
that doesn't have the ifaddrs support. The internal ARC toolchain will
have ifaddrs support, and other external toolchains may not have it.

So the right fix is to actually test whether ifaddrs support is
available or not. I've pushed a fix that implements this (hopefully
correctly) :

  http://git.buildroot.net/buildroot/commit/?id=d9cf0a76db5e428692f2489901c9787b1fd30eee

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
