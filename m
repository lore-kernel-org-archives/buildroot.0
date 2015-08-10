From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Aug 2015 13:52:25 +0000 (UTC)
Subject: [Buildroot] [Bug 8271] Buildroot wit x86_64 architecture fails to
 boot on qemu with kernels >=3.10
In-Reply-To: <bug-8271-163@https.bugs.busybox.net/>
References: <bug-8271-163@https.bugs.busybox.net/>
Message-ID: <20150810135225.F2A4A80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8271

--- Comment #2 from Gleb Pomykalov <gleb@pomykalov.ru> 2015-08-10 13:52:25 UTC ---
I have tried more different kernel version, and came to conclusion, that the
first kernel version, where this issue appeared was 3.9. 
I have done bisection of linux kernel. Here is the linux kernel commit that
breaks things:

commit 83a57a4de1a222c351667ef9a0fedaac1295e85b
Author: David Woodhouse <dwmw2@infradead.org>
Date:   Thu Dec 20 01:16:20 2012 +0000

    x86: Enable ARCH_USE_BUILTIN_BSWAP

    With -mmovbe enabled (implicit with -march=atom), this allows the
    compiler to use the movbe instruction. This doesn't have a significant
    effect on code size (unlike on PowerPC), because the movbe instruction
    actually takes as many bytes to encode as a simple mov and a bswap. But
    for Atom in particular I believe it should give a performance win over
    the mov+bswap alternative. That was kind of why movbe was invented in
    the first place, after all...

    I've done basic functionality testing with IPv6 and Legacy IP, but no
    performance testing. The EFI firmware on my test box unfortunately no
    longer starts up.

    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
    Link:
http://lkml.kernel.org/r/1355966180.18919.102.camel at shinybook.infradead.org
    Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 79795af..3e941aa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -114,6 +114,7 @@ config X86
        select MODULES_USE_ELF_RELA if X86_64
        select CLONE_BACKWARDS if X86_32
        select GENERIC_SIGALTSTACK
+       select ARCH_USE_BUILTIN_BSWAP

 config INSTRUCTION_DECODER
        def_bool y

Revert this commit on later versions of kernel fix it. It seems, that this
commit enables some functionality for atom processors, which was selected as
arch variant in my case. 

Using your recommendations with "make qemu_x86_64_defconfig" command works as
well. It seems that the reason is in atom arch variant.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
