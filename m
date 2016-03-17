From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 13:14:27 +0100
Subject: [Buildroot] [PATCH 06/16] uclibc: NPTL thread implementation
	only available on MMU platforms
In-Reply-To: <1458164602-16983-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 16 Mar 2016 22:43:12 +0100")
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vb4l5mjg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As indicated by the uClibc-ng source code, the NPTL thread
 > implementation is only available on MMU platforms, so we replicate
 > this dependency in Buildroot so that the appropriate thread
 > implementation is chosen by default on ARM noMMU.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/uclibc/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
 > index 16bf89c..8be99f8 100644
 > --- a/package/uclibc/Config.in
 > +++ b/package/uclibc/Config.in
 > @@ -48,6 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 >  choice
 >  	prompt "Thread library implementation"
 >  	default BR2_PTHREADS_NATIVE
 > +	default BR2_PTHREADS_OLD if !BR2_USE_MMU
 >  	help
 >  	  Use this option to select the thread library implementation
 >  	  that should be used in your toolchain.
 > @@ -69,6 +70,7 @@ choice
 >  		bool "Native POSIX Threading (NPTL)"
 >  		select BR2_TOOLCHAIN_HAS_THREADS
 >  		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 > +		depends on BR2_USE_MMU
 >  		depends on !BR2_m68k && !BR2_x86_i386

Not related to this commit, but I think we should really remove m68k by
now - I marked it broken back in 2009 and nobody has cared to fix it:

commit 8161c45b891aca4c3184c320de81a44767c7cece
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Mon Jan 12 20:58:54 2009 +0000

    buildroot: mark ia64, m68k, nios2, sparc and sparc64 as broken
    
    No sense in showing the architecture options when they cannot even build
    the toolchain.

-- 
Bye, Peter Korsgaard
