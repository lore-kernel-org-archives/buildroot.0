From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:38:51 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: needs __register_atfork
In-Reply-To: <20181128170510.5565-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 28 Nov 2018 18:05:10 +0100")
References: <20181128170510.5565-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvjz62lg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The following error is raised by minizip:
 > [100%] Linking C executable minizip
 > /home/peko/autobuild/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libbsd.a(arc4random.o):
 > In function `_rs_init.part.1':
 > arc4random.c:(.text+0xaa): undefined reference to `__register_atfork'
 > collect2: error: ld returned 1 exit status

 > As specified in openssl/Config.in, uClibc on noMMU doesn't provide
 > __register_atfork()

I guess that is inherent to nommu as there is no fork() to get notified
about.


 > so add a dependency on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 > on libbsd and minizip

Ok, fine by me. If someone wants to use any of these on nommu then
fixing libbsd to simply drop this call for those cases looks fairly
simple.

Committed, thanks.

-- 
Bye, Peter Korsgaard
