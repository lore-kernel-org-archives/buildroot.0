From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:04:58 +0200
Subject: [Buildroot] [PATCH] pure-ftpd: disable PIE on ARC
In-Reply-To: <1436434731-2388-1-git-send-email-abrodkin@synopsys.com>
References: <1436434731-2388-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150709220458.643ac31c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu,  9 Jul 2015 12:38:51 +0300, Alexey Brodkin wrote:
> Even though ARC gcc understands "-pie" option and attempts to generate
> PIE binaries as of today PIE is not really supported for user-space
> applications.
> 
> So we disable PIE detection if building for ARC.
> That first fixes http://autobuild.buildroot.net/results/57a/57a6180809bc51f7206280533f0b9898ce4cfbb4
> and also prevents execution of non-supported PIE binary in runtime.
> 
> Interesting enough reported build failure is not directly related to PIE
> it looks like if PIE is enabled then successful detection of explicit_bzero()
> happens erroneously.
> 
> A simple test app that mentions explicit_bzero() while built with
> "-pie" gives this output:
> --------------------------------->8-----------------------------
> arc-linux-gcc test.c -pie
> /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../arc-snps-linux-uclibc/sysroot/usr/lib/crt1.o: warning: unresolvable relocation against symbol `__uClibc_main' from .text section
> /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
> /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
> /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/crtbegin.o: warning: unresolvable relocation against symbol `__register_frame_info@@GCC_3.0' from .text section
> --------------------------------->8-----------------------------

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
